CREATE DATABASE IF NOT EXISTS CSDLQuanlysach;
USE CSDLQuanlysach;

-- Tạo bảng Tác Giả
CREATE TABLE tac_gia (
    id_tac_gia INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(255) NOT NULL
);

-- Tạo bảng Sách
CREATE TABLE sach (
    id_sach INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(255) NOT NULL,
    gia DECIMAL(10, 2) NOT NULL,
    id_tac_gia INT,
    FOREIGN KEY (id_tac_gia) REFERENCES tac_gia(id_tac_gia)
);

-- Tạo bảng Nhân Viên
CREATE TABLE nhan_vien (
    id_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(255) NOT NULL,
    dia_chi TEXT NOT NULL
);

-- Tạo bảng quan hệ giữa Nhân Viên và Sách
CREATE TABLE nhan_vien_ban_sach (
    id_nhan_vien INT,
    id_sach INT,
    PRIMARY KEY (id_nhan_vien, id_sach),
    FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien(id_nhan_vien),
    FOREIGN KEY (id_sach) REFERENCES sach(id_sach)
);