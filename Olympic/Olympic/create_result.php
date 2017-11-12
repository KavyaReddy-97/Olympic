<?php


header('Access-Control-Allow-Origin: *');
//mysql_connect('localhost','root','');
try {
$conn = new mysqli("localhost", "root", "", "olympic");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

 $query = "create table Results (
 	Olympic_id int ,
	Sports_id int,
	Athletes_id int,
	Rank char(20) not null,
	primary key(Olympic_id,Sports_id,Athletes_id),
	FOREIGN key(Olympic_id) REFERENCES olympic_venue(Olympic_Id),
	FOREIGN key(Sports_id) REFERENCES sports(sports_id),
	FOREIGN key(Athletes_id) REFERENCES athletes(Athletes_Id)
 )";
$result = $conn->query($query);	
    echo "Created Successfull";
    }
catch(mysqliException $e)
    {
    echo $sql . "<br>" . $e->getMessage();
    }

$conn = null;
?>