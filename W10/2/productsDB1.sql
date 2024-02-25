-- Seleziona tutti i prodotti con un prezzo superiore a 50 euro dalla tabella Prodotti. 
SHOW databases;

USE products;

SELECT * FROM prodotti WHERE prezzo > 50;

-- Seleziona tutte le email dei clienti il cui nome inizia con la lettera 'A' dalla tabella Clienti. 
SELECT * FROM clienti WHERE LEFT (nome, 1) = "A";
 
-- Seleziona tutti gli ordini con una quantità maggiore di 10 o con un importo totale inferiore a 100 euro dalla tabella Ordini.
SELECT * FROM ordini
JOIN prodotti ON ordini.IDProdotto = prodotti.IDProdotto
WHERE ordini.quantità > 10 OR prodotti.prezzo * ordini.quantità > 100;

-- Seleziona tutti i prezzi dei prodotti il cui nome contiene la parola 'tech' indipendentemente dalla posizione nella tabella Prodotti.
SELECT * FROM prodotti WHERE nomeProdotto LIKE '%tech';

-- Seleziona tutti i clienti che non hanno un indirizzo email nella tabella Clienti. 
SELECT * FROM clienti WHERE Email IS NULL;

-- Seleziona tutti i prodotti il cui nome inizia con 'M' e termina con 'e' indipendentemente dalla lunghezza della parola nella tabella Prodotti.
SELECT * FROM prodotti WHERE nomeProdotto LIKE 'M%e';