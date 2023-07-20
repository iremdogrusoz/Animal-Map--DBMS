/*
	Complex query 1
	Explanation: Find all the common names of animals that animals show Hibernation feature. feature_name= 'Hibernation'.
*/

    SELECT s.common_name 
    FROM Species s 
    where exists (select * 
		from SpeciesHaveFeatures shf, Features f 
        where shf.feature_id= f.feature_id 
        and s.species_id= shf.species_id 
        and f.feature_name='Hibernation');

/*
	Complex query 2
	Explanation: Find family names that have all their corresponding species with images taken in 2023.
*/

SELECT f.family_name
FROM Family f
WHERE NOT EXISTS (
    SELECT *
    FROM Species s
    WHERE s.family_no = f.family_id
    AND NOT EXISTS (
        SELECT *
        FROM Images i
        WHERE i.species_no = s.species_id
        AND image_date LIKE '2023%'
    )
);

/*
	==================================================================
	
	View creation query
	Explanation: The view joins Species, Family and Images tables and group by family_id to use in aggregations. To see the count of images and species for each family, I created a view.
*/

CREATE VIEW IMAGE_NEW AS
select f.family_name,
	COUNT(i.image_id) AS total_images,
    COUNT(s.species_id) AS total_species
from Species s, Family f, Images i
where s.species_id= i.species_no and f.family_id= s.family_no
group by f.family_id;

/*
	==================================================================
	
	Trigger creation query 1
	Explanation: The behavior_name column consists of lower case entries in order to prevent misspelling and query errors, I create a trigger action to change all letters to lower case.
*/


CREATE TRIGGER lowercase_before_insert 
BEFORE INSERT ON Behaviors
FOR EACH ROW
	SET NEW.behavior_name = LOWER(NEW.behavior_name); 

/*
	Trigger control queries 1
	Provide a select query to retrieve the results. 
	Then, provide an update/insert/delete query that would affect the results due to the trigger. 
	Using these, we can see whether your trigger works.
*/

SELECT * FROM Behaviors;
INSERT INTO Behaviors 
VALUES(11, 'Swimming', 'Physical');

    

/*  
	Trigger creation query 2
	Explanation: Updates the image_count table of Species table when a new image added to Image table. This images are counted by grouping species_id. 
*/

DELIMITER $$
CREATE TRIGGER fimages_after_insert AFTER INSERT
ON Images
FOR EACH ROW
BEGIN
	UPDATE Species
	SET image_count = (
		SELECT COUNT(*) FROM Images
		WHERE species_no= NEW.species_no
        GROUP BY species_no)
	WHERE species_id= NEW.species_no;
END$$
DELIMITER ;

/*
	Trigger control queries 2
*/

SELECT * FROM Species;
INSERT INTO Images
VALUES (16,'2022-06-15','Professional', 2, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPhwjGmEkZj8CmPdlqgQ_jaieFnHMxci_GTQ&usqp=CAU');

/*  
	Trigger creation query 3
	Explanation: It updates avg_life_span of families where new species are added. It groups by family id
*/

DELIMITER $$
CREATE TRIGGER family_avg_life_span AFTER INSERT
ON Species
FOR EACH ROW
BEGIN
	UPDATE Family
	SET avg_life_span = (
		SELECT AVG(life_span) FROM Species
		WHERE family_no= NEW.family_no
        GROUP BY family_no)
	WHERE family_id= NEW.family_no;
END$$
DELIMITER ;

/*
	Trigger control queries 3
*/

SELECT * FROM Family;
INSERT INTO Species
VALUES (22,'Mammuthus','Mammoth', 3, 60, 0);
