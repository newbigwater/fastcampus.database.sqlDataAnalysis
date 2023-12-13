-- 실습 1 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

-- Mission 01 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Step 01. Database 생성
create database pokemon;
show databases;

# Step 02. Table 생성
use pokemon;
create table mypokemon(
	number int,
    name varchar(20),
    type varchar(10)
);
show tables;
desc mypokemon;

# Step 03. Data 추가
insert into mypokemon(number, name, type)
value 	(10, 'caterpie', 'bug'),
		(25, 'pikachu', 'electirc'),
        (133, 'eevee', 'normal');
select * from mypokemon;

-- Mission 01 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Step 01. table 생성
create table mynewpokemon (
	number int,
    name varchar(20),
    type varchar(10)
);
show tables;
desc mynewpokemon;

# Step 02. 데이터 추가
insert into mynewpokemon (number, name, type)
value 	(77, '포니타', '불꽃'),
		(132, '메타몽', '노말'),
        (151, '뮤', '에스퍼');
select * from mynewpokemon;


-- 실습 2 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

-- Mission 01 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Step 01. Table Name 변경
alter table mypokemon rename myoldpokemon;
show tables;

# Step 02. Column Name 변경
alter table myoldpokemon 
change column name eng_nm varchar(20);
desc myoldpokemon;

# Step 03. Column Name 변경
alter table mynewpokemon 
change column name kor_nm varchar(20);
desc mynewpokemon;

-- Mission 02 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Step 01. Table Value 삭제
truncate table myoldpokemon;
select * from myoldpokemon;

# Step 02. Table 삭제
Drop table if exists mynewpokemon;
show tables;