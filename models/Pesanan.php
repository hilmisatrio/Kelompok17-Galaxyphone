<?php
class Pesanan
{
    // DB stuff
    private $conn;
    private $table = 'Pesanan';

    // Post Properties
    public $id;
    public $pelanggan_id;
    public $jumlah_biaya;
    public $alamat_pengiriman;
    public $tanggal_pemesanan;
    public $metode_pembayaran;

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
        $this->pelanggan_id = $row['pelanggan_id'];
        $this->jumlah_biaya = $row['jumlah_biaya'];
        $this->alamat_pengiriman = $row['alamat_pengiriman'];
        $this->tanggal_pemesanan = $row['tanggal_pemesanan'];
        $this->metode_pembayaran = $row['metode_pembayaran'];
    }

    // Create Post
    public function create()
    {
        // Create query
        $query = 'INSERT INTO ' . $this->table . ' SET pelanggan_id = :pelanggan_id, jumlah_biaya = :jumlah_biaya, alamat_pengiriman = :alamat_pengiriman, tanggal_pemesanan = :tanggal_pemesanan, metode_pembayaran = :metode_pembayaran';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
        $this->pelanggan_id = htmlspecialchars(strip_tags($this->pelanggan_id));
        $this->jumlah_biaya = htmlspecialchars(strip_tags($this->jumlah_biaya));
        $this->alamat_pengiriman = htmlspecialchars(strip_tags($this->alamat_pengiriman));
        $this->tanggal_pemesanan = htmlspecialchars(strip_tags($this->tanggal_pemesanan));
        $this->metode_pembayaran = htmlspecialchars(strip_tags($this->metode_pembayaran));

        // Bind data
        $stmt->bindParam(':pelanggan_id', $this->pelanggan_id);
        $stmt->bindParam(':jumlah_biaya', $this->jumlah_biaya);
        $stmt->bindParam(':alamat_pengiriman', $this->alamat_pengiriman);
        $stmt->bindParam(':tanggal_pemesanan', $this->tanggal_pemesanan);
        $stmt->bindParam(':metode_pembayaran', $this->metode_pembayaran);

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
                                SET pelanggan_id = :pelanggan_id, jumlah_biaya = :jumlah_biaya, alamat_pengiriman = :alamat_pengiriman, tanggal_pemesanan = :tanggal_pemesanan, metode_pembayaran = :metode_pembayaran
                                WHERE id = :id';

        // Prepare statement
        $stmt = $this->conn->prepare($query);

        // Clean data
       
        $this->pelanggan_id = htmlspecialchars(strip_tags($this->pelanggan_id));
        $this->jumlah_biaya = htmlspecialchars(strip_tags($this->jumlah_biaya));
        $this->alamat_pengiriman = htmlspecialchars(strip_tags($this->alamat_pengiriman));
        $this->tanggal_pemesanan = htmlspecialchars(strip_tags($this->tanggal_pemesanan));
        $this->metode_pembayaran = htmlspecialchars(strip_tags($this->metode_pembayaran));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Bind data
        $stmt->bindParam(':pelanggan_id', $this->pelanggan_id);
        $stmt->bindParam(':jumlah_biaya', $this->jumlah_biaya);
        $stmt->bindParam(':alamat_pengiriman', $this->alamat_pengiriman);
        $stmt->bindParam(':tanggal_pemesanan', $this->tanggal_pemesanan);
        $stmt->bindParam(':metode_pembayaran', $this->metode_pembayaran);
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
