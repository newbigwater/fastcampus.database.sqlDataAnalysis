/*
MISSION (1)
이브이의 번호 133을 활용해서, 이브이의 영문 이름, 키, 몸무게를 가져와 주세요.
이 때, 키는 height, 몸무게는 weight이라는 별명으로 가져와 주세요. 
*/
select name, 
		(select height from ability where number = 133) AS height,
        (select weight from ability where number = 133) AS weight
from mypokemon
where number = 133;

/*
MISSION (2)
속도가 2번째로 빠른 포켓몬의 번호와 속도를 가져와 주세요.
*/
select number, speed, speed_rank
from (select number, speed, rank() over(order by speed desc) as speed_rank from ability) as T1
where speed_rank = 2;

/*
MISSION (3)
방어력이 모든 전기 포켓몬의 방어력보다 큰 포켓몬의 이름을 가져와 주세요.
*/
select name
from mypokemon
where number in (select number
					from ability
					where defense > ALL (select defense
											from ability
											where type = 'electric')
				);