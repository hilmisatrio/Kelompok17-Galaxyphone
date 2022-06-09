<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: DELETE');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Gambar_Produk.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog gambar_produk object
  $gambar_produk = new Gambar_Produk($db);

  // Get raw gambar_produked data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  $gambar_produk->id = $data->id;

  // Delete gambar_produk
  if($gambar_produk->delete()) {
    echo json_encode(
      array('message' => 'gambar_produk Deleted')
    );
  } else {
    echo json_encode(
      array('message' => 'gambar_produk Not Deleted')
    );
  }