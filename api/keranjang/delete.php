<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: DELETE');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Keranjang.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog detail_pesanan object
  $keranjang = new  Keranjang($db);

  // Get raw detail_pesananed data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  // $keranjang->id = $data->id;
  $keranjang->id = isset($_GET['id']) ? $_GET['id'] : die();

  // Delete detail_pesanan
  if($keranjang->delete()) {
    echo json_encode(
      array('message' => 'detail_pesanan Deleted')
    );
  } else {
    echo json_encode(
      array('message' => 'detail_pesanan Not Deleted')
    );
  }