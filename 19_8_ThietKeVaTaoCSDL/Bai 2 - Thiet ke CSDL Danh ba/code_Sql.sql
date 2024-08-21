CREATE DATABASE IF NOT EXISTS CSDLDanhba;
USE CSDLDanhba;
-- Tạo bảng Người
CREATE TABLE nguoi (
    id_nguoi INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(255) NOT NULL
);

-- Tạo bảng Số Điện Thoại
CREATE TABLE so_dien_thoai (
    id_so_dien_thoai INT PRIMARY KEY AUTO_INCREMENT,
    nguoi_id INT,
    so VARCHAR(15) NOT NULL,
    FOREIGN KEY (nguoi_id) REFERENCES nguoi(id_nguoi)
);

-- Tạo bảng Email
CREATE TABLE email (
    id_email INT PRIMARY KEY AUTO_INCREMENT,
    nguoi_id INT,
    dia_chi_email VARCHAR(255) NOT NULL,
    FOREIGN KEY (nguoi_id) REFERENCES nguoi(id_nguoi)
);