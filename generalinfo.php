<!-- INDEX FILE-->
<?php 
$host = "localhost";
$user = "root";
$password = "temp";
$database = "zoo";
$port = 3306;
// create connection
$conn = new mysqli($host, $user, $password, $database, $port);
if ($conn->connect_errno) {
    exit ("Failed to connect: (" . $conn->connect_errno . ") " . $conn->connect_error );
}
// read the names of animals  TODO We could change this SELECT statement to be a simple VIEW.  Make sure to keep same order
// TODO in the view that we make for the SELECT statement, we can have the boolean endangered return 'True' or 'False'
$animal_sql = "SELECT a.animal_id, a.animal_name, a.dob, a.sex, e.exhibit_name, s.common_name, s.science_name, s.endangered
FROM animal a
JOIN exhibit e ON e.exhibit_id = a.exhibit_id
JOIN species s ON s.species_id = a.species_id
ORDER BY a.animal_id"; 

$exhibit_count_sql = "SELECT count(*) FROM exhibit";
$species_count_sql = "SELECT count(*) FROM species";
$animal_count_sql = "SELECT count(*) FROM animal";

$exhibit1_sql = "SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 1";
$exhibit2_sql = "SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 2";
$exhibit3_sql = "SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 3";
$exhibit4_sql = "SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 4";
$exhibit5_sql = "SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 5";
$exhibit6_sql = "SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 6";




$exhibit_count = $conn->query($exhibit_count_sql);
$species_count = $conn->query($species_count_sql);
$animal_count = $conn->query($animal_count_sql);

$animal = $conn->query($animal_sql);

$exhibit1 = $conn->query($exhibit1_sql);
$exhibit2 = $conn->query($exhibit2_sql);
$exhibit3 = $conn->query($exhibit3_sql);
$exhibit4 = $conn->query($exhibit4_sql);
$exhibit5 = $conn->query($exhibit5_sql);
$exhibit6 = $conn->query($exhibit6_sql);

if (!$animal or !exhibit_count or !species_count or !animal_count) 	{
	exit ("Select failed: (" . $conn->errno . ") " . $conn->error . " sql=" . $sql);
}
?>

<!DOCTYPE html>
<html>
  <body>
  <style>
	body {
    		background-color: darkkhaki;
	}
  </style>

  <h1 style="text-align:center;font-family:tahoma;border:10px outset forestgreen; color:yellow"> ZOO DATABASE </h1>
<p style="color:red"><b>GENERAL INFORMATION ABOUT THE ZOO</b></p>
	
  
<form action="index.php">
    	<input type="submit" value="RETURN TO HOMEPAGE" />
</form>
    <hr> <!-- HR tag just represents a 'thematic break', or a horizon line.  Does not need a closing tag -->
  <!-- Below style tag makes the color for the background of the page -->
 
 <p></p> 
 <?php 
	echo "The Zoo currently has ";
 
	while ($row = $exhibit_count->fetch_assoc() ) {
		echo $row['count(*)']." exhibits featuring ";
	}
	while ($row = $species_count->fetch_assoc() ) {
		echo $row['count(*)']." species and ";
	}
	while ($row = $animal_count->fetch_assoc() ) {
		echo $row['count(*)']." different animals.";
	}
  ?>
  <p></p>
  
  <p>List of All Animals:</p>

  <!-- fetch each row and display using HTML table -->
  <table border = "1">
    	<?php 
	  //Below echo statement is to make the header for the table that displays all animals
	  echo "<tr><th>ANIMAL ID</th><th>ANIMAL NAME</th><th>DOB</th><th>SEX</th><th>EXHIBIT NAME</th>
	  <th>COMMON NAME</th><th>SCIENCE NAME</th><th>ENDANGERED STATUS</th></tr>";
	  //Below while loop converts all the records to html text
	  while ( $row = $animal->fetch_assoc() ) {
    	    echo "<tr><td> ".$row['animal_id']."</td> <td>".$row['animal_name']."</td> <td>" . $row['dob']. "</td>  
	    <td> ".$row['sex']."</td> <td>".$row['exhibit_name']."</td> <td>" . $row['common_name']. "</td> 
	    <td>" . $row['science_name']. "</td><td>" . $row['endangered']. "</td></tr>"; 
	  }
	
	?>
  </table>
  
  <p>Cat Canyon: </p>
  <table border = "1">
  <?php
	echo "<tr><th>ANIMAL NAME</th><th>SPECIES</th><th>SCIENCE NAME</th><th>SEX</th><th>DOB</th></tr>";
	while ( $row = $exhibit1->fetch_assoc() ) {
		echo "<tr><td> ".$row['animal_name']."</td> <td>".$row['common_name']."</td> <td>".$row['science_name']
		."</td> <td>".$row['sex']."</td> <td>".$row['dob']."</td></tr>";
	}
  ?>
  </table>
  
  <p>Primate Paradise: </p>
  <table border = "1">
  <?php
	echo "<tr><th>ANIMAL NAME</th><th>SPECIES</th><th>SCIENCE NAME</th><th>SEX</th><th>DOB</th></tr>";
	while ( $row = $exhibit2->fetch_assoc() ) {
		echo "<tr><td> ".$row['animal_name']."</td> <td>".$row['common_name']."</td> <td>".$row['science_name']
		."</td> <td>".$row['sex']."</td> <td>".$row['dob']."</td></tr>";
	}
  ?>
  </table>
  
  <p>African Kingdom: </p>
   <table border = "1">
  <?php
	echo "<tr><th>ANIMAL NAME</th><th>SPECIES</th><th>SCIENCE NAME</th><th>SEX</th><th>DOB</th></tr>";
	while ( $row = $exhibit3->fetch_assoc() ) {
		echo "<tr><td> ".$row['animal_name']."</td> <td>".$row['common_name']."</td> <td>".$row['science_name']
		."</td> <td>".$row['sex']."</td> <td>".$row['dob']."</td></tr>";
	}
  ?>
  </table>
  
  <p>Aviary Cliffs: </p>
   <table border = "1">
  <?php
	echo "<tr><th>ANIMAL NAME</th><th>SPECIES</th><th>SCIENCE NAME</th><th>SEX</th><th>DOB</th></tr>";
	while ( $row = $exhibit4->fetch_assoc() ) {
		echo "<tr><td> ".$row['animal_name']."</td> <td>".$row['common_name']."</td> <td>".$row['science_name']
		."</td> <td>".$row['sex']."</td> <td>".$row['dob']."</td></tr>";
	}
  ?>
  </table>
  
  <p>Tiger Den: </p>
   <table border = "1">
  <?php
	echo "<tr><th>ANIMAL NAME</th><th>SPECIES</th><th>SCIENCE NAME</th><th>SEX</th><th>DOB</th></tr>";
	while ( $row = $exhibit5->fetch_assoc() ) {
		echo "<tr><td> ".$row['animal_name']."</td> <td>".$row['common_name']."</td> <td>".$row['science_name']
		."</td> <td>".$row['sex']."</td> <td>".$row['dob']."</td></tr>";
	}
  ?>
  </table>
  
  <p>Arctic Exhibit: </p>
 <table border = "1">
  <?php
	echo "<tr><th>ANIMAL NAME</th><th>SPECIES</th><th>SCIENCE NAME</th><th>SEX</th><th>DOB</th></tr>";
	while ( $row = $exhibit6->fetch_assoc() ) {
		echo "<tr><td> ".$row['animal_name']."</td> <td>".$row['common_name']."</td> <td>".$row['science_name']
		."</td> <td>".$row['sex']."</td> <td>".$row['dob']."</td></tr>";
	}
  ?>
  </table>
  
  <?php
    // commit transation and close connection
	  $conn->commit();
	  $conn->close();
   ?>
</html>    



