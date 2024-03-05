<?php
include '../koneksi.php';
$id_ulasan = $_POST['id_ulasan'];
$userid = $_POST['userid'];
$bukuid = $_POST['bukuid'];
$ulasan = $_POST['ulasan'];
$rating = $_POST['rating'];
$query = "CALL ubahulasan('$id_ulasan','$userid','$bukuid','$ulasan','$rating')";
mysqli_query($connect,$query);
echo '<script>
alert("Data Berhasil di Ganti");
window.location="ulasan.php";
</script>';
?>