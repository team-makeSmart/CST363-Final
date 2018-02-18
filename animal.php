<!-- FINAL PROJECT: TEAM MAKE SMART:  -->
<!-- STUDENTS Pavlos Papadonikolakis, Jake McGhee, Maco Doussias -->
<!-- CLASS CST363 -- >
<!-- NOTE TO PROFESSOR:  database used is for a zoo-->

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
$sql = "SELECT a.animal_id, a.animal_name, a.dob, 
a.sex, e.exhibit_name, s.common_name, 
s.science_name, s.endangered
 
FROM animal a
 
JOIN exhibit e ON e.exhibit_id = a.exhibit_id
JOIN species s ON s.species_id = a.species_id
ORDER BY s.species_id, a.animal_id"; 
$res = $conn->query($sql);
if (!$res) 	{
	exit ("Select failed: (" . $conn->errno . ") " . $conn->error . " sql=" . $sql);
}
?>

<!DOCTYPE html>
<html>
  <body>

  <!-- Below style tag makes the color for the background of the page -->
  <style>
	body {
    		background-color: darkkhaki;
	}
  </style>

  <h1 style="text-align:center;font-family:tahoma;border:10px outset forestgreen; color:yellow"> ZOO DATABASE </h1>

  <!-- BUTTON TO RETURN TO HOME PAGE -->  
	<form action="index.php">
    	<input type="submit" value="RETURN TO HOMEPAGE" />
	</form>
	
	
 <hr> <!-- HR tag just represents a 'thematic break', or a horizon line.  Does not need a closing tag -->
    <form method="post" action="inputAnimal.php"> 
      <b style="color:yellow; font-size:24;">ENTER A NEW ANIMAL RECORD:</b>
      <br>
      <table>
   
		<tr><td>ANIMAL NAME</td><td> 
        <input type="text" name="animal_name"/></td></tr>
        
		<tr><td>DOB</td><td>
        <input type="date" name="quantity"/></td></tr>
        
		<tr><td>SEX</td><td>
        <input type="text" name="sex"/></td></tr>
        
		<tr><td>EXHIBIT NAME</td><td> 	<!-- TODO make this a selection box, based on values already in exhibit table-->					
        <input type="text" name="code"/></td></tr> 	

		<tr><td>SPECIES</td><td><!-- TODO make this a selection box, base on values already in species table-->
        <input type="text" name="sex"/></td></tr>
		
	  </table>
      
	  <input type="submit" value="INSERT ANIMAL"/> 
      </table>
    </form>	
	
	
 <hr> 
    <form method="post" action="inputAnimal.php"> 
      <b style="color:yellow; font-size:24;">REMOVE AN ANIMAL RECORD:</b>
      <br>
      <table>
   
		<tr><td>ANIMAL ID</td><td> 
        <input type="text" name="animal_name"/></td></tr>
      
	  </table>
      
	  <input type="submit" value="DELETE ANIMAL"/> 
      </table>
    </form>	






	
  <hr> 
  <p>LIST OF ANIMALS:</p>
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
    

