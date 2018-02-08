/*

10 species +
5 exhibits +
20 animals -
8 natural habitats -

	+ = complete
	- = incomplete
*/

-- SPECIES ---------------------------------------------------------

INSERT INTO species VALUES (null, 'Jaguar', 'Panthera onca', 0);
INSERT INTO species VALUES (null, 'Lion', 'Panthera leo', 0);
INSERT INTO species VALUES (null, 'Tiger', 'Panthera tigris', 1);
INSERT INTO species VALUES (null, 'Cheetah', 'Acinonyx jubatus', 0);
INSERT INTO species VALUES (null, 'Gorilla', 'Gorilla gorilla', 1);
INSERT INTO species VALUES (null, 'Orangutan', 'Pongo', 1);
INSERT INTO species VALUES (null, 'Lemur', 'Lemuroidea', 1);
INSERT INTO species VALUES (null, 'Capuchin', 'Cebinae', 0);
INSERT INTO species VALUES (null, 'Rhinoceros', 'Rhinocerotidae', 0);
INSERT INTO species VALUES (null, 'African Elephant', 'Loxodonta africana', 0);


-- EXHIBIT ---------------------------------------------------------


INSERT INTO exhibit VALUES (null, 'Forbidden Forest');
INSERT INTO exhibit VALUES (null, 'Joyous Jungle'); 
INSERT INTO exhibit VALUES (null, 'Cataclysmic Canyon');   
INSERT INTO exhibit VALUES (null, 'Panoramic Plains');
INSERT INTO exhibit VALUES (null, 'Wonderous Wetlands');

-- ANIMALS ---------------------------------------------------------

INSERT INTO animal VALUES (null, 'Aurora', '2016-10-16', 'F', 1, 1);
INSERT INTO animal VALUES (null, 'Aemilia', '2008-08-23', 'F', 1, 1);
INSERT INTO animal VALUES (null, 'Nora', '2013-08-11', 'F', 3, 2);
INSERT INTO animal VALUES (null, 'Orion', '2012-12-23', 'M', 3, 2);
INSERT INTO animal VALUES (null, 'Ivona', '2009-01-24', 'F', 5, 3);
INSERT INTO animal VALUES (null, 'Sankar', '2009-12-03', 'M', 5, 3);
INSERT INTO animal VALUES (null, 'Amala', '2007-03-13', 'F', 4, 4);
INSERT INTO animal VALUES (null, 'Raffael', '2006-06-16', 'M', 4, 4);
INSERT INTO animal VALUES (null, 'Marianne', '1997-01-05', 'F', 2, 5);
INSERT INTO animal VALUES (null, 'Mahir', '1999-12-05', 'M', 2, 5);




