<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Pesanan_Info.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog pesanan object
  $pesanan = new Pesanan_Info($db);

  // Blog pesanan query
  $result = $pesanan->read();
  // Get row count
  $num = $result->rowCount();

  // Check if any pesanans
  if($num > 0) {
    // pesanan array
    $pesanans_arr = array();
    // $pesanans_arr['data'] = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $pesanan_item = array(
        'id' => $id,
      );

      // Push to "data"
      array_push($pesanans_arr, $pesanan_item);
      // array_push($pesanans_arr['data'], $pesanan_item);
    }

    // Turn to JSON & output
    echo json_encode($pesanans_arr);

  } else {
    // No pesanans
    echo json_encode(
      array('message' => 'No pesanan Found')
    );
  }