CREATE DATABASE sample_board_2;
USE sample_board_2;

CREATE TABLE user (
	email VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    nickname VARCHAR(20) NOT NULL UNIQUE,
    tel_number VARCHAR(15) NOT NULL UNIQUE,
    address TEXT NOT NULL,
    address_detail TEXT,
    agreed_personal BOOLEAN NOT NULL CHECK(agreed_personal IS true),
    profile_image VARCHAR(500) NOT NULL DEFAULT 'https://mblogthumb-phinf.pstatic.net/MjAyMDExMDFfMTgy/MDAxNjA0MjI4ODc1NDMw.Ex906Mv9nnPEZGCh4SREknadZvzMO8LyDzGOHMKPdwAg.ZAmE6pU5lhEdeOUsPdxg8-gOuZrq_ipJ5VhqaViubI4g.JPEG.gambasg/%EC%9C%A0%ED%8A%9C%EB%B8%8C_%EA%B8%B0%EB%B3%B8%ED%94%84%EB%A1%9C%ED%95%84_%ED%95%98%EB%8A%98%EC%83%89.jpg?type=w800'
);

 CREATE TABLE board (
	board_number INT PRIMARY KEY AUTO_INCREMENT,
    title TEXT NOT NULL,
    contents TEXT NOT NULL,
    writer_datetime DATETIME NOT NULL DEFAULT now(), # now() : 현제 시간을 지정할수 있음
    writer_email VARCHAR(50) NOT NULL,
    view_count INT NOT NULL DEFAULT 0,
    FOREIGN KEY (writer_email) REFERENCES user (email)
 );
 
 CREATE TABLE favorite (
	board_number INT NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    UNIQUE (board_number, user_email),
	FOREIGN KEY (board_number) REFERENCES board (board_number),
	FOREIGN KEY (user_email) REFERENCES user (email)
 );
 
 CREATE TABLE comment (
	board_number INT NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    writer_datetime DATETIME NOT NULL DEFAULT now(),
    FOREIGN KEY (board_number) REFERENCES board (board_number),
	FOREIGN KEY (user_email) REFERENCES user (email)
 );
 