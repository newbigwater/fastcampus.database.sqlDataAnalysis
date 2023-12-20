# 실습 데이터
DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon (
	number  int,
       name	varchar(20),
       type	varchar(10),
       attack int,
       defense int
);
CREATE TABLE friendpokemon (
	number  int,
       name	varchar(20),
       type	varchar(10),
       attack int,
       defense int
);
INSERT INTO mypokemon (number, name, type, attack, defense)
VALUES (10, 'caterpie', 'bug', 30, 35),
	   (25, 'pikachu', 'electric', 55, 40),
	   (26, 'raichu', 'electric', 90, 55),
	   (133, 'eevee', 'normal', 55, 50),
	   (152, 'chikoirita', 'grass', 49, 65);

INSERT INTO friendpokemon (number, name, type, attack, defense)
VALUES (26, 'raichu', 'electric', 80, 60),
	   (125, 'electabuzz', 'electric', 83, 57),
       (137, 'porygon', 'normal', 60, 70),
       (153, 'bayleef', 'grass', 62, 80),
       (172, 'pichu', 'electric', 40, 15),
       (470, 'leafeon', 'grass', 110, 130);

/*
MISSION (1)
나도 가지고 있고, 친구도 가지고 있는 포켓몬의 이름을 가져와 주세요.
*/
select T1.name
from pokemon.mypokemon as T1
inner join pokemon.friendpokemon as T2
on t1.number = t2.number;

/*
MISSION (2)
나만 가지고 있고, 친구는 안 가지고 있는 포켓몬의 이름을 가져와 주세요.
A (내가 가지고 있는 포켓몬) - B (친구가 가지고 있는 포켓몬)
*/
select *
from pokemon.mypokemon as T1
left join pokemon.friendpokemon as T2
on t1.number = t2.number;