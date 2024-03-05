<?php
session_start();
if ($_SESSION['level'] == "") {
  header("Location: ./login.php");
}
$userid = $_SESSION['userid'];
?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <title>Perpustakaan Digital</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<style>
  * {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: sans-serif;
  }

  body {
    display: flex;
    height: 100vh;
    justify-content: center;
    align-items: center;
    background: #343a40;
    background-size: cover;
  }

  .container {
    width: 100%;
    max-width: 650px;
    background-color: rgba(0, 0, 0, .25);
    padding: 28px;
    margin: 0 28px;
    border-radius: 10px;
    box-shadow: inset -2px 2px 2px white;
  }

  .form-title {
    font-size: 26px;
    font-weight: 600;
    text-align: center;
    padding-bottom: 6px;
    color: white;
    text-shadow: 2px 2px 2px black;
    border-bottom: solid 1px white;
  }

  .main-user-info {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    padding: 20px 0;
  }

  .user-input-box:nth-child(2n) {
    justify-content: end;
  }

  .user-input-box {
    display: flex;
    flex-wrap: wrap;
    width: 50%;
    padding-bottom: 15px;
  }

  .user-input-box label {
    width: 95%;
    color: white;
    font-size: 20px;
    font-weight: 400;
    margin: 5px 0;
  }

  .user-input-box input {
    height: 40px;
    width: 95%;
    border-radius: 7px;
    outline: none;
    border: 1px solid grey;
    padding: 0 10px;
  }

  .gender-title {
    color: white;
    font-size: 24px;
    font-weight: 600;
    border-bottom: 1px solid white;
  }

  .gender-category {
    margin: 15px 0;
    color: white;
  }

  .gender-category label {
    padding: 0 20px 0 5px;
  }

  .gender-category label,
  .gender-category input,
  .form-submit-btn input {
    cursor: pointer;
  }

  .form-submit-btn {
    margin-top: 40px;
  }

  .form-submit-btn input {
    display: block;
    width: 100%;
    margin-top: 10px;
    font-size: 20px;
    padding: 10px;
    border: none;
    border-radius: 3px;
    color: #fff;
    background-color: #28a745;
  }

  .form-submit-btn input:hover {
    background: rgba(56, 204, 93, 0.7);
    color: rgb(255, 255, 255);
  }

  @media(max-width: 600px) {
    .container {
      min-width: 280px;
    }

    .user-input-box {
      margin-bottom: 12px;
      width: 100%;
    }

    .user-input-box:nth-child(2n) {
      justify-content: space-between;
    }

    .gender-category {
      display: flex;
      justify-content: space-between;
      width: 100%;
    }

    .main-user-info {
      max-height: 380px;
      overflow: auto;
    }

    .main-user-info::-webkit-scrollbar {
      width: 0;
    }
  }
</style>

<body>
  <div class="container">
    <h1 class="form-title">Pinjam Buku</h1>
    <form action="pinjam-proses.php" method="POST">
      <?php
      include '../koneksi.php';
      $id = $_GET['id'];
      $query = mysqli_query($connect, "SELECT * FROM buku WHERE bukuid=$id") or die(mysqli_connect_error());
      while ($pinjam = mysqli_fetch_array($query)) {
      ?>
        <br>
        <center>
          <img src="<?php echo $pinjam['gambar']; ?>" alt="Gambar Buku" style="width: 100px;">
        </center>
        <div class="main-user-info">
          <div class="user-input-box">
            <label for="fullName">Judul</label>
            <input type="text" id="fullName" name="judul" value="<?php echo $pinjam['judul'] ?>" readonly />
          </div>
          <div class="user-input-box">
            <label for="username">Penulis</label>
            <input type="text" id="username" name="penulis" value="<?php echo $pinjam['penulis'] ?>" readonly />
          </div>
          <div class="user-input-box">
            <label for="email">Penerbit</label>
            <input type="text" id="email" name="penerbit" value="<?php echo $pinjam['penerbit'] ?>" readonly />
          </div>
          <div class="user-input-box">
            <label for="phoneNumber">Tahun Terbit</label>
            <input type="text" id="phoneNumber" name="tahun" value="<?php echo $pinjam['tahunterbit'] ?>" readonly />
          </div>
          <div class="user-input-box">
            <label for="password">Jumlah Pinjam</label>
            <input type="number" id="password" name="stok" value="<?php echo $pinjam['stok'] ?>" />
          </div>
          <div class="user-input-box">
            <label for="confirmPassword">Tanggal Pinjam</label>
            <input type="date" id="tanggal" name="tglpeminjaman" readonly />
            <input type="date" name="tglpengembalian" hidden="hidden" readonly />
            <input type="hidden" value="konfirmasi" name="statuspeminjaman" readonly />
            <input type="hidden" name="userid" value="<?php echo $userid ?>" readonly />
            <input type="hidden" name="bukuid" value="<?php echo $pinjam['bukuid'] ?>" readonly />
            <input type="hidden" value="<?php echo $pinjam['stok'] ?>" name="jumlah" readonly />
          </div>
        </div>
        <div class="form-submit-btn">
          <input type="submit" value="Pinjam">
        </div>
    </form>
    <br>
    <a href="buku.php" style="text-decoration: none; color: #fff;">Kembali</a>

    <script>
      // Fungsi untuk mendapatkan tanggal sekarang dalam format YYYY-MM-DD
      function getFormattedDate() {
        const now = new Date();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const day = String(now.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
      }

      // Fungsi untuk mengatur nilai input tanggal secara otomatis
      function updateDate() {
        const tanggalInput = document.getElementById('tanggal');
        tanggalInput.value = getFormattedDate();
      }

      // Panggil fungsi pertama kali
      updateDate();

      // Atur interval agar tanggal diperbarui setiap hari
      setInterval(updateDate, 24 * 60 * 60 * 1000); // 24 jam * 60 menit * 60 detik * 1000 milidetik
    </script>
  </div>
<?php
      }
?>
</body>

</html>