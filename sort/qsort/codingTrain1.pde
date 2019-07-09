int time;
int wait = 1000;
boolean tick = false;

int[] values;
int w = 10;
// int[] states; 

void setup() {
  time = millis();//store the current time
  frameRate(1);
  size(410, 400);
  //values = new int[floor(width / w)];
  values = new int[40];
 // states = new int[floor(width / w)];
 
  for (int i = 0; i < values.length; i++) {
    values[i] = int( random(height) );
   // values[i] = i*10;
   // states[i] = -1;
  }
//   quickSort(values, 0, values.length - 1);
}

void quickSort(int[] arr, int start, int end) {
  if (start >= end) {
    return;
  }
  int index = partition(arr, start, end); 
 // states[index] = -1;

  //await Promise.all([
  if(tick)  quickSort(arr, start, index - 1);
  if(!tick)  quickSort(arr, index + 1, end);
 // ]);
}

int partition(int[] arr, int start, int end) {
  /*  for (int i = start; i < end; i++) {
    states[i] = 1;
  } */

  int pivotValue = arr[end];
  int pivotIndex = start;
 // states[pivotIndex] = 0;
  for (int i = start; i < end; i++) {
    if (arr[i] < pivotValue) {

 //swap
  swap(arr, i,  pivotIndex); 
    //   states[pivotIndex] = -1;     
   //if(tick)  
   pivotIndex++;
   //    states[pivotIndex] = 0;
    }
  }
  // swap 
    swap(arr, pivotIndex, end);  

  for (int i = start; i < end; i++) {
    if (i != pivotIndex ) {
    //  states[i] = -1;
    }
  }

 return pivotIndex;
}

void draw() {
  background(0);

  for (int i = 0; i < values.length; i++) {
    noStroke();
    /*
    if (states[i] == 0) {
      fill(100);
    } else if (states[i] == 1) {
      fill(150);
    } else {
      fill(250);
    }
    */
    rect(i * w, height - values[i], w-1, values[i]);     
   
  }  
  /*
   if(millis() - time >= wait){
    println("tick");//if it is, do something
    time = millis();//also update the stored time
  }
   */
   if(millis() - time >= wait){
    tick = !tick;//if it is, do something
    time = millis();//also update the stored time
  } 
 if(tick)
    quickSort(values, 0, values.length - 1);
} // end draw 


 void swap(int[] arr, int a, int b) {
//  await sleep(50);
//  delay(20);
 println("SWAP");  
  int temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;   
   }
