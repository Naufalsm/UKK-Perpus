<?php
include '../koneksi.php';
$peminjamanid = $_POST['peminjamanid'];
$userid = $_POST['userid'];
$bukuid = $_POST['bukuid'];
$tglpeminjaman = $_POST['tglpeminjaman'];
$tglpengembalian = $_POST['tglpengembalian'];
$jumlah = $_POST['jumlah'];
$statuspeminjaman = $_POST['statuspeminjaman'];
$query = "CALL pengembalianbuku('$peminjamanid','$userid','$bukuid','$tglpeminjaman','$tglpengembalian','$jumlah','$statuspeminjaman')";
mysqli_query($connect,$query);
echo '<script>
alert("Pengembalian Buku Berhasil");
window.location="pinjam.php";
</script>';
?>