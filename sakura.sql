-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 01 Feb 2020 pada 04.21
-- Versi Server: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sakura`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `angkatan` varchar(50) NOT NULL,
  `kotalahir` varchar(255) NOT NULL,
  `tanggallahir` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `pekerjaan` varchar(255) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `darah` varchar(5) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id`, `nama`, `gender`, `angkatan`, `kotalahir`, `tanggallahir`, `alamat`, `pekerjaan`, `telepon`, `darah`, `email`, `photo`, `created`) VALUES
(2096, 'Isnan Hamid', 'laki', '13', 'adsd', '2020-01-14', 'adsad', 'pns', '085299665037', 'b', 'angganackcopo@yahoo.com', '1580470509813.jpg', '2020-01-31 11:46:17'),
(2097, 'Isnan Hamid', 'laki', '2', 'ads', '2020-01-09', 'dasd', 'pns', '085299665037', 'o', 'angganackcopo@yahoo.com', '1580470994348.jpg', '2020-01-31 11:46:10'),
(2098, 'Wawan Gunawan', 'perempuan', '5', 'asdasd', '2020-01-29', 'asdasd', 'pns', '085299665037', 'b', 'angganackcopo@yahoo.com', '', '2020-01-31 11:49:44'),
(2099, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:00'),
(2100, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:00'),
(2101, 'asdasd', 'asdasdasd', '4', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:00'),
(2102, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2103, 'asdasd', 'asdasdasd', '4', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2104, 'asdasd', 'asdasdasd', '1', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2105, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2106, 'asdasd', 'asdasdasd', '4', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2107, 'asdasd', 'asdasdasd', '1', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2108, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2109, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2110, 'asdasd', 'asdasdasd', '4', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2111, 'asdasd', 'asdasdasd', '1', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2112, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2113, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2114, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2115, 'asdasd', 'asdasdasd', '4', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2116, 'asdasd', 'asdasdasd', '1', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2117, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2118, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2119, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2120, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2121, 'asdasd', 'asdasdasd', '4', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2122, 'asdasd', 'asdasdasd', '1', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2123, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2124, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2125, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2126, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2127, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2128, 'asdasd', 'asdasdasd', '4', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2129, 'asdasd', 'asdasdasd', '1', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2130, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2131, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2132, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2133, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2134, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2135, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2136, 'asdasd', 'asdasdasd', '4', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2137, 'asdasd', 'asdasdasd', '1', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2138, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2139, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2140, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2141, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2142, 'asdasd', 'asdasdasd', '3', 'sdasd', 'asda', 'sadasd', 'sadasd', 'sadas', 'dasda', 'dasd', NULL, '2020-01-31 11:50:01'),
(2143, 'asdasd', 'perempuan', '3', 'sdasd', '2020-01-31', 'sadasd', 'sadasd', 'sadas', 'b', 'dasd', '1580472461643.jpg', '2020-01-31 12:07:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `slug_berita` varchar(255) NOT NULL,
  `judul_berita` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `status_berita` enum('publish','draft') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id_berita`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `gambar`, `status_berita`, `created`) VALUES
(22, 'angga123', 'Sport', 'basarnas-beraksi', 'Basarnas Beraksi !!!', '<p>Tim KSR UB yang terdiri dari Irma Dwi Cahyani (FIA&rsquo;16), Anisatul Maola (FPIK&rsquo;17), Nisa Wahyu A (FPIK&rsquo;18), Nuha Nabilah U (FMIPA&rsquo;18), dan Ilham Majid (FMIPA&rsquo;16), berlaga dalam 3 jenis lomba yakni Pertolongan Pertama (PP), Shelter, dan Lomba Karya Tulis Ilmiah (LKTI).</p>\r\n\r\n<p>Dalam kategori LKTI, KSR UB membuat aplikasi Smapp Reders (<em>Smart Application for The Red Cross Understanding</em>). Aplikasi ini berfungsi untuk membantu anak-anak PMR mengulas materi yang telah diberikan. &ldquo;Karena di PMI sudah banyak program tentang materi-materi pelatihan maupun latihan rutin. Kami ingin dari materi yang disampaikan oleh PMI bisa di pelajaro kembali agar mereka bisa paham betul. Karena PMR ini asetnya PMI untuk menyebarkan materi-materi. Jadi dari PMR yang sudah berkompeten ini bisa menyebarkan pengetahuan yang dimiliki kepada masyarakat&rdquo; jelas Anisa.</p>\r\n', 'basarnas-1.jpg', 'publish', '2019-08-28 05:44:55'),
(23, 'angga123', 'Sport', 'open-recruitment-platoon-xiii', 'Open Recruitment Platoon XIII', '<p>sdasdasdsdasdasd</p>\r\n', 'HD_Wallpapers_Wide_Pack_21_(14).jpg', 'publish', '2019-08-31 22:30:04'),
(24, 'angga123', 'Sport', 'xampp-memilik-versi-terbaru', 'Xampp memilik Versi Terbaru !!!', '<p>asdasdasdasdasdadasd</p>\r\n', 'HD_Wallpapers_Wide_Pack_21_(29).jpg', 'publish', '2019-08-31 22:30:16'),
(25, 'angga123', 'Sport', 'kecelakaan-terjadi-di-jalan-raya', 'Kecelakaan terjadi di jalan raya', '<p>asdasdaddddddddddddddadasdasdasd</p>\r\n', 'HD_Wallpapers_Wide_Pack_21_(20).jpg', 'publish', '2019-08-31 22:30:40'),
(26, 'angga123', 'Sport', 'shubuh-yang-menyenangkan', 'Shubuh yang Menyenangkan', '<p>adasdasdasdadas</p>\r\n', 'HD_Wallpapers_Wide_Pack_21_(30).jpg', 'publish', '2019-09-01 21:33:55'),
(27, 'angga123', 'Sport', 'agama-dapat-meningkatkan-ilmu', 'Agama dapat meningkatkan ilmu', '<p>asdasdasdasdada</p>\r\n', 'HD_Wallpapers_Wide_Pack_21_(29)1.jpg', 'publish', '2019-09-01 21:34:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri`
--

CREATE TABLE `galeri` (
  `id_gambar` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `galeri`
--

INSERT INTO `galeri` (`id_gambar`, `id_kategori`, `gambar`, `keterangan`, `created`) VALUES
(1, 17, 'HD_Wallpapers_Wide_Pack_21_(18).jpg', 'asdasdasd', '2019-08-31 22:23:48'),
(2, 16, 'HD_Wallpapers_Wide_Pack_21_(33).jpg', 'asdasdadasd', '2019-08-31 22:23:57'),
(3, 17, 'HD_Wallpapers_Wide_Pack_21_(39).jpg', 'asdasdasdasd', '2019-08-31 22:24:05'),
(4, 13, 'HD_Wallpapers_Wide_Pack_21_(36).jpg', 'adasdasdasd', '2019-08-31 22:24:13'),
(5, 18, 'Elephants_never_forget.jpg', 'adasdasd', '2019-09-07 19:48:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_berita`
--

CREATE TABLE `kategori_berita` (
  `id_kategori` int(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `sekilas` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_berita`
--

INSERT INTO `kategori_berita` (`id_kategori`, `gambar`, `kategori`, `sekilas`, `created`) VALUES
(13, '20-hd-wallpapers-abstract-sunset-design.jpg', 'Sport', 'Menambahkan isi Otak anda', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_galeri`
--

CREATE TABLE `kategori_galeri` (
  `id_kategori` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `sekilas` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_galeri`
--

INSERT INTO `kategori_galeri` (`id_kategori`, `gambar`, `kategori`, `sekilas`, `created`) VALUES
(13, 'fog_alone_bw_126054_1920x10801.jpg', 'Ta''deang 9 Januari ', 'Kegiatan Outdoor Angkatan XXIII', '2019-08-31 22:17:39'),
(14, 'origami_plane_art_128345_1920x1080.jpg', 'Lembanna 09', 'Menyediakan Fakta Unik dari seluruh', '2019-08-31 22:17:56'),
(16, 'firewatch-1366x768-artwork-hd-4k-12363.jpg', 'Sport', 'Presentasi makalah angkatan 13', '2019-08-31 22:18:24'),
(17, 'firewatch-1920x1080-2016-games-adventure-8.jpg', 'Pengetahuan', 'Presentasi makalah angkatan 13', '2019-08-31 22:18:41'),
(18, '64_miles_from_you1.jpg', 'Ang 13', 'Menambahkan isi Otak anda', '2019-09-07 19:48:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `slug_berita` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil`
--

CREATE TABLE `profil` (
  `id_profile` int(11) NOT NULL,
  `judul_profile` varchar(50) NOT NULL,
  `isi` longtext NOT NULL,
  `gambar` varchar(50) NOT NULL,
  `bagian` enum('Sejarah singkat','Visi misi','Tata tertib','Sarana prasarana','Struktur organisasi','Ekstrakulikuler') NOT NULL,
  `status_profile` enum('draft','publish','','') NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `profil`
--

INSERT INTO `profil` (`id_profile`, `judul_profile`, `isi`, `gambar`, `bagian`, `status_profile`, `created`, `last_update`) VALUES
(1, 'Sejarah singkat', '<p>sdasdasdasdasdasdasd</p>\r\n', '1214032.jpg', 'Sejarah singkat', 'publish', '2019-08-07 02:55:46', '2019-08-19 16:00:00'),
(2, 'Visi Misi', '<p>sadasdassss</p>\r\n', 'bjorn-simon-322-unsplash1.jpg', 'Visi misi', 'publish', '2019-08-07 02:29:13', NULL),
(3, 'Ekstrakulikuler', '<p>sdasd</p>\r\n', '121415.jpg', 'Tata tertib', 'publish', '2019-08-07 02:30:52', '2019-08-19 16:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `pekerjaan` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `motto` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `pekerjaan`, `email`, `facebook`, `username`, `password`, `foto`, `motto`, `created`, `last_update`) VALUES
(1, 'Angga Kurniawan', 'Mahasiswa Tingkat Akhir', 'angga99124@gmail.com', 'https://www.facebook.com/angga.macassar', 'angga123', 'angga123', 'profil.jpg', 'Santai Senyum Selesai', '2019-08-16 09:33:01', '2019-08-16 09:33:01'),
(2, 'Didi Kurniadi', 'Pengurus KSR PMI', 'eki@gmail.com', 'https://www.facebook.com/', 'eki123', 'eki123', 'profil_2.jpeg', 'Makan setiap hari', '2019-08-16 11:54:31', '2019-08-16 11:54:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `slug_berita` (`slug_berita`),
  ADD KEY `kategori` (`kategori`),
  ADD KEY `id_user` (`username`),
  ADD KEY `id_berita_2` (`id_berita`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id_gambar`),
  ADD KEY `kategori` (`id_kategori`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori_berita`
--
ALTER TABLE `kategori_berita`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `kategori` (`kategori`);

--
-- Indexes for table `kategori_galeri`
--
ALTER TABLE `kategori_galeri`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `kategori` (`kategori`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`),
  ADD KEY `slug_berita` (`slug_berita`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id_profile`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2144;
--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_gambar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kategori_berita`
--
ALTER TABLE `kategori_berita`
  MODIFY `id_kategori` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `kategori_galeri`
--
ALTER TABLE `kategori_galeri`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `id_profile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori_berita` (`kategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `berita_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `galeri`
--
ALTER TABLE `galeri`
  ADD CONSTRAINT `galeri_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_galeri` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`slug_berita`) REFERENCES `berita` (`slug_berita`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
