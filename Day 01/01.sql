-- 주석 1 : 해당 라인 주석
# 주석 1 : 해당 키워드 이후 주석
/*
주석 3 : 다중 라인 주석
*/

-- 모든 데이터베이스 목록 보기
show databases;

-- 데이터베이스 생성 및 지정
create database NBE_DB; #생성
show databases;
# 삭제 drop database NBE_DB;

-- 데이터 베이스 지정 및 테이블 생성 및 데이터 삽입
#지정
use NBE_DB;
# 테이블 생성
create table NBE_Table (
			col1 INT,
			col2 CHAR(2)
);
# 데이터 삽입
insert into NBE_Table (col1, col2)
value (1, 'a'), (2, 'b'), (3, 'c'), (4, 'd'), (5, 'e');
# 확인
select * from NBE_Table;