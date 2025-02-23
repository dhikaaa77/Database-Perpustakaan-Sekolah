-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Feb 2025 pada 03.30
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpus`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_buku` (`IDBuku` INT)   BEGIN
	DELETE FROM buku WHERE ID_Buku = IDBuku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_peminjaman` (`IDPeminjaman` INT)   BEGIN
	DELETE FROM peminjaman WHERE ID_Peminjaman = IDPeminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_siswa` (`IDSiswa` INT)   BEGIN
	DELETE FROM siswa WHERE ID_Siswa = IDSiswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_buku` (`pJudul` VARCHAR(50), `pPenulis` VARCHAR(50), `pKategori` VARCHAR(50), `pStok` INT)   BEGIN
    INSERT into buku (Judul_Buku, Penulis, Kategori, Stok) VALUES (pJudul, pPenulis, pKategori, pStok);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_peminjaman` (`pIdSiswa` INT, `pIdBuku` INT, `pTglPinjam` DATE, `pTglKembali` DATE, `pStatus` VARCHAR(50))   BEGIN
    insert INTO peminjaman (ID_Siswa, IDBuku, Tanggal_Pinjam, Tanggal_Kembali, Status) VALUES (pIdSiswa, pIdBuku, pTglPinjam, pTglKembali, pStatus);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_siswa` (`pNama` VARCHAR(50), `pKelas` VARCHAR(10))   BEGIN
    INSERT INTO siswa (Nama, Kelas) values (pNama, pKelas);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kembalikanbuku` (`IDPeminjaman` INT)   BEGIN
	UPDATE peminjaman
    SET Status = 'Dikembalikan', Tanggal_Kembali = CURRENT_DATE
    WHERE ID_Peminjaman = IDPeminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SemuaBuku` ()   BEGIN 
	SELECT b.ID_Buku, b.Judul_Buku, b.Penulis, b.Kategori, b.Stok,
    	CASE 
        	WHEN p.IDBuku IS NULL THEN 'Belum Pernah Dipinjam'
            ELSE 'Pernah Dipinjam'
		END AS Status
	FROM buku b
    LEFT JOIN peminjaman p ON b.ID_Buku = p.IDBuku
    GROUP BY b.ID_Buku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SemuaSiswa` ()   BEGIN
	SELECT s.ID_Siswa, s.Nama, s.Kelas,
    	CASE
        	WHEN p.ID_Siswa IS NULL THEN 'Belum Pernah Meminjam'
            ELSE 'Pernah Meminjam'
		END AS Status
	FROM siswa s
    LEFT JOIN peminjaman p ON s.ID_Siswa = p.ID_Siswa
    GROUP BY s.ID_Siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SiswaPernahMinjam` ()   BEGIN
	SELECT DISTINCT s.ID_Siswa, s.Nama, s.Kelas
    FROM siswa s
    INNER JOIN peminjaman p ON s.ID_Siswa = p.ID_Siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilkan_buku` ()   BEGIN
	SELECT * FROM buku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilkan_peminjaman` ()   BEGIN
	SELECT * FROM peminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilkan_siswa` ()   BEGIN
	SELECT * FROM siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_buku` (`IDBuku` INT, `JudulBuku` VARCHAR(50), `PenulisBuku` VARCHAR(50), `KategoriBuku` VARCHAR(50), `StokBuku` INT)   BEGIN
    UPDATE buku
    SET Judul_Buku = JudulBuku, Penulis = PenulisBuku, Kategori = KategoriBuku, Stok = StokBuku
    WHERE ID_Buku = IDBuku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_peminjaman` (`IDPeminjaman` INT, `IDSiswa` INT, `IDBuku` INT, `TglPinjam` DATE, `TglKembali` DATE, `StatusPinjam` VARCHAR(50))   BEGIN
	UPDATE peminjaman
    SET ID_Siswa = IDSiswa, IDBuku = IDBuku, Tanggal_Pinjam = TglPinjam, Tanggal_Kembali = TglKembali, Status = StatusPinjam
    WHERE ID_Peminjaman = IDPeminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_siswa` (`IDSiswa` INT, `NamaSiswa` VARCHAR(50), `KelasSiswa` VARCHAR(50))   BEGIN
	UPDATE siswa 
    SET Nama = NamaSiswa, Kelas = KelasSiswa
    WHERE ID_Siswa =  IDSiswa;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `ID_Buku` int(11) NOT NULL,
  `Judul_Buku` varchar(50) DEFAULT NULL,
  `Penulis` varchar(50) DEFAULT NULL,
  `Kategori` varchar(50) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`ID_Buku`, `Judul_Buku`, `Penulis`, `Kategori`, `Stok`) VALUES
(1, 'Algoritma dan Pemrograman', 'Andi Wijaya', 'Teknologi', 5),
(2, 'Dasar-dasar Database', 'Budi Santoso', 'Teknologi', 7),
(3, 'Matematika Diskrit', 'Rina Sari', 'Matematika', 4),
(4, 'Sejarah Dunia', 'John Smith', 'Sejarah', 3),
(5, 'Pemrograman Web dengan PHP', 'Eko Prasetyo', 'Teknologi', 8),
(6, 'Sistem Operasi', 'Dian Kurniawan', 'Teknologi', 6),
(7, 'Jaringan Komputer', 'Ahmad Fauzi', 'Teknologi', 5),
(8, 'Cerita Rakyat Nusantara', 'Lestari Dewi', 'Sastra', 9),
(9, 'Bahasa Inggris untuk Pemula', 'Jane Doe', 'Bahasa', 10),
(10, 'Biologi Dasar', 'Budi Rahman', 'Sains', 7),
(11, 'Kimia Organik', 'Siti Aminah', 'Sains', 5),
(12, 'Teknik Elektro', 'Ridwan Hakim', 'Teknik', 6),
(13, 'Fisika Modern', 'Albert Einstein', 'Sains', 4),
(14, 'Manajemen Waktu', 'Steven Covey', 'Pengembangan', 8),
(15, 'Strategi Belajar Efektif', 'Tony Buzan', 'Pendidikan', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID_Peminjaman` int(11) NOT NULL,
  `ID_Siswa` int(11) DEFAULT NULL,
  `IDBuku` int(11) DEFAULT NULL,
  `Tanggal_Pinjam` date DEFAULT NULL,
  `Tanggal_Kembali` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`ID_Peminjaman`, `ID_Siswa`, `IDBuku`, `Tanggal_Pinjam`, `Tanggal_Kembali`, `Status`) VALUES
(1, 11, 2, '2025-02-01', '2025-02-08', 'Dipinjam'),
(2, 2, 5, '2025-01-28', '2025-02-04', 'Dikembalikan'),
(3, 3, 8, '2025-02-02', '2025-02-09', 'Dipinjam'),
(4, 4, 10, '2025-01-30', '2025-02-06', 'Dikembalikan'),
(5, 5, 3, '2025-01-25', '2025-02-01', 'Dikembalikan'),
(6, 15, 7, '2025-02-01', '2025-02-08', 'Dipinjam'),
(7, 7, 1, '2025-01-29', '2025-02-05', 'Dikembalikan'),
(8, 8, 9, '2025-02-03', '2025-02-10', 'Dipinjam'),
(9, 13, 4, '2025-01-27', '2025-02-03', 'Dikembalikan'),
(10, 10, 11, '2025-02-01', '2025-02-08', 'Dipinjam');

--
-- Trigger `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `after_insert_peminjaman` AFTER INSERT ON `peminjaman` FOR EACH ROW BEGIN
	UPDATE buku
    SET Stok = Stok - 1
    WHERE IDBuku = NEW.IDBuku;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_peminjaman` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
	IF NEW.Status = 'Dikembalikan'
    THEN UPDATE buku SET Stok = Stok + 1
    WHERE IDBuku = NEW.IDBuku;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `ID_Siswa` int(11) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Kelas` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`ID_Siswa`, `Nama`, `Kelas`) VALUES
(1, 'Andi Saputra', 'X-RPL'),
(2, 'Budi Wijaya', 'X-TKJ'),
(3, 'Citra Lestari', 'XI-RPL'),
(4, 'Dewi Kurnia', 'XI-TKJ'),
(5, 'Eko Prasetyo', 'XII-RPL'),
(6, 'Farhan Maulana', 'XII-TKJ'),
(7, 'Gita Permata', 'X-RPL'),
(8, 'Hadi Sucipto', 'X-TKJ'),
(9, 'Intan Permadi', 'XI-RPL'),
(10, 'Joko Santoso', 'XI-TKJ'),
(11, 'Kartika Sari', 'XII-RPL'),
(12, 'Lintang Putri', 'XII-TKJ'),
(13, 'Muhammad Rizky', 'X-RPL'),
(14, 'Novi Andriana', 'X-TKJ'),
(15, 'Olivia Hernanda', 'XI-RPL');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ID_Buku`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`ID_Peminjaman`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`ID_Siswa`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `ID_Buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `ID_Peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `ID_Siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
