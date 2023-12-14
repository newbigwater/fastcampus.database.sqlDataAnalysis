-- 실습 준비
/*
DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon (
number int,
name varchar(20),
type varchar(20),
height float,
weight float,
attack float,
defense float,
speed float
);
INSERT INTO mypokemon (number, name, type, height, weight, attack, defense, speed)
VALUES (10, 'caterpie', 'bug', 0.3, 2.9, 30, 35, 45),
(25, 'pikachu', 'electric', 0.4, 6, 55, 40, 90),
(26, 'raichu', 'electric', 0.8, 30, 90, 55, 110),
(133, 'eevee', 'normal', 0.3, 6.5, 55, 50, 55),
(152, 'chikoirita', 'grass', 0.9, 6.4, 49, 65, 45);
*/

# Mission 01
-- 이브이의 타입을 가져와 주세요
select type from pokemon.mypokemon where name = 'eevee';

# Mission 02
-- 캐터피의 공격력과 방어력을 가져와 주세요.
select name, attack, defense from pokemon.mypokemon where name = 'caterpie';

# Mission 03
-- 몸무게가 6kg보다 큰 포켓몬들의 모든 데이터를 가져와 주세요
select * from pokemon.mypokemon
where 6 < weight;

# Mission 04
-- 키가 0.5m보다 크고, 몸무게가 6kg보다 크거나 같은 포켓몬들의 이름을 가져와 주세요
select name from pokemon.mypokemon
where 0.5 < height and 6 <= weight;

# Mission 05
/*
포켓몬 테이블에서 공격력이 50 미만이거나, 방어력이 50 미만인 포켓몬들의 이름을
‘weak_pokemon’이라는 별명으로 가져와 주세요.
*/
select name as 'weak_pokemon' from pokemon.mypokemon
where attack < 50 or defense < 50;

# Mission 06
-- 노말 타입이 아닌 포켓몬들의 데이터를 전부 가져와 주세요.
select * from pokemon.mypokemon
where type != 'normal';

# Mission 07
-- 타입이 (normal, fire, water, grass) 중에 하나인 포켓몬들의 이름과 타입을 가져와 주세요.
select name, type from pokemon.mypokemon
where type in('normal', 'fire', 'water', 'grass');

# Mission 08
-- 공격력이 40과 60 사이인 포켓몬들의 이름과 공격력을 가져와 주세요.
select name, attack from pokemon.mypokemon
where attack between 40 and 60;

# Mission 09
-- 이름에 ‘e’가 포함되는 포켓몬들의 이름을 가져와 주세요.
select name from pokemon.mypokemon
where name like'%e%';

# Mission 10
-- 이름에 ‘i’가 포함되고, 속도가 50 이하인 포켓몬 데이터를 전부 가져와 주세요
select * from pokemon.mypokemon
where name like '%i%' and speed <= 50;

# Mission 11
-- 이름이 ‘chu’로 끝나는 포켓몬들의 이름, 키, 몸무게를 가져와 주세요.
select name, height, weight from pokemon.mypokemon
where name like '%chu';

# Mission 12
-- 이름이 ‘e’로 끝나고, 방어력이 50 미만인 포켓몬들의 이름, 방어력을 가져와 주세요.
select name, defense from pokemon.mypokemon
where name like '%e' and defense < 50;

# Mission 13
-- 공격력과 방어력의 차이가 10 이상인 포켓몬들의 이름, 공격력, 방어력을 가져와 주세요
select name, attack, defense from pokemon.mypokemon
where 10 <= (attack - defense) or 10 <= (defense - attack);

# Mission 14
/*
능력치의 합이 150 이상인 포켓몬의 이름과 능력치의 합을 가져와 주세요.
이 때, 능력치의 합은 ‘total’이라는 별명으로 가져와 주세요.
조건1. 능력치의 합은 공격력, 방어력, 속도의 합을 의미합니다
*/
select name, attack + defense + speed as total from pokemon.mypokemon
where 150 <= attack + defense + speed;