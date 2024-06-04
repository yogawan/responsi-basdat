create database db_latihan;
use db_latihan;

-- DDL
{
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
}

-- DML
{

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
}

-- FUNGSI
{
    -- Membuat tabel sales
    CREATE TABLE sales (
        id INT PRIMARY KEY,
        product VARCHAR(50),
        quantity INT,
        price DECIMAL(10, 2)
    );

    -- Mengisi tabel sales dengan data sampel
    INSERT INTO sales (id, product, quantity, price) VALUES
    (1, 'ProductA', 10, 20.00),
    (2, 'ProductB', 5, 15.00),
    (3, 'ProductA', 7, 20.00),
    (4, 'ProductC', 12, 30.00),
    (5, 'ProductB', 8, 15.00);

    -- Kueri untuk menghitung total penjualan
    SELECT SUM(quantity * price) AS total_sales
    FROM sales;

    -- Kueri untuk mendapatkan harga terendah
    SELECT MIN(price) AS lowest_price
    FROM sales;

    -- Kueri untuk mendapatkan harga tertinggi
    SELECT MAX(price) AS highest_price
    FROM sales;

    -- Kueri untuk menghitung jumlah baris dalam tabel sales
    SELECT COUNT(*) AS total_rows
    FROM sales;

    -- Kueri untuk menghitung jumlah produk unik
    SELECT COUNT(DISTINCT product) AS total_unique_products
    FROM sales;

    -- Kueri untuk menghitung harga rata-rata
    SELECT AVG(price) AS average_price
    FROM sales;

    -- Kueri yang menggabungkan beberapa fungsi agregat
    SELECT 
        SUM(quantity * price) AS total_sales,
        MIN(price) AS lowest_price,
        MAX(price) AS highest_price,
        AVG(price) AS average_price
    FROM sales;

    -- Kueri untuk mendapatkan statistik agregat per produk
    SELECT 
        product,
        SUM(quantity * price) AS total_sales,
        MIN(price) AS lowest_price,
        MAX(price) AS highest_price,
        AVG(price) AS average_price,
        COUNT(*) AS total_transactions
    FROM sales
    GROUP BY product;
}

-- JOIN *
{
    -- Membuat tabel sales
    CREATE TABLE sales (
        id INT PRIMARY KEY,
        product_id INT,
        quantity INT,
        price DECIMAL(10, 2)
    );

    -- Membuat tabel products
    CREATE TABLE products (
        product_id INT PRIMARY KEY,
        product_name VARCHAR(50)
    );

    -- Mengisi tabel sales dengan data sampel
    INSERT INTO sales (id, product_id, quantity, price) VALUES
    (1, 1, 10, 20.00),
    (2, 2, 5, 15.00),
    (3, 1, 7, 20.00),
    (4, 3, 12, 30.00),
    (5, 2, 8, 15.00);

    -- Mengisi tabel products dengan data sampel
    INSERT INTO products (product_id, product_name) VALUES
    (1, 'ProductA'),
    (2, 'ProductB'),
    (3, 'ProductC'),
    (4, 'ProductD');

    -- INNER JOIN
    SELECT *
    FROM sales
    INNER JOIN products
    ON sales.product_id = products.product_id;

    -- LEFT JOIN
    SELECT *
    FROM sales
    LEFT JOIN products
    ON sales.product_id = products.product_id;

    -- RIGHT JOIN
    SELECT *
    FROM sales
    RIGHT JOIN products
    ON sales.product_id = products.product_id;
}

-- JOIN
{
    -- Membuat tabel sales
    CREATE TABLE sales (
        id INT PRIMARY KEY,
        product_id INT,
        quantity INT,
        price DECIMAL(10, 2)
    );

    -- Membuat tabel products
    CREATE TABLE products (
        product_id INT PRIMARY KEY,
        product_name VARCHAR(50)
    );

    -- Mengisi tabel sales dengan data sampel
    INSERT INTO sales (id, product_id, quantity, price) VALUES
    (1, 1, 10, 20.00),
    (2, 2, 5, 15.00),
    (3, 1, 7, 20.00),
    (4, 3, 12, 30.00),
    (5, 2, 8, 15.00);

    -- Mengisi tabel products dengan data sampel
    INSERT INTO products (product_id, product_name) VALUES
    (1, 'ProductA'),
    (2, 'ProductB'),
    (3, 'ProductC'),
    (4, 'ProductD');

    -- INNER JOIN
    SELECT 
        sales.id,
        products.product_name,
        sales.quantity,
        sales.price
    FROM 
        sales
    INNER JOIN 
        products
    ON 
        sales.product_id = products.product_id;

    -- LEFT JOIN
    SELECT 
        sales.id,
        products.product_name,
        sales.quantity,
        sales.price
    FROM 
        sales
    LEFT JOIN 
        products
    ON 
        sales.product_id = products.product_id;

    -- RIGHT JOIN
    SELECT 
        sales.id,
        products.product_name,
        sales.quantity,
        sales.price
    FROM 
        sales
    RIGHT JOIN 
        products
    ON 
        sales.product_id = products.product_id;
}

-- SUB KUERI
{
    -- Membuat tabel sales
    CREATE TABLE sales (
        id INT PRIMARY KEY,
        product_id INT,
        quantity INT,
        price DECIMAL(10, 2)
    );

    -- Membuat tabel products
    CREATE TABLE products (
        product_id INT PRIMARY KEY,
        product_name VARCHAR(50)
    );

    -- Mengisi tabel sales dengan data sampel
    INSERT INTO sales (id, product_id, quantity, price) VALUES
    (1, 1, 10, 20.00),
    (2, 2, 5, 15.00),
    (3, 1, 7, 20.00),
    (4, 3, 12, 30.00),
    (5, 2, 8, 15.00);

    -- Mengisi tabel products dengan data sampel
    INSERT INTO products (product_id, product_name) VALUES
    (1, 'ProductA'),
    (2, 'ProductB'),
    (3, 'ProductC'),
    (4, 'ProductD');

    -- Subquery dalam SELECT
    SELECT 
        product_name,
        (SELECT SUM(quantity * price) FROM sales WHERE sales.product_id = products.product_id) AS total_sales
    FROM 
        products;

    -- Subquery dalam WHERE
    SELECT 
        product_name
    FROM 
        products
    WHERE 
        product_id IN (SELECT product_id FROM sales GROUP BY product_id HAVING SUM(quantity) > 50);

    -- Subquery dalam FROM
    SELECT 
        sub.product_id,
        products.product_name,
        sub.total_sales
    FROM 
        (SELECT product_id, SUM(quantity * price) AS total_sales FROM sales GROUP BY product_id) AS sub
    JOIN 
        products
    ON 
        sub.product_id = products.product_id;

    -- Subquery dengan EXISTS
    SELECT 
        product_name
    FROM 
        products
    WHERE 
        EXISTS (SELECT 1 FROM sales WHERE sales.product_id = products.product_id);

    -- Contoh 1: Filtering Data dengan Subquery
    SELECT customer_id, SUM(amount) AS total_spent
    FROM transactions
    GROUP BY customer_id
    HAVING total_spent > (SELECT AVG(amount) FROM transactions);

    -- Contoh 2: Subquery di WHERE IN
    SELECT product_name
    FROM products
    WHERE product_id IN (SELECT product_id FROM sales WHERE category = 'Electronics');

    -- Contoh 3: Subquery di FROM
    SELECT month, SUM(amount) AS total_amount
    FROM (
        SELECT MONTH(transaction_date) AS month, amount
        FROM transactions
    ) AS monthly_data
    GROUP BY month;

    -- Contoh 4: Subquery EXISTS
    SELECT customer_id, customer_name
    FROM customers c
    WHERE EXISTS (
        SELECT 1
        FROM transactions t
        WHERE t.customer_id = c.customer_id
        AND t.category = 'Fashion'
    );

    -- Contoh 5: Subquery Terkait
    SELECT employee_id, employee_name, department_id, salary
    FROM employees e
    WHERE salary > (
        SELECT AVG(salary)
        FROM employees
        WHERE department_id = e.department_id
    );
}

-- MANAJEMEN USER
{
    -- Membuat Pengguna Baru
    CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';

    -- Memberikan Hak Istemewa kepada Pengguna
    GRANT SELECT, INSERT ON mydatabase.* TO 'myuser'@'localhost';

    -- Membatalkan Hak Istimewa dari Pengguna
    REVOKE SELECT ON mydatabase.* FROM 'myuser'@'localhost';

    -- Menghapus Pengguna
    DROP USER 'username'@'localhost';

    -- Menampilkan Hak Istimewa Pengguna
    SHOW GRANTS FOR 'myuser'@'localhost';

    -- Menetapkan Hak Istimewa Global
    GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';

    -- Menyegarkan Hak Istimewa
    FLUSH PRIVILEGES;

    -- Melihat List User
    SELECT user, host FROM mysql.user;
}