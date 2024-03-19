USE thebelgianbrewerydb;


##(1)
SELECT DISTINCT Alcohol As AlcoholPercentage
from Beers
ORDER BY Alcohol DESC;


##(2)
SELECT City, COUNT(*) AS AantaalBrewerijen
FROM Brewers
GROUP BY City
ORDER BY City;


## (3)
SELECT Beers.Name AS BeerName
FROM Beers
         INNER JOIN Brewers on Brewers.Id = Beers.BrewerId
WHERE City = 'Alken';


##(4)
SELECT Brewers.Name AS BrewersName, ROUND(Avg(Price), 3) AS Averageprice
From Beers
         INNER JOIN Brewers on Brewers.Id = Beers.BrewerId
GROUP BY BrewersName
ORDER BY BrewersName;


##(5)
Select Brewers.Name As BrewersName, COUNT(*) AS BeersProduced
FROM Beers
         INNER JOIN Brewers on Brewers.Id = Beers.BrewerId
GROUP BY BrewersName
HAVING BeersProduced > 10;


##(6)
Select Brewers.Name As BrewersName
FROM Beers
         INNER JOIN Brewers on Brewers.Id  = Beers.BrewerId
         INNER JOIN Categories on Categories.Id = Beers.CategoryId
WHERE Categories.Id = 2
   OR Categories.Id = 3
GROUP BY BrewersName;
