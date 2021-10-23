
package edusys.utils;

import edusys.enbity.NhanVien;
import java.awt.Image;
import java.io.File;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.swing.ImageIcon;


public class XImage {
    public static  Image getAppIcon(){//
       URL url = XImage.class.getResource("/edusys/icon/logofpt.png");
      return new ImageIcon(url).getImage();
    }    
    public static void save(File src){//đưa một file vào lưu một file vào một thư mục nào đó cần
        File dst = new File("logos", src.getName());//tạo ra một đối tượng file chỏ đến thư mục logos
        if(!dst.getParentFile().exists()){//kiểm tra xem thư mục tồn tại hay chưa
            dst.getParentFile().mkdirs();//nếu chưa tồn tại thì tạo thư mục logos
        }          
        try {
            Path from = Paths.get(src.getAbsolutePath());
            Path to = Paths.get(dst.getAbsolutePath());
            Files.copy(from,to, StandardCopyOption.REPLACE_EXISTING);//copy file vào thư mục logos
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static ImageIcon read(String fileName){//đọc một hình ảnh lên label
        File path = new File("logos", fileName);
        return new ImageIcon(path.getAbsolutePath());
    }
    
    public static NhanVien USER = null;
}
