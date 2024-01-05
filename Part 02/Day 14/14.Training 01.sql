/* Data Functions Example */
SELECT NOW();
SELECT CURRENT_DATE();
SELECT EXTRACT(MONTH FROM '2021-01-01');
SELECT DAY('2021-01-01');
SELECT DATE_ADD('2021-01-01', INTERVAL 7 DAY);
SELECT DATE_SUB('2021-01-08', INTERVAL 7 DAY);
SELECT DATEDIFF('2017-06-25', '2017-06-15') as Diff_day;
SELECT TIMEDIFF('2021-01-25 12:10:00', '2021-01-25 10:10:00') as hour;
SELECT DATE_FORMAT(TIMEDIFF('2021-01-25 12:10:00', '2021-01-25 10:10:00'), '%p %T') as hour;
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d') as Format;

SELECT @@time_zone, now();
SHOW VARIABLES WHERE Variable_name LIKE '%time_zone%';
SELECT @@GLOBAL.time_zone, @@SESSION.time_zone, @@system_time_zone;

/* 
	2020년 7월 평균 DAU를 구해주세요.
	Active User 수가 추세 증가하는 추세인지가요?  
	DAU : Daily Active User
*/

# 시간 정보 확인 - KST인지 UTC인지 확인필요
/*
KST = UTC + 9 (hour)

DBMS는 데이터를 저장할 때 인식하는 기본 시간이 있습니다. 
이를 기준으로 데이터를 저장한 시간을 표기합니다.
그럼으로 데이터 처리시 time zone을 확인 후 처리 해야 한다.
*/
select *
		, date_format(visited_at, '%Y-%m-%d') as date_at1
		, date_format(visited_at, '%Y-%m-%d %T') as datestemp_at1
		, date_format(visited_at, '%Y-%m-%d %H:%i%s') as datetime_at1
        , date_format(visited_at - interval 9 hour, '%Y-%m-%d') as date_at2
        , date_format(visited_at - interval 9 hour, '%Y-%m-%d %T') as datestemp_at2
		, date_format(visited_at - interval 9 hour, '%Y-%m-%d %H:%i%s') as datetime_at2
from fastcampus.tbl_visit
where '2020-07-01' <= visited_at and visited_at < '2020-08-01'
order by visited_at;

# failure - Timezone 문제로 인한 잘못 계산된 query
select date_format(visited_at, '%Y-%m-%d %T'), count(distinct customer_id)
from fastcampus.tbl_visit
where '2020-07-01' <= visited_at and visited_at < '2020-08-01'
group by date_format(visited_at, '%Y-%m-%d %T');
/*
입력된 데이터는 '2020-07-01 00:00:12+00:00' 와 같이 UTC+0으로 입력되었고, 
MySQL Defalut Time Zone은 시스템 설정을 따라 가니, 한국임으로 UTC+9(KST)로 처리된다.

하지만, 우리가 사용한 데이터 타입에 맞추어 처리를 해야 하니깐
처리시 사용되는 timezone이 UTC-9, KST이고,
입력된 데이터의 default time zone은 UTC-0이니
입력된 데이터 타입의 timezone에 맞추어 처리해야 함으로, 
아래와 같이 -9로 KST -> UTC-0로 변경하여 처리
*/
# Success
select date_format(visited_at - interval 9 hour, '%Y-%m-%d'), count(distinct customer_id)
from fastcampus.tbl_visit
where '2020-07-01' <= visited_at and visited_at < '2020-08-01'
group by date_format(visited_at - interval 9 hour, '%Y-%m-%d');

/*
	2020년 07월 평균 WAU를 구해주세요
    WAU : Weekly Active User
*/
# 7월의 전체 완전 주 + 불완전 주 + 활성 유저
select date_format(visited_at - interval 9 hour, '%Y-%mW%U'), count(distinct customer_id) as users
from fastcampus.tbl_visit
where '2020-07-01' <= visited_at and visited_at < '2020-08-01'
group by date_format(visited_at - interval 9 hour, '%Y-%mW%U');

# 7월의 전체 완전 주 + 활성 유저
select date_format(visited_at - interval 9 hour, '%Y-%mW%U'), count(distinct customer_id) as users
from fastcampus.tbl_visit
where '2020-07-05' <= visited_at and visited_at < '2020-07-26'
group by date_format(visited_at - interval 9 hour, '%Y-%mW%U');

# 7월의 WAU
select avg(users)
from (
	select date_format(visited_at - interval 9 hour, '%Y-%mW%U'), count(distinct customer_id) as users
	from fastcampus.tbl_visit
	where '2020-07-05' <= visited_at and visited_at < '2020-07-26'
	group by date_format(visited_at - interval 9 hour, '%Y-%mW%U')
) as T1;