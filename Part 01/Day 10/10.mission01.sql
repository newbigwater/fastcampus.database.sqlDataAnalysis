/*
MISSION (1)
내 포켓몬 중에 몸무게가 가장 많이 나가는 포켓몬의 번호를 가져와 주세요.
*/
select number, weight, weight_rank
from (select number, weight, rank() over(order by weight desc) as weight_rank
		from ability) as T1
where weight_rank = 1;

/*
MISSION (2)
속도가 모든 전기 포켓몬의 공격력보다 하나라도 작은 포켓몬의 번호를 가져와 주세요.
*/
select number, speed
from ability
where speed < any (select attack from ability where type = 'electric');

/*
MISSION (3)
공격력이 방어력보다 큰 포켓몬이 있다면 모든 포켓몬의 이름을 가져와 주세요.
*/
select name
from mypokemon
where exists (select *
				from ability
				where defense < attack);

/*
MISSION (*)
공격력이 방어력보다 큰 포켓몬의 이름을 가져와 주세요.
*/
select number, name
from mypokemon
where number IN(select number
						from ability
						where defense < attack);
                        
select *
from ability
where defense < attack;