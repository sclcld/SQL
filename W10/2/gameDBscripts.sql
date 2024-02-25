show tables;

-- Seleziona tutti gli impiegati con una laurea in Economia. 
SELECT * FROM impiegati WHERE titoloStudio = 'Laurea in Economia';
SELECT * FROM impiegati WHERE titoloStudio LIKE "%Economia";

-- Seleziona gli impiegati che lavorano come Cassiere o che hanno un Diploma di Informatica. 
SELECT 
	impiegati.nome,
    impiegati.titoloStudio,
    turni.carica
FROM impiegati
JOIN turni ON turni.lavoratore = impiegati.codiceFiscale
WHERE turni.carica = 'Cassiere' OR impiegati.titoloStudio LIKE "%Informatica";

-- Seleziona i nomi e i titoli degli impiegati che hanno iniziato a lavorare dopo il 1 gennaio 2023. 
SELECT 
	impiegati.nome,
    turni.inizio
FROM impiegati
JOIN turni ON turni.lavoratore = impiegati.codiceFiscale
WHERE turni.inizio > '2023-01-01';

-- Seleziona i titoli di studio distinti tra gli impiegati.
SELECT 
	DISTINCT titoloStudio
FROM impiegati;
    
-- Seleziona gli impiegati con un titolo di studio diverso da "Laurea in Economia". 

SELECT 
	codiceFiscale, 
    nome,
    titoloStudio
 FROM impiegati WHERE titoloStudio <> "Laurea in Economia";   

-- Seleziona gli impiegati che hanno iniziato a lavorare prima del 1 luglio 2023 e sono Commessi.
SELECT 
	impiegati.nome,
    turni.inizio
FROM impiegati
JOIN turni ON turni.lavoratore = impiegati.codiceFiscale
WHERE turni.inizio < '2023-07-01' AND turni.carica = "Commesso"; 

-- Seleziona i titoli e gli sviluppatori dei videogiochi distribuiti nel 2020. 
SELECT 
	titolo, 
    sviluppatore 
FROM giochi WHERE anno = "2020";

