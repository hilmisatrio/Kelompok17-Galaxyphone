<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Detail_Pesanan.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog detail_pesanan object
  $detail_pesanan = new Detail_Pesanan($db);

  // Blog detail_pesanan query
  $result = $detail_pesanan->read();
  // Get row count
  $num = $result->rowCount();

  // Check if any detail_pesanans
  if($num > 0) {
    // detail_pesanan array
    $detail_pesanans_arr = array();
    // $detail_pesanans_arr['data'] = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $detail_pesanan_item = array(
        'id' => $id,
        'pesanan_id' => $pesanan_id,
        'produk_id' => $produk_id,
        'harga' => $harga,
        'kuantitas' => $kuantitas
      );

      // Push to "data"
      array_push($detail_pesanans_arr, $detail_pesanan_item);
      // array_push($detail_pesanans_arr['data'], $detail_pesanan_item);
    }

    // Turn to JSON & output
    echo json_encode($detail_pesanans_arr);

  } else {
    // No detail_pesanans
    echo json_encode(
      array('message' => 'No detail_pesanans Found')
    );
  }