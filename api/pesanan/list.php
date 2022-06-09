<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Pesanan.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog pesanan object
  $pesanan = new Pesanan($db);

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
        'pelanggan_id' => $pelanggan_id,
        'jumlah_biaya' => $jumlah_biaya,
        'alamat_pengiriman' => $alamat_pengiriman,
        'tanggal_pemesanan' => $tanggal_pemesanan,
        'metode_pembayaran' => $metode_pembayaran
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