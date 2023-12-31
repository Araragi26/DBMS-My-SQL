# DML (데이터 조작어)
# 실제 데이터를 삽입, 검색, 수정, 삭제할 때 사용 됨

# INSERT
# 데이터를 테이블에 삽입할때 사용
# 1. 전체 컬럼에 대하여 삽입
# INSERT INTO 테이블명 VALUES (값1, 값2, ...);
INSERT INTO employee VALUES ('20230731001', '홍길동', 30); # 정수자리(int)에 '' 써도 삽입 가능

# 전테 컬럼에 대한 삽입 작업은 컬럼의 순서와 삽입하고자 하는 데이터의 순서가 일치 해야함 
# INSERT INTO employee VALUES (30, '20230731001', '홍길동');
# 전체 컬럼에 대한 삽입 작업은 컬럼의 갯수와 삽입하고자하는 데이터의 갯수가 일치 해야함 
# INSERT INTO employee VALUES ('20230731002', '홍길동');

# 2. 특정 컬럼을 지정하여 삽입 
# INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...) VALUES (값1, 값2, ...);
INSERT INTO employee (employee_number, name, age) VALUES ('20230731002', '김철수', 20);
# 컬럼을 지정하여 삽입 작업을 할 때 지정하는 컬럼에는 순서가 없음 
# 테이블에서 지정한 컬럼의 순서를 따라갈 필요가없음 대신 지정한 컬럼의 순서와 값의 순서는 일치해야함
INSERT INTO employee (age, name, employee_number) VALUES (20, '김철수', '20230731002');
# 컬럼과 값의 갯수가 같아야 함
# INSERT INTO employee (age, employee_number) VALUES (20, '김철수', '20230731002');

INSERT INTO employee (age) VALUES (20); # 삽입가능함 

# UPDATE
# 테이블에 존재하는 수정할 때 사용함
# UPDATE 테이블명 SET 컬럼1 = 값1[, 컬럼2 = 값2, ...]
# [WHERE 조건];
UPDATE employee SET age = 10;
UPDATE employee SET age = 15, name = '세종대왕';
UPDATE employee SET employee_number = '20230731003'
WHERE employee_number IS null;

# DELETE
# 테이블에서 데이터를 삭제할 때 사용 
# DELETE FROM 테이블명; 전체 데이터 삭제
# DELETE FROM 테이블명 [WHERE 조건]; 특정 데이터를 삭제 
DELETE FROM employee WHERE employee_number = '20230731001';
DELETE FROM employee;

# 삭제
# DROP[DDL] / DELETE[DML] / TRUNCATE[DDL]
# DROP는 스키마정의를 삭제함
# DELETE는 테이블 데이터를 삭제함
# TRUNCATE는 초기값으로 돌아감

CREATE TABLE sample(
	num1 INT AUTO_INCREMENT PRIMARY KEY,
    comment1 TEXT
);

INSERT INTO sample (comment1) VALUES ('예시');

SELECT * FROM sample;

DROP TABLE sample;

DELETE FROM sample;

TRUNCATE TABLE sample; 

INSERT INTO employee VALUES('20230731001', '홍길동', 30);
INSERT INTO employee VALUES('20230731002', '동동이', 19);
INSERT INTO employee VALUES('20230731003', '영자씨', 40);
INSERT INTO employee VALUES('20230731004', '김철수', null);

INSERT INTO employee VALUES('20230731001', '춘자', 30);
INSERT INTO employee VALUES('20230731002', '아리', 19);
INSERT INTO employee VALUES('20230731003', '권상우', 40);
INSERT INTO employee VALUES('20230731004', '뉴진스', null);

# SELECT
# 테이블에서 데이터를 조회할 때 사용
# 1. 전체 컬럼 및 데이터 조회
# SELECT * FROM 테이블명;
SELECT * FROM employee;

# 2. 특정 컬럼 조회
# SELECT 컬럼명 FROM 테이블명;
SELECT age FROM employee;

# 3. 특정 로우 조회
# SELECT * FROM 테이블명 WHERE 컬럼명 = 값;
SELECT * FROM employee WHERE age = 19;

# DISTINCT
# SELECT문에서 검색 결과에 중복을 제거
# SELECT DISTINCT 컬럼명 FROM 테이블명 [WHERE 조건];
SELECT * FROM employee;
SELECT employee_number FROM employee;
SELECT DISTINCT employee_number FROM employee;

SELECT employee_number, name FROM employee;
SELECT DISTINCT employee_number, name FROM employee;

SELECT employee_number, age FROM employee;
SELECT DISTINCT employee_number, age FROM employee;

# ORDER BY
# 검색 결과를 정렬할때 사용
# SELECT 컬럼 FROM 테이블명 WHERE 조건 ORDER BY 컬럼명 ASC | DESC, ...;
# ASC : 오름차순
# DESC : 내림차순
SELECT * FROM employee ORDER BY employee_number ASC;
SELECT * FROM employee ORDER BY employee_number DESC, name ASC;

SELECT name FROM employee WHERE age = 10 ORDER BY employee_number DESC, name ASC;

# 연산자 (비교, 논리)
SELECT * FROM bbq;
SELECT DISTINCT 업소명 FROM bbq;
SELECT * FROM bbq ORDER BY 업소명;
# = : 좌항이 우항과 같으면 true
# != / <> : 좌항이 우항과 다르면 true
SELECT * FROM bbq WHERE 업소명 = '교촌치킨';
SELECT * FROM bbq WHERE 업소명 = '비비큐';

# > : 좌항이 우항보다 크면 true
# < : 좌항이 우항보다 작으면 true
# >= : 좌항이 우항보다 크거나 같으면 true
# <= : 좌항이 우항보다 작거나 같으면 true
SELECT * FROM bbq WHERE 경도 > 35.1;
SELECT * FROM bbq WHERE 업소명 > '닭썸' ORDER BY 업소명;

UPDATE bbq SET 업소명 = null WHERE 업소명 = '비비큐';

# <=> : 좌항과 우항이 모두 null일 때 true 반환
SELECT * FROM bbq WHERE 업소명 <=> null;

# IS : 좌항이 우항과 같으면 true 반환 (true, false, nuknown, null)
# IS NULL : 좌항이 null이면 true 반환 
SELECT * FROM bbq WHERE 업소명 IS NULL;
SELECT * FROM bbq WHERE 업소명 IS FALSE ORDER BY 업소명;

# IS NOT : 좌항이 우항과 다르면 true 반환 (true, false, nuknown, null)
# IS NOT NULL : 좌항이 null이 아니면 true 반환
SELECT * FROM bbq WHERE 업소명 IS NOT NULL;

# BETWEEN min AND B : min 보다 크거나 같으면서 max 보다 작거니 같으면 true 반환 
# NOT BETWEEN min AND B : min 보다 작거나 max 보다 크면 true 반환
SELECT * FROM bbq WHERE 위도 BETWEEN 129.027 AND 129.028;
SELECT * FROM bbq WHERE 위도 NOT BETWEEN 129.027 AND 129.028;

# IN() : 좌항이 인수로 전달받은 값중 하나라도 존재하면 true
# NOT IN() : 좌항이 인수로 전달받은 값중 하나도 존재하지 않으면 true
SELECT * FROM bbq WHERE 업소명 IN('BBQ개금점', 'BBQ반여점', '교촌치킨');
SELECT * FROM bbq WHERE 업소명 NOT IN('BBQ개금점', 'BBQ반여점', '교촌치킨');

# 논리 연산자
# AND, &&(기호보다 문자를 많이 씀) : 좌항과 우항이 모두 true일 때 true반환
SELECT * FROM bbq WHERE 위도 > 129.028 AND 경도 > 35.1;

# OR, || : 좌항과 우항 중 하나라도 true일 때 true 반환 
SELECT * FROM bbq WHERE 위도 > 129.028 OR 경도 > 35.1; 

SELECT *  # OR보다 AND가 먼저 연산됨 위치를 바꿔도 같음 
FROM bbq 
WHERE 업소명 = '교촌치킨' 
AND (위도 > 129.028 
OR 경도 > 35.1);

# XOR : 좌항과 우항이 서로 다르면 true 반환
SELECT * FROM bbq WHERE 위도 > 129.028 XOR 경도 > 35.1;

# NOT : 우항의 부정을 반환 
SELECT * FROM bbq WHERE NOT 위도 > 129.028;

# LIKE 연산자 
# 문자열 데이터에서 특정 패턴에 맞는 데이터를 찾아주는 연산자 

# % : 임의 개수(0 ~ 무한대)를 표현하는 와일드 카드 
# _ : 임의의 하나의 문자를 표현하는 와일드 카드

# 업소명이 치킨으로 끝나는 레코드를 검색 
SELECT * FROM bbq WHERE 업소명 LIKE '%치킨';

# 업소명이 4글자이면서 치킨으로 끝나는 레코드를 검색 
SELECT * FROM bbq WHERE 업소명 LIKE '__치킨';

# 소재지 중 부산진구에 속한 레코드 검색 
SELECT * FROM bbq WHERE 소재지 LIKE '%부산진구%';

# % 위치에 따라 다름
# _ 의 개수만큼 특정 단어를 찾을 수 잇음










 