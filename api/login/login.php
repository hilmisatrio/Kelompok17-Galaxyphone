<?php
$conn = new mysqli('localhost','root','','galaxyphone');
if ($conn->connect_error) {
    die('Error : ('. $conn->connect_errno .') '. $conn->connect_error);
}
session_start();
 
$out = array('error' => false);
 
$email = $_POST['email'];
$password = $_POST['password'];
 
if($email==''){
    $out['error'] = true;
    $out['message'] = "email is required";
}
else if($password==''){
    $out['error'] = true;
    $out['message'] = "Password is required";
}
else{
    $sql = "select * from pelanggan where email='$email' and password='$password'";
    $query = $conn->query($sql);
 
    if($query->num_rows>0){
        $row=$query->fetch_array();
        $_SESSION['user']=$row['id'];
        $out['message'] = "Login Successful";
    }
    else{
        $out['error'] = true;
        $out['message'] = "Login Failed. User not Found";
    }
}
     
$conn->close();
 
header("Content-type: application/json");
echo json_encode($out);
die();