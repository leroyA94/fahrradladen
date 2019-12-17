#sudo mariadb

CREATE DATABASE Fahrradladen;
CREATE TABLE Fahrradladen.Fahrraeder (Id int NOT NULL AUTO_INCREMENT, Marke varchar(255), Groesse int NOT NULL, Preis DOUBLE NOT NULL, PRIMARY KEY (Id));

CREATE USER 'webapp'@'localhost' IDENTIFIED BY 'test';


INSERT INTO Fahrradladen.Fahrraeder (Marke, Groesse, Preis) VALUES ("Gazelle", 26, 199.99);
INSERT INTO Fahrradladen.Fahrraeder (Marke, Groesse, Preis) VALUES ("Pegasus", 28, 300);
INSERT INTO Fahrradladen.Fahrraeder (Marke, Groesse, Preis) VALUES ("Pegasus", 26, 1100);

CREATE TABLE Fahrradladen.Benutzer (Id int NOT NULL AUTO_INCREMENT, Benutzername varchar(15) NOT NULL, Name varchar(255) NOT NULL, Vorname varchar(255) NOT NULL, Passwort varchar(30) NOT NULL, PRIMARY KEY (Id), UNIQUE(Benutzername));

INSERT INTO Fahrradladen.Benutzer (Benutzername, Name, Vorname , Passwort) VALUES ("t", "TestName", "TestVorname","test");
INSERT INTO Fahrradladen.Benutzer (Benutzername, Name, Vorname , Passwort) VALUES ("linux", "Torvalds", "Linus","tl");


GRANT ALL PRIVILEGES ON Fahrradladen.Fahrraeder TO 'webapp'@'localhost';
GRANT ALL PRIVILEGES ON Fahrradladen.Benutzer TO 'webapp'@'localhost';

SELECT * FROM Fahrradladen.Fahrraeder;




