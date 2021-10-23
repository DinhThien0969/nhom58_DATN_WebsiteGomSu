package com.edusys.dao;

import com.edusys.entity.HocVien;
import com.edusys.entity.KhoaHoc;
import com.edusys.utils.JDBCHelper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class KhoaHocDAO extends edusysDAO<KhoaHoc, String> {

    String INSERT_SQL = "insert into KhoaHoc (MaCD,HocPhi,ThoiLuong,NgayKG,GhiChu,MaNV,NgayTao) values (?,?,?,?,?,?,?)";
    String UPDATE_SQL = "update KhoaHoc set MaCD = ?, HocPhi =?, ThoiLuong = ?,NgayKG=?,GhiChu=?,MaNV=?,NgayTao=? where MaKH=?";
    String DELETE_SQL = "delete from KhoaHoc where MaKH = ?";
    String SELECT_ALL_SQL = "select * from KhoaHoc";
    String SELECT_BY_ID_SQL = "select * from KhoaHoc where MaKH = ?";

    public List<Integer> selectYear() {
        String sql = "select DISTINCT year(NgayKG) from KhoaHoc ORDER BY year(NgayKG) DESC";
        List<Integer> list = new ArrayList<>();
        try {
            ResultSet rs = JDBCHelper.query(sql);
            while (rs.next()) {
                list.add(rs.getInt(1));

            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<KhoaHoc> selectByChuyenDe(String macd) {
        String sql = "select * from KhoaHoc where MaCD=?";
        return this.selectBySql(sql, macd);
    }

    @Override
    public void insert(KhoaHoc entity) {

        JDBCHelper.update(INSERT_SQL,
                entity.getMaCD(), entity.getHocPhi(), entity.getThoiLuong(), entity.getNgayKG(), entity.getGhiChu(), entity.getMaNV(), entity.getNgayTao());

    }

    @Override
    public void update(KhoaHoc entity) {

        JDBCHelper.update(UPDATE_SQL,
                entity.getMaCD(), entity.getHocPhi(), entity.getThoiLuong(), entity.getNgayKG(), entity.getGhiChu(), entity.getMaNV(), entity.getNgayTao(), entity.getMaKH());

    }

    @Override
    public void delete(String id) {
        JDBCHelper.update(DELETE_SQL, id);
    }

    @Override
    public List<KhoaHoc> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    public KhoaHoc selectById(String id) {
        List<KhoaHoc> list = this.selectBySql(SELECT_BY_ID_SQL, id);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    protected List<KhoaHoc> selectBySql(String sql, Object... args) {
        List<KhoaHoc> list = new ArrayList<>();
        try {
            ResultSet rs = JDBCHelper.query(sql, args);
            while (rs.next()) {
                KhoaHoc entity = new KhoaHoc();
                entity.setMaKH(rs.getInt("MaKH"));
                entity.setMaCD(rs.getString("MaCD"));
                entity.setHocPhi(rs.getFloat("HocPhi"));
                entity.setThoiLuong(rs.getInt("ThoiLuong"));
                entity.setNgayKG(rs.getDate("NgayKG"));
                entity.setGhiChu(rs.getString("GhiChu"));
                entity.setMaNV(rs.getString("MaNV"));
                entity.setNgayTao(rs.getDate("NgayTao"));
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
