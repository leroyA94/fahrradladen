/*#sudo mariadb*/

CREATE DATABASE Fahrradladen;

CREATE USER 'webapp'@'localhost' IDENTIFIED BY 'test';



CREATE TABLE Fahrradladen.Fahrraeder (Id int NOT NULL AUTO_INCREMENT, Marke varchar(255), Groesse int NOT NULL, bezeichnung varchar(255), Preis DOUBLE NOT NULL, aufLager int, bild varchar(255), PRIMARY KEY (Id));
INSERT INTO Fahrradladen.Fahrraeder (Marke, Groesse, Preis, aufLager, bezeichnung, bild) VALUES ("Gazelle", 26, 15,10, "Standard","standard.jpeg");
INSERT INTO Fahrradladen.Fahrraeder (Marke, Groesse, Preis, aufLager, bezeichnung, bild) VALUES ("Pegasus", 28, 30,20, "Premium", "premium.jpeg");
INSERT INTO Fahrradladen.Fahrraeder (Marke, Groesse, Preis, aufLager, bezeichnung, bild) VALUES ("Pegasus", 26, 60,12, "E-Bike", "e.jpeg");



CREATE TABLE Fahrradladen.Benutzer (Id int NOT NULL AUTO_INCREMENT, Benutzername varchar(255) NOT NULL, Name varchar(255) NOT NULL, Vorname varchar(255) NOT NULL, Passwort varchar(30) NOT NULL, PRIMARY KEY (Id), UNIQUE(Benutzername));

INSERT INTO Fahrradladen.Benutzer (Benutzername, Name, Vorname , Passwort) VALUES ("t", "TestName", "TestVorname","test");
INSERT INTO Fahrradladen.Benutzer (Benutzername, Name, Vorname , Passwort) VALUES ("linux", "Torvalds", "Linus","tl");
INSERT INTO Fahrradladen.Benutzer (Benutzername, Name, Vorname , Passwort) VALUES ("admin", "admin", "admin","admin");



CREATE TABLE Fahrradladen.Verleihe (Id int NOT NULL AUTO_INCREMENT, fahrradId int NOT NULL, benutzerId int NOT NULL, PRIMARY KEY (Id), 
    CONSTRAINT FK_Fahrraeder FOREIGN KEY (fahrradId) REFERENCES Fahrraeder(Id), 
    CONSTRAINT FK_Benutzer FOREIGN KEY (benutzerId)  REFERENCES Benutzer(Id));



GRANT ALL PRIVILEGES ON Fahrradladen.Fahrraeder TO 'webapp'@'localhost';
GRANT ALL PRIVILEGES ON Fahrradladen.Benutzer TO 'webapp'@'localhost';
GRANT ALL PRIVILEGES ON Fahrradladen.Verleihe TO 'webapp'@'localhost';

SELECT * FROM Fahrradladen.Fahrraeder;




