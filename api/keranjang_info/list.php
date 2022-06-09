<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Keranjang_Info.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog detail_pesanan object
  $keranjang = new Keranjang_Info($db);
  $keranjang->pelanggan_id = isset($_GET['pelanggan_id']) ? $_GET['pelanggan_id'] : die();

  // Blog detail_pesanan query
  $result = $keranjang->read();
  // Get row count
  $num = $result->rowCount();

  // Check if any detail_pesanans
  if($num > 0) {
    // detail_pesanan array
    $keranjangs_arr = array();
    // $keranjangs_arr['data'] = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $keranjang_item = array(
        // 'id' => $id,
        // 'pelanggan_id' => $pelanggan_id,
        // 'produk_id' => $produk_id,
        // 'nama' => $nama,
        // 'harga' => $harga,
        // 'jumlah' => $jumlah,
        // 'total_harga'=>$total_harga,
        // 'gambar_utama'=>$gambar_utama
        'total'=>$total
      );

      // Push to "data"
      array_push($keranjangs_arr, $keranjang_item);
      // array_push($keranjangs_arr['data'], $keranjang_item);
    }

    // Turn to JSON & output
    echo json_encode($keranjangs_arr);

  } else {
    // No detail_pesanans
    echo json_encode(
      array('message' => 'No detail_pesanans Found')
    );
  }