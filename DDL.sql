# DDL -DATA DEFINITION LANGUAGE - CREATE, DROP, ALTER

#CREATE
# TASK - Create a new table persons with 4 columns- ID, person name, birth date and phone
CREATE TABLE demo.persons(
ID INT PRIMARY KEY AUTO_INCREMENT,
PersonName VARCHAR(50) NOT NULL,
BirthDate DATE,
Phone VARCHAR(15) NOT NULL UNIQUE);


SELECT * FROM persons;
DESCRIBE persons;


### ALTER  - ADDS columns at the end
# TASK - ADD new column email to persons
ALTER TABLE persons
ADD email VARCHAR(15) NOT NULL;


## DROP Table- destroy the tables
DROP TABLE persons;
