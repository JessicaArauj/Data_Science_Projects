DROP TABLE EBAC;

CREATE TABLE EBAC (
    StudentId INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(30),
    Course VARCHAR(20),
    Grade INTEGER(2)
);

INSERT INTO EBAC (Name, Course, Grade)
VALUES
    ('Fabio', 'QA', 5),
    ('Jose Pedro', 'Dev', 8),
    ('Mariana', 'QA', 9),
    ('Aline', 'QA', 6),
    ('Alice', 'SQL', 7),
    ('Joao', 'Dev', 5),
    ('Alan', 'QA', 8),
    ('Wesley', 'SQL', 4),
    ('Pedro', 'UX', 3);

SELECT *
FROM EBAC
ORDER BY Name;

SELECT *
FROM EBAC
WHERE Course = 'QA';

SELECT *
FROM EBAC
WHERE Grade >= 6;

SELECT *
FROM EBAC
WHERE Name LIKE '%Pedro%';