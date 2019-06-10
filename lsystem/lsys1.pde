// https://www.processing.org/discourse/beta/num_1271618936.html

Lsystem sporfern;

void setup() {
  size(800,800); 
  background(0);
  noLoop();
  
  sporfern = new Lsystem("fd",36);
  sporfern.addRule('d',"c+@.90fd");
  sporfern.addRule('c',"b");
  //comment
  sporfern.addRule('b',"[++++++++@.33fd][--------@.33fd]");
  sporfern.draw(100,600,0,100);
}


void draw() {
  background(0);
  sporfern.iterate(1);
  sporfern.draw(100,600,0,100);
}

void mousePressed() {
  redraw();
}
 
class pen {
  float x,y,dir,len,ang;
  pen prevState;
  
  pen(float xx,float yy,float ddir,float llen,float aang,pen pprevState) {
    x = xx;
    y = yy;
    dir=ddir;
    len=llen;
    ang=aang;
    prevState = pprevState;
  }
  
  void drawForward() {
    float x0 = x;
    float y0 = y;
    x = x + len*cos(3.141592*dir/180);
    y = y + len*sin(3.141592*dir/180);
    stroke(255);
    line(x0, y0, x, y);
  }
  
  void turnLeft() {
    dir = dir + 360/ang;
  }
  
  void turnRight() {
    dir = dir - 360/ang;
  }
  
  void resizeLength(float factor) {
    len *= factor;
  }
  
  void reverseAng() {
    ang = 0-ang;
  }
  
  void saveState() {
    pen ps;
    ps = new pen(x,y,dir,len,ang,prevState);
    prevState = ps;
  }
  
  void recallState() {
    pen ps = prevState;
    x = ps.x;
    y = ps.y;
    dir = ps.dir;
    len = ps.len;
    ang = ps.ang;
    prevState = ps.prevState;
    //delete(ps);
  }
}

class Lsystem {
  String Lstr;
  lsysRules rules;
  float ang;
  
  Lsystem(String rootStr,float aang) {
    Lstr = rootStr;
    ang = aang;
  }
  
  void addRule(char x,String y) {
    lsysRules p;
    p = new lsysRules(x,y);
    p.next = rules;
    rules = p;
  }
  
  void iterate(int n) {
    String Rstr = "";
    char l;
    boolean replaced;
    lsysRules rule;
    
    //Rstr = new String
    
    for(int i = 0;i < n;i++) {
      Rstr = "";
      for(int stri = 0;stri < Lstr.length();stri++) {
        l = Lstr.charAt(stri);
        rule = rules;
        replaced = false;
        while(rule!=null) {
          if(l==rule.x) {
            Rstr = Rstr.concat(rule.y);
            replaced = true;
          }
          rule = rule.next;
        }
        if(!replaced) {
          Rstr = Rstr.concat(String.valueOf(l));
        }
      }
      Lstr = Rstr;
      //println(Lstr);
    }
  }
  
  void draw(float x,float y,float dir,float len) {  
    pen drawPen;
    drawPen = new pen(x,y,dir,len,ang,null);

    for (int lstri=0; lstri<Lstr.length(); lstri++)  {
      char l = Lstr.charAt(lstri);

      switch (l) {
        case 'f':  // move forward
          drawPen.drawForward();
          break;
        case '+':  //turn right
          drawPen.turnRight();
          break;
        case '-':  //turn left
          drawPen.turnLeft();
          break;
        case '@':  //resise line length
          int numin = lstri+1;
          float lengthfactor;
          //Float lf;
          
          do {
            numin++;
            l = Lstr.charAt(numin);
            //println(l);
          } while(l=='.'|l=='0'|l=='1'|l=='2'|l=='3'|l=='4'|l=='5'|l=='6'|l=='7'|l=='8'|l=='9');
          //println(lstr.substring(lstri+1,numin));
          lengthfactor = Float.valueOf(Lstr.substring(lstri+1,numin)).floatValue();
          drawPen.resizeLength(lengthfactor);
          lstri=numin-1;
          break;
        case '[':  //push vars
          drawPen.saveState();
          break;
        case ']':  //pop vars
          drawPen.recallState();
          break;
        case '!':  //reverse l/r directions
          drawPen.reverseAng();
          break;
        default:  
          //println("?");
      }
    }
  }
}

class lsysRules {
  char x;
  String y;
  lsysRules next;
  
  lsysRules(char xx,String yy) {
    x = xx;
    y = yy;
    next = null;
  }
}
