<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Keranjang.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog detail_pesanan object
  $keranjang = new Keranjang($db);

  // Get ID
  $keranjang->id = isset($_GET['id']) ? $_GET['id'] : die();

  // Get detail_pesanan
  $keranjang->read_single();

  // Create array
  $keranjang_arr = array(
    'id' => $keranjang->id,
    'pelanggan_id' => $keranjang->pelanggan_id,
    'produk_id' => $keranjang->produk_id,
    'nama' => $keranjang->nama,
    'harga' => $keranjang->harga,
    'jumlah' => $keranjang->jumlah,
    'total_harga' => $keranjang->total_harga,
    'gambar_utama' => $keranjang->gambar_utama
  );

  // Make JSON
  print_r(json_encode($keranjang_arr));