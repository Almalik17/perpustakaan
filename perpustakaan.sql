-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jul 2025 pada 11.12
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
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_admin`
--

CREATE TABLE `t_admin` (
  `f_id` int(11) NOT NULL,
  `f_nama` varchar(100) NOT NULL,
  `f_username` varchar(100) NOT NULL,
  `f_password` varchar(100) NOT NULL,
  `f_level` enum('Admin','Pustakawan') NOT NULL,
  `f_status` enum('Aktif','Tidak Aktif') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_admin`
--

INSERT INTO `t_admin` (`f_id`, `f_nama`, `f_username`, `f_password`, `f_level`, `f_status`, `created_at`, `updated_at`) VALUES
(1, 'Pasha Almalik', 'pasha', '202cb962ac59075b964b07152d234b70', 'Admin', 'Aktif', '2024-04-24 10:06:32', '2024-04-24 10:06:32'),
(2, 'Naufal Hugo', 'naufal', '202cb962ac59075b964b07152d234b70', 'Pustakawan', 'Aktif', '2024-04-24 10:06:32', '2024-04-24 10:06:32'),
(3, 'Nurhadi Junior', 'hadi', '202cb962ac59075b964b07152d234b70', 'Pustakawan', 'Tidak Aktif', '2024-04-24 10:07:08', '2024-04-24 10:07:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_anggota`
--

CREATE TABLE `t_anggota` (
  `f_id` int(11) NOT NULL,
  `f_nama` varchar(100) NOT NULL,
  `f_username` varchar(100) NOT NULL,
  `f_password` varchar(100) NOT NULL,
  `f_tempatlahir` varchar(100) NOT NULL,
  `f_tanggallahir` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_anggota`
--

INSERT INTO `t_anggota` (`f_id`, `f_nama`, `f_username`, `f_password`, `f_tempatlahir`, `f_tanggallahir`, `created_at`, `updated_at`) VALUES
(1, 'Zidan Permata', 'zidan', '202cb962ac59075b964b07152d234b70', 'Kampung Lio', '2005-08-13', '2024-04-24 10:08:32', '2024-04-24 10:08:32'),
(2, 'Daru Angke', 'daru', '202cb962ac59075b964b07152d234b70', 'Bekasi', '2005-02-03', '2024-04-24 10:08:32', '2024-04-24 10:08:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_buku`
--

CREATE TABLE `t_buku` (
  `f_id` int(11) NOT NULL,
  `f_idkategori` int(11) NOT NULL,
  `f_judul` varchar(100) NOT NULL,
  `f_gambar` varchar(100) DEFAULT NULL,
  `f_pengarang` varchar(100) NOT NULL,
  `f_penerbit` varchar(100) NOT NULL,
  `f_deskripsi` varchar(512) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_buku`
--

INSERT INTO `t_buku` (`f_id`, `f_idkategori`, `f_judul`, `f_gambar`, `f_pengarang`, `f_penerbit`, `f_deskripsi`, `created_at`, `updated_at`) VALUES
(1, 1, 'Boruto Two Blue Vortex', '96cd2eae6858a31ff1bc5aff11fd7b98.jpg', 'Masashi Kishimoto', 'Shuiesha', 'The Great 4th Ninja Of World', '2024-04-24 10:10:48', '2024-04-24 10:10:48'),
(2, 2, 'The Flash', '6f0f54a3edd83b63777c38b0fc9e57d2.jpg', 'Allen', 'WB Productions', 'Fastest MAN ALIVE', '2024-04-24 10:11:25', '2024-04-24 10:11:25'),
(3, 3, 'Epistemologi Islam', 'Epistemologi-Islam-Integrasi-Agama-Filsafat-Dan-Sains-Dalam-Perspektif-Al-Farabi-dan-Ibn-Rusyd.jpg', 'Kahirul', 'Anwar', 'Sejarah Islam Terdahulu', '2024-04-24 10:12:11', '2024-04-24 10:12:11'),
(4, 5, 'Matematika Terapan', 'Matematika-Terapan_Moh.-Hartono_Netprom-Nurhadi-depan-scaled.jpg', 'Erlangga', 'Siman', 'Mempelajari SinCosTan', '2024-04-24 10:12:53', '2024-04-24 10:12:53'),
(5, 4, 'Astronomi Diluar Galaxy', '9786022778134.jpg', 'Milky', 'Way', 'Menceritakan Dunia Diluar Bumi', '2024-04-24 10:14:18', '2024-04-24 10:14:18'),
(6, 2, 'The Sandman', 'images.jpg', 'pas', 'sandman', 'sandman', '2024-04-24 11:29:58', '2024-04-24 11:29:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_detailbuku`
--

CREATE TABLE `t_detailbuku` (
  `f_id` int(11) NOT NULL,
  `f_idbuku` int(11) NOT NULL,
  `f_status` enum('Tersedia','Tidak Tersedia') DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_detailbuku`
--

INSERT INTO `t_detailbuku` (`f_id`, `f_idbuku`, `f_status`, `created_at`) VALUES
(1, 1, 'Tersedia', '2024-04-24'),
(2, 1, 'Tersedia', '2024-04-24'),
(3, 1, 'Tersedia', '2024-04-24'),
(4, 1, 'Tersedia', '2024-04-24'),
(5, 1, 'Tersedia', '2024-04-24'),
(6, 1, 'Tersedia', '2024-04-24'),
(7, 1, 'Tersedia', '2024-04-24'),
(8, 1, 'Tersedia', '2024-04-24'),
(9, 1, 'Tersedia', '2024-04-24'),
(10, 1, 'Tersedia', '2024-04-24'),
(11, 1, 'Tersedia', '2024-04-24'),
(12, 1, 'Tersedia', '2024-04-24'),
(13, 1, 'Tersedia', '2024-04-24'),
(14, 1, 'Tersedia', '2024-04-24'),
(15, 1, 'Tersedia', '2024-04-24'),
(16, 1, 'Tersedia', '2024-04-24'),
(17, 1, 'Tersedia', '2024-04-24'),
(18, 2, 'Tersedia', '2024-04-24'),
(19, 2, 'Tersedia', '2024-04-24'),
(20, 2, 'Tersedia', '2024-04-24'),
(21, 2, 'Tersedia', '2024-04-24'),
(22, 2, 'Tersedia', '2024-04-24'),
(23, 2, 'Tersedia', '2024-04-24'),
(24, 2, 'Tersedia', '2024-04-24'),
(25, 2, 'Tersedia', '2024-04-24'),
(26, 2, 'Tersedia', '2024-04-24'),
(27, 2, 'Tersedia', '2024-04-24'),
(28, 2, 'Tersedia', '2024-04-24'),
(29, 2, 'Tersedia', '2024-04-24'),
(30, 2, 'Tersedia', '2024-04-24'),
(31, 2, 'Tersedia', '2024-04-24'),
(32, 2, 'Tersedia', '2024-04-24'),
(33, 2, 'Tersedia', '2024-04-24'),
(34, 2, 'Tersedia', '2024-04-24'),
(35, 2, 'Tersedia', '2024-04-24'),
(36, 2, 'Tersedia', '2024-04-24'),
(37, 2, 'Tersedia', '2024-04-24'),
(38, 3, 'Tersedia', '2024-04-24'),
(39, 3, 'Tersedia', '2024-04-24'),
(40, 3, 'Tersedia', '2024-04-24'),
(41, 3, 'Tersedia', '2024-04-24'),
(42, 3, 'Tersedia', '2024-04-24'),
(43, 3, 'Tersedia', '2024-04-24'),
(44, 3, 'Tersedia', '2024-04-24'),
(45, 3, 'Tersedia', '2024-04-24'),
(46, 3, 'Tersedia', '2024-04-24'),
(47, 4, 'Tersedia', '2024-04-24'),
(48, 4, 'Tersedia', '2024-04-24'),
(49, 4, 'Tersedia', '2024-04-24'),
(50, 4, 'Tersedia', '2024-04-24'),
(51, 4, 'Tersedia', '2024-04-24'),
(52, 4, 'Tersedia', '2024-04-24'),
(53, 4, 'Tersedia', '2024-04-24'),
(54, 5, 'Tersedia', '2024-04-24'),
(55, 5, 'Tersedia', '2024-04-24'),
(56, 5, 'Tersedia', '2024-04-24'),
(57, 5, 'Tersedia', '2024-04-24'),
(58, 5, 'Tersedia', '2024-04-24'),
(59, 5, 'Tersedia', '2024-04-24'),
(60, 5, 'Tersedia', '2024-04-24'),
(61, 5, 'Tersedia', '2024-04-24'),
(62, 5, 'Tersedia', '2024-04-24'),
(63, 5, 'Tersedia', '2024-04-24'),
(64, 5, 'Tersedia', '2024-04-24'),
(65, 5, 'Tersedia', '2024-04-24'),
(66, 5, 'Tersedia', '2024-04-24'),
(67, 5, 'Tidak Tersedia', '2024-04-24'),
(68, 6, 'Tersedia', '2024-04-24'),
(69, 6, 'Tersedia', '2024-04-24'),
(70, 6, 'Tersedia', '2024-04-24'),
(71, 6, 'Tersedia', '2024-04-24'),
(72, 6, 'Tersedia', '2024-04-24'),
(73, 6, 'Tersedia', '2024-04-24'),
(74, 6, 'Tersedia', '2024-04-24'),
(75, 6, 'Tersedia', '2024-04-24'),
(76, 6, 'Tersedia', '2024-04-24'),
(77, 6, 'Tersedia', '2024-04-24'),
(78, 6, 'Tersedia', '2024-04-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_detailpeminjaman`
--

CREATE TABLE `t_detailpeminjaman` (
  `f_id` int(11) NOT NULL,
  `f_idpeminjaman` int(11) NOT NULL,
  `f_iddetailbuku` int(11) NOT NULL,
  `f_tanggalkembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_detailpeminjaman`
--

INSERT INTO `t_detailpeminjaman` (`f_id`, `f_idpeminjaman`, `f_iddetailbuku`, `f_tanggalkembali`) VALUES
(1, 1, 1, '2024-04-24'),
(2, 2, 18, '2024-04-24'),
(3, 3, 38, '2024-04-24'),
(4, 4, 2, '2024-04-24'),
(5, 5, 4, '2024-04-24'),
(6, 7, 67, '0000-00-00'),
(7, 8, 18, '2024-04-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kategori`
--

CREATE TABLE `t_kategori` (
  `f_id` int(11) NOT NULL,
  `f_kategori` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_kategori`
--

INSERT INTO `t_kategori` (`f_id`, `f_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Komik', '2024-04-24 10:09:35', '2024-04-24 10:09:35'),
(2, 'Novel', '2024-04-24 10:09:40', '2024-04-24 10:09:40'),
(3, 'Sejarah', '2024-04-24 10:09:45', '2024-04-24 10:09:45'),
(4, 'Astronomi', '2024-04-24 10:09:56', '2024-04-24 10:09:56'),
(5, 'Matematika', '2024-04-24 10:10:02', '2024-04-24 10:10:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_peminjaman`
--

CREATE TABLE `t_peminjaman` (
  `f_id` int(11) NOT NULL,
  `f_idadmin` int(11) NOT NULL,
  `f_idanggota` int(11) NOT NULL,
  `f_tanggalpeminjaman` date NOT NULL,
  `f_expireddate` date DEFAULT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_peminjaman`
--

INSERT INTO `t_peminjaman` (`f_id`, `f_idadmin`, `f_idanggota`, `f_tanggalpeminjaman`, `f_expireddate`, `update_at`) VALUES
(1, 1, 1, '2024-04-28', '2024-04-27', '2024-04-24 10:14:48'),
(2, 1, 2, '2024-04-28', '2024-04-27', '2024-04-24 10:16:02'),
(3, 1, 1, '2024-04-24', '2024-04-27', '2024-04-24 10:16:20'),
(4, 1, 1, '2024-04-24', '2024-04-27', '2024-04-24 10:16:41'),
(5, 1, 1, '2024-04-24', '2024-04-27', '2024-04-24 10:16:58'),
(7, 1, 2, '2024-04-14', '2024-04-17', '2024-04-24 10:26:25'),
(8, 2, 2, '2024-04-24', '2024-04-27', '2024-04-24 11:39:31');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_admin`
--
ALTER TABLE `t_admin`
  ADD PRIMARY KEY (`f_id`);

--
-- Indeks untuk tabel `t_anggota`
--
ALTER TABLE `t_anggota`
  ADD PRIMARY KEY (`f_id`);

--
-- Indeks untuk tabel `t_buku`
--
ALTER TABLE `t_buku`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `f_idkategori` (`f_idkategori`);

--
-- Indeks untuk tabel `t_detailbuku`
--
ALTER TABLE `t_detailbuku`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `f_idbuku` (`f_idbuku`);

--
-- Indeks untuk tabel `t_detailpeminjaman`
--
ALTER TABLE `t_detailpeminjaman`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `f_idpeminjaman` (`f_idpeminjaman`,`f_iddetailbuku`),
  ADD KEY `f_iddetailbuku` (`f_iddetailbuku`);

--
-- Indeks untuk tabel `t_kategori`
--
ALTER TABLE `t_kategori`
  ADD PRIMARY KEY (`f_id`);

--
-- Indeks untuk tabel `t_peminjaman`
--
ALTER TABLE `t_peminjaman`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `f_idadmin` (`f_idadmin`,`f_idanggota`),
  ADD KEY `f_idanggota` (`f_idanggota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_admin`
--
ALTER TABLE `t_admin`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `t_anggota`
--
ALTER TABLE `t_anggota`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `t_buku`
--
ALTER TABLE `t_buku`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `t_detailbuku`
--
ALTER TABLE `t_detailbuku`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT untuk tabel `t_detailpeminjaman`
--
ALTER TABLE `t_detailpeminjaman`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `t_kategori`
--
ALTER TABLE `t_kategori`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `t_peminjaman`
--
ALTER TABLE `t_peminjaman`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_buku`
--
ALTER TABLE `t_buku`
  ADD CONSTRAINT `t_buku_ibfk_1` FOREIGN KEY (`f_idkategori`) REFERENCES `t_kategori` (`f_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `t_detailbuku`
--
ALTER TABLE `t_detailbuku`
  ADD CONSTRAINT `t_detailbuku_ibfk_1` FOREIGN KEY (`f_idbuku`) REFERENCES `t_buku` (`f_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `t_detailpeminjaman`
--
ALTER TABLE `t_detailpeminjaman`
  ADD CONSTRAINT `t_detailpeminjaman_ibfk_1` FOREIGN KEY (`f_iddetailbuku`) REFERENCES `t_detailbuku` (`f_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_detailpeminjaman_ibfk_2` FOREIGN KEY (`f_idpeminjaman`) REFERENCES `t_peminjaman` (`f_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `t_peminjaman`
--
ALTER TABLE `t_peminjaman`
  ADD CONSTRAINT `t_peminjaman_ibfk_1` FOREIGN KEY (`f_idanggota`) REFERENCES `t_anggota` (`f_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_peminjaman_ibfk_2` FOREIGN KEY (`f_idadmin`) REFERENCES `t_admin` (`f_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
