-- FINAL PROJECT
-- TEAM MAKESMART, MACO DOUSSIAS, JAKE MCGHEE, PAVLOS PAPADONIKOLAKIS
-- DESCRIPTION:  SQL INSERT STATEMETS TO INSERT DATA FOR ANIMALS IN A ZOO
-- CST363 
--
--
--

insert into animal(animal_name,animal_class,DOB,sex,endangered) values('keiko','mamal','2008-11-11','female',1);
insert into animal(animal_name,animal_class,DOB,sex,endangered) values('sher','bird','2011-1-12','male',0);

insert into species(sience_name,animal_id) values('Eastern-Gorilla',1000);
insert into species(sience_name,animal_id) values('Columbidae',1001);

insert into animal_diet(diet_type,animal_id) values('Herbivores',1000);
insert into animal_diet(diet_type,animal_id) values('Frugivores',1001);

insert into exhibit(exhibit_name) value('Red Rocks');
insert into exhibit(exhibit_name) value('Chinese Water Dragon');

insert into habitat(habitat_name,habitat_climate,avg_temp,animal_id) values('African Jungle','tropical','77',1001);
insert into habitat(habitat_name,habitat_climate,avg_temp,animal_id) values('African Safari','dry','70',1000);

insert into species_live(species_id,exhibit_id) values(2000,6001);
insert into species_live(species_id,exhibit_id) values(2001,6001);