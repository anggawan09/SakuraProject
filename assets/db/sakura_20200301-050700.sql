#
# TABLE STRUCTURE FOR: anggota
#

DROP TABLE IF EXISTS `anggota`;

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `gender` enum('laki-laki','perempuan') NOT NULL,
  `status` enum('pengurus inti','perngurus biasa','demisioner') NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `angkatan` varchar(50) NOT NULL,
  `kotalahir` varchar(255) NOT NULL,
  `tanggallahir` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `pekerjaan` varchar(255) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `darah` varchar(5) NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2164 DEFAULT CHARSET=latin1;

INSERT INTO `anggota` (`id`, `nama`, `gender`, `status`, `jabatan`, `angkatan`, `kotalahir`, `tanggallahir`, `alamat`, `pekerjaan`, `telepon`, `darah`, `email`, `facebook`, `instagram`, `twitter`, `photo`, `created`) VALUES ('2158', 'Angga Kurniawan', 'laki-laki', '', 'Anggota ', 'kehormatan', 'Makassar', '2020-02-11', 'Perumnas sudiang. jalan tator raya blok H No. 62c', 'Wiraswasta', '085299665037', 'b', 'angganackcopo@yahoo.com', 'angga.macassar', 'anggawan_09', '', '1581661239633.jpg', '2020-02-19 17:52:24');
INSERT INTO `anggota` (`id`, `nama`, `gender`, `status`, `jabatan`, `angkatan`, `kotalahir`, `tanggallahir`, `alamat`, `pekerjaan`, `telepon`, `darah`, `email`, `facebook`, `instagram`, `twitter`, `photo`, `created`) VALUES ('2160', 'AR AZLANSYAH S.Sos', 'laki-laki', 'pengurus inti', 'Sekretaris Umum', '8', 'Makassar', '2020-02-10', 'Perintis Kemerdakaan KM.8 Nomor 1', 'Wiraswasta', '085299665037', 'b', 'angganackcopo@yahoo.com', 'ar.azlansyah', '', '', '1582105906488.jpg', '2020-02-19 17:51:46');
INSERT INTO `anggota` (`id`, `nama`, `gender`, `status`, `jabatan`, `angkatan`, `kotalahir`, `tanggallahir`, `alamat`, `pekerjaan`, `telepon`, `darah`, `email`, `facebook`, `instagram`, `twitter`, `photo`, `created`) VALUES ('2161', 'Hikmawati S.Sos', 'perempuan', 'pengurus inti', 'Bendahara Umum', '6', 'Makassar', '2020-02-26', 'sinassara', 'Wiraswasta', '085299665037', 'b', 'angganackcopo@yahoo.com', '', '', '', '1582177592461.jpg', '2020-02-20 13:47:31');
INSERT INTO `anggota` (`id`, `nama`, `gender`, `status`, `jabatan`, `angkatan`, `kotalahir`, `tanggallahir`, `alamat`, `pekerjaan`, `telepon`, `darah`, `email`, `facebook`, `instagram`, `twitter`, `photo`, `created`) VALUES ('2162', 'Muhammad Yusran ', 'laki-laki', 'pengurus inti', 'Wakil Komandan', '6', 'Makassar', '2020-02-04', 'sudiang', 'Pemadam Kebakaran', '0852 9966 5037', 'o', 'angganackcopo@yahoo.com', '', '', '', '1582177866511.jpg', '2020-02-20 13:51:06');
INSERT INTO `anggota` (`id`, `nama`, `gender`, `status`, `jabatan`, `angkatan`, `kotalahir`, `tanggallahir`, `alamat`, `pekerjaan`, `telepon`, `darah`, `email`, `facebook`, `instagram`, `twitter`, `photo`, `created`) VALUES ('2163', 'Mitha Arnika S.Sos', 'perempuan', 'pengurus inti', 'Komandan', '9', 'Makassar', '2020-02-26', 'Sudiang', 'PNS', '085299665037', 'b', 'angganackcopo@yahoo.com', 'Mithaart', '', '', '1582105898533.jpg', '2020-02-20 13:52:30');


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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

INSERT INTO `backup_db` (`id`, `nama`, `tanggal`, `size`) VALUES ('57', 'sakura_20200207-170503.sql', '2020-02-08 00:05:03', '12172 bytes');
INSERT INTO `backup_db` (`id`, `nama`, `tanggal`, `size`) VALUES ('58', 'sakura_20200210-152050.sql', '2020-02-10 22:20:50', '51665 bytes');
INSERT INTO `backup_db` (`id`, `nama`, `tanggal`, `size`) VALUES ('59', 'sakura_20200214-022113.sql', '2020-02-14 09:21:13', '59102 bytes');


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
  `photo` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kategori` (`kategori`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori_barang` (`kategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `barang` (`id`, `kode_barang`, `nama`, `kategori`, `kondisi`, `jumlah`, `photo`, `created`) VALUES ('5', 'a', 'a', 'ssss', 'kurang layak', '2', '', '2020-02-18 21:21:30');


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
  `photo` varchar(255) DEFAULT NULL,
  `status_berita` enum('publish','draft') NOT NULL,
  `jenis` enum('berita','slider','kegiatan') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `slug_berita` (`slug_berita`),
  KEY `kategori` (`kategori`),
  KEY `id_user` (`username`),
  KEY `id_berita_2` (`id`),
  CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori_berita` (`kategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `berita_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('53', 'angga123', 'Sportfitas', 'selamat-datang-di-website-ksr-sakura-makassar', 'Selamat Datang di Website KSR SAKURA MAKASSAR', '<p>Website ini adalah Website Resmi <strong>KSR PMI UNIT 106 SAKURA MAKASSAR</strong></p>\r\n', '1582093454939.jpg', 'publish', 'slider', '2020-02-19 14:24:14');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('54', 'angga123', 'Sport', 'diklatsar-angkatan-xiii', 'DIKLATSAR ANGKATAN XIII', '', '1582097634501.jpg', 'publish', 'slider', '2020-02-19 15:33:54');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('62', 'angga123', 'Makan', 'latihan-bersama-basarnas', 'Latihan Bersama Basarnas', '', '1582275178866.jpg', 'publish', 'slider', '2020-02-21 16:52:58');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('63', 'angga123', 'Sportfitas', 'basarnas-lagi-beraksi', 'Basarnas Lagi Beraksi', '<p>orem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus id dignissimos nemo minus perspiciatis ullam itaque voluptas iure vero, nesciunt unde odit aspernatur distinctio, maiores facere officiis. Cum, esse, iusto?</p>\r\n\r\n<p>Minus perspiciatis ullam itaque voluptas iure vero, nesciunt unde odit aspernatur distinctio, maiores facere officiis. Cum, esse, iusto?</p>\r\n', '1582206568410.jpg', 'publish', 'berita', '2020-02-20 21:49:28');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('64', 'angga123', 'Sport', 'memotong-teks-dan-kalimat-dengan-php', 'Memotong Teks dan Kalimat dengan PHP', '<p>Kedua script diatas sama sama menghasilkan kalimat&nbsp;<strong>Contoh script yang digunakan untuk memotong 50 fungsi&hellip;&nbsp;</strong>, script pertama&nbsp;lebih simpel dan mudah dibaca/difahami, namun&nbsp;setelah dites, lagi lagi&nbsp;script ke dua yang menggunakan string index (<code>$text{++$num_char}</code>) rata-rata waktu eksekusinya 5x lebih cepat dibanding dengan script pertama.</p>\r\n', '1582539212502.jpg', 'publish', 'berita', '2020-02-24 18:13:32');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('65', 'angga123', 'Sportfitas', 'panduan-lengkap-query-mysql-tutorial-dan-referensi-lengkap-query-mysql', 'Panduan Lengkap Query MySQL - Tutorial dan Referensi Lengkap Query MySQL', '<p>Pada kondisi tertentu terkadang kita perlu untuk memotong teks yang terlalu panjang, misal untuk suatu artikel yang cukup panjang kita potong 50&nbsp;karakter pertama untuk membuat previewnya. Berikut beberapa kemungkinan kondisi yang dihadapi dan alternatif pemecahannya.</p>\r\n', '1582209504110.jpg', 'publish', 'kegiatan', '2020-02-23 01:07:03');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('66', 'angga123', 'Sportfitas', 'how-to-find-gold-in-mining', 'HOW TO FIND GOLD IN MINING', '<p>Kedua script diatas sama sama menghasilkan kalimat&nbsp;<strong>Contoh script yang digunakan untuk memotong 50&hellip;&nbsp;</strong>, script ke dua lebih simpel dan lebih mudah dibaca/difahami,&nbsp;dan setelah dites, ternyata script ke dua yang menggunakan string index (<code>$text{--$num_char}</code>) rata-rata waktu eksekusi 3x lebih cepat dibanding dengan script pertama.</p>\r\n', '1582209570876.jpg', 'publish', 'kegiatan', '2020-02-23 01:11:19');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('67', 'angga123', 'Sport', 'diklatsar-ksr-sakura', 'Diklatsar KSR SAKURA', '<p>Kedua script diatas sama sama menghasilkan kalimat&nbsp;<strong>Contoh script yang digunakan untuk memotong 50&hellip;&nbsp;</strong>, script ke dua lebih simpel dan lebih mudah dibaca/difahami,&nbsp;dan setelah dites, ternyata script ke dua yang menggunakan string index (<code>$text{--$num_char}</code>) rata-rata waktu eksekusi 3x lebih cepat dibanding dengan script pertama.</p>\r\n', '1582212887215.jpg', 'publish', 'kegiatan', '2020-02-20 23:37:43');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('68', 'angga123', 'Sportfitas', 'angkatan-xiii-ksr-sakura', 'Angkatan XIII KSR SAKURA', '<p>Kedua script diatas sama sama menghasilkan kalimat&nbsp;<strong>Contoh script yang digunakan untuk memotong 50 fungsi&hellip;&nbsp;</strong>, script pertama&nbsp;lebih simpel dan mudah dibaca/difahami, namun&nbsp;setelah dites, lagi lagi&nbsp;script ke dua yang menggunakan string index (<code>$text{++$num_char}</code>) rata-rata waktu eksekusinya 5x lebih cepat dibanding dengan script pertama.</p>\r\n', '1582213261220.jpg', 'publish', 'kegiatan', '2020-02-20 23:41:01');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('69', 'angga123', 'Makan', 'requritment-platoon-xii', 'Requritment Platoon XII', '<p>Kedua script diatas sama sama menghasilkan kalimat&nbsp;<strong>Contoh script yang digunakan untuk memotong 50 fungsi&hellip;&nbsp;</strong>, script pertama&nbsp;lebih simpel dan mudah dibaca/difahami, namun&nbsp;setelah dites, lagi lagi&nbsp;script ke dua yang menggunakan string index (<code>$text{++$num_char}</code>) rata-rata waktu eksekusinya 5x lebih cepat dibanding dengan script pertama.</p>\r\n', '1582213501299.jpg', 'publish', 'kegiatan', '2020-02-20 23:45:01');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('70', 'angga123', 'Makan', 'presentasi-makalah-ksr-sakura', 'Presentasi Makalah KSR SAKURA', '<p>Kedua script diatas sama sama menghasilkan kalimat&nbsp;<strong>Contoh script yang digunakan untuk memotong 50 fungsi&hellip;&nbsp;</strong>, script pertama&nbsp;lebih simpel dan mudah dibaca/difahami, namun&nbsp;setelah dites, lagi lagi&nbsp;script ke dua yang menggunakan string index (<code>$text{++$num_char}</code>) rata-rata waktu eksekusinya 5x lebih cepat dibanding dasdasdasdssss</p>\r\n', '1582213634090.jpg', 'publish', 'kegiatan', '2020-02-20 23:47:14');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('71', 'angga123', 'Sportfitas', 'membuat-crud-dengan-php', 'Membuat CRUD Dengan PHP', '<p>Drafts represent unsent messages with the&nbsp;<code>DRAFT</code>&nbsp;system label applied. The message contained within the draft cannot be edited once created, but it can be replaced. In this sense, the&nbsp;<a href=\"https://developers.google.com/gmail/api/v1/reference/users/drafts\">draft resource</a>&nbsp;is simply a container that provides a stable ID because the underlying message IDs change every time the message is replaced.</p>\r\n\r\n<p><a href=\"https://developers.google.com/gmail/api/v1/reference/users/messages\">Message resources</a>&nbsp;inside a draft have similar behavior to other messages except for the following differences:</p>\r\n\r\n<ul>\r\n	<li>Draft messages cannot have any label other than the&nbsp;<code>DRAFT</code>&nbsp;system label.</li>\r\n	<li>When the draft is sent, the draft is automatically deleted and a new message with an updated ID is created with the&nbsp;<code>SENT</code>&nbsp;system label. This message is returned in the&nbsp;<a href=\"https://developers.google.com/gmail/api/v1/reference/users/drafts/send\"><code>drafts.send</code></a>&nbsp;response.</li>\r\n</ul>\r\n\r\n<h2>Creating draft messages</h2>\r\n\r\n<p>Your application can create drafts using the&nbsp;<a href=\"https://developers.google.com/gmail/api/v1/reference/users/drafts/create\">drafts.create</a>&nbsp;method. The general process is to:</p>\r\n\r\n<ol>\r\n	<li>Create a MIME message that complies with&nbsp;<a href=\"http://www.ietf.org/rfc/rfc2822.txt\">RFC 2822</a>.</li>\r\n	<li>Convert the message to a base64url encoded string.</li>\r\n	<li><a href=\"https://developers.google.com/gmail/api/v1/reference/users/drafts/create\">Create a draft</a>, setting the value of the&nbsp;<code>drafts.message.raw</code>&nbsp;field to the encoded string.</li>\r\n</ol>\r\n\r\n<p>The following code examples demonstrate the process.</p>\r\n', '1582441376160.jpg', 'publish', 'kegiatan', '2020-02-24 15:16:50');
INSERT INTO `berita` (`id`, `username`, `kategori`, `slug_berita`, `judul_berita`, `isi`, `photo`, `status_berita`, `jenis`, `created`) VALUES ('72', 'angga123', 'Makan', 'lenovo-a7000', 'Lenovo a7000', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus id dignissimos nemo minus perspiciatis ullam itaque voluptas iure vero, nesciunt unde odit aspernatur distinctio, maiores facere officiis. Cum, esse, iusto?</p>\r\n\r\n<p>Minus perspiciatis ullam itaque voluptas iure vero, nesciunt unde odit aspernatur distinctio, maiores facere officiis. Cum, esse, iusto?</p>\r\n', '1582531592234.jpg', 'publish', 'berita', '2020-02-24 16:06:32');


#
# TABLE STRUCTURE FOR: chat
#

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `attachment_name` text NOT NULL,
  `file_ext` text NOT NULL,
  `mime_type` text NOT NULL,
  `message_date_time` text NOT NULL,
  `ip_address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;

INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('178', '8', '12', 'kenapa angga ?', '', '', '', '2020-02-18 11:10:20', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('180', '8', '12', 'ihh gajenya', '', '', '', '2020-02-18 11:10:48', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('181', '12', '8', 'a', '', '', '', '2020-02-18 11:14:01', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('182', '12', '8', 'a', '', '', '', '2020-02-18 11:14:03', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('183', '12', '8', 'a', '', '', '', '2020-02-18 11:14:04', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('184', '12', '8', 'd', '', '', '', '2020-02-18 11:53:54', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('185', '12', '8', 'f', '', '', '', '2020-02-18 11:53:55', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('186', '12', '8', 'angga', '', '', '', '2020-02-18 11:53:57', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('187', '12', '8', 'oiii', '', '', '', '2020-02-18 11:53:58', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('188', '12', '8', 'apa akbaarrrr', '', '', '', '2020-02-18 11:54:01', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('189', '8', '12', 'oiii', '', '', '', '2020-02-18 11:54:15', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('190', '8', '12', 'knpakoo', '', '', '', '2020-02-18 11:54:18', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('191', '8', '12', 'woi', '', '', '', '2020-02-18 21:21:46', '::1');
INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `attachment_name`, `file_ext`, `mime_type`, `message_date_time`, `ip_address`) VALUES ('192', '8', '11', 'a', '', '', '', '2020-02-21 16:51:15', '::1');


#
# TABLE STRUCTURE FOR: galeri
#

DROP TABLE IF EXISTS `galeri`;

CREATE TABLE `galeri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kategori` (`kategori`),
  KEY `id_kategori` (`kategori`),
  CONSTRAINT `galeri_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori_galeri` (`kategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `galeri` (`id`, `kategori`, `photo`, `keterangan`, `created`) VALUES ('1', 'Diklatsar', '1582695877539.jpg', 'fgfghf', '2020-02-26 13:44:37');
INSERT INTO `galeri` (`id`, `kategori`, `photo`, `keterangan`, `created`) VALUES ('2', 'Diklatsar', '1582695869008.jpg', 'aewaadasd', '2020-02-26 13:44:29');
INSERT INTO `galeri` (`id`, `kategori`, `photo`, `keterangan`, `created`) VALUES ('3', 'Diklatsar', '1582698546683.jpg', 'sss', '2020-02-26 14:29:06');
INSERT INTO `galeri` (`id`, `kategori`, `photo`, `keterangan`, `created`) VALUES ('4', 'Diklatsar', '1582698557535.jpg', 'h', '2020-02-26 14:29:17');
INSERT INTO `galeri` (`id`, `kategori`, `photo`, `keterangan`, `created`) VALUES ('5', 'Diklatsar', '1582698567332.jpg', 'gg', '2020-02-26 14:29:27');


#
# TABLE STRUCTURE FOR: hub
#

DROP TABLE IF EXISTS `hub`;

CREATE TABLE `hub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_awal` varchar(255) NOT NULL,
  `nama_akhir` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `hub` (`id`, `nama_awal`, `nama_akhir`, `email`, `pesan`, `created`) VALUES ('9', 'annnn', 'ddddd', 'sssss', 'Danger alert preview. This alert is dismissable. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. \r\nThere is a problem that we need to fix. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.', '2020-02-26 00:07:20');
INSERT INTO `hub` (`id`, `nama_awal`, `nama_akhir`, `email`, `pesan`, `created`) VALUES ('10', 'annnn', 'sss', 'angga99124@gmail.com', 'sdadasd', '2020-02-26 16:00:40');


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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO `kategori_barang` (`id`, `kategori`, `sekilas`, `created`) VALUES ('16', 'ssss', 'aaaa', '2020-02-17 11:28:58');


#
# TABLE STRUCTURE FOR: kategori_berita
#

DROP TABLE IF EXISTS `kategori_berita`;

CREATE TABLE `kategori_berita` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) NOT NULL,
  `sekilas` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kategori` (`kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('24', '1581078859357.jpg', 'Sport', 'memberikan kebugaran jasmani dan rohani dan rekreasi', '2020-02-07 20:35:16');
INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('26', '1581090302929.jpg', 'Makan', 'asdasd', '2020-02-07 23:58:09');
INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('27', '1581091182323.jpg', 'Sportfitas', 'meninkgatkan timbangan', '2020-02-07 23:59:42');
INSERT INTO `kategori_berita` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('28', '1581180562307.jpg', 'asdasd', 'sadasd', '2020-02-09 00:49:22');


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

INSERT INTO `kategori_galeri` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('20', '1582689165546.jpg', 'Diklatsar', 'Pendidikan dan Latihan Dasar 1998', '2020-02-26 11:52:45');
INSERT INTO `kategori_galeri` (`id`, `photo`, `kategori`, `sekilas`, `created`) VALUES ('21', '1582695513248.jpg', 'Mantap mantap', 'memberikan kesejukan dan kesegaran', '2020-02-26 13:38:33');


#
# TABLE STRUCTURE FOR: komentar
#

DROP TABLE IF EXISTS `komentar`;

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug_berita` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `slug_berita` (`slug_berita`),
  CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`slug_berita`) REFERENCES `berita` (`slug_berita`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `komentar` (`id`, `slug_berita`, `nama`, `email`, `pesan`, `created`) VALUES ('1', 'diklatsar-ksr-sakura', 'Wawan Gunawan', 'angganackcopo@yahoo.com', 'asdsdasdsdasd', '2020-02-23 00:17:34');
INSERT INTO `komentar` (`id`, `slug_berita`, `nama`, `email`, `pesan`, `created`) VALUES ('2', 'presentasi-makalah-ksr-sakura', 'Wawan Gunawan', 'angganackcopo@yahoo.com', 'adasdasdasdasdasd', '2020-02-23 00:18:39');
INSERT INTO `komentar` (`id`, `slug_berita`, `nama`, `email`, `pesan`, `created`) VALUES ('3', 'diklatsar-ksr-sakura', 'Wawan Gunawan', 'angganackcopo@yahoo.com', 'ASasAS', '2020-02-23 00:19:48');
INSERT INTO `komentar` (`id`, `slug_berita`, `nama`, `email`, `pesan`, `created`) VALUES ('4', 'diklatsar-ksr-sakura', 'Wawan Gunawan', 'angganackcopo@yahoo.com', 'dsdfsdfsfs', '2020-02-23 00:21:51');
INSERT INTO `komentar` (`id`, `slug_berita`, `nama`, `email`, `pesan`, `created`) VALUES ('5', 'diklatsar-ksr-sakura', 'Angga Kurniawa', 'angga99124@gmail.com', 'Mantp twwa ksr sakurraaa !!!!', '2020-02-23 00:35:44');
INSERT INTO `komentar` (`id`, `slug_berita`, `nama`, `email`, `pesan`, `created`) VALUES ('6', 'presentasi-makalah-ksr-sakura', 'Angga Kurniawan', 'angga99124@gmail.com', 'adddd', '2020-02-23 12:55:41');
INSERT INTO `komentar` (`id`, `slug_berita`, `nama`, `email`, `pesan`, `created`) VALUES ('7', 'membuat-crud-dengan-php', 'Wawan Gunawan', 'nanangf4bregas769@yahoo.com', 'sssss', '2020-02-23 15:05:44');
INSERT INTO `komentar` (`id`, `slug_berita`, `nama`, `email`, `pesan`, `created`) VALUES ('8', 'presentasi-makalah-ksr-sakura', 'Wawan Gunawan', 'admin@ca.com', 'asdasd', '2020-02-24 15:32:44');
INSERT INTO `komentar` (`id`, `slug_berita`, `nama`, `email`, `pesan`, `created`) VALUES ('9', 'presentasi-makalah-ksr-sakura', 'Wawan Gunawan', 'angganackcopo@yahoo.com', 'asdasdasd', '2020-02-27 15:57:18');


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
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `periode` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `konfigurasi` (`id`, `nama`, `alamat`, `telepon`, `email`, `instagram`, `facebook`, `twitter`, `website`, `periode`, `photo`, `created`) VALUES ('0', 'KSR PMI UNIT 106 SAKURA MAKASSAR', 'Jl. Kandea No.16, Baraya, Kec. Bontoala, Kota Makassar, Sulawesi Selatan 90211', '0852 9966 5037', 'ksrsakura@gmail.com', 'sakura_corps', 'profile.php?id=100037496585247', 'KSRSAKURA', 'ksrsakura.com', '2019-2021', '1582104727926.png', '2020-02-25 23:36:18');


#
# TABLE STRUCTURE FOR: notifikasi
#

DROP TABLE IF EXISTS `notifikasi`;

CREATE TABLE `notifikasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

INSERT INTO `notifikasi` (`id`, `user`, `judul`, `isi`, `url`, `icon`, `created`) VALUES ('81', 'admin', 'Data Permohonan Telah ditolak', 'KSR PMI UNHAS', 'Permohonan_tolak', 'fa fa-thumbs-down', '2020-02-26 16:04:55');
INSERT INTO `notifikasi` (`id`, `user`, `judul`, `isi`, `url`, `icon`, `created`) VALUES ('82', 'admin', 'Data Permohonan Telah Valid', 'sdasd', 'Permohonan_valid', 'fa fa-thumbs-o-up', '2020-02-28 10:14:55');


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
  `keterangan` text NOT NULL,
  `aksi` enum('valid','tolak') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `permohonan` (`id`, `instansi`, `perihal`, `jumlah`, `contact`, `keterangan`, `aksi`, `created`) VALUES ('1', 'KSR PMI UNHAS', 'Tenaga Lapangan', '10', '0852 9966 5037', '', 'tolak', '2020-02-11 15:12:39');
INSERT INTO `permohonan` (`id`, `instansi`, `perihal`, `jumlah`, `contact`, `keterangan`, `aksi`, `created`) VALUES ('2', 'KSR PMI BOSOWA', 'Tenaga Medis', '10', '0852 9966 5037', '', 'tolak', '2020-02-11 15:27:20');
INSERT INTO `permohonan` (`id`, `instansi`, `perihal`, `jumlah`, `contact`, `keterangan`, `aksi`, `created`) VALUES ('3', 'KSR PMI UNM', 'Tenaga Lapangan', '20', '0852 9966 5037', '', 'valid', '2020-02-11 16:25:16');
INSERT INTO `permohonan` (`id`, `instansi`, `perihal`, `jumlah`, `contact`, `keterangan`, `aksi`, `created`) VALUES ('4', 'KSR PMI UNHAS', 'Tenaga Lapangan', '10', '085299664003', 'Menjadi tenaga lapangn pada outdoor 100 ksr pmi unhas', 'valid', '2020-02-26 15:21:14');
INSERT INTO `permohonan` (`id`, `instansi`, `perihal`, `jumlah`, `contact`, `keterangan`, `aksi`, `created`) VALUES ('5', 'KSR PMI UNHAS', 'Tenaga Medis', '12', '085299664003', 'Menjadi tenaga medis di kegiatan futsal cup', 'valid', '2020-02-26 15:24:09');
INSERT INTO `permohonan` (`id`, `instansi`, `perihal`, `jumlah`, `contact`, `keterangan`, `aksi`, `created`) VALUES ('6', 'KSR PMI UNHAS', 'Tenaga Medis', '1222', '085299664003', 'addadad', 'tolak', '2020-02-26 16:04:29');
INSERT INTO `permohonan` (`id`, `instansi`, `perihal`, `jumlah`, `contact`, `keterangan`, `aksi`, `created`) VALUES ('7', 'asdasd', 'Juri Lomba', '222', 'asdasd', 'asdad', '', '2020-02-27 18:45:28');
INSERT INTO `permohonan` (`id`, `instansi`, `perihal`, `jumlah`, `contact`, `keterangan`, `aksi`, `created`) VALUES ('8', 'sdasd', 'Juri Lomba', '3', '23123', 'sdasd', 'valid', '2020-02-27 19:11:19');


#
# TABLE STRUCTURE FOR: profil
#

DROP TABLE IF EXISTS `profil`;

CREATE TABLE `profil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` enum('Sejarah','Struktur organisasi','Visi','Misi') NOT NULL,
  `isi` longtext NOT NULL,
  `status_profile` enum('draft','publish','','') NOT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `profil` (`id`, `jenis`, `isi`, `status_profile`, `photo`, `created`) VALUES ('1', 'Sejarah', '<p>GEOGRAFIS KSR SAKURA Korps Sukarela Unit 106 Sakura Makassar pada awal pembentukan berdomisili di jl. Lanto Dg. Pasewang No. 55 Makassar (Markas PMI Kota Makassar) sejak tahun 1995 sampai 2010 dan di tahun 2011 berdomisili di Kompleks Kesehatan Banta-Bantaeng K6/6 Jl. Wijaya Kusuma Kelurahan Banta-Bantaeng Kecamatan Rappocini Kota Makassar, dan di tahun 2017 hingga saat ini berdomisili di Jl. Kande No 16 makassar.</p>\r\n\r\n<hr />\r\n<p>Korps Sukarela Unit 106 Sakura Makassar sebagai salah satu PMI yang ada di wilayah kota makassar dari waktu ke waktu terus melakukan pembenahan dan pengembangan pengembangan kepengurusan ini yang memulai kerja sejak januri 2019, merupakan periode kepengurusan yang memiliki tantangan tersendiri dalam menjalankan roda organisasi, mengingat pada periode ini perkembangan organisasi di anggap mampu beradabtasi dari berbagai situasi dan perkembangan yang cukup.</p>\r\n\r\n<p>Kemampuan ini menjadikan Korps Sukarela Unit 106 Sakura Makassar merupakan salah satu organisasi yang cukup diperhitungkan keberadaanya baik, dimasyarakat, pemerintahan dan swasta, maupun internal organisasi sendiri. Hal ini terbukti dengan seringnya Korps Sukarela Unit 106 Sakura Makassar di undang untuk menghadiri event event mengirimkan sumber daya manusianya untuk membatu sesama manuasi dalam hal menegmbangkan kapasitas oraganisasi. menjadi juri juri disetiap lomba kepalang merahan yang diadakan oleh sekolah sekolah yang ada dimakassar.</p>\r\n', 'publish', '1582217982521.jpg', '2020-02-21 00:59:42');
INSERT INTO `profil` (`id`, `jenis`, `isi`, `status_profile`, `photo`, `created`) VALUES ('2', 'Struktur organisasi', '', 'publish', '1582695632096.png', '2020-02-26 13:40:32');
INSERT INTO `profil` (`id`, `jenis`, `isi`, `status_profile`, `photo`, `created`) VALUES ('3', 'Visi', 'Menumbuhkan benih kemanusiaan global profesional berbasis kedermawanan dan kerelawanan masyarakat global untuk mewujudkan peradaban dunia yang lebih baik dalam penangulangan bencana.', 'publish', '1582703183758.jpg', '2020-02-26 15:46:23');
INSERT INTO `profil` (`id`, `jenis`, `isi`, `status_profile`, `photo`, `created`) VALUES ('4', 'Misi', '<ol>\r\n	<li>Menyebarkan benih kepedulian kepada sesama, sehingga penanggulangan bencana diberbagai wilayah bisa berjalan dan berkembang dengan sangat baik secara bersama-sama serta berkesinambungan.</li>\r\n	<li>Mengorganisir dan mengelola berbagai persoalan kemanusiaan secara terencana, terkonsep, terintegrasi, sehingga menjadi formula ideal dalam mengatasi berbagai problem kemanusiaan dengan baik</li>\r\n	<li>Mengorganisir dan mengelola segala potensi kedermawanan relawan kemanusian global sebagai modal sosial untuk mengatasi berbagai problem kemanusiaan baik dalam skala lokal,</li>\r\n</ol>\r\n', 'publish', '1582703116038.jpg', '2020-02-26 15:45:16');


#
# TABLE STRUCTURE FOR: surat_keluar
#

DROP TABLE IF EXISTS `surat_keluar`;

CREATE TABLE `surat_keluar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomor` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `instansi` varchar(255) NOT NULL,
  `penugasan` varchar(255) NOT NULL,
  `tanggal_mulai` varchar(255) NOT NULL,
  `tanggal_akhir` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `photo` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=latin1;

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
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('276', '2020-02-14 09:21:13', 'admin', 'Insert', 'Backup', 'backup_db', '', 'sakura_20200214-022113.sql', '59102 bytes');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('277', '2020-02-14 10:51:49', 'admin', 'Insert', '', 'anggota', '', 'anng', '1');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('278', '2020-02-14 10:59:56', 'admin', 'Insert', '', 'anggota', '', 'asdasda', '3');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('279', '2020-02-14 11:06:06', 'admin', 'Insert', '', 'anggota', '', 'asdasdasdas', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('280', '2020-02-14 13:18:07', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('281', '2020-02-14 13:19:04', 'admin', 'Insert', '', 'anggota', '', 'anng', 'rekayasa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('282', '2020-02-14 13:19:53', 'admin', 'Insert', '', 'anggota', '', 'asdsadas', '2');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('283', '2020-02-14 13:20:39', 'admin', 'Insert', '', 'anggota', '2148', 'asdasd', '3');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('284', '2020-02-14 13:24:38', 'admin', 'Insert', '', 'anggota', '', 'asdasda', '2');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('285', '2020-02-14 13:25:29', 'admin', 'Insert', '', 'anggota', '2151', 'angga k', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('286', '2020-02-14 13:25:44', 'admin', 'Delete', 'Anggota', 'anggota', '2152', 'angga k', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('287', '2020-02-14 13:26:02', 'admin', 'Delete', 'Anggota', 'anggota', '2151', 'asdasda', '2');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('288', '2020-02-14 13:27:42', 'admin', 'Delete', 'Anggota', 'anggota', '2150', 'asdasd', '3');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('289', '2020-02-14 13:27:44', 'admin', 'Delete', 'Anggota', 'anggota', '2149', 'asdsadas', '2');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('290', '2020-02-14 13:27:46', 'admin', 'Delete', 'Anggota', 'anggota', '2148', 'anng', 'rekayasa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('291', '2020-02-14 13:27:47', 'admin', 'Delete', 'Anggota', 'anggota', '2147', 'asdasdasdas', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('292', '2020-02-14 13:27:50', 'admin', 'Delete', 'Anggota', 'anggota', '2146', 'asdasda', '3');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('293', '2020-02-14 13:27:52', 'admin', 'Delete', 'Anggota', 'anggota', '2145', 'anng', '1');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('294', '2020-02-14 13:28:23', 'admin', 'Insert', '', 'anggota', '', 'Angga Kurniawan', 'peralihan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('295', '2020-02-14 13:30:45', 'admin', 'Delete', 'Anggota', 'anggota', '2153', 'Angga Kurniawan', 'peralihan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('296', '2020-02-14 13:33:05', 'admin', 'Insert', '', 'anggota', '', 'angga ', 'rekayasa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('297', '2020-02-14 13:33:35', 'admin', 'Delete', 'Anggota', 'anggota', '2154', 'angga ', 'rekayasa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('298', '2020-02-14 13:36:14', 'admin', 'Insert', '', 'anggota', '', 'asdasd', '1');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('299', '2020-02-14 13:42:33', 'admin', 'Delete', 'Anggota', 'anggota', '2144', 'Wawan Gunawan', '12');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('300', '2020-02-14 13:42:37', 'admin', 'Delete', 'Anggota', 'anggota', '2144', '', '');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('301', '2020-02-14 13:42:41', 'admin', 'Delete', 'Anggota', 'anggota', '2097', 'Isnan Hamid', '2');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('302', '2020-02-14 13:42:44', 'admin', 'Delete', 'Anggota', 'anggota', '2096', 'Isnan Hamid', '13');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('303', '2020-02-14 13:43:36', 'admin', 'Insert', '', 'anggota', '', 'Angga', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('304', '2020-02-14 13:45:51', 'admin', 'Update', '', 'anggota', '2155', 'asdasd', '1');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('305', '2020-02-14 13:50:07', 'admin', 'Update', '', 'anggota', '2156', 'Angga', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('306', '2020-02-14 13:50:29', 'admin', 'Delete', 'Anggota', 'anggota', '2156', 'Angga', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('307', '2020-02-14 13:52:50', 'admin', 'Update', '', 'anggota', '2155', 'asdasd', '1');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('308', '2020-02-14 13:54:25', 'admin', 'Insert', '', 'anggota', '', 'asdasd', '2');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('309', '2020-02-14 14:20:39', 'admin', 'Insert', '', 'anggota', '', 'Angga Kurniawan', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('310', '2020-02-14 14:30:14', 'admin', 'Update', '', 'User', '8', 'admin', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('311', '2020-02-14 14:30:21', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('312', '2020-02-14 14:30:22', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('313', '2020-02-14 14:42:42', 'admin', 'Insert', '', 'User', '', 'anggaa', 'user');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('314', '2020-02-14 14:47:09', 'admin', 'Delete', 'User', 'User', '9', 'anggaa', 'user');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('315', '2020-02-14 14:47:53', 'admin', 'Insert', '', 'User', '', 'aan123', 'user');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('316', '2020-02-14 14:48:28', 'admin', 'Delete', 'User', 'User', '10', 'aan123', 'user');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('317', '2020-02-14 14:48:57', 'admin', 'Insert', '', 'User', '', 'aan123', 'user');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('318', '2020-02-14 17:23:31', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('319', '2020-02-14 20:53:06', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('320', '2020-02-14 20:54:03', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('321', '2020-02-14 21:26:36', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('322', '2020-02-14 23:02:58', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('323', '2020-02-14 23:03:04', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('324', '2020-02-14 23:03:09', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('325', '2020-02-14 23:03:19', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('326', '2020-02-14 23:03:52', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('327', '2020-02-14 23:04:10', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('328', '2020-02-14 23:04:16', 'user', 'Login', 'login', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('329', '2020-02-14 23:04:57', 'user', 'Logout', 'Logout', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('330', '2020-02-14 23:04:59', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('331', '2020-02-14 23:32:40', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('332', '2020-02-14 23:48:40', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('333', '2020-02-14 23:51:04', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('334', '2020-02-14 23:52:43', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('335', '2020-02-14 23:54:46', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('336', '2020-02-14 23:56:23', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('337', '2020-02-15 00:15:42', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('338', '2020-02-15 00:15:52', 'user', 'Login', 'login', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('339', '2020-02-15 00:16:49', 'user', 'Logout', 'Logout', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('340', '2020-02-15 00:16:53', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('341', '2020-02-15 16:36:42', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('342', '2020-02-15 16:39:17', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('343', '2020-02-15 16:51:56', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('344', '2020-02-15 18:47:13', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('345', '2020-02-15 19:15:53', NULL, 'Logout', 'Logout', 'User', '', '', '');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('346', '2020-02-15 19:16:00', 'user', 'Login', 'login', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('347', '2020-02-15 19:16:09', NULL, 'Logout', 'Logout', 'User', '', '', '');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('348', '2020-02-15 19:16:11', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('349', '2020-02-15 19:23:41', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('350', '2020-02-15 19:23:48', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('351', '2020-02-15 19:23:57', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('352', '2020-02-15 19:30:44', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('353', '2020-02-15 19:38:13', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('354', '2020-02-15 19:40:33', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('355', '2020-02-15 19:40:40', 'user', 'Login', 'login', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('356', '2020-02-15 19:40:47', 'user', 'Logout', 'Logout', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('357', '2020-02-15 19:40:55', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('358', '2020-02-15 19:54:32', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('359', '2020-02-15 19:54:35', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('360', '2020-02-15 20:59:19', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('361', '2020-02-15 21:01:21', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('362', '2020-02-15 21:01:32', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('363', '2020-02-15 21:28:17', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('364', '2020-02-15 21:28:19', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('365', '2020-02-15 21:32:28', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('366', '2020-02-15 21:34:25', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('367', '2020-02-15 21:34:50', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('368', '2020-02-15 21:59:06', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('369', '2020-02-15 21:59:13', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('370', '2020-02-15 22:00:36', 'admin', 'Insert', '', 'User', '', 'eki123', 'user');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('371', '2020-02-15 22:01:02', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('372', '2020-02-15 22:01:04', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('373', '2020-02-15 22:01:49', 'admin', 'Update', '', 'User', '12', 'user', 'eki123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('374', '2020-02-15 22:36:10', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('375', '2020-02-15 22:36:19', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('376', '2020-02-16 11:13:16', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('377', '2020-02-16 11:27:07', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('378', '2020-02-16 11:27:27', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('379', '2020-02-16 11:36:13', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('380', '2020-02-16 11:48:59', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('381', '2020-02-16 11:51:38', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('382', '2020-02-16 11:51:42', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('383', '2020-02-16 12:10:53', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('384', '2020-02-16 12:10:54', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('385', '2020-02-16 12:24:35', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('386', '2020-02-16 12:24:41', 'user', 'Login', 'login', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('387', '2020-02-16 12:24:55', 'user', 'Logout', 'Logout', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('388', '2020-02-16 12:24:57', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('389', '2020-02-16 12:26:03', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('390', '2020-02-16 12:26:09', 'user', 'Login', 'login', 'User', 'user', 'angga', 'eki123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('391', '2020-02-16 12:26:30', 'user', 'Logout', 'Logout', 'User', 'user', 'angga', 'eki123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('392', '2020-02-16 12:26:31', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('393', '2020-02-16 12:29:40', 'user', 'Login', 'login', 'User', 'user', 'angga', 'eki123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('394', '2020-02-16 13:37:01', 'user', 'Login', 'login', 'User', 'user', 'angga', 'eki123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('395', '2020-02-16 13:38:37', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('396', '2020-02-16 13:40:16', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('397', '2020-02-16 15:31:56', 'user', 'Logout', 'Logout', 'User', 'user', 'angga', 'eki123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('398', '2020-02-16 22:18:52', 'user', 'Login', 'login', 'User', 'user', 'angga', 'eki123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('399', '2020-02-16 22:20:46', 'user', 'Logout', 'Logout', 'User', 'user', 'angga', 'eki123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('400', '2020-02-16 22:21:35', 'admin', 'Insert', '', 'berita', '', 'angga123', 'angga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('401', '2020-02-16 22:30:53', 'user', 'Login', 'login', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('402', '2020-02-16 22:31:36', 'user', 'Logout', 'Logout', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('403', '2020-02-16 22:32:04', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('404', '2020-02-17 09:31:07', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('405', '2020-02-17 10:55:46', 'admin', 'Insert', '', 'kategori_barang', '', 'aaa', 'aa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('406', '2020-02-17 10:55:48', 'admin', 'Delete', 'Kategori', 'kategori_barang', '4', 'aaa', 'aa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('407', '2020-02-17 10:56:05', 'admin', 'Delete', 'Kategori', 'kategori_barang', '3', 'Barang habis pakai', 'baraang yang kalau dipakai akan habis');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('408', '2020-02-17 10:58:07', 'admin', 'Delete', 'Kategori', 'kategori_barang', '5', 'barang habis pakai', 'baraang yang kalau dipakai akan habis');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('409', '2020-02-17 10:59:56', 'admin', 'Delete', 'Kategori', 'kategori_barang', '6', 'barang habis pakai', 'baraang yang kalau dipakai akan habis');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('410', '2020-02-17 11:04:09', 'admin', 'Delete', 'Kategori', 'kategori_barang', '7', 'barang habis pakai', 'baraang yang kalau dipakai akan habis');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('411', '2020-02-17 11:06:09', 'admin', 'Delete', 'Kategori', 'kategori_barang', '9', 'aaaa', 'aaa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('412', '2020-02-17 11:06:17', 'admin', 'Insert', '', 'kategori_barang', '', 'aaa', 'aa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('413', '2020-02-17 11:06:50', 'admin', 'Delete', 'Kategori', 'kategori_barang', '10', 'aaa', 'aa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('414', '2020-02-17 11:06:54', 'admin', 'Delete', 'Kategori', 'kategori_barang', '8', 'ssss', 'baraang yang kalau dipakai akan habis');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('415', '2020-02-17 11:07:16', 'admin', 'Insert', '', 'kategori_barang', '', 'barang habis pakai', 'barang yang akan habis kita dipakai');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('416', '2020-02-17 11:07:59', 'admin', 'Delete', 'Kategori', 'kategori_barang', '11', 'barang habis pakai', 'barang yang akan habis kita dipakai');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('417', '2020-02-17 11:08:10', 'admin', 'Insert', '', 'kategori_barang', '', 'barang habis pakai', 'barang yang akan habis kita dipakai');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('418', '2020-02-17 11:10:15', 'admin', 'Delete', 'Kategori', 'kategori_barang', '13', 'a', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('419', '2020-02-17 11:10:18', 'admin', 'Insert', '', 'kategori_barang', '', 's', 's');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('420', '2020-02-17 11:13:51', 'admin', 'Delete', 'Kategori', 'kategori_barang', '14', 's', 's');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('421', '2020-02-17 11:13:54', 'admin', 'Insert', '', 'kategori_barang', '', 'aaa', 'aaa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('422', '2020-02-17 11:28:47', 'admin', 'Delete', 'Kategori', 'kategori_barang', '15', 'aaa', 'aaa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('423', '2020-02-17 11:28:49', 'admin', 'Delete', 'Kategori', 'kategori_barang', '12', 'barang habis pakai', 'barang yang akan habis kita dipakai');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('424', '2020-02-17 11:28:52', 'admin', 'Delete', 'Kategori', 'kategori_barang', '2', 'ATK', 'DDD');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('425', '2020-02-17 11:28:58', 'admin', 'Insert', '', 'kategori_barang', '', 'ssss', 'aaaa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('426', '2020-02-17 11:31:29', 'admin', 'Insert', '', 'kategori_barang', '', 'aaaaa', 'sssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('427', '2020-02-17 14:26:36', 'admin', 'Insert', '', 'kategori_barang', '', 'dddd', 'sss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('428', '2020-02-17 14:27:32', 'admin', 'Insert', '', 'kategori_barang', '', 'aaaa', 'aaaa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('429', '2020-02-17 14:48:10', 'admin', 'Insert', '', 'kategori_barang', '', 'ssss', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('430', '2020-02-17 14:48:31', 'admin', 'Insert', '', 'kategori_barang', '', 'ssss', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('431', '2020-02-17 14:50:27', 'admin', 'Insert', '', 'kategori_barang', '', 'a', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('432', '2020-02-17 14:51:36', 'admin', 'Insert', '', 'kategori_barang', '', 'a', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('433', '2020-02-17 15:05:15', 'admin', 'Delete', 'Kategori', 'kategori_barang', '23', 'a', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('434', '2020-02-17 15:05:16', 'admin', 'Delete', 'Kategori', 'kategori_barang', '22', 'a', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('435', '2020-02-17 15:05:18', 'admin', 'Delete', 'Kategori', 'kategori_barang', '21', 'ssss', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('436', '2020-02-17 15:05:19', 'admin', 'Delete', 'Kategori', 'kategori_barang', '20', 'ssss', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('437', '2020-02-17 15:05:21', 'admin', 'Delete', 'Kategori', 'kategori_barang', '19', 'aaaa', 'aaaa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('438', '2020-02-17 15:05:22', 'admin', 'Delete', 'Kategori', 'kategori_barang', '18', 'dddd', 'sss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('439', '2020-02-17 15:05:25', 'admin', 'Insert', '', 'kategori_barang', '', 'a', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('440', '2020-02-17 15:19:56', 'admin', 'Insert', '', 'kategori_barang', '', 'a', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('441', '2020-02-17 15:19:59', 'admin', 'Insert', '', 'kategori_barang', '', 's', 's');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('442', '2020-02-17 15:26:32', 'admin', 'Delete', 'Kategori', 'kategori_barang', '26', 's', 's');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('443', '2020-02-17 15:27:04', 'admin', 'Update', '', 'kategori_barang', '25', 'as', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('444', '2020-02-17 15:30:44', 'admin', 'Delete', 'Kategori', 'kategori_barang', '25', 'as', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('445', '2020-02-17 15:31:07', 'admin', 'Delete', 'Kategori', 'kategori_barang', '24', 'a', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('446', '2020-02-17 15:33:33', 'admin', 'Delete', 'Kategori', 'kategori_barang', '17', 'aaaaa', 'sssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('447', '2020-02-17 15:33:43', 'admin', 'Delete', 'Kategori', 'Kategori_berita', '29', 'sssss', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('448', '2020-02-17 17:44:59', 'admin', 'Insert', '', 'barang', '', 's', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('449', '2020-02-17 17:47:09', 'admin', 'Insert', '', 'barang', '', 'a', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('450', '2020-02-17 17:49:33', 'admin', 'Insert', '', 'barang', '', 'a', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('451', '2020-02-17 18:55:17', 'admin', 'Delete', 'Anggota', 'anggota', '2157', 'asdasd', '2');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('452', '2020-02-17 18:55:19', 'admin', 'Delete', 'Anggota', 'anggota', '2155', 'asdasd', '1');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('453', '2020-02-18 08:48:00', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('454', '2020-02-18 10:14:20', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('455', '2020-02-18 10:14:30', 'user', 'Login', 'login', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('456', '2020-02-18 10:14:37', 'user', 'Logout', 'Logout', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('457', '2020-02-18 10:16:13', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('458', '2020-02-18 11:02:42', 'user', 'Login', 'login', 'User', 'user', 'angga', 'eki123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('459', '2020-02-18 11:06:39', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('460', '2020-02-18 11:06:42', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('461', '2020-02-18 19:21:09', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('462', '2020-02-18 20:48:06', 'admin', 'Insert', '', 'surat_keluar', '', 'BASARANAS', 'Surat Tugas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('463', '2020-02-18 20:49:53', 'admin', 'Delete', 'surat_keluar', 'surat_keluar', '1', '', 'Surat Tugas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('464', '2020-02-18 20:53:13', 'admin', 'Insert', '', 'surat_keluar', '', 'a', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('465', '2020-02-18 20:53:22', 'admin', 'Update', '', 'surat_keluar', '2', 'a', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('466', '2020-02-18 20:53:28', 'admin', 'Delete', 'surat_keluar', 'surat_keluar', '2', 'a', 'a');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('467', '2020-02-18 21:01:38', 'admin', 'Insert', '', 'barang', '', 's', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('468', '2020-02-18 21:04:43', 'admin', 'Delete', 'barang', 'barang', '4', 's', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('469', '2020-02-18 21:05:31', 'admin', 'Delete', 'barang', 'barang', '3', 'a', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('470', '2020-02-18 21:07:10', 'admin', 'Delete', 'barang', 'barang', '2', 'a', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('471', '2020-02-18 21:12:02', 'admin', 'Delete', 'barang', 'barang', '1', 's', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('472', '2020-02-18 21:21:31', 'admin', 'Insert', '', 'barang', '', 'a', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('473', '2020-02-18 21:22:41', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('474', '2020-02-18 21:31:58', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('475', '2020-02-18 21:47:23', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('476', '2020-02-18 23:55:25', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('477', '2020-02-19 13:14:56', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('478', '2020-02-19 13:36:01', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('479', '2020-02-19 13:36:29', 'admin', 'Delete', 'berita', 'berita', '52', 'angga123', 'angga');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('480', '2020-02-19 13:36:31', 'admin', 'Delete', 'berita', 'berita', '51', 'angga123', 'dasdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('481', '2020-02-19 13:36:32', 'admin', 'Delete', 'berita', 'berita', '50', 'angga123', 'asdsdddddasdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('482', '2020-02-19 13:36:34', 'admin', 'Delete', 'berita', 'berita', '27', 'angga123', 'adasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('483', '2020-02-19 13:36:36', 'admin', 'Delete', 'berita', 'berita', '26', 'angga123', 'sdadasdd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('484', '2020-02-19 13:44:13', 'admin', 'Insert', '', 'berita', '', 'angga123', 'Selamat Datang di Website KSR SAKURA MAKASSAR');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('485', '2020-02-19 14:10:21', 'admin', 'Insert', '', 'berita', '', 'angga123', 'Berita Pertama');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('486', '2020-02-19 14:23:17', 'admin', 'Update', '', 'berita', '53', 'angga123', 'Selamat Datang di Website KSR SAKURA MAKASSAR');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('487', '2020-02-19 14:23:40', 'admin', 'Update', '', 'berita', '53', 'angga123', 'Selamat Datang di Website KSR SAKURA MAKASSAR');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('488', '2020-02-19 14:24:15', 'admin', 'Update', '', 'berita', '53', 'angga123', 'Selamat Datang di Website KSR SAKURA MAKASSAR');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('489', '2020-02-19 14:26:07', 'admin', 'Update', '', 'berita', '54', 'angga123', 'Berita Pertama');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('490', '2020-02-19 14:27:06', 'admin', 'Update', '', 'berita', '54', 'angga123', 'DIKLATSAR ANGKATAN XIII');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('491', '2020-02-19 14:43:44', 'admin', 'Update', '', 'berita', '54', 'angga123', 'DIKLATSAR ANGKATAN XIII');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('492', '2020-02-19 14:44:19', 'admin', 'Update', '', 'berita', '54', 'angga123', 'DIKLATSAR ANGKATAN XIII');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('493', '2020-02-19 15:05:07', 'admin', 'Insert', '', 'berita', '', 'angga123', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('494', '2020-02-19 15:05:12', 'admin', 'Delete', 'berita', 'berita', '56', 'angga123', 'ssss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('495', '2020-02-19 15:06:13', 'admin', 'Insert', '', 'Kategori_berita', '', 'Profil', 'segala tentang profil organiasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('496', '2020-02-19 15:08:22', 'admin', 'Insert', '', 'berita', '', 'angga123', 'Visi Organisasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('497', '2020-02-19 15:11:56', 'admin', 'Insert', '', 'berita', '', 'angga123', 'Misi Organisasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('498', '2020-02-19 15:13:00', 'admin', 'Update', '', 'berita', '59', 'angga123', 'Misi Organisasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('499', '2020-02-19 15:13:15', 'admin', 'Update', '', 'berita', '58', 'angga123', 'Visi Organisasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('500', '2020-02-19 15:33:54', 'admin', 'Update', '', 'berita', '54', 'angga123', 'DIKLATSAR ANGKATAN XIII');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('501', '2020-02-19 16:32:05', 'admin', 'Update', '', 'Konfigurasi', '0', 'KSR SAKURA MAKASSAR', 'ksrsakura@gmail.com');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('502', '2020-02-19 16:32:09', 'admin', 'Update', '', 'Konfigurasi', '0', 'KSR SAKURA MAKASSAR', 'ksrsakura@gmail.com');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('503', '2020-02-19 16:55:25', 'admin', 'Update', '', 'anggota', '2158', 'Angga Kurniawan', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('504', '2020-02-19 17:01:39', 'admin', 'Update', '', 'anggota', '2158', 'Angga Kurniawan', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('505', '2020-02-19 17:11:36', 'admin', 'Insert', '', 'anggota', '2158', 's', 'rekayasa');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('506', '2020-02-19 17:11:52', 'admin', 'Update', '', 'anggota', '2158', 'Angga Kurniawan', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('507', '2020-02-19 17:12:56', 'admin', 'Update', '', 'anggota', '2159', 'Mitha Arnik', '9');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('508', '2020-02-19 17:13:10', 'admin', 'Update', '', 'anggota', '2159', 'Mitha Arnika', '9');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('509', '2020-02-19 17:19:32', 'admin', 'Insert', '', 'anggota', '2159', 'AR AZLANSYAH S.Sos', '8');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('510', '2020-02-19 17:32:08', 'admin', 'Update', '', 'Konfigurasi', '0', 'KSR SAKURA MAKASSAR', 'ksrsakura@gmail.com');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('511', '2020-02-19 17:51:29', 'admin', 'Update', '', 'anggota', '2158', 'Angga Kurniawan', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('512', '2020-02-19 17:51:38', 'admin', 'Update', '', 'anggota', '2159', 'Mitha Arnika', '9');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('513', '2020-02-19 17:51:46', 'admin', 'Update', '', 'anggota', '2160', 'AR AZLANSYAH S.Sos', '8');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('514', '2020-02-19 17:52:25', 'admin', 'Update', '', 'anggota', '2158', 'Angga Kurniawan', 'kehormatan');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('515', '2020-02-19 17:54:06', 'admin', 'Update', '', 'anggota', '2159', 'Mitha Arnika', '9');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('516', '2020-02-19 21:12:58', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('517', '2020-02-20 13:18:40', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('518', '2020-02-20 13:29:45', 'admin', 'Insert', '', 'berita', '', 'angga123', 'Sejarah Organisasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('519', '2020-02-20 13:46:32', 'admin', 'Insert', '', 'anggota', '', 'Hikmawati', '6');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('520', '2020-02-20 13:47:31', 'admin', 'Update', '', 'anggota', '2161', 'Hikmawati S.Sos', '6');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('521', '2020-02-20 13:48:20', 'admin', 'Update', '', 'anggota', '2159', 'Mitha Arnika S.Sos', '9');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('522', '2020-02-20 13:51:06', 'admin', 'Insert', '', 'anggota', '2159', 'Muhammad Yusran ', '6');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('523', '2020-02-20 13:51:39', 'admin', 'Update', '', 'anggota', '2159', 'Mitha Arnika S.Sos', '9');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('524', '2020-02-20 14:33:07', 'admin', 'Insert', '', 'berita', '', 'angga123', 'dasdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('525', '2020-02-20 14:33:31', 'admin', 'Delete', 'berita', 'berita', '61', 'angga123', 'dasdasdasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('526', '2020-02-20 14:33:55', 'admin', 'Update', '', 'berita', '58', 'angga123', 'Visi Organisasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('527', '2020-02-20 14:34:54', 'admin', 'Update', '', 'berita', '58', 'angga123', 'Visi Organisasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('528', '2020-02-20 14:36:27', 'admin', 'Insert', '', 'berita', '58', 'angga123', 'Latihan Bersama Basarnas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('529', '2020-02-20 14:37:00', 'admin', 'Update', '', 'berita', '62', 'angga123', 'Latihan Bersama Basarnas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('530', '2020-02-20 14:37:31', 'admin', 'Update', '', 'berita', '62', 'angga123', 'Latihan Bersama Basarnas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('531', '2020-02-20 15:00:37', 'admin', 'Insert', '', 'tanggapan', '', 'Muh Rijal Novianto', '');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('532', '2020-02-20 15:01:40', 'admin', 'Update', '', 'tanggapan', '1', 'Muh Rijal Novianto', 'Alumni SMTI Makassar');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('533', '2020-02-20 15:10:11', 'admin', 'Delete', 'tanggapan', 'tanggapan', '1', 'Muh Rijal Novianto', 'Alumni SMTI Makassar');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('534', '2020-02-20 15:11:18', 'admin', 'Insert', '', 'tanggapan', '1', 'Muh Rijal Nafrianto', 'Alumni SMTI Makassar');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('535', '2020-02-20 15:12:46', 'admin', 'Insert', '', 'tanggapan', '1', 'Haryanti Nurhidayah', 'Alumni SMAN 22 Makasssar');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('536', '2020-02-20 19:21:47', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('537', '2020-02-20 20:01:59', 'admin', 'Insert', '', 'tanggapan', '', 'Wawan Gunawan', 'Alumni SMAN 22 MAKASSAR');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('538', '2020-02-20 21:16:27', 'admin', 'Insert', '', 'tanggapan', '', 'Angga Kurniawan', 'PMR SMA Negeri 3 Makassar');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('539', '2020-02-20 21:49:28', 'admin', 'Insert', '', 'berita', '', 'angga123', 'Basarnas Lagi Beraksi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('540', '2020-02-20 22:16:51', 'admin', 'Insert', '', 'berita', '', 'angga123', 'Memotong Teks dan Kalimat dengan PHP');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('541', '2020-02-20 22:38:24', 'admin', 'Insert', '', 'berita', '', 'angga123', 'Panduan Lengkap Query MySQL - Tutorial dan Referensi Lengkap Query MySQL');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('542', '2020-02-20 22:39:31', 'admin', 'Insert', '', 'berita', '', 'angga123', 'HOW TO FIND GOLD IN MINING');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('543', '2020-02-20 22:40:57', 'admin', 'Update', '', 'berita', '66', 'angga123', 'HOW TO FIND GOLD IN MINING');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('544', '2020-02-20 23:34:47', 'admin', 'Insert', '', 'berita', '', 'angga123', 'Diklatsar KSR SAKURA');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('545', '2020-02-20 23:35:56', 'admin', 'Update', '', 'berita', '67', 'angga123', 'Diklatsar KSR SAKURA');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('546', '2020-02-20 23:37:43', 'admin', 'Update', '', 'berita', '67', 'angga123', 'Diklatsar KSR SAKURA');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('547', '2020-02-20 23:41:01', 'admin', 'Insert', '', 'berita', '67', 'angga123', 'Angkatan XIII KSR SAKURA');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('548', '2020-02-20 23:43:56', 'admin', 'Insert', '', 'berita', '', 'angga123', 'Requritment Platoon XII');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('549', '2020-02-20 23:45:01', 'admin', 'Update', '', 'berita', '69', 'angga123', 'Requritment Platoon XII');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('550', '2020-02-20 23:46:10', 'admin', 'Insert', '', 'berita', '69', 'angga123', 'Presentasi Makalah KSR SAKURA');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('551', '2020-02-20 23:47:14', 'admin', 'Update', '', 'berita', '70', 'angga123', 'Presentasi Makalah KSR SAKURA');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('552', '2020-02-21 00:56:55', 'admin', 'Update', '', 'profil', '4', '', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('553', '2020-02-21 00:57:18', 'admin', 'Update', '', 'profil', '4', '', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('554', '2020-02-21 00:58:56', 'admin', 'Update', '', 'profil', '4', 'Misi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('555', '2020-02-21 00:59:09', 'admin', 'Update', '', 'profil', '4', 'Misi', 'draft');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('556', '2020-02-21 00:59:15', 'admin', 'Update', '', 'profil', '4', 'Misi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('557', '2020-02-21 00:59:27', 'admin', 'Update', '', 'profil', '3', 'Visi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('558', '2020-02-21 00:59:42', 'admin', 'Update', '', 'profil', '1', 'Sejarah', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('559', '2020-02-21 01:00:39', 'admin', 'Delete', 'berita', 'berita', '60', 'angga123', 'Sejarah Organisasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('560', '2020-02-21 01:00:42', 'admin', 'Delete', 'berita', 'berita', '59', 'angga123', 'Misi Organisasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('561', '2020-02-21 01:00:47', 'admin', 'Delete', 'berita', 'berita', '58', 'angga123', 'Visi Organisasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('562', '2020-02-21 16:50:51', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('563', '2020-02-21 16:52:59', 'admin', 'Update', '', 'berita', '62', 'angga123', 'Latihan Bersama Basarnas');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('564', '2020-02-23 00:45:31', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('565', '2020-02-23 00:45:57', 'admin', 'Delete', 'Kategori', 'Kategori_berita', '29', 'Profil', 'segala tentang profil organiasi');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('566', '2020-02-23 01:07:04', 'admin', 'Update', '', 'berita', '65', 'angga123', 'Panduan Lengkap Query MySQL - Tutorial dan Referensi Lengkap Query MySQL');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('567', '2020-02-23 01:11:19', 'admin', 'Update', '', 'berita', '66', 'angga123', 'HOW TO FIND GOLD IN MINING');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('568', '2020-02-23 11:24:00', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('569', '2020-02-23 11:27:28', 'admin', 'Update', '', 'User', '8', 'admin', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('570', '2020-02-23 11:40:20', 'admin', 'Update', '', 'User', '8', 'admin', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('571', '2020-02-23 11:42:55', 'admin', 'Update', '', 'User', '8', 'admin', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('572', '2020-02-23 11:44:59', 'admin', 'Update', '', 'User', '8', 'admin', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('573', '2020-02-23 11:58:04', 'admin', 'Update', '', 'User', '8', 'admin', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('574', '2020-02-23 12:00:57', 'admin', 'Update', '', 'User', '8', 'admin', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('575', '2020-02-23 14:41:17', 'admin', 'Update', '', 'User', '8', 'admin', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('576', '2020-02-23 14:46:25', 'admin', 'Update', '', 'User', '8', 'admin', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('577', '2020-02-23 14:58:43', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('578', '2020-02-23 14:58:50', 'user', 'Login', 'login', 'User', 'user', 'angga', 'eki123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('579', '2020-02-23 14:58:55', 'user', 'Logout', 'Logout', 'User', 'user', 'angga', 'eki123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('580', '2020-02-23 14:59:02', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('581', '2020-02-23 14:59:13', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('582', '2020-02-23 14:59:19', 'user', 'Login', 'login', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('583', '2020-02-23 15:00:12', 'user', 'Insert', '', 'berita', '', 'aan123', 'Membuat CRUD Dengan PHP Dan MySQL Edit Data');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('584', '2020-02-23 15:02:56', 'user', 'Update', '', 'berita', '71', 'aan123', 'Membuat CRUD Dengan PHP Dan MySQL Edit Data');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('585', '2020-02-23 15:04:03', 'user', 'Logout', 'Logout', 'User', 'user', 'Nanang', 'aan123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('586', '2020-02-24 15:15:26', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('587', '2020-02-24 15:16:50', 'admin', 'Update', '', 'berita', '71', 'angga123', 'Membuat CRUD Dengan PHP');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('588', '2020-02-24 16:06:32', 'admin', 'Insert', '', 'berita', '', 'angga123', 'Lenovo a7000');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('589', '2020-02-24 18:12:56', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('590', '2020-02-24 18:13:32', 'admin', 'Update', '', 'berita', '64', 'angga123', 'Memotong Teks dan Kalimat dengan PHP');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('591', '2020-02-24 22:34:31', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('592', '2020-02-25 08:55:49', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('593', '2020-02-25 09:44:26', 'admin', 'Update', '', 'profil', '2', 'Struktur organisasi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('594', '2020-02-25 09:58:54', 'admin', 'Update', '', 'profil', '2', 'Struktur organisasi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('595', '2020-02-25 09:59:52', 'admin', 'Update', '', 'profil', '2', 'Struktur organisasi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('596', '2020-02-25 10:00:40', 'admin', 'Update', '', 'profil', '2', 'Struktur organisasi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('597', '2020-02-25 10:03:05', 'admin', 'Update', '', 'profil', '2', 'Struktur organisasi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('598', '2020-02-25 14:06:20', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('599', '2020-02-25 14:24:24', 'admin', 'Update', '', 'profil', '2', 'Struktur organisasi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('600', '2020-02-25 14:25:54', 'admin', 'Update', '', 'profil', '2', 'Struktur organisasi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('601', '2020-02-25 14:26:47', 'admin', 'Update', '', 'profil', '2', 'Struktur organisasi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('602', '2020-02-25 14:52:37', 'admin', 'Update', '', 'profil', '2', 'Struktur organisasi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('603', '2020-02-25 14:55:57', 'admin', 'Update', '', 'profil', '2', 'Struktur organisasi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('604', '2020-02-25 21:46:56', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('605', '2020-02-25 21:51:05', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('606', '2020-02-25 22:44:48', 'admin', 'Update', '', 'Konfigurasi', '0', 'KSR PMI UNIT 106 SAKURA MAKASSAR', 'ksrsakura@gmail.com');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('607', '2020-02-25 23:36:18', 'admin', 'Update', '', 'Konfigurasi', '0', 'KSR PMI UNIT 106 SAKURA MAKASSAR', 'ksrsakura@gmail.com');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('608', '2020-02-26 11:26:29', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('609', '2020-02-26 11:51:53', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('610', '2020-02-26 11:52:45', 'admin', 'Update', '', 'Kategori_galeri', '20', 'Diklatsar', 'Pendidikan dan Latihan Dasar 1998');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('611', '2020-02-26 11:54:24', 'admin', 'Insert', '', 'kategori_galeri', '20', 'Mantap mantap', 'memberikan kesejukan dan kesegaran');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('612', '2020-02-26 13:35:47', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('613', '2020-02-26 13:36:35', 'admin', 'Update', '', 'Kategori_galeri', '21', 'Mantap mantap', 'memberikan kesejukan dan kesegaran');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('614', '2020-02-26 13:37:03', 'admin', 'Update', '', 'Kategori_galeri', '21', 'Mantap mantap', 'memberikan kesejukan dan kesegaran');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('615', '2020-02-26 13:37:21', 'admin', 'Update', '', 'Kategori_galeri', '21', 'Mantap mantap', 'memberikan kesejukan dan kesegaran');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('616', '2020-02-26 13:37:40', 'admin', 'Update', '', 'Kategori_galeri', '21', 'Mantap mantap', 'memberikan kesejukan dan kesegaran');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('617', '2020-02-26 13:38:33', 'admin', 'Update', '', 'Kategori_galeri', '21', 'Mantap mantap', 'memberikan kesejukan dan kesegaran');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('618', '2020-02-26 13:40:32', 'admin', 'Update', '', 'profil', '2', 'Struktur organisasi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('619', '2020-02-26 13:43:50', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('620', '2020-02-26 13:44:29', 'admin', 'Update', '', 'galeri', '2', 'Diklatsar', 'aewaadasd');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('621', '2020-02-26 13:44:37', 'admin', 'Update', '', 'galeri', '1', 'Diklatsar', 'fgfghf');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('622', '2020-02-26 14:29:06', 'admin', 'Insert', '', 'galeri', '', 'Diklatsar', 'sss');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('623', '2020-02-26 14:29:17', 'admin', 'Insert', '', 'galeri', '', 'Diklatsar', 'h');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('624', '2020-02-26 14:29:27', 'admin', 'Insert', '', 'galeri', '', 'Diklatsar', 'gg');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('625', '2020-02-26 15:45:16', 'admin', 'Update', '', 'profil', '4', 'Misi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('626', '2020-02-26 15:45:28', 'admin', 'Update', '', 'profil', '3', 'Visi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('627', '2020-02-26 15:46:23', 'admin', 'Update', '', 'profil', '3', 'Visi', 'publish');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('628', '2020-02-26 16:22:45', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('629', '2020-02-27 10:19:54', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('630', '2020-02-27 11:56:13', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('631', '2020-02-27 15:50:25', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('632', '2020-02-27 17:36:29', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('633', '2020-02-27 17:36:31', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('634', '2020-02-27 17:36:37', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('635', '2020-02-27 17:40:48', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('636', '2020-02-28 10:04:57', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('637', '2020-02-28 13:38:46', 'admin', 'Insert', 'Backup', 'backup_db', '', 'sakura_20200228-063846.sql', '164560 bytes');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('638', '2020-02-28 13:38:58', 'admin', 'Delete', 'Backup', 'Backup_db', '60', 'sakura_20200228-063846.sql', '164560 bytes');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('639', '2020-02-28 19:25:07', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('640', '2020-03-01 10:17:50', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('641', '2020-03-01 11:01:36', 'admin', 'Logout', 'Logout', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('642', '2020-03-01 11:06:45', 'admin', 'Login', 'login', 'User', 'admin', 'Angga Kurniawan', 'angga123');
INSERT INTO `tabel_log` (`id`, `log_time`, `log_user`, `log_tipe`, `log_desc`, `log_tabel`, `data`, `var`, `pred`) VALUES ('643', '2020-03-01 12:06:57', 'admin', 'Delete', 'Backup', 'Backup_db', '56', 'sakura_20200207-010040.sql', '9294 bytes');


#
# TABLE STRUCTURE FOR: tanggapan
#

DROP TABLE IF EXISTS `tanggapan`;

CREATE TABLE `tanggapan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `komentar` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `tanggapan` (`id`, `nama`, `keterangan`, `komentar`, `photo`, `created`) VALUES ('2', 'Muh Rijal Nafrianto', 'Alumni SMTI Makassar', 'Mengorganisir dan mengelola berbagai\r\npersoalan kemanusiaan secara terencana,\r\nterkonsep, terintegrasi, sehingga menjadi\r\nformula ideal dalam mengatasi berbagai\r\nproblem kemanusiaan dengan baik\r\n', '1582182677972.jpg', '2020-02-20 20:54:37');
INSERT INTO `tanggapan` (`id`, `nama`, `keterangan`, `komentar`, `photo`, `created`) VALUES ('3', 'Haryanti Nurhidayah', 'Alumni SMAN 22 Makasssar', 'Mengorganisir dan mengelola segala potensi\r\nkedermawanan relawan kemanusian global\r\nsebagai modal sosial untuk mengatasi berbagai\r\nproblem kemanusiaan baik dalam skala lokal,\r\nnasional, regional, maupun global.', '1582182766813.jpg', '2020-02-20 20:54:34');
INSERT INTO `tanggapan` (`id`, `nama`, `keterangan`, `komentar`, `photo`, `created`) VALUES ('4', 'Wawan Gunawan', 'Alumni SMAN 22 MAKASSAR', 'Sekian penjelasan tentang bagaimana cara menampilkan bilangan ganjil dan genap di php menggunakan looping dan kondisi lengkap dengan contoh dan penjelasannya yang dapat Anda kembangkan menjadi lebih spesifik lagi. Semoga dapat membantu research Anda.', '1582200119637.jpg', '2020-02-20 20:54:31');
INSERT INTO `tanggapan` (`id`, `nama`, `keterangan`, `komentar`, `photo`, `created`) VALUES ('5', 'Angga Kurniawan', 'PMR SMA Negeri 3 Makassar', 'GEOGRAFIS KSR SAKURA Korps Sukarela Unit 106 Sakura Makassar pada awal pembentukan berdomisili di jl. Lanto Dg. Pasewang No. 55 Makassar (Markas PMI Kota Makassar) sejak tahun 1995 sampai 2010 dan di tahun 2011 berdomisili di Kompleks Kesehatan Banta-Bantaeng K6/6 Jl. Wijaya Kusuma Kelurahan Banta-Bantaeng Kecamatan Rappocini Kota Makassar, dan di tahun 2017 hingga saat ini berdomisili di Jl. Kande No 16 makassar.', '1582204587583.jpg', '2020-02-20 21:16:27');


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
  `photo` varchar(50) DEFAULT NULL,
  `motto` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO `user` (`id`, `akses_level`, `username`, `password`, `nama`, `pekerjaan`, `email`, `facebook`, `instagram`, `photo`, `motto`, `created`) VALUES ('8', 'admin', 'angga123', '1fd5cd9766249f170035b7251e2c6b61', 'Angga Kurniawan', 'Web Developer (Insya Allah)....', 'angga99124@gmail.com', 'angga.macassar', 'anggawann', '1582440384984.jpg', 'Coding enthusiast. Someone who love learn something new. especially about web programming and web design. happy to share about knowledge and learn from other.', '2020-02-23 14:46:25');
INSERT INTO `user` (`id`, `akses_level`, `username`, `password`, `nama`, `pekerjaan`, `email`, `facebook`, `instagram`, `photo`, `motto`, `created`) VALUES ('11', 'user', 'aan123', '1fd5cd9766249f170035b7251e2c6b61', 'Nanang', 'mahasiswa', 'angganackcopo@yahoo.com', 'aaagggg', 'sssdass', '1581662937223.jpg', 'ddddsd', '2020-02-14 14:48:57');
INSERT INTO `user` (`id`, `akses_level`, `username`, `password`, `nama`, `pekerjaan`, `email`, `facebook`, `instagram`, `photo`, `motto`, `created`) VALUES ('12', 'user', 'eki123', '1fd5cd9766249f170035b7251e2c6b61', 'angga', 'mahasiswa', 'angganackcopo@yahoo.com', 'angga99', 'anggawan_09', '1581775309515.jpg', '09', '2020-02-15 22:01:49');


