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

  // Get ID
  $admin->id = isset($_GET['id']) ? $_GET['id'] : die();

  // Get admin
  $admin->read_single();

  // Create array
  $admin_arr = array(
    'id' => $admin->id,
    'nama' => $admin->nama,
    'username' => $admin->username,
    'password' => $admin->password,
  );

  // Make JSON
  print_r(json_encode($admin_arr));