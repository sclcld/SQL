create database toysDB;

USE toysDB;

CREATE TABLE categories(
categoryID int PRIMARY KEY,
categoryName varchar(20)
);

CREATE TABLE countries(
countryID int PRIMARY KEY,
country varchar(20)
);

CREATE TABLE regions(
regionID int PRIMARY KEY,
region varchar(20)
);

CREATE TABLE countryRegion(
countryID int,
regionID int,
PRIMARY KEY (countryID, regionID),
FOREIGN KEY (countryID) REFERENCES countries(countryID),
FOREIGN KEY (regionID) REFERENCES regions(regionID)	
);

CREATE TABLE products(
productID int PRIMARY KEY,
productName varchar(50),
categoryID int,
price decimal(7,2),
manufacturer varchar(30),
FOREIGN KEY (categoryID) REFERENCES categories(categoryID)
);

CREATE TABLE sales(
saleID int PRIMARY KEY,
productID int,
amount int,
saledate date,
countryID int,
FOREIGN KEY (productID) REFERENCES products(productID),
FOREIGN KEY (countryID) REFERENCES countries(countryID)
);

INSERT INTO categories VALUES
(1, 'Art'),
(2, 'Math'),
(3, 'Science'),
(4, 'Constructions'),
(5, 'Trivia'),
(6, 'Logic'),
(7, 'Magic');

INSERT INTO countries VALUES
(1, 'Italy'),
(2, 'Greece'),
(3, 'Spain'),
(4, 'Portugal'),
(5, 'Switzerland'),
(6, 'Germany'),
(7, 'Netherlands'),
(8, 'Finland'),
(9, 'Poland'),
(10, 'Albania');

INSERT INTO regions VALUES
(1, 'Southern Europe'),
(2, 'Western Europe'),
(3, 'Northern Europe'),
(4, 'Central Europe');

INSERT INTO countryRegion VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 2),
(7, 2),
(8, 3),
(9, 4),
(10, 4);

INSERT INTO products VALUES
(1, "Paint with POLLOCK", 1, 45.50, "Painting Games"),
(2, "Van Gogh's Dreams", 1, 34.50, "Painting Games"),
(3, "Learning to Count", 2, 12.00, "Boring INC."),
(4, "Walter White's Crazy Chimician", 3, 55.00, "Destroy Games"),
(5, "PLUTONIUM!!!", 3, 120.00, "Destroy Games"),
(6, "Meccano", 4, 80.00, "Mecchag."),
(7, "Mount Etna", 4, 200.00, "Lego"),
(8, "Trivial Trivia", 5, 38.00, "Noway"),
(9, "Try-via", 5, 8.00, "Noway"),
(10, "What a Scam!", 6, 4.00, "Noway"),
(11, "Make your Brother Disappear", 7, 80.00, "LiveDreaming Games");

INSERT INTO sales VALUES
(1, 9, 330, "2021-08-16", 1),
(2, 7, 600, "2021-04-19", 2),
(3, 6, 200, "2020-04-06", 3),
(4, 9, 78, "2022-08-16", 3),
(5, 9, 90, "2021-09-17", 6),
(6, 1, 45, "2021-03-13", 8),
(7, 4, 70, "2021-04-14", 9),
(8, 6, 240, "2021-09-15", 10),
(9, 8, 20, "2021-06-17", 2),
(10, 8, 240, "2021-03-17",4),
(11, 9, 45, "2022-09-17", 4),
(12, 10, 100, "2021-07-13", 7),
(13, 9, 234, "2021-11-10", 8),
(14, 11, 456, "2023-01-20",8),
(15, 11, 789, "2022-05-16", 3),
(16, 11, 140, "2021-09-15", 2),
(17, 1, 143, "2021-05-05", 1),
(18, 4, 53, "2020-01-03", 10),
(19, 11, 120, "2021-04-21", 10),
(20, 7, 50, "2022-09-12", 10);


 -- 1. Verificare che i campi definiti come PK siano univoci. 
 
-- dato che le PK sono da considerarsi per loro natura "VALORI UNIVOCI" ho eleaborato due tipologie differenti di query per verificare l'unicità dei campi
-- con queste tre query calcolo il numero di primary keys e il numero dei loro distinct nelle tabelle categories, countries, regions.
SELECT count(categoryID), count(DISTINCT categoryID) 
FROM categories 
AS catComparation;

SELECT count(countryID), count(DISTINCT countryID) 
FROM countries 
AS couComparation;

SELECT count(regionID), count(DISTINCT regionID) 
FROM regions 
AS regComparation;

-- con queste due invece, tramite sub query ottengo il conteggio per ogni PK, e poi ne cerco il valore massimo.
SELECT MAX(keyCount) FROM(
SELECT countryID, count(countryID) AS keyCount 
FROM countries 
GROUP BY countryID) 
as maxOccurrencies;

SELECT MAX(kCount) FROM(
SELECT saleID, count(saleID) AS kCount 
FROM sales 
GROUP BY saleID) 
AS maxOcc;

-- 2. Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno. 

-- tramite join ottengo i records della tabella sales e quella della tabella prodotti, ottengo il fatturato moltiplicando quantità e prezzo, e li ordino come richiesto
SELECT  products.productID, products.productName, YEAR(sales.saledate) AS saleYear, SUM(sales.amount * products.price) AS totalRevenue
FROM products 
JOIN sales ON products.productID = sales.productID
GROUP BY products.productID,  products.productName,  YEAR(sales.saledate)
ORDER BY  products.productID,  saleYear;

-- 3. Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente. 

-- join tra sales, countries e products e li ordino come richiesto
SELECT YEAR(sales.saledate) AS saleYear, countries.country AS state, SUM(sales.amount * products.price) AS totalRevenue
FROM sales  
JOIN products ON sales.productID = products.productID
JOIN countries ON sales.countryID = countries.countryID
GROUP BY YEAR(sales.saledate), countries.country
ORDER BY saleYear ASC,  totalRevenue DESC;

-- 4. Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato? 

-- dopo aver ottenuto la categoria e la somma del totale dei pezzi ordinati, con sum ottengo il totale, utilizzando l'ordine discendente con limit 
-- isolo il risultato più alto. La risposta è Magic con 1505 pezzi venduti.
SELECT categoryName, SUM(sales.amount) AS totalAmount
FROM products
JOIN categories ON products.categoryID = categories.categoryID
JOIN sales ON products.productID = sales.productID
GROUP BY categoryName
ORDER BY totalAmount DESC
LIMIT 1;


-- 5. Rispondere alla seguente domanda: quali sono, se ci sono, i prodotti invenduti? Proponi due approcci risolutivi differenti. 

-- I prodotti invenduti sono "Van Gogh's Dreams, "PLUTONIUM!!!" e "Learning to count"
-- nel primo approccio seleziono il nome di un prodotto utilizzando la clausola WHERE NOT EXIST su una sub-query che fa un confronto booleano e seleziona solo i valori True
SELECT products.productName
FROM products
WHERE NOT EXISTS (
    SELECT 1
    FROM sales
    WHERE sales.productID = products.productID
);

-- il secondo è un approccio più classico. Estraggo i nomi dei prodotti e verifico che la il loro ID non sia tra i prodotti di Sales. 
-- Il risultato ottenuto è chiaramente lo stesso della query precedente 
SELECT productName from products
WHERE products.productID NOT IN (SELECT productID FROM sales);

-- 6. Esporre l’elenco dei prodotti con la rispettiva ultima data di vendita (la data di vendita più recente).

-- tramite join seleziono prodotto e data più recente("grande")
SELECT products.productName, MAX(sales.saledate) AS mostRecent
FROM products
JOIN sales ON products.productID = sales.productID
GROUP BY products.productName;

-- Esporre l’elenco delle transazioni indicando nel result set il codice documento, la data, il nome del prodotto, la categoria del prodotto, il nome dello stato, 
-- il nome della regione di vendita e un campo booleano valorizzato in base alla condizione che siano passati più di 180 giorni dalla data vendita o meno 
-- (>180 -> True, <= 180 -> False)

-- Dopo aver effettuato tutte le join tra le tabelle se il valore della differenza tra la data odierna e quella della tabella SALES è superiore a 180 giorni, case
-- restituisce TRUE altimenti FALSE. In questo caso restituisce solo valori positivi perchè non sono presenti record successivi alla metà del 2023.
SELECT 
    sales.saleID,
    sales.saleDate,
    products.productName ,
    categories.categoryName,
    countries.country,
    regions.region,
    CASE WHEN (NOW()- sales.saleDate > 180) THEN 1 ELSE 0 END AS moreThanSixMonths
  
FROM 
    sales
JOIN products ON sales.productID = products.productID
JOIN categories ON products.categoryID = categories.categoryID
JOIN countries ON sales.countryID = countries.countryID
JOIN countryRegion ON countries.countryID = countryRegion.countryID
JOIN regions ON countryRegion.regionID = regions.regionID;

