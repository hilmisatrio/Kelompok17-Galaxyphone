<?php 
  class Gambar_Produk {
    // DB stuff
    private $conn;
    private $table = 'Gambar_Produk';

    // Post Properties
    public $id;
    public $produk_id;
    public $gambar;
    public $nama;

    // Constructor with DB
    public function __construct($db) {
      $this->conn = $db;
    }

    // Get Posts
    public function read() {
      // Create query
      $query = 'SELECT gambar_produk.id as id, gambar_produk.produk_id as produk_id, gambar_produk.gambar as gambar, produk.nama as nama
                                FROM ' . $this->table . ' gambar_produk
                                LEFT JOIN
                                  produk ON gambar_produk.produk_id = produk.id ORDER BY gambar_produk.id';
      
      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Execute query
      $stmt->execute();

      return $stmt;
    }

    // Get Single Post
    public function read_single() {
          // Create query
          $query = 'SELECT gambar_produk.id as id, gambar_produk.produk_id as produk_id, gambar_produk.gambar as gambar, produk.nama as nama
                                    FROM ' . $this->table . ' gambar_produk
                                    LEFT JOIN
                                    produk ON gambar_produk.produk_id = produk.id
                                    WHERE
                                    gambar_produk.id = ?
                                    LIMIT 0,1';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Bind ID
          $stmt->bindParam(1, $this->id);

          // Execute query
          $stmt->execute();

          $row = $stmt->fetch(PDO::FETCH_ASSOC);

          // Set properties
          $this->produk_id = $row['produk_id'];
          $this->gambar = $row['gambar'];
          $this->nama = $row['nama'];
    }

    // Create Post
    public function create() {
          // Create query
          $query = 'INSERT INTO ' . $this->table . ' SET produk_id = :produk_id, gambar = :gambar';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Clean data
          $this->produk_id = htmlspecialchars(strip_tags($this->produk_id));
          $this->gambar = htmlspecialchars(strip_tags($this->gambar));


          // Bind data
          $stmt->bindParam(':produk_id', $this->produk_id);
          $stmt->bindParam(':gambar', $this->gambar);

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
                                SET produk_id = :produk_id, gambar = :gambar
                                WHERE id = :id';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Clean data
          $this->produk_id = htmlspecialchars(strip_tags($this->produk_id));
          $this->gambar = htmlspecialchars(strip_tags($this->gambar));
          $this->id = htmlspecialchars(strip_tags($this->id));

          // Bind data
          $stmt->bindParam(':produk_id', $this->produk_id);
          $stmt->bindParam(':gambar', $this->gambar);
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