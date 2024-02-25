CREATE DATABASE videogameDB;

USE videogameDB;

CREATE TABLE stores(
storeID int PRIMARY KEY,
ndirizzoFisico varchar(50),
numeroTelefono varchar(20)
);

CREATE TABLE impiegati(
codiceFiscale varchar(16) PRIMARY KEY,
nome varchar(20),
titoloStudio varchar(50),
mail varchar(50)
);

CREATE TABLE turni(
turnoID int PRIMARY KEY,
lavoratore varchar(16),
store int,
carica varchar(20),
inizio date,
fine date,
FOREIGN KEY (lavoratore) references impiegati(codiceFiscale),
FOREIGN KEY (store) references stores(storeID)
);

CREATE TABLE giochi(
giocoID int PRIMARY KEY,
titolo varchar(80),
sviluppatore varchar(20),
anno year,
costo decimal(5,2),
genere varchar(20),
remake varchar(20) NULL
);

INSERT INTO stores VALUES
(1, 'Via Roma 123, Milano', '+39 02 1234567'),
(2, 'Corso Italia 456, Roma','+39 06 7654321'),
(3, 'Piazza San Marco 789, Venezia', '+39 041 9876543'),
(4, 'Viale degli Ulivi 234, Napoli', '+39 081 3456789'),
(5, 'Via Torino 567, Torino', '+39 011 8765432'),
(6, 'Corso Vittorio Emanuele 890, Firenze', '+39 055 2345678'),
(7, 'Piazza del Duomo 123, Bologna', '+39 051 8765432'),
(8, 'Via Garibaldi 456, Genova', '+39 010 2345678'),
(9, 'Lungarno Mediceo 789, Pisa', '+39 050 8765432'),
(10, 'Corso Cavour 101, Palermo', '+39 091 2345678');

INSERT INTO impiegati VALUES
('ABC12345XYZ67890', 'Mario Rossi', 'Laurea in Economia', 'mario.rossi@email.com'),
('DEF67890XYZ12345', 'Anna Verdi', 'Diploma di Ragioneria', 'anna.verdi@email.com'),
('GHI12345XYZ67890', 'Luigi Bianchi', 'Laurea in Informatica', 'luigi.bianchi@email.com'),
('JKL67890XYZ12345', 'Laura Neri', 'Laurea in Lingue', 'laura.neri@email.com'),
('MNO12345XYZ67890', 'Andrea Moretti', 'Diploma di Geometra', 'andrea.moretti@email.com'),
('PQR67890XYZ12345', 'Giulia Ferrara', 'Laurea in Psicologia', 'giulia.ferrara@email.com'),
('STU12345XYZ67890', ' Marco Esposito', 'Diploma di Elettronica', 'marco.esposito@email.com'),
('VWX67890XYZ12345', 'Sara Romano', 'Laurea in Giurisprudenza', 'sara.romano@email.com'),
('YZA12345XYZ67890', 'Roberto De Luca', 'Diploma di Informatica', 'roberto.deluca@email.com'),
('BCD67890XYZ12345', 'Elena Santoro', 'Laurea in Lettere', 'elena.santoro@email.com');

INSERT INTO turni VALUES
(1,'ABC12345XYZ67890', 1, 'Cassiere', '2023-01-01', '2023-12-31'),
(2,'DEF67890XYZ12345', 2, 'Commesso', '2023-02-01', '2023-11-30'),
(3,'GHI12345XYZ67890', 3, 'Magazziniere', '2023-03-01', '2023-10-31'),
(4,'JKL67890XYZ12345', 4, 'Addetto alle vendite', '2023-04-01', '2023-09-30'),
(5,'MNO12345XYZ67890', 5, 'Addetto alle pulizie', '2023-05-01', '2023-08-31'),
(6,'PQR67890XYZ12345', 6, 'Commesso', '2023-06-01', '2023-07-31'),
(7,'STU12345XYZ67890', 7, 'Commesso', '2023-07-01', '2023-06-30'),
(8,'VWX67890XYZ12345', 8, 'Cassiere', '2023-08-01', '2023-05-31'),
(9,'YZA12345XYZ67890', 9, 'Cassiere',' 2023-09-01', '2023-04-30'),
(10,'BCD67890XYZ12345',10, 'Cassiere', '2023-10-01', '2023-03-31');

INSERT INTO giochi VALUES
(1,'Fifa 2023', 'EA Sports', '2023', 49.99, 'Calcio', NULL),
(2,'Assassin s Creed: Valhalla', 'Ubisoft', '2020', 59.99, 'Action',NULL),
(3,'Super Mario Odyssey', 'Nintendo', '2017', 39.99, 'Platform', NULL),
(4,'The Last of Us Part II', 'Naughty Dog', '2020', 69.99, 'Action', NULL),
(5,'Cyberpunk 2077', 'CD Projekt Red', '2020', 49.99, 'RPG', NULL),
(6,'Animal Crossing: New Horizons', 'Nintendo', '2020',54.99, 'Simulation', NULL),
(7,'Call of Duty: Warzone', 'Infinity Ward', '2020', 0.0, 'FPS', NULL),
(8,'The Legend of Zelda: Breath of the Wild ', 'Nintendo', '2017', 59.99, 'Action-Adventure', NULL),
(9,'Fortnite', 'Epic Games', '2017', 0.0, 'Battle Royale', NULL),
(10,'Red Dead Redemption 2', 'Rockstar Games', '2018', 39.99, 'Action-AdventurE', NULL);