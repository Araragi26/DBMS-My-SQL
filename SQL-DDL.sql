# 주석 -- 주석

# DDL (데이터 정의어)
# 데이터베이스의 스키마를 정의할 때 사용되는 명령어
# 스키마 : 데이터 구조를 정의한 것
# CREATE, ALTER, DROP

# CREATE : 스키마를 생성할 떄 사용 
# CREATE 스키마타입 스키마이름 [...] 

# 데이터베이스 생성
CREATE DATABASE human_resource;
# - 데이터베이스 생성 후에 해당 데이터베이스에서 작업을 하기위해서는
# USE 데이터베이스명; 을 해야함 
USE human_resource;

# 테이블 생성
# CREATE TABLE 데이블명 ( 컬럼명 컬럼타입, ... );
CREATE TABLE employee (
	employee_number VARCHAR(20),
    name VARCHAR(20),
    age INT
);

# 데이터베이스의 데이터 타입 
# 
