<?php
require('db.php'); 
if(!$db){
    echo "Database connection failed";
}
$username = $_POST['username'];
$password = $_POST['password'];
$sql = "Select username from users where username = '".$username."'";
$result = mysqli_query($db, $sql);
$count = mysqli_num_rows($result);
if($count==1){
    echo json_encode("Error");
}
else{
    $insert = "INSERT INTO users(username,password) VALUES ('".$username."',md5('".$password."'))";
        $query = mysqli_query($db,$insert);
        if($query){
            echo json_encode("Success");
        }
}
?>
