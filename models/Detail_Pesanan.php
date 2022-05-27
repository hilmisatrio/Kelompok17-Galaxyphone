<?php
class Detail_Pesanan
{
    // DB stuff
    private $conn;
    private $table = 'Detail_Pesanan';

    // Post Properties
    public $id;
    public $pesanan_id;
    public $produk_id;
    public $harga;
    public $kuantitas;

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
        $query = 'SELECT * FROM ' . $this->table . ' WHERE Id = ?';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Bind ID
        $stmt->bindParam(1, $this->id);

        // Execute query
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // Set properties
        $this->pesanan_id = $row['pesanan_id'];
        $this->produk_id = $row['produk_id'];
        $this->harga = $row['harga'];
        $this->kuantitas = $row['kuantitas'];
    }

    // Create Post
    public function create()
    {
        // Create query
        $query = 'INSERT INTO ' . $this->table . ' SET pesanan_id = :pesanan_id, produk_id = :produk_id, harga = :harga, kuantitas = :kuantitas';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
        $this->pesanan_id = htmlspecialchars(strip_tags($this->pesanan_id));
        $this->produk_id = htmlspecialchars(strip_tags($this->produk_id));
        $this->harga = htmlspecialchars(strip_tags($this->harga));
        $this->kuantitas = htmlspecialchars(strip_tags($this->kuantitas));

        // Bind data
        $stmt->bindParam(':pesanan_id', $this->pesanan_id);
        $stmt->bindParam(':produk_id', $this->produk_id);
        $stmt->bindParam(':harga', $this->harga);
        $stmt->bindParam(':kuantitas', $this->kuantitas);

        // Execute query
        if ($stmt->execute()) {
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
                                SET pesanan_id = :pesanan_id, produk_id = :produk_id, harga = :harga, kuantitas = :kuantitas
                                WHERE id = :id';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
       
        $this->pesanan_id = htmlspecialchars(strip_tags($this->pesanan_id));
        $this->produk_id = htmlspecialchars(strip_tags($this->produk_id));
        $this->harga = htmlspecialchars(strip_tags($this->harga));
        $this->kuantitas = htmlspecialchars(strip_tags($this->kuantitas));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Bind data
        $stmt->bindParam(':pesanan_id', $this->pesanan_id);
        $stmt->bindParam(':produk_id', $this->produk_id);
        $stmt->bindParam(':harga', $this->harga);
        $stmt->bindParam(':kuantitas', $this->kuantitas);
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
        $query = 'DELETE FROM ' . $this->table . ' WHERE id = :id';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Bind data
        $stmt->bindParam(':id', $this->id);

        // Execute query
        if ($stmt->execute()) {
            return true;
        }

        // Print error if something goes wrong
        printf("Error: %s.\n", $stmt->error);

        return false;
    }
}
