CREATE TABLE Beers
(
    Id         int NOT NULL AUTO_INCREMENT,
    Name       varchar(255) DEFAULT NULL,
    BrewerId   INT     DEFAULT NULL,
    CategoryId INT     DEFAULT NULL,
    Price      FLOAT   DEFAULT '0',
    Stock      INT     DEFAULT '0',
    Alcohol    FLOAT   DEFAULT '0',
    Version    INT     DEFAULT '0',
    Image      BLOB,
    PRIMARY KEY (Id),

    CONSTRAINT Beers_Categories FOREIGN KEY (CategoryId) REFERENCES Categories (Id),
    CONSTRAINT Beers_Brewers FOREIGN KEY (BrewerId) REFERENCES Brewers (Id)
);



##ALTER TABLE Beers
## ADD FOREIGN KEY (BrewerId) REFERENCES Brewers (Id),
## ADD FOREIGN KEY (CategoryId) REFERENCES Categories (Id);


