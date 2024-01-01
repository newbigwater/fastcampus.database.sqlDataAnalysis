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

# Mission 11
/*
현재 포켓몬 테이블의 키 컬럼은 m단위입니다. (1m = 100cm)
포켓몬 테이블에서 모든 포켓몬들의 키를 cm단위로 환산하여 ‘height(cm)’라는 별명으로 가져와 주세요.
(힌트) 쿼리 내 이름에 괄호 ‘(, )’가 있을 경우 괄호가 쿼리의 한 부분을 의미하는지 이름을 의미하는지
인지하기 어렵기 때문에, 따옴표(‘’, “”)로 감싸 주어 의미를 분명하게 합니다. 
※ FLOAT 데이터 타입은 입력 값의 근사치를 저장하기 때문에, 소수점이 나오는 게 정상입니다.
*/
select name, height * 100 as 'height(cm)' from pokemon.mypokemon;

# Mission 12
# 포켓몬 테이블에서 첫번째 로우에 위치한 포켓몬 데이터만 컬럼 값 전체를 가져와 주세요
select * from pokemon.mypokemon limit 1;

# Mission 13
/*
포켓몬 테이블에서 2개의 포켓몬 데이터만 이름은 ‘영문명’이라는 별명으로,
키는 ‘키(m)’라는 별명으로, 몸무게는 ‘몸무게(kg)’이라는 별명으로 가져와 주세요.
(힌트) 쿼리 내 이름에 괄호 ‘(, )’가 있을 경우 괄호가 쿼리의 한 부분을 의미하는지 이름을 의미하는지
인지하기 어렵기 때문에, 따옴표(‘’, “”)로 감싸 주어 의미를 분명하게 합니다. 
*/
select name as '영문명', height as '키(m)', weight as '몸무게(kg)'
from pokemon.mypokemon limit 2;

# MISSION 14
/*
포켓몬 테이블에서 모든 포켓몬들의 이름과 능력치의 합을 가져오고,
이 때 능력치의 합은 ‘total’이라는 별명으로 가져와 주세요.
조건1. 능력치의 합은 공격력, 방어력, 속도의 합을 의미합니다.
*/
select name, attack + defense + speed as 'total' from pokemon.mypokemon;


# MISSION 15
/*
포켓몬 테이블에서 모든 포켓몬들의 BMI 지수를 구해서 ‘BMI’라는 별명으로 가져와 주세요.
이 때, 포켓몬을 구분하기 위해 이름도 함께 가져와 주세요.
조건1. BMI 지수 = 몸무게(kg) ÷ (키(m))²
조건2. 포켓몬 테이블 데이터의 체중은 kg 단위, 키는 m 단위입니다.
(힌트) MySQL에서 제곱은 ^ 로 표현합니다. (예시: 10²은 10^2로 표현합니다.)
※ FLOAT 데이터 타입은 입력 값의 근사치를 저장하기 때문에, 소수점이 나오는 게 정상입니다
*/
select name, weight / (height^2) as 'BMI' from pokemon.mypokemon;