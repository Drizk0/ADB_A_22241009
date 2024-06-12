--- Nama  : Damar Rizky Mustafa
--- Nim	  : 22241009
--- Modul : 3

-- Menggunakan Database

-- order by

-- Mengambil nama produk  dan qty urutkan berdasarkan qty
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty;

-- Mengambil nama produk dan qty urutkan berdasarkan qty diikuti dengan nama_produk
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty, nama_produk;

-- Latihan
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tgl_transaksi;
SELECT * FROM ms_pelanggan_dqlab  ORDER BY  nama_pelanggan;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat;

-- mengambil nama produk dan quantity urutkan berdasarkan qty besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC;

-- mengambil nama produk dan qty urutkan berdasarkan qty besar ke kecil nama produk kecil ke besar
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC, nama_produk ASC;

-- latihan
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi DESC, qty ASC;
SELECT * FROM ms_pelanggan_dqlab  ORDER BY  nama_pelanggan DESC;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat DESC;

-- Menggunakan hasil perhitungan menggunakan order by
-- mengambil nama_produk, qty, harga, dan total bayar urutkan berdasarkan total bayar besar ke kecil
SELECT nama_produk, qty, harga, qty*harga AS total_bayar FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;

SELECT nama_produk, qty, harga, 
	diskon_persen, (diskon_persen/100)*harga AS diskon,
	qty*(harga - (diskon_persen/100)*harga) AS total_bayar 
FROM tr_penjualan_dqlab 
ORDER BY total_bayar DESC; 

-- where dan order by
-- mengambil nama produk, qty dari produk berawalan f urut berdasarkan qty besar ke kecil
SELECT nama_produk , qty FROM tr_penjualan_dqlab WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;

-- latiham
SELECT * FROM tr_penjualan_dqlab WHERE diskon_persen != 0 ORDER BY harga DESC;
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga  >=100000 ORDER BY harga DESC;
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >=100000 OR nama_produk LIKE 'T%' ORDER BY diskon_persen DESC;

-- FUNGSI AGREGASI
-- hitung jumlah nilai qty dari seluruh row di tabel penjualan
SELECT sum(qty)AS total_qty FROM tr_penjualan_dqlab;

-- Hitung jumlah seluruh row pada tabel penjualan
SELECT count(*)AS jumlah_row FROM tr_penjualan_dqlab;

-- Hitung penjumlahan nilai qty dan jumlah seluruh row pada tabel penjualan
SELECT sum(qty), count(*)FROM tr_penjualan_dqlab;

-- Hitung rata-rata nilai maksimum dan minimum dari qty pada tabel penjualan
SELECT avg(qty), max(qty), min(qty) FROM tr_penjualan_dqlab;

-- Hitung jumlah nilai unik dari nama produk di tabel penjualan
SELECT count(distinct nama_produk) FROM tr_penjualan_dqlab;

SELECT count(nama_produk) FROM tr_penjualan_dqlab;

-- Hitung jumlah nilai unik dan seluruh row dari tabel penjualan
SELECT count(*), count(distinct nama_produk) FROM tr_penjualan_dqlab;


-- menampilkan field nama_produk dan fungsi agregasi maksimum qty dari tabel penjualan
SELECT nama_produk, max(qty) FROM tr_penjualan_dqlab;

-- GROUP BY
-- ambil hasil pengelompokkan nilai nilai kolom nama produk di tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab
GROUP BY nama_produk;

SELECT nama_produk FROM tr_penjualan_dqlab;

-- ambil hasil pengelompokkan dari nama produk dan qty di tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan_dqlab 
GROUP BY nama_produk, qty;

-- ambil hasil penjualan qty dari pengelompokkan nama produk terhadap semua row di tabel penjualan
SELECT nama_produk, sum(qty)FROM tr_penjualan_dqlab 
GROUP BY nama_produk
ORDER BY sum(qty)DESC;


-- HAVING
-- ambil jumlah qty > 2 dari hasil pengelompokkan nama produk di tabel penjualan
SELECT nama_produk, sum(qty)
FROM tr_penjualan_dqlab 
GROUP BY nama_produk 
HAVING sum(qty) > 2;

-- LATIHAN 
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING sum(qty) > 4;
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING sum(qty) = 9;
SELECT nama_produk, qty *(harga-(diskon_persen / 100)*harga) AS total_bayar
FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;



