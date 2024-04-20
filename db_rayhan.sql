-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Apr 2024 pada 12.17
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
-- Database: `db_rayhan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` int(10) NOT NULL,
  `tg_pengaduan` datetime NOT NULL,
  `isi_laporan` varchar(1000) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('0','proses','selesai') DEFAULT NULL,
  `petugas_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id`, `tg_pengaduan`, `isi_laporan`, `foto`, `status`, `petugas_id`) VALUES
(1, '2024-04-04 11:28:07', 'idk', 'IKEA Indonesia - Jual Perabot Rumah & Furnitur Kantor Online.jpg', '0', 1),
(2, '2024-04-04 13:24:26', 'dik', 'Admin.jpg', '0', 4),
(3, '2024-04-19 07:21:19', 'tes edit', 'IMG_20230321_112008.jpg', '0', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id` int(10) NOT NULL,
  `nik` char(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `level` enum('masyarakat','petugas','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id`, `nik`, `nama`, `username`, `password`, `telp`, `level`) VALUES
(1, '1', 'admin', 'admin', '$2y$10$qbOl.T/kTQJPhTf4gGTzNerCSg9xeFx0Q7lUH/zMZdUFvg29V2NRu', '1', 'admin'),
(2, '123', 'tosa', 'tosa', '$2y$10$1G5LluzNcRfFO7IPsbKkq.xze.gTbA4fYD04HO6P8spPLhtXS2vei', '123', 'petugas'),
(3, '12', 'agosmendo', 'agos', '$2y$10$.tpAi8v97gQznAoEh.nzL.xUr5CtqksrocZm66PzVA0FLhGnGxUtu', '12', 'masyarakat'),
(4, '14', 'rayhan', 'rayhan', '$2y$10$xTg3QY1ZcJmf0rQ0seLFjuGUcwOuBLU3n93rRRYoZshr3DTvaxdQe', '67', 'masyarakat'),
(5, '444', 'tosa', 'tosa1', '$2y$10$Xqj0/B0YOkkqlhi11IRfHur3o4aFknkFxJvD3UTxkJfa0GrzK87zu', '99', 'masyarakat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id` int(10) NOT NULL,
  `tg_tanggapan` datetime NOT NULL,
  `isi_tanggapan` varchar(1000) NOT NULL,
  `pengaduan_id` int(10) NOT NULL,
  `petugas_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id`, `tg_tanggapan`, `isi_tanggapan`, `pengaduan_id`, `petugas_id`) VALUES
(1, '2024-04-04 13:12:37', 'yahaha', 1, 1),
(3, '2024-04-18 14:45:29', 'tes', 2, 1),
(4, '2024-04-19 10:58:51', 'tes', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpengaduan52247` (`petugas_id`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtanggapan340580` (`petugas_id`),
  ADD KEY `FKtanggapan374346` (`pengaduan_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `FKpengaduan52247` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`);

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `FKtanggapan340580` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`),
  ADD CONSTRAINT `FKtanggapan374346` FOREIGN KEY (`pengaduan_id`) REFERENCES `pengaduan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
