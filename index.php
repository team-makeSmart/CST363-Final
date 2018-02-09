<!-- FINAL PROJECT: TEAM MAKE SMART:  -->
<!-- STUDENTS Pavlos Papadonikolakis, Jake McGhee, Maco Doussias -->
<!-- CLASS CST363 -- >
<!-- NOTE TO PROFESSOR:  database used is for a zoo-->

<!-- INDEX -->

<?php 
  $host = "localhost";
  $user = "root";  <!-- TODO USER NEEDS CHANGED HERE -->
  $password = "temp"; <!-- NEWER -->
  $database = "zoo";  <!-- NEWER -->
  $port = 3306;

  // create connection
  $conn = new mysqli($host, $user, $password, $database, $port);
  if ($conn->connect_errno) {
      exit ("Failed to connect: (" . $conn->connect_errno . ") " . $conn->connect_error );
  }


  // read the items for sale
  $sql = "select id, name, price from items order by id";
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
     
  <p>Items for sale.</p>

  <!-- fetch each row and display using HTML table -->
  <table>
    	<?php
	  while ( $row = $res->fetch_assoc() ) {
    	    echo "<tr> <td> ".$row['id']."</td> <td>".$row['name']."</td> <td>" . $row['price']. "</td> </tr>"; 
	  }

	  // commit transation and close connection
	  $conn->commit();
	  $conn->close();
	?>
  </table>
    <hr> <!-- HR tag just represents a 'thematic break', or a horizon line.  Does not need a closing tag -->
    <form method="post" action="purchase.php">  <!-- TODO this may need adjusted what is purchase.php? linked to-->
      <b style="color:yellow; font-size:24;">ENTER AN ANIMAL:</b>
      <br>
      <table>
        <tr><td>Item number</td><td> <!-- TODO make the PHP connection here-->
        <input type="number" name="id"/></td></tr>
        <tr><td>Quantity</td><td>
        <input type="number" name="quantity"/></td></tr>
        <tr><td>Name</td><td>
        <input type="text" name="name"/></td></tr>
        <tr><td>Code</td><td> 						
        <input type="text" name="code"/></td></tr> 	
      </table>
      <input type="submit" value="ENTER ANIMAL"/> 
      </table>
    </form>
    
    <form action="http://google.com">
    	<input type="submit" value="Just a link button" />
	</form>
