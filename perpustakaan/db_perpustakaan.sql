-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Mar 2024 pada 08.57
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `editbuku` (IN `bukuid1` INT(11), IN `judul1` VARCHAR(225), IN `kategoriid1` INT(11), IN `penulis1` VARCHAR(225), IN `penerbit1` VARCHAR(225), IN `tahunterbit1` INT(11), IN `stok1` INT(20), IN `gambar1` VARCHAR(225))  BEGIN
DECLARE bukuid2 integer;
DECLARE judul2 varchar(225);
DECLARE kategoriid2 integer;
DECLARE penulis2 varchar(225);
DECLARE penerbit2 varchar(225);
DECLARE tahunterbit2 integer;
DECLARE stok2 integer;
DECLARE gambar2 varchar(225);
SET bukuid2=bukuid1;
SET judul2=judul1;
SET kategoriid2=kategoriid1;
SET penulis2=penulis1;
SET penerbit2=penerbit1;
SET tahunterbit2=tahunterbit1;
SET stok2=stok1;
SET gambar2=gambar1;
UPDATE buku SET judul=judul2, kategoriid=kategoriid2, penulis=penulis2, penerbit=penerbit2, tahunterbit=tahunterbit2, stok=stok2, gambar=gambar2 WHERE bukuid=bukuid2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editbuku1` (IN `bukuid1` INT(11), IN `judul1` VARCHAR(225), IN `kategoriid1` INT(11), IN `penulis1` VARCHAR(225), IN `penerbit1` VARCHAR(225), IN `tahunterbit1` INT(11), IN `stok1` INT(20))  BEGIN
DECLARE bukuid2 integer;
DECLARE judul2 varchar(225);
DECLARE kategoriid2 integer;
DECLARE penulis2 varchar(225);
DECLARE penerbit2 varchar(225);
DECLARE tahunterbit2 integer;
DECLARE stok2 integer;
SET bukuid2=bukuid1;
SET judul2=judul1;
SET kategoriid2=kategoriid1;
SET penulis2=penulis1;
SET penerbit2=penerbit1;
SET tahunterbit2=tahunterbit1;
SET stok2=stok1;
UPDATE buku SET judul=judul2, kategoriid=kategoriid2, penulis=penulis2, penerbit=penerbit2, tahunterbit=tahunterbit2, stok=stok2 WHERE bukuid=bukuid2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edituser` (IN `userid1` INT(11), IN `username1` VARCHAR(225), IN `password1` VARCHAR(225), IN `email1` VARCHAR(225), IN `namalengkap1` VARCHAR(225), IN `alamat1` VARCHAR(225), IN `level1` VARCHAR(20))  BEGIN
DECLARE userid2 integer;
DECLARE username2 varchar(225);
DECLARE password2 varchar(225);
DECLARE email2 varchar(225);
DECLARE namalengkap2 varchar(225);
DECLARE alamat2 varchar(225);
DECLARE level2 varchar(20);
SET userid2=userid1;
SET username2=username1;
SET password2=password1;
SET email2=email1;
SET namalengkap2=namalengkap1;
SET alamat2=alamat1;
SET level2=level1;
UPDATE user SET username=username2, password=password2, email=email2, namalengkap=namalengkap2, alamat=alamat2, level=level2 WHERE userid=userid2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edituser1` (IN `userid1` INT(11), IN `username1` VARCHAR(225), IN `email1` VARCHAR(225), IN `namalengkap1` VARCHAR(225), IN `alamat1` VARCHAR(225), IN `level1` VARCHAR(20))  BEGIN
DECLARE userid2 integer;
DECLARE username2 varchar(225);
DECLARE email2 varchar(225);
DECLARE namalengkap2 varchar(225);
DECLARE alamat2 varchar(225);
DECLARE level2 varchar(20);
SET userid2=userid1;
SET username2=username1;
SET email2=email1;
SET namalengkap2=namalengkap1;
SET alamat2=alamat1;
SET level2=level1;
UPDATE user SET username=username2, email=email2, namalengkap=namalengkap2, alamat=alamat2, level=level2 WHERE userid=userid2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapusbuku` (IN `bukuid1` INT(11))  BEGIN
DECLARE bukuid2 integer;
SET bukuid2 = bukuid1;
DELETE FROM buku WHERE bukuid=bukuid2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapusfavorite` (IN `koleksiid1` INT(11))  BEGIN
DECLARE koleksiid2 int;
SET koleksiid2 = koleksiid1;
DELETE FROM koleksipribadi WHERE koleksiid=koleksiid2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapuspinjam` (IN `peminjamanid1` INT(11))  BEGIN
DECLARE peminjamanid2 int;
SET peminjamanid2=peminjamanid1;
DELETE FROM peminjaman WHERE peminjamanid=peminjamanid2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapusulasan` (IN `ulasanid1` INT(11))  BEGIN
DECLARE ulasanid2 int;
SET ulasanid2=ulasanid1;
DELETE FROM ulasanbuku WHERE ulasanid=ulasanid2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pengembalianbuku` (IN `peminjamanid1` INT(11), IN `userid1` INT(11), IN `bukuid1` INT(11), IN `tglpeminjaman1` DATE, IN `tglpengembalian1` DATE, IN `jumlah1` INT(20), IN `statuspeminjaman1` VARCHAR(50))  BEGIN
DECLARE peminjamanid2 integer;
DECLARE userid2 integer;
DECLARE bukuid2 integer;
DECLARE tglpeminjaman2 date;
DECLARE tglpengembalian2 date;
DECLARE jumlah2 integer;
DECLARE statuspeminjaman2 varchar(50);
SET peminjamanid2=peminjamanid1;
SET userid2=userid1;
SET bukuid2=bukuid1;
SET tglpeminjaman2=tglpeminjaman1;
SET tglpengembalian2=tglpengembalian1;
SET jumlah2=jumlah1;
SET statuspeminjaman2=statuspeminjaman1;
UPDATE peminjaman SET userid=userid2, bukuid=bukuid2, tglpeminjaman=tglpeminjaman2, tglpengembalian=tglpengembalian2, jumlah=jumlah2,  statuspeminjaman=statuspeminjaman2 WHERE peminjamanid=peminjamanid2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pinjambuku` (IN `peminjamanid` INT(11), IN `kodepinjam` VARCHAR(10), IN `userid` INT(11), IN `bukuid` INT(11), IN `tglpeminjaman` DATE, IN `tglpengembalian` DATE, IN `jumlah` INT(20), IN `statuspeminjaman` VARCHAR(50))  BEGIN
INSERT INTO peminjaman VALUES (peminjamanid,kodepinjam,userid,bukuid,tglpeminjaman,tglpengembalian,jumlah,statuspeminjaman);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambahbuku` (IN `bukuid` INT(11), IN `judul` VARCHAR(225), IN `kategoriid` INT(11), IN `penulis` VARCHAR(225), IN `penerbit` VARCHAR(225), IN `tahunterbit` INT(11), IN `stok` INT(20), IN `gambar` VARCHAR(225))  BEGIN
INSERT INTO buku VALUES (bukuid,judul,kategoriid,penulis,penerbit,tahunterbit,stok,gambar);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambahfavorite` (IN `koleksiid` INT(11), IN `userid` INT(11), IN `bukuid` INT(11))  BEGIN
INSERT INTO koleksipribadi VALUES (koleksiid,userid,bukuid);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambahuser` (IN `userid` INT(11), IN `username` VARCHAR(225), IN `password` VARCHAR(225), IN `email` VARCHAR(225), IN `namalengkap` VARCHAR(225), IN `alamat` VARCHAR(225), IN `level` VARCHAR(20))  BEGIN
INSERT INTO user VALUES (userid,username,password,email,namalengkap,alamat,level);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ubahulasan` (IN `ulasanid1` INT(11), IN `userid1` INT(11), IN `bukuid1` INT(11), IN `ulasan1` VARCHAR(225), IN `rating1` INT(11))  BEGIN
DECLARE ulasanid2 int;
DECLARE userid2 int;
DECLARE bukuid2 int;
DECLARE ulasan2 varchar(225);
DECLARE rating2 int;
SET ulasanid2=ulasanid1;
SET userid2=userid1;
SET bukuid2=bukuid1;
SET ulasan2=ulasan1;
SET rating2=rating1;
UPDATE ulasanbuku SET userid=userid2, bukuid=bukuid2, ulasan=ulasan2, rating=rating2 WHERE ulasanid=ulasanid2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ulasan` (IN `ulasanid` INT(11), IN `userid` INT(11), IN `bukuid` INT(11), IN `ulasan` VARCHAR(225), IN `rating` INT(11))  BEGIN
INSERT INTO ulasanbuku VALUES (ulasanid,userid,bukuid,ulasan,rating);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `bukuid` int(11) NOT NULL,
  `judul` varchar(225) NOT NULL,
  `kategoriid` int(11) NOT NULL,
  `penulis` varchar(225) NOT NULL,
  `penerbit` varchar(225) NOT NULL,
  `tahunterbit` int(11) NOT NULL,
  `stok` int(20) NOT NULL,
  `gambar` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`bukuid`, `judul`, `kategoriid`, `penulis`, `penerbit`, `tahunterbit`, `stok`, `gambar`, `created_at`) VALUES
(71, 'Fur Immer Dein Ian', 6, 'Valerie', 'Media Pustaka', 2020, 10, '../assets/img/img20220928_15154296.jpg', '2024-03-04 01:37:16'),
(73, 'Annyeong Drakor', 13, 'Irwin Ssaem', 'Andam', 2023, 15, '../assets/img/hwtadvyjtboqcab2rippub.jpg', '2024-03-04 01:37:16'),
(74, 'Micro Teaching', 13, 'Imas Masruroh', 'Bumi Aksara', 2023, 20, '../assets/img/feltwkduzcegsqzbxzyddj.jpg', '2024-03-04 01:37:16'),
(75, 'Ibnu Zubair', 12, 'Majid Lahham ', 'Alvabet', 2024, 7, '../assets/img/ebfle9qwnwqebcnry9qjtw.jpg', '2024-03-04 07:31:24'),
(76, 'Sukarno', 12, 'Bagas Nugroho Pangestu', 'Anak Hebat Indonesia', 2023, 20, '../assets/img/b9tgjwcdx8ty3ggxwg3hxp.jpg', '2024-03-04 01:37:16'),
(77, 'Creepy Case', 3, 'Rizal Iwan ', 'Gramedia', 2023, 5, '../assets/img/44fqsqrp6twwtgbikjq9ya.jpg', '2024-03-04 07:40:31'),
(78, 'Keep Up with Us!', 3, 'G. Dani', 'Komputindo', 2022, 8, '../assets/img/722030292_Keep_up_With_Us_.jpg', '2024-03-04 01:37:16'),
(79, 'The Misfit of Demon King', 5, 'Kaya Haruka', 'Komputindo', 2022, 5, '../assets/img/hktyxjtdbcru7fkuxssxhh.jpg', '2024-03-04 01:37:16'),
(80, 'Death Mounth', 3, 'Shinta Fujimoto', 'm&c!', 2022, 10, '../assets/img/cover_DEAD_MOUNT_DEAD_PLAY_6_Ina.jpg', '2024-03-04 05:51:29'),
(81, 'Ayo mewarnai', 13, ' Goes Team Opredo', 'Komputindo', 2024, 20, '../assets/img/hnq4apwdktrdnywogcbtwn.jpg', '2024-03-04 01:37:16'),
(86, 'Novel Cantik Itu Luka', 6, 'Eka Kurniawan', 'Gramedia', 2018, 5, '../assets/img/9786020366517_Cantik-Itu-Luka-Hard-Cover---Limited-Edition.jpg', '2024-03-04 01:37:16'),
(88, 'Horor Tanah Jawa', 3, 'Riskaninda', 'Araska', 2024, 15, '../assets/img/9xpmrvykpzvtq7kthoszhx.jpg', '2024-03-04 01:37:16'),
(89, 'Dijodohin', 6, ' Ariniimandasari', 'CloudBooks', 2021, 7, '../assets/img/img20210607_17570132.jpg', '2024-03-04 01:37:16'),
(90, 'Ferryman', 6, 'Claire', 'Gramedia', 2021, 7, '../assets/img/Ferryman_cov.jpg', '2024-03-04 01:37:16'),
(91, 'Primrose', 6, 'Peniejingga02', 'Kawah Media', 2022, 3, '../assets/img/img20220909_15252378.jpg', '2024-03-04 01:37:16'),
(92, 'Episode Hujan', 6, 'Lucia Priandarini', 'Gramedia', 2022, 6, '../assets/img/Cover_Episode_Hujan_New_Edition__acc_page-0001.jpg', '2024-03-04 01:37:16'),
(93, 'Si Juki ', 5, 'Pionicon', 'Bukune', 2022, 10, '../assets/img/38u5hbjzjmrtbpgvpie2z2.jpg', '2024-03-04 01:37:16'),
(94, 'KOLONI Gundala', 5, 'Bumilangit Comics', 'm&c!', 2022, 15, '../assets/img/cover_GUNDALA_SON_OF_LIGHTNING_1.jpg', '2024-03-04 01:37:16'),
(95, 'Yoshizawa-kun', 5, '301', 'Komputindo', 2022, 20, '../assets/img/hpmkxdl7mbsbqia4cvezhm.jpg', '2024-03-04 01:37:16'),
(96, 'Netiquette', 13, 'Lilis Erna', 'Gramedia', 2023, 15, '../assets/img/bf6evvf5k8xfnohzuzbdz3.jpg', '2024-03-04 01:37:16'),
(97, 'Koloni Not Today', 6, 'YACHI-CHAN', 'm&c!', 2023, 8, '../assets/img/wgyu3dy8yly4rusrak5rxz.jpg', '2024-03-04 01:37:16'),
(98, 'Oh My God!', 5, 'YeaRimDang', 'Komputindo', 2023, 5, '../assets/img/exelpbqfqy97czcbm3cc7x.jpg', '2024-03-04 01:37:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `kategoriid` int(11) NOT NULL,
  `namakategori` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategoribuku`
--

INSERT INTO `kategoribuku` (`kategoriid`, `namakategori`, `created_at`) VALUES
(3, 'Fiksi', '2024-03-04 01:37:05'),
(4, 'Non Fiksi', '2024-03-04 01:37:05'),
(5, 'Komik', '2024-03-04 01:37:05'),
(6, 'Novel', '2024-03-04 01:37:05'),
(7, 'Cergram', '2024-03-04 01:37:05'),
(8, 'Ensiklopedia', '2024-03-04 01:37:05'),
(9, 'Nomik', '2024-03-04 01:37:05'),
(10, 'Antologi', '2024-03-04 01:37:05'),
(11, 'Dongeng', '2024-03-04 01:37:05'),
(12, 'Biografi', '2024-03-04 01:37:05'),
(13, 'Pendidikan', '2024-03-04 01:37:05'),
(14, 'Pendidikan', '2024-03-04 05:51:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `koleksipribadi`
--

CREATE TABLE `koleksipribadi` (
  `koleksiid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bukuid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `koleksipribadi`
--

INSERT INTO `koleksipribadi` (`koleksiid`, `userid`, `bukuid`, `created_at`) VALUES
(30, 36, 80, '2024-03-04 01:36:55'),
(31, 37, 75, '2024-03-04 01:36:55'),
(42, 39, 76, '2024-03-04 02:27:28'),
(43, 39, 77, '2024-03-04 02:27:32'),
(44, 39, 86, '2024-03-04 06:07:45'),
(45, 40, 71, '2024-03-04 07:10:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `peminjamanid` int(11) NOT NULL,
  `kodepinjam` varchar(10) NOT NULL,
  `userid` int(11) NOT NULL,
  `bukuid` int(11) NOT NULL,
  `tglpeminjaman` date NOT NULL,
  `tglpengembalian` date NOT NULL,
  `jumlah` int(20) NOT NULL,
  `statuspeminjaman` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`peminjamanid`, `kodepinjam`, `userid`, `bukuid`, `tglpeminjaman`, `tglpengembalian`, `jumlah`, `statuspeminjaman`, `created_at`) VALUES
(148, 'PM001', 38, 98, '2024-02-17', '0000-00-00', 5, 'ditolak', '2024-03-04 05:52:23'),
(149, 'PM002', 38, 80, '2024-02-17', '2024-03-04', 5, 'dikembalikan', '2024-03-04 05:51:29'),
(151, 'PM004', 37, 77, '2024-02-17', '2024-03-04', 5, 'dikembalikan', '2024-03-04 07:40:31'),
(154, 'PM005', 40, 71, '2024-03-04', '0000-00-00', 10, 'ditolak', '2024-03-04 07:40:34'),
(155, 'PM006', 40, 75, '2024-03-04', '2024-03-04', 7, 'dikembalikan', '2024-03-04 07:31:24');

--
-- Trigger `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `kembali` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
    IF NEW.statuspeminjaman = 'dikembalikan' AND OLD.statuspeminjaman != NEW.statuspeminjaman THEN
        UPDATE buku SET stok = stok + NEW.jumlah WHERE bukuid = NEW.bukuid;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pinjam` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
    IF NEW.statuspeminjaman = 'disetujui' AND OLD.statuspeminjaman != NEW.statuspeminjaman THEN
        UPDATE buku SET stok = stok - NEW.jumlah WHERE bukuid = NEW.bukuid;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `perpus`
--

CREATE TABLE `perpus` (
  `perpusid` int(11) NOT NULL,
  `namaperpus` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `perpus`
--

INSERT INTO `perpus` (`perpusid`, `namaperpus`, `alamat`, `no_hp`, `created_at`) VALUES
(1, 'Perpustakaan RPL', 'Jl. K.H Mustofa, Kec.Banjar, Kota Banjar', '(021)87386732', '2024-03-04 01:42:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasanbuku`
--

CREATE TABLE `ulasanbuku` (
  `ulasanid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bukuid` int(11) NOT NULL,
  `ulasan` varchar(225) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ulasanbuku`
--

INSERT INTO `ulasanbuku` (`ulasanid`, `userid`, `bukuid`, `ulasan`, `rating`, `created_at`) VALUES
(19, 36, 80, 'Akhirnya Saya Jadi Wibu wkwk', 5, '2024-03-04 01:36:26'),
(20, 37, 75, 'Cukup Lumayan Bagus', 4, '2024-03-04 01:36:26'),
(21, 36, 81, 'Cara Menggambarnya Gmna Coba?', 2, '2024-03-04 01:36:26'),
(22, 38, 98, 'Ooommmagadd!!!', 5, '2024-03-04 01:36:26'),
(27, 39, 75, 'jelek', 3, '2024-03-04 02:33:02'),
(28, 39, 76, 'ngeri abangkuh', 4, '2024-03-04 02:24:39'),
(29, 39, 86, 'ngeri abangkuh', 5, '2024-03-04 06:07:58'),
(30, 40, 71, 'menyala', 5, '2024-03-04 07:10:56'),
(31, 40, 71, 'ngeri', 5, '2024-03-04 07:13:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `namalengkap` varchar(225) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `level` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `email`, `namalengkap`, `no_hp`, `alamat`, `level`, `created_at`) VALUES
(33, 'admin', '202cb962ac59075b964b07152d234b70', 'arsal@gmail.com', 'Admin Perpus', '', 'Batujajar', 'admin', '2024-03-04 01:36:09'),
(35, 'petugas', '202cb962ac59075b964b07152d234b70', 'arsal@gmail.com', 'Petugas Perpus', '', 'Batujajar', 'petugas', '2024-03-04 01:36:09'),
(36, 'user', '202cb962ac59075b964b07152d234b70', 'arsal@gmail.com', 'User', '', 'Batujajar', 'user', '2024-03-04 01:36:09'),
(37, 'peminjam', '202cb962ac59075b964b07152d234b70', 'arsal@gmail.com', 'Arsal', '', 'Batujajar', 'user', '2024-03-04 01:36:09'),
(38, 'pengguna', '202cb962ac59075b964b07152d234b70', 'arsal@gmail.com', 'Kutu Buku', '', 'Batujajar', 'user', '2024-03-04 01:36:09'),
(39, 'fall', '202cb962ac59075b964b07152d234b70', 'naufalfg1234@gmail.com', 'naufal', '085472611256', 'Kota Banjar', 'user', '2024-03-04 01:37:24'),
(40, 'maman', '202cb962ac59075b964b07152d234b70', 'admin@gmail.com', 'SAlman', '085472611256', 'Banjar Patroman', 'user', '2024-03-04 07:10:18'),
(41, 'admin121', '4c56ff4ce4aaf9573aa5dff913df997a', 'sam@gmail.com', '1212QA', '', 'Kadungora', 'petugas', '2024-03-04 07:37:20'),
(42, 'adminqeew', 'ee0b5fc393b05f2626bafa92e4f74d91', 'admin@gmail.com', 'asdafadf', '', '1212', 'petugas', '2024-03-04 07:38:41'),
(43, 'admineeee', '202cb962ac59075b964b07152d234b70', 'admin@gmail.com', '', '', 'Cikarang Barat', 'admin', '2024-03-04 07:39:06'),
(44, 'kemem', '202cb962ac59075b964b07152d234b70', 'feriogunawaj@gmail.com', 'naufaleee', '', 'Jakarta Pusat', 'admin', '2024-03-04 07:40:02');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`bukuid`),
  ADD KEY `kategoriid` (`kategoriid`);

--
-- Indeks untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  ADD PRIMARY KEY (`kategoriid`);

--
-- Indeks untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD PRIMARY KEY (`koleksiid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `koleksipribadi_ibfk_2` (`bukuid`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`peminjamanid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `bukuid` (`bukuid`);

--
-- Indeks untuk tabel `perpus`
--
ALTER TABLE `perpus`
  ADD PRIMARY KEY (`perpusid`);

--
-- Indeks untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD PRIMARY KEY (`ulasanid`),
  ADD KEY `ulasanbuku_ibfk_1` (`userid`),
  ADD KEY `ulasanbuku_ibfk_2` (`bukuid`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `bukuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `kategoriid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  MODIFY `koleksiid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `peminjamanid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT untuk tabel `perpus`
--
ALTER TABLE `perpus`
  MODIFY `perpusid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  MODIFY `ulasanid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`kategoriid`) REFERENCES `kategoribuku` (`kategoriid`);

--
-- Ketidakleluasaan untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD CONSTRAINT `koleksipribadi_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE,
  ADD CONSTRAINT `koleksipribadi_ibfk_2` FOREIGN KEY (`bukuid`) REFERENCES `buku` (`bukuid`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `bukuid` FOREIGN KEY (`bukuid`) REFERENCES `buku` (`bukuid`) ON DELETE CASCADE,
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD CONSTRAINT `ulasanbuku_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulasanbuku_ibfk_2` FOREIGN KEY (`bukuid`) REFERENCES `buku` (`bukuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
