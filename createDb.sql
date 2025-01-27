CREATE DATABASE easycook;
 
CREATE TABLE users (
	Id CHAR(36) NOT NULL PRIMARY KEY,
    Name VARCHAR(25),
    Email VARCHAR(50) UNIQUE,
    Password VARCHAR(25),
    Permissions Boolean DEFAULT 1
);

CREATE TABLE recipes (
	Id INT auto_increment NOT NULL PRIMARY KEY,
    Name varchar(250),
	Category varchar(250),
	Area varchar(250),
	Image longtext,
	Instructions longtext,
	Time int,
	Cost double,
	Difficulty varchar(35),
    UserId INT,
	FOREIGN KEY (UserId)  REFERENCES users(Id)
);

CREATE TABLE ingredients (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150),
    RecipeId INT,
    FOREIGN KEY (ListId) REFERENCES lists(id)
);

CREATE TABLE lists (
	Id CHAR(36) NOT NULL PRIMARY KEY,
    UserId CHAR(36),
    FOREIGN KEY (UserId) REFERENCES users(id)
);

CREATE TABLE recipes_lists (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RecipeId INT,
    ListId CHAR(36),
    FOREIGN KEY (ListId) REFERENCES lists(id)
);
