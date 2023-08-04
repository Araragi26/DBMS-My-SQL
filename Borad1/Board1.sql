# 게시판 프로젝트 스키마 정의 

# 데이터베이스 생성
CREATE DATABASE sample_board_1;
 
 USE sample_board_1;
 
 # 데이터베이스 테이블 생성 
 # 회원정보(user) / 게시물(board)
 CREATE TABLE user (
	email VARCHAR(50), 		# 구분자로 지정한 email은 나중에 index로 생성되기에 TEXT로 지정하면 구동을 안하기에 하면 안됨
    password VARCHAR(255), 	# 암호화 하기에 긴 데이터 길이를 지정해줌
    nickname VARCHAR(20),
    tel_number VARCHAR(15),
    address TEXT,
    address_detail TEXT, 
    agreed_personal BOOLEAN,
    profile_image TEXT
 );
 
 CREATE TABLE board (
	board_number INT,
    title TEXT,
    contents TEXT,
    writer_datetime DATETIME,
    writer_email VARCHAR(50),
    writer_nickname VARCHAR(20),
    writer_profile_image TEXT,
    view_count INT
 );
 