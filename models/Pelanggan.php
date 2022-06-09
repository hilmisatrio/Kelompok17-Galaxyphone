<?php
class Pelanggan
{
    // DB stuff
    private $conn;
    private $table = 'Pelanggan';

    // Post Properties
    public $id;
    public $email;
    public $password;
    public $nama_lengkap;
    public $alamat_pengiriman;
    public $no_hp;

    // Constructor with DB
    public function __construct($db)
    {
        $this->conn = $db;
    }

    // Get Posts
    public function read()
    {
        // Create query

        $query = 'SELECT * FROM ' . $this->table . ' ORDER BY Id';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Execute query
        $stmt->execute();

        return $stmt;
    }

    // Get Single Post
    public function read_single()
    {
        // Create query
        $query = 'SELECT * FROM ' . $this->table . ' WHERE email = ?';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Bind ID
        $stmt->bindParam(1, $this->email);

        // Execute query
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // Set properties
        $this->id = $row['id'];
        $this->email = $row['email'];
        $this->password = $row['password'];
        $this->nama_lengkap = $row['nama_lengkap'];
        $this->alamat_pengiriman = $row['alamat_pengiriman'];
        $this->no_hp = $row['no_hp'];
    }

    // Create Post
    public function create()
    {
        // Create query
        $query = 'INSERT INTO ' . $this->table . ' SET email = :email, password = :password, nama_lengkap = :nama_lengkap, alamat_pengiriman = :alamat_pengiriman, no_hp = :no_hp';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
        $this->email = htmlspecialchars(strip_tags($this->email));
        $this->password = htmlspecialchars(strip_tags($this->password));
        $this->nama_lengkap = htmlspecialchars(strip_tags($this->nama_lengkap));
        $this->alamat_pengiriman = htmlspecialchars(strip_tags($this->alamat_pengiriman));
        $this->no_hp = htmlspecialchars(strip_tags($this->no_hp));

        // Bind data
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':password', $this->password);
        $stmt->bindParam(':nama_lengkap', $this->nama_lengkap);
        $stmt->bindParam(':alamat_pengiriman', $this->alamat_pengiriman);
        $stmt->bindParam(':no_hp', $this->no_hp);

        // Execute query
    if ($stmt->execute()){
            return true;
        }

        // Print error if something goes wrong
        printf("Error: %s.\n", $stmt->error);

        return false;
    }

    // Update Post
    public function update()
    {
        // Create query
        $query = 'UPDATE ' . $this->table . '
                                SET email = :email, password = :password, nama_lengkap = :nama_lengkap, alamat_pengiriman = :alamat_pengiriman, no_hp = :no_hp
                                WHERE id = :id';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
       
        $this->email = htmlspecialchars(strip_tags($this->email));
        $this->password = htmlspecialchars(strip_tags($this->password));
        $this->nama_lengkap = htmlspecialchars(strip_tags($this->nama_lengkap));
        $this->alamat_pengiriman = htmlspecialchars(strip_tags($this->alamat_pengiriman));
        $this->no_hp = htmlspecialchars(strip_tags($this->no_hp));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Bind data
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':password', $this->password);
        $stmt->bindParam(':nama_lengkap', $this->nama_lengkap);
        $stmt->bindParam(':alamat_pengiriman', $this->alamat_pengiriman);
        $stmt->bindParam(':no_hp', $this->no_hp);
        $stmt->bindParam(':id', $this->id);

        // Execute query
        if ($stmt->execute()) {
            return true;
        }

        // Print error if something goes wrong
        printf("Error: %s.\n", $stmt->error);

        return false;
    }

    // Delete Post
    public function delete()
    {
        // Create query
        $query = 'DELETE FROM ' . $this->table . ' WHERE no_hp = :no_hp';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
        $this->no_hp = htmlspecialchars(strip_tags($this->no_hp));

        // Bind data
        $stmt->bindParam(':no_hp', $this->no_hp);

        // Execute query
        if ($stmt->execute()) {
            return true;
        }

        // Print error if something goes wrong
        printf("Error: %s.\n", $stmt->error);

        return false;
    }
}
