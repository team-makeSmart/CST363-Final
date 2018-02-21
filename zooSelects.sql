-- FINAL PROJECT
-- TEAM MAKESMART, MACO DOUSSIAS, JAKE MCGHEE, PAVLOS PAPADONIKOLAKIS
-- DESCRIPTION:  SQL STATEMENTS FOR SELECTS AND VIEWS ON ZOO DATABASE
-- CST363 
--
-- --------------------

-- CREATE USERS -------------------------------------------------------------
-- --------------------------------------------------------------------------
-- Create the zooUser explicitly
CREATE USER zooUser@localhost IDENTIFIED BY 'pass';
-- Grant the zooUser only the ability to view records, and insert new records
GRANT SELECT, INSERT
ON zoo.* TO zooUser@localhost;


-- Create the zooAdmin explicitly 
CREATE USER zooAdmin@localhost IDENTIFIED BY 'pass123';
-- Grant the zooAdmin ALL abilities for the records
-- Grant the zooAdmin ability to grant their permissions to other users  
GRANT ALL
ON zoo.* TO zooAdmin@localhost
WITH GRANT OPTION;

-- SELECTS--------------------------------------------------------------------------
-- --------------------------------------------------------------------------
-- SELECT simple statements to see all the records in each table, individually.
SELECT * FROM animal;
SELECT * FROM exhibit;
SELECT * FROM species;
SELECT * FROM natural_habitat;
SELECT * FROM species_has_natural_habitat;

-- SELECT to see general animal information
SELECT a.animal_id, a.animal_name, a.dob, a.sex, e.exhibit_name, s.common_name, s.science_name, s.endangered
FROM animal a
JOIN exhibit e ON e.exhibit_id = a.exhibit_id
JOIN species s ON s.species_id = a.species_id
ORDER BY a.animal_id;

-- SELECT to see all the species and their corresponding habitats 
SELECT s.common_name, s.science_name, s.endangered,nh.habitat_name
FROM species s
JOIN species_has_natural_habitat sn
  ON sn.species_id = s.species_id
JOIN natural_habitat nh 
  ON sn.natural_habitat_id = nh.natural_habitat_id
ORDER BY s.common_name, science_name;  
  
-- SELECT statement to show all the habitats and a COUNT of how many species are from them

SELECT 
    COUNT(s.species_id) AS 'Number of animals', n.habitat_name
FROM
    species s
        JOIN
    species_has_natural_habitat ss ON s.species_id = ss.species_id
        JOIN
    natural_habitat n ON n.natural_habitat_id = ss.natural_habitat_id
GROUP BY 2; 
  
--  ------------------------------------------------------------------------------------
--  ------------------------------------------------------------------------------------  
-- SELECT animal names and their ages that live in 'Primate paradise'
-- and their natural habitat is 'Tropical'

SELECT 
    a.animal_name AS animal,
    YEAR(CURRENT_DATE()) - YEAR(a.dob) AS 'Age',
    s.science_name
FROM
    animal a
        JOIN
    species_has_natural_habitat shn ON a.species_id = shn.species_id
        JOIN
    natural_habitat nh ON nh.natural_habitat_id = shn.natural_habitat_id
        JOIN
    exhibit e ON e.exhibit_id = a.exhibit_id
        JOIN
    species s ON s.species_id = a.species_id
WHERE
    nh.habitat_name = 'Tropical'
        AND e.exhibit_name = 'Primate paradise';

--  ------------------------------------------------------------------------------------
--  ------------------------------------------------------------------------------------
-- Find all animals their common name and science name that are in danger of extiction, and what is  
-- the name of their exhibit in the zoo

SELECT 
    distinct s.common_name,s.science_name, exhibit_name
FROM

    species s  join animal a on a.species_id = s.species_id
    join exhibit e on e.exhibit_id = a.exhibit_id
    where s.endangered = 1;
     
--  ------------------------------------------------------------------------------------
--  ------------------------------------------------------------------------------------
-- Find if there is currently a natural habitat that coresponds to no animal in the zoo

SELECT 
    habitat_name, sp.science_name
FROM
    natural_habitat nh
        LEFT JOIN
    species_has_natural_habitat s ON nh.natural_habitat_id = s.natural_habitat_id
        LEFT JOIN
    species sp ON sp.species_id = s.species_id
ORDER BY 1;


--  ------------------------------------------------------------------------------------  
-- -- Find all species that their science name contains 'America' 
-- 
SELECT 
    sp.common_name
FROM
    species sp
WHERE
    sp.common_name REGEXP 'America';
    
--  ------------------------------------------------------------------------------------  
-- Count if there are more female than male animals in the zoo

select distinct case when (SELECT 
    count(a.sex)
    from animal a where a.sex = 'F')>
(SELECT 
    count(a.sex)
    from animal a where a.sex = 'M') then 'True'
ELSE 'False' END AS 'Female animals > Male animals'
  FROM animal;
  

-- VIEWS--------------------------------------------------------------------------
-- --------------------------------------------------------------------------  

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
  
 
-- VIEWS to show show the names and species of all the animals in a particular exhibit
CREATE VIEW exhibit1_view AS
SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 1;

CREATE VIEW exhibit2_view AS
SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 2;

CREATE VIEW exhibit3_view AS
SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 3;

CREATE VIEW exhibit4_view AS
SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 4;

CREATE VIEW exhibit5_view AS
SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 5;

CREATE VIEW exhibit6_view AS
SELECT animal_name, sex, dob, common_name, science_name
FROM animal a 
JOIN species s ON a.species_id = s.species_id
WHERE exhibit_id = 6;

