<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: PUT');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Gambar_Produk.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog gambar_produk objects
  $gambar_produk = new Gambar_Produk($db);

  // Get raw gambar_produked data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  $gambar_produk->id = $data->id;

  $gambar_produk->produk_id = $data->produk_id;
  $gambar_produk->gambar = $data->gambar;

  // Update gambar_produk
  if($gambar_produk->update()) {
    echo json_encode(
      array('message' => 'gambar_produk Updated')
    );
  } else {
    echo json_encode(
      array('message' => 'gambar_produk Not Updated')
    );
  }