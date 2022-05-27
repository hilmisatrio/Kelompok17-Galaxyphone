<?php 
  class Produk {
    // DB stuff
    private $conn;
    private $table = 'Produk';

    // Post Properties
    public $id;
    public $nama;
    public $harga;
    public $berat;
    public $deskripsi;
    public $spesifikasi;
    public $stock;
    public $gambar_utama;

    // Constructor with DB
    public function __construct($db) {
      $this->conn = $db;
    }

    // Get Posts
    public function read() {
      // Create query
      $query = 'SELECT * FROM ' . $this->table . ' ORDER BY Id';
      
      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Execute query
      $stmt->execute();

      return $stmt;
    }

    // Get Single Post
    public function read_single() {
          // Create query
          $query = 'SELECT * FROM ' . $this->table . ' WHERE Id = ?';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Bind ID
          $stmt->bindParam(1, $this->id);

          // Execute query
          $stmt->execute();

          $row = $stmt->fetch(PDO::FETCH_ASSOC);

          // Set properties
           $this->id = $row['id'];
           $this->nama = $row['nama'];
           $this->harga = $row['harga'];
           $this->berat = $row['berat'];
           $this->deskripsi = $row['deskripsi'];
           $this->spesifikasi = $row['spesifikasi'];
           $this->stock = $row['stock'];
           $this->gambar_utama = $row['gambar_utama'];
          
    }

    // Create Post
    public function create() {
          // Create query
          $query = 'INSERT INTO ' . $this->table . ' SET nama = :nama, harga = :harga, berat = :berat, deskripsi = :deskripsi, spesifikasi = :spesifikasi, stock = :stock, gambar_utama = :gambar_utama';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Clean data
          $this->nama = htmlspecialchars(strip_tags($this->nama));
          $this->harga = htmlspecialchars(strip_tags($this->harga));
          $this->berat = htmlspecialchars(strip_tags($this->berat));
          $this->deskripsi = htmlspecialchars(strip_tags($this->deskripsi));
          $this->spesifikasi = htmlspecialchars(strip_tags($this->spesifikasi));
          $this->stock = htmlspecialchars(strip_tags($this->stock));
          $this->gambar_utama = htmlspecialchars(strip_tags($this->gambar_utama));

          // Bind data
          $stmt->bindParam(':nama', $this->nama);
          $stmt->bindParam(':harga', $this->harga);
          $stmt->bindParam(':berat', $this->berat);
          $stmt->bindParam(':deskripsi', $this->deskripsi);
          $stmt->bindParam(':spesifikasi', $this->spesifikasi);
          $stmt->bindParam(':stock', $this->stock);
          $stmt->bindParam(':gambar_utama', $this->gambar_utama);

          // Execute query
          if($stmt->execute()) {
            return true;
      }

      // Print error if something goes wrong
      printf("Error: %s.\n", $stmt->error);

      return false;
    }

    // Update Post
    public function update() {
          // Create query
          $query = 'UPDATE ' . $this->table . '
                                SET nama = :nama, harga = :harga, berat = :berat, deskripsi = :deskripsi, spesifikasi = :spesifikasi, stock = :stock, gambar_utama = :gambar_utama
                                WHERE id = :id';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Clean data
          $this->nama = htmlspecialchars(strip_tags($this->nama));
          $this->harga = htmlspecialchars(strip_tags($this->harga));
          $this->berat = htmlspecialchars(strip_tags($this->berat));
          $this->deskripsi = htmlspecialchars(strip_tags($this->deskripsi));
          $this->spesifikasi = htmlspecialchars(strip_tags($this->spesifikasi));
          $this->stock = htmlspecialchars(strip_tags($this->stock));
          $this->gambar_utama = htmlspecialchars(strip_tags($this->gambar_utama));
          $this->id = htmlspecialchars(strip_tags($this->id));

          // Bind data
          $stmt->bindParam(':nama', $this->nama);
          $stmt->bindParam(':harga', $this->harga);
          $stmt->bindParam(':berat', $this->berat);
          $stmt->bindParam(':deskripsi', $this->deskripsi);
          $stmt->bindParam(':spesifikasi', $this->spesifikasi);
          $stmt->bindParam(':stock', $this->stock);
          $stmt->bindParam(':gambar_utama', $this->gambar_utama);
          $stmt->bindParam(':id', $this->id);

          // Execute query
          if($stmt->execute()) {
            return true;
          }

          // Print error if something goes wrong
          printf("Error: %s.\n", $stmt->error);

          return false;
    }

    // Delete Post
    public function delete() {
          // Create query
          $query = 'DELETE FROM ' . $this->table . ' WHERE id = :id';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Clean data
          $this->id = htmlspecialchars(strip_tags($this->id));

          // Bind data
          $stmt->bindParam(':id', $this->id);

          // Execute query
          if($stmt->execute()) {
            return true;
          }

          // Print error if something goes wrong
          printf("Error: %s.\n", $stmt->error);

          return false;
    }
    
  }