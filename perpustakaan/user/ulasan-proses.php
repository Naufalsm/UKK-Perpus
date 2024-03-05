<?php
include '../koneksi.php';
$userid = $_POST['userid'];
$bukuid = $_POST['bukuid'];
$ulsn = $_POST['ulasan'];
$rating = $_POST['rating'];

$query = "INSERT INTO ulasanbuku (userid, bukuid, ulasan, rating) VALUES ('$userid','$bukuid','$ulsn','$rating')";
$result = mysqli_query($connect, $query);

if ($result) {
    echo '<script>
    alert("Menambahkan Ulasan Berhasil");
    window.location="ulasan.php";
    </script>';
} else {
    echo "Error: " . $query . "<br>" . mysqli_error($connect);
}

mysqli_close($connect);
?>
