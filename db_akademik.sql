CREATE DATABASE db_akademik;
USE db_akademik;

{
    CREATE DATABASE mahasiswa(
        NIM VARCHAR(10) PRIMARY KEY,
        Nama_Mhs VARCHAR(50),
        TempatLahir VARCHAR(50),
        TanggalLahir DATE,
        JenisKelamin ENUM('L','P'),
        Alamat TEXT,
        NoTelpon VARCHAR(15),
        Email VARCHAR(50),
        Jurusan VARCHAR(50)
    );

    CREATE DATABASE dosen(
        NIP VARCHAR(10) PRIMARY KEY,
        Nama_Dosen VARCHAR(50),
        Alamat VARCHAR(10),
        Email VARCHAR(50),
        NoTelpon VARCHAR(15)
    );
}

-- Mahasiswa
{
    CREATE TABLE mahasiswa(
        NIM VARCHAR(10) PRIMARY KEY,
        Nama_Mhs VARCHAR(50),
        TempatLahir VARCHAR(50),
        TanggalLahir DATE,
        JenisKelamin ENUM('L', 'P'),
        Alamat TEXT,
        NoTelepon VARCHAR(15),
        Email VARCHAR(50),
        Jurusan VARCHAR(50)
    );




    INSERT INTO mahasiswa(NIM, Nama_MHS, TempatLahir, TanggalLahir, JenisKelamin, Alamat, NoTelepon, Email, Jurusan)
    VALUES
    ('M230', 'Gita Putri', 'Denpasar', '1998-09-05', 'P', 'Denpasar', '81234567896', 'gita@gmail.com', 'Informatika'),
    ('M231', 'Hendra Pratama', 'Makasar', '2001-04-18', 'L', 'Makasar', '81234567897', 'hendra@gmail.com', 'Sistem Informasi'),
    ('M232', 'Indah Permata', 'Palembang', '1999-11-20', 'P', 'Palembang', '81234567899', 'indah@gmail.com', 'Informatika'),
    ('M233', 'Joko Supriyadi', 'Balikpapan', '2000-06-03', 'L', 'Balikpapan',  '81234567899', 'joko@gmail,com', 'Informatika'),
    ('M234', 'Karin Anindya', 'Bandung', '1998-11-11', 'P', 'Bandung',  '81234567900', 'karin@gmail.com', 'Sistem Informasi'),
    ('m235', 'Leo Santoso', 'Semarang', '2001-03-19', 'L', 'Semarang',  '81234567900', 'leo@gmail.com', 'Informatika');
}

-- Dosen
{
    CREATE TABLE dosen(
        NIP VARCHAR(10) PRIMARY KEY,
        Nama_Dosen VARCHAR(50),
        Alamat VARCHAR(255),
        Email VARCHAR(50),
        NoTelepon VARCHAR(15)
    );

    INSERT INTO dosen(NIP, Nama_Dosen, Alamat, Email, NoTelepon)
    VALUES
    ('D001', 'Dr. Eka Putra', 'Bandung', 'eka@kampus.com', '82123456784'),
    ('D002', 'Prof. Dr. Fina Larasati', 'Surabaya', 'fina@kampus.com', '82123456785'),
    ('D003', 'Dr. Guntur Wibowo', 'Semarang', 'guntur@kampus.com', '82123456786'),
    ('D004', 'Dr. Hesti Pramudita', 'Yogyakarta', 'hesti@kampus.com', '82123456787');
}

-- Mata Kuliah
{
    CREATE TABLE matakuliah(
        KodeMK VARCHAR(10) PRIMARY KEY,
        NamaMK VARCHAR(50),
        SKS INT,
        Semester INT
    );

    INSERT INTO matakuliah(KodeMK, NamaMK, SKS, Semester)
    VALUES
    ('MK001', 'Big data & Data Analytic', 4, 1),
    ('MK002', 'Coding Machine Learning', 3, 1),
    ('MK003', 'Sistem Basis Data', 3, 1),
    ('MK004', 'Sistem Komputer', 3, 2),
    ('MK005', 'Matematika Diskrit', 3, 2),
    ('MK006', 'Data Warehouse', 4, 2);
}

-- Nilai
{
    CREATE TABLE nilai (
        IDNilai VARCHAR(10) PRIMARY KEY,
        NIM VARCHAR(10),
        KodeMK VARCHAR(10),
        Nilai DECIMAL(4,2),
        Semester INT,
        FOREIGN KEY (NIM) REFERENCES mahasiswa(NIM),
        FOREIGN KEY (KodeMK) REFERENCES matakuliah(KodeMK)
    );

    INSERT INTO nilai(IDNilai, NIM, KodeMK, Nilai, Semester)
    VALUES
    ('N001', 'M230', 'MK001', 80, 1),
    ('N002', 'M230', 'MK002', 76, 1),
    ('N003', 'M231', 'MK003', 90, 1),
    ('N004', 'M232', 'MK001', 77, 1),
    ('N005', 'M232', 'MK003', 79, 1),
    ('N006', 'M233', 'MK005', 65, 2),
    ('N007', 'M234', 'MK004', 93, 2),
    ('N008', 'M234', 'MK005', 78, 2),
    ('N009', 'M235', 'MK005', 60, 2),
    ('N010', 'M235', 'MK006', 58, 2);
}

-- Jadwal
{
    CREATE TABLE jadwal(
        IDJadwal VARCHAR(10) PRIMARY KEY,
        Hari ENUM('Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'),
        Jam TIME,
        KodeMK VARCHAR(10),
        NIP VARCHAR(10),
        Ruangan VARCHAR(20),
        FOREIGN KEY (KodeMK) REFERENCES matakuliah(KodeMK),
        FOREIGN KEY (NIP) REFERENCES dosen(NIP)
    );

    INSERT INTO jadwal(IDJadwal, Hari, Jam, KodeMK, NIP, Ruangan)
    VALUES
    ('JD01', 'Selasa', '8:40', 'MK001', 'D001', 'D408'),
    ('JD02', 'Senin', '10:30', 'MK002', 'D004', 'B205'),
    ('JD03', 'Rabu', '12:50', 'MK003', 'D002', 'C302'),
    ('JD04', 'Kamis', '9:00', 'MK004', 'D001', 'A101'),
    ('JD05', 'Jumat', '14:40', 'MK005', 'D001', 'E503'),
    ('JD06', 'Sabtu', NULL, 'MK006', 'D003', 'A101');
}

-- Sub Query (SUM, MIN, MAX and AVG)
{
    -- Tampilkan nama mahasiswa dengan nilai rata rata terendah
    SELECT m.Nama_Mhs, AVG(n.Nilai) AS RataRataNilai FROM mahasiswa m JOIN nilai n ON m.NIM = n.NIM GROUP BY n.NIM ORDER BY RataRataNilai ASC LIMIT 1;

    -- Tampilkan daftar matakuliah yang diambil oleh mahasiswa dengan NIM "M232"
    SELECT NamaMK, NIM FROM matakuliah mk JOIN nilai n ON mk.KodeMK = n.KodeMK WHERE NIM = 'M232';

    -- Tampilkan daftar matakuliah yang tidak diajarkan oleh dosen "D001"
    SELECT * FROM jadwal j JOIN matakuliah mk ON j.KodeMK = mk.KodeMK WHERE j.NIP != 'D001';
}

-- DML
{
    -- Tampilkan nama matakuliah yang memiliki jumlah SKS = 3 DAN merupakan matakuliah semester 1
    SELECT NamaMK 
    FROM matakuliah 
    WHERE SKS = 3 AND semester = 1;

    -- Tampilkan nama & email dosen yang berasal dari Jakarta
    SELECT nama_dosen, email
    FROM dosen
    WHERE alamat LIKE '%Jakarta%';
}

-- DDL
{
    -- Ubah kolom email pada table mahasiswa menjadi email_mahasiswa
    ALTER TABLE mahasiswa
    CHANGE COLUMN email email_mahasiswa VARCHAR(100) NOT NULL;

    -- Ubah tipe data pada kolom jurusan di table mahasiswa menjadi ENUM('Informatika', 'Teknik Informatika', 'Sistem Informasi');
    ALTER TABLE mahasiswa
    MODIFY COLUMN Jurusan ENUM('Informatika', 'Teknik Informatika', 'Sistem Informasi');
}

-- JOIN
{
    SELECT 
        mahasiswa.Nama_Mhs AS Nama_Mahasiswa, 
        mahasiswa.Alamat AS Alamat
    FROM 
        mahasiswa
    JOIN 
        dosen
    ON 
        mahasiswa.Alamat = dosen.Alamat;
}