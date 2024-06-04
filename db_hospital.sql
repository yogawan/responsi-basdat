create table kelas_kamar (
    kode_kelas varchar(3),
    kelas varchar(10),
    harga int(11)
);

create table pasien (
    kode_pasien varchar(6),
    nama_pasien varchar(50),
    alamat varchar(100),
    telpon varchar(14)
);

create table dokter (
    kode_dokter varchar(6),
    nama_dokter varchar(50),
    spesialis varchar(20),
    alamat varchar(100),
    telpon varchar(14)
);

create table kamar (
    kode_kamar varchar(6),
    nama_kamar varchar(30),
    kode_kelas varchar(3)
);

create table opname (
    kode_opname int(6),
    kode_pasien varchar(6),
    kode_dokter varchar(6),
    kode_kelas varchar(6),
    tanggal_masuk date,
    tanggal_keluar date,
    sakit varchar(30)
);

INSERT INTO dokter (kode_dokter, nama_dokter, spesialis, alamat , telpon) 
VALUES 
('D01', 'Muhammad Yusuf', 'Penyakit Dalam, Yogyakarta', '085161766111'),
('D02', 'Taufik', 'Jantung', 'Sleman', '085161766222'),
('D03', 'Ismail', 'Anak', 'Sleman', '085161766333'),
('D04', 'Tuti Hartati', 'Umum', 'Solo', '085161766444');

INSERT INTO kelas_kamar (kode_kelas, kelas, harga)
VALUES
('1', 'VVIP', 20000),
('2', 'VIP', 15000),
('3', 'Standard', 10000),
('4', 'Ekonomi', 5000);

INSERT INTO pasien (kode_pasien, nama_pasien, alamat, telpon)
VALUES
('P01', 'Beni', 'Wates', 085161766001),
('P02', 'Budi', 'Sleman', 085161766002),
('P03', 'Cepi', 'Gamping', 085161766003),
('P04', 'Citra', 'Gejayan', 085161766004),
('P05', 'Desi', 'Solo', 085161766005),
('P06', 'Feri', 'Klaten', 085161766006),
('P07', 'Rangga', 'Magelang', 085161766007);

INSERT INTO kamar (kode_kamar, nama_kamar, kode_kelas)
VALUES
('K01', 'Melati 1', '1'),
('K02', 'Melati 2', '1'),
('K03', 'Melati 3', '2'),
('K04', 'Flamboyan 1', '2'),
('K05', 'Flamboyan 2', '1'),
('K06', 'Flamboyan 3', '3'),
('K07', 'Anggrek 1', '4'),
('K08', 'Anggrek 2', '2'),
('K09', 'Anggrek 3', '3'),
('K10', 'Anggrek 4', '4'),
('K11', 'Mawar 1', '3'),
('K12', 'Mawar 2', '4'),
('K13', 'Mawar 3', '3');

INSERT INTO opname (kode_opname, kode_pasien, kode_dokter, kode_kelas, tanggal_masuk, tanggal_keluar, sakit) 
VALUES 
('1', 'P01', 'D02', 'K01', '2024-05-01', '2024-05-05', 'Demam'),
('2', 'P02', 'D03', 'K10', '2024-04-20', '2024-04-25', 'Flu'),
('3', 'P03', 'D02', 'K13', '2024-05-02', '2024-05-10', 'Cedera pada kaki'),
('4', 'P03', 'D04', 'K07', '2024-05-12', '2024-05-15', 'Luka bakar'),
('5', 'P03', 'D01', 'K05', '2024-05-18', '2024-05-22', 'Pendarahan dalam'),
('6', 'P03', 'D04', 'K08', '2024-05-25', '2024-05-30', 'Patah tulang'),
('7', 'P03', 'D03', 'K11', '2024-06-02', '2024-06-07', 'Gangguan pencernaan');