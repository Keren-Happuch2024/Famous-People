# CREATING DATABASE PEOPLE
CREATE DATABASE people;
USE people;

#CREATING TABLE one
CREATE TABLE famous_people (id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, name TEXT ,state TEXT , marital_status TEXT);
# inserting values
INSERT INTO famous_people (name,state,marital_status) 
VALUES ('Arnold Schwarzenegger','texas','married'),
('Mel Gibson','north_carolina','unmarried'),
('Dwayne Johnson','california','married'), 
('Britney Spears','louisiana','married'),
('Halle Berry','ohio','unmarried'),
('mariah Carey','new_york','married'),
('Janet Jackson','maryland','married'), 
('Hank Williams','tennessee', 'married'),
('Johnny Cash','arizona','married'),
('George Strait','new_york','married'),
('Loretta Lynn','kentucky','unmarried'),  
('Dolly parton','tennessee','unmarried'),
('Reba Mcentire','ohio','unmarried'),
('Shania Twain','washington','married'),
('Charles Dickens','kentucky', 'unmarried'),
('Anna Sewell','Louisiana',' married'),
('Rudyard Kipling','Texas', 'married'),
('Jack sparrow','Louisiana', 'unmarried'),
('Juliet','florida', 'married'),
('oliver twist', 'alaska', 'unmarried');

#view table
SELECT *FROM famous_people;

# altering famous_people table column marital_status removing space
UPDATE famous_people
SET marital_status = 'married'
WHERE id = 16;

#view table
SELECT *FROM famous_people;

# creating table two
CREATE TABLE career (id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, name TEXT, career_name TEXT, gender TEXT);
# inserting values
INSERT INTO career (name,career_name,gender)
VALUES ('Arnold Schwarzenegger','movie_star','male'),
('Mel Gibson','movie_star','male'),
('Dwayne Johnson','movie_star','male'), 
('Britney Spears','movie_star','female'),
('Halle Berry','movie_star','movie_star'),
('Mariah Carey','movie_star','female'),
('Janet Jackson','movie_star','female'), 
('Hank Williams','singer', 'male'),
('Johnny Cash','singer','male'),
('George Strait','singer','male'),
('Loretta Lynn','singer','female'),  
('Dolly parton','singer','female'),
('Reba McEntire','singer','female'),
('Shania Twain','singer','female'),
('Charles Dickens','author', 'male'),
('Anna Sewell','author','female'),
('Rudyard Kipling','author', 'male'),
('Juliet','fictional_character', 'female'),
('Jack Sparrow','fictional_character', 'male'),
('Oliver twist','fictional_character', 'male');


#view table
SELECT * FROM career;

# altering career table column gender
UPDATE career
SET gender = 'female'
WHERE id =5 ;

#view table
SELECT * FROM career;


# altering career table column gender
UPDATE career
SET career_name = 'author'
WHERE id =15 ;
#view table
SELECT * FROM career;


# altering career table column gender removing space before female
UPDATE career
SET gender = 'female'
WHERE id =16 ;

#view table
SELECT * FROM career;

#creating table three
CREATE TABLE production (id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,category TEXT, product_title TEXT,famous_people_id INTEGER);
# inserting values
INSERT INTO production (category,product_title,famous_people_id)
VALUES ('movie','Terminator',1),
('movie','Braveheart',2),
('movie','Black Adam', 3),
('movie','Crossroads',4),
('movie','Catwoman',5),
('movie','Glitter',6),
('movie','Poetic Justice',7),
('song','Cold, Cold Heart',8),
('song','Ring of Fire',9),
('song','I saw God today',10),
('song','coal miner’s Daughter',11),
('song','coat of many colors',12),
('song','Fancy',13),
('song','you are still the one',14),
('book','great expectations',15),
('book','black beauty',16),
('book','jungle book',17),
('novel','romeo and juliet',18),
('novel','The Pirates of the Caribbean ',19),
('novel','oliver twist story',20);

#view table 3
SELECT * FROM production;


#view all created tables
SELECT * FROM famous_people;
SELECT * FROM career;
SELECT * FROM production;

 # Counting Unique Data Entries
SELECT count(DISTINCT state),
    count(DISTINCT category)
FROM famous_people,production;

# Which famous people are married
SELECT * FROM famous_people
WHERE  marital_status ='married';

# Which famous people are not married
SELECT * FROM famous_people
WHERE  marital_status ='unmarried';

# number of married famous people 
SELECT count(marital_status)
FROM famous_people
WHERE marital_status = 'married';

# number of unmarried famous people 
SELECT count(marital_status)
FROM famous_people
WHERE marital_status = 'unmarried';

# what songs did the famous people sing  
SELECT famous_people.name AS singer,production.category,production.product_title AS song_title
FROM famous_people
JOIN production
ON famous_people.id = production.id
WHERE category= 'song';

# what books did the fictional characters  show up in
SELECT famous_people.name AS fictional_character, production.category,production.product_title AS novel_title
FROM famous_people
JOIN production
ON famous_people.id = production.id
WHERE category = 'novel';

# what movies do the famous people show up in
SELECT famous_people.name AS actor,production.category,production.product_title AS movie_title
FROM famous_people
JOIN production
USING (id)
WHERE category = 'movie';

# what books did the famous authors write
SELECT famous_people.name AS author, production.category, production.product_title AS book_title
FROM famous_people
JOIN production
ON famous_people.id = production.id
WHERE category = 'book';

# married movie_stars and where they live
SELECT famous_people.marital_status , famous_people.state,career.career_name
FROM famous_people
JOIN career
ON famous_people.id =career.id
WHERE marital_status = 'married' AND career_name = 'movie_star';

# Unmarried movie_stars and where they live
SELECT famous_people.marital_status, famous_people.state,career.career_name
FROM famous_people
JOIN career
ON famous_people.id =career.id
WHERE marital_status = 'unmarried' AND career_name = 'movie_star';

# married singers and where they live
SELECT famous_people.marital_status, famous_people.state,career.career_name
FROM famous_people
JOIN career
ON famous_people.id =career.id
WHERE marital_status = 'married' AND career_name = 'singer';

# Unmarried singers and where they live
SELECT famous_people.marital_status, famous_people.state,career.career_name
FROM famous_people
JOIN career
ON famous_people.id =career.id
WHERE marital_status = 'unmarried' AND career_name = 'singer';

# finding the gender and marital status of the famous people
SELECT famous_people.marital_status, career.gender
FROM famous_people
JOIN career
ON famous_people.id = career.id;
