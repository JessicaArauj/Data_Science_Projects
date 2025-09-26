SELECT *
FROM Customer;

SELECT *
FROM Customer
LIMIT 10;

SELECT COUNT(*)
FROM Customer;

SELECT FirstName, LastName, City
FROM Customer
LIMIT 10;

SELECT FirstName AS FirstName, LastName AS LastName, City AS City
FROM Customer
ORDER BY 3 DESC;

SELECT FirstName AS FirstName, LastName AS LastName, City AS City
FROM Customer
ORDER BY 1 ASC;

SELECT FirstName AS "First Name", LastName AS "Last Name", City AS "Customer City"
FROM Customer
ORDER BY 1 ASC;

SELECT *
FROM Album
WHERE Title = 'Big Ones';

SELECT *
FROM Album
WHERE ArtistId = 10;

SELECT *
FROM Album
WHERE Column1 IS NOT NULL;

SELECT *
FROM Album
WHERE Column1 IS NULL;

SELECT *
FROM Album
WHERE AlbumId >= 100
ORDER BY Title ASC;

SELECT *
FROM Album
WHERE AlbumId BETWEEN 10 AND 30;

SELECT *
FROM Album
WHERE AlbumId >= 100 AND ArtistId = 22;

SELECT *
FROM Album
WHERE AlbumId >= 100 OR ArtistId = 22;

SELECT *
FROM Album
WHERE Title LIKE 'Big Ones';

SELECT *
FROM Album
WHERE Title LIKE 'Big%';

SELECT *
FROM Album
WHERE Title LIKE '%Live';

SELECT *
FROM Album
WHERE Title LIKE '%DISC%';

SELECT *
FROM Artist
WHERE Name LIKE 'AC_DC';

SELECT *
FROM Genre
LIMIT 10;

SELECT *
FROM Genre
WHERE Name LIKE 'MPB';

INSERT INTO Genre (GenreId, Name)
VALUES (NULL, 'MPB');

SELECT *
FROM Artist
WHERE Name LIKE 'TOQUINHO';

INSERT INTO Artist (Name)
VALUES ('Toquinho');

SELECT *
FROM Track;

INSERT INTO Track
VALUES (NULL, 'Aquarela', NULL, 1, 26, 'Toquinho and Vinicius', 2500000, 8000000, 5.99);

SELECT *
FROM Track
WHERE GenreId = 26;

SELECT *
FROM Customer
WHERE CustomerId = 2;

UPDATE Customer
SET Company = 'EBAC'
WHERE CustomerId = 2;

SELECT *
FROM Customer
WHERE Country LIKE 'Bra_il';

UPDATE Customer
SET Country = 'Brazil'
WHERE Country LIKE 'Bra_il';

SELECT *
FROM Invoice
WHERE Total >= 20 AND BillingCountry LIKE 'USA';

DELETE
FROM Invoice
WHERE Total >= 20 AND BillingCountry LIKE 'USA';

SELECT COUNT(*)
FROM Album;

SELECT COUNT(*)
FROM Artist;

SELECT COUNT(*)
FROM Album, Artist;

SELECT Album.Title, Artist.Name
FROM Album
INNER JOIN Artist
    ON Album.AlbumId = Artist.ArtistId
WHERE Name LIKE 'Iron Maiden';

SELECT Album.Title AS "Album Title",
       Artist.Name AS "Artist Name",
       Track.Name AS "Track Name"
FROM Album
INNER JOIN Artist
    ON Album.AlbumId = Artist.ArtistId
INNER JOIN Track
    ON Album.AlbumId = Track.AlbumId;

CREATE TABLE Student(
    StudentId INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(30),
    Enrollment INTEGER(5)
);

SELECT * 
FROM Student;

INSERT INTO Student (Name, Enrollment)
VALUES
    ('Fabio Araujo', 12345),
    ('Mariana Silva', 43566),
    ('Jose Ernesto', 54321);

DROP TABLE Student;
