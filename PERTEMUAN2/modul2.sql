--buat database tokoretaildb
CREATE DATABASE TokoRetailDB;

--gunakan db tokoretaildb
use TokoRetailDB;

--membuat table kategori produk
CREATE TABLE KategoriProduk (
KategoriID INT IDENTITY(1,1) PRIMARY KEY,
NamaKategori VARCHAR(100) NOT NULL UNIQUE
);

DROP TABLE KategoriProduk;


--MEMBUAT TABLE PRODUK
CREATE TABLE Produk (
	ProdukID INT IDENTITY(1001,1) PRIMARY KEY,
	SKU VARCHAR(20)NOT NULL UNIQUE,
	NamaProduk VARCHAR(150) NOT NULL,
	Harga DECIMAL(10,2) NOT NULL,
	Stok int NOT NULL,
	KategoriID INT NULL,

--HARGANYA GABOLEH NEGATIF
CONSTRAINT CHK_HargaPositif CHECK (Harga >= 0),

CONSTRAINT CHK_StokPositif CHECK (Stok >=0),

constraint FK_Produk_kategori
FOREIGN KEY (KategoriID)
REFERENCES KategoriProduk(KategoriID)

);

--MASUKIN DATA KATEGORI PRODUK

INSERT INTO KategoriProduk (NamaKategori)
VALUES 
('elektronik');

INSERT INTO KategoriProduk (NamaKategori)
VALUES 
('pakaian'),
('buku');

INSERT INTO KategoriProduk (NamaKategori)
VALUES 
('buku');



--MENAMPILKAN TABEL KategoriProduk
SELECT *
FROM KategoriProduk;

INSERT INTO Produk(SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES 
('ELEC-001', 'Laptop Gaming', 15000000.00,50, 1);

INSERT INTO Produk(SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('ELEC-002', 'HP-GAMING', 5000000.00,50 ,1);

--MENAMPILKAN TABEL PRODUK
SELECT * 
FROM Produk;

--imengubah data stok laptop gaming  menjadi 30
UPDATE Produk
SET Stok = 30
WHERE ProdukID = 1003;

-- menghapus data hp gaming 
BEGIN TRANSACTION;

DELETE FROM Produk 
WHERE ProdukID = 1004;

COMMIT TRANSACTION

INSERT INTO Produk(SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('BAJU-001', 'Baju Putih', 50000.00,50 ,3);

INSERT INTO Produk(SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('BAJU-002', 'Baju Hitam', 100000.00,50 ,3);



--menghapus kaos putih

BEGIN TRAN ;

DELETE FROM Produk
WHERE ProdukID = 1005;

ROLLBACK TRANSACTION;

COMMIT TRANSACTION;
