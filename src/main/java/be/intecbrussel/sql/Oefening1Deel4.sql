USE thebelgianbrewerydb;

# (a) Selecteer de brouwers die een turnover hebben die hoger dan het gemiddelde is. (16)

SELECT Brewers.Name AS BrewersName
FROM Brewers
WHERE Brewers.Turnover > (SELECT AVG(Turnover) AS AverageTurnover FROM Brewers);


# Toon alle bieren die het minimum of maximum alcohol gehalte hebben. (33)

SELECT Beers.Name AS BeerName
FROM Beers
WHERE Beers.Alcohol =
      (SELECT MAX(Beers.Alcohol) AS MaximumAlcohol
       FROM Beers)
   OR Beers.Alcohol = (SELECT MIN(Beers.Alcohol) AS MaximumAlcohol
                       FROM Beers);

# (c) Toon alle bieren met een alcohol hoger dan het gemiddelde en waarvan de brouwers een turnover hebben
#     dat boven het gemiddelde ligt. (60)

SELECT Beers.Name AS BeerName
FROM Beers
         INNER JOIN Brewers on Beers.BrewerId = Brewers.Id
WHERE Beers.Alcohol > (SELECT AVG(Alcohol) AS AverageAlcohol FROM Beers)
  AND Brewers.Turnover > (SELECT AVG(Turnover) AS AverageTurnover FROM Brewers);


# (d) Doordenker zonder search: toon een lijst van alle brouwers met de prijs en naam van hun duurste bier.
#     Het is mogelijkdat er meerdere bieren per brouwer geselecteerd worden. (113)

SELECT brewers.Name AS BrewerName, MAX(Price) AS MaxPrice, GROUP_CONCAT(beers.Name) AS Expensivebeers
FROM brewers
         JOIN beers ON brewers.Id = beers.BrewerId
         JOIN (SELECT MAX(Price) AS max_price, BrewerId FROM beers GROUP BY BrewerId) AS ExpensiveBeers
              ON beers.BrewerId = ExpensiveBeers.BrewerId AND beers.Price = ExpensiveBeers.max_price
GROUP BY brewers.Name;

## OR

SELECT Brewers.Name AS BrewerName, MAX(Beers.Price) AS MaxPrice, GROUP_CONCAT(Beers.Name) AS ExpensiveBeers
FROM Brewers
         JOIN Beers ON Brewers.Id = Beers.BrewerId
WHERE Beers.Price = (SELECT MAX(Price) FROM Beers WHERE Beers.BrewerId = Brewers.Id)
GROUP BY Brewers.Name;



# (d) Doordenker zonder search: toon een lijst van alle brouwers met de prijs en MaxPrice. En alle
#    alle bieren geproduceerd.
SELECT Brewers.Name                                       AS BrewerName,
       MAX(Beers.Price)                                   AS MaxPrice,
       GROUP_CONCAT(Beers.Name ORDER BY Beers.Price DESC) AS ExpensiveBeers
FROM Brewers
         LEFT JOIN Beers ON Brewers.Id = Beers.BrewerId
GROUP BY Brewers.Id;


# Doordenker zonder search: toon een lijst van alle brouwers met de prijs en naam van hun duurste bier.
# Het is mogelijkdat er meerdere bieren per brouwer geselecteerd worden. (266)

SELECT beers.Name, beers.Price, brewers.Name
FROM brewers
         JOIN beers ON brewers.Id = beers.BrewerId
         JOIN (SELECT MAX(Price) AS max_prices, BrewerId FROM beers GROUP BY BrewerId) AS HIGHTPrices
              ON beers.BrewerId = HIGHTPrices.BrewerId AND beers.Price = HIGHTPrices.max_prices;