<?php
header('Access-Control-Allow-Origin: *');
//mysql_connect('localhost','root','');
$conn = new mysqli("localhost", "root", "", "olympic");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$id = $_POST['id'];
 $query="insert into newsletter (EmailId) values ('$id')";
 $result = $conn->query($query);

if($result)
{
	   $message = "success";
	 echo json_encode( $message );
}
else
{
	 $message = "failure";
	 echo json_encode( $message );
}
$conn->close();
?>