use KampusDB

--cross join
--menampilkan semua kombinasi mahasiswa dan matakuliah
select NamaMahasiswa From Mahasiswa
select NamaMK From MataKuliah

select M.NamaMahasiswa, MK.NamaMK
from Mahasiswa as M
cross join MataKuliah as MK

--menampilkan semua kombinasi dosen dan ruangan
select D.NamaDosen, R.KodeRuangan
From Dosen D
Cross join Ruangan R

--left join 
--menampilkan semuja mahasiswa termasuk yang belum mengambil krs
select M.NamaMahasiswa, K.MataKuliahID
from Mahasiswa M
left join KRS K on M.MahasiswaID = K.MahasiswaID

--menampilkan semua mata kuliah termasuk yang belum punya jadwal

select MK.NamaMK, j.Hari
from MataKuliah MK
left join JadwalKuliah J on MK.MataKuliahID =j.MataKuliahID

--right join 
--menampilkan semua jadwal ,walaupun tidak ada matakuliah
select MK.NamaMK, J.Hari
from MataKuliah MK 
right join JadwalKuliah j on MK.MataKuliahID =j.MataKuliahID

--menampilkan semua ruangan ,apakah ruangan tersebut dipakai atau tidak 
select R.KodeRuangan, J.Hari
from JadwalKuliah j
right join Ruangan R on j.RuanganID = R.RuanganID

--inner join 
--menampilkan nama mahasiswa dan matakuliahnya , tapi lewat tabel krs
select*from Mahasiswa
select*from KRS
select*from MataKuliah

select M.NamaMahasiswa, MK.NamaMK
from KRS k
inner join Mahasiswa M on K.MahasiswaID = M.MahasiswaID
inner join MataKuliah MK on K.MataKuliahID = MK.MataKuliahID

--Menampilkan mata kuliah dan dosen pengampunya
select MK.NamaMK , D.NamaDosen
from MataKuliah MK
join Dosen D on MK.DosenID =D.DosenID

--menampilkan jadwal lengkap
SELECT MK.NamaMK, D.NamaDosen, R.KodeRuangan, J.Hari
FROM JadwalKuliah J
INNER JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID
INNER JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--menampilkan nama mahasiswa matkul dan nilai akhirnya
select M.NamaMahasiswa, MK.NamaMK, N.NilaiAkhir
from Nilai N
inner join Mahasiswa M on N.MahasiswaID = M.MahasiswaID
inner join MataKuliah MK on N.MataKuliahID =MK.MataKuliahID

--menampilkan dosen dan matakuliah yang dia ajar
select D.NamaDosen, MK.NamaMK
from Dosen D
inner join MataKuliah MK  on D.DosenID = D.DosenID

--self join
--mencari Pasangan Mahasiswa dari prodi yang sama

select A.NamaMahasiswa AS Mahasiswa1,
		B.NamaMahasiswa AS Mahasiswa2,
		A.Prodi
from Mahasiswa A
inner join Mahasiswa B on A.Prodi = B.Prodi
Where A.MahasiswaID < B.MahasiswaID --agar tidak ada pasangan yang sama





--Latihan
--1
SELECT M.NamaMahasiswa, M.Prodi , N.NilaiAkhir
FROM Mahasiswa  M
INNER JOIN Nilai N on M.MahasiswaID = N.MahasiswaID

--2
SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D 
INNER JOIN Ruangan R on D.DosenID = D.DosenID

--3
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen
FROM Mahasiswa M
INNER JOIN KRS K ON M.MahasiswaID = K.MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON M.MahasiswaID = D.DosenID;

--4
SELECT MK.NamaMK, D.NamaDosen, J.hari
FROM JadwalKuliah J
INNER JOIN MataKuliah MK ON J.MataKuliahID =MK.MataKuliahID
INNER JOIN Dosen D ON  J.DosenID = D.DosenID

--5
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen, N.NilaiAkhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;


