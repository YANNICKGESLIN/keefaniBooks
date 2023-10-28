BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "emprunts" (
	"id"	INTEGER NOT NULL,
	"membre_id"	INTEGER NOT NULL,
	"book_id"	INTEGER NOT NULL,
	"date_emprunt"	DATE NOT NULL,
	"date_retour_prevue"	DATE NOT NULL,
	"Field6"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("book_id") REFERENCES "books"("id"),
	FOREIGN KEY("membre_id") REFERENCES "membres"("id")
);
CREATE TABLE IF NOT EXISTS "historiqueEmprunts" (
	"id"	INTEGER NOT NULL,
	"membre_id"	INTEGER NOT NULL,
	"book_id"	INTEGER NOT NULL,
	"date_emprunt"	DATE NOT NULL,
	"date_retour"	DATE NOT NULL,
	"image"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("membre_id") REFERENCES "membres"("id"),
	FOREIGN KEY("book_id") REFERENCES "books"("id")
);
CREATE TABLE IF NOT EXISTS "membres" (
	"id"	INTEGER NOT NULL,
	"nom"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"password"	TEXT NOT NULL,
	"date_inscription"	DATE,
	"Field6"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "retours" (
	"id"	INTEGER NOT NULL,
	"emprunt_id"	INTEGER NOT NULL,
	"date_retour_effectif"	DATE NOT NULL,
	"penalite_retard"	REAL,
	"Field5"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("emprunt_id") REFERENCES "emprunts"("id")
);
CREATE TABLE IF NOT EXISTS "books" (
	"id"	INTEGER NOT NULL UNIQUE,
	"titre"	TEXT NOT NULL,
	"auteur"	TEXT NOT NULL,
	"genre"	TEXT,
	"annee_publication"	INTEGER,
	"exemplaires_disponibles"	INTEGER,
	"isbn"	INTEGER NOT NULL,
	"image"	BLOB,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "users" (
	"id_users"	INTEGER NOT NULL UNIQUE,
	"username"	TEXT NOT NULL,
	"first_name"	TEXT NOT NULL,
	"last_name"	TEXT NOT NULL,
	"email"	TEXT UNIQUE,
	"password_digest"	TEXT NOT NULL,
	"adresse"	TEXT NOT NULL,
	"phone_number"	INTEGER NOT NULL,
	"date_of_birth"	NUMERIC,
	"role"	TEXT,
	"profile_picture"	TEXT,
	PRIMARY KEY("id_users" AUTOINCREMENT)
);
INSERT INTO "membres" VALUES (1,'Yannick Geslin','Yannick@example.com','password',NULL,NULL);
INSERT INTO "membres" VALUES (2,'Yannick Geslin','Yannick@example.com','password',NULL,NULL);
INSERT INTO "membres" VALUES (3,'Yannick Geslin','Yannick@example.com','password',NULL,NULL);
INSERT INTO "membres" VALUES (4,'Yannick Geslin','Yannick@example.com','password',NULL,NULL);
INSERT INTO "membres" VALUES (5,'Yannick Geslin','Yannick@example.com','password',NULL,NULL);
INSERT INTO "membres" VALUES (6,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (7,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (8,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (9,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (10,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (11,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (12,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (13,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (14,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (15,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (16,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (17,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (18,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (19,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (20,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (21,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (22,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (23,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (24,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
INSERT INTO "membres" VALUES (25,'Nom du membre','email@example.com','motdepasse',NULL,NULL);
COMMIT;
