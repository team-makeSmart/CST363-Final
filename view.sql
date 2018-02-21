-- FINAL PROJECT
-- TEAM MAKESMART, MACO DOUSSIAS, JAKE MCGHEE, PAVLOS PAPADONIKOLAKIS
-- DESCRIPTION:  VIEWS
-- CST363 

-- This View will allow a user to more easily many different attributes of an animal
-- It can be used to display all the animals in the Zoo with information about them from several different tables
-- It may be best to use something like this for the web views
CREATE OR REPLACE VIEW all_animal_info_view
AS
SELECT a.animal_id, a.animal_name, a.dob, 
a.sex, e.exhibit_name, s.common_name, 
s.science_name, IF(s.endangered,'True','False') As Endangered
FROM animal a
JOIN exhibit e ON e.exhibit_id = a.exhibit_id
JOIN species s ON s.species_id = a.species_id
ORDER BY a.animal_id;

-- This select statement just to test the above view out.
SELECT * FROM all_animal_info_view;