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

  // Blog kategori query
  $result = $kategori->read();
  // Get row count
  $num = $result->rowCount();

  // Check if any kategoris
  if($num > 0) {
    // kategori array
    $kategoris_arr = array();
    // $kategoris_arr['data'] = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $kategori_item = array(
        'id' => $id,
        'type' => $type,
        'merek' => $merek,
        'deskripsi' => $deskripsi,
      );

      // Push to "data"
      array_push($kategoris_arr, $kategori_item);
      // array_push($kategoris_arr['data'], $kategori_item);
    }

    // Turn to JSON & output
    echo json_encode($kategoris_arr);

  } else {
    // No kategoris
    echo json_encode(
      array('message' => 'No kategori Found')
    );
  }