
package edusys.dao;

import edusys.JdpcHelper.JdbcHelper;
import edusys.enbity.HocVien;
import edusys.enbity.NguoiHoc;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class HocVienDAO extends EduSysDAO<HocVien, String>{

    String INSERT_SQL = "INSERT INTO HocVien(MaHV, MaKH, MaNH, Diem)VALUES(?,?,?,?)";
    String UPDATE_SQL = "UPDATE HocVien SET MaHV=?, MaKH=?, MaNH=?, Diem=?WHERE MaHV=?";
    String DELETE_SQL = "DELETE FROM HocVien WHERE MaHV=?";
    String SELECT_ALL_SQL = "SELECT*FROM HocVien";
    String SELECT_BY_ID_SQL = "SELECT*FROM HocVien WHERE MaHV=?";
    
    @Override
    public void insert(HocVien entity) {
        JdbcHelper.update(INSERT_SQL,
                entity.getMaHV(), entity.getMaKH(), entity.getMaNH(), entity.getDiem());
    }

    @Override
    public void update(HocVien entity) {
        JdbcHelper.update(UPDATE_SQL,
                entity.getMaHV(), entity.getMaKH(), entity.getMaNH(), entity.getDiem());
    }

    @Override
    public void delete(String key) {
        JdbcHelper.update(DELETE_SQL, key);
    }

    @Override
    public List<HocVien> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    public HocVien selectById(String key) {
        List<HocVien> list = this.selectBySql(SELECT_BY_ID_SQL, key);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    protected List<HocVien> selectBySql(String sql, Object... args) {
        List<HocVien> list = new ArrayList<HocVien>();
        try {
            ResultSet rs = JdbcHelper.query(sql, args);
            while (rs.next()) {
                HocVien entity = new HocVien();
                entity.setMaHV(rs.getInt("MaHV"));
                entity.setMaKH(rs.getInt("MaKH"));
                entity.setMaNH(rs.getString("MaNH"));
                entity.setDiem(rs.getDouble("Diem"));                
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public List<HocVien> selectByKhoaHoc(int maKH){
        String sql = "SELECT * FROM HocVien WHERE MaKH=?";
        return this.selectBySql(sql, maKH);
    }
    
}
