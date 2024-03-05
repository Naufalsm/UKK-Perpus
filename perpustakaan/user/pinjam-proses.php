<?php
session_start();
include '../koneksi.php';

// Sanitasi data dari form
$userid = mysqli_real_escape_string($connect, $_POST['userid']);
$bukuid = mysqli_real_escape_string($connect, $_POST['bukuid']);
$tglpeminjaman = mysqli_real_escape_string($connect, $_POST['tglpeminjaman']);
$tglpengembalian = mysqli_real_escape_string($connect, $_POST['tglpengembalian']);
$stok = mysqli_real_escape_string($connect, $_POST['stok']);
$statuspeminjaman = mysqli_real_escape_string($connect, $_POST['statuspeminjaman']);

// Mendapatkan kode pinjam terbaru
$kode = mysqli_query($connect,"SELECT MAX(SUBSTRING(kodepinjam,3)) as max_kode FROM peminjaman");
$sql = mysqli_fetch_array($kode);
$max_kode = $sql['max_kode'];
if($max_kode == null){
    $new_kode = 'PM001';
} else {
    $new_kode = 'PM' . str_pad($max_kode + 1, 3, '0', STR_PAD_LEFT);
}

// Memanggil stored procedure dengan parameter yang sesuai
$query = "INSERT INTO peminjaman (kodepinjam, userid, bukuid, tglpeminjaman, tglpengembalian, jumlah, statuspeminjaman) VALUES ('$new_kode','$userid','$bukuid','$tglpeminjaman','$tglpengembalian','$stok','$statuspeminjaman')";   
$result = mysqli_query($connect, $query);

// Periksa apakah query berhasil dijalankan
if ($result) {
    echo '<script>alert("Peminjaman Berhasil");window.location="pinjam.php";</script>';
} else {
    echo '<script>alert("Peminjaman Gagal: ' . mysqli_error($connect) . '");window.location="pinjam.php";</script>';
}

// Tutup koneksi
mysqli_close($connect);
