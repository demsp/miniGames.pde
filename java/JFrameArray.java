import javax.swing.*;
 
class JFrameArray {
    public static void main(String[] args) {
       int[] anArray; 
       anArray = new int[10]; 
       anArray[0] = 100; 
       anArray[1] = 210; 
       anArray[2] = 300; 
       anArray[3] = 400; 
       anArray[4] = 500; 
       anArray[5] = 600; 
       anArray[6] = 700; 
       anArray[7] = 800; 
       anArray[8] = 900; 
       anArray[9] = 950;
        
        JFrame frame = new JFrame("Окно программы");
        frame.setVisible(true);
        frame.setSize(400, 500);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JPanel panel = new JPanel();
 
        int count = 10;
 
        JLabel[] labels = new JLabel[count];
        for (int i = 0; i < count; i++) {
            labels[i] = new JLabel();
            labels[i].setText("arr " + anArray[i]);
            panel.add(labels[i]);
            System.out.println(labels[i].getText());
        }
 
        frame.add(panel);
        frame.setVisible(true);
 
    }
}
