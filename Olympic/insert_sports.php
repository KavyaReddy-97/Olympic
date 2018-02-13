<?php


header('Access-Control-Allow-Origin: *');
//mysql_connect('localhost','root','');
try {
$conn = new mysqli("localhost", "root", "", "olympic");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

 $query = "insert into sports values (1,'BADMINTON'),(2,'ARCHERY'),(3,'TABLE TENNIS'),(4,'LUGE'),(5,'SKELETON')";
$result = $conn->query($query);	
    echo "Created Successfull";
    }
catch(mysqliException $e)
    {
    echo $sql . "<br>" . $e->getMessage();
    }

$conn = null;
?>