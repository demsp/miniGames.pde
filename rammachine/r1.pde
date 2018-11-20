size(400,300);
textSize(20);
//char[] trees = { 'a','b','c' };
String command_mem = ">>>.<<<abc+-=1^";
int[] data_mem ={ 50, 61, 83, 69, 71,50, 29, 31, 17, 39 };

//text(command_mem.charAt(0),10,20);
fill(100, 100,0);
text(command_mem,10,20);
for (int i = 0; i < 10; i += 1){
  text(data_mem[i],10+30*i,100);
 
}
for (int i = 0; i < 10; i += 1){
if (data_mem[i]==50) {
        fill(0,0,0);
    text(data_mem[i],10+30*i,100);  
    }
}
//trees = append(trees, 'd'); // Add "maple" to the end
//printArray(trees); // Prints [0] "ash", [1] "oak", [2] "maple"
//char[] moretrees = append(trees, 'e');
//printArray(moretrees);
