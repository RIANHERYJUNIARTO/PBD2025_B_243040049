--menampilkan semua data pada tabel product
SELECT* FROM Production.Product;
--menampilkan Nama ProdutNumber dan listprrice
SELECT Name,ProductNumber,ListPrice
FROM Production.Product

--menampilkan data menggunakan alias kolom
SELECT Name AS [Nama Barang], ListPrice AS 'Harga Jual'
FROM production.Product;

-- menampilkan hargabaru = Listprice * 1.1
SELECT Name ListPrice,(ListPrice * 1.1) AS HargaBaru 
FROM Production.product;

--menampilkan data dengan menggabungkan string
SELECT Name + '('+ ProductNumber +')' AS ProdukLengkap
FROM Production.Product

--menampilkan produk yang berwarna red
SELECT Name Color,ListPrice
FROM Production.Product
Where Color = 'red';

--menampilkan produk yang ListPrice nya lebih dari 1000
SELECT Name,ListPrice
FROM Production.Product
Where ListPrice <1000;

--menampilkan produk yang berwarna black dan listpricce nya lebih dari 500
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'black' AND ListPrice > 500;

--menampilkan produk yang warnanya red,blue, atau black

 SELECT Name,Color
 From Production.Product
 Where Color IN ('red','blue','black');

 --menampilkan data yang nama nya mengandung kata 'Road'
 SELECT Name,ProductNumber
 From Production.Product
 Where Name LIKE '%Bike%';

 --Agregasi dan pengelompokan
 --menghitung tata Baris
 SELECT COUNT(*) AS TotalProduk
 From Production.Product

 --mengelompokan warna produk dan jumlahnya
 SELECT Color, COUNT(*) AS JumlahProduk
 FROM Production.Product
 Group by Color;

 --menampilkan ProductID, jumlah orderQTY, rata rata unitprice
 SELECT ProductID, sum(OrderQTY) AS TotalTerjual,AVG(UnitPrice) AS RataRataHarga
 From sales.SalesOrderDetail
 group by ProductID;

 Select *
 From sales.SalesOrderDetail

 --menampilkan data dengan grouping lebih dari satu kolom 
 SELECT Color,size, COUNT(*) AS Jumlah
 FROM Production.Product
 Group by Color, Size;

 SELECT *
 FROM Production.Product

--filter hasil Agregasi
--menampilkan warna produk yang jumlahnya lebih dari 20
SELECT Color, count(*) AS Jumlah
FROM Production.Product
group by Color
Having Count(*) >2;

--menampilkan warna produk yang ListPrice > 500 jumlahnya 10
SELECT Color, count(*) AS Jumlah
From Production.Product
WHERE ListPrice > 500
GROUP BY Color
Having Count(*)>1;


--menampilkan ProductID yang jumlah OrderQTY nya lebih dari 1000
SELECT ProductID,sum(OrderQTY) AS RataRataBeli
From Sales.SalesOrderDetail
Group by ProductID
Having Sum(OrderQty) >10;

--menampilkan SpecialOfferID yang rata rata orderqty nya kurang dari 2
SELECT SpecialOfferID,AVG(OrderQTY) AS RataRataBeli
from Sales.SalesOrderDetail
group by SpecialOfferID
Having AVG(OrderQty) >2;

--menampilkan warna yang ListPrice lebih dari 3000 menggunakan MAX
SELECT Color
From Production.Product
Group by Color
Having MAX(ListPrice) > 3000;

--advanced select data order by
--menampilkan Jobtitle tanpa duplikat
SELECT DISTINCT JobTitle
From HumanResources.Employee;

--menampilkan 5 data teratas nama produk termahal 
SELECT TOP 5 Name, ListPrice
From Production.Product
Order by ListPrice DESC;

SELECT TOP 5 Name, ListPrice
From Production.Product
Order by ListPrice ASC;

--offset Fetch
SELECT Name, ListPrice 
From Production.Product
order by ListPrice Desc
OFFSET 2 rows 
Fetch next 4 rows ONLY;

SELECT Name, ListPrice 
From Production.Product
order by ListPrice DESC;

SELECT TOP 3 Color, Sum(ListPrice) AS TotalNilaiStok
From Production.Product
Where ListPrice > 0
Group by Color
order by TotalNilaiStok DESC;

-- Tugas Mandiri
--1
Select ProductID, sum(LineTotal) AS TotalUang --menampilkan ProductID & LineTotal AS TotalUang dan setiap kelompok produk, SQL melakukan SUM(LineTotal).
From Sales.SalesOrderDetail --SQL mengambil semua data dari kolom SalesOrderDetail.
Group by productID; --Mengelompok kan baris berdasarkan ProductID.


--2
SELECT ProductID,sum(LineTotal) AS TotalUAng --Menampilkan ProductID dan total uangnya, lalu menghitung total uang per produk dari baris yang sudah lolos filter.
From Sales.SalesOrderDetail -- Ambil semua data dari SalesOrderDetail.
Where OrderQty >=2 -- SQL menyaring baris – hanya transaksi dengan OrderQty 
Group by ProductID; --Setelah disaring, data dikelompokkan berdasarkan ProductID.



--3
SELECT ProductID,sum(LineTotal) AS TotalUang -- Menampilkan total uang dari tiap produk.
From Sales.SalesOrderDetail -- Mengambil data dari SalesOrderDetail.
WHERE OrderQty >=2 -- Filter: hanya transaksi dengan jumlah beli minimal 2.
Group by ProductID; -- Mengelompokkan berdasarkan ProductID (tahap inti dari nomor 3).


--4
SELECT ProductID, sum(LineTotal) AS TotalUang -- Menampilkan ProductID & total pendapatan.
FROM Sales.SalesOrderDetail -- Mengambil data dari tabel SalesOrderDetail.
WHERE OrderQty >2. -- Filter awal: hanya transaksi OrderQty >= 2.
Group by ProductID -- SQL mengelompokkan baris berdasarkan ProductID.
HAVING SUM(LineTotal) > 50000;-- Filter hasil agregasi: hanya produk dengan total > 50.000.


--5
--mengurutkan  pendapatan tertinggi
SELECT ProductID, sum(LineTotal) AS TotalUang -- Menampilkan ProductID & total pendapatan.
FROM Sales.SalesOrderDetail -- Sumber data SalesOrderDetail.
Group by ProductID -- Filter baris sebelum pengelompokan.
ORDER BY TotalUang DESC;-- Mengurutkan dari pendapatan terbesar ke terkecil.

--6
--menampilkan 10 Produk teratas
SELECT TOP 10 ProductID, sum(LineTotal) AS TotalUang  -- Menampilkan 10 produk dengan pendapatan tertinggi.
FROM Sales.SalesOrderDetail -- Mengambil semua data transaksi.
Group by ProductID -- Mengelompokkan baris berdasarkan ProductID.
ORDER BY TotalUang DESC; -- Urutkan dari total pendapatan tertinggi.




