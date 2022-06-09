<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: pesanan');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Pesanan_Info.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog pesanan object
  $pesanan = new Pesanan_Info($db);

  // Get raw pesananed data
  $data = json_decode(file_get_contents("php://input"));

  $pesanan->pelanggan_id = $data->pelanggan_id;
  $pesanan->jumlah_biaya = $data->jumlah_biaya;
  $pesanan->alamat_pengiriman = $data->alamat_pengiriman;
  $pesanan->tanggal_pemesanan = $data->tanggal_pemesanan;
  $pesanan->metode_pembayaran = $data->metode_pembayaran;

  // Create pesanan
  if($pesanan->create()) {
    echo json_encode(
      array('message' => 'pesanan Created')
    );
  } else {
    echo json_encode(
      array('message' => 'pesanan Not Created')
    );
  }