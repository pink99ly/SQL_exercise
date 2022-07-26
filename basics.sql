CREATE DATABASE test;
DROP DATABASE test;
CREATE DATABASE record_company;
USE record_company; # this is to know what database we are working on
# Create a table within the database, it needs to specify the columns
CREATE TABLE test (
test_column INT
);

#if we want to change e.g. add a column
ALTER TABLE test
ADD another_column VARCHAR(255);
DROP TABLE test;
#force it name to have a value
CREATE TABLE bands(
id INT NOT NULL auto_increment,
name VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE albums (
id INT NOT NULL auto_increment,
name vARCHAR(255) NOT NULL,
release_year INT,
band_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (band_id) REFERENCES bands(id)
);


#insert data

INSERT INTO bands (name)
VALUES ('Iron Maiden'), ('Deuce'), ('Avenged Sevenfold'),('Ankor');

#query data
SELECT * FROM bands;
SELECT * FROM bands LIMIT 2;
SELECT name FROM bands;

SELECT * FROM bands ORDER BY name;
SELECT * FROM bands ORDER BY name DESC;
SELECT * FROM bands ORDER BY name ASC;

INSERT INTO albums (name, release_year, band_id)
VALUES ('The number of the beasts', 1985, 1),
('Power salves', 1984, 1),
('Nightmare', 2018,2),
('Nightmare', 2010, 3),
('Test album', NULL, 3);

SELECT * FROM albums;

SELECT distinct name FROM albums;

UPDATE albums
SET release_year = 1982 
WHERE id = 1;

SELECT * FROM albums
WHERE release_year <2000;

#wild card for string
SELECT * FROM albums
WHERE name LIKE '%er%' OR band_id =2;

SELECT * FROM albums
WHERE name LIKE '%er%' AND band_id =1;

SELECT * FROM albums
WHERE release_year BETWEEN 2000 AND 2018;


SELECT * FROM albums
WHERE release_year IS NULL;

DELETE FROM albums WHERE id = 5;

#join statement
SELECT * FROM bands
JOIN albums ON bands.id = albums.band_id;

# inner join/ left join / right join


#aggregate
SELECT AVG(release_year) FROM albums;
# SUM, COUNT

#aggregate by group by
SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;

# make it meaningful
SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;


SELECT b.name AS band_name, Count(a.id) AS num_albums 
FROM bands AS b
LEFT JOIN albums AS a ON a.band_id = b.id
GROUP BY b.id;


SELECT b.name AS band_name, Count(a.id) AS num_albums 
FROM bands AS b
LEFT JOIN albums AS a ON a.band_id = b.id
GROUP BY b.id
HAVING number_albums =1;


















