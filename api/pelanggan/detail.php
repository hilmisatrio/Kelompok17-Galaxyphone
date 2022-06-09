<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Pelanggan.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog pelanggan object
  $pelanggan = new Pelanggan($db);

  // Get ID
  $pelanggan->email = isset($_GET['email']) ? $_GET['email'] : die();

  // Get pelanggan
  $pelanggan->read_single();

  // Create array
  $pelanggan_arr = array(
    'id' => $pelanggan->id,
    'email' => $pelanggan->email,
    'password' => $pelanggan->password,
    'nama_lengkap' => $pelanggan->nama_lengkap,
    'alamat_pengiriman' => $pelanggan->alamat_pengiriman,
    'no_hp' => $pelanggan->no_hp
  );

  // Make JSON
  print_r(json_encode($pelanggan_arr));