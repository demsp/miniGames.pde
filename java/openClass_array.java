public class Openclass { 
 public static int a=10; 
 public static int b=15; 
 static Integer[] integerArray;
  static {
    integerArray= new Integer[] {
     new Integer(1),
     new Integer(2),
     new Integer(3),
     new Integer(4),
     new Integer(6),
    };
  }

  public static void main(String args[]) {
    for (int i=0; i < integerArray.length; i++){
      System.out.println(integerArray[i]);
    }
  }
}
