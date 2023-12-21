# 실습 데이터
DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon (
	   number  INT,
       name	VARCHAR(20)
);
INSERT INTO mypokemon (number, name)
VALUES (10, 'caterpie'),
	   (25, 'pikachu'),
       (26, 'raichu'),
       (133, 'eevee'),
       (152, 'chikoirita');
CREATE TABLE ability (
	   number INT,
	   type	VARCHAR(10),
       height FLOAT,
       weight FLOAT,
       attack INT,
       defense INT,
       speed int
);
INSERT INTO ability (number, type, height, weight, attack, defense, speed)
VALUES (10, 'bug', 0.3, 2.9, 30, 35, 45),
	   (25, 'electric', 0.4, 6, 55, 40, 90),
       (26, 'electric', 0.8, 30, 90, 55, 110),
	   (133, 'normal', 0.3, 6.5, 55, 50, 55),
	   (152, 'grass', 0.9, 6.4, 49, 65, 45);