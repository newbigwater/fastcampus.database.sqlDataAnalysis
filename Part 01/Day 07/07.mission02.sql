/*
MISSION (1)
포켓몬의 번호가 150보다 작으면 값을 ‘old’로 반환하고, 번호가 150보다 크거나 같으면 값을 ‘new’로
반환해서 ‘age’라는 별명으로 가져와 주세요.
*/
select name, number,
case
	when number < 150 then 'old'
    when 150 <= number then 'new'
end as 'age'
from pokemon.mypokemon;

/*
MISSION (2)
포켓몬의 공격력과 방어력의 합이 100보다 작으면 값을 ‘weak’로 반환하고, 100보다 크거나 같으면
값을 ‘strong’로 반환해서 ‘ability’라는 별명으로 가져와 주세요.
*/
select name, attack + defense,
case
	when attack + defense < 100 then 'weak'
    when 100 <= attack + defense then 'strong'
end as 'ability'
from pokemon.mypokemon;

/*
MISSION (3)
포켓몬의 타입 별 공격력의 평균이 60 이상이면 값을 True(1)로 반환하고, 60보다 작으면 False(0)를
반환해 ‘is_strong_type’이라는 별명으로 가져와 주세요.
*/
select type, avg(attack), if(60 <= avg(attack), true, false)
/*
case
	when 60 <= avg(attack) then true
    else false
end as 'is_strong_type'
*/
from pokemon.mypokemon
group by type;

/*
MISSION (4)
포켓몬의 공격력이 100보다 크고, 방어력도 100보다 크면 값을 True(1)로 반환하고, 둘 중 하나라도
100보다 작으면 False(0)를 반환해 ‘ace’라는 별명으로 가져와 주세요.
*/
select name, attack, if(100 < attack, true, false), defense, if(100 <= defense, true, false),
case
	when if(100 < attack, true, false) and if(100 <= defense, true, false) then true
    else false
end as 'ace'
from pokemon.mypokemon;

/*
MISSION (5)
포켓몬의 번호가 100보다 작으면 값을 ‘<100’을 반환하고, 200보다 작으면 값을 ‘<200’을 반환하고,
500보다 작으면 값을 ‘<500’을 반환하는 규칙을 만들고, 각 포켓몬 별 규칙 적용 값을 ‘number_bin’이라는
별명으로 가져와 주세요.
*/
select name, number,
case
	when number < 100 then '<100'
    when number < 200 then '<200'
    when number < 500 then '<500'
end as 'nubmer_bin'
from pokemon.mypokemon;

/*
MISSION (6)
아래 표에 따른 값을 반환하는 규칙을 만들고, 각 포켓몬 별 규칙 적용 값을 ‘age_attack’이라는 별명으로
가져와 주세요.
*/
select name, number, 150 <= number, attack, 50 <= attack,
case
	when 150 <= number and 50 <= attack then 'new_strong'
    when 150 <= number and attack < 50 then 'new_week'
    when number < 150 and 50 <= attack then 'old_strong'
    else 'old_week'
end as 'age_attack'
from pokemon.mypokemon;

/*
MISSION (7)
타입 별 포켓몬 수가 1개면 ‘solo’, 3개 미만이면 ‘minor’, 3개 이상이면 ‘major’를 반환하고,
‘count_by_type’이라는 별명으로 가져와 주세요
*/
select type, count(*),
case
	when count(*) = 1 then 'solo'
    when count(*) < 3 then 'minor'
    when 3 <= count(*) then 'major'
end as 'count_by_type'
from pokemon.mypokemon
group by type;
