-- FINAL PROJECT
-- TEAM MAKESMART, MACO DOUSSIAS, JAKE MCGHEE, PAVLOS PAPADONIKOLAKIS
-- DESCRIPTION:  SQL SCHEMA INSERT STATEMENTS FOR ZOO DB
-- CST363 

-- NOTE TO PROFESSOR --
-- We intentionally left some EXHIBITS without animals.  
--      For instance, the Zoo might have a new exhibit that hasn't been populated yet.
-- We also left some SPECIES without connections to the ANIMALS table
--     For instance, a Zoo might be expecting species, or want to store info on a species, 
--     but the may not necessarily have them in the Zoo.
-- -------------------------------------------------
-- INSERT natural habitats
INSERT INTO natural_habitat VALUES (1,'Arctic / Antarctic');
INSERT INTO natural_habitat VALUES (2,'Desert');
INSERT INTO natural_habitat VALUES (3,'Tundra');
INSERT INTO natural_habitat VALUES (4,'Taiga (Coniferous Forest)');
INSERT INTO natural_habitat VALUES (5,'Deciduous Forest');
INSERT INTO natural_habitat VALUES (6,'Grassland');
INSERT INTO natural_habitat VALUES (7,'Tropical');
INSERT INTO natural_habitat VALUES (8,'Swamp');
INSERT INTO natural_habitat VALUES (9,'Aquatic (Ocean)');
INSERT INTO natural_habitat VALUES (10,'Aquatic (Fresh)');

-- -------------------------------------------------
-- INSERT species
-- CATS
INSERT INTO species VALUES (1, 'Jaguar', 'Panthera onca', 0);
	INSERT INTO species_has_natural_habitat VALUES (1,7);

INSERT INTO species VALUES (2, 'Lion', 'Panthera leo', 0);
	INSERT INTO species_has_natural_habitat VALUES (2,6);
        
INSERT INTO species VALUES (3, 'Tiger', 'Panthera tigris', 1);
	INSERT INTO species_has_natural_habitat VALUES (3,7);
        
INSERT INTO species VALUES (4, 'Cheetah', 'Acinonyx jubatus', 0);
	INSERT INTO species_has_natural_habitat VALUES (4,6);

-- PRIMATES
INSERT INTO species VALUES (5, 'Gorilla', 'Gorilla gorilla', 1);
	INSERT INTO species_has_natural_habitat VALUES (5,7);
            
INSERT INTO species VALUES (6, 'Orangutan', 'Pongo', 1);
	INSERT INTO species_has_natural_habitat VALUES (6,7);

INSERT INTO species VALUES (7, 'Chimpanzee', 'Pan troglodytes', 1);
	INSERT INTO species_has_natural_habitat VALUES (7,7);    
            
-- BIRDS
INSERT INTO species VALUES (8, 'Bald Eagle', 'Haliaeetus leucocephalus', 0);
	INSERT INTO species_has_natural_habitat VALUES (8,3);
	INSERT INTO species_has_natural_habitat VALUES (8,4);
	INSERT INTO species_has_natural_habitat VALUES (8,5);
            
INSERT INTO species VALUES (9, 'Red-tailed Hawk', 'Buteo jamaicensis', 0);
	INSERT INTO species_has_natural_habitat VALUES (9,4);
	INSERT INTO species_has_natural_habitat VALUES (9,5);
            
-- OTHER species
INSERT INTO species VALUES (10, 'Rhinoceros', 'Rhinocerotidae', 0);
	INSERT INTO species_has_natural_habitat VALUES (10,6);
	INSERT INTO species_has_natural_habitat VALUES (10,7);
            
INSERT INTO species VALUES (11, 'African Elephant', 'Loxodonta africana', 0);
	INSERT INTO species_has_natural_habitat VALUES (11,6);
	INSERT INTO species_has_natural_habitat VALUES (11,7);            
            
INSERT INTO species VALUES (12, 'American Bullfrog','Lithobates catesbeianus',0);
	INSERT INTO species_has_natural_habitat VALUES (12,5);
	INSERT INTO species_has_natural_habitat VALUES (12,8);	
	INSERT INTO species_has_natural_habitat VALUES (12,10);	
    
INSERT INTO species VALUES (13, 'Rattlesnake','Crotalus cerastes',0);
	INSERT INTO species_has_natural_habitat VALUES (13,2);
	INSERT INTO species_has_natural_habitat VALUES (13,6);	

-- -------------------------------------------------
-- INSERT EXHIBITS ---------------------------------------
INSERT INTO exhibit VALUES 
(1, 'Cat Canyon'), 
(2, 'Primate Paradise'), 
(3, 'African Kingdom'), -- TODO ANIMALS NEED ADDED FOR THIS EXHIBIT 
(4, 'Aviary Cliffs'), -- TODO ANIMALS NEED ADDED FOR THIS EXHIBIT 
(5, 'Tiger Den'),       
(6, 'Arctic Exhibit'); -- Leave this exhibit empty, to have one empty exhibit in the Zoo. 

-- -------------------------------------------------
-- ANIMALS

INSERT INTO animal VALUES (null, 'Tony','2008-7-04','F',5,3);
INSERT INTO animal VALUES (null, 'Shere Khan','2010-7-04','M',5,3);
INSERT INTO animal VALUES (null,'Roadsta','2013-8-8','F',1,1);
INSERT INTO animal VALUES (null,'Simba','2015-10-11','M',1,2);
INSERT INTO animal VALUES (null,'Tigger','2013-2-7','M',1,4);
INSERT INTO animal VALUES (null,'Diane','1999-10-12','F',2,5);
INSERT INTO animal VALUES (null,'Birute','1995-2-1','F',2,6);
INSERT INTO animal VALUES (null,'Jane','2017-1-1','F',2,7);			
INSERT INTO animal VALUES (null,'null','1995-2-1','F',2,6);
INSERT INTO animal VALUES (null,'null','2017-1-1','F',2,7);

