/*
1) 고객의 등급 구분 : 
고객의 서비스 이용 데이터(총 구매횟수, 총 구매금액, 평균 구매금액)중 하나를 기준으로 고객
을 5등급으로 구분하고, 그중 1등급에 해당하는 고객의 랭킹, 고객아이디, 이름, 성별, 나이, 주
소, 서비스 이용데이터(총 구매횟수, 총 구매금액, 평균 구매금액)를 출력하세요
*/
-- 답
SELECT
    CASE
		WHEN 6 <= COUNT(*) THEN 1
		WHEN 5 <= COUNT(*) THEN 2
		WHEN 4 <= COUNT(*) THEN 3
		WHEN 3 <= COUNT(*) THEN 4
		ELSE 5
	END as level
    , customer_id
    , customer_name
    , gender
    , age
    , full_address
    , count(*) as total_purchases
    , sum(payment) as total_payment_amount
    , avg(payment) as average_purchase_amount
FROM
	(
		SELECT 
		orders.customer_id
        , orders.order_date
        , customers.customer_name
        , customers.gender
        , customers.age
        , CONCAT(customers.home_address, ', ', customers.city, ', ', customers.state, ', ', customers.zip_code, ', ', customers.country) AS full_address
        , orders.payment
		FROM
			online_shopping_mall.orders
			INNER JOIN online_shopping_mall.customers
				ON orders.customer_id = customers.customer_id
	) as integrated_table
GROUP BY 
	customer_id
    , customer_name
    , gender
    , age
    , full_address
ORDER BY level
limit 1;

-- 과정
# 고객별 2021년 월별 구매 횟수
SELECT
    customer_id,
    MONTH(order_date) AS order_month,
    COUNT(*) AS monthly_purchase_count
FROM
    online_shopping_mall.orders
GROUP BY
    customer_id,
    MONTH(order_date)
ORDER BY
    customer_id,
    order_month;

# 고객별 2021년 구매 횟수 랭크
SELECT
    customer_id,
    COUNT(*) AS monthly_purchase_count,
    DENSE_RANK() OVER(order by COUNT(*) desc) as 'rank'
FROM
    online_shopping_mall.orders
GROUP BY
    customer_id
ORDER BY
    'rank';
# 고객별 2021년 구매 횟수 랭크 2
/*
	[Condition]
    6이상 : 1
    5이상 : 2
    4이상 : 3
    3이상 : 4
    그외  : 5
*/
SELECT
    customer_id,
    COUNT(*) AS monthly_purchase_count,
    CASE
		WHEN 6 <= COUNT(*) THEN 1
		WHEN 5 <= COUNT(*) THEN 2
		WHEN 4 <= COUNT(*) THEN 3
		WHEN 3 <= COUNT(*) THEN 4
		ELSE 5
	END as 'rank'
FROM
    online_shopping_mall.orders
GROUP BY customer_id
ORDER BY monthly_purchase_count DESC;

# Table 통합
SELECT 
		orders.customer_id
        , orders.order_date
        , customers.customer_name
        , customers.gender
        , customers.age
        , CONCAT(customers.home_address, ', ', customers.city, ', ', customers.state, ', ', customers.zip_code, ', ', customers.country) AS full_address
        , orders.payment
FROM
    online_shopping_mall.orders
	INNER JOIN online_shopping_mall.customers
		ON orders.customer_id = customers.customer_id;
        
-- ----------------------------------------------------------------------------------------------------------------------------------------------
/*
2) KPI 지표 : 
고객 및 상품 주문 데이터에서 서비스를 평가할수 있고 그에 따른 인사이트를 얻을 수 있는 결
과를 출력하세요.
*/
-- 답
SELECT
    MONTH(order_date) AS order_month
    ,COUNT(*) AS monthly_purchase_count
    ,SUM(payment) as monthly_payment_amount
    ,AVG(payment) as monthly_purchase_amount
    ,MAX(payment) as monthly_highest_purchase_amount
    ,MIN(payment) as monthly_lowest_purchase_amount
FROM
    online_shopping_mall.orders
GROUP BY
    MONTH(order_date)
ORDER BY
    order_month;