<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Kategori_Produk.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog kategori_produk object
  $kategori_produk = new Kategori_Produk($db);

  // Get ID
  $kategori_produk->id = isset($_GET['id']) ? $_GET['id'] : die();

  // Get kategori_produk
  $kategori_produk->read_single();

  // Create array
  $kategori_produk_arr = array(
    'id' => $kategori_produk->id,
    'produk_id' => $kategori_produk->produk_id,
    'kategori_id' => $kategori_produk->kategori_id,
    'nama_produk' => $kategori_produk->nama_produk,
    'type_produk' => $kategori_produk->type_produk,
    'merek_produk' => $kategori_produk->merek_produk,
  );

  // Make JSON
  print_r(json_encode($kategori_produk_arr));