<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: produk');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Produk_Table.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog produk object
  $produk = new Produk_Table($db);

  // Get raw produked data
  $data = json_decode(file_get_contents("php://input"));

  $produk->nama = $data->nama;
  $produk->harga = $data->harga;
  $produk->berat = $data->berat;
  $produk->deskripsi = $data->deskripsi;
  $produk->spesifikasi = $data->spesifikasi;
  $produk->stock = $data->stock;
  $produk->gambar_utama = $data->gambar_utama;
  $produk->hasil_penjualan = $data->hasil_penjualan;
  $produk->tanggal_barang_masuk = $data->tanggal_barang_masuk;

  // Create produk
  if($produk->create()) {
    echo json_encode(
      array('message' => 'produk Created')
    );
  } else {
    echo json_encode(
      array('message' => 'produk Not Created')
    );
  }