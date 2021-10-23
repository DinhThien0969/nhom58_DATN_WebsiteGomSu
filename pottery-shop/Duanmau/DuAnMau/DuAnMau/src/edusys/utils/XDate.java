
package edusys.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class XDate {//là thư viện tiện ích giúp sử lý dữ liệu thời gian
    static SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy");
    public static Date toDate(String date, String... pattern){//Chuyển một chuỗi thành thời gian
        try {
            if(pattern.length>0){
                formater.applyPattern(pattern[0]);
            }
            if(date == null){
                return XDate.now();
            }
            return formater.parse(date);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static Date now() {
            return new Date();
        }
    public static String toString(Date date, String... pattern){//Lấy thời gian hiện tại để chuyển thành chuỗi
        if(pattern.length>0){
            formater.applyPattern(pattern[0]);
        }
        if(date == null){
                date = XDate.now();
            }
        return formater.format(date);
    }
    public static Date adDays(Date date, long days){//Bổ sung ngày vào ngày hiện tại
        date.setTime(date.getTime() + days*24*60*60*1000);
        return date;
    }
}
