package com.edusys.dao;

import com.edusys.entity.HocVien;
import com.edusys.entity.NguoiHoc;
import com.edusys.utils.JDBCHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NguoiHocDAO extends edusysDAO<NguoiHoc, String> {

    String INSERT_SQL = "insert into NguoiHoc (MaNH,HoTen,NgaySinh,GioiTinh,DienThoai,Email,GhiChu,MaNV,NgayDK) values (?,?,?,?,?,?,?,?,?)";
    String UPDATE_SQL = "update NguoiHoc set HoTen = ?, NgaySinh =?, GioiTinh = ?,DienThoai=?,Email=?,GhiChu=?,MaNV=?,NgayDK=? where MaNH=?";
    String DELETE_SQL = "delete from NguoiHoc where MaNH = ?";
    String SELECT_ALL_SQL = "select * from NguoiHoc";
    String SELECT_BY_ID_SQL = "select * from NguoiHoc where MaNH = ?";
    
    public List<NguoiHoc> selectByKeyword(String keyword){
        String sql = "select * from NguoiHoc where HoTen like ? ";
        return this.selectBySql(sql, "%"+keyword+"%");
    }
    
    public List<NguoiHoc> selectNotInCourse1(int makh, String keyword){
        String sql = "select * from NguoiHoc where HoTen like ? and MaNH not in (select MaNH from HocVien where MaKH = ?)";
        return this.selectBySql(sql, "%"+keyword+"%",makh);
    }
    
    public List<NguoiHoc> selectNotInCourse() {
        String sql = "select * from NguoiHoc where MaNH not in (select MaNH from HocVien)";
        return this.selectBySql(sql);
    }
    @Override
    public void insert(NguoiHoc entity) {
        JDBCHelper.update(INSERT_SQL, 
            entity.getMaNH(),entity.getHoTen(),entity.getNgaySinh(),entity.isGioiTinh(),entity.getDienThoai(),
            entity.getEmail(),entity.getGhiChu(),entity.getMaNV(), entity.getNgayDK());
    }

    @Override
    public void update(NguoiHoc entity) {
        JDBCHelper.update(UPDATE_SQL, 
            entity.getHoTen(),entity.getNgaySinh(),entity.isGioiTinh(),entity.getDienThoai(),
            entity.getEmail(),entity.getGhiChu(),entity.getMaNV(), entity.getNgayDK(),entity.getMaNH());
    }

    @Override
    public void delete(String id) {
        JDBCHelper.update(UPDATE_SQL, id);
    }

    @Override
    public List<NguoiHoc> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    public NguoiHoc selectById(String id) {
        List<NguoiHoc>list = this.selectBySql(SELECT_BY_ID_SQL, id);
        if(list.isEmpty()){
            return null;
        }
        return list.get(0);
    }

    @Override
    protected List<NguoiHoc> selectBySql(String sql, Object... args) {
         List<NguoiHoc> list = new ArrayList<>();
        try {
            ResultSet rs = JDBCHelper.query(sql, args);
            while(rs.next()){
                NguoiHoc entity = new NguoiHoc();
                entity.setMaNH(rs.getString("MaNH"));
                entity.setHoTen(rs.getString("HoTen"));
                entity.setNgaySinh(rs.getDate("NgaySinh"));
                entity.setGioiTinh(rs.getBoolean("GioiTinh"));
                entity.setDienThoai(rs.getString("DienThoai"));
                entity.setEmail(rs.getString("Email"));
                entity.setGhiChu(rs.getString("GhiChu"));
                entity.setMaNV(rs.getString("MaNV"));
                entity.setNgayDK(rs.getDate("NgayDK"));
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
