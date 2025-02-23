# Database-Perpustakaan-Sekolah
📚 Database Perpustakaan Sekolah
📌 Deskripsi
Repository ini berisi file SQL untuk sistem perpustakaan sekolah yang mencakup tabel buku, siswa, dan peminjaman. Sistem ini mendukung fitur seperti peminjaman buku, pengembalian buku dengan update stok otomatis, serta beberapa stored procedures untuk mengelola data.

📁 Struktur Database
Database ini terdiri dari tiga tabel utama:

1. buku – Menyimpan informasi buku yang tersedia di perpustakaan.
2. siswa – Menyimpan data siswa yang dapat meminjam buku.
3. peminjaman – Menyimpan data peminjaman dan pengembalian buku.

🔧 Fitur yang Tersedia
✅ Membuat database db_perpus

✅ Menambahkan data ke dalam tabel menggunakan query INSERT dan Stored Procedure

✅ Stored Procedure untuk UPDATE & DELETE pada setiap tabel

✅ Stored Procedure untuk menampilkan seluruh data dari setiap tabel

✅ Trigger untuk mengurangi stok buku saat dipinjam

✅ Trigger untuk menambah stok buku saat dikembalikan

✅ Stored Procedure untuk mengembalikan buku dengan CURRENT DATE sebagai tanggal pengembalian

✅ Stored Procedure untuk menampilkan daftar siswa yang pernah meminjam buku

✅ Stored Procedure untuk menampilkan semua siswa, termasuk yang belum pernah meminjam buku

✅ Stored Procedure untuk menampilkan semua buku, termasuk yang belum pernah dipinjam

📌 Catatan
- File ini menggunakan stored procedures dan triggers, pastikan fitur ini diaktifkan di MySQL sebelum menjalankan.
- Jika ada kesalahan, pastikan tidak ada tabel dengan nama yang sama sebelum import.

📜 Lisensi
Proyek ini bersifat open-source dan dapat digunakan untuk keperluan belajar atau pengembangan lebih lanjut.
