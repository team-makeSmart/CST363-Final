<!-- FINAL PROJECT: TEAM MAKE SMART:  -->
<!-- STUDENTS Pavlos Papadonikolakis, Jake McGhee, Maco Doussias -->
<!-- CLASS CST363 -- >
<!-- NOTE TO PROFESSOR:  database used is for a zoo-->

<!-- TODO need to guard against injection attacks -->
<!-- TODO need to display error message when user forgets to enter a date in the form from the animal.php page-->
<!-- insertAnimal.php FILE-->
<?php 
// retrieve user data from form in animal.php   
$animal_name= $_POST["animal_name"];
$dob = $_POST["dob"];
$sex = $_POST["sex"];
$exhibit_id = $_POST["exhibit_id"];
$species_id = $_POST["species_id"]; 

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

// store order 
$sqli = "INSERT INTO Animal VALUES( null, ?, ?, ?, ?, ?)"; //NEW added a question mark
$stmti = $conn->prepare($sqli);
$stmti->bind_param("sssii", $animal_name, $dob,  $sex, $exhibit_id, $species_id); //NEW added the discount_pct
if (!$stmti->execute()) {
    exit ("Error.  Unable to place order." . $conn->error);
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
  RECORD HAS BEEN INPUT CORRECTLY!</h1>

    <!-- BUTTON TO RETURN TO animal.php page -->  
	<form action="animal.php">
    	<input type="submit" value="PRESS TO RETURN" />
	</form>

  </html>
