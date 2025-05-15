<?php
require('db.php'); 

$username = $_POST['username'];
$password = $_POST['password'];
$sql = "Select * from users where username = '".$username."' AND password = md5('".$password."')";
$result = mysqli_query($db, $sql);
$count = mysqli_num_rows($result);
if($count==1){
    echo json_encode("Success");
}
else{
    echo json_encode("Error");
}
?>
