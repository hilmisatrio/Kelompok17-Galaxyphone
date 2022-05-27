<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: DELETE');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Produk.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog produk object
  $produk = new Produk($db);

  // Get raw produked data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  $produk->id = $data->id;

  // Delete produk
  if($produk->delete()) {
    echo json_encode(
      array('message' => 'produk Deleted')
    );
  } else {
    echo json_encode(
      array('message' => 'produk Not Deleted')
    );
  }