<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: DELETE');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Detail_Pesanan.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog detail_pesanan object
  $detail_pesanan = new Detail_Pesanan($db);

  // Get raw detail_pesananed data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  $detail_pesanan->id = $data->id;

  // Delete detail_pesanan
  if($detail_pesanan->delete()) {
    echo json_encode(
      array('message' => 'detail_pesanan Deleted')
    );
  } else {
    echo json_encode(
      array('message' => 'detail_pesanan Not Deleted')
    );
  }