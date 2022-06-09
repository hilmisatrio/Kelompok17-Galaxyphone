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

  // Blog pelanggan query
  $result = $pelanggan->read();
  // Get row count
  $num = $result->rowCount();

  // Check if any pelanggans
  if($num > 0) {
    // pelanggan array
    $pelanggans_arr = array();
    // $pelanggans_arr['data'] = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $pelanggan_item = array(
        'id' => $id,
        'email' => $email,
        'password' => $password,
        'nama_lengkap' => $nama_lengkap,
        'alamat_pengiriman' => $alamat_pengiriman,
        'no_hp' => $no_hp
      );

      // Push to "data"
      array_push($pelanggans_arr, $pelanggan_item);
      // array_push($pelanggans_arr['data'], $pelanggan_item);
    }

    // Turn to JSON & output
    echo json_encode($pelanggans_arr);

  } else {
    // No pelanggans
    echo json_encode(
      array('message' => 'No pelanggan Found')
    );
  }