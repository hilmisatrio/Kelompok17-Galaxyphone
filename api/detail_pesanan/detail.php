<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Detail_Pesanan.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog detail_pesanan object
  $detail_pesanan = new Detail_Pesanan($db);

  // Get ID
  $detail_pesanan->id = isset($_GET['id']) ? $_GET['id'] : die();

  // Get detail_pesanan
  $detail_pesanan->read_single();

  // Create array
  $detail_pesanan_arr = array(
    'id' => $detail_pesanan->id,
    'pesanan_id' => $detail_pesanan->pesanan_id,
    'produk_id' => $detail_pesanan->produk_id,
    'harga' => $detail_pesanan->harga,
    'kuantitas' => $detail_pesanan->kuantitas,
  );

  // Make JSON
  print_r(json_encode($detail_pesanan_arr));