<?php
include '../koneksi.php';

// Memeriksa apakah data yang dibutuhkan ada atau tidak
if(empty($_POST['judul']) || empty($_POST['kategoriid']) || empty($_POST['penulis']) || empty($_POST['penerbit']) || empty($_POST['tahunterbit']) || empty($_POST['stok']) || empty($_FILES['gambar'])) {
    echo '<script>alert("Mohon lengkapi semua kolom"); window.history.back(); </script>';
    exit;
}

$judul = $_POST['judul'];
$kategoriid = $_POST['kategoriid'];
$penulis = $_POST['penulis'];
$penerbit = $_POST['penerbit'];
$tahunterbit = $_POST['tahunterbit'];
$stok = $_POST['stok'];

$namafoto = $_FILES['gambar']['name'];
$ukuranfoto = $_FILES['gambar']['size'];
$tipefoto = $_FILES['gambar']['type'];
$tmp = $_FILES['gambar']['tmp_name'];

$acc = ['image/png','image/jpeg','image/jpg'];
if (!in_array($tipefoto,$acc)){
    echo '<script>alert("Hanya file PNG, JPG, dan JPEG yang diperbolehkan"); window.history.back(); </script>';
    exit;
}
$size = 2 * 1024 *1024; // 2 MB
if($ukuranfoto > $size){
    echo '<script>alert("Maaf, ukuran file Anda terlalu besar. Maksimum 2 MB"); window.history.back(); </script>';
    exit;
}

$lokasifoto = '../assets/img/' . $namafoto;
if(!move_uploaded_file($tmp, $lokasifoto)) {
    echo '<script>alert("Gagal mengunggah file"); window.history.back(); </script>';
    exit;
}

$query = "INSERT INTO buku (judul, kategoriid, penulis, penerbit, tahunterbit, stok, gambar) 
VALUES ('$judul', '$kategoriid', '$penulis', '$penerbit', '$tahunterbit', '$stok', '$lokasifoto')";

$sql = mysqli_query($connect, $query);
if ($sql) {
    echo '<script>alert("Menambahkan Buku Berhasil"); window.location="buku.php"; </script>';
} else {
    echo '<script>alert("Menambahkan Buku Gagal: ' . mysqli_error($connect) . '"); window.history.back(); </script>';
}


// Tutup koneksi
mysqli_close($connect);
?>
