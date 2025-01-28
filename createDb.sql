CREATE DATABASE easycook;

CREATE TABLE users (
    Id CHAR(36) NOT NULL PRIMARY KEY,
    Name VARCHAR(25),
    Email VARCHAR(50) UNIQUE,
    Password VARCHAR(25),
    Permissions BOOLEAN DEFAULT 1
);

-- Tabela recipes
CREATE TABLE recipes (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Name VARCHAR(250),
    Category VARCHAR(250),
    Area VARCHAR(250),
    Image LONGTEXT,
    Instructions LONGTEXT,
    Time INT,
    Cost DOUBLE,
    Difficulty VARCHAR(35),
    UserId CHAR(36),
    FOREIGN KEY (UserId) REFERENCES users(Id)
);

-- Tabela ingredients
CREATE TABLE ingredients (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150),
    RecipeId INT,
    foreign key (RecipeId) references recipes(Id)
);

-- Tabela lists
CREATE TABLE lists (
    Id CHAR(36) NOT NULL PRIMARY KEY,
    UserId CHAR(36),
    FOREIGN KEY (UserId) REFERENCES users(Id)
);

-- Tabela recipes_lists
CREATE TABLE recipes_lists (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RecipeId INT,
    ListId CHAR(36),
    FOREIGN KEY (RecipeId) REFERENCES recipes(Id),
    FOREIGN KEY (ListId) REFERENCES lists(Id)
);
