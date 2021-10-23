
package com.edusys.dao;

import com.edusys.utils.JDBCHelper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ThongKeDAO {
    List<Object[]> getListOfArray(String sql, String[] cols, Object... arg) {
        try {
            List<Object[]> list = new ArrayList<Object[]>();
            ResultSet rs = JDBCHelper.query(sql,arg);
            while (rs.next()) {
                Object[] ob = new Object[cols.length];
                for (int i = 0; i < cols.length; i++) {
                    ob[i] = rs.getObject(cols[i]);
                }
                list.add(ob);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (SQLException e) {
            
            throw new RuntimeException();
        }
    }

    public List<Object[]> getBangDiem(Integer maKH) {
        String sql = "{CALL sp_BangDiem(?)}";
        String[] cols = {"MaNH", "HoTen", "Diem"};
        return getListOfArray(sql, cols, maKH);
    }

    public List<Object[]> getLuongNguoiHoc() {
        String sql = "{CALL sp_ThongKeNguoiHoc()}";
        String[] cols = {"Nam", "SoLuong", "DauTien", "CuoiCung"};
        return getListOfArray(sql, cols);
    }

    public List<Object[]> getDiemChuyenDe() {
        String sql = "{CALL sp_ThongKeDiem()}";
        String[] cols = {"ChuyenDe","SoHV", "ThapNhat", "CaoNhat", "TrungBinh"};
        return getListOfArray(sql, cols);
    }

    public List<Object[]> getDoanhThu(int nam) {
        String sql = "{CALL sp_ThongKeDoanhThu(?)}";
        String[] cols = {"ChuyenDe", "SoKH", "SoHV", "DoanhThu", "ThapNhat", "CaoNhat", "TrungBinh"};
        return getListOfArray(sql, cols, nam);
    }
}
