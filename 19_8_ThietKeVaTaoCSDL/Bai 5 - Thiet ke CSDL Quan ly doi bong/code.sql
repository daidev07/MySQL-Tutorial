CREATE DATABASE IF NOT EXISTS CSDL_Doibong;
USE CSDL_Doibong;

-- Tạo bảng hlv
CREATE TABLE hlv (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    ngay_sinh DATE
);

-- Tạo bảng doi
CREATE TABLE doi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_doi VARCHAR(255) NOT NULL,
    hlv_id INT,
    FOREIGN KEY (hlv_id) REFERENCES hlv(id),
    UNIQUE (hlv_id)  -- Đảm bảo mỗi HLV chỉ quản lý một đội
);

-- Tạo bảng cau_thu
CREATE TABLE cau_thu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    ngay_sinh DATE,
    doi_id INT,
    FOREIGN KEY (doi_id) REFERENCES doi(id)
);

-- Tạo bảng vi_tri_cau_thu
CREATE TABLE vi_tri_cau_thu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vi_tri VARCHAR(255) NOT NULL
);

-- Tạo bảng tran_dau
CREATE TABLE tran_dau (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doi_a INT,
    doi_b INT,
    ngay_gio_dau TIMESTAMP,
    FOREIGN KEY (doi_a) REFERENCES doi(id),
    FOREIGN KEY (doi_b) REFERENCES doi(id),
    CHECK (doi_a != doi_b) -- Đảm bảo hai đội trong một trận đấu không trùng nhau
);

-- Tạo bảng cau_thu_vi_tri
CREATE TABLE cau_thu_vi_tri (
    cau_thu_id INT,
    vi_tri_id INT,
    PRIMARY KEY (cau_thu_id, vi_tri_id),
    FOREIGN KEY (cau_thu_id) REFERENCES cau_thu(id),
    FOREIGN KEY (vi_tri_id) REFERENCES vi_tri_cau_thu(id)
);

-- Tạo bảng tran_dau_cau_thu
CREATE TABLE tran_dau_cau_thu (
    tran_dau_id INT,
    cau_thu_id INT,
    PRIMARY KEY (tran_dau_id, cau_thu_id),
    FOREIGN KEY (tran_dau_id) REFERENCES tran_dau(id),
    FOREIGN KEY (cau_thu_id) REFERENCES cau_thu(id)
);