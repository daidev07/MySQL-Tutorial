CREATE DATABASE IF NOT EXISTS CSDL_taikhoan_nganhang;
USE CSDL_taikhoan_nganhang;

-- Tạo bảng Khách Hàng
CREATE TABLE khach_hang (
    id_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(255) NOT NULL
);

-- Tạo bảng Tài Khoản
CREATE TABLE tai_khoan (
    id_tai_khoan INT PRIMARY KEY AUTO_INCREMENT,
    khach_hang_id INT UNIQUE,
    so_du DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (khach_hang_id) REFERENCES khach_hang(id_khach_hang)
);
