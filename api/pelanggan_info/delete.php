<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: DELETE');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Pelanggan_Info.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog pelanggan object
  $pelanggan = new Pelanggan_Info($db);

  // Get raw pelangganed data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  $pelanggan->id = $data->id;

  // Delete pelanggan
  if($pelanggan->delete()) {
    echo json_encode(
      array('message' => 'pelanggan Deleted')
    );
  } else {
    echo json_encode(
      array('message' => 'pelanggan Not Deleted')
    );
  }