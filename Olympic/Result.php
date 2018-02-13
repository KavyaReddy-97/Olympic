<?php


header('Access-Control-Allow-Origin: *');
//mysql_connect('localhost','root','');
$conn = new mysqli("localhost", "root", "", "olympic");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
    
//mysql_select_db('olympic');

$Olympic = $_POST['oly'];
$Sport = $_POST['sports'];
//$Olympic=5;
//$Sport=1;
$json = array();

//{
   $query = "select o.location,c.Cname,r.Rank, a.Name from results r join olympic_venue o on r.Olympic_id = o.Olympic_Id join sports s on r.Sports_id = s.sports_id join athletes a on r.Athletes_id = a.Athletes_Id JOIN country c on c.Country_id=r.Country_Id ".
   " where o.Olympic_Id =". $Olympic. " and s.sports_id =". $Sport;
	//expecting one row 
    //echo $query;
   $result = $conn->query($query);
   while( $message = $result->fetch_assoc())
   {
       $json[] = $message; 
	   //echo $message['Cname'];
   }
    echo json_encode( $json );
	//echo ($json);
//}

$conn->close();
?>