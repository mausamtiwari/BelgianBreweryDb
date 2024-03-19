USE thebelgianbrewerydb;

# (a) Selecteer de brouwers die een turnover hebben die hoger dan het gemiddelde is. (16)

SELECT Brewers.Name AS BrewersName
FROM Brewers
WHERE Brewers.Turnover > (SELECT AVG(Turnover) AS AverageTurnover FROM Brewers);


# Toon alle bieren die het minimum of maximum alcohol gehalte hebben. (33)Select

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
#     Het is mogelijkdat er meerdere bieren per brouwer geselecteerd worden. (266)

SELECT Brewers.Name AS BrewerName, Beers.Name AS BeerName, Beers.Price AS BeerPrice
FROM Beers
         INNER JOIN Brewers ON Brewers.Id = Beers.id
    AND Beers.Price = (SELECT MAX(Price) FROM Beers WHERE Beers.Id = Brewers.Id);