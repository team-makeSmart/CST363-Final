<!-- INDEX FILE-->
<?php 
$host = "localhost";
$user = "root";
$password = "KarlMarx123";
$database = "zoo";
$port = 3306;
// create connection
$conn = new mysqli($host, $user, $password, $database, $port);
if ($conn->connect_errno) {
    exit ("Failed to connect: (" . $conn->connect_errno . ") " . $conn->connect_error );
}
// read the names of animals  TODO We could change this SELECT statement to be a simple VIEW.  Make sure to keep same order
// TODO in the view that we make for the SELECT statement, we can have the boolean endangered return 'True' or 'False'
$sql = "SELECT a.animal_id, a.animal_name, a.dob, a.sex, e.exhibit_name, s.common_name, s.science_name, s.endangered
FROM animal a
JOIN exhibit e ON e.exhibit_id = a.exhibit_id
JOIN species s ON s.species_id = a.species_id
ORDER BY a.animal_id"; 
$res = $conn->query($sql);
if (!$res) 	{
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
  <!-- TODO fix below to make have counts of animals.  Will need counts froim DB -->
<p>The Zoo currently has <b>COUNT_EXHIBITS</b> exhibits featuring <b>COUNT_SPECIES</b> different species and <b>COUNT_OF_ANIMALS</b> animals. </p>

<form action="index.php">
    	<input type="submit" value="RETURN TO HOMEPAGE" />
</form>
    <hr> <!-- HR tag just represents a 'thematic break', or a horizon line.  Does not need a closing tag -->
  <!-- Below style tag makes the color for the background of the page -->
     
  <p>LIST OF ALL ANIMALS:</p>

  <!-- fetch each row and display using HTML table -->
  <table border = "1">
    	<?php 
	  //Below echo statement is to make the header for the table that displays all animals
	  echo "<tr><th>ANIMAL ID</th><th>ANIMAL NAME</th><th>DOB</th><th>SEX</th><th>EXHIBIT NAME</th>
	  <th>COMMON NAME</th><th>SCIENCE NAME</th><th>ENDANGERED STATUS</th></tr>";
	  //Below while loop converts all the records to html text
	  while ( $row = $res->fetch_assoc() ) {
    	    echo "<tr><td> ".$row['animal_id']."</td> <td>".$row['animal_name']."</td> <td>" . $row['dob']. "</td>  
	    <td> ".$row['sex']."</td> <td>".$row['exhibit_name']."</td> <td>" . $row['common_name']. "</td> 
	    <td>" . $row['science_name']. "</td><td>" . $row['endangered']. "</td></tr>"; 
	  }
	  // commit transation and close connection
	  $conn->commit();
	  $conn->close();
	?>
  </table>
</html>    



