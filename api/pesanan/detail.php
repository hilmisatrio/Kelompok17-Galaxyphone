<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Pesanan.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog pesanan object
  $pesanan = new Pesanan($db);

  // Get ID
  $pesanan->id = isset($_GET['id']) ? $_GET['id'] : die();

  // Get pesanan
  $pesanan->read_single();

  // Create array
  $pesanan_arr = array(
    'id' => $pesanan->id,
    'pelanggan_id' => $pesanan->pelanggan_id,
    'jumlah_biaya' => $pesanan->jumlah_biaya,
    'alamat_pengiriman' => $pesanan->alamat_pengiriman,
    'tanggal_pemesanan' => $pesanan->tanggal_pemesanan,
    'metode_pembayaran' => $pesanan->metode_pembayaran
  );

  // Make JSON
  print_r(json_encode($pesanan_arr));