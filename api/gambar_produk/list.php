<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Gambar_Produk.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog gambar_produk object
  $gambar_produk = new Gambar_Produk($db);

  // Blog gambar_produk query
  $result = $gambar_produk->read();
  // Get row count
  $num = $result->rowCount();

  // Check if any gambar_produks
  if($num > 0) {
    // gambar_produk array
    $gambar_produks_arr = array();
    // $gambar_produks_arr['data'] = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $gambar_produk_item = array(
        'id' => $id,
        'produk_id' => $produk_id,
        'gambar' => $gambar,
        'nama' => $nama,
      );

      // Push to "data"
      array_push($gambar_produks_arr, $gambar_produk_item);
      // array_push($gambar_produks_arr['data'], $gambar_produk_item);
    }

    // Turn to JSON & output
    echo json_encode($gambar_produks_arr);

  } else {
    // No gambar_produks
    echo json_encode(
      array('message' => 'No gambar_produks Found')
    );
  }