-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jun 2022 pada 10.25
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galaxyphone`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `nama`, `username`, `password`) VALUES
(1, 'admin 1', 'admin1', '123'),
(2, 'admin 2', 'admin2', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id` int(5) NOT NULL,
  `pesanan_id` int(5) NOT NULL,
  `produk_id` int(5) NOT NULL,
  `harga` int(10) NOT NULL,
  `kuantitas` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id`, `pesanan_id`, `produk_id`, `harga`, `kuantitas`) VALUES
(198, 183, 8, 20299000, 1),
(201, 185, 8, 20299000, 1),
(202, 185, 13, 19499000, 1),
(205, 187, 3, 2337900, 1),
(206, 187, 4, 3500000, 1),
(208, 189, 26, 13250000, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gambar_produk`
--

CREATE TABLE `gambar_produk` (
  `id` int(5) NOT NULL,
  `produk_id` int(5) NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(5) NOT NULL,
  `type` varchar(50) NOT NULL,
  `merek` varchar(30) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `type`, `merek`, `deskripsi`) VALUES
(1, 'Android', 'Samsung', 'Samsung Handphone dengan Internet 5G\r\n'),
(2, 'Android', 'Xiaomi', 'Xiaomi Handphone dengan internet 5G'),
(4, 'Android', 'OPPO', 'can used in everywhere and everytime'),
(7, 'Android', 'VIVO', 'vivo for your life\r\n'),
(9, 'Android', 'Realme', 'Enjoy and post your picture'),
(10, 'Android', 'Asus', 'Gaming handphone powerfull'),
(11, 'Android', 'SONY', 'Technology of the powerfull'),
(12, 'IOS', 'Iphone', 'Prestige handphone');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `id` int(5) NOT NULL,
  `produk_id` int(5) NOT NULL,
  `kategori_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori_produk`
--

INSERT INTO `kategori_produk` (`id`, `produk_id`, `kategori_id`) VALUES
(55, 1, 1),
(66, 2, 2),
(57, 3, 1),
(58, 4, 1),
(67, 5, 11),
(52, 6, 4),
(51, 8, 12),
(68, 9, 7),
(62, 10, 1),
(69, 11, 2),
(56, 12, 1),
(11, 13, 12),
(59, 14, 1),
(12, 15, 10),
(54, 16, 9),
(53, 17, 9),
(61, 18, 1),
(60, 19, 1),
(70, 20, 7),
(71, 21, 2),
(72, 22, 11),
(73, 23, 4),
(74, 24, 7),
(75, 25, 10),
(101, 26, 2),
(102, 27, 11),
(103, 28, 4),
(104, 29, 7),
(105, 30, 10),
(106, 31, 2),
(107, 32, 11),
(108, 33, 7),
(109, 34, 4),
(110, 35, 10),
(111, 36, 1),
(112, 37, 1),
(113, 38, 10),
(114, 39, 7),
(115, 40, 7),
(116, 41, 7),
(117, 42, 7),
(118, 43, 11),
(119, 44, 11),
(120, 45, 4),
(121, 46, 4),
(122, 47, 2),
(123, 48, 1),
(124, 49, 7),
(125, 50, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(5) NOT NULL,
  `pelanggan_id` int(5) NOT NULL,
  `produk_id` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(12) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `total_harga` int(12) NOT NULL,
  `gambar_utama` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id`, `pelanggan_id`, `produk_id`, `nama`, `harga`, `jumlah`, `total_harga`, `gambar_utama`) VALUES
(176, 86, 26, 'Xiomi Mi Mix 4 [8/12GB 128GB/256GB]', 13250000, 3, 39750000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyrJsS-o62YG6nPHGU23eWtyS9oCyl_oTHf_Yd7c4zxtCbF34EjHAP1MWe72lWS5oCZ2M&amp;usqp=CAU');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `no_hp` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `email`, `password`, `nama_lengkap`, `alamat_pengiriman`, `no_hp`) VALUES
(75, 'satrio@gmail.com', '123', 'satrio', 'jalan flamboyan', 21309123),
(76, 'admin@gmail.com', '123', 'admin', 'tidak ada', 82738273),
(80, 'zero@gmail.com', '1231', 'zero', 'Jalan hayamuruk', 82766382),
(84, 'zaenal@gmail.com', '1234', 'Zainal', 'Jalan Suramadu RT02/RW01', 8272727),
(86, 'ronaldo7@gmail.com', '1234', 'Ronaldo', 'Jalan kayu putih RT02/RW01 Jakarta Utara', 2147483647);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(5) NOT NULL,
  `pelanggan_id` int(5) NOT NULL,
  `jumlah_biaya` int(10) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `tanggal_pemesanan` date NOT NULL,
  `metode_pembayaran` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `pelanggan_id`, `jumlah_biaya`, `alamat_pengiriman`, `tanggal_pemesanan`, `metode_pembayaran`) VALUES
(183, 75, 20299000, 'jalan Raya bandung rt02/rw01\r\n', '2022-06-08', 'COD'),
(185, 75, 39798000, 'Jalan flamboyan rt02/rw03', '2022-06-08', 'TRANSFER'),
(187, 84, 5837900, 'Jalan Surabaya', '2022-06-08', 'TRANSFER'),
(189, 86, 39750000, 'Jalan kayu putih RT02/RW01 Jakarta Utara', '2022-06-08', 'COD');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `berat` int(5) NOT NULL,
  `deskripsi` text NOT NULL,
  `spesifikasi` text NOT NULL,
  `stock` int(6) NOT NULL,
  `gambar_utama` varchar(200) NOT NULL,
  `hasil_penjualan` int(5) NOT NULL,
  `tanggal_barang_masuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `harga`, `berat`, `deskripsi`, `spesifikasi`, `stock`, `gambar_utama`, `hasil_penjualan`, `tanggal_barang_masuk`) VALUES
(1, 'Samsung Galaxy A03 LTE Smartphone [4/64 GB]', 1690000, 196, 'Rilis pada 26 November 2021\r\nFitur utama Samsung Galaxy A12: Layar 6,5 inci Kamera depan dengan auto-focus 4 kamera belakang dengan lensa utama 48 megapiksel Memori internal sebesar 128 GB Baterai besar 5000mAh Fitur pengisian cepat (fast charging) 15 watt, Sistem Operasi Android 11', '<p>Memori Internal: 32GB 3GB RAM, 32GB 4GB RAM, 64GB 4GB RAM, 128GB 4GB RAM</p><br>\r\n<p>Memori Eksternal: microSDXC (dedicated slot)</p><br>\r\n<p>Dimensi: 164.2 x 75.9 x 9.1 mm (6.46 x 2.99 x 0.36 in)</p><br>\r\n<p>Type Layar: Li-Po 5000 mAh, non-removable</p><br>\r\n<p>Size 6.5 Inch</p><br>\r\n<p>Selfie camera: 5 Megapixel</p><br>\r\n<p>Rear camera: 13 Mega-pixel+2 Megapixels+2 Mega Pixel</p><br>\r\n<p>MediaTek MT6765 Helio P35</p><br>\r\n', 20, 'https://cdn.eraspace.com/pub/media/catalog/product/8/1/810003251711_1.jpg', 28, '2022-06-03'),
(2, 'Xiaomi POCO M3 6/128', 2800000, 300, 'Rilis pada 24 November 2020\r\nPOCO M3 merupakan smartphone entry-level pertama dari POCO, sub-brand dari Xiaomi. Dengan jargon Entry-Level Killer, POCO M3 benar-benar HP murah terbaik yang bisa kamu dapatkan dengan harga Rp 2,8 juta. Walaupun harganya murah, POCO M3 sudah mengusung Snapdragon 662, chipset yang biasanya digunakan smartphone mid-range.', '<p>Memori Internal: 64/128/256 GB</p><br>\r\n<p>Memori Eksternal: MicroSDXC</p><br>\r\n<p>Dimensi: 162.3 x 77.2 x 9.6 mm</p><br>\r\n<p>Tipe Layar: Li-Poly (Lithium Polymer)</p><br>\r\n<p>Pengisi daya cepat 18W</p><br>\r\n<p>Resolusi: 2340x1080 FHD+</p><br>\r\n<p>Screen Size: 6.53\" FHD+ Layar Dot Drop</p><br>\r\n<p>48 MP Kamera utama</p><br>\r\n<p>Kamera Depan: 8 MP Kamera Depan</p><br>\r\n<p>Battery Capacity: 6000mAh</p><br>\r\n<p>Operating System: MIUI 12 untuk POCO, berbasis Android 10\r\n</p><br>', 20, 'https://cdn.eraspace.com/pub/media/catalog/product/x/i/xiaomi_poco_m3_pro_5g_black_1.jpg', 10, '2022-06-03'),
(3, 'Samsung Galaxy A12 [6/128GB]', 2337900, 205, 'Rilis pada 23 Desember 2020\r\nFitur utama Samsung Galaxy A12: Layar 6,5 inci Kamera depan dengan auto-focus 4 kamera belakang dengan lensa utama 48 megapiksel Memori internal sebesar 128 GB Baterai besar 5000mAh Fitur pengisian cepat (fast charging) 15 watt', '<p>Internal Storage: 128 GB</p><br>\r\n<p>Kamera Depan: 8 MP (f/2.2)</p><br>\r\n<p>Baterai 5.000 mAh fast charging 15 Watt</p><br>\r\n<p>Dimensi: 164 x 75.8 x 8.9 mm (6.46 x 2.98 x 0.35 in)</p><br>\r\n<p>Fast charging 15W</p><br>\r\n<p>Dual SIM (Nano) + Micro SD (hingga 1 TB)</p><br>\r\n<p>RAM 4 GB dan 6 GB</p><br>\r\n<p>Mediatek Helio P35</p><br>\r\n<p>Layar 6,5 inci HD Plus (1.600 x 720 piksel)</p><br>\r\n<p>Android 10 One UI Core 2.5</p><br>', 24, 'https://cdn.eraspace.com/pub/media/catalog/product/s/a/samsung_galaxy_a12_blue_1.jpg', 3, '2022-06-01'),
(4, 'Samsung Galaxy A51 [8/128 GB]', 3500000, 172, 'Rilis pada 12 Desember 2019\r\nSamsung Galaxy A51 Smartphone [6GB/128GB], hadir dengan ukuran layar 6.5 inch dan didukung oleh sistem operasi Android 10.', '<p>Card slot: microSDXC (dedicated slot)</p><br>\r\n<p>Internal: 64GB 4GB RAM, 128GB 4GB RAM, 128GB 6GB RAM, 128GB 8GB RAM, 256GB 8GB RAM</p><br>\r\n<p>Dimensi: 158.5 x 73.6 x 7.9 mm (6.24 x 2.90 x 0.31 in)</p><br>\r\n<p>Type: Li-Po 4000 mAh, non-removable</p><br>\r\n<p>Fast charging 15W</p><br>\r\n<p>Protection Corning Gorilla Glass 3</p><br>\r\n<p>Resolution 1080 x 2400 pixels, 20:9 ratio (~405 ppi density)</p><br>\r\n<p>Size 6.5 inches, 102.0 cm2 (~87.4% screen-to-body ratio)</p><br>\r\n<p>Type	Super AMOLED</p><br>\r\n', 34, 'https://cdn.eraspace.com/pub/media/catalog/product/g/a/galaxy_a51_black_1_1_1.jpg', 21, '2022-01-15'),
(5, 'Sony Xperia 1 ll [5 GB 8/256 GB]', 15400000, 178, 'Rilis pada 24 February 2020\r\nSony Xperia 1 II Smartphone Android. Diumumkan Feb 2020. Memiliki layar 6,5\", chipset Snapdragon 865 5G, baterai 4000 mAh, penyimpanan 256 GB, RAM 12 GB.\r\n ', '<p>Dimensi: 165.1 x 71.1 x 7.6 mm (6.5 x 2.80 x 0.30 in)</p><br>\r\n<p>SIM: Hybrid Dual SIM (Nano-SIM, dual stand-by)</p><br>\r\n<p>Memori Internal: 256 GB 8 GB RAM</p><br>\r\n<p>Memori Eksternal: microSDXC (uses shared SIM slot)</p><br>\r\n<p>Baterai: 4000 mAh</p><br>\r\n<p>Resolution 1644 x 3840 pixels, 21:9 ratio (~643 ppi density)</p><br>\r\n<p>Size 6.5 inches, 98.6 cm2 (~84.0% screen-to-body ratio)</p><br>\r\n<p>Type OLED capacitive touchscreen, 1B colors</p><br>\r\n<p>Android 10</p><br>\r\n', 25, 'https://fdn.gsmarena.com/imgroot/news/22/05/sony-xperia-1-iv-announcement/-1200/gsmarena_001.jpg', 3, '2022-03-18'),
(6, 'Oppo A52 [6/128 GB]', 2450000, 192, 'Rilis pada 20 April 2020\r\nOppo A52 rilis di indonesia dengan RAM 6GB dan ROM 128GB. Sebagai smartphone mid-range dari oppo ini dibekai quad kamera dengan resolusi 12 MP sebegai lensa utama, 8 MP untuk foto ultrawide, 2 MP lensa macro dan 2 MP lensa depan', '<p>Dimensi: 162 x 75.5 x 8.9 mm (6.38 x 2.97 x 0.35 in)</p><br>\r\n<p>Memori Internal: 64GB 4GB RAM, 128GB 4GB RAM, 128GB 6GB RAM, 128GB 8GB RAM</p><br>\r\n<p>Memori Eksternal: microSDXC (uses shared SIM slot)</p><br>\r\n<p>Charging: Fast charging 18W</p><br>\r\n<p>Android 10 ColorOS 7.1</p><br>\r\n<p>Type IPS LCD, 480 nits (typ)</p><br>\r\n<p>Baterai 5000 mAh</p><br>\r\n<p>Size 6.5 inches</p><br>\r\n<p>Resolution 1080 x 2400 pixels, 20:9 ratio (~405 ppi density)</p><br>', 20, 'https://cdn.eraspace.com/pub/media/catalog/product/o/p/oppo_a3s_purple_7_2.jpg', 6, '2022-04-20'),
(7, 'Samsung Galaxy A11 [3/32 GB]', 1950000, 177, 'Rilis pada 1 Mei 2020\r\nSamsung A11 membekali dengan panel TFT PLS seluas 6,4 inci HD+ dengan resolusi 720×1560 piksel. Lewat layar Infinity-O, A11 menaungi lensa kamera depan 8 Megapiksel berupa lubang pada layar. Namun, sayangnya tak ada proteksi khusus yang dibawa A11, melainkan harus membelinya secara terpisah, seperti anti gores tambahan', '<p>Dimensi: 161.4 x 76.3 x 8 mm (6.35 x 3.00 x 0.31 in)</p><br>\r\n<p>Memori Internal: microSDXC (dedicated slot)</p><br>\r\n<p>Memori Ekstenal: 32GB 2GB RAM, 32GB 3GB RAM, 64GB 3GB RAM, 64GB 4GB RAM</p><br>\r\n<p>USB Type-C 2.0</p><br>\r\n<p>Baterai 4000 mAh</p><br>\r\n<p>Resolution 720 x 1560 pixels</p><br>\r\n<p>Type PLS LCD</p><br>\r\n<p>Size 6.4 inches</p><br>\r\n<p>Android 10 Upgradable to Android 11, One UI 3.1</p><br>', 20, 'https://cdn.eraspace.com/pub/media/catalog/product/i/c/ic88096645648951.jpg', 9, '2022-05-10'),
(8, 'Iphone 12 Pro Max [256 GB]', 20299000, 228, 'Rilis pada 13 Oktober 2020\r\nIphone 12 Pro Max adalah hp Apple terbaru yang ditenagai chipset A14 Bionic, dibekali sistem kamrena kelas profesional yang punya senstivitas cahaya lebih baik', '<p>Dimensi: 160.8 x 78.1 x 7.4 mm (6.33 x 3.07 x 0.29 in)</p><br>\r\n<p>Memori Internal: 128GB 6GB RAM, 256GB 6GB RAM, 512GB 6GB RAM</p><br>\r\n<p>Charging: Fast charging 22W, 50% in 30 min</p><br>\r\n<p>Features: Dual-LED dual-tone flash, HDR (photo/panorama)</p><br>\r\n<p>Baterai Li-lon 3687 mAh</p><br>\r\n<p>Resolution 1284 x 2778 pixels</p><br>\r\n<p>Size 6.7 inches</p><br>\r\n<p>Type Super Retina XDR OLED, HDR10, Dolby Vision, 800 nits (HBM), 1200 nits (peak)</p><br>\r\n<p>iOS 14.1, Upgradable to iOS 15.5</p><br>', 46, 'https://cdn.eraspace.com/pub/media/catalog/product/i/p/iphone_12_pro_max_silver_1_2.jpg', 16, '2022-05-23'),
(9, 'Vivo X70 Pro [5 GB / 256 GB]', 10800000, 185, 'Rilis 17 September 2021\r\nBrand ternama lain pada umumnya merilis produk unggulan mereka hanya setahun sekali. Namun, Vivo X70 Pro dirilis hanya 5 bulan setelah generasi sebelumnya, yakni X60 Pro. X70 Pro yang dirilis Vivo pada 17 September 2021 merupakan smartphone yang termasuk dalam kategori flagship.Walaupun hanya berjarak sangat dekat dengan pendahulunya, HP ini telah mengalami beberapa peningkatan signifikan', '<p>Dimensi: 158.3 x 73.2 x 8 mm (6.23 x 2.88 x 0.31 in)</p><br>\r\n<p>Memori Internal: 128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM, 256GB 16GB RAM, 512GB 12GB RAM</p><br>\r\n<p>USB Type-C 2.0</p><br>\r\n<p>Charging: Fast charging 44W</p><br>\r\n<p>Baterai Li-Po 4450 mAh</p><br>\r\n<p>Resolution 1080 x 2376 pixels</p><br>\r\n<p>Size  6.56 inches</p><br>\r\n<p>Type AMOLED, 120Hz, HDR10+, 1300 nits (peak)</p><br>\r\n<p>Android 11, Funtouch OS 12</p><br>\r\n', 15, 'https://cdn.eraspace.com/pub/media/catalog/product/v/i/vivo_t1_5g_rainbow_fantasy_1.jpg', 2, '2022-01-27'),
(10, 'Samsung Galaxy S21 [8/256 GB]', 11999000, 171, 'Rilis pada 18 April 2020\r\nSamsung Galaxy S21 adalah jajaran ponsel cerdas berbasis Android yang dirancang, dikembangkan, dipasarkan, dan diproduksi oleh Samsung Electronics sebagai bagian dari seri Galaxy S. Secara kolektif, seri Galaxy S21 juga berperan sebagai penerus seri Galaxy S20', '<p>Dimensi: 151.7 x 71.2 x 7.9 mm (5.97 x 2.80 x 0.31 in)</p><br>\r\n<p>Memori Internal: 128GB 8GB RAM, 256GB 8GB RAM</p><br>\r\n<p>Features: LED flash, auto-HDR, panorama</p><br>\r\n<p>Charging: Fast charing 25W</p><br>\r\n<p>Android 11, One UI 3.1</p><br>\r\n<p>Type Dynamic AMOLED 2X, 120Hz, HDR10+, 1300 nits (peak)</p><br>\r\n<p>Size 6.2 inches</p><br>\r\n<p>Resolution 1080 x 2400 pixels</p><br>\r\n<p>Baterai 4000 mAh</p><br>', 27, 'https://cdn.eraspace.com/pub/media/catalog/product/s/a/samsung_galaxy_s21_fe_5g_graphite_1.jpg', 1, '2022-06-03'),
(11, 'Xiaomi 11t Pro [12G / 256]', 5848000, 204, 'Rilis pada 15 September 2021\r\nXiaomi 11T Pro Xiaomi 11T Pro menjadi seri yang tertinggi. Ia ditenagai chipset Qualcomm Snapdragon 888 5G dengan RAM 8 GB dan 12 GB, serta memori internal 256 GB. Ukuran layarnya 6,67 inci AMOLED dengan resolusi 1080x2400 pixels dan memiliki kecepatan refresh rate 120Hz', '<p>Dimensi: 164.1 x 76.9 x 8.8 mm (6.46 x 3.03 x 0.35 in)</p><br>\r\n<p>Memori Internal: 128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM</p><br>\r\n<p>Features: Dual-LED dual-tone flash, HDR, panorama</p><br>\r\n<p>Charging: Fast charging 120W</p><br>\r\n<p>Baterai Li-Po 5000 mAh, non-removabl</p><br>\r\n<p>Android 11, MIUI 12.5</p><br>\r\n<p>Type AMOLED, Dolby Vision, 1B colors, 120Hz, HDR10+, 800 nits (typ), 1000 nits (peak)</p><br>\r\n<p>Size 6.67 inches</p><br>\r\n<p>Resolution 1080 x 2400 pixels</p><br>', 40, 'https://cdn.eraspace.com/pub/media/catalog/product/h/m/hmi-k3s8256-ceb1.jpg', 5, '2022-02-11'),
(12, 'Samsung Galaxy A6 [8/256 GB]', 5800000, 162, 'Rilis pada 5 Mei 2018\r\nGalaxy A6 Dari tampilan layar, Galaxy A6 berukuran 5,6 inci HD dan super amoled dengan infinity display. Kamera belakang 16 MP (f1.7) dan kamera depan 16 MP (f1.9) serta dilengkapi pemindai sidik jari di punggungnya', '<p>Dimension: 149.9 x 70.8 x 7.7 mm (5.90 x 2.79 x 0.30 in)</p><br>\r\n<p>Memori Eksternal: microSDXC (dedicated slot)</p><br>\r\n<p>Memori Internal: 32GB 3GB RAM, 32GB 4GB RAM, 64GB 4GB RAM</p><br>\r\n<p>USB microUSB 2.0</p><br>\r\n<p>Baterai Li-Ion 3000 mAh</p><br>\r\n<p>Andorid 8.0 (Oreo), upgradable to Android 10, One UI 2.0</p><br>\r\n<p>Type Super AMOLED</p><br>\r\n<p>Size	5.6 inches</p><br>\r\n<p>Resolution 720 x 1480 pixels</p><br>', 10, 'https://cdn.eraspace.com/pub/media/catalog/product/8/1/81000491621_1.jpg', 2, '2022-05-15'),
(13, 'Apple iphone 13 Pro Max [256 GB]', 19499000, 240, 'Rilis pada 14 September 2021\r\nBagian depan Ceramic Shield\r\nBagian belakang kaca matte bertekstur dan desain baja tahan karat, Bagian depan Ceramic Shield\r\nBagian belakang kaca matte bertekstur dan desain baja tahan karat, Layar Super Retina XDR dengan ProMotion, Kecerahan maks 1.000 nit (umum); kecerahan maks 1.200 nit (HDR)', '<p>Dimensi: 160.8 x 78.1 x 7.7 mm (6.33 x 3.07 x 0.30 in)</p><br>\r\n<p>Memori Internal: 128GB 6GB RAM, 256GB 6GB RAM, 512GB 6GB RAM, 1TB 6GB RAM</p><br>\r\n<p>Baterai Type: Li-Ion 4352 mAh, non-removable (16.75 Wh)</p><br>\r\n<p>Fast charging (27W, unofficial rating), 50% in 30 min (advertised)</p><br>\r\n<p>Features: HDR</p><br>\r\n<p>iOS 15, upgradable to iOS 15.5</p><br>\r\n<p>Type Super Retina XDR OLED, 120Hz, HDR10, Dolby Vision, 1000 nits (HBM), 1200 nits (peak)</p><br>\r\n<p>Size	6.7 inches</p><br>\r\n<p>Resolution	1284 x 2778 pixels</p><br>\r\n\r\n', 44, 'https://cdn.eraspace.com/pub/media/catalog/product/i/p/iphone_13_pro_max_alpine_green_1_5.jpg', 1, '2022-03-21'),
(14, 'Samsung Galaxy A52 [5G 8/256 GB]', 5999000, 189, 'Rilis pada 17 Maret 2021\r\nBeberapa fitur spesial yang biasa hanya terdapat pada handphone premium kini tersemat pada seri Galaxy A5 terbaru ini. Mulai dari segi ketahanan, teknologi layar, kamera hingga baterai yang juga turut mendapat upgrade, Kapasitas baterai juga menjadi sektor yang tak luput dari perhatian Samsung untuk diberi peningkatan. A52 punya baterai berkapasitas 4.500 miliampere hour (mAh) atau naik sebesar 500 mAh dibandingkan A51\r\n', '<p>Dimensi: 159.9 x 75.1 x 8.4 mm (6.30 x 2.96 x 0.33 in)</p><br>\r\n<p>Memori Eksternal: microSDXC (uses shared SIM slot)</p><br>\r\n<p>Memori Internal: 128GB 4GB RAM, 128GB 6GB RAM, 128GB 8GB RAM, 256GB 6GB RAM, 256GB 8GB RAM</p><br>\r\n<p>Baterai 4500 mAh</p><br>\r\n<p>USB Type-C 2.0, USB On-The-Go</p><br>\r\n<p>Android 11, upgradable to Android 12, One UI 4.0</p><br>\r\n<p>Type Super AMOLED, 90Hz, 800 nits (HBM)</p><br>\r\n<p>Size 6.5 inches</p><br>\r\n<p>Resolution 1080 x 2400 pixels</p><br>\r\n', 28, 'https://cdn.eraspace.com/pub/media/catalog/product/g/a/galaxy_a52s_awesome_white_1.jpg', 4, '2022-03-13'),
(15, 'Asus ROG Phone 5 [12/256 GB]', 11499000, 248, 'Rilis pada 26 April 2021\r\nAsus ROG Phone 5 memiliki kapasitas batrerai 6000mAh dengan fast charging 65W. Ponsel ini memiliki layar 6.7 inch, lengkap dengan AMOLED HDR10 dan refresh rate 144 hertz/1 milisekon. Sementara untuk kesensitifan layar terhadap sentuhan memiliki nilai touch sampling rate300 Hz dan latensi sentuh 24,3 ms', '<p>Dimensi: 172.8 x 77.3 x 10.3 mm (6.80 x 3.04 x 0.41 in)</p><br>\r\n<p>Memori Internal: 128GB 8GB RAM, 128GB 12GB RAM, 256GB 12GB RAM, 256GB 16GB RAM</p><br>\r\n<p>Wi-Fi 802.11 a/b/g/n/ac/6e, dual-band, Wi-Fi Direct, hotspot</p><br>\r\n<p>USB Type-C 3.1 (side), USB Type-C 2.0 (bottom), accessory connector, USB On-The-Go</p><br>\r\n<p>Baterai 6000 mAh</p><br>\r\n<p>Android 11, upgradable to Android 12, ROG UI</p><br>\r\n<p>TypeAMOLED, 1B colors, 144Hz, HDR10+, 800 nits (typ), 1200 nits (peak)</p><br>\r\n<p>Size	6.78 inches</p><br>\r\n<p>Resolution 1080 x 2448 pixels</p><br>', 38, 'https://cdn.eraspace.com/pub/media/catalog/product/a/s/asus_rog_5s_white_1_2.jpg', 3, '2022-05-21'),
(16, 'Realme GT ME 5G [8/128 GB]', 4999000, 174, 'Rilis pada 10 Maret 2021\r\nRealme GT Master Edition telah resmi meluncur di Indonesia. Smartphone ini memiliki desain yang eksklusif, hasil rancangan seorang desainer industrial andal dari Jepang bernama Naoto Fukusawa, Realme GT Master Edition dibekali spesifikasi yang andal dan juga kencang. Smartphone ini menggunakan prosesor Snapdragon 778G yang telah mendukung jaringan 5G. Prosesor ini dibuat dengan arsitektur 6nm yang menyuguhkan kinerja kencang dengan efisiensi daya yang bagus', '<p>Dimensi: 158.5 x 73.3 x 8.4 mm (Glass) / 9.1 mm (Leather)</p><br>\r\n<p>Memori Internal: 128GB 8GB RAM, 256GB 12GB RAM</p><br>\r\n<p>Features Dual-LED dual-tone flash, HDR, panorama</p><br>\r\n<p></USB Type-C 2.0, USB On-The-Gop><br>\r\n<p>Baterai 4500 mAh</p><br>\r\n<p>Android 11, upgradable to Android 12, Realme UI 3.0</p><br>\r\n<p>Type Super AMOLED, 120Hz, HDR10+</p><br>\r\n<p>Size 6.43 inches</p><br>\r\n<p>Resolution 1080 x 2400 pixels</p><br>', 18, 'https://cdn.eraspace.com/pub/media/catalog/product/h/r/hre-gtme-128-blu.jpg', 3, '2022-01-04'),
(17, 'Realme 8 Pro [8/128 GB]', 4299000, 176, 'Rilis pada 25 Maret 2021\r\nrealme 8 Pro menggunakan proses teknologi AG-Crystal. Proses AG ini menciptakan sensasi visual layaknya melihat pemandangan langit berbintang yang tersusun dari butiran-butiran kecil yang padat. Desain ini realme sebut dengan Infinite Starry Design – seperti memegang tampilan langit berbintang di dalam genggaman, realme 8 Pro tampak berbeda dengan generasi sebelumnya, dengan berat hanya 176g dan tebal 8.1mm, menjadikannya nyaman saat digenggam', '<p>Dimensi: 160.6 x 73.9 x 8.1 mm (6.32 x 2.91 x 0.32 in)</p><br>\r\n<p>Memori Eksternal: microSDXC (dedicated slot)</p><br>\r\n<p>Memori Internal: 128GB 6GB RAM, 128GB 8GB RAM</p><br>\r\n<p>Features LED flash, HDR, panorama</p><br>\r\n<p>Type Li-Po 4500 mAh, non-removable</p><br>\r\n<p>USB Type-C 2.0, USB On-The-Go</p><br>\r\n<p>Android 11, Realme UI 2.0</p><br>\r\n<p>Type Super AMOLED, 430 nits (typ), 1000 nits (peak)</p><br>\r\n<p>Size	6.4 inches</p><br>\r\n<p>Resolution 1080 x 2400 pixels</p><br>\r\n', 32, 'https://cdn.eraspace.com/pub/media/catalog/product/r/e/realme_8_silver_1.jpg', 11, '2022-02-27'),
(18, 'Samsung Galaxy Note 20 [8/256 GB]', 8699000, 192, 'Rilis pada 5 Agustus 2020\r\nGalaxy Note dibekali dengan tiga kamera belakang yang terdiri dari kamera wide angle 108 MP, kamera telephoto 12 MP, dan kamera ultra wide 12 MP. Dan dibekali layar dengan luas 6,7 inci \r\n', '<p>Dimensi: 161.6 x 75.2 x 8.3 mm (6.36 x 2.96 x 0.33 in)</p><br>\r\n<p>Memori Internal: 256GB 8GB RAM</p><br>\r\n<p>Features Dual video call, Auto-HDR</p><br>\r\n<p>USB Type-C 3.2, USB On-The-Go</p><br>\r\n<p>Baterai 4300 mAh</p><br>\r\n<p>Android 10, upgradable to Android 11, One UI 3.0</p><br>\r\n<p>Type Super AMOLED Plus, HDR10+</p><br>\r\n<p>Size 6.7 inches</p><br>\r\n<p>Resolution 1080 x 2400 pixels</p><br>', 24, 'https://cdn.eraspace.com/pub/media/catalog/product/g/a/galaxy_note20_ultra_mystic_black_1_5_1.jpg', 7, '2022-01-29'),
(19, 'Samsung Galaxy M53 [5G 8/256 GB]', 5799000, 176, 'Rilis pada 7 April 2022\r\nSamsung Galaxy M53 hadir dengan chipset Dimensity 900 5G dengan prosesor Octa-core (2×2.4 GHz Cortex-A78 & 6×2.0 GHz Cortex-A55), GPU Mali-G68 MC4, kamera utama beresolusi 108 MP dan konfigurasi memori 128GB 6GB RAM. Diperkenalkan pada 2022, April 07, HP Samsung Galaxy M53 mengandalkan sistem operasi berbasis Android 12, One UI 4.1, layar Super AMOLED Plus, 120Hz dan baterai berkapasitas 5000 mAh', '<p>Dimensi: 164.7 x 77 x 7.4 mm (6.48 x 3.03 x 0.29 in)</p><br>\r\n<p>Memori Eksternal: 	microSDXC (uses shared SIM slot)</p><br>\r\n<p>Memori Internal: 128GB 6GB RAM, 128GB 8GB RAM, 256GB 8GB RAM</p><br>\r\n<p>Baterai 5000 mAh</p><br>\r\n<p>USB Type-C 2.0, USB On-The-Go</p><br>\r\n<p>Android 12, One UI 4.1</p><br>\r\n<p>Type Super AMOLED Plus, 120Hz</p><br>\r\n<p>Size 6.7 inches</p><br>\r\n<p>Resolution 1080 x 2408 pixels</p><br>', 16, 'https://cdn.eraspace.com/pub/media/catalog/product/s/a/samsung_galaxy_m53_5g_8_256gb_-_green_9.jpg', 11, '2022-04-25'),
(20, 'Vivo Y70 [8GB/128 GB]', 4400000, 171, 'Rilis pada 19 Oktober 2020\r\nProduk yang satu ini hadir dengan layar 6,53 inci beresolusi Full HD+ (1080 x 2340 piksel). Layarnya sendiri telah memiliki aspek rasio 19,5:9 dengan rasio layar-ke-bodi 90,72% serta berdimensi 162,07×76,61×8,46 mm dengan bobot 190 gram. Lantaran layarnya tidak memiliki panel khusus, fingerprint pun disematkan di samping kanan bodi ponsel, vivo Y70s menawarkan pengaturan tiga kamera belakang yang terdiri dari kamera utama 48 MP dengan apertur f/1.79, kamera ultrawide 8 MP dengan apertur f/2.2, dan kamera sekunder 2 MP dengan apertur f/2.4. Untuk kamera depannya memiliki resolusi 16 MP yang tersemat di lubang notch kiri atas', '<p>Dimensi: 161 x 74.1 x 7.8 mm (6.34 x 2.92 x 0.31 in)</p><br>\r\n<p>Memori Eksternal: 	microSDXC (dedicated slot)</p><br>\r\n<p>Memori Internal: 128GB 8GB RAM</p><br>\r\n<p>USB Type-C 2.0, USB On-The-Go</p><br>\r\n<p>4100 mAh</p><br>\r\n<p>Type AMOLED</p><br>\r\n<p>Android 10, Funtouch 11</p><br>\r\n<p>Size 6.44 inches</p><br>\r\n<p>Resolution 1080 x 2400 pixels</p><br>\r\n<p>Android 10, Funtouch 11</p><br>\r\n<p>Type AMOLED</p><br>\r\n<p>Size 6.44 inches</p><br>\r\n<p>Resolution 1080 x 2400 pixels</p><br>', 20, 'https://cdn.eraspace.com/pub/media/catalog/product/v/i/vivo-v75-5g0.jpg', 3, '2022-02-28'),
(21, 'Xiomi 12 Pro [12GB/256GB]', 12599000, 204, 'Rilis pada 28 Desember 2021\r\nXiaomi 12 Pro menjadi hp Xiaomi terbaru di kelas premium. Dibekali spesifikasi dan fitur kelas atas, seperti diotaki chipset Snapdragon 8 Gen 1, menggunakan RAM 12 GB LPDDR5 dan penyimpanan 256 GB UFS 3.1. Dari sisi kamera, Xiaomi 12 Pro menanam sensor Sony IMX 707 dengan konfigurasi kamera utama 50 MP (wide), 50 MP (ultra wide) dan 50 MP (telefoto). Kamera ini pun masih didukung fitur fotografi apik seperti OIS, perekaman video 8K, 4K, Ultra Night Video, ProFocus, eye tracking focus, Ultra Night Photo 2.0 dan Portrait Night mode.', '<p>Dimensi: 163.6 x 74.6 x 8.2 mm (6.44 x 2.94 x 0.32 in)</p><br>\r\n<p>Android 12, MIUI 13</p><br>\r\n<p>Type LTPO AMOLED, 1B colors, 120Hz, Dolby Vision, HDR10+, 1000 nits (HBM), 1500 nits (peak)</p><br>\r\n<p>Size 6.73 inches</p><br>\r\n<p>Resolution 1440 x 3200 pixels</p><br>\r\n<p>Memori Internal: 128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM</p><br>\r\n<p>Baterai 4600 mAh</p><br>\r\n<p>Fast charging 120W</p><br>\r\n<p>USB Type-C 2.0, USB On-The-Go</p><br>\r\n<p>Bluetooth 5.2, A2DP, LE</p><br>\r\n<p>Features HDR, panorama</p><br>\r\n', 19, 'https://cdn.eraspace.com/pub/media/catalog/product/x/i/xiaomi_12_pro_purple_1.jpg', 0, '2022-01-11'),
(22, 'Sony Xperia 5 II [8GB 128/256GB]', 11999000, 163, 'Rilis pada 17 September 2020\r\nSony Xperia 5 II memiliki spesifikasi hardware yang sama dengan Xperia 1 II. Keduanya sama-sama ditenagai oleh chip Qualcomm Snapdragon 865 berbasis 5G (sub-6 GHz). Chip tersebut dipadukan dengan RAM 8 GB dan dua opsi media penyimpanan, yaitu 128 GB atau 256 GB. Terdapat layar OLED seluas 6.1 inci dengan dukungan HDR BT2020 dan pelindung layar berupa Corning Gorilla Glass 6', '<p>Dimensi: 158 x 68 x 8 mm (6.22 x 2.68 x 0.31 in)</p><br>\r\n<p>SIM: Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</p><br>\r\n<p></Type OLED, 120Hz, HDR BT.2020p><br>\r\n<p>Size 6.1 inches</p><br>\r\n<p>Resolution 1080 x 2520 pixels</p><br>\r\n<p>Android 10, upgradable to Android 12</p><br>\r\n<p>Memori Eksternal: microSDXC (uses shared SIM slot)</p><br>\r\n<p>Memori Internal: 128GB 8GB RAM, 256GB 8GB RAM</p><br>\r\n<p>Features Zeiss optics, LED flash, panorama, HDR, eye tracking</p><br>\r\n<p>USB Type-C 3.1, USB On-The-Go</p><br>\r\n<p>Baterai 4000 mAh</p><br>\r\n<p>Fast charging 21W</p><br>\r\n', 30, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQV7abLg8_Wno6td_DsCXhJn58f5gUDzXX4A&usqp=CAU', 0, '2022-04-23'),
(23, 'Oppo Reno 6 Pro [8/128GB]', 3299000, 164, 'Rilis pada 10 Oktober 2020\r\nOppo Reno 4F memiliki keunggulan dari sektor kamera dan desain yang dirancang lebih segar, Reno 4F memiliki desain punggung bertekstur shiny matte yang akan menghasilkan warna bervariasi ketika terkena cahaya. Layar yang berjenis Super Amoled memiliki diagonal 6,43 inci dengan resolusi 2.400 x 1.080 piksel dan aspect ratio 9:20, terdapat lapisan corning gorilla glass 3 plus yang ditunjukan untuk melindungi permukaan layar smartphone. Reno 4F dibekali dengan System-on-chip (SoC) MKT helio P95 yang dipadankan dengan RAM 8GB dan penyimpanan internal 128GB', '<p>Dimensi: 160.1 x 73.8 x 7.5 mm (6.30 x 2.91 x 0.30 in)</p><br>\r\n<p>Type Super AMOLED, 430 nits (typ), 800 nits (peak)</p><br>\r\n<p></pSize 6.43 inches><br>\r\n<p>Resolution 1080 x 2400 pixels</p><br>\r\n<p>Android 10, ColorOS 7.2</p><br>\r\n<p>Memori Eksternal: microSDXC (dedicated slot)</p><br>\r\n<p>Memori Internal: 128GB 8GB RAM</p><br>\r\n<p>Features LED flash, HDR, panorama</p><br>\r\n<p>Bluetooth 5.1, A2DP, LE, aptX HD</p><br>\r\n<p>USB Type-C 2.0, USB On-The-Go</p><br>\r\n<p>Baterai 4000 mAh</p><br>\r\n<p>Fast charging 18W</p><br>', 29, 'https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2021/08/Oppo-Reno6-Pro-5G-300x300.jpg', 0, '2022-02-28'),
(24, 'Vivo Y20 [4GB/64GB]', 1999000, 192, 'Rilis pada 26 Agustus 2020\r\nHP Vivo Y20 hadir dengan membawa desain yang menawan dan terlihat mewah dengan menggunakan material polikarbonat di sisi belakang. Selain itu, Vivo juga memberikan sentuhan akhir yang mengkilat dan memberikan efek gradasi yang elegan sehingga meningkatkan kesan mewah pada HP ini. Kesan yang ditimbulkan cukup mewah dengan ketebalan dan bobot yang ideal serta memiliki dimensi ukuran 164.4 x 76.3 x 8.4 mm (6.47 x 3.00 x 0.33 in) dengan berat 192.3 gram. Sensor sidik jari di Vivo Y20 terletak di sisi kanan HP satu tempat dengan tombol power dan volume. Di bagian kirinya terdapat 3 slot untuk kartu SIM dan microSD sekaligus', '<p>Dimensi: 164.4 x 76.3 x 8.4 mm (6.47 x 3.00 x 0.33 in)</p><br>\r\n<p>Type IPS LCD</p><br>\r\n<p>Size 6.51 inches</p><br>\r\n<p>Android 10, Funtouch 10.5</p><br>\r\n<p>Memori Eksternal: microSDXC (dedicated slot)</p><br>\r\n<p>Memori Internal: 64GB 3GB RAM, 64GB 4GB RAM, 64GB 6GB RAM</p><br>\r\n<p>Features LED flash, HDR</p><br>\r\n<p>microUSB 2.0, USB On-The-Go</p><br>\r\n<p>Baterai 5000 mAh, non-removable</p><br>\r\n<p>Fast charging 18W</p><br>\r\n<p>Bluetooth 5.0, A2DP, LE</p><br>\r\n', 22, 'https://cdn.eraspace.com/pub/media/catalog/product/v/i/vivo_y20_3_64gb_-_dawn_white_badge_drt_1.jpg', 0, '2022-01-29'),
(25, 'Asus Zenfone 8 [16GB 128/256GB]', 7499000, 169, 'Rilis pada 12 Mei 2021\r\nKesan pertama pada zenfone 8 ini punya desain yang simple, terdapat 2 lensa kamera di bagian belakangnya yang jika sekilas dilihat kurang sentris penempatannya. Tapi untuk spesifikasinya zenfone 8 terbilang menarik karena layarnya sudah Corning Gorilla Glass Victus, dan memiliki sertifikasi IP68 di mana hp tersebut sudah anti air dan anti debu. Zenfone 8 akan menawarkan kekuatan dari Qualcomm® Snapdragon™ 888 5G Mobile Platform, layar amoled super jernih 120 Hz untuk kualitas visual yang mengagumkan, baterai 4000 mAh dengan daya tahan panjang untuk bekerja atau bermain tanpa henti, dan sistem kamera pro-grade lengkap dengan sensor dari Sony', '<p>Dimensi: 148 x 68.5 x 8.9 mm (5.83 x 2.70 x 0.35 in)</p><br>\r\n<p>Type Super AMOLED, 120Hz, HDR10+, 700 nits (HBM), 1100 nits (peak)</p><br>\r\n<p>Size 5.9 inches</p><br>\r\n<p>Resolution 1080 x 2400 pixels</p><br>\r\n<p>Android 11, upgradable to Android 12, ZenUI</p><br>\r\n<p>Memori Internal: 128GB 6GB RAM, 128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM, 256GB 16GB RAM</p><br>\r\n<p>Features LED flash, HDR, panorama</p><br>\r\n<p>Bluetooth 5.2, A2DP, LE, aptX HD, aptX Adaptive</p><br>\r\n<p>USB Type-C 2.0, USB On-The-Go</p><br>\r\n<p>Baterai 4000 mAh, non-removable</p><br>\r\n<p>Fast charging 30W,</p><br>', 32, 'https://cdn.eraspace.com/pub/media/catalog/product/z/e/zenfone_8_zs590ks_horizon_silver_1.jpg', 0, '2022-05-25'),
(26, 'Xiomi Mi Mix 4 [8/12GB 128GB/256GB]', 13250000, 225, 'Rilis pada 4 Agustus 21\r\nXiaomi Mi Mix 4 adalah smartphone keluaran Xiaomi yang termasuk dalam deretan ponsel Flagship Killer. Smartphone ini dibekali dapur pacu chipset Snapdragon 888+ 5G serta GPU Andreno 660 dengan sistem operasi Android 11 dan MIUI 12,5. Tak hanya itu, Xiaomi Mi Mix 4 juga menjadi smartphone pertama dari Xiaomi yang memiliki kamera depan tersembunyi. Dari segi tampilan, layar Mi Mix 4 telah dilengkapi layar Super Amoled dan Corning Gorilla Glass Victus', 'Jaringan: GSM/HSPA/LTE/5G\r\nDimensi: 162.6 x 75.4 x 8 mm\r\nResolusi: 1080 x 2400 pixels\r\nLayar: Super Amoled 6,67 inci,\r\nMemori internal: 128GB/256GB/512GB, tidak ada kartu SD eksternal\r\nSistem Operasi: Android 11, MIUI 12.5\r\nBaterai: Li-Po 4.500 mAh\r\nKonektivitas: Bluetooth 5.2, Wi-Fi 802.11 a/b/g/n/ac/6e\r\nKamera Depan: Under-display 20 MP,27mm (wide), 1/3.4\"\r\nSensor: Fingerprint (under display, optical)', 22, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyrJsS-o62YG6nPHGU23eWtyS9oCyl_oTHf_Yd7c4zxtCbF34EjHAP1MWe72lWS5oCZ2M&usqp=CAU', 3, '2022-04-09'),
(27, 'Sony Xperia XZ3 [4/6GB /64GB]', 5500000, 183, 'Rilis pada 10 Oktober 2020\r\nSony Xperia XZ3 merupakan handphone HP dengan kapasitas 3330mAh dan layar 5.7\" yang dilengkapi dengan kamera belakang 19 + 12MP dengan tingkat densitas piksel sebesar 424ppi dan tampilan resolusi sebesar 1080 x 216pixels. Dengan berat sebesar 183g, handphone HP ini memiliki prosesor Octa Core. Smartphone Sony ini punya desain yang borderless, tipis, dan nyaman digenggam. Bodinya berbentuk kotak yang terbuat dari material kaca. Meski begitu, jangan khawatir akan ketangguhan ponsel karena ia sudah dilapisi Corning Gorilla Glass 5. Adanya Corning Gorilla Glass 5 membuat XZ3 lebih aman dari benturan dan goresan', 'Layar: P-OLED 6 inci\r\nResolusi layar: 1440 x 2880 piksel\r\nDimensi: 158 x 73 x 9.9 mm (6.22 x 2.87 x 0.39 in)\r\nCPU: Octa-core (4x2.7 GHz Kryo 385 Gold & 4x1.7 GHz Kryo 385 Silver)\r\nMemori internal: 64 GB\r\nMemori eksternal: microSDXC (uses shared SIM slot) - dual SIM model only\r\nKamera utama: 19 MP, f/2.0, 25mm (wide), 1/2.3\", 1.22µm, predictive PDAF, Laser AF\r\nKamera depan: 13 MP, f/1.9, 23mm (wide), 1/3.1\", 1.12µm\r\nKapasitas baterai: Li-Ion 3300 mAh non-removable, fast charging 18W\r\nUSB: USB Type-C 3.1; USB On-The-Go\r\nSIM: Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)\r\nBluetooth: 5.0, A2DP, aptX HD, LE\r\n', 20, 'https://cdn.idealo.com/folder/Product/6294/6/6294692/s3_produktbild_gross/sony-xperia-xz3.jpg', 0, '2022-01-07'),
(28, 'OPPO A76  [4GB/128GB]', 4300000, 189, 'Rilis pada 17 Februari 2022\r\nDengan Prosesor Octa-Core, Ekspansi RAM (6GB + RAM Tambahan hingga 5GB), dan ROM 128GB, nikmati aplikasi yang berjalan mulus seperti sutra, dan miliki banyak ruang untuk menyimpan semuanya.\r\nRAM & ROM Super. Grafik mulus yang mengagumkan, animasi kaya akan warna yang memikat dan lebih hidup. Desain tipis dan halus yang menarik perhatian. Mampu menghilangkan bekas jari dan debu dengan mudah, mempertahankan tampilannya yang berkilau dan elegan. Desain OPPO A76 yang tahan goresan dan percikan air untuk mempertahankan tampilan sempurnanya. OPPO A76 siap digunakan di segala kondisi.', 'Dimensi: 164.4 x 75.7 x 8.4 mm (6.47 x 2.98 x 0.33 in)\r\nSIM Dual SIM (Nano-SIM, dual stand-by)\r\nType IPS LCD, 90Hz, 480 nits (typ), 600 nits (HBM)\r\nSize	6.56 inches\r\nResolution 720 x 1612 pixels\r\nAndroid 11, ColorOS 11.1\r\nMemori Eksternal: microSDXC\r\nMemori Internal: 128GB 4GB RAM, 128GB 6GB RAM\r\nFeatures LED flash, HDR, panorama\r\nBluetooth 5.0, A2DP, LE, aptX HD\r\nUSB Type-C 2.0, USB On-The-Go\r\nBaterai 5000 mAh, non-removable\r\nFast charging 33W\r\nWi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', 30, 'https://cdn.eraspace.com/pub/media/catalog/product/o/p/oppo_a76_6-128gb_-_blue_9.jpg', 0, '2022-03-09'),
(29, 'Vivo Y12s [3GB/32GB]', 1660000, 191, 'Rilis pada 20 November 2020\r\nSebagai smartphone low-end, vivo tetap membekali vivo Y12s dengan desain dan warna yang menarik. Tampilan bodi plastiknya justru terkesan mewah berkat gradasi warna dengan finishing glossy seperti kaca pada bagian belakangnya. Pada bagian belakangnya, terdapat modul kamera di kiri atas yang diletakkan berjejer ke bawah, lengkap dengan LED flash. Sementara pada bagian depannya, desain layarnya terlihat lega berkat ukuran notch yang kecil. vivo Y12s hadir dengan layar Ultra All Screen berukuran 6,51 inci dan rasio 20:9. Ukurannya cukup lega, apalagi bezel di sekeliling layarnya tergolong tipis. Dengan ukuran layar seperti ini, tampilan visual saat menonton film atau bermain game terasa lebih nikmat dengan layar yang lebar. vivo Y12s mengandalkan kamera ganda pada bagian belakang bodinya. Ada kamera dengan resolusi 13 MP (wide) aperture f/2.2, serta lensa depth 2 MP dengan aperture f/2.4. Sementara pada bagian depan, terdapat kamera selfie 8 MP dengan aperture f/1.8.', 'Ukuran layar: IPS LCD, 6,51 inci, 720 x 1600 pixels\r\nCPU: Octa-core (4x2.35 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53)\r\nOS: Android 10, Funtouch 11\r\nUkuran HP: 164.4 x 76.3 x 8.4 mm (6.47 x 3.00 x 0.33 in)\r\nRAM: 3 GB\r\nMemori internal: 32 GB\r\nKamera depan: 8 MP, f/1.8\r\nKamera belakang: 13 MP, f/2.2, (wide), PDAF; 2 MP, f/2.4, (depth)\r\nBaterai: Li-Po 5000 mAh, non-removable, Reverse charging 5W\r\nBluetooth: 5.0, A2DP, LE\r\nUSB: microUSB 2.0, USB On-The-Go\r\nSIM: Dual SIM (Nano-SIM, dual stand-by)\r\nSensor: sidik jari (side-mounted), akselerometer, proximity, kompas', 25, 'https://www.begawei.com/wp-content/uploads/2020/11/Vivo-Y12s.png', 0, '2022-03-30'),
(30, 'ASUS ZenFone Go [1GB/8GB]', 1365000, 125, 'Rilis pada 7 Agustus 2020\r\nASUS ZenFone Go merupakan sebuah smartphone yang dibekali layar berukuran 5 inci untuk memudahkanmu dalam melakukan komunikasi sehari-hari. Layar 5 inci tersebut telah didukung oleh resolusi HD 720 x 1280 piksel dengan kepadatan sebesar 294 ppi. Ukuran layar dan kepadatan tersebut sama besarnya dengan ASUS ZenFone 5. Namun HP ASUS Zenfone Go ini akan dipatok dengan harga yang tidak terlalu tinggi alias murah, Satu lagi keunggulan dari HP ASUS ZenFone Go ini adalah jaringannya yang telah dilengkapi oleh jaringan 4G LTE. Tentu saja di beberapa tempat yang sudah memiliki jaringan internet 4G kamu dapat berselancar di dunia maya dengan kecepatan yang sangat tinggi. Berbicara mengenai kamera, HP ASUS ZenFone Go dibekali dengan kamera sebesar 8 Mp sebagai kamera utamanya. Kamera utama yang terletak pada bagian belakang ini dapat mengambil gambar dengan baik dan resolusi maksimal hingga 3264 x 3448 pixels. Kamera ASUS ZenFone Go juga dapat memotret secara baik walaupun dalam keadaan gelap.', 'Ukuran Layar	4.5\"\r\nKedalaman Piksel 218ppi\r\nResolusi Layar 480 x 854pixels\r\nResolusi Kamera Belakang 5MP\r\nResolusi Kamera Depan 0.3MP\r\nDimensi (W x H x D)	136.5 x 66.7 x 11.2mm\r\nKapasitas Baterai 2070mAh\r\nUSB Connectors Micro-USB\r\nWi-Fi Standard 802.11 b/g/n\r\n', 15, 'https://images.tokopedia.net/img/cache/900/product-1/2017/5/23/11920298/11920298_82c40a97-7d3e-4902-9da2-7856ea0b85c1_1000_1000.jpg', 0, '2022-03-07'),
(31, 'Xiomi Mi 9 [8GB/128GB]', 3250000, 173, 'Desain bodi HP ini menggunakan material aluminium untuk bagian frame-nya, serta paduan kaca untuk bagian body belakang. Jadi, tak heran jika harga Xiaomi Mi 9 cukup tinggi saat dirilis karena HP ini tergolong premium. Material bodinya memberi kesan mewah dan modern. Xiaomi Mi 9 telah dibekali panel Super AMOLED ukuran layar 6,39 inci dengan kualitas 1080p yang jernih dan tetap nyaman digunakan meski di bawah terik matahari. Panel beresolusi 1080 x 2340 pixels ini punya densitas 402ppi. Layarnya memanjang ke atas dengan rasio 19.5:9. Xiaomi Mi 9 merupakan HP pertama Xiaomi yang menggunakan konfigurasi tiga kamera. Kamera utamanya punya lensa 48MP dengan bukaan f/1.75. Ada juga lensa telefoto 12MP yang punya kemampuan 2x optical zoom, serta kamera ultra-wide 16MP. ', 'Ukuran Layar	6.4\"\r\nResolusi Layar 1080 x 2280pixels\r\nTeknologi Layar Super AMOLED\r\nTipe Kamera Triple Kamera\r\nDimensi (W x H x D)	157.5 x 74.7 x 7.6mm\r\nSistem Operasi Android\r\nUSB Connectors Type-C\r\nSIM Card Nano-SIM\r\nChipset Qualcomm SM8150 Snapdragon 855 (7 nm)\r\nKapasitas Baterai 3300mAh\r\nCharging Wireless Charging and Fast Charging\r\nResolusi Video 4K\r\nResolusi Kamera Belakang 48 + 12MP', 20, 'https://www.begawei.com/wp-content/uploads/2019/01/Xiaomi-Mi-9-f.jpg', 0, '2022-02-16'),
(32, 'Sony Xperia ZR [8GB/64GB]', 4999000, 138, 'Dari segi desainnya yang mengandalkan bentuk persegi panjang khas dari Sony. Di bagian depan sudah terdapat sebuah layar TFT berukuran 4,55 inci yang dapat menampilkan gambar dengan kualitas HD atau 720p. Di bagian dalam, Sony Xperia ZR sudah dibekali dengan sebuah prosesor Qualcomm Snapdragon S4 Pro. Untuk CPU, Sony mengandalkan sebuah CPU Quad-core 1.5GHz. Dilengkapi juga dengan RAM berkapasitas 2Gb yang akan membantu prosesor dan CPU tersebut bekerja dengan maksimal. Dengan begitu, tidak ada lagi hambatan seperti lagging atau hang ketika Anda menggunakan Sony Xperia ZR. Dari segi konektivitas, Anda akan mendapatkan jaringan sinyal dengan kekuatan 4G LTE yang memiliki kecepatan 50Mbps. Jaringan sinyal tersebut bisa Anda gunakan untuk menghubungkan Sony Xperia ZR dengan internet. Selain itu, terdapat juga fitur WiFi yang sudah dipasangkan padanya untuk Anda gunakan ketika Anda sedang berada di dalam ruangan.', 'Ukuran Layar	4.6\"\r\nKedalaman Piksel 323ppi\r\nResolusi Layar 720 x 1280pixels\r\nResolusi Kamera Belakang	13.1MP\r\nResolusi Kamera Depan	0.3MP\r\nDimensi (W x H x D)	131.3 x 67.3 x 10.5mm\r\nKapasitas Baterai 2300mAh\r\nSistem Operasi Android\r\nSIM Card Micro-SIM\r\nUSB Connectors Micro-USB\r\nWi-Fi Standard 802.11 a/b/g/n', 20, 'https://fdn2.gsmarena.com/vv/pics/sony/sony-xperia-zr-1.jpg', 0, '2022-05-14'),
(33, 'Vivo Y33s [8GB/128GB]', 5050000, 182, 'HP ini memiliki desain elegan dengan bentuk yang ramping. Bahkan, kapasitas baterai yang besar pun tidak membuat bodi Y33s jadi bongsor. Smartphone vivo ini dibekali flat frame 2,5D dengan bodi tipis 0,8 mm. Bobotnya pun hanya 182 gram, tidak terlalu berat untuk ukuran HP dengan kapasitas baterai yang jumbo. Dengan ukuran tersebut, vivo Y33s pun sangat nyaman digenggam. Sensor sidik jari di bagian sampingnya juga mudah dijangkau sehingga kamu dapat membuka ponsel dengan cepat dan efisien. Tak hanya itu, bodi HP juga dilengkapi dengan teksur AG matte dan teknologi Dynamic Color yang telah melalui pemrosesan liquid crystal. Alhasil, tercipta permukaan HP yang tidak mudah meninggalkan bekas sidik jari. Y33s dilengkapi dengan layar berukuran 6,58 inci yang cukup besar. Dengan rasio layar ke bodi yang mencapai 90,6%, layar ini pun bisa dibilang sangat lega. Dengan begitu, kamu jadi lebih nyaman saat menatap layarnya.', 'Ukuran Layar	6.58\"\r\nKedalaman Piksel 401ppi\r\nResolusi Layar 1080 x 2408pixels\r\nResolusi Kamera Belakang 50 + 2 + 2MP\r\nResolusi Kamera Depan 16MP\r\nTipe Kamera Triple Kamera\r\nResolusi Video 4K\r\nDimensi (W x H x D)	164.3 x 76.1 x 8mm\r\nKapasitas Baterai 5000mAh\r\nCharging Reverse Charging\r\nSistem Operasi Android\r\nUSB Connectors Type-C', 25, 'https://media.hitekno.com/thumbs/2021/10/20/66871-vivo-y33s/730x480-img-66871-vivo-y33s.jpg', 0, '2022-03-12'),
(34, 'Oppo A31 [4GB/128GB]', 6800000, 180, 'Berbekal ukuran layar 6,5 inci dengan resolusi layar HD+, HP ini memang tergolong nyaman untuk dipakai gaming atau nonton video. Dengan spesifikasi OPPO A31 yang dibekali screen rasio 20:9 dan 270 ppi density, layar IPS LCD pada ponsel ini akan terasa full screen tanpa batas. Dengan waterdrop design di bagian depan yang lebih kecil dari HP OPPO lainnya, tentunya ini jadi salah satu faktor plus OPPO A31, sehingga ukuran layar HP ini terlihat lebih luas. Apalagi dengan desain bodi yang lebih slim sehingga lebih nyaman saat digenggam, juga perlindungan Gorilla Glass 3 agar lebih aman dari benturan. Smartphone OPPO satu ini sudah dibekali dengan sistem operasi Android 9.0 Pie yang dipadukan dengan tampilan antarmuka ColorOS 6.1. Selain tampilan yang lebih fresh, ColorOS 6.1 ini datang dengan security update. OPPO A31 ini dibekali dengan triple camera yang tentunya jadi nilai plus, meskipun lensa kamera utama hanya beresolusi 12 MP, f/1.8 wide. Namun, fitur AI seperti Dazzle Color yang bisa mengeluarkan warna pada hasil foto untuk membuatnya lebih berwarna.', 'Ukuran Layar	6.5\"\r\nKedalaman Piksel 270ppi\r\nResolusi Layar 720 x 1560pixels\r\nResolusi Kamera Belakang 12 + 2 + 2MP\r\nResolusi Kamera Depan 8MP\r\nTipe Kamera Triple Kamera\r\nResolusi Video Full HD\r\nKapasitas Baterai 4230mAh\r\nSistem Operasi Android\r\nUSB Connectors Micro-USB\r\nChipset: Mediatek MT6765V/CB Helio P35 (12nm)\r\nCPU: Octa-core (4x2.3 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53)', 20, 'https://cdn.eraspace.com/pub/media/catalog/product/o/p/oppo-a31-fantasy-white-1_2.jpg', 0, '2022-04-30'),
(35, 'Asuz ZenFone 3 Ultra [4GB/64GB]', 8500000, 233, 'ASUS ZenFone 3 Ultra ZU680KL juga memiliki baterai yang gahar, 4600 mAh untuk mendukung performa sehingga mulus dan tidak lag. Menge-charge baterai HP ini juga sangat cepat karena kehadiran Qualcomm Quick Charge 3.0, plus kamu bisa menge-charge baterai HP lain menggunakan baterai ZenFone 3 ini!. Kamera utama ZenFone 3 hampir menyaingi kamera HP-HP baru lainnya, dengan resolusi 23 Mp dan aperture f/2.0. Ditambah dengan PDAF, laser AF, 4-axis OIS, dual-LED dual-tone flash, geo-tagging, touch focus, face detection, panorama dan HDR. Sementara itu, kamera depannya beresolusi 8 Mp dengan aperture f/2.0. ZenFone 3 ini memiliki dapur pacu yang terdiri atas Android 6.0.1 Marshmallow, Qualcomm Snapdragon 652, CPU Octa-core dan grafis Adreno 510. Dengan bodi yang besar, ZenFone 3 ini mengusung RAM 4 Gb dan memori internal sebesar 64 Gb yang bisa kamu perbesar dengan kartu microSD. Yang lebih ciamik, ASUS menyediakan ruang Google Drive sebesar 100 Gb secara gratis untuk dua tahun pertama!', 'Ukuran Layar	6.8\"\r\nKedalaman Piksel 324ppi\r\nResolusi Layar 1080 x 1920pixels\r\nResolusi Kamera Belakang 23MP\r\nResolusi Kamera Depan 8MP\r\nTipe Kamera Single Kamera\r\nDimensi (W x H x D) 186.4 x 93.9 x 6.8mm\r\nKapasitas Baterai 4600mAh\r\nCharging Fast Charging\r\nChipset Qualcomm MSM8976 Snapdragon 652 (28 nm)\r\nSistem Operasi Android\r\nUSB Connectors Type-C', 20, 'https://www.begawei.com/wp-content/uploads/2016/05/asus-zenfone-3-ultra-zu680kl-f.jpg', 0, '2022-01-22'),
(36, 'Samsung Galaxy S20 FE [8/128GB]', 6999000, 190, 'Samsung Galaxy S20 FE merupakan smartphone Samsung yang dirilis pada September 2020. Nama FE pada belakang seri ponsel merupakan kependekan dari Fan Edition. Samsung menyatakan bahwa ponsel ini dibuat untuk memenuhi kebutuhan fans dalam setiap aktivitas. Baik fans fotografi, gaming, maupun aktivitas digital lainnya. Tidak heran jika HP ini dilengkapi dengan spesifikasi yang mendukung minat kamu serta versi yang lebih update dari seri S20 sebelumnya. HP ini dilengkapi dengan Exynos 990 dan Qualcomm SM8250 Snapdragon 865 yang membuat performanya berjalan dengan baik. Tidak hanya untuk memenuhi kebutuhan sehari-hari seperti chatting atau browsing internet, S20 FE juga mampu menjalankan game berat tanpa lagging. Ponsel ini juga didukung dengan RAM 6GB/8GB serta memori internal 128GB/256GB yang membuat kinerjanya semakin lancar. Tidak hanya itu, S20 FE juga dibekali dengan kamera yang cukup mumpuni, display Super AMOLED, serta refresh rate 120 Hz yang membuat pengalaman menggunakan HP ini jadi lebih menyenangkan. Dengan ukuran 159.8×74.5×8.4 mm dan bobot 190 gram, HP ini terasa klop dan mudah digenggam. Pada sisi kanan ponsel terdapat tombol power dan volume. Sementara, slot kartu SIM, micro SD dan mikrofon sekunder terdapat pada bagian atas.\r\n\r\n', 'Sistem Operasi: Android 10, One UI 2.5\r\nLayar: Super AMOLED 6,5 inci, 1080 x 2400 piksel, 20:9 ratio\r\n\r\nRAM: 6GB/8GB\r\nInternal Memori: 128GB/256GB\r\nDimensi: 159.8 x 74.5 x 8.4 mm\r\nKamera Utama: 12 MP, f/1.8, 26mm (wide), 8 MP, f/2.4, 76mm (telephoto), 12 MP, f/2.2, 13mm, 123˚ (ultra wide)\r\nKamera Selfie: 32 MP, f/2.2, 26mm (wide)\r\nBaterai: Li-Ion 4.500 mAh non-removable, Fast Wireless Charging\r\nKonektivitas: USB Type-C, Wi-Fi 802.11, Bluetooth 5.0\r\nJaringan: Dual SIM (Nano-SIM, dual stand-by)\r\nWLAN: Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, Wi-Fi Direct, hotspot\r\nBluetooth: 5.0, A2DP, LE\r\nUSB: USB Type-C 3.2, USB On-The-Go', 30, 'https://cdn.eraspace.com/pub/media/catalog/product/s/a/samsung_galaxy_s20_fe_cloud_mint_1.jpg', 0, '2022-06-01'),
(37, 'Samsung Galaxy M20 [3GB/32GB]', 1500000, 186, 'Galaxy M20 dibekali layar lega berukuran 6,3 inci dengan desain notch yang disebut Infinity V Display. Walaupun sudah umum ditemukan di ponsel lain, namun ini adalah kali pertama Samsung mengaplikasikan desain ini di Galaxy M-series. Layar notch ini memang membuat bagian layar depan terlihat lebih lega sehingga kamu lebih nyaman saat menonton video, bermain game, atau sekadar browsing internet. Kualitas layar Samsung M20 sendiri sudah Full HD+, cukup tajam di kelasnya. Tidak hanya cukup jernih untuk berbagai aktivitas, layar HP Samsung ini juga sudah dilindungi dengan Asahi Dragontrail. Keberadaan pelindung ini membuat kaca jadi tidak mudah tergores sehingga lebih tahan lama.  Samsung M20 dengan kapasitas baterai 5000 mAh, cukup besar untuk harganya yang terjangkau. Kamu tidak perlu repot lagi untuk membawa powerbank saat bepergian atau hangout. Untuk performa Samsung M20 dibekali dengan chipset Exynos 7904 dengan prosesor delapan inti (4x2.3 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53) dan GPU Mali-G71 MP2.', 'Ukuran layar: PLS IPS 6,3 inci, 1080 x 2340 pixels, rasio 19:5:9 (~409 ppi density)\r\nCPU: Octa-core (4x2.3 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53)\r\nOS: Android 8.1 (Oreo), bisa di-upgrade ke Android 10, One UI 2\r\nRAM: 3 GB\r\nMemori internal: 32GB\r\nUkuran HP: 156.4 x 74.5 x 8.8 mm\r\nKamera Belakang: 13 MP, f/1.9, 1/3.1\", 1.12µm, PDAF dan 5 MP, f/2.2, 12mm (ultrawide)\r\nKamera Depan: 8 MP, f/2.0, 25mm (wide)\r\nWLAN: Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBaterai: 5.000 mAh, fast charging 15W\r\nChipset: Mediatek Exynos 7904 (14 nm)\r\nVideo: 1080p@30fps', 25, 'https://fdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-m20-m205f-1.jpg', 0, '2022-03-08'),
(38, 'Asuz ZenFone 3 Max [2GB/ 16GB/32GB]', 2450000, 148, 'Smartphone ASUS ZenFone 3 Max untuk segi layar memang tidak mengecewakan. HP ini hadir dengan ukuran 5.2 inch ini sudah dilengkapi dengan IPS LCD capacitive touchscreen yang dapat menghadirkan warna hingga 16 juta. Layar sentuh pada ZenFone 3 Max pun hadir dengan resolusi hingga 720 x 1280 piksel dan kerapatan hingga ~282 ppi. Untuk proteksi touch screen, Smartphone ini dilengkapi oleh Corning Gorilla Glass 3 sehingga Anda tidak perlu takut layar sentuh HP ini akan tergores. HP ASUS ini hadir dengan Chipset Mediatek MT6737M dan CPU Quad Core Cortex A53 yang dapat memproses data hingga kecepatan 1.25 GHz. ASUS Zenfone 3 Max juga mengandalkan GPU berupa Mali-T720MP2 yang akan memberikan tampilan yang akurat dan tajam pada touch screennya. Smartphone ASUS ini memiliki RAM berkapasitas 2GB untuk memastikan performa dapur pacu yang optimal. Meskipin RAM 2GB ini tergolong kecil, namun spesifikasi ini cukup sesuai dengan harga yang ditawarkan.', 'Ukuran Layar: IPS LCD 5,2 inch\r\nUkuran Layar: IPS LCD 5,2 inch\r\nCPU: Quad-core 1.25 GHz Cortex-A53\r\nOS: Android 6.0.1 (Marshmallow), upgradable to 7.0 (Nougat), ZenUI 3\r\nRAM: 2GB\r\nROM/Memori internal: 16GB/32GB\r\nUkuran HP: 149.5 x 73.7 x 8.6 mm\r\nKamera depan: 5 MP, f/2.0\r\nKamera belakang: 13 MP, f/2.2, AF\r\nBaterai: Li-Po 4100mAh, non-removable\r\nSIM: Hybrid Dual SIM (Micro-SIM/Nano-SIM, dual stand-by)\r\nWLAN: Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth: 4.0, A2DP, EDR\r\nUSB: microUSB 2.0, USB On-The-Go\r\nSensors: Fingerprint (rear-mounted), accelerometer, proximity, compass', 25, 'https://www.begawei.com/wp-content/uploads/2018/11/asus-zenfone-3-max-f-1.jpg', 0, '2022-06-02'),
(39, 'Vivo X60 5 G [8GB/128GB]', 5299000, 175, 'Dari segi desain, vivo X60 5G memiliki desain yang tidak jauh berbeda dengan seri pendahulunya yaitu vivo X50. Sama-sama memiliki tampilan yang menawan dengan bobot yang ringan. Bagian belakangnya terdapat konfigurasi 3 kamera serta terdapat tulisan \"Professional Photography\". Hal tersebut menguatkan bahwa memang kamera vivo X60 adalah salah satu yang menjadi sorotan pada ponsel ini. Bagian belakangnya juga memiliki sentuhan Satin Finish, membuat ponsel ini anti-silau dan minim bercak tangan. Untuk bagian depannya, vivo meyematkan single camera yang didesain berbentuk punch hole di bagian tengah atas ponsel. Layarnya juga sudah bezel-less seperti smartphone beberapa tahun ke belakang. Selain itu, ponsel ini juga sudah dilapisi dengan Corning Gorilla Glass 6 untuk perlindungan terhadap benturan atau goresan. vivo X60 5G dibekali dengan bentang layar yang lebar serta panel layar AMOLED yang sudah terproteksi dengan Corning Gorilla Glass 6. Resolusinya sudah Full HD+ (1080 x 2376 piksel) dengan refresh rate atau laju penyegaran 120 Hz. Tak heran jika vivo X60 5G memiliki tampilan layar yang sangat baik ketika merespons sentuhan dan menampilkan gambar. HP vivo X60 5G ini dibekali dengan triple camera dengan resolusi kamera yang besar yaitu 48 MP, f/1.8, 26mm, wide, 13 MP, f/2.5, 50mm, telephoto, 13 MP, f/2.2, 16mm, ultrawide. Lensanya menggunakan lensa dari Zeiss dengan teknologi pergeseran sensor Pixel Shift.\r\n\r\n', 'Ukuran layar: AMOLED, 6,56 inci, refresh rate 120 Hz, HDR10+, 1080 x 2376 pixels (~398 ppi density), Corning Gorilla Glass 6\r\nCPU: Octa-core (1x3.2 GHz Kryo 585 & 3x2.42 GHz Kryo 585 & 4x1.80 GHz Kryo 585\r\nSistem Operasi: Android 11, Funtouch OS 11.1\r\nRAM: 8GB RAM\r\nMemori internal: 128 GB ROM\r\nUkuran HP: 159.6 x 75 x 7.4 mm\r\nKapasitas Baterai: Li-Po 4300 mAh, non-removable, fast charging 33W\r\nKonektivitas: Bluetooth 5.1; Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot; A-GPS, GLONASS, BDS, GALILEO; NFC; USB Type-C 2.0, On-the-go\r\nAudio: loudspeaker\r\nSIM Card: Dual SIM (Nano-SIM, dual stand-by)\r\nSensor: pemindai sidik jari, accelerometer, gyro, compass, color spectrum Virtual proximity sensing\r\nKamera depan: 32 MP, f/2.5, 26mm (wide); HDR', 25, 'https://www.begawei.com/wp-content/uploads/2021/01/vivo-x60-5g.png', 0, '2022-06-04');
INSERT INTO `produk` (`id`, `nama`, `harga`, `berat`, `deskripsi`, `spesifikasi`, `stock`, `gambar_utama`, `hasil_penjualan`, `tanggal_barang_masuk`) VALUES
(40, 'Vivo Y83 [4GB/32GB]', 1850000, 150, 'HP vivo ini hadir dengan layar IPS LCD berukuran 6,22 inci dan rasio 19:9. vivo mengusung desain Full View Display untuk membuat layarnya terlihat lega. Terlebih sudah disematkan pula notch minim bezel berbentuk poni untuk memperluas bidang pandang. Sayangnya, resolusi yang ditampilkan kurang memuaskan. vivo Y83 masih menggunakan resolusi HD+ atau 720 x 1520 piksel. Padahal beberapa ponsel di kelasnya sudah dilengkapi layar Full HD+ sebesar 1080 x 2160 piksel. vivo membenamkan kamera 8 MP dengan bukaan f/2.2 untuk seri Y83 ini. Selain itu, kamera selfie-nya juga sudah dilengkapi dengan teknologi AI. Ini membuat hasil selfie vivo Y83 patut diacungi jempol karena gambarnya yang natural dan tidak terlihat berlebihan. Kamera utama vivo Y83 mengusung sistem single camera dengan lensa 13 MP. Meski banyak HP sekelasnya yang sudah mengusung dual kamera, tapi spesifikasi yang ditawarkan Y83 ini sudah cukup baik. vivo Y83 dilengkapi RAM sebesar 4 GB. RAM tersebut kemudian disandingkan bersama memori internal 32 GB atau 64 GB. Kalau kamu merasa penyimpanan yang ditawarkan masih kurang, kamu bisa menambahkan storage-nya lagi hingga 256 GB dengan memori eksternal. HP vivo Y83 dibekali kapasitas baterai 3260 mAh. Meski angka yang ditawarkan tidak terlalu besar, tapi manajemen dayanya sudah dibuat efisien. Baterai ponsel ini lumayan awet untuk dipakai seharian dalam penggunaan ringan.', 'Ukuran HP: 155.2 x 75.2 x 7.7 mm\r\nUkuran layar: IPS LCD 6.22 inci (rasio screen to body ~82.7%)\r\nResolusi layar: 720 x 1520 piksel, rasio 19:9 (~270 ppi density)\r\nChipset: Mediatek MT6762 Helio P22 (12 nm)\r\nCPU: Octa-core 2.0 GHz Cortex-A53\r\nOS: Android 8.1 (Oreo), Funtouch 4\r\nRAM: 4 GB\r\nMemori internal: 32 GB/64 GB\r\nKamera depan: 8 MP, f/2.2; video 1080p@30fps\r\nKamera belakang: 13 MP, f/2.2, PDAF; LED flash, HDR, panorama; 1080p@30fps\r\nBaterai: Li-Ion 3260 mAh, non-removable\r\nSIM: Dual SIM (Nano-SIM, dual stand-by)\r\nWLAN: Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth: 4.2, A2DP, LE\r\nUSB: microUSB 2.0, USB On-The-Go', 25, 'https://www.begawei.com/wp-content/uploads/2018/04/vivo-Y83-f.jpg', 0, '2022-06-06'),
(41, 'Vivo Y51  [8GB/128GB]', 2350000, 188, 'Tampilan layar tentunya jadi salah satu prioritas utama dalam membeli sebuah gadget. Tidak perlu khawatir, karena layar vivo Y51 2020 juga termasuk lega. HP vivo ini dibekali Ultra All Screen 6,58 inci dengan rasio screen-to-body mencapai 84,5%. Bidang pandangnya juga terasa semakin maksimal karena vivo memakai desain waterdrop notch yang cukup kecil di ponsel ini. Sayangnya, smartphone ini masih memakai panel LCD IPS pada layar. Pemilihan material ini tentu membuat kualitas layarnya masih kalah dengan ponsel yang sudah memakai layar AMOLED. Meskipun begitu, untuk kelas harganya, kualitas layar smartphone ini masih termasuk baik. Layarnya sudah mengusung resolusi Full HD+ 1080 x 2408 piksel yang menampilkan warna yang kaya dan jernih. Tidak hanya itu, HP vivo ini juga dibekali dengan teknologi yang bisa menyaring blue light atau cahaya biru yang berbahaya bagi mata. Dengan perpaduan tersebut, layar ponsel ini jadi semakin nyaman dipakai untuk menonton video dan film favorit kamu. Saat ini memang semakin banyak smartphone yang dibekali dengan baterai ekstra jumbo, tidak terkecuali vivo Y51 2020 ini. vivo membekalinya dengan kapasitas 5000 mAh yang dilengkapi dengan teknologi AI untuk menghemat daya. Dengan sekali mengisi daya, kamu bisa menonton video online atau bermain game berlama-lama tanpa khawatir baterai cepat habis.', 'Ukuran layar: LCD IPS 6.58 inci, 1080 x 2408 piksel (~401 ppi density)\r\nChipset: Qualcomm SDM665 Snapdragon 665 (11 nm)\r\nCPU: Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver)\r\nSistem operasi: Android 11, Funtouch 11\r\nRAM: 8GB\r\nMemori internal: 128GB\r\nUkuran HP: 163.9 x 75.3 x 8.4 mm\r\nKamera depan: 16MP, f/2.0\r\nKamera utama: Triple camera, 48 MP, f/1.8, (wide), 8 MP, f/2.2, 120˚, (ultrawide), dan 2 MP, f/2.4, (macro)\r\nBaterai: Li-Po 5.000 mAh, Fast Charging 18W\r\nWLAN: Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot\r\nBluetooth: 5.0, A2DP, LE\r\nUSB: USB Type-C 2.0, USB On-The-Go\r\nSIM: Dual SIM (Nano-SIM, dual stand-by)\r\nSensor: Fingerprint (side-mounted), accelerometer, gyro, proximity, compass', 25, 'https://www.begawei.com/wp-content/uploads/2021/01/Vivo-Y51A.png', 0, '2022-05-26'),
(42, 'Vivo V17 [8GB 128/256GB]', 4580000, 176, 'HP vivo V17 dihadirkan dengan baterai Li-Po yang tidak dapat dilepas pasang dan punya kapasitas sebesar 4500 mAh. Kapasitas tersebut terhitung besar untuk aktivitas ponsel pintar sehari-hari. Apalagi baterai ini sudah memiliki fitur fast charging Dual Engine 18W dengan USB Type-C sehingga kamu tak perlu lama menunggu daya HP kamu terisi penuh, hanya butuh waktu sekitar 80 menit saja untuk mengisi baterai dari kosong hingga 100%. Kamera belakang pada HP vivo V17 ini sudah disematkan Quad Camera yang lensa utamanya punya resolusi 48 MP, 8 MP untuk lensa ultrawide, dan 2 MP lensa makro, dan yang terakhir ada lensa kedalaman dengan konfigurasi 2 MP. Sementara untuk kamera depan atau selfie dibekali dengan konfigurasi 32 MP. vivo V17 dibekali dengan chipset Qualcomm SDM675 Snapdragon 675 (11 nm) yang didampingi dengan GPU Adreno 612, RAM sebesar 8 GB, dan memori internal 128 GB. Jeroannya bukan yang terunggul saat waktu perilisannya, walaupun begitu, chipset ini sudah cukup tangguh dan cepat untuk kegiatan multitasking bahkan untuk bermain game berat seperti PUBG dan Asphalt. Kamu tidak akan mengalami lagging dan kualitas tampilan layarnya pun bagus berkat jeroannya yang diberikan vivo untuk HP ini.', 'Layar: 6.44 inci, Super AMOLED\r\nResolusi layar: 1080 x 2400 piksel\r\nChipset: Qualcomm SDM675 Snapdragon 675 (11 nm)\r\nSistem Operasi: Android 9.0 (Pie), Funtouch 9.2\r\nCPU: Octa-core (2x2.0 GHz Kryo 460 Gold & 6x1.7 GHz Kryo 460 Silver)\r\nRAM: 8 GB\r\nMemori internal: 128/256 GB\r\nMemori Eksternal: microSDXC (dedicated slot)\r\nKamera Depan: 32 MP, f/2.5, 23mm (wide), 1/2.8\", 0.8µm\r\nKapasitas Baterai: Li-Po 4500 mAh, non-removable, fast charging 18W\r\nUSB: USB Type-C 2.0, USB On-The-Go\r\nWLAN: Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot\r\n', 25, 'https://www.begawei.com/wp-content/uploads/2019/09/vivo-v17-pro-F.png', 0, '2022-05-11'),
(43, 'Sony Xperia XZs [4GB 32/64GB]', 6750000, 161, 'Sony Xperia XZs ini dilengkapi dengan chipset Qualcomm MSM8996 Snapdragon 820 (14 nm) dengan CPU Quad-core (2x2.15 GHz Kryo & 2x1.6 GHz Kryo). Selain itu, HP Sony ini juga didukung dengan RAM 4GB yang mampu membantu kinerja lebih lancar. Aktivitas harian seperti browsing internet, bekerja, memotret, nonton video, bahkan main game tidak mengalami hambatan sama sekali. Keunggulan utama dari spesifikasi Sony XZs ini adalah kameranya. Kamera utama Sony XZs ini memiliki resolusi 19MP, lengkap dengan teknologi Motion Eye Camera dan Predictive Capture. Motion Eye Camera ini mampu mendeteksi objek dengan gerakan lambat yang tak dapat terlihat mata. Sony mengklaim teknologi ini mampu merekam pada 960 frame per detik. Sony XZs dibekali dengan sertifikasi IP68. Artinya HP ini tahan air dan debu sehingga pengguna tak perlu khawatir untuk menggunakannya dalam berbagai situasi. Tetesan hujan atau cipratan tak akan jadi masalah. Sony sendiri mengklaim Sony Xperia XZs ini dapat bertahan di kedalaman 1,5 meter selama kurang lebih 30 menit. Untuk ponsel sekelas Sony Xperia XZs, sangat disayangkan hanya dibekali dengan baterai berkapasitas 2900 mAh. Kapasitas kecil ini dianggap tidak dapat mengimbangi berbagai fitur canggih pada kamera Sony Xperia. Hasilnya, setiap digunakan untuk aktivitas yang cukup berat, ponsel ini cepat panas dan baterainya cepat habis pula.', 'Ukuran Layar: IPS LCD 5.2 inch\r\nChipset: Qualcomm MSM8996 Snapdragon 820 (14 nm)\r\nCPU: Quad-core (2x2.15 GHz Kryo & 2x1.6 GHz Kryo)\r\nOS: Android 7.1 (Nougat), upgradable to Android 8.0 (Oreo)\r\nRAM: 4GB\r\nMemori internal: 32GB / 64GB\r\nUkuran HP: 146 x 72 x 8.1 mm\r\nKamera depan: 13 MP, f/2.0, 22mm (wide)\r\nKamera belakang: 19 MP, f/2.0, 25mm (wide)\r\nBaterai: 2900 mAh', 25, 'https://www.begawei.com/wp-content/uploads/2017/03/Harga-Sony-Xperia-XZs.jpg', 0, '2022-01-08'),
(44, 'Sony Xperia Z3 [3/32GB]', 2750000, 152, 'Dari segi konektivitas, Sony Xperia Z3 didukung oleh jaringan sinyal berkekuatan 4G LTE yang memiliki kecepatan 50 Mbps. Dengan begitu, Anda akan selalu terhubung dengan internet menggunakan sinyal tersebut dan juga jaringan data dari provider Anda. Selain itu, Anda juga bisa menghubungkan Sony Xperia Z3 ini dengan internet menggunakan fitur WiFi yang sudah ditanamkan di dalam HP Sony tersebut. Terdapat juga bingkai yang terbuat dari bahan aluminium yang akan menambah keindahan dari Sony Xperia Z3. Dilengkapi dengan layar sebesar 5,2 inci dan tampilan gambar dengan kualitas Full HD atau 1080p membuat Anda tidak dapat berpaling darinya. Dari segi kamera, Sony sudah menanamkan dua buah kamera pada Sony Xperia Z3. Untuk kamera primer atau kamera belakang, Anda mendapatkan kamera dengan resolusi sebesar 20,7 Mp. Sedangkan untuk kamera sekunder atau kamera depan, Anda diberikan kamera beresolusi 2,2 Mp. Tentu saja sudah ada beberapa fitur pendukung kamera tersebut seperti autofocus, LED Flash Light, face detection dan HDR. Anda juga bisa merekam video menggunakan kamera tersebut dengan kualitas 2K.', 'Ukuran Layar	5.2\"\r\nKedalaman Piksel 424ppi\r\nResolusi Layar 1080 x 1920pixels\r\nResolusi Kamera Belakang 20MP\r\nResolusi Kamera Depan 2.2MP\r\nTipe Kamera Single Kamera\r\nPenyimpanan 32GB\r\nRAM 3GB\r\nDimensi (W x H x D)	146 x 72 x 7.3mm\r\nKapasitas Baterai 3100mAh\r\nFast Charging\r\nSistem Operasi Android\r\nUSB Connectors Micro-USB\r\nWi-Fi Standard 802.11 a/b/g/n/ac\r\nChipset Qualcomm MSM8974AC Snapdragon 801 (28 nm)', 20, 'https://www.begawei.com/wp-content/uploads/2018/06/sony-xperia-xz3-f.jpg', 0, '2022-05-19'),
(45, 'Oppo Find X5 Pro [12GB/256GB]', 14999000, 218, 'Oppo Find X5 Pro 5G dibekali panel AMOLED berukuran 6,7 inci Quad HD Plus (3.216 x 1.440 piksel) dan kerapatan piksel525 ppi. Layar ponsel ini mampu menyajikan refresh rate hingga 120 Hz, touch sampling rate 240 Hz, tingkat kecerahan hingg 1.300 nith, berikut pelindung Corning Gorilla Glass Victus. Baterainya yang sudah berkapasitas 5.000 mAh didukung teknologi pengisian daya cepat khas Oppo, SuperVOOC Flash Charging 80 Watt dan AirVOOC 50 Watt Wireless Charging. Find X5 Pro dilengkapi dengan prosesor multicore Snapdragon 8 Gen 1 generasi terbaru yang mampu memproses game dan aplikasi yang membutuhkan spesifikasi tinggi. Dirancang dengan 4nm manufacturing process, smartphone ini memiliki GPU Qualcomm yang dirilis tahun 2022 yang mampu meningkatkan performa perangkat hingga 30% dan efisiensi daya hingga 25%. Disokong dengan baterai dual-cell 5000mAh yang besar, kapasitas daya Find X5 Pro lebih dari besar 11% dibandingkan dengan Find X3 Pro.', 'Dimensi 163.7 x 73.9 x 8.5 or 8.8 mm\r\nOS Android 12, ColorOS 12.1\r\nLi-Po 5000 mAh, non-removable\r\nFast charging 80W, 50% in 12 min (advertised)\r\nUSB Type-C 3.1, USB On-The-Go\r\nBluetooth 5.2, A2DP, LE, aptX HD\r\nLoudspeaker Yes, with stereo speakers\r\nFeatures Hasselblad Color Calibration, LED flash, HDR, panorama\r\nInternal 256GB 8GB RAM, 256GB 12GB RAM, 512GB 12GB RAM\r\nGPU Adreno 730 - Global\r\nCPU Octa-core (1x3.00 GHz Cortex-X2 & 3x2.50 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510) - Global\r\nChipset Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm) - Global\r\nSIM Dual SIM (Nano-SIM, eSIM, dual stand-by)', 20, 'https://cdn.eraspace.com/pub/media/catalog/product/o/p/oppo_find_x5_pro_12-256gb_-_glaze_black_2.jpg', 0, '2022-03-22'),
(46, 'Oppo F11 Pro [6GB/64GB]', 3099000, 190, 'HP OPPO F11 Pro mengadopsi tren HP tanpa poni dengan desain panoramic screen dan jenis kamera depan pop-up untuk hasilkan layar yang lebih lega. Ukuran layarnya sendiri sebesar 6.5 inci dengan rasio 19,5:9 dan resolusi Full HD+ 1080x2340 pixels. Kualitas layar OPPO F11 Pro yang memakai panel LTPS IPS LCD. Harga OPPO F11 Pro yang dijual pada range middle-end ini punya dual camera yang terdiri dari kamera utama 48MP dengan apperture f/1.8 dan depth sensor 5MP dengan apperture f/2.4. Kamera utama HP ini juga dilengkapi dengan phase-detection autofocus dan single-LED flash. Untuk harga OPPO F11 Pro yang cukup terjangkau, smartphone ini dibekali chipset MediaTek Helio P70. Walaupun belum dikenal sebagai chipset powerful, tapi sudah mampu hasilkan performa yang baik di kelasnya. Kinerjanya juga didukung dengan kartu grafis Mali-G72 MP3, RAM 6GB dan memori penyimpanan internal 64GB yang masih bisa diperluas dengan microSD. Baterai HP ini berkapasitas 4000 mAh, membuat HP ini bisa digunakan cukup lama terutama untuk kamu yang hobi main game. Selain baterai besar, spesifikasi OPPO F11 Pro ini kian sempurna dengan fitur pengisian daya cepat VOOC 3.0 yang bisa mengisi baterai hingga 80% hanya dalam waktu kurang lebih satu jam saja. OPPO F11 Pro menjalankan sistem operasi Android 9.0 Pie dengan ColorOS 6. Dengan spesifikasi ini tampilan antarmuka, fitur hingga ikon di smartphone ini terasa lebih clean dan segar dibanding generasi sebelumnya. Fiturnya cukup komplit seperti smart assistant, app drawer, hingga smart gesture.', 'Ukuran Layar: LTPS IPS LCD 6.53 inci, 1080 x 2340 pixels, rasio 19.5 :9\r\nChipset: Mediatek MT6771 Helio P70 (12nm)\r\nCPU: Octa-core (4x2.1 GHz Cortex-A73 & 4x2.0 GHz Cortex-A53)\r\nGPU: Mali-G72 MP3\r\nOS: Android 9.0 (Pie); ColorOS 6\r\nMemori internal: 64GB\r\nUkuran HP: 161.3 x 76.1 x 8.8 mm\r\nKamera Belakang: 48 MP, f/1.8, (wide), 1/2.25\", 0.8µm, PDAF; 5 MP, f/2.4, (depth)\r\nKamera Depan: Motorized pop-up 16 MP, f/2.0, 26mm (wide), 1/3.06\", 1.0µm\r\nBaterai: Li-Po 4000 mAh, non-removable (VOOC 3.0, Fast charging 20W)\r\nWLAN: Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot\r\nBluetooth: 4.2, A2DP, LE\r\nUSB: microUSB 2.0\r\nSIM: Hybrid Dual SIM (Nano-SIM, dual stand-by)', 25, 'https://www.begawei.com/wp-content/uploads/2019/02/oppo-f11-pro-f.jpg', 0, '2022-04-23'),
(47, 'Xiomi Redmi 5 Plus [3GB/32GB]', 1399000, 180, 'HP Xiaomi Redmi seri 5 Plus ini dilengkapi layar berukuran 5,99 inci dengan aspek rasio 18:9. Panel IPS LCD yang digunakannya memakai konsep Full View Display. Artinya, bezel pada sisi layar dibuat tipis sehingga pengguna merasa lebih puas dengan layar yang lebih lega. Kualitas tampilannya pun sudah cukup baik dengan resolusi 1080 x 2160 piksel. Selain itu, HP ini juga punya kerapatan piksel hingga 403 ppi. Hasilnya display HP ini tidak hanya memiliki warna yang terbilang tajam, tapi juga tingkat kecerahan yang lumayan mantap. HP Redmi seri 5 Plus ini dilengkapi lensa 12 MP (f/2.2) di bagian belakang dan lensa 5 MP di bagian depan. Xiaomi melengkapi HP ini dengan beberapa fitur bawaan seperti HDR, Smart Beautify 3.0, LED selfie-light, dan Face Recognition. Xiaomi Redmi 5 Plus punya performa yang seimbang dan cukup memadai untuk ponsel di kelasnya. Chipset Snapdragon 625 yang disematkan membuat kinerja HP jadi lebih efisien dan hemat daya. Smartphone ini dibekali baterai berkapasitas 4000 mAh. Tidak hanya tergolong besar di harganya, kapasitas tersebut juga cukup awet digunakan. Menurut review pengguna, dengan baterai 4000 mAh tersebut HP ini mampu bertahan 13 jam untuk browsing internet, 14 jam untuk bermain video, dan 22 jam untuk menelepon di jaringan 3G.', 'Ukuran HP: 158,5 x 75,5 x 8,1 mm\r\nUkuran layar: IPS LCD 5,99 inci\r\nResolusi layar: 1080 x 2160 piksel, 18:9 rasio (~403 ppi density)\r\nChipset: Qualcomm MSM8953 Snapdragon 625 (14 nm)\r\nCPU: Octa-core 2.0 GHz Cortex-A53\r\nGPU: Adreno 506\r\nOS: Android 7.1.2 (Nougat), MIUI 9\r\nRAM: 3 GB/4 GB\r\nMemori internal: 32 GB/64GB\r\nKamera belakang: 12 MP, f/2.2, 1.25 μm, dual pixel PDAF; video 4K@30fps, 1080p@30/60fps\r\nKamera depan: 5 MP; video 1080p@30fps\r\nBaterai: Non-removable Li-Po 4000 mAh\r\nUSB: microUSB 2.0\r\nSIM: Hybrid Dual SIM (Nano-SIM, dual stand-by)\r\nWLAN: Wi-Fi 802.11 a/b/g/n, Wi-Fi Direct, hotspot', 25, 'https://images.tokopedia.net/img/cache/900/product-1/2018/8/22/22183544/22183544_c931e4bd-57f4-4539-bf68-b1af3381f550_600_600.jpg', 0, '2022-03-14'),
(48, 'Samsung Galaxy Z Fold3 5G [12GB/256GB]', 18280000, 271, 'Seperti namanya Galaxy Z Fold3 5G adalah lini smartphone \'Fold\' dengan teknologi bodi dan layar nyaris seamless yang bisa dilipat. Layar utamanya menggunakan panel Foldable Dynamic AMOLED 2X HDR10+ dengan tingkat kecerahan maksimal hingga 1200 nits! Tak perlu khawatir visual layar kamu jadi tidak kelihatan meski berada di bawah sinar matahari terik. Layar seluas 7.6 inci ini memiliki resolusi 1768 x 2208 piksel dengan kerapatan 374 ppi dan rasio layar pada bodi hingga 88.8%. Selain layar utama, lini Fold ini juga memiliki layar cover yang menjadi layar depan ketika posisi smartphone sedang terlipat. Layar cover ini juga memiliki panel Dynamic AMOLED 2X dan refresh rate hingga 120Hz. Memiliki ukuran layar sebesar 6.2 inci dan resolusi 832 x 2268 pixels. Sebutan \"2X\" pada panel Dynamic AMOLED 2X bermaksud pada refresh rate yang sudah 2X lipat lebih baik dari versi sebelumnya. Layar cover yang dulunya hanya memiliki refresh rate 60 Hz, kini sudah di upgrade menjadi 120 Hz. Seperti banyak ponsel flagship lainnya, smartphone Samsung ZFold 3 5G ini juga memiliki RAM besar 12 GB untuk mendukung performanya. Tidak mudah lemot meski kamu menggunakan beberapa aplikasi sekaligus. resolusinya sama, namun jenis kamera ini berbeda-beda, ya. Terdapat kamera wide bukaan f/1.8, kamera telephoto bukaan f/2.4, dan kamera ultrawide bukaan f/2.2.', 'Bluetooth: 5.2, A2DP, LE, aptX HD\r\nDimensi: 158.2 x 128.1 x 6.4 mm (unfolded); 158.2 x 67.1 x 14.4-16 mm (folded)\r\nLayar utama: Foldable Dynamic AMOLED 2X, 120Hz, HDR10+, 1200 nits (peak)\r\nUkuran layar utama: 7.6 inches ; 1768 x 2208 pixels; ~374 ppi; Corning Gorilla Glass Victus\r\nLayar cover: Dynamic AMOLED 2X, 120Hz;\r\nUkuran layar cover 6.2 inches, 832 x 2268 pixels, 25:9 ratio; Corning Gorilla Glass Victus\r\nChipset: Qualcomm SM8350 Snapdragon 888 5G (5 nm)\r\nCPU: Octa-core (1x2.84 GHz Kryo 680 & 3x2.42 GHz Kryo 680 & 4x1.80 GHz Kryo 680)\r\nGPU: Adreno 660\r\nOS: Android 11, One UI 3.1.1\r\nDisplay: Dynamic AMOLED 2X 120Hz, Corning Gorilla Glass Victus\r\nKamera selfie: 4 MP (under display)\r\nKamera cover: 10 MP; video up to 4K@30fps\r\nBaterai: Li-Po 4.400 mAh, non-removable; Fast Charging 25W\r\nSIM: Nano-SIM and eSIM\r\nUSB: USB Type-C 3.2', 25, 'https://media.pricebook.co.id/article/6076d1ffb92c2ebe028b4567/6076d1ffb92c2ebe028b4567_1628745700.jpg', 0, '2022-05-15'),
(49, 'Vivo V9 Pro [6GB/64GB]', 3580000, 150, 'Pada bagian desainnya, seperti layaknya smartphone modern lainnya, vivo V9 RAM 6GB ini hadir dengan layar All-New FullView Display berukuran 6.3 inci. Terlihat semakin lega dengan rasio FullView Display 19:9 dan rasio layar ke bodi yang mencapai 90%. Sementara dari segi bezel di sekelilingnya juga terlihat sangat tipis yakni hanya 1.75 mm saja. Pada bagian desainnya, seperti layaknya smartphone modern lainnya, vivo V9 RAM 6GB ini hadir dengan layar All-New FullView Display berukuran 6.3 inci. Terlihat semakin lega dengan rasio FullView Display 19:9 dan rasio layar ke bodi yang mencapai 90%. Sementara dari segi bezel di sekelilingnya juga terlihat sangat tipis yakni hanya 1.75 mm saja. Smartphone dari vivo satu ini dirilis pada tahun 2018 dengan sejumlah peningkatan dari versi reguler. vivo V9 RAM 6GB ini dibekali dengan chipset yang lebih powerful yakni Qualcomm Snapdragon 660, berbeda dengan versi reguler yang hanya Snapdragon 450. Dengan kapasitas RAM yang juga lebih besar, dapur pacunya menghasilkan performa yang tangguh, kuat untuk berbagai aktivitas berat sehingga cocok untuk jadi gadget harian kamu.', 'Chipset: Qualcomm SDM660 Snapdragon 660\r\nRAM: 6GB\r\nMemori internal: 64GB\r\nUkuran HP: 154.8x75x7.9 mm\r\nUkuran layar: 6,3 inci, 1080x2280 piksel\r\nKamera depan: 12MP\r\nKamera belakang: Dual camera, 13MP+2MP\r\nBaterai: 3260 mAh\r\nDimensi (W x H x D)	154.8 x 75 x 7.9mm\r\nSistem Operasi Android\r\nVersi OS Android 8.1 Oreo\r\nUSB Connectors Micro-USB\r\nTipe Kamera Dual Kamera\r\nResolusi Video HD', 25, 'https://www.begawei.com/wp-content/uploads/2018/08/vivo-V9-F-2.png', 0, '2022-04-28'),
(50, 'Xiomi Redmi K40 Gaming [8GB/128GB]', 8971000, 205, 'Redmi K40 sudah menggunakan panel OLED seluas 6,67 inci dengan perlindungan Corning Gorilla Glass 5. Layarnya diklaim mampu menyajikan warna yang lebih kaya. Tak hanya itu, HP ini juga dibekali dengan HDR10+ dengan refresh rate 120Hz serta touch sampling rate 480Hz, Redmi K40 menggunakan chipset MediaTek MT6893 Dimensity 1200 5G. Dengan adanya chipset ini, performa di sektor audio dan kemampuan AI untuk main game pun meningkat. Sistem operasinya saja sudah menggunakan Android 11 dan MIUI 12.5 yang nyaman digunakan. HP Gaming Xiaomi ini sudah dibekali dengan baterai berkapasitas 5065 mAh, lengkap dengan teknologi Fast Charging 65W. Pengisian baterainya dari kosong hingga penuh tak sampai satu jam! Redmi K40 ini dibanderol dengan harga yang terjangkau. Harga yang lebih murah bisa kamu temukan pada varian RAM 6GB dengan memori internal 128GB. Sementara varian RAM 12GB dengan memori internal 256GB tentu dibanderol dengan harga yang lebih tinggi.', 'Ukuran layar: OLED 6,67 inches (1080 x 2400 pixels)\r\nPerlindungan layar: Corning Gorilla Glass 5\r\nChipset: MediaTek MT6893 Dimensity 1200 5G (6 nm)\r\nChipset: MediaTek MT6893 Dimensity 1200 5G (6 nm)\r\nGPU: Mali-G77 MC9\r\nOS: Android 11, MIUI 12.5\r\nRAM: 6GB/8GB/12GB\r\nMemori internal: 128GB/256GB\r\nUkuran HP: 161.9 x 76.9 x 8.3 mm\r\nKamera depan: 16 MP\r\nKamera belakang: 64 MP, f/1.7, 26mm (wide), 8 MP, f/2.2, 120˚ (ultrawide), 2 MP, f/2.4, (macro)\r\nBaterai: Li-Po 5065 mAh, non-removable\r\nWLAN: Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, Wi-Fi Direct, hotspot\r\nBluetooth: 5.2, A2DP, LE\r\nBluetooth: 5.2, A2DP, LE\r\nSIM: Dual SIM (Nano-SIM, dual stand-by)', 25, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUC1bef9wIioBWC5Nv2XDagMuSlLnXerHmHmvVz-0WoinavvBJrb8zZ0FQJx-ql83LGRQ&usqp=CAU', 0, '2022-01-28');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_id` (`produk_id`),
  ADD KEY `pesanan_id` (`pesanan_id`,`produk_id`) USING BTREE;

--
-- Indeks untuk tabel `gambar_produk`
--
ALTER TABLE `gambar_produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `produk_id` (`produk_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `produk_id` (`produk_id`,`kategori_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggan_id` (`pelanggan_id`) USING BTREE;

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT untuk tabel `gambar_produk`
--
ALTER TABLE `gambar_produk`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `detail_pesanan_ibfk_1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `gambar_produk`
--
ALTER TABLE `gambar_produk`
  ADD CONSTRAINT `gambar_produk_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD CONSTRAINT `kategori_produk_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kategori_produk_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
