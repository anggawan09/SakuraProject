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
) ENGINE=InnoDB AUTO_INCREMENT=2145 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

INSERT INTO `backup_db` (`id`, `nama`, `tanggal`, `size`) VALUES ('56', 'sakura_20200207-010040.sql', '2020-02-07 08:00:40', '9294 bytes');
INSERT INTO `backup_db` (`id`, `nama`, `tanggal`, `size`) VALUES ('57', 'sakura_20200207-170503.sql', '2020-02-08 00:05:03', '12172 bytes');
INSERT INTO `backup_db` (`id`, `nama`, `tanggal`, `size`) VALUES ('58', 'sakura_20200210-152050.sql', '2020-02-10 22:20:50', '51665 bytes');


#
# TABLE STRUCTURE FOR: barang
#

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `kondisi` enum('layak','kurang layak','tidak layak') NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kategori` (`kategori`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori_barang` (`kategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: berita
#

DROP TABLE IF EXISTS `berita`;

CREATE TABLE `berita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `slug_berita` varchar(255) NOT NULL,
  `judul_berita` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status_berita` enum('publish','draft') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `slug_berita` (`slug_berita`),
  KEY `kategori` (`kategori`),
  KEY `id_user` (`username`),
  KEY `id_berita_2` (`id`),
  CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori_berita` (`kategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `berita_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `created`) VALUES ('26', 'angga123', 'Sport', 'sdadasdd', 'sdadasdd', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n\r\n<p><strong>jikaaaaasa dadad</strong></p>\r\n', '', 'draft', '2020-02-10 13:38:15');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `created`) VALUES ('27', 'angga123', 'Sportfitas', 'adasdd', 'adasdd', '<p>asdddadas fgggggg&nbsp;<strong>ssdmfnsdfsfsf adasdadadasd</strong></p>\r\n', '', 'publish', '2020-02-10 13:01:45');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `created`) VALUES ('50', 'angga123', 'Sportfitas', 'asdsdddddasdasdasd', 'asdsdddddasdasdasd', '<h2><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; WYSIWYG Editor</strong></h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ullamcorper sapien non nisl facilisis bibendum in quis tellus. Duis in urna bibendum turpis pretium fringilla. Aenean neque velit, porta eget mattis ac, imperdiet quis nisi. Donec non dui et tortor vulputate luctus. Praesent consequat rhoncus velit, ut molestie arcu venenatis sodales.</p>\r\n\r\n<h3>Lacinia</h3>\r\n\r\n<ul>\r\n	<li>Suspendisse tincidunt urna ut velit ullamcorper fermentum.</li>\r\n	<li>Nullam mattis sodales lacus, in gravida sem auctor at.</li>\r\n	<li>Praesent non lacinia mi.</li>\r\n	<li>Mauris a ante neque.</li>\r\n	<li>Aenean ut magna lobortis nunc feugiat sagittis.</li>\r\n</ul>\r\n\r\n<h3>Pellentesque adipiscing</h3>\r\n\r\n<p>Maecenas quis ante ante. Nunc adipiscing rhoncus rutrum. Pellentesque adipiscing urna mi, ut tempus lacus ultrices ac. Pellentesque sodales, libero et mollis interdum, dui odio vestibulum dolor, eu pellentesque nisl nibh quis nunc. Sed porttitor leo adipiscing venenatis vehicula. Aenean quis viverra enim. Praesent porttitor ut ipsum id ornare.</p>\r\n', '', 'publish', '2020-02-10 22:07:55');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `created`) VALUES ('51', 'angga123', 'Sportfitas', 'dasdasdasd', 'dasdasdasd', '<p>hasjkdhajksdhajskdasdasdasd</p>\r\n', '1581344138082.jpg', 'draft', '2020-02-14 08:38:52');


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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `galeri` (`id`, `kategori`, `photo`, `keterangan`, `created`) VALUES ('1', 'Diklatsar', '', 'fgfghf', '2020-02-10 20:44:33');
INSERT INTO `galeri` (`id`, `kategori`, `photo`, `keterangan`, `created`) VALUES ('2', 'Diklatsar', '', 'aewaadasd', '2020-02-12 11:00:32');


#
# TABLE STRUCTURE FOR: kategori_barang
#

DROP TABLE IF EXISTS `kategori_barang`;

CREATE TABLE `kategori_barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) NOT NULL,
  `sekilas` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kategori` (`kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `kategori_barang` (`id`, `kategori`, `sekilas`, `created`) VALUES ('2', 'ATK', 'DDD', '2020-02-08 00:21:31');


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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('24', '1581078859357.jpg', 'Sport', 'memberikan kebugaran jasmani dan rohani dan rekreasi', '2020-02-07 20:35:16');
INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('26', '1581090302929.jpg', 'Makan', 'asdasd', '2020-02-07 23:58:09');
INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('27', '1581091182323.jpg', 'Sportfitas', 'meninkgatkan timbangan', '2020-02-07 23:59:42');
INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('28', '1581180562307.jpg', 'asdasd', 'sadasd', '2020-02-09 00:49:22');
INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('29', '1581180614138.jpg', 'sssss', 'ssss', '2020-02-09 00:50:14');


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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO `kategori_galeri` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('20', '1580780134355.jpg', 'Diklatsar', 'Pendidikan dan Latihan Dasar 1998', '2020-02-04 09:35:34');


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

INSERT INTO `konfigurasi` (`id`, `nama`, `alamat`, `telepon`, `email`, `instagram`, `website`, `photo`, `created`) VALUES ('0', 'KSR SAKURA MAKASSAR', 'Jl. Kandea No.16, Baraya, Kec. Bontoala, Kota Makassar, Sulawesi Selatan 90211', '0852 9966 5037', 'ksrsakura@gmail.com', 'sakura_coprs', 'ksrsakura.com', '1581041670149.jpg', '2020-02-09 00:32:43');


#
# TABLE STRUCTURE FOR: permohonan
#

DROP TABLE IF EXISTS `permohonan`;

CREATE TABLE `permohonan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi` varchar(255) NOT NULL,
  `perihal` enum('Tenaga Lapangan','Juri Lomba','Tenaga Medis') NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `aksi` enum('valid','tolak') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `permohonan` (`id`, `instansi`, `perihal`, `jumlah`, `contact`, `aksi`, `created`) VALUES ('1', 'KSR PMI UNHAS', 'Tenaga Lapangan', '10', '0852 9966 5037', 'tolak', '2020-02-11 15:12:39');
INSERT INTO `permohonan` (`id`, `instansi`, `perihal`, `jumlah`, `contact`, `aksi`, `created`) VALUES ('2', 'KSR PMI BOSOWA', 'Tenaga Medis', '10', '0852 9966 5037', 'tolak', '2020-02-11 15:27:20');
INSERT INTO `permohonan` (`id`, `instansi`, `perihal`, `jumlah`, `contact`, `aksi`, `created`) VALUES ('3', 'KSR PMI UNM', 'Tenaga Lapangan', '20', '0852 9966 5037', 'valid', '2020-02-11 16:25:16');


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
# TABLE STRUCTURE FOR: surat_masuk
#

DROP TABLE IF EXISTS `surat_masuk`;

CREATE TABLE `surat_masuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pengirim` varchar(255) NOT NULL,
  `nomor` varchar(255) NOT NULL,
  `perihal` text NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `surat_masuk` (`id`, `pengirim`, `nomor`, `perihal`, `tanggal`, `photo`, `created`) VALUES ('1', 'ksr unhas', '001/A/003//02/2019', 'Kegiatan tanggal 10 maret 2020', '2020-02-28', '1581487720406.jpg', '2020-02-12 14:11:20');


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
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=latin1;

INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('86', '2020-02-07 23:58:09', 'admin', 'Update', 'Update data', 'Kategori_berita', '26', 'Makan', 'asdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('87', '2020-02-07 23:58:58', 'admin', 'Update', '', 'anggota', '2145', 'Angga kurniawan', '12');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('88', '2020-02-07 23:59:42', 'admin', 'Insert', 'tambah data', 'Kategori_berita', '', 'Sportfitas', 'meninkgatkan timbangan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('89', '2020-02-08 00:01:46', 'admin', 'Delete', 'Anggota', 'anggota', '2145', 'Angga kurniawan', '12');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('90', '2020-02-08 00:06:14', 'admin', 'Insert', 'Backup', 'backup_db', '', 'sakura_20200207-170614.sql', '12313 bytes');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('91', '2020-02-08 00:07:49', 'admin', 'Delete', 'Backup', 'Backup_db', '58', 'sakura_20200207-170614.sql', '12313 bytes');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('92', '2020-02-08 00:17:24', 'admin', 'Update', '', 'galeri', '4', 'Jalan jalan', 'Jalan jalan ke kota semarang');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('93', '2020-02-08 00:17:47', 'admin', 'Insert', '', 'galeri', '4', 'Jalan jalan', 'asdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('94', '2020-02-08 00:17:56', 'admin', 'Delete', 'Galeri', 'galeri', '5', '', '');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('95', '2020-02-08 00:19:11', 'admin', 'Insert', '', 'galeri', '', 'Jalan jalan', 'ddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('96', '2020-02-08 00:19:15', 'admin', 'Delete', 'Galeri', 'galeri', '6', 'Jalan jalan', 'ddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('97', '2020-02-08 00:21:07', 'admin', 'Update', '', 'kategori_barang', '1', 'Adminstrasi Perkantoranddd', 'untuk barang habis seperti tinta, kertas dsb');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('98', '2020-02-08 00:21:16', 'admin', 'Delete', 'Kategori', 'kategori_barang', '1', 'Adminstrasi Perkantoranddd', 'untuk barang habis seperti tinta, kertas dsb');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('99', '2020-02-08 00:21:31', 'admin', 'Insert', '', 'kategori_barang', '', 'ATK', 'DDD');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('100', '2020-02-08 00:23:13', 'admin', 'Update', '', 'Kategori_galeri', '21', 'Jalan jalandddd', 'jalan jalan di kota semarang');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('101', '2020-02-08 00:23:30', 'admin', 'Delete', 'Kategori', 'kategori_galeri', '21', 'Jalan jalandddd', 'jalan jalan di kota semarang');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('102', '2020-02-08 00:24:50', 'admin', 'Update', '', 'Konfiguras', '0', 'KSR SAKURA MAKASSAR', 'ksrsakura@gmail.com');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('103', '2020-02-08 00:25:13', 'admin', 'Update', '', 'Konfigurasi', '0', 'KSR SAKURA MAKASSAR', 'ksrsakura@gmail.com');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('104', '2020-02-08 00:28:39', 'admin', 'Update', '', 'User', '8', 'admin', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('105', '2020-02-08 00:29:00', 'admin', 'Delete', 'Kategori', 'User', '7', 'aan123', 'admin');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('106', '2020-02-09 00:31:44', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('107', '2020-02-09 00:32:43', 'admin', 'Update', '', 'Konfigurasi', '0', 'KSR SAKURA MAKASSAR', 'ksrsakura@gmail.com');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('108', '2020-02-09 00:49:22', 'admin', 'Insert', '', 'Kategori_berita', '', 'asdasd', 'sadasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('109', '2020-02-09 00:50:14', 'admin', 'Insert', '', 'Kategori_berita', '', 'sssss', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('110', '2020-02-09 01:43:38', 'admin', 'Insert', '', 'berita', '', 'angga123', 'adasdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('111', '2020-02-09 01:46:28', 'admin', 'Insert', '', 'berita', '1', 'angga123', 'Makan bersamaaa anak anaka');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('112', '2020-02-09 01:46:38', 'admin', 'Delete', 'berita', 'berita', '1', 'angga123', 'adasdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('113', '2020-02-09 01:57:37', 'admin', 'Update', '', 'berita', '2', 'angga123', 'Makan bersamaaa anak anaka');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('114', '2020-02-09 01:57:46', 'admin', 'Update', '', 'berita', '2', 'angga123', 'Makan bersamaaa anak anaka');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('115', '2020-02-09 01:57:53', 'admin', 'Update', '', 'berita', '2', 'angga123', 'Makan bersamaaa anak anaka');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('116', '2020-02-09 02:41:13', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('117', '2020-02-09 02:46:37', 'admin', 'Insert', '', 'berita', '3', 'angga123', 'asdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('118', '2020-02-09 20:31:05', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('119', '2020-02-09 20:39:22', 'admin', 'Insert', '', 'berita', '4', 'angga123', 'adasdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('120', '2020-02-09 20:46:36', 'admin', 'Insert', '', 'berita', '5', 'angga123', 'dasdadsa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('121', '2020-02-09 20:53:08', 'admin', 'Insert', '', 'berita', '5', 'angga123', 'asdasdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('122', '2020-02-09 20:54:14', 'admin', 'Delete', 'berita', 'berita', '7', 'angga123', 'asdasdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('123', '2020-02-09 20:54:16', 'admin', 'Delete', 'berita', 'berita', '6', 'angga123', 'dasdadsa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('124', '2020-02-09 20:54:17', 'admin', 'Delete', 'berita', 'berita', '5', 'angga123', 'adasdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('125', '2020-02-09 20:54:19', 'admin', 'Delete', 'berita', 'berita', '4', 'angga123', 'asdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('126', '2020-02-09 20:54:20', 'admin', 'Delete', 'berita', 'berita', '3', 'angga123', 'asdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('127', '2020-02-09 21:09:22', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('128', '2020-02-09 21:09:40', 'admin', 'Update', '', 'berita', '2', 'angga123', 'Makan bersamaaa anak anaka');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('129', '2020-02-09 21:09:46', 'admin', 'Update', '', 'berita', '2', 'angga123', 'Makan bersamaaa anak anaka');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('130', '2020-02-09 21:24:43', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdasdadd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('131', '2020-02-09 21:46:06', 'admin', 'Insert', '', 'berita', '', 'angga123', 'adasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('132', '2020-02-09 21:47:35', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('133', '2020-02-09 21:50:25', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdadddddasdadd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('134', '2020-02-09 22:00:34', 'admin', 'Insert', '', 'berita', '12', 'angga123', 'asdasdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('135', '2020-02-09 22:13:27', 'admin', 'Update', '', 'berita', '12', 'angga123', 'asdadddddasdadd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('136', '2020-02-09 22:13:30', 'admin', 'Update', '', 'berita', '12', 'angga123', 'asdadddddasdadd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('137', '2020-02-09 22:15:29', 'admin', 'Update', '', 'berita', '13', 'angga123', 'asdasdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('138', '2020-02-09 22:15:34', 'admin', 'Update', '', 'berita', '13', 'angga123', 'asdasdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('139', '2020-02-09 22:15:41', 'admin', 'Delete', 'berita', 'berita', '13', 'angga123', 'asdasdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('140', '2020-02-09 22:15:42', 'admin', 'Delete', 'berita', 'berita', '12', 'angga123', 'asdadddddasdadd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('141', '2020-02-09 22:15:44', 'admin', 'Delete', 'berita', 'berita', '11', 'angga123', 'asdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('142', '2020-02-09 22:15:45', 'admin', 'Delete', 'berita', 'berita', '10', 'angga123', 'adasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('143', '2020-02-09 22:15:47', 'admin', 'Delete', 'berita', 'berita', '9', 'angga123', 'asdasdadd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('144', '2020-02-09 22:15:49', 'admin', 'Delete', 'berita', 'berita', '8', 'angga123', 'asdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('145', '2020-02-09 22:15:53', 'admin', 'Update', '', 'berita', '2', 'angga123', 'Makan bersamaaa anak anaka');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('146', '2020-02-09 22:15:57', 'admin', 'Update', '', 'berita', '2', 'angga123', 'Makan bersamaaa anak anaka');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('147', '2020-02-09 22:16:23', 'admin', 'Update', '', 'berita', '2', 'angga123', 'Makan bersamaaa anak anaka');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('148', '2020-02-09 22:16:42', 'admin', 'Update', '', 'berita', '2', 'angga123', 'Makan bersamaaa anak anaka');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('149', '2020-02-09 22:17:33', 'admin', 'Update', '', 'berita', '2', 'angga123', 'Makan bersamaaa anak anakassssssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('150', '2020-02-09 22:17:37', 'admin', 'Update', '', 'berita', '2', 'angga123', 'Makan bersamaaa anak anakassssssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('151', '2020-02-09 22:33:37', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('152', '2020-02-09 22:33:54', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('153', '2020-02-09 22:41:01', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('154', '2020-02-09 22:42:17', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('155', '2020-02-09 22:44:02', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('156', '2020-02-09 22:46:13', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('157', '2020-02-09 23:20:40', 'admin', 'Insert', '', 'berita', '', 'angga123', 'dasdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('158', '2020-02-09 23:26:39', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('159', '2020-02-09 23:51:45', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('160', '2020-02-09 23:51:47', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('161', '2020-02-10 00:29:03', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdasdasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('162', '2020-02-10 00:29:10', 'admin', 'Delete', 'berita', 'berita', '16', 'angga123', 'asdasdasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('163', '2020-02-10 00:31:38', 'admin', 'Insert', '', 'berita', '15', 'angga123', 'sdfsdfsd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('164', '2020-02-10 00:52:19', 'admin', 'Update', '', 'berita', '15', 'angga123', 'asdasdasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('165', '2020-02-10 00:52:46', 'admin', 'Update', '', 'berita', '17', 'angga123', 'sdfsdfsd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('166', '2020-02-10 01:02:45', 'admin', 'Update', '', 'berita', '17', 'angga123', 'sdfsdfsd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('167', '2020-02-10 01:02:50', 'admin', 'Update', '', 'berita', '17', 'angga123', 'sdfsdfsd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('168', '2020-02-10 01:09:49', 'admin', 'Insert', '', 'berita', '17', 'angga123', 'asdasdadadda');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('169', '2020-02-10 01:10:06', 'admin', 'Update', '', 'berita', '18', 'angga123', 'asdasdadadda');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('170', '2020-02-10 01:10:22', 'admin', 'Update', '', 'berita', '18', 'angga123', 'asdasdadadda');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('171', '2020-02-10 01:10:33', 'admin', 'Update', '', 'berita', '18', 'angga123', 'asdasdadaddassssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('172', '2020-02-10 01:10:40', 'admin', 'Update', '', 'berita', '18', 'angga123', 'asdasdadaddassssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('173', '2020-02-10 01:11:32', 'admin', 'Update', '', 'berita', '17', 'angga123', 'sdfsdfsd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('174', '2020-02-10 01:11:36', 'admin', 'Update', '', 'berita', '18', 'angga123', 'asdasdadaddassssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('175', '2020-02-10 01:12:55', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('176', '2020-02-10 10:39:42', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('177', '2020-02-10 10:53:21', 'admin', 'Insert', '', 'berita', '17', 'angga123', 'asdasdadasdadada');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('178', '2020-02-10 11:01:35', 'admin', 'Insert', '', 'berita', '', 'angga123', 'iiiii');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('179', '2020-02-10 12:00:56', 'admin', 'Insert', '', 'berita', '', 'angga123', 'angga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('180', '2020-02-10 12:05:10', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdsddd  dsdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('181', '2020-02-10 12:13:25', 'admin', 'Delete', 'berita', 'berita', '22', 'angga123', 'asdsddd  dsdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('182', '2020-02-10 12:13:27', 'admin', 'Delete', 'berita', 'berita', '21', 'angga123', 'angga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('183', '2020-02-10 12:13:29', 'admin', 'Delete', 'berita', 'berita', '20', 'angga123', 'iiiii');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('184', '2020-02-10 12:13:31', 'admin', 'Delete', 'berita', 'berita', '19', 'angga123', 'asdasdadasdadada');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('185', '2020-02-10 12:13:33', 'admin', 'Delete', 'berita', 'berita', '18', 'angga123', 'asdasdadaddassssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('186', '2020-02-10 12:13:35', 'admin', 'Delete', 'berita', 'berita', '17', 'angga123', 'sdfsdfsd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('187', '2020-02-10 12:13:37', 'admin', 'Delete', 'berita', 'berita', '15', 'angga123', 'asdasdasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('188', '2020-02-10 12:14:55', 'admin', 'Insert', '', 'berita', '', 'angga123', 'angga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('189', '2020-02-10 12:16:47', 'admin', 'Insert', '', 'berita', '', 'angga123', 'angga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('190', '2020-02-10 12:38:34', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('191', '2020-02-10 12:47:02', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('192', '2020-02-10 12:47:07', 'admin', 'Update', '', 'berita', '25', 'angga123', 'asdssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('193', '2020-02-10 12:47:10', 'admin', 'Update', '', 'berita', '25', 'angga123', 'asdssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('194', '2020-02-10 12:54:11', 'admin', 'Insert', '', 'berita', '24', 'angga123', 'sdadasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('195', '2020-02-10 13:01:45', 'admin', 'Insert', '', 'berita', '', 'angga123', 'adasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('196', '2020-02-10 13:06:45', 'admin', 'Insert', '', 'berita', '', 'angga123', 'anggga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('197', '2020-02-10 13:07:10', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asddddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('198', '2020-02-10 13:08:27', 'admin', 'Update', '', 'berita', '27', 'angga123', 'adasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('199', '2020-02-10 13:08:32', 'admin', 'Update', '', 'berita', '27', 'angga123', 'adasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('200', '2020-02-10 13:08:54', 'admin', 'Update', '', 'berita', '26', 'angga123', 'sdadasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('201', '2020-02-10 13:38:07', 'admin', 'Update', '', 'berita', '26', 'angga123', 'sdadasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('202', '2020-02-10 13:38:15', 'admin', 'Update', '', 'berita', '26', 'angga123', 'sdadasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('203', '2020-02-10 13:55:32', 'admin', 'Insert', '', 'berita', '', 'angga123', 'iiii');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('204', '2020-02-10 13:55:54', 'admin', 'Update', '', 'berita', '26', 'angga123', 'sdadasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('205', '2020-02-10 13:58:12', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdassddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('206', '2020-02-10 13:59:10', 'admin', 'Insert', '', 'berita', '', 'angga123', 'xxxxxx');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('207', '2020-02-10 13:59:13', 'admin', 'Delete', 'berita', 'berita', '32', 'angga123', 'xxxxxx');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('208', '2020-02-10 13:59:14', 'admin', 'Delete', 'berita', 'berita', '31', 'angga123', 'asdassddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('209', '2020-02-10 13:59:16', 'admin', 'Delete', 'berita', 'berita', '30', 'angga123', 'iiii');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('210', '2020-02-10 13:59:18', 'admin', 'Delete', 'berita', 'berita', '29', 'angga123', 'asddddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('211', '2020-02-10 13:59:20', 'admin', 'Delete', 'berita', 'berita', '28', 'angga123', 'anggga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('212', '2020-02-10 13:59:24', 'admin', 'Delete', 'berita', 'berita', '25', 'angga123', 'asdssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('213', '2020-02-10 13:59:26', 'admin', 'Delete', 'berita', 'berita', '24', 'angga123', 'angga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('214', '2020-02-10 13:59:27', 'admin', 'Delete', 'berita', 'berita', '23', 'angga123', 'angga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('215', '2020-02-10 14:13:47', 'admin', 'Insert', '', 'berita', '', 'angga123', 'sdadadd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('216', '2020-02-10 14:14:17', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('217', '2020-02-10 14:14:23', 'admin', 'Delete', 'berita', 'berita', '34', 'angga123', 'asddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('218', '2020-02-10 14:14:25', 'admin', 'Delete', 'berita', 'berita', '33', 'angga123', 'sdadadd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('219', '2020-02-10 14:14:39', 'admin', 'Insert', '', 'berita', '', 'angga123', 'adsad');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('220', '2020-02-10 14:15:05', 'admin', 'Delete', 'berita', 'berita', '35', 'angga123', 'adsad');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('221', '2020-02-10 14:19:31', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('222', '2020-02-10 14:19:33', 'admin', 'Delete', 'berita', 'berita', '36', 'angga123', 'asdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('223', '2020-02-10 14:33:22', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdasdaddadd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('224', '2020-02-10 14:42:39', 'admin', 'Update', '', 'berita', '27', 'angga123', 'adasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('225', '2020-02-10 14:42:43', 'admin', 'Update', '', 'berita', '27', 'angga123', 'adasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('226', '2020-02-10 14:50:11', 'admin', 'Insert', '', 'berita', '', 'angga123', 'adasdadddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('227', '2020-02-10 14:54:19', 'admin', 'Insert', '', 'berita', '', 'angga123', 'adddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('228', '2020-02-10 14:55:07', 'admin', 'Update', '', 'berita', '39', 'angga123', 'adddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('229', '2020-02-10 14:55:11', 'admin', 'Update', '', 'berita', '39', 'angga123', 'adddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('230', '2020-02-10 15:12:19', 'admin', 'Update', '', 'berita', '39', 'angga123', 'adddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('231', '2020-02-10 15:53:56', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('232', '2020-02-10 15:54:06', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdasdasdads');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('233', '2020-02-10 16:35:57', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('234', '2020-02-10 16:37:22', 'admin', 'Insert', '', 'berita', '', 'angga123', 'ADASDASDASD');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('235', '2020-02-10 17:01:10', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdasdadasdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('236', '2020-02-10 17:02:03', 'admin', 'Insert', '', 'berita', '', 'angga123', 'adadddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('237', '2020-02-10 17:02:06', 'admin', 'Delete', 'berita', 'berita', '43', 'angga123', 'adadddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('238', '2020-02-10 17:02:08', 'admin', 'Delete', 'berita', 'berita', '42', 'angga123', 'asdasdadasdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('239', '2020-02-10 17:02:10', 'admin', 'Delete', 'berita', 'berita', '41', 'angga123', 'ADASDASDASD');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('240', '2020-02-10 17:02:12', 'admin', 'Delete', 'berita', 'berita', '40', 'angga123', 'asdasdasdads');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('241', '2020-02-10 17:02:20', 'admin', 'Update', '', 'berita', '39', 'angga123', 'adddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('242', '2020-02-10 18:17:12', 'admin', 'Update', '', 'berita', '27', 'angga123', 'adasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('243', '2020-02-10 19:14:17', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('244', '2020-02-10 20:24:44', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('245', '2020-02-10 20:26:51', 'admin', 'Delete', 'berita', 'berita', '39', 'angga123', 'adddddd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('246', '2020-02-10 20:44:33', 'admin', 'Insert', '', 'galeri', '', 'Diklatsar', 'fgfghf');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('247', '2020-02-10 21:00:01', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('248', '2020-02-10 21:00:13', 'admin', 'Update', '', 'berita', '45', 'angga123', 'asdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('249', '2020-02-10 21:00:49', 'admin', 'Insert', '', 'berita', '45', 'angga123', 'angga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('250', '2020-02-10 21:01:12', 'admin', 'Delete', 'berita', 'berita', '46', 'angga123', 'angga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('251', '2020-02-10 21:05:15', 'admin', 'Insert', '', 'berita', '26', 'angga123', 'asdasdasdad');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('252', '2020-02-10 21:15:38', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdasdadad');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('253', '2020-02-10 21:24:04', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdadadasdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('254', '2020-02-10 21:24:09', 'admin', 'Delete', 'berita', 'berita', '49', 'angga123', 'asdadadasdas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('255', '2020-02-10 21:31:25', 'admin', 'Update', '', 'berita', '48', 'angga123', 'asdasdadad');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('256', '2020-02-10 22:07:55', 'admin', 'Insert', '', 'berita', '', 'angga123', 'asdsdddddasdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('257', '2020-02-10 22:15:38', 'admin', 'Insert', '', 'berita', '', 'angga123', 'dasdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('258', '2020-02-10 22:20:50', 'admin', 'Insert', 'Backup', 'backup_db', '', 'sakura_20200210-152050.sql', '51665 bytes');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('259', '2020-02-10 22:35:13', 'admin', 'Delete', 'berita', 'berita', '48', 'angga123', 'asdasdadad');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('260', '2020-02-10 22:35:15', 'admin', 'Delete', 'berita', 'berita', '47', 'angga123', 'asdasdasdad');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('261', '2020-02-10 22:35:17', 'admin', 'Delete', 'berita', 'berita', '45', 'angga123', 'asdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('262', '2020-02-10 22:47:59', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('263', '2020-02-11 12:09:17', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('264', '2020-02-11 12:16:49', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('265', '2020-02-11 13:32:13', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('266', '2020-02-12 10:44:58', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('267', '2020-02-12 11:00:32', 'admin', 'Insert', '', 'galeri', '', 'Diklatsar', 'aewaadasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('268', '2020-02-12 11:57:33', 'admin', 'Insert', '', 'barang', '', 'Lemari', 'ATK');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('269', '2020-02-12 11:58:11', 'admin', 'Update', '', 'barang', '1', 'Lemari', 'ATK');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('270', '2020-02-12 11:58:14', 'admin', 'Delete', 'barang', 'barang', '1', 'Lemari', 'ATK');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('271', '2020-02-12 14:08:40', 'admin', 'Insert', '', 'surat_masuk', '', 'ksr unhas', 'Kegiatan tanggal 10 maret 2020');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('272', '2020-02-12 14:11:20', 'admin', 'Update', '', 'surat_masuk', '1', 'ksr unhas', 'Kegiatan tanggal 10 maret 2020');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('273', '2020-02-13 15:37:01', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('274', '2020-02-14 06:37:13', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('275', '2020-02-14 08:38:52', 'admin', 'Update', '', 'berita', '51', 'angga123', 'dasdasdasd');


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

INSERT INTO `user` (`id`, `akses_level`, `username`, `password`, `nama`, `pekerjaan`, `email`, `facebook`, `instagram`, `photo`, `motto`, `created`) VALUES ('8', 'admin', 'angga123', '1fd5cd9766249f170035b7251e2c6b61', 'Angga Kurniawan', 'Web Developer (Insya Allah)....', 'angga99124@gmail.com', 'anggakurniawan', 'anggawan_09', 'sbmptn.jpg', 'Santai Senyum Selesai', '2020-02-08 00:28:39');


