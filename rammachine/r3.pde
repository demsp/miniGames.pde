float dy;
boolean flag;
int index_data;
boolean index_flag;

String command_mem = ">>><>";
int[] data_mem ={ 10, 10, 10, 10, 10 };
int rectX=50;

void setup() {   /// setup()
size(500,300); }

void draw() {
background(50);  
textSize(20);

rect(rectX,200,40,5);
for (int i = 0; i < 5; i += 1){
rectX=50+30*round(dy); }

// вывод
 for (int i = 0; i < 5; i += 1){
 text(data_mem[i],10+30*i,100);    }

// вывод
 for(int i=0;i<command_mem.length();i++){
  // fill(200,200,200);   
 text(command_mem.charAt(i),10+30*i,20);   }

// счетчик прорисовки
if (!flag) dy=dy+0.01;
if (flag) dy=dy-0.01; 
if(dy>=command_mem.length()-1) {flag=true;}
if(flag==true && dy<0) {flag=false;}

// прорисовка 
 text(command_mem.charAt(round(dy)),10+30*round(dy),20); 
//println("index1 ",round(dy)); 
//println("index2 ",index_data);
//if (command_mem.charAt(round(dy))=='>') {index_flag=true;}

}
