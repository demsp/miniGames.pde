float dy;
boolean flag;

//char[] trees = { 'a','b','c' };
String command_mem = ">>>.<<<abc+-=1^";
int[] data_mem ={ 50, 61, 83, 69, 71,50, 29, 31, 17, 39 };

void setup() {
size(400,300);
textSize(20);
text(command_mem.charAt(0),10,200);
fill(100, 100,0);
text(command_mem,10,20);
for (int i = 0; i < 10; i += 1){
  text(data_mem[i],10+30*i,100);
 
}
}
void draw() {
  int s=0;
  int s1=0;

if (!flag) dy=dy+0.01;
if (flag) dy=dy-0.01; 
//if(dy>9) {dy=dy-9;}
if(dy>9) {flag=true;}
if(flag==true && dy<0) {flag=false;}

   fill(0,0,0);
   text(data_mem[round(dy)],10+30*round(dy),100);
    
    
   for(int i=0;i<10;i++){
   if(data_mem[i]!=data_mem[round(dy)]){
   fill(100, 100,0);
   text(data_mem[i],10+30*i,100);
   }
  }

print(round(dy)); 
print("\n");
//print(py);
print(" ");
}

//trees = append(trees, 'd'); // Add "maple" to the end
//printArray(trees); // Prints [0] "ash", [1] "oak", [2] "maple"
//char[] moretrees = append(trees, 'e');
//printArray(moretrees);
