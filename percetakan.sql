-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2018 at 04:06 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `percetakan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kd_barang` varchar(4) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `spesifikasi` varchar(100) NOT NULL,
  `harga` int(12) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  PRIMARY KEY (`kd_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `spesifikasi`, `harga`, `satuan`) VALUES
('C001', 'Kertas A4', '70gr', 75000, 'pack'),
('C002', 'kertas foto', 'ukuran a4', 80000, 'pack'),
('C003', 'kartu nama', '230 gsm', 10000, 'pack'),
('C004', 'kalender', '250 gsm', 15000, 'lembar'),
('C005', 'brosur', 'hvs 70 gsm', 10000, 'lembar'),
('C006', 'paper bag', 'small 110 x 50 x 190', 5000, 'lembar'),
('C007', 'flyer', 'a4', 10000, 'lembar'),
('C008', 'nota', 'NCR', 5000, 'lembar'),
('C009', 'memo', 'ukuran folio', 20000, 'lembar'),
('C010', 'undangan', 'ukuran a4', 10000, 'lembar');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_pelanggan` varchar(4) NOT NULL,
  `nm_pelanggan` varchar(50) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telp` varchar(12) NOT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nm_pelanggan`, `alamat`, `telp`) VALUES
('B001', 'Rahayu', 'Palembang', '081230347254'),
('B002', 'Puji', 'jl. arwana', '081234567892'),
('B003', 'Dimas ', 'jl. sultan agung', '081231541213'),
('B004', 'Deny', 'Palembang', '081230347259'),
('B005', 'Budi', 'jl. semangka', '081231541100'),
('B006', 'Setyo', 'jl. pattimura', '081234567808'),
('B007', 'Hadi', 'jl. pajajaran', '081231541188'),
('B008', 'Feren', 'jl. tanjung', '081234567890'),
('B009', 'Meylinda', 'jl. sultan agung', '081231541111'),
('B010', 'Susanto', 'jl. arwana 2', '081234567896');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE IF NOT EXISTS `pemesanan` (
  `kd_pemesanan` varchar(4) NOT NULL,
  `kd_barang` varchar(4) NOT NULL,
  `id_pelanggan` varchar(4) NOT NULL,
  `jumlah_pesan` int(4) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  PRIMARY KEY (`kd_pemesanan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`kd_pemesanan`, `kd_barang`, `id_pelanggan`, `jumlah_pesan`, `tgl_pesan`, `tgl_selesai`) VALUES
('Z001', 'C001', 'B001', 2, '2017-09-22', '2017-09-22'),
('Z002', 'C002', 'B002', 1, '2017-11-01', '2017-11-01'),
('Z003', 'C003', 'B003', 20, '2017-11-22', '2017-11-27'),
('Z004', 'C004', 'B004', 10, '2017-11-09', '2017-11-15'),
('Z005', 'C005', 'B005', 50, '2017-12-01', '2017-12-10'),
('Z006', 'C006', 'B006', 50, '2017-12-03', '2017-12-10'),
('Z007', 'C007', 'B007', 50, '2017-12-08', '2017-12-13'),
('Z008', 'C008', 'B008', 100, '2017-11-18', '2017-11-28'),
('Z009', 'C009', 'B009', 50, '2017-12-20', '2017-12-27'),
('Z010', 'C010', 'B010', 100, '2018-01-01', '2018-01-07');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `kd_transaksi` varchar(4) NOT NULL,
  `kd_pemesanan` varchar(4) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `total_pembayaran` int(4) NOT NULL,
  PRIMARY KEY (`kd_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`kd_transaksi`, `kd_pemesanan`, `tgl_transaksi`, `total_pembayaran`) VALUES
('T001', 'Z001', '2017-09-22', 2),
('T002', 'Z002', '2017-11-01', 1),
('T003', 'Z003', '2017-11-27', 20),
('T004', 'Z004', '2017-11-15', 10),
('T005', 'Z005', '2017-12-10', 50),
('T006', 'Z006', '2017-12-10', 50),
('T007', 'Z007', '2017-12-13', 50),
('T008', 'Z008', '2017-11-28', 100),
('T009', 'Z009', '2017-12-27', 50),
('T010', 'Z010', '2018-01-07', 100);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
