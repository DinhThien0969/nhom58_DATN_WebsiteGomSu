
package com.edusys.dao;

import com.edusys.entity.ChuyenDe;
import com.edusys.entity.NhanVien;
import com.edusys.utils.JDBCHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ChuyenDeDAO extends edusysDAO<ChuyenDe, String>{
    String INSERT_SQL = "insert into ChuyenDe (MaCD,TenCD,HocPhi,ThoiLuong,Hinh,MoTa) values (?,?,?,?,?,?)";
    String UPDATE_SQL = "update ChuyenDe set TenCD = ?, HocPhi =?, ThoiLuong = ?, Hinh =?, MoTa=? where MaCD=?";
    String DELETE_SQL = "delete from ChuyenDe where MaCD = ?";
    String SELECT_ALL_SQL = "select * from ChuyenDe";
    String SELECT_BY_ID_SQL = "select * from ChuyenDe where MaCD = ?";
    @Override
    public void insert(ChuyenDe entity) {
        JDBCHelper.update(INSERT_SQL, 
            entity.getMaCD(),entity.getTenCD(),entity.getHocPhi(),entity.getThoiLuong(),entity.getHinh(),entity.getMoTa());
    }

    @Override
    public void update(ChuyenDe entity) {
        JDBCHelper.update(UPDATE_SQL, 
            entity.getTenCD(),entity.getHocPhi(),entity.getThoiLuong(),entity.getHinh(),entity.getMoTa(),entity.getMaCD());
    }

    @Override
    public void delete(String id) {
       JDBCHelper.update(UPDATE_SQL, id);
    }

    @Override
    public List<ChuyenDe> selectAll() {
      return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    public ChuyenDe selectById(String id) {
        List<ChuyenDe>list = this.selectBySql(SELECT_BY_ID_SQL, id);
        if(list.isEmpty()){
            return null;
        }
        return list.get(0);
    }

    @Override
    protected List<ChuyenDe> selectBySql(String sql, Object... args) {
        List<ChuyenDe> list = new ArrayList<>();
        try {
            ResultSet rs = JDBCHelper.query(sql, args);
            while(rs.next()){
                ChuyenDe entity = new ChuyenDe();
                entity.setMaCD(rs.getString("MaCD"));
                entity.setTenCD(rs.getString("TenCD"));
                entity.setHocPhi(rs.getFloat("HocPhi"));
                entity.setThoiLuong(rs.getInt("ThoiLuong"));
                entity.setHinh(rs.getString("Hinh"));
                entity.setMoTa(rs.getString("MoTa"));
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
}
