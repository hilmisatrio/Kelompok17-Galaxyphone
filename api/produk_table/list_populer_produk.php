<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Produk_Table.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog produk object
  $produk = new Produk_Table($db);

  // Blog produk query
  $result = $produk->readPopulerProduk();
  // Get row count
  $num = $result->rowCount();

  // Check if any produks
  if($num > 0) {
    // produk array
    $produks_arr = array();
    // $produks_arr['data'] = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $produk_item = array(
        'id' => $id,
        'nama' => $nama,
        'harga' => $harga,
        'berat' => $berat,
        'deskripsi' => $deskripsi,
        'spesifikasi' => $spesifikasi,
        'stock' => $stock,
        'gambar_utama' => $gambar_utama,
        'hasil_penjualan'=>$hasil_penjualan,
        'tanggal_barang_masuk'=>$tanggal_barang_masuk
      );

      // Push to "data"
      array_push($produks_arr, $produk_item);
      // array_push($produks_arr['data'], $produk_item);
    }

    // Turn to JSON & output
    echo json_encode($produks_arr);

  } else {
    // No produks
    echo json_encode(
      array('message' => 'No produks Found')
    );
  }