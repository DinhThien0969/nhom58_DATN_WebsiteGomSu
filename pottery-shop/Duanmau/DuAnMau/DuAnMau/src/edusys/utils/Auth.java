
package edusys.utils;

import edusys.enbity.NhanVien;


public class Auth {
    public static NhanVien user = null;// để duy trì use đăng nhập vào hệ thống
    public static void clear(){
        Auth.user = null;
    }
    public static boolean isLogin(){//kiểm tra xem đăng nhập hay chưa
        return Auth.user != null;
    }
    public static boolean isManager(){// trả về kiểu boolean kiểm tra xem người đó là vai trò gì
        return Auth.isLogin() && user.getVaiTro();
    }
}
