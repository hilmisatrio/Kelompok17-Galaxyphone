<?php 
  class Admin {
    // DB stuff
    private $conn;
    private $table = 'Admin';

    // Post Properties
    public $id;
    public $nama;
    public $username;
    public $password;

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
           $this->username = $row['username'];
           $this->password = $row['password'];
          
    }

    // Create Post
    public function create() {
          // Create query
          $query = 'INSERT INTO ' . $this->table . ' SET nama = :nama, username = :username, password = :password';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Clean data
          $this->nama = htmlspecialchars(strip_tags($this->nama));
          $this->username = htmlspecialchars(strip_tags($this->username));
          $this->password= htmlspecialchars(strip_tags($this->password));

          // Bind data
          $stmt->bindParam(':nama', $this->nama);
          $stmt->bindParam(':username', $this->username);
          $stmt->bindParam(':password', $this->password);

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
                                SET nama = :nama, username = :username, password = :password
                                WHERE id = :id';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Clean data
          $this->nama = htmlspecialchars(strip_tags($this->nama));
          $this->username = htmlspecialchars(strip_tags($this->username));
          $this->password = htmlspecialchars(strip_tags($this->password));
          $this->id = htmlspecialchars(strip_tags($this->id));

          // Bind data
          $stmt->bindParam(':nama', $this->nama);
          $stmt->bindParam(':username', $this->username);
          $stmt->bindParam(':password', $this->password);
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