package com.potteryshop.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QSanPham is a Querydsl query type for SanPham
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QSanPham extends EntityPathBase<SanPham> {

    private static final long serialVersionUID = -1427147281L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QSanPham sanPham = new QSanPham("sanPham");

    public final StringPath chatLieu = createString("chatLieu");

    public final QDanhMuc danhMuc;

    public final NumberPath<Long> donGia = createNumber("donGia", Long.class);

    public final QHangSanXuat hangSanXuat;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath kichThuoc = createString("kichThuoc");

    public final StringPath mauSac = createString("mauSac");

    public final NumberPath<Integer> soLuong = createNumber("soLuong", Integer.class);

    public final StringPath tenSanPham = createString("tenSanPham");

    public final StringPath thietKe = createString("thietKe");

    public final StringPath thongTinBaoHanh = createString("thongTinBaoHanh");

    public final StringPath thongTinChung = createString("thongTinChung");

    public QSanPham(String variable) {
        this(SanPham.class, forVariable(variable), INITS);
    }

    public QSanPham(Path<? extends SanPham> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QSanPham(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QSanPham(PathMetadata metadata, PathInits inits) {
        this(SanPham.class, metadata, inits);
    }

    public QSanPham(Class<? extends SanPham> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.danhMuc = inits.isInitialized("danhMuc") ? new QDanhMuc(forProperty("danhMuc")) : null;
        this.hangSanXuat = inits.isInitialized("hangSanXuat") ? new QHangSanXuat(forProperty("hangSanXuat")) : null;
    }

}

