float dy;
boolean flag;
int index_data;
boolean forward_flag; //flag
boolean back_flag;
boolean plus_flag; //flag
boolean minus_flag;
int round_dy=1000;
String command_mem = "+>++>-><>";
int[] data_mem ={ 10, 10, 10, 10, 10 };
int rectX=50;

int reload;
int reload1;

void setup() {   /// setup()
size(500,300); }

void draw() {
//frameRate(0.5);
frameRate(10);  
background(50); 
fill(100);
textSize(20);

rect(rectX,200,40,5);
for (int i = 0; i < 5; i += 1){
rectX=50+30*round(dy); }

// вывод
 for (int i = 0; i < 5; i += 1){
 text(data_mem[i],10+30*i,100);    
 
 }

// вывод
 for(int i=0;i<command_mem.length();i++){
  // fill(200,200,200);   
 text(command_mem.charAt(i),10+30*i,20);   }

// счетчик прорисовки
if (!flag) dy=dy+0.01;
if (flag) dy=dy-0.01; 
if(dy>=command_mem.length()-1) {flag=true;}
if(flag==true && dy<0) {flag=false;}
fill(200);
// прорисовка 
 text(command_mem.charAt(round(dy)),10+30*round(dy),20);
 text(data_mem[index_data],10+30*index_data,100); //контур

if (command_mem.charAt(round(dy))=='>') {
forward_flag=true; back_flag=false;plus_flag=false;minus_flag=false;}
if (command_mem.charAt(round(dy))=='<') {
forward_flag=false;back_flag=true;plus_flag=false;minus_flag=false;}
if (command_mem.charAt(round(dy))=='+') {
plus_flag=true; minus_flag=false;forward_flag=false;back_flag=false;}
if (command_mem.charAt(round(dy))=='-') {
plus_flag=false; minus_flag=true;forward_flag=false;back_flag=false;}
println("round        ",round(dy));
println("round_dy     ",round_dy);
println("forward_flag ",forward_flag);
println("back_flag    ",back_flag);
println("plus_flag    ",plus_flag);
println("minus_flag   ",minus_flag);
println("reload       ",reload);
println("reload1      ",reload1);
println("index_data   ",index_data);
println();
if (forward_flag && round(dy)!=round_dy){
 reload=1;
 round_dy=round(dy);
 }
 if (back_flag && round(dy)!=round_dy){
 reload=-1;
 round_dy=round(dy);
 }
index_data+=reload;
///  ///  ///
if (plus_flag && round(dy)!=round_dy){
 reload1=1;
 round_dy=round(dy);
 }
 if (minus_flag && round(dy)!=round_dy){
 reload1=-1;
 round_dy=round(dy);
 }
data_mem[index_data]+=reload1;
println("reload       ",reload);
println("reload1      ",reload1);
println("index_data   ",index_data);
println();
//if ((forward_flag || back_flag) && round(dy)==round_dy){reload=0;}
if (round(dy)==round_dy){reload=0; reload1=0;}
 println("reload       ",reload); 
 println("reload1      ",reload1);
 println("index_data   ",index_data);
 println("*************");
}
