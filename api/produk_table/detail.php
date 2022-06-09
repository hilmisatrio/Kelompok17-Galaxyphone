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

  // Get ID
  $produk->id = isset($_GET['id']) ? $_GET['id'] : die();

  // Get produk
  $produk->read_single();

  // Create array
  $produk_arr = array(
    'id' => $produk->id,
    'nama' => $produk->nama,
    'harga' => $produk->harga,
    'berat' => $produk->berat,
    'deskripsi' => $produk->deskripsi,
    'spesifikasi' => $produk->spesifikasi,
    'stock' => $produk->stock,
    'gambar_utama' => $produk->gambar_utama,
    'hasil_penjualan' => $produk->hasil_penjualan,
    'tanggal_barang_masuk' => $produk->tanggal_barang_masuk
  );

  // Make JSON
  print_r(json_encode($produk_arr));