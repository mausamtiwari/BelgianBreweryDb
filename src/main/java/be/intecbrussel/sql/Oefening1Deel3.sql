USE thebelgianbrewerydb;

##(a)
SELECT Beers.Name AS BeerName, Categories.Category
FROM Beers
         INNER JOIN Categories on Beers.CategoryId = Categories.Id
WHERE Alcohol = 0;


##(b)
SELECT Brewers.Name As BrewersName, MAX(Price) AS MaximumPrice
FROM Beers
         INNER JOIN Brewers on Brewers.Id = Beers.BrewerId
GROUP BY Brewers.Name
ORDER BY BrewersName;


##(c)
SELECT Beers.Id AS BeerId, Beers.Name AS BeerName, Brewers.Name As BrewerName
FROM Beers
         INNER JOIN Brewers on Brewers.Id = Beers.BrewerId
WHERE Beers.Id >= 1500
  AND Beers.Id <= 1600;


##(d)
SELECT Beers.Id            AS BeerId,
       Beers.Name          AS BeerName,
       Beers.Alcohol       As AlcPercentage,
       Brewers.Name        AS BrewerName,
       Categories.Category AS Category

FROM Beers
         INNER JOIN Categories on Categories.Id = Beers.CategoryId
         INNER JOIN Brewers on Brewers.Id = Beers.BrewerId

ORDER BY Alcohol DESC
LIMIT 3;
