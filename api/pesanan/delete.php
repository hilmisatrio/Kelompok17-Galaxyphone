<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: DELETE');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Pesanan.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog pesanan object
  $pesanan = new Pesanan($db);

  // Get raw pesananed data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  $pesanan->id = $data->id;

  // Delete pesanan
  if($pesanan->delete()) {
    echo json_encode(
      array('message' => 'pesanan Deleted')
    );
  } else {
    echo json_encode(
      array('message' => 'pesanan Not Deleted')
    );
  }