<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: admin');
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

  $admin->nama = $data->nama;
  $admin->username = $data->username;
  $admin->password = $data->password;

  // Create admin
  if($admin->create()) {
    echo json_encode(
      array('message' => 'admin Created')
    );
  } else {
    echo json_encode(
      array('message' => 'admin Not Created')
    );
  }