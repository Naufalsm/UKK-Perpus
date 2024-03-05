<?php
include '../koneksi.php';
$id = $_GET['id'];
$query = "CALL hapusfavorite('$id')";
mysqli_query($connect,$query);
echo '<script>
alert("Koleksi Berhasil di Hapus");
window.location="favorite.php";
</script>';
