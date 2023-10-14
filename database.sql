CREATE TABLE Books (
id INTEGER PRIMARY KEY,
titre TEXT,
auteur TEXT,
genre TEXT,
annee_publication INTEGER,
exemplaires_disponibles INTEGER
);

CREATE TABLE Membres (
id INTEGER PRIMARY KEY,
nom TEXT,
email TEXT,
password TEXT,
date_inscription DATE
);

CREATE TABLE Emprunts (
id INTEGER PRIMARY KEY,
membre_id INTEGER,
book_id INTEGER,
date_emprunt DATE,
date_retour_prevue DATE,
FOREIGN KEY(membre_id) REFERENCES Membres(id),
FOREIGN KEY(book_id) REFERENCES Books(id)
);

CREATE TABLE Retours (
id INTEGER PRIMARY KEY,
emprunt_id INTEGER,
date_retour_effectif DATE,
penalite_retard REAL,
FOREIGN KEY(emprunt_id) REFERENCES Emprunts(id)
);

CREATE TABLE HistoriqueEmprunts (
id INTEGER PRIMARY KEY,
membre_id INTEGER,
book_id INTEGER,
date_emprunt DATE,
date_retour DATE,
FOREIGN KEY(membre_id) REFERENCES Membres(id),
FOREIGN KEY(book_id) REFERENCES Books(id)
);
