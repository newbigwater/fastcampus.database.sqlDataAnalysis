select * from pokemon.wildpokemon;

set sql_safe_updates=0; #수정 불능 모드 일시 해제

delete from pokemon.wildpokemon
where attack > 50;

update pokemon.mypokemon
set type = 'normal'
	, number = 153
where name = 'chikoirita';