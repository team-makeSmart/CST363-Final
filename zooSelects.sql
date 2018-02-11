-- FINAL PROJECT
-- TEAM MAKESMART, MACO DOUSSIAS, JAKE MCGHEE, PAVLOS PAPADONIKOLAKIS
-- DESCRIPTION:  SQL STATEMENTS FOR SELECTS AND VIEWS ON ZOO DATABASE
-- CST363 
--
--
-- SELECT simle statements to see all the records in each table, individually.
SELECT * FROM animal;
SELECT * FROM exhibit;
SELECT * FROM species;
SELECT * FROM natural_habitat;
SELECT * FROM species_has_natural_habitat;

-- TODO all the select statements can be converted to views for the website
-- TODO Not sure how to make a standard way to do INSERTS for the website?  Would VIEWS be a good choice?


-- SELECT to see all the species and their corresponding habitats 
SELECT s.common_name, s.science_name, s.endangered,nh.habitat_name
FROM species s
JOIN species_has_natural_habitat sn
  ON sn.species_id = s.species_id
JOIN natural_habitat nh 
  ON sn.natural_habitat_id = nh.natural_habitat_id
ORDER BY s.common_name, science_name;  
  
-- TODO SELECT statement to show all the habitats and a COUNT of how many species are from them

-- TODO SELECT statement to show every animal, what species they are, 
	--  what exhibit they live in, and a count of how many habitats they are from.
 
-- TODO SELECT statement to show the names and species of all the animals in a particular exhibit

-- TODO SELECT statement to show all the animals that are from a specific NATURAL_HABITAT

