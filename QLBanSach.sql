create database QLBanSach;
use QLBanSach;

create table KhachHang(
    MaKH char(10) not null primary key,
    TaiKhoan varchar(50),
    MatKhau char(12),
    Email varchar(100),
    DiaChi varchar(255),
    DienThoai varchar(15),
    GioiTinh char(5),
    NgaySinh DATE,
    HoTen varchar(100)
);

create table DonHang(
    MaDonHang char(10) not null primary key,
    DaThanhToan char(5),
    NgayGiao date,
    NgayDat date,
    TinhTrangGH varchar(255)
);
create table ChiTietDonHang(
    MaKH char(10),
    MaDonHang char(10),
    MaSach char(10),
    SoLuong int,
    DonGia int,
    primary key(MaDonHang, MaSach),
    foreign key (MaDonHang) references DonHang(MaDonHang)
);
alter table ChiTietDonHang add CONSTRAINT MaKH  FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH);
alter table ChiTietDonHang add CONSTRAINT MaSach  FOREIGN KEY (MaSach) REFERENCES Sach(MaSach);

create table TacGia(
    MaTacGia char(10) not null primary key,
    DienThoai varchar(15),
    TieuSu varchar(255),
    DiaChi varchar(255),
    TenTacGia varchar(100)
);

create table NhaXuatBan(
    MaNSX char(10) not null primary key,
    TenNXB varchar(255),
    DiaChi varchar(255),
    DienThoai varchar(15)
);

create table ChuDe(
    MaChuDe char(10) not null primary key,
    TenChuDe varchar(100)
);
create table Sach(
    MaSach char(10) not null primary key,
    MaNSX char(10) not null,
    MaChuDe char(10) not null,
    TenSach varchar(100),
    SoLuongTon int,
    GiaBan int,
    MoTa varchar(255),
    NgayCapNhat date,
    AnhBia varchar(255),
    foreign key(MaNSX)references NhaXuatBan(MaNSX),
    foreign key(MaChuDe)references ChuDe(MaChuDe)
);


create table ChiTietTacGia(
    MaTacGia char(10) not null,
    MaSach char(10) not null,
    VaiTro varchar(50),
    ViTri varchar(50),
    primary key(MaTacGia, MaSach),
    foreign key (MaTacGia) references TacGia(MaTacGia),
    foreign key (MaSach) references Sach(MaSach)
);
