<?php 
  class Kategori {
    // DB stuff
    private $conn;
    private $table = 'Kategori';

    // Post Properties
    public $id;
    public $type;
    public $merek;
    public $deskripsi;

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
           $this->type = $row['type'];
           $this->merek = $row['merek'];
           $this->deskripsi = $row['deskripsi'];
          
    }

    // Create Post
    public function create() {
          // Create query
          $query = 'INSERT INTO ' . $this->table . ' SET type = :type, merek = :merek, deskripsi = :deskripsi';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Clean data
          $this->type = htmlspecialchars(strip_tags($this->type));
          $this->merek = htmlspecialchars(strip_tags($this->merek));
          $this->deskripsi = htmlspecialchars(strip_tags($this->deskripsi));

          // Bind data
          $stmt->bindParam(':type', $this->type);
          $stmt->bindParam(':merek', $this->merek);
          $stmt->bindParam(':deskripsi', $this->deskripsi);

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
                                SET type = :type, merek = :merek, deskripsi = :deskripsi
                                WHERE id = :id';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Clean data
          $this->type = htmlspecialchars(strip_tags($this->type));
          $this->merek = htmlspecialchars(strip_tags($this->merek));
          $this->deskripsi = htmlspecialchars(strip_tags($this->deskripsi));
          $this->id = htmlspecialchars(strip_tags($this->id));

          // Bind data
          $stmt->bindParam(':type', $this->type);
          $stmt->bindParam(':merek', $this->merek);
          $stmt->bindParam(':deskripsi', $this->deskripsi);
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