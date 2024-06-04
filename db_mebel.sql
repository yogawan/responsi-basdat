create table jenis_mebel (
    kode_jenis_mebel VARCHAR(5) PRIMARY KEY,
    nama_jenis VARCHAR(20)
);

create table mebel (
    kode_mebel VARCHAR(10) PRIMARY KEY,
    jenis_mebel VARCHAR(30),
    kode_jenis_mebel VARCHAR(5),
    jumplah_stok MEDIUMINT(3),
    tanggal_supply DATE,
    harga INT(10)
);

INSERT INTO jenis_mebel(kode_jenis_mebel, nama_jenis)
VALUES
    ('J001', 'Almari Pakaian'),
    ('J002', 'Almari Hias'),
    ('J003', 'Kursi Santai'),
    ('J004', 'Kursi Taman'),
    ('J005', 'Kursi Makan'),
    ('J006', 'Meja Makan'),
    ('J007', 'Meja Rias');


INSERT INTO mebel(kode_mebel, jenis_mebel, kode_jenis_mebel, jumplah_stok, tanggal_supply, harga)
VALUES
    ('A623', 'Oakland Wardrobe', 3001, 15, '2018-03-14', 6230000),
    ('A740', 'Taby 3 Door Wardrobe', 3002, 36, '2018-02-12', 7400000),
    ('A775', 'Ashton Wardrobe', 3001, 13, '2018-03-16', 7750000),
    ('K249', 'Jobi 2 Seater', 3003, 20, '2018-01-13', 2499000),
    ('K399', 'Mano Stool', 1003, 56, '2018-03-14', 399000),
    ('K750', 'Bugsy Dining Chair', 3005, 48, '2018-01-14', 750000),
    ('K899', 'Mondy Chair', 3003, 34, '2018-01-12', 899000),
    ('M199', 'Danish Dining Chair', 3005, 27, '2018-03-11', 999000),
    ('M192', 'Eton Side Table', 3007, 36, '2018-03-16', 199000),
    ('M280', 'Taby Table', 3007, 20, '2018-02-13', 2800000),
    ('M365', 'Ikarus Cessi 4 Seater', 3006, 15, '2018-03-14', 3650000),
    ('M500', 'Sakura Simo Dining Set', 3006, 11, '2018-03-13', 5000000); 


SELECT AVG(harga) AS rata_rata_harga FROM mebel;
SELECT SUM(stok) AS jumplah_stok
FROM mebel;