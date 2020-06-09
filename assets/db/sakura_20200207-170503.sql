#
# TABLE STRUCTURE FOR: anggota
#

DROP TABLE IF EXISTS `anggota`;

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2146 DEFAULT CHARSET=latin1;

INSERT INTO `anggota` (`id`, `nama`, `gender`, `angkatan`, `kotalahir`, `tanggallahir`, `alamat`, `pekerjaan`, `telepon`, `darah`, `email`, `photo`, `created`) VALUES ('2096', 'Isnan Hamid', 'laki', '13', 'adsd', '2020-01-14', 'adsad', 'pns', '085299665037', 'b', 'angganackcopo@yahoo.com', '1580470509813.jpg', '2020-01-31 19:46:17');
INSERT INTO `anggota` (`id`, `nama`, `gender`, `angkatan`, `kotalahir`, `tanggallahir`, `alamat`, `pekerjaan`, `telepon`, `darah`, `email`, `photo`, `created`) VALUES ('2097', 'Isnan Hamid', 'laki', '2', 'ads', '2020-01-09', 'dasd', 'pns', '085299665037', 'o', 'angganackcopo@yahoo.com', '1580470994348.jpg', '2020-01-31 19:46:10');
INSERT INTO `anggota` (`id`, `nama`, `gender`, `angkatan`, `kotalahir`, `tanggallahir`, `alamat`, `pekerjaan`, `telepon`, `darah`, `email`, `photo`, `created`) VALUES ('2144', 'Wawan Gunawan', 'laki', '12', 'Makassar', '2020-01-12', 'asdasd', 'sdasd', 'asd', 'b', 'angganackcopo@yahoo.com', '1580770124111.jpg', '2020-02-04 08:24:13');


#
# TABLE STRUCTURE FOR: backup_db
#

DROP TABLE IF EXISTS `backup_db`;

CREATE TABLE `backup_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `size` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO `backup_db` (`id`, `nama`, `tanggal`, `size`) VALUES ('56', 'sakura_20200207-010040.sql', '2020-02-07 08:00:40', '9294 bytes');


#
# TABLE STRUCTURE FOR: berita
#

DROP TABLE IF EXISTS `berita`;

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `slug_berita` varchar(255) NOT NULL,
  `judul_berita` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `status_berita` enum('publish','draft') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_berita`),
  KEY `slug_berita` (`slug_berita`),
  KEY `kategori` (`kategori`),
  KEY `id_user` (`username`),
  KEY `id_berita_2` (`id_berita`),
  CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori_berita` (`kategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `berita_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: galeri
#

DROP TABLE IF EXISTS `galeri`;

CREATE TABLE `galeri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kategori` (`kategori`),
  KEY `id_kategori` (`kategori`),
  CONSTRAINT `galeri_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori_galeri` (`kategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `galeri` (`id`, `kategori`, `photo`, `keterangan`, `created`) VALUES ('4', 'Diklatsar', '1580907634466.jpg', 'Jalan jalan ke kota semarang', '2020-02-05 21:01:56');


#
# TABLE STRUCTURE FOR: kategori_barang
#

DROP TABLE IF EXISTS `kategori_barang`;

CREATE TABLE `kategori_barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) NOT NULL,
  `sekilas` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `kategori_barang` (`id`, `kategori`, `sekilas`, `created`) VALUES ('1', 'Adminstrasi Perkantoran', 'untuk barang habis seperti tinta, kertas dsb', '2020-02-04 12:54:40');


#
# TABLE STRUCTURE FOR: kategori_berita
#

DROP TABLE IF EXISTS `kategori_berita`;

CREATE TABLE `kategori_berita` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `sekilas` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kategori` (`kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('24', '1581078859357.jpg', 'Sport', 'memberikan kebugaran jasmani dan rohani dan rekreasi', '2020-02-07 20:35:16');
INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('26', '1581090302929.jpg', 'Makan', 'asdasd', '2020-02-07 23:58:09');
INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('27', '1581091182323.jpg', 'Sportfitas', 'meninkgatkan timbangan', '2020-02-07 23:59:42');


#
# TABLE STRUCTURE FOR: kategori_galeri
#

DROP TABLE IF EXISTS `kategori_galeri`;

CREATE TABLE `kategori_galeri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `sekilas` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kategori` (`kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `kategori_galeri` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('20', '1580780134355.jpg', 'Diklatsar', 'Pendidikan dan Latihan Dasar 1998', '2020-02-04 09:35:34');
INSERT INTO `kategori_galeri` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('21', '1580904520753.jpg', 'Jalan jalan', 'jalan jalan di kota semarang', '2020-02-05 20:08:40');


#
# TABLE STRUCTURE FOR: komentar
#

DROP TABLE IF EXISTS `komentar`;

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL AUTO_INCREMENT,
  `slug_berita` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_komentar`),
  KEY `slug_berita` (`slug_berita`),
  CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`slug_berita`) REFERENCES `berita` (`slug_berita`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: konfigurasi
#

DROP TABLE IF EXISTS `konfigurasi`;

CREATE TABLE `konfigurasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `konfigurasi` (`id`, `nama`, `alamat`, `telepon`, `email`, `instagram`, `website`, `photo`, `created`) VALUES ('0', 'KSR SAKURA MAKASSAR', 'Jl. Kandea No.16, Baraya, Kec. Bontoala, Kota Makassar, Sulawesi Selatan 90211', '0852 9966 5037', 'ksrsakura@gmail.com', 'sakura_coprs', 'ksrsakura.comsss', '1581041670149.jpg', '2020-02-07 10:18:08');


#
# TABLE STRUCTURE FOR: profil
#

DROP TABLE IF EXISTS `profil`;

CREATE TABLE `profil` (
  `id_profile` int(11) NOT NULL AUTO_INCREMENT,
  `judul_profile` varchar(50) NOT NULL,
  `isi` longtext NOT NULL,
  `gambar` varchar(50) NOT NULL,
  `bagian` enum('Sejarah singkat','Visi misi','Tata tertib','Sarana prasarana','Struktur organisasi','Ekstrakulikuler') NOT NULL,
  `status_profile` enum('draft','publish','','') NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `profil` (`id_profile`, `judul_profile`, `isi`, `gambar`, `bagian`, `status_profile`, `created`, `last_update`) VALUES ('1', 'Sejarah singkat', '<p>sdasdasdasdasdasdasd</p>\r\n', '1214032.jpg', 'Sejarah singkat', 'publish', '2019-08-07 10:55:46', '2019-08-20 00:00:00');
INSERT INTO `profil` (`id_profile`, `judul_profile`, `isi`, `gambar`, `bagian`, `status_profile`, `created`, `last_update`) VALUES ('2', 'Visi Misi', '<p>sadasdassss</p>\r\n', 'bjorn-simon-322-unsplash1.jpg', 'Visi misi', 'publish', '2019-08-07 10:29:13', NULL);
INSERT INTO `profil` (`id_profile`, `judul_profile`, `isi`, `gambar`, `bagian`, `status_profile`, `created`, `last_update`) VALUES ('3', 'Ekstrakulikuler', '<p>sdasd</p>\r\n', '121415.jpg', 'Tata tertib', 'publish', '2019-08-07 10:30:52', '2019-08-20 00:00:00');


#
# TABLE STRUCTURE FOR: tabel_log
#

DROP TABLE IF EXISTS `tabel_log`;

CREATE TABLE `tabel_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_user` varchar(255) DEFAULT NULL,
  `log_tipe` varchar(255) DEFAULT NULL,
  `log_desc` varchar(255) DEFAULT NULL,
  `log_tabel` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `var` varchar(255) NOT NULL,
  `pred` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('86', '2020-02-07 23:58:09', 'admin', 'Update', 'Update data', 'Kategori_berita', '26', 'Makan', 'asdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('87', '2020-02-07 23:58:58', 'admin', 'Update', '', 'anggota', '2145', 'Angga kurniawan', '12');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('88', '2020-02-07 23:59:42', 'admin', 'Insert', 'tambah data', 'Kategori_berita', '', 'Sportfitas', 'meninkgatkan timbangan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('89', '2020-02-08 00:01:46', 'admin', 'Delete', 'Anggota', 'anggota', '2145', 'Angga kurniawan', '12');


#
# TABLE STRUCTURE FOR: user
#

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `akses_level` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `pekerjaan` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `motto` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `user` (`id`, `akses_level`, `username`, `password`, `nama`, `pekerjaan`, `email`, `facebook`, `instagram`, `photo`, `motto`, `created`) VALUES ('7', 'admin', 'aan123', '59c6f802008a2f455463881a9eec338d', 'Angga', 'PNS', 'angga99124@gmail.com', 'anggakurniawan', 'anggawan_9', '1580876639256.jpg', 'Santai Senyum Selesai', '0000-00-00 00:00:00');
INSERT INTO `user` (`id`, `akses_level`, `username`, `password`, `nama`, `pekerjaan`, `email`, `facebook`, `instagram`, `photo`, `motto`, `created`) VALUES ('8', 'admin', 'angga123', '1fd5cd9766249f170035b7251e2c6b61', 'Angga Kurniawan', 'Web Developer (Insya Allah)', 'angga99124@gmail.com', 'anggakurniawan', 'anggawan_09', 'sbmptn.jpg', 'Santai Senyum Selesai', '2020-02-05 13:04:28');


