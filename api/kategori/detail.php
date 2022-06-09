<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Kategori.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog kategori object
  $kategori = new Kategori($db);

  // Get ID
  $kategori->id = isset($_GET['id']) ? $_GET['id'] : die();

  // Get kategori
  $kategori->read_single();

  // Create array
  $kategori_arr = array(
    'id' => $kategori->id,
    'type' => $kategori->type,
    'merek' => $kategori->merek,
    'deskripsi' => $kategori->deskripsi,
  );

  // Make JSON
  print_r(json_encode($kategori_arr));