<?php
header('Access-Control-Allow-Origin: *');
//mysql_connect('localhost','root','');
$conn = new mysqli("localhost", "root", "", "olympic");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
    
//mysql_select_db('olympic');

$id = $_POST['id'];
//$id=1;
$json = array();

    //$query = "select * from country where Country_id = ". $id;
	$result = $conn->query("CALL getSportsdetails($id)");
    while($message = $result->fetch_assoc())
	{
		//echo $message['Country'];
		$json[] = $message;
	}
 echo json_encode( $json );
$conn->close();
?>