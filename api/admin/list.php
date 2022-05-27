<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Admin.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog admin object
  $admin = new Admin($db);

  // Blog admin query
  $result = $admin->read();
  // Get row count
  $num = $result->rowCount();

  // Check if any admins
  if($num > 0) {
    // admin array
    $admins_arr = array();
    // $admins_arr['data'] = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $admin_item = array(
        'id' => $id,
        'nama' => $nama,
        'username' => $username,
        'password' => $password,
      );

      // Push to "data"
      array_push($admins_arr, $admin_item);
      // array_push($admins_arr['data'], $admin_item);
    }

    // Turn to JSON & output
    echo json_encode($admins_arr);

  } else {
    // No admins
    echo json_encode(
      array('message' => 'No admins Found')
    );
  }