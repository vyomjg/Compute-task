CREATE DATABASE Social_Media;
 
USE  Social_Media;

CREATE TABLE Users (
  user_id VARCHAR(20) PRIMARY KEY,
  username VARCHAR(20),
  email VARCHAR(50),
  join_date DATE,
  country VARCHAR(20),
  bio VARCHAR(100)
);

INSERT INTO Users VALUES("U001","social_butterfly","userr001@email.com","2023-01-15","USA","Love to travel");
INSERT INTO Users VALUES("U002","tech_guru","techiee1@email.com","2022-10-19","India","Tech enthusiast");
INSERT INTO Users VALUES("U003","fitness_fanatic","fitman@email.com","2021-03-04","Brazil","Dumbells are love");
INSERT INTO Users VALUES("U004","udk_01","mystryguy@email.com","2020-01-25","USA","Magic is my passion");
INSERT INTO Users VALUES("U005","hey_butterfly","guideme1@email.com","2019-07-15","USA","-----");
INSERT INTO Users VALUES("U006","social_being","currupt07@email.com","2018-09-17","India","HELOO:)");

CREATE TABLE Posts (
  post_id VARCHAR(20) PRIMARY KEY,
  user_id VARCHAR(20),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  content VARCHAR(50),
  time_stamp TIMESTAMP, 
  likes_count INT,
  comments_count INT
);

INSERT INTO Posts VALUES("P001","U001","Beach!","2023-09-19 15:30:00","42","1");
INSERT INTO Posts VALUES("P002","U001","Mountain","2023-05-17 15:30:00","33","1");
INSERT INTO Posts VALUES("P003","U001","Rain","2023-07-06 15:30:00","31","2");
INSERT INTO Posts VALUES("P004","U001","Night life!","2023-10-17 15:30:00","37","1");
INSERT INTO Posts VALUES("P005","U002","yaaaay","2023-09-17 15:30:00","03","1");
INSERT INTO Posts VALUES("P006","U002","New Year!!","2023-09-17 15:30:00","09","2");
INSERT INTO Posts VALUES("P007","U002","Vallyes","2023-09-17 15:30:00","11","1");
INSERT INTO Posts VALUES("P008","U003","Cricket","2023-09-17 15:30:00","47","2");
INSERT INTO Posts VALUES("P009","U004","Sunset","2023-09-17 15:30:00","03","0");
INSERT INTO Posts VALUES("P010","U005","Coffee","2023-09-17 15:30:00","15","1");
INSERT INTO Posts VALUES("P011","U006","HEYY","2023-09-17 15:30:00","11","1");

CREATE TABLE Comments (
  comment_id VARCHAR(20) PRIMARY KEY,
  post_id VARCHAR(20),
  FOREIGN KEY (post_id) REFERENCES Posts(post_id),
  user_id VARCHAR(20),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  content VARCHAR(50),
  time_stamp TIMESTAMP
);

INSERT INTO Comments VALUES("C001","P001","U002","Looks Amaze","2024-05-11 15:40:02");
INSERT INTO Comments VALUES("C002","P002","U002","WOOW","2024-05-11 15:41:03");
INSERT INTO Comments VALUES("C003","P003","U003","AMAZING","2024-05-11 15:42:04");
INSERT INTO Comments VALUES("C004","P003","U005","CONGRATS","2024-05-11 15:43:02");
INSERT INTO Comments VALUES("C005","P004","U004","SUPEERB","2024-05-11 15:44:02");
INSERT INTO Comments VALUES("C006","P005","U006","FINALY","2024-05-11 15:45:02");
INSERT INTO Comments VALUES("C007","P006","U004","YEAHH","2024-05-11 15:46:02");
INSERT INTO Comments VALUES("C008","P006","U003","LITT","2024-05-11 15:47:02");
INSERT INTO Comments VALUES("C009","P007","U001","FIRE","2024-05-11 15:48:02");
INSERT INTO Comments VALUES("C010","P008","U005","UUFFFF","2024-05-11 15:49:02");
INSERT INTO Comments VALUES("C011","P008","U002","GREAT","2024-05-11 15:50:02");
INSERT INTO Comments VALUES("C012","P010","U001","HAHAHA","2024-05-11 15:51:02");
INSERT INTO Comments VALUES("C013","P011","U003","OMGG","2024-05-11 15:52:02");


CREATE TABLE Friendship (
  friendship_id VARCHAR(20) PRIMARY KEY,
  user_id1 VARCHAR(20),
  FOREIGN KEY (user_id1) REFERENCES Users(user_id),
  user_id2 VARCHAR(20),
  FOREIGN KEY (user_id2) REFERENCES Users(user_id),
  status VARCHAR(20),
  created_at DATE
);

INSERT INTO Friendship VALUES("F001","U001","U002","accepted","2024-05-11");
INSERT INTO Friendship VALUES("F002","U001","U005","rejected","2024-05-12");
INSERT INTO Friendship VALUES("F003","U003","U004","pending","2024-05-13");
INSERT INTO Friendship VALUES("F004","U004","U001","accepted","2024-05-14");
INSERT INTO Friendship VALUES("F005","U006","U002","pending","2024-05-15");

CREATE TABLE UserIntrests (
  intrest_id VARCHAR(20) PRIMARY KEY,
  user_id VARCHAR(20),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  intrest VARCHAR(50)
);

INSERT INTO UserIntrests VALUES("I001","U001","TRAVEL");
INSERT INTO UserIntrests VALUES("I002","U002","TECHNOLOGY");
INSERT INTO UserIntrests VALUES("I003","U003","FITNESS");
INSERT INTO UserIntrests VALUES("I004","U004","MAGIC");
INSERT INTO UserIntrests VALUES("I005","U005","MUSIC");
INSERT INTO UserIntrests VALUES("I006","U006","WRITING");
INSERT INTO UserIntrests VALUES("I007","U001","DANCING");
INSERT INTO UserIntrests VALUES("I008","U002","TRAVEL");
INSERT INTO UserIntrests VALUES("I009","U004","MUSIC");
INSERT INTO UserIntrests VALUES("I010","U005","DANCING");
INSERT INTO UserIntrests VALUES("I011","U003","MUSIC");
INSERT INTO UserIntrests VALUES("I012","U002","DANCING");

#1
SELECT user_id, count(post_id)
FROM Posts
GROUP BY user_id
HAVING count(post_id) >=3; 

#2
SELECT country, count(user_id) 
FROM Users
GROUP BY country
ORDER BY count(user_id) DESC
LIMIT 2;

SELECT country,user_id 
FROM Users
GROUP BY country,user_id
ORDER BY country DESC
LIMIT 5;

#3
SELECT user_id1, user_id2
FROM Friendship 
GROUP BY user_id1, user_id2
HAVING status = accepted;



