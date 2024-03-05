<?php
include '../koneksi.php';

// Pastikan variabel POST terdefinisi
if(isset($_POST['userid']) && isset($_POST['bukuid'])) {
    $userid = $_POST['userid'];
    $bukuid = $_POST['bukuid'];
    
    // Query untuk memasukkan data ke dalam tabel
    $query = "INSERT INTO koleksipribadi (userid, bukuid) VALUES ('$userid','$bukuid')";
    
    // Eksekusi query
    if(mysqli_query($connect, $query)) {
        // Redirect ke halaman favorite.php setelah berhasil
        echo '<script>alert("Berhasil Ditambahkan Ke Favorite"); window.location="favorite.php";</script>';
    } else {
        // Tampilkan pesan kesalahan jika query gagal dieksekusi
        echo "Error: " . $query . "<br>" . mysqli_error($connect);
    }
} else {
    // Tampilkan pesan jika variabel POST tidak terdefinisi
    echo "Variabel POST tidak terdefinisi.";
}
