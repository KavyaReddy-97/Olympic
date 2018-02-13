<?php
header('Access-Control-Allow-Origin: *');
//mysql_connect('localhost','root','');
$conn = new mysqli("localhost", "root", "", "olympic");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
    
//mysql_select_db('olympic');

$spo = $_POST['spo'];
$med = $_POST['med'];
$ath = $_POST['ath'];
//$spo =1;
//$med ="Silver";
//$ath ="Caroline Marin";
//$id=1;
$json = array();

	$result = $conn->query("CALL setResult($spo,'$med','$ath')");
	//echo json_encode( $result );
	echo $result;
//if($result)
//{
//	$query = "select * from athletes a join country c on a.Country_id = c.Country_id where a.Name ='".$ath."'";
//	$result1 = $conn->query($query);
//	$message = $result1->fetch_assoc();
//	//echo $message;
//	echo json_encode( $message );
//}
//else
//{
////	$return = false;
//	//echo json_encode( $result );
//	echo $result;
//}
//	// echo json_encode( $result );
//	
$conn->close();
?>