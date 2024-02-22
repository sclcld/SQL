CREATE TABLE prodotti(
IDProdotto int PRIMARY KEY,
nomeProdotto varchar(50), 
prezzo decimal(10, 2)
);

CREATE TABLE clienti(
IDCliente int PRIMARY KEY, 
Nome varchar(50),
Email varchar(50) 
);

CREATE TABLE ordini(
IDOrdine int PRIMARY KEY,
IDProdotto int,
IDCliente int,
Quantità int, 
FOREIGN KEY (IDProdotto) REFERENCES prodotti(IDProdotto),
FOREIGN KEY (IDCliente) REFERENCES clienti(IDCliente)
);

CREATE TABLE DettaglioOrdini (
    IDOrdine int,
    IDProdotto int,
    IDCliente int,
    PRIMARY KEY (IDOrdine, IDProdotto, IDCliente),
    FOREIGN KEY (IDOrdine) REFERENCES ordini(IDOrdine),
    FOREIGN KEY (IDProdotto) REFERENCES prodotti(IDProdotto),
    FOREIGN KEY (IDCliente) REFERENCES clienti(IDCliente)
);

INSERT INTO prodotti VALUES
(1, "Tablet", 300.00),
(2, "Mouse", 20.00), 
(3, "Tastiera", 25.00),
(4, "Monitor", 180.00), 
(5, "HHD", 90.00),
(6, "SSD", 200.00),
(7, "RAM", 100.00),
(8, "Router", 80.00), 
(9, "Webcam", 45.00),
(10, "GPU", 1250.00), 
(11, "Trackpad", 500.00), 
(12, "Techmagazine", 5.00),
(13, "Martech", 50.00);

INSERT INTO clienti VALUES
(2, "Battista", "battista@mailmail.it"), 
(3, "Maria", "maria@posta.it"),
(4, "Franca", "franca@lettere.it"),
(6, "Arianna", "arianna@posta.it"), 
(7, "Piero", "piero@lavoro.it");

INSERT INTO clienti (IDCliente, Nome) VALUES
(1, "Antonio"),
(5, "Ettore");

INSERT INTO ordini VALUES
(1, 2, 1, 10),
(2, 6, 2, 2),
(3, 5, 3, 3),
(4, 1, 4, 1),
(5, 9, 5, 1),
(6, 4, 6, 2),
(7, 11, 7, 6),
(8, 10, 3, 2),
(9, 3, 4, 3),
(10, 3, 5, 1),
(11, 2, 1, 1);







