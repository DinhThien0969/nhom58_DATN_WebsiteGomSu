package com.edusys.dao;

import com.edusys.entity.NhanVien;
import java.util.List;
import com.edusys.utils.JDBCHelper;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NhanVienDAO extends edusysDAO<NhanVien, String> {

    String INSERT_SQL = "insert into NhanVien (MaNV,MatKhau,HoTen,VaiTro) values (?,?,?,?)";
    String UPDATE_SQL = "update NhanVien set MatKhau = ?, HoTen =?, VaiTro = ? where MaNV=?";
    String DELETE_SQL = "delete from NhanVien where MaNV = ?";
    String SELECT_ALL_SQL = "select * from NhanVien";
    String SELECT_BY_ID_SQL = "select * from NhanVien where MaNV = ?";

    @Override
    public void insert(NhanVien entity) {
        JDBCHelper.update(INSERT_SQL,
                entity.getMaNV(), entity.getMatKhau(), entity.getHoTen(), entity.isVaiTro());

    }

    @Override
    public void update(NhanVien entity) {
        JDBCHelper.update(UPDATE_SQL,
                 entity.getMatKhau(),entity.getHoTen(), entity.isVaiTro(), entity.getMaNV());
    }

    @Override
    public void delete(String id) {
        JDBCHelper.update(UPDATE_SQL, id);
    }

    @Override
    public List<NhanVien> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    public NhanVien selectById(String id) {
        List<NhanVien> list = this.selectBySql(SELECT_BY_ID_SQL, id);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    protected List<NhanVien> selectBySql(String sql, Object... args) {
        List<NhanVien> list = new ArrayList<>();
        try {
            
            ResultSet rs = JDBCHelper.query(sql, args);
            while (rs.next()) {
                NhanVien entity = new NhanVien();
                entity.setMaNV(rs.getString("MaNV"));
                entity.setHoTen(rs.getString("HoTen"));
                entity.setMatKhau(rs.getString("MatKhau"));
                entity.setVaiTro(rs.getBoolean("VaiTro"));
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
