<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Gambar_Produk.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog gambar_produk object
  $gambar_produk = new Gambar_Produk($db);

  // Get ID
  $gambar_produk->id = isset($_GET['id']) ? $_GET['id'] : die();

  // Get gambar_produk
  $gambar_produk->read_single();

  // Create array
  $gambar_produk_arr = array(
    'id' => $gambar_produk->id,
    'produk_id' => $gambar_produk->produk_id,
    'gambar' => $gambar_produk->gambar,
    'nama' => $gambar_produk->nama,
  );

  // Make JSON
  print_r(json_encode($gambar_produk_arr));