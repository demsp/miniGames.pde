<a href="https://www.youtube.com/watch?v=Nx3_nX8UoMo">игры хаоса</a>
<a href="https://habr.com/post/167817/">треугольник Серпинского</a>
<a href="http://www.mathprofi.ru/statisticheskoe_opredelenie_verojatnosti.html">относительная частота</a>
<a href="http://flash.com.ru/klassicheskie/ruletka-6">рулетка</a>
Это означает, что новая точка находится посередине между текущей точкой и одной из вершин, выбранной случайным образом.
Будем хранить x-координаты вершин треугольника в массиве x_arr
int[] x_arr = { 0, 1000, 500 };

Будем хранить y-координаты в массиве y_arr
int[] y_arr = { 0, 0, 700 }; 

Координаты точек будем хранить в динамическом массиве PVector
Первая точка будет лежать в начале координат (0,0)
PVector v=new PVector(0, 0);

Добавление точек производится оператором add()
v.add(x_arr[vertex_index], y_arr[vertex_index]);

Индекс вершины, обозначенный как vertex_index, задаётся случайным образом с помощью функции random()
arr_index=int( random(0,3) ); // преобразование float к int

Затем мы делим координаты пополам и выводим точку
v.add(x_arr[arr_index], y_arr[arr_index]);
v.x=(v.x)/2;
v.y=(v.y)/2;
point(v.x, v.y);

Весь код
int vertex_index;
int[] x_arr = { 0, 1000, 500 };
int[] y_arr = { 0, 0, 700 }; 
PVector v=new PVector(0, 0);
size(1000,750); // размер канваса
void draw() { // цикл программы
arr_index=int( random(0,3) ); // преобразование float к int
v.add(x_arr[arr_index], y_arr[arr_index]);
v.x=(v.x)/2;
v.y=(v.y)/2;
point(v.x, v.y);
}
Проверить можно <a href="http://sketchpad.cc/x6hpzo8MIu">здесь</a>





serpinsky1

PVector v=new PVector(10, 10, 0);
float x0=200;
float y0=200;

void setup() {
  size(400,400);
 // noLoop();
 // v = new PVector(40, 20, 0);
}

void draw() {
  ellipse(x0, y0, 10, 10);
   
  ellipse(v.x, v.y, 10, 10);
  
 // v.add(x0/2, y0/2, 0);
 // ellipse(v.x, v.y, 10, 10);
}
void keyReleased() { 
 
 v.add(x0, y0, 0);
 v.x=(v.x)/2;
 v.y=(v.y)/2;
 ellipse(v.x, v.y, 10, 10);
 
 println("v.x ",v.x);
 println("v.y ",v.y);
}   

/*
PVector v1, v2;
void setup() {
  size(400,400);
 // noLoop();
  v1 = new PVector(20, 20);
  v2 = new PVector(40, 40); 
}
void draw() {
  ellipse(v1.x, v1.y, 12, 12);
  ellipse(v2.x, v2.y, 12, 12);
  //v2.add(v1);
  //ellipse(v2.x, v2.y, 12, 12);
}
void keyReleased() { 
    v2.add(v1);
  ellipse(v2.x, v2.y, 12, 12);
   
}   
*/




