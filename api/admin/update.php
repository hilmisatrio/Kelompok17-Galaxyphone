<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: PUT');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Admin.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog admin object
  $admin = new Admin($db);

  // Get raw admined data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  $admin->id = $data->id;

  $admin->nama = $data->nama;
  $admin->username = $data->username;
  $admin->password = $data->password;

  // Update admin
  if($admin->update()) {
    echo json_encode(
      array('message' => 'admin Updated')
    );
  } else {
    echo json_encode(
      array('message' => 'admin Not Updated')
    );
  }