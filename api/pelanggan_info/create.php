<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: pelanggan');
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

  $pelanggan->email = $data->email;
  $pelanggan->password = $data->password;
  $pelanggan->nama_lengkap = $data->nama_lengkap;
  $pelanggan->alamat_pengiriman = $data->alamat_pengiriman;
  $pelanggan->no_hp = $data->no_hp;

  // Create pelanggan
  if($pelanggan->create()) {
    echo json_encode(
      array('message' => 'pelanggan Created')
    );
  } else {
    echo json_encode(
      array('message' => 'pelanggan Not Created')
    );
  }