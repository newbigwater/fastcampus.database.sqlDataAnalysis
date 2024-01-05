-- 2020년 7월의 Revenue를 구해주세요.
# Revenue : 매출
select sum(price)
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01'
	and purchased_at < '2020-08-01';
    
-- 2020년 7월 MAU를 구해주세요.
# MAU : Monthly Active Users
select count(distinct customer_id)
from fastcampus.tbl_visit
where visited_at >= '2020-07-01'
	and visited_at < '2020-08-01';
    
-- 2020년 7월에 우린 Active 유저의 구매율(Paying Rate)은 어떻게 되나요?
# paying rate = round((구매유저 수 / 전체 활성 유저) * 100, 2)
# 7월 AU
select count(distinct customer_id)
from fastcampus.tbl_visit
where visited_at >= '2020-07-01' and visited_at < '2020-08-01';

# 7월 구매자
select count(distinct customer_id)
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01';

# 7월 paying rate
select  (select count(distinct customer_id)
		from fastcampus.tbl_purchase
		where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01') as purchase_user,
        (select count(distinct customer_id)
		from fastcampus.tbl_visit
		where visited_at >= '2020-07-01' and visited_at < '2020-08-01') as active_user,
		round(
		((select count(distinct customer_id)
		from fastcampus.tbl_purchase
		where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01')
        /
        (select count(distinct customer_id)
		from fastcampus.tbl_visit
		where visited_at >= '2020-07-01' and visited_at < '2020-08-01')) * 100,
        2) as paying_rate;

select round((11174 / 16414) * 100, 2);

-- 7월 구매 유저의 월 평균 구매액
# ARPPU : Average Revenue Per Paying User
# 7월 각 유저당 전체 구매액
select customer_id, sum(price) as revenue
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
group by customer_id;
        
select avg(revenue) as "Average purchase amount in July"
from (select customer_id, sum(price) as revenue
		from fastcampus.tbl_purchase
		where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
		group by customer_id) as sum_revenue_per_paying_user;
        
-- 2020년 7월에 가장 많이 구매한 Top3 고객과 top 10 ~ 15 고객을 뽑아주세요.
# 가장 많이 구매한 Top3
select customer_id, sum(price) as revenue, rank() over(order by sum(price) desc) as revenue_rank
from fastcampus.tbl_purchase
where '2020-07-01' <= purchased_at and purchased_at < '2020-08-01'
group by 1
order by 2 desc
limit 15;

# 가장 많이 구매한 Top 10 ~ 15
select customer_id, sum(price) as revenue, rank() over(order by sum(price) desc) as revenue_rank
from fastcampus.tbl_purchase
where '2020-07-01' <= purchased_at and purchased_at < '2020-08-01'
group by 1
order by 2 desc
limit 6 offset 9;