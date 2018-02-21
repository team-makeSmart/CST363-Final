<!-- FINAL PROJECT: TEAM MAKE SMART:  -->
<!-- STUDENTS Pavlos Papadonikolakis, Jake McGhee, Maco Doussias -->
<!-- CLASS CST363 -- >
<!-- NOTE TO PROFESSOR:  database used is for a zoo-->

<!-- INDEX FILE-->

<!--
************************
DIAGRAM OF ZOO WEBSITE PORTAL
************************
DESCRIPTION:  This web portal allows the user to insert a new animal record, view records on animals, and delete a record.
*******************
INDEX.PHP (LINKS PAGE THAT LINKS TO ANIMAL.PHP AND TO GENERALINFO.PHP)
GENERALINFO.PHP (SHOWS GENERAL INFO ON THE ZOO, CONNECTING TO DB USING .php)
ANIMAL.PHP 	(HAS ONE FORM TO DELETE ANIMALS AND ONE FORM TO INSERT ANIMALS INTO DB)
INSERTANIMAL.PHP(Receives info from animal.php form and then uploads it to DB)
DELETEANIMAL.PHP(Receives info from animal.php form and then deletes record in DB)
************************
		       <index.php>
		  	   |	
<generalInfo.php>________________________<Animal.php>
			    		       |	
		<deleteAnimal.php>____________________<insertAnimal.php>
-->



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
  <p>Welcome to the Zoo database portal.</p>   
  
    <hr> <!-- HR tag just represents a 'thematic break', or a horizon line.  Does not need a closing tag -->
	<p style="color:red"><b>PLEASE MAKE A SELECTION FROM BELOW!</b></p>
  
<form action="animal.php">
    	<input type="submit" value="CLICK HERE TO INSERT, DELETE, OR VIEW ANIMALS" />
</form>

<br>

<form action="generalinfo.php">
	<input type="submit" value="CLICK HERE TO VIEW GENERAL INFO ON ZOO" />
</form>
