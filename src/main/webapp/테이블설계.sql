use mysql;

create user ezen@'%' identified by '1234';

create database ezen_project;

grant all privileges on ezen_project to ezen@'%';

use ezen_project;

-- 시퀀스 관리 테이블 생성
CREATE TABLE sequences (
	seq_name VARCHAR(50) primary key,
	no INT NOT NULL
);

-- 각 테이블마다 시퀀스로 쓸 시퀀스 이름 과 시퀀스 초기값 가져온 후 통합 시퀀스 테이블에 삽입.
INSERT INTO sequences VALUES ('item_no', 9999);
INSERT INTO sequences VALUES ('cart_no', 19999);
INSERT INTO sequences VALUES ('buy_no', 29999);
INSERT INTO sequences VALUES ('board_no', 39999);

-- 시퀀스 튜플 데이터 정상 삽입 확인
select * from sequences;

-- 함수를 정의하기 전에 함수 해당 함수 존재하면 삭제.
DROP FUNCTION IF EXISTS get_seq;

-- get_seq() 프로시저 선언
-- 오라클에서 시퀀스명.nextval 을 사용해 다음 시퀀스 값 가져오는 것처럼 get_seq() 프로시저
-- get_seq() 프로시저는 parameter 값으로 문자열 타입의 'item_no' 처럼
-- 위에서 sequences 테이블에 샘플데이터로 삽입해 놓았던 'item_no', 'cart_no' ,.. 같은 문자열 값을 전달해
-- sequences 테이블에서 seq_name = p_seq_name 인 no 튜플의 값을 +1 해서 업데이트 한 뒤,
-- 위에서 정의(DECLARE)한 리턴 값인 INT 타입의 RESULTNO 에 방금 업데이트한 no 튜플의 값을 SET 한 뒤, 리턴하는 기능을 수행.

DELIMITER $$
CREATE FUNCTION get_seq (p_seq_name VARCHAR(45))
RETURNS INT READS SQL DATA
BEGIN
DECLARE RESULT_NO INT;
UPDATE sequences SET no = LAST_INSERT_ID(no+1)
WHERE seq_name = p_seq_name;
SET RESULT_NO = (SELECT LAST_INSERT_ID());
RETURN RESULT_NO;
END $$
DELIMITER ;

-- 이렇게 get_seq() 함수를 정의 했다면. item, cart, buy, board 테이블의 새로운 record를 삽일할 때 
-- board_no 의 value 값을 get_seq('board_no') 로 오라클에서 seq.nextval 처럼 사용할 수 있다.

-- 사용 예시
-- insert into board values(get_seq('board_no'),1,0,0,0,'hyun','QnA게시글의 제목','QnA게시글사진.jpg','QnA게시글의 내용',now());

-- 쇼핑몰 회원테이블 생성
create table shop_user(
	user_id varchar(30) primary key,
    user_pw varchar(30) not null,
    user_name varchar(30) not null,
    mail1 varchar(20) not null,
    mail2 varchar(20) not null,
    tel1 varchar(10) not null,
    tel2 varchar(10) not null,
    tel3 varchar(10) not null,
    add1 varchar(100) default null,
    add2 varchar(100) default null,
    add3 varchar(100) default null,
    add4 varchar(100) default null,
    year varchar(10) default null,
    month varchar(10) default null,
    day varchar(10) default null,
    join_date datetime not null
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_520_ci comment '회원정보';

-- 회원정보 샘플데이터삽입.
insert into 
	shop_user 
values
	('Sun','1234','선준혁','tomatodori','naver.com','010','7245','8900','안양시','동안구','달안로','124','1997','9','2',sysdate());    
select * from shop_user;

insert into 
	shop_user 
values
	('admin','1234','관리자','admin','naver.com','010','7245','8900','관리자','관리자','관리자','관리자','1997','9','2',sysdate());    
select * from shop_user;

-- 상품정보 테이블 생성
create table item(
	item_no int primary key,
    item_price int not null,
    item_name varchar(30) not null,
    item_group varchar(30) not null,
    item_option varchar(50) not null,
    item_photo varchar(50) not null,
    item_desc varchar(50) not null,
    item_date datetime not null
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_520_ci comment '상품정보';

-- 장바구니 테이블 생성
create table cart(
	cart_no int primary key,
    item_no int not null,
    item_price int not null,
    cart_amount int not null,
    cart_item varchar(50) not null,
    item_photo varchar(50) not null,
    user_id varchar(30) not null,
    cart_date datetime not null
)engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_520_ci comment '장바구니';

-- 구매정보 테이블 생성 
create table buy(
	buy_no int primary key,
    buy_type int not null,
    item_no int not null,
    item_price int not null,
    cart_amount int not null,
    card1 varchar(10) not null,
    card2 varchar(10) not null,
    card3 varchar(10) not null,
    card4 varchar(10) not null,
    tel1 varchar(10) not null,
    tel2 varchar(10) not null,
    tel3 varchar(10) not null,
    cart_item varchar(50) not null,
    item_photo varchar(50) not null,
    user_id varchar(30) not null,
    name varchar(30) not null,
    card_pw varchar(30) not null,
    add1 varchar(100) not null,
    add2 varchar(100) not null,
    add3 varchar(100) not null,
    add4 varchar(100) not null,
    message varchar(1000) default null,
    buy_date datetime not null
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_520_ci comment '구매정보';

-- 게시판 테이블 생성
create table board(
	board_no int primary key,
    ref int not null,
    board_type int not null,
    hidden int not null,
    readcount int not null,
    user_id varchar(30) not null,
    title varchar(50) not null,
    board_photo varchar(50) default null,
    content varchar(1000) not null,
    reg_date datetime not null
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_520_ci comment '게시판';

show tables;

select * from shop_user;
select * from item;
select * from cart;
select * from buy;
select * from board;

commit;

-- DB손상 시 각 테이블별 시퀀스번호 초기화.
update sequences set no = 9999 where seq_name='item_no';
update sequences set no = 19999 where seq_name='cart_no';
update sequences set no = 29999 where seq_name='buy_no';
update sequences set no = 39999 where seq_name='board_no';
