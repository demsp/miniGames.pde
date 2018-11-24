import javax.swing.*;
 
class Main {
    public static void main(String[] args) {
 
        JFrame frame = new JFrame("Окно программы");
        frame.setVisible(true);
        frame.setSize(400, 500);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JPanel panel = new JPanel();
 
        int count = 10;
 
        JLabel[] labels = new JLabel[count];
        for (int i = 0; i < count; i++) {
            labels[i] = new JLabel();
            labels[i].setText("Номер " + i);
            panel.add(labels[i]);
            System.out.println(labels[i].getText());
        }
 
        frame.add(panel);
        frame.setVisible(true);
 
    }
}
