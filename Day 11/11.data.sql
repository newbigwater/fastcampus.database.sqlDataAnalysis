DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE wildpokemon (
	   number  INT PRIMARY KEY,
       name	VARCHAR(20),
	   type	VARCHAR(10),
       height FLOAT,
       weight FLOAT,
       attack INT,
       defense INT,
       speed int
);
INSERT INTO wildpokemon 
	(number, name, type, height, weight, attack, defense, speed)
VALUES 
	(10, 'caterpie'		, 'bug'		, 0.3, 2.9, 30, 35, 45	),
	(25, 'pikachu'		, 'electric', 0.4, 6, 55, 40, 90	),
	(26, 'raichu'		, 'electric', 0.8, 30, 90, 55, 110	),
	(133, 'eevee'		, 'normal'	, 0.3, 6.5, 55, 50, 55	),
	(152, 'chikoirita'	, 'grass'	, 0.9, 6.4, 49, 65, 45	);

CREATE TABLE mypokemon(
	number INT PRIMARY KEY,
	name VARCHAR(20) UNIQUE,
	type VARCHAR(10) NOT NULL,
	attack INT DEFAULT 0,
	defense INT DEFAULT 100,
	FOREIGN KEY (number) REFERENCES pokemon.wildpokemon(number)
);