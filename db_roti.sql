INSERT INTO jenis_kue(kode_jenis_kue, nama_jenis_kue, jangka_expired)
VALUES
    ('KUBA', 'Kue Basah', '3 hari'),
    ('KUKE', 'Kue Kering', '3 bulan');

INSERT INTO kue(kode_kue, nama_kue, harga_satuan, kode_jenis_kue)
VALUES
    ('BABZ', 'Brownies Banana Bizz', 30000, 'KUBA'),
    ('BAKR', 'Brownies Bakar', 28000, 'KUKE'),
    ('BDUO', 'Bangket Duo', 20000, 'KUKE'),
    ('BLCK', 'Pisang Bolen Cokelat', 28000, 'KUBA'),
    ('BLKJ', 'Pisang Bolen Keju', 28000, 'KUBA'),
    ('BLUE', 'Brownies Blueberry', 32000, 'KUBA'),
    ('CHCR', 'Brownies Cheese Cream', 52000, 'KUBA'),
    ('CHRL', 'Cheese Roll', 37000, 'KUKE'),
    ('CHST', 'Cheese Stick', 27000, 'KUKE'),
    ('COMA', 'Brownies Cocho Marble', 30000, 'KUBA'),
    ('GREE', 'Brownies Green Marble', 32000, 'KUBA'),
    ('KTBK', 'Cake Ketan Bakar', 26000, 'KUBA'),
    ('ORIG', 'Brownies Original', 26000, 'KUBA'),
    ('PINK', 'Brownies Pink Marble', 30000, 'KUBA'),
    ('PNBT', 'Peanut Butter', 28000, 'KUBA'),
    ('SRKY', 'Brownies Srikaya Pandan', 24000, 'KUKE'),
    ('SWST', 'Sweet Stik', 32000, 'KUBA'),
    ('TRMS', 'Brownies Tiramisu Marble', NULL, 'KUBA');

INSERT INTO penjualan(no_nota, tgl_jual, total_jual, discount, total_bayar, kode_outlet)
VALUES
    ('J008', '2013-01-01', 676000, 10, 608400, 'ABR'),
    ('J009', '2013-01-01', 352000, 10, 316800, 'ABR'),
    ('J010', '2013-01-01', 131000, 0, 131000, 'ABR'),
    ('J011', '2013-01-02', 141000, 0, 141000, 'ABR'),
    ('R001', '2013-01-01', 270000, 0, 270000, 'ABC'),
    ('R002', '2013-01-01', 104000, 0, 104000, 'ABC'),
    ('R003', '2013-01-02', 63000, 0, 63000, 'ABC');

INSERT INTO outlet(kode_outlet, nama_outlet, alamat, telp)
VALUES 
    ('ABC', 'AB Karno', 'Jl Sleman No 2', '0274123456'),
    ('ABD', 'AB Harto', 'Jl Bantul No 3', '0274222222'),
    ('ABP', 'AB Paskal', 'Jl Wonosari No 4', '0274111111'),
    ('ABR', 'AB Buono', 'Jl Kraton No 5', '0274888888'),
    ('ABT', 'AB Kusuma', 'Jl Kusuma No 5', '0274999999');

INSERT INTO detail_jual(no_nota, kode_kue, jumplah, harga_satuan, subtotal)
VALUES
    ('J008', 'BLUE', 3, 32000, 96000),
    ('J008', 'CHCR', 10, 52000, 520000),
    ('J008', 'COMA', 2, 30000, 60000),
    ('J009', 'BABZ', 4, 30000, 120000),
    ('J009', 'BLUE', 4, 32000, 128000),
    ('J009', 'ORIG', 4, 26000, 104000),
    ('J010', 'CHCR', 2, 52000, 104000),
    ('J010', 'CHRL', 1, 37000, 37000),
    ('J011', 'CHCR', 2, 62000, 104000),
    ('J011', 'CHST', 1, 27000, 27000),
    ('R001', 'BLKJ', 3, 28000, 84000),
    ('R001', 'GREE', 3, 32800, 96000),
    ('R001', 'PINK', 3, 30000, 90000),
    ('R002', 'BUKJ', 2, 28000, 56000),
    ('R002', 'SWST', 2, 24000, 48000),
    ('R003', 'CHRL', 1, 37000, 37000),
    ('R003', 'ORIG', 1, 26000, 26000);