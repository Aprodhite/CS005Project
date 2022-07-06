<?php
include('../../Database/db.php'); 
include '../handler/error.php';
session_start();
if (!isset($_SESSION["userid"]) ||(trim ($_SESSION["userid"]) == '')) {
    header('location: ../index.php');
    exit();
}else{
     $id = $_SESSION["userid"];
}
  if (isset($_POST['submit'])) {	

    $profileImageName = $_FILES["profileImage"]["name"];
    $target_dir = 'C:/xampp/htdocs/myapp/CS005Project/assets/images/';
    $target_file = $target_dir . basename($profileImageName);

    if($_FILES['profileImage']['size'] > 200000) {
     header("location: ../main.php?error= SizeError");
    }

    if(file_exists($target_file)) {
      header("location: ../main.php?error= FileExists");
     
    }
      if(move_uploaded_file($_FILES["profileImage"]["tmp_name"], $target_file)) {
        $sql = "INSERT INTO user_img(img,userid) VALUES ('$profileImageName','$id')";
        if(mysqli_query($conn, $sql)){
        header("location: ../main.php?msg = UploadedImage");
        } else {
       header("location: ../main.php?error= ErrorDatabase");
        }
      } else {
      header("location: ../main.php?error= ErrorUploading");
      }
  }
?>

