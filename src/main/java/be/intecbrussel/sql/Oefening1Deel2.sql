Use thebelgianbrewerydb;

##(a)
SELECT  DISTINCT COUNT(*) AS TotalNumberOfBrewers
FROM Brewers;

##(b)
SELECT AVG(Turnover) AS AverageTurnOver
FROM Brewers;

##(c)
SELECT MIN(Alcohol)           AS MinimumAlcPercentage,
       ROUND(AVG(Alcohol), 4) AS AverageAlcPercentage,
       MAX(Alcohol)           AS MaxAlcPercentage
FROM Beers;


##(d)
SELECT Round(AVG(Turnover), 4)  AS AverageTurnover
FROM Brewers
WHERE ZipCode LIKE '1%'
  AND Name NOT IN ('Palm');


##(e)
SELECT CategoryId, ROUND(AVG(Alcohol), 2) AS AverageAlcPercentage
FROM Beers
WHERE CategoryId NOT IN ('null')
GROUP BY CategoryId;


##(f)
SELECT CategoryId, MAX(Price) AS Price
FROM Beers
WHERE Stock > 0
  AND Price > 3
GROUP BY CategoryId;
