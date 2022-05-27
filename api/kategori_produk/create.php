<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: kategori_produk');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Kategori_Produk.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog kategori_produk object
  $kategori_produk = new Kategori_Produk($db);

  // Get raw kategori_produked data
  $data = json_decode(file_get_contents("php://input"));

  $kategori_produk->produk_id = $data->produk_id;
  $kategori_produk->kategori_id = $data->kategori_id;

  // Create kategori_produk
  if($kategori_produk->create()) {
    echo json_encode(
      array('message' => 'kategori_produk Created')
    );
  } else {
    echo json_encode(
      array('message' => 'kategori_produk Not Created')
    );
  }