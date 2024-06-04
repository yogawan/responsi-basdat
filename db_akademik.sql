create database db_akademik;

use db_akademik;

create table mahasiswa(
    nim VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100),
    tanggal_lahir DATE,
    jurusan VARCHAR(50)
);

create table mata_kuliah (
    kode_mk VARCHAR(10) PRIMARY KEY,
    nama_mk VARCHAR(100),
    sks INT(111)
);

create table nilai (
    nim VARCHAR(10),
    kode_mk VARCHAR(10),
    nilai Char(2),
    PRIMARY KEY (nim, kode_mk),
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (kode_mk) REFERENCES mata_kuliah(kode_mk) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO mata_kuliah (kode_mk, nama_mk, sks) VALUES
('INF101', 'Algoritma dan Pemrograman', 3),
('INF102', 'Basis Data', 3),
('INF103', 'Sistem Operasi', 3);

INSERT INTO mahasiswa (nim, nama, tanggal_lahir, jurusan) VALUES
(101, 'Andi Saputra', '2000-05-15', 'Informatika'),
(102, 'Budi Santoso', '1999-11-20', 'Sistem Informasi'),
(103, 'Citra Dewi', '2001-01-25', 'Informatika');

INSERT INTO nilai (nim, kode_mk, nilai) VALUES
(101, 'INF101', 'A'),
(101, 'INF102', 'B'),
(101, 'INF103', 'A'),
(102, 'INF101', 'C'),
(102, 'INF102', 'B'),
(102, 'INF103', 'A'),
(103, 'INF101', 'B'),
(103, 'INF103', 'B');


select User, Host from mysql.user;
create user 'yogawan'@'localhost' identified by 'admin';
GRANT SELECT, INSERT ON db_akademik.* TO 'yogawan'@'localhost'; 