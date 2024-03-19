USE thebelgianbrewerydb;

SELECT *
FROM Beers;


##(a)
SELECT *
FROM Categories;


##(b)
SELECT Category
FROM Categories
ORDER BY Category DESC;


##(c)
SELECT *
FROM Brewers
WHERE Turnover > 5000;


##(d)
SELECT Name,City
FROM Brewers
WHERE Turnover < 5000
  AND Turnover > 0
ORDER BY Turnover;


##(e)
SELECT DISTINCT Alcohol
from Beers
ORDER BY Alcohol DESC;


##(f)
SELECT DISTINCT Name
From Beers
WHERE Name LIKE '%wit%'
ORDER BY Name;


##(g)
SELECT *
FROM Beers
WHERE Alcohol IN (4, 5, 6);
## SELECT * FROM Beers WHERE Alcohol BETWEEN 4 AND 6;


##(h)
SELECT *
FROM Beers
ORDER BY Alcohol DESC
Limit 3;


##(i)
SELECT Name
     , Address
     , CONCAT(City, ' ', ZipCode) As City_Zip
FROM Brewers;
