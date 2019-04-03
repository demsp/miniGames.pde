// http://src-code.net/soxranenie-tekstovyx-fajlov-v-processing/

PrintWriter textFile;

void setup(){
textFile = createWriter("files/randomnumbers.txt");
}

//В каждом цикле функции draw() мы будет записывать в файл случайное число. Когда переменная frameCount достигнет 1000 мы сохраним файл и загроем приложение.

void draw(){
textFile.println( random( 200 ) ); if ( frameCount >= 1000 ) {
textFile.flush(); textFile.close(); exit();
 }
}
