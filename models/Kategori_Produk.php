<?php
class Kategori_Produk
{
    // DB stuff
    private $conn;
    private $table = 'Kategori_Produk';

    // Post Properties
    public $id;
    public $produk_id;
    public $kategori_id;
    public $nama_produk;
    public $type_produk;
    public $merek_produk;
    public $harga_produk;
    public $gambar_utama_produk;
    public $hasil_penjualan_produk;

    // Constructor with DB
    public function __construct($db)
    {
        $this->conn = $db;
    }

    // Get Posts
    public function read()
    {
        // Create query

        $query = 'SELECT kategori_produk.id as id, kategori_produk.produk_id as produk_id, kategori_produk.kategori_id as kategori_id,
                                 produk.nama as nama_produk, produk.harga as harga_produk, produk.gambar_utama as gambar_utama_produk, produk.hasil_penjualan as hasil_penjualan_produk, kategori.type as type_produk, kategori.merek as merek_produk FROM ((' . $this->table . ' INNER JOIN produk 
                                ON kategori_produk.produk_id = produk.id) INNER JOIN kategori ON kategori_produk.kategori_id = kategori.id) where kategori_id = ? ;';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Bind ID
        $stmt->bindParam(1, $this->id);

        // Execute query
        $stmt->execute();

        return $stmt;
    }

    // Get Single Post
    public function read_single()
    {
        // Create query
        $query = 'SELECT kategori_produk.id as id, kategori_produk.produk_id as produk_id, kategori_produk.kategori_id as kategori_id,
                                    produk.nama as nama_produk, produk.harga as harga_produk, kategori.type as type_produk, kategori.merek as merek_produk FROM 
                                    ((' . $this->table . ' INNER JOIN produk 
                                   ON kategori_produk.produk_id = produk.id) INNER JOIN kategori ON kategori_produk.kategori_id = kategori.id) WHERE
                                   kategori_produk.id = ?
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
        $this->kategori_id = $row['kategori_id'];
        $this->nama_produk = $row['nama_produk'];
        $this->type_produk = $row['type_produk'];
        $this->merek_produk = $row['merek_produk'];
        $this->harga_produk = $row['harga_produk'];
    }

    // Create Post
    public function create()
    {
        // Create query
        $query = 'INSERT INTO ' . $this->table . ' SET produk_id = :produk_id, kategori_id = :kategori_id';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
        $this->produk_id = htmlspecialchars(strip_tags($this->produk_id));
        $this->kategori_id = htmlspecialchars(strip_tags($this->kategori_id));

        // Bind data
        $stmt->bindParam(':produk_id', $this->produk_id);
        $stmt->bindParam(':kategori_id', $this->kategori_id);

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
                                SET produk_id = :produk_id, kategori_id = :kategori_id
                                WHERE id = :id';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
        $this->produk_id = htmlspecialchars(strip_tags($this->produk_id));
        $this->kategori_id = htmlspecialchars(strip_tags($this->kategori_id));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Bind data
        $stmt->bindParam(':produk_id', $this->produk_id);
        $stmt->bindParam(':kategori_id', $this->kategori_id);
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
