Vehicle minivan; 

void setup(){
Vehicle minivan = new Vehicle();
int range;
minivan.passengers = 7;
minivan.fuelcap = 16;
minivan.mpg = 21;

range = minivan.fuelcap * minivan.mpg;
println("Minivan can carry " + minivan.passengers +" with a range of " + range);
}


class Vehicle {
int passengers; 
int fuelcap; 
int mpg; 
}
