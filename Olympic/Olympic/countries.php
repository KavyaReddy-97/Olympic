<?php
header('Access-Control-Allow-Origin: *');
//mysql_connect('localhost','root','');
$conn = new mysqli("localhost", "root", "", "olympic");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
    
//mysql_select_db('olympic');

$id = $_POST['id'];
$json = array();
if($id == '0')
{
   $query = "select * from country LIMIT 5";//expecting one row 
    
    $result = $conn->query($query);
   while( $message = $result->fetch_assoc())
   {
       $json[] = $message; 
   }
    echo json_encode( $json );
}
else
{
    $query = "select * from country where Country_id = ". $id;
    $result = $conn->query($query);
    $message = $result->fetch_assoc();
//expecting one row
    echo json_encode( $message );
}



//return $message;
//$result = mysql_query( $query );
//$message = mysql_fetch_assoc( $result ); //expecting just on row
////header('Content-Type: application/json');


$conn->close();
?>