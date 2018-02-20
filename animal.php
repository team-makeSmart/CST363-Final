<!-- FINAL PROJECT: TEAM MAKE SMART:  -->
<!-- STUDENTS Pavlos Papadonikolakis, Jake McGhee, Maco Doussias -->
<!-- CLASS CST363 -- >
<!-- NOTE TO PROFESSOR:  database used is for a zoo-->

<!-- animal.php FILE-->
<?php 
$host = "localhost";
$user = "root";
$password = "KarlMarx123";
$database = "zoo";
$port = 3306;
?>

<html>
  <body>

  <!-- Below style tag makes the color for the background of the page -->
  <style>
	body {
    		background-color: darkkhaki;
	}
  </style>

  <h1 style="text-align:center;font-family:tahoma;
  border:10px outset forestgreen; color:yellow"> ZOO DATABASE </h1>

  <!-- BUTTON TO RETURN TO HOME PAGE -->  
	<form action="index.php">
    	<input type="submit" value="RETURN TO HOMEPAGE" />
	</form>
	
	
 <hr> 
	<!-- FORM FOR GETTING DATA FROM USER TO INPUTA RECORD INTO ANIMAL TABLE-->
    <form method="post" action="insertAnimal.php"> 
      <b style="color:yellow; font-size:24;">ENTER A NEW ANIMAL RECORD:</b>
      <br>
      <table>
   
		<tr><td>ANIMAL NAME (Pet Name)</td><td> 
        <input type="text" name="animal_name"/></td></tr>
        
		<tr><td>DOB</td><td>
        <input type="date" name="dob"/></td></tr>
        
		<tr><td>SEX</td><td>
        <select name="sex">
			<option value="F">Female</option>
			<option value="M">Male</option>
			<option value="O">Other</option>
		</select></td></tr>
        
		<tr><td>EXHIBIT</td><td> 
		<?php
		// create connection to get data and make a selection box from exhibit table
		$conn = new mysqli($host, $user, $password, $database, $port);
		if ($conn->connect_errno) {
		exit ("Failed to connect: (" . $conn->connect_errno . ") " . $conn->connect_error );
		}
		$sql = "SELECT e.exhibit_id, e.exhibit_name
		FROM exhibit e
		ORDER BY e.exhibit_name";  
		//SPECIAL NOTE: At most the zoo will only ever have 20 or 30 exhibits
		// For this reason the transactional cost of a full table scan is minimal 
		// Thus a DBA would decide no indexes would be required for the exhibit_name
		$res = $conn->query($sql); //connect for the query
		//Below if statement displays an error if the connection fails
		if (!$res) 	{
			exit ("Select failed: (" . $conn->errno . ") " . $conn->error . " sql=" . $sql);
		}
	
		//make a selection box with values from exhibit table
		echo "<select name=\"exhibit_id\">";
		//Below while loop converts all the records to html text
		while ( $row = $res->fetch_assoc() ) {
    	    echo "<option value=".$row['exhibit_id'].">".$row['exhibit_name']."</option>"; 
		}
		echo "</select>";
	
	// commit transaction and close connection
	  $conn->commit();
	  $conn->close();
?>
		

	<tr><td>SPECIES</td><td>

	<?php
	// create connection to get data and make a selection box from species table
	$conn = new mysqli($host, $user, $password, $database, $port);
	if ($conn->connect_errno) {
	exit ("Failed to connect: (" . $conn->connect_errno . ") " . $conn->connect_error );
	}	
	$sql = "SELECT s.species_id, s.common_name
	FROM species s
	ORDER BY s.common_name";
	//SPECIAL NOTE:  Depending on how big the table gets, and how many species records it gets
	//A DBA might consider putting an index on the attribute SPECIES.common_name
	//This is to make queries like this run faster. 
	//For now the transactional cost of a full table scan doesn't really call for extra indexes  
	$res = $conn->query($sql); //connect for the query
	//Below if statement displays error if connection fails
	if (!$res) 	{
		exit ("Select failed: (" . $conn->errno . ") " . $conn->error . " sql=" . $sql);
	}
	
	//make a selection box with values from the species table
	  echo "<select name=\"species_id\">";
	  //Below while loop converts all to html text for options in the selection box
	  while ( $row = $res->fetch_assoc() ) {
    	    echo "<option value=".$row['species_id'].">".$row['common_name']."</option>"; 
	  }
	echo "</select>";
	// commit transaction and close connection
	$conn->commit();
	$conn->close();
	?>
				
	</table>
	<!-- Below input tag makes a button to submit the form-->
	<input type="submit" value="INSERT ANIMAL"/> 
	</table>
</form>	
	
	
 <hr> 
    <form method="post" action="deleteAnimal.php"> 
      <b style="color:yellow; font-size:24;">REMOVE AN ANIMAL RECORD:</b>
      <br>
      <table>
		<tr><td>ANIMAL ID</td><td> 
		<!-- Get the animal ID for record that needs deleted-->
        <input type="text" name="animal_id"/></td></tr>
	  </table>
      <!-- Below input tag makes a button to submit the form-->
	  <input type="submit" value="DELETE ANIMAL"/> 
      </table>
    </form>	

	
  <hr> 
  <p>LIST OF ANIMALS:</p>
  <!-- This section fetches each row in ANIMAL table and displays using HTML table -->
  <table border = "1">
    	<?php 
		// create connection
		$conn = new mysqli($host, $user, $password, $database, $port);
		if ($conn->connect_errno) {
			exit ("Failed to connect: (" . $conn->connect_errno . ") " . $conn->connect_error );
		}
		$sql = "SELECT a.animal_id, a.animal_name, a.dob, 
		a.sex, e.exhibit_name, s.common_name, 
		s.science_name, s.endangered
		FROM animal a
		JOIN exhibit e ON e.exhibit_id = a.exhibit_id
		JOIN species s ON s.species_id = a.species_id
		ORDER BY a.animal_id"; 
		$res = $conn->query($sql);
		if (!$res) 	{
			exit ("Select failed: (" . $conn->errno . ") " . $conn->error . " sql=" . $sql);
		}		
		
	  //Below echo statement is to make the header for the table that displays all animal records
	  echo "<tr><th>ANIMAL ID</th><th>ANIMAL NAME (pet name)</th><th>DOB</th><th>SEX</th><th>EXHIBIT NAME</th>
	  <th>COMMON NAME</th><th>SCIENCE NAME</th><th>ENDANGERED STATUS</th></tr>";
	  //Below while loop converts all the records to html text
	  while ( $row = $res->fetch_assoc() ) {
    	    echo "<tr><td> ".$row['animal_id']."</td> <td>".$row['animal_name']."</td> <td>" . $row['dob']. "</td>  
	    <td> ".$row['sex']."</td> <td>".$row['exhibit_name']."</td> <td>" . $row['common_name']. "</td> 
	    <td>" . $row['science_name']. "</td><td>" . $row['endangered']. "</td></tr>"; 
	  }
	  // commit transaction and close connection
	  $conn->commit();
	  $conn->close();
	?>
  </table>
</html>
