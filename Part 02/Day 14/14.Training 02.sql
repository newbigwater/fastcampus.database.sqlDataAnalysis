# 2020년 07월 Daily Revenue
select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as date_at
		, sum(price) as revenue
from fastcampus.tbl_purchase
where '2020-07-01' <= purchased_at and purchased_at < '2020-08-01'
group by date_format(purchased_at - interval 9 hour, '%Y-%m-%d');

# 2020년 07월 Average Daily Revenue
select avg(revenue)
from (
	select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as date_at
			, sum(price) as revenue
	from fastcampus.tbl_purchase
	where '2020-07-01' <= purchased_at and purchased_at < '2020-08-01'
	group by date_format(purchased_at - interval 9 hour, '%Y-%m-%d')
    ) T1;

# 2020년 07월 Weekly Revenue
select date_format(purchased_at - interval 9 hour, '%Y-%mW%U') as date_at
		, sum(price) as revenue
from fastcampus.tbl_purchase
where '2020-07-05' <= purchased_at and purchased_at < '2020-07-26'
group by date_format(purchased_at - interval 9 hour, '%Y-%mW%U');

# 2020년 07월 Average Weekly Revenue
select avg(revenue)
from (
	select date_format(purchased_at - interval 9 hour, '%Y-%mW%U') as date_at
			, sum(price) as revenue
	from fastcampus.tbl_purchase
	where '2020-07-05' <= purchased_at and purchased_at < '2020-07-26'
	group by date_format(purchased_at - interval 9 hour, '%Y-%mW%U')) as  T1;
    
# 2020년 7월 Revenue by day of week
-- 전체 데이터 + 요일
select *
		, date_format(tbl_purchase.purchased_at - interval 9 hour, '%W')
from fastcampus.tbl_purchase
where '2020-07-01' <= tbl_purchase.purchased_at
	and tbl_purchase.purchased_at < '2020-08-01';

-- 요일별 평균 매출?
-- 아니다, 각 요일에 결제당 평균이다.
-- 즉, 아래 쿼리는 해당 요일의 전체 매출액의 구해 평균 매출를 구하는 것이고, 
-- 문제는 각 요일의 매출액 합을 구해 각 요일의 평균 매출을 구하는 것이다.
select date_format(purchased_at - interval 9 hour, '%w') as day_of_week_num
		, date_format(purchased_at - interval 9 hour, '%W') as day_of_week
        , count(*)
        , sum(price) as revenue
        , avg(price) as average_revenue
from fastcampus.tbl_purchase
where '2020-07-01' <= purchased_at and purchased_at < '2020-08-01'
group by 
    date_format(purchased_at - interval 9 hour, '%w')
	, date_format(purchased_at - interval 9 hour, '%W')
order by day_of_week_num;

-- Daily 매출
select date_format(tbl_purchase.purchased_at - interval 9 hour, '%Y-%m-%d') as date_at
		, date_format(tbl_purchase.purchased_at - interval 9 hour, '%W') as day_of_week
		, sum(price) as daily_revenue
from fastcampus.tbl_purchase
where '2020-07-01' <= tbl_purchase.purchased_at
	and tbl_purchase.purchased_at < '2020-08-01'
group by 
	date_format(tbl_purchase.purchased_at - interval 9 hour, '%Y-%m-%d')
    , date_format(tbl_purchase.purchased_at - interval 9 hour, '%W');

-- Daily 매출 구한 후 요일 별 매출 평균
select date_format(date_at, '%w') as day_of_week_num
		, day_of_week
        , count(daily_revenue) as count_daily_revenue
        , sum(daily_revenue) as daily_revenue
        , avg(daily_revenue) as average_revenue
from (
		select date_format(tbl_purchase.purchased_at - interval 9 hour, '%Y-%m-%d') as date_at
		, date_format(tbl_purchase.purchased_at - interval 9 hour, '%W') as day_of_week
		, sum(price) as daily_revenue
		from fastcampus.tbl_purchase
		where '2020-07-01' <= tbl_purchase.purchased_at
			and tbl_purchase.purchased_at < '2020-08-01'
		group by 
			date_format(tbl_purchase.purchased_at - interval 9 hour, '%Y-%m-%d')
			, date_format(tbl_purchase.purchased_at - interval 9 hour, '%W')
    ) as daily_revenue_table
group by 
	date_format(date_at, '%w')
	, day_of_week
order by day_of_week_num;

# 2020년 07월 시간대별 시간당 Revenue구하기
-- Daily 시간대별 Revenue
select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as date_at
		, date_format(purchased_at - interval 9 hour, '%H') as time_at
        , sum(price) as sum_revenue
        , avg(price) as avg_revenue
        , count(price) as purchased
from fastcampus.tbl_purchase
where '2020-07-01' <= purchased_at and purchased_at < '2020-08-01'
group by 
	date_format(purchased_at - interval 9 hour, '%Y-%m-%d')
    , date_format(purchased_at - interval 9 hour, '%H');
-- 07월 통합 시간대별 매출
select time_at
		, avg(revenue)
from 
	(		
		select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as date_at
				, date_format(purchased_at - interval 9 hour, '%H') as time_at
				, sum(price) as revenue
		from fastcampus.tbl_purchase
		where '2020-07-01' <= purchased_at and purchased_at < '2020-08-01'
		group by 
			date_format(purchased_at - interval 9 hour, '%Y-%m-%d')
			, date_format(purchased_at - interval 9 hour, '%H')
	) as revenue_by_daily_time
group by 
	time_at;
    
# 2020년 07월의 요일 및 시간대별 Revenue를 구해주세요.
-- Daily 요일별 시간대별 Revenue
select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as date_at
		, date_format(purchased_at - interval 9 hour, '%W') as day_of_week
		, date_format(purchased_at - interval 9 hour, '%H') as hour_at
        , sum(price) as revenue
from fastcampus.tbl_purchase
where '2020-07-01' <= purchased_at and purchased_at < '2020-08-01'
group by 
	date_format(purchased_at - interval 9 hour, '%Y-%m-%d')
	, date_format(purchased_at - interval 9 hour, '%W')
    , date_format(purchased_at - interval 9 hour, '%H');

-- 2020년 07월의 요일 및 시간대별 Revenue를 구해주세요.
select day_of_week
		, hour_at
        , avg(revenue)
from
	(
		select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as date_at
				, date_format(purchased_at - interval 9 hour, '%W') as day_of_week
				, date_format(purchased_at - interval 9 hour, '%H') as hour_at
				, sum(price) as revenue
		from fastcampus.tbl_purchase
		where '2020-07-01' <= purchased_at and purchased_at < '2020-08-01'
		group by 
			date_format(purchased_at - interval 9 hour, '%Y-%m-%d')
			, date_format(purchased_at - interval 9 hour, '%W')
			, date_format(purchased_at - interval 9 hour, '%H')
    ) as daily_week_hour_revenue_table
group by 
	day_of_week
    , hour_at
order by 3 desc;