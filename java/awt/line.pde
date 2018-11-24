import java.awt.Color;
import java.awt.Container;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Shape;
import java.awt.geom.GeneralPath;
import javax.swing.JComponent;
import javax.swing.JFrame;
void setup(){
//public class MainClass{
//  public static void main(String[] args) {
    JFrame jf = new JFrame("Demo");
    Container cp = jf.getContentPane();
    MyCanvas tl = new MyCanvas();
    cp.add(tl);
    jf.setSize(300, 200);
    jf.setVisible(true);
  }
//}
class MyCanvas extends JComponent {
  Shape shape;
  public MyCanvas() {
    shape = create();
  }
  protected Shape create() {
    GeneralPath path = new GeneralPath();
    path.moveTo(50, 50);
    path.lineTo(100, 100);
    return path;
  }

  public void paint(Graphics g) {
    Graphics2D g2 = (Graphics2D) g;
    g2.setPaint(Color.black);
    g2.draw(shape);
  }
}
