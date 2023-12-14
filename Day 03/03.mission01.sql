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
/*
123 곱하기 456을 가져와 주세요.
(힌트) MySQL에서 곱하기 기호(×)는 * 로 표현합니다. (숫자 * 숫자)
*/
select 123 * 456;

# Mission 02
/*
2310 나누기 30을 가져와 주세요.
(힌트) MySQL에서 나누기 기호(÷)는 / 로 표현합니다. (숫자 / 숫자)
*/
select 2310 / 30;

# Mission 03
# ‘피카츄’라는 문자열을 ‘포켓몬’이라는 이름의 컬럼 별명으로 가져와 주세요.
select '피카츄' as '포켓몬';

# Mission 04
# 포켓몬 테이블에서 모든 포켓몬들의 컬럼과 값 전체를 가져와 주세요
select * from pokemon.mypokemon;

# Mission 05
# 포켓몬 테이블에서 모든 포켓몬들의 이름을 가져와 주세요
select name from pokemon.mypokemon;

# Mission 06
# 포켓몬 테이블에서 모든 포켓몬들의 이름과 키, 몸무게를 가져와 주세요
select name, height, weight
From pokemon.mypokemon;

# Mission 07
# 포켓몬 테이블에서 포켓몬들의 키를 중복 제거하고 가져와 주세요.
select distinct height  from pokemon.mypokemon;

# Mission 08
# 포켓몬 테이블에서 모든 포켓몬들의 공격력을 2배 해 ‘attack2’라는 별명으로 이름과 함께 가져와 주세요
select pokemon.mypokemon.name, pokemon.mypokemon.attack, pokemon.mypokemon.attack * 2 as 'attack2' from pokemon.mypokemon;

# Mission 09
# 포켓몬 테이블에서 모든 포켓몬들의 이름을 ‘이름’이라는 한글 별명으로 가져와 주세요
select name as '이름' from pokemon.mypokemon;

# Mission 10
/*
포켓몬 테이블에서 모든 포켓몬들의 공격력은 ‘공격력’이라는 한글 별명으로, 방어력은 ‘방어력’이라는
한글 별명으로 가져와 주세요.
*/
select name as '이름', attack as '공격력', defense as '방어력' from pokemon.mypokemon;