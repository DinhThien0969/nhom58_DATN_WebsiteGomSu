package com.edusys.dao;

import com.edusys.entity.ChuyenDe;
import com.edusys.entity.HocVien;
import com.edusys.utils.JDBCHelper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HocVienDAO extends edusysDAO<HocVien, Integer> {

    String INSERT_SQL = "insert into HocVien (MaKH,MaNH,Diem) values (?,?,?)";
    String UPDATE_SQL = "update HocVien set MaKH = ?, MaNH =?, Diem = ? where MaHV=?";
    String DELETE_SQL = "delete from HocVien where MaHV = ?";
    String SELECT_ALL_SQL = "select * from HocVien";
    String SELECT_BY_ID_SQL = "select * from HocVien where MaHV = ?";

    public List<HocVien> selectByKhoaHoc(int MaKH) {
        String sql = "select * from HocVien where MaKH=?";
        return this.selectBySql(sql, MaKH);
    }
    String sqlMaxID = "SELECT Max(MaHV) as ID from HocVien";

    public int maxID() {
        try {
            ResultSet rs = JDBCHelper.query(sqlMaxID);
            int id = 0;
            while (rs.next()) {
                id = rs.getInt("ID");
            }
            return id;
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    @Override
    public void insert(HocVien entity) {

        JDBCHelper.update(INSERT_SQL,
                 entity.getMaKH(), entity.getMaNH(), entity.getDiem());

    }

    @Override
    public void update(HocVien entity) {
        JDBCHelper.update(UPDATE_SQL,
                entity.getMaKH(), entity.getMaNH(), entity.getDiem(), entity.getMaHV());
    }

    @Override
    public void delete(Integer id) {
        JDBCHelper.update(UPDATE_SQL, id);
    }

    @Override
    public List<HocVien> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    public HocVien selectById(Integer id) {
        List<HocVien> list = this.selectBySql(SELECT_BY_ID_SQL, id);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    protected List<HocVien> selectBySql(String sql, Object... args) {
        List<HocVien> list = new ArrayList<>();
        try {
            ResultSet rs = JDBCHelper.query(sql, args);
            while (rs.next()) {
                HocVien entity = new HocVien();
                entity.setMaHV(rs.getInt("MaHV"));
                entity.setMaKH(rs.getInt("MaKH"));
                entity.setMaNH(rs.getString("MaNH"));
                entity.setDiem(rs.getFloat("Diem"));

                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    
}
