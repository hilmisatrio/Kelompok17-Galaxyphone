<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Kategori_Produk.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog kategori_produk object
  $kategori_produk = new Kategori_Produk($db);

  // Blog kategori_produk query
  $result = $kategori_produk->read();
  // Get row count
  $num = $result->rowCount();

  // Check if any kategori_produks
  if($num > 0) {
    // kategori_produk array
    $kategori_produks_arr = array();
    // $kategori_produks_arr['data'] = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $kategori_produk_item = array(
        'id' => $id,
        'produk_id' => $produk_id,
        'kategori_id' => $kategori_id,
        'nama_produk' => $nama_produk,
        'type_produk' => $type_produk,
        'merek_produk' => $merek_produk
      );

      // Push to "data"
      array_push($kategori_produks_arr, $kategori_produk_item);
      // array_push($kategori_produks_arr['data'], $kategori_produk_item);
    }

    // Turn to JSON & output
    echo json_encode($kategori_produks_arr);

  } else {
    // No kategori_produks
    echo json_encode(
      array('message' => 'No kategori_produks Found')
    );
  }