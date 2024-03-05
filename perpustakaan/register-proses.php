<?php
include 'koneksi.php';

// Check connection
if (mysqli_connect_errno()) {
    echo "Koneksi database gagal: " . mysqli_connect_error();
    exit();
}

// Lanjutkan proses
$username = $_POST['username'];
$password = md5($_POST['password']);
$email = $_POST['email'];
$namalengkap = $_POST['namalengkap'];
$no_hp = $_POST['no_hp'];
$alamat = $_POST['alamat'];
$level = $_POST['level'];

$query = "INSERT INTO user (username, password, email, namalengkap, no_hp, alamat, level) VALUES ('$username', '$password', '$email', '$namalengkap', '$no_hp', '$alamat', '$level')";
if (mysqli_query($connect, $query)) {
    echo '<script>
    alert("Register Anda Berhasil");
    window.location="login.php";
    </script>';
} else {
    echo "Error: " . $query . "<br>" . mysqli_error($connect);
}

mysqli_close($connect);
?>
