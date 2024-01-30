CREATE DATABASE persona;
USE persona;

CREATE TABLE `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `citta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Inserting data into the persona table
INSERT INTO persona (nome, cognome, citta) VALUES ('John', 'Doe', 'New York');
INSERT INTO persona (nome, cognome, citta) VALUES ('Jane', 'Smith', 'Los Angeles');
INSERT INTO persona (nome, cognome, citta) VALUES ('Alice', 'Johnson', 'Chicago');
INSERT INTO persona (nome, cognome, citta) VALUES ('Bob', 'Williams', 'San Francisco');
INSERT INTO persona (nome, cognome, citta) VALUES ('Eva', 'Brown', 'Miami');
