
package edusys.utils;

import java.awt.Component;
import javax.swing.JOptionPane;


public class MsgBox {
    public static void alert(Component praent, String message){
        JOptionPane.showMessageDialog(praent, message, 
                "Hệ thống quản lý dào tạo", JOptionPane.INFORMATION_MESSAGE);
    }
    public static boolean confirm(Component praent, String message){
        int result = JOptionPane.showConfirmDialog(praent, message,
                "Hệ thống quản lý đào tạo",
                JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
        return result == JOptionPane.YES_OPTION;
    }
    public static String prompt(Component praent, String message){
        return JOptionPane.showInputDialog(praent, message,
                "Hệ thống quản lý đào tạo", JOptionPane.INFORMATION_MESSAGE);
    }
}
