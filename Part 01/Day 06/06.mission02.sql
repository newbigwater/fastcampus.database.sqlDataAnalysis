/*
MISSION (1)
포켓몬의 타입 별 키의 평균을 가져와 주세요.
*/
select type, avg(height)
from pokemon.mypokemon
group by type;

/*
MISSION (2)
포켓몬의 타입 별 몸무게의 평균을 가져와 주세요.
*/
select type, avg(weight)
from pokemon.mypokemon
group by type;


/*
MISSION (3)
포켓몬의 타입 별 키의 평균과 몸무게의 평균을 함께 가져와 주세요.
*/
select type, avg(height), avg(weight)
from pokemon.mypokemon
group by type;

/*
MISSION (4)
키의 평균이 0.5 이상인 포켓몬의 타입을 가져와 주세요.
*/
select type
from pokemon.mypokemon
group by type
having 0.5 <= avg(height);


/*
MISSION (5)
몸무게의 평균이 20 이상인 포켓몬의 타입을 가져와 주세요.
*/
select type
from pokemon.mypokemon
group by type
having 20 <= avg(weight);


/*
MISSION (6)
포켓몬의 타입 별 번호(number)의 합을 가져와 주세요.
*/
select type, sum(number)
from pokemon.mypokemon
group by type;

/*
MISSION (7)
키가 0.5 이상인 포켓몬이 포켓몬의 type 별로 몇 개씩 있는지 가져와 주세요.
*/
select type, count(*) as '0.5<'
from pokemon.mypokemon
where 0.5 <= height
group by type;

/*
MISSION (8)
포켓몬 타입 별 키의 최솟값을 가져와 주세요.
*/
select type, min(height)
from pokemon.mypokemon
group by type;

/*
MISSION (9)
포켓몬 타입 별 몸무게의 최댓값을 가져와 주세요
*/
select type, max(weight)
from pokemon.mypokemon
group by type;

/*
MISSION (10)
키의 최솟값이 0.5보다 크고 몸무게의 최댓값이 30보다 작은 포켓몬 타입을 가져와 주세요.
*/
select type
from pokemon.mypokemon
group by type
having 0.5 < min(height) and max(weight) < 30;