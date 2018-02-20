<!-- FINAL PROJECT: TEAM MAKE SMART:  -->
<!-- STUDENTS Pavlos Papadonikolakis, Jake McGhee, Maco Doussias -->
<!-- CLASS CST363 -- >
<!-- NOTE TO PROFESSOR:  database used is for a zoo-->

<!-- deleteAnimal.php FILE-->
<?php 
// retrieve user data from form in animal.php   
$animal_id= $_POST["animal_id"];
 
$host = "localhost";
$user = "root";
$password = "temp";
$database = "zoo";
$port = 3306;
// create connection to database
$conn = new mysqli($host, $user, $password, $database, $port);
if ($conn->connect_errno) {
    exit ("Failed to connect: (" . $conn->connect_errno . ") " . $conn->connect_error );
}

//TODO need to guard against injection attacks
// delete the record 
$sqli = "DELETE FROM animal WHERE animal_id =".$animal_id; //Delete record
$stmti = $conn->prepare($sqli);

if (!$stmti->execute()) {   //TODO need a better error check for when record is not there to be deleted
    exit ("Error.  Unable to DELETE record.  Check that record exists!" . $conn->error);
}
// commit transaction and close connection
$conn->commit();
$conn->close();

?>

<html>
  <body>

  <!-- Below style tag makes the color for the background of the page -->
  <style>
	body {
    		background-color: darkkhaki;
	}
  </style>

  <h1 style="text-align:center;font-family:tahoma;border:10px outset forestgreen; color:yellow"> 
  RECORD HAS BEEN DELETED CORRECTLY!</h1>

    <!-- BUTTON TO RETURN TO animal.php page -->  
	<form action="animal.php">
    	<input type="submit" value="PRESS TO RETURN" />
	</form>

  </html>
