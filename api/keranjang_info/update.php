<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: PUT');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Keranjang.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog detail_pesanan object
  $keranjang = new Keranjang($db);

  // Get raw detail_pesananed data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  $keranjang->id = $data->id;

  $keranjang->pelanggan_id = $data->pelanggan_id;
  $keranjang->produk_id = $data->produk_id;
  $keranjang->nama = $data->nama;
  $keranjang->harga = $data->harga;
  $keranjang->jumlah = $data->jumlah;
  $keranjang->total_harga=$data->total_harga;
  $keranjang->gambar_utama=$data->gambar_utama;

  // Update detail_pesanan
  if($keranjang->update()) {
    echo json_encode(
      array('message' => 'detail_pesanan Updated')
    );
  } else {
    echo json_encode(
      array('message' => 'detail_pesanan Not Updated')
    );
  }