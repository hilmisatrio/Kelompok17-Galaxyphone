<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: PUT');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Kategori.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog kategori object
  $kategori = new Kategori($db);

  // Get raw kategoried data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  $kategori->id = $data->id;

  $kategori->type = $data->type;
  $kategori->merek = $data->merek;
  $kategori->deskripsi = $data->deskripsi;

  // Update kategori
  if($kategori->update()) {
    echo json_encode(
      array('message' => 'kategori Updated')
    );
  } else {
    echo json_encode(
      array('message' => 'kategori Not Updated')
    );
  }