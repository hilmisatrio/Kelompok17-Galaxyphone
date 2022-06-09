<?php
class Keranjang_Info
{
    // DB stuff
    private $conn;
    private $table = 'Keranjang';

    // Post Properties
    public $id;
    public $pelanggan_id;
    public $produk_id;
    public $nama;
    public $harga;
    public $jumlah;
    public $total_harga;
    public $gambar_utama;
    public $total;

    // Constructor with DB
    public function __construct($db)
    {
        $this->conn = $db;
    }

    // Get Posts
    public function read()
    {
        // Create query

        $query = 'SELECT SUM(total_harga) as total FROM ' . $this->table . ' WHERE pelanggan_id = ?';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1, $this->pelanggan_id);


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
        $this->id = $row['id'];
        $this->pelanggan_id = $row['pelanggan_id'];
        $this->produk_id = $row['produk_id'];
        $this->nama = $row['nama'];
        $this->harga = $row['harga'];
        $this->jumlah = $row['jumlah'];
        $this->total_harga = $row['total_harga'];
        $this->gambar_utama = $row['gambar_utama'];
    }

    // Create Post
    public function create()
    {
        // Create query
        $query = 'INSERT INTO ' . $this->table . ' SET pelanggan_id = :pelanggan_id, produk_id = :produk_id, nama = :nama, harga = :harga, jumlah = :jumlah, total_harga = :total_harga, gambar_utama = :gambar_utama';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
        $this->pelanggan_id = htmlspecialchars(strip_tags($this->pelanggan_id));
        $this->produk_id = htmlspecialchars(strip_tags($this->produk_id));
        $this->nama = htmlspecialchars(strip_tags($this->nama));
        $this->harga = htmlspecialchars(strip_tags($this->harga));
        $this->jumlah = htmlspecialchars(strip_tags($this->jumlah));
        $this->total_harga = htmlspecialchars(strip_tags($this->total_harga));
        $this->gambar_utama = htmlspecialchars(strip_tags($this->gambar_utama));

        // Bind data
        $stmt->bindParam(':pelanggan_id', $this->pelanggan_id);
        $stmt->bindParam(':produk_id', $this->produk_id);
        $stmt->bindParam(':nama', $this->nama);
        $stmt->bindParam(':harga', $this->harga);
        $stmt->bindParam(':jumlah', $this->jumlah);
        $stmt->bindParam(':total_harga', $this->total_harga);
        $stmt->bindParam(':gambar_utama', $this->gambar_utama);

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
                                SET pelanggan_id = :pelanggan_id, produk_id = :produk_id, nama = :nama, harga = :harga, jumlah = :jumlah, total_harga = :total_harga, gambar_utama = :gambar_utama
                                WHERE id = :id';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
       
        $this->pelanggan_id = htmlspecialchars(strip_tags($this->pelanggan_id));
        $this->produk_id = htmlspecialchars(strip_tags($this->produk_id));
        $this->nama = htmlspecialchars(strip_tags($this->nama));
        $this->harga = htmlspecialchars(strip_tags($this->harga));
        $this->jumlah = htmlspecialchars(strip_tags($this->jumlah));
        $this->total_harga = htmlspecialchars(strip_tags($this->total_harga));
        $this->gambar_utama = htmlspecialchars(strip_tags($this->gambar_utama));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Bind data
        $stmt->bindParam(':pelanggan_id', $this->pelanggan_id);
        $stmt->bindParam(':produk_id', $this->produk_id);
        $stmt->bindParam(':nama', $this->nama);
        $stmt->bindParam(':harga', $this->harga);
        $stmt->bindParam(':jumlah', $this->jumlah);
        $stmt->bindParam(':total_harga', $this->total_harga);
        $stmt->bindParam(':gambar_utama', $this->tgambar_utama);
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
        $query = 'DELETE FROM ' . $this->table . ' WHERE pelanggan_id = ?';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
        $this->pelanggan_id = htmlspecialchars(strip_tags($this->pelanggan_id));

        // Bind data
        $stmt->bindParam(1, $this->pelanggan_id);

        // Execute query
        if ($stmt->execute()) {
            return true;
        }

        // Print error if something goes wrong
        printf("Error: %s.\n", $stmt->error);

        return false;
    }
}