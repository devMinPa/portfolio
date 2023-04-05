DROP USER hello CASCADE; 
CREATE USER hello IDENTIFIED BY hello1234 DEFAULT TABLESPACE users TEMPORARY
TABLESPACE temp PROFILE DEFAULT;
GRANT CONNECT, RESOURCE TO hello;
GRANT CREATE VIEW, CREATE SYNONYM TO hello;
ALTER USER hello ACCOUNT UNLOCK;
/* 여기서부터는 마당 계정으로 접속 */
conn hello/hello1234;

DROP TABLE product;
CREATE TABLE Product (
 p_id VARCHAR2(10) PRIMARY KEY,
 category_id NUMBER(4),
 pname VARCHAR2(40),
 manufacturer VARCHAR2(40),
 price NUMBER(8),
 p_description VARCHAR2(100)
 );

DROP TABLE Categori
CREATE TABLE Categori(
 categori_id VARCHAR2(10) PRIMARY KEY, 
 categori_name VARCHAR2(10)
 );

DROP TABLE customer; 
CREATE TABLE Customer (
 cust_id VARCHAR2(10) PRIMARY KEY, 
 passwd VARCHAR2(10), 
 cname VARCHAR2(40),
 gender VARCHAR2(4),
 birth VARCHAR2(10),
 email VARCHAR2(30),
 phone VARCHAR2(20),
 address VARCHAR2(90),
 regist_day VARCHAR2(50)
);

CREATE SEQUENCE "HELLO"."ORDERNO_SEQ"  
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    CACHE 20
    NOORDER  
    NOCYCLE ; 
  
DROP TABLE orders;
CREATE TABLE Orders (
 order_id NUMBER(8) PRIMARY KEY,
 cust_id VARCHAR2(10),
 p_id VARCHAR2(10),
 saleprice NUMBER(8) ,
 orderdate DATE,
 status VARCHAR2(10)
);

/* Book, Customer, Orders 데이터 생성 */
INSERT INTO product VALUES('P0001','book', '축구의 역사', '굿스포츠', 7000,null);
INSERT INTO product VALUES('P0002','book', '축구아는 여자', '나무수', 13000,null);
INSERT INTO product VALUES('P0003','book', '축구의 이해', '대한미디어', 22000,null);
INSERT INTO product VALUES('P0004','book', '골프 바이블', '대한미디어', 35000,null);
INSERT INTO product VALUES('P0005','book', '피겨 교본', '굿스포츠', 8000,null);
INSERT INTO product VALUES('P0006','book', '역도 단계별기술', '굿스포츠', 6000,null);
INSERT INTO product VALUES('P0007','book', '야구의 추억', '이상미디어', 20000,null);
INSERT INTO product VALUES('P0008','book', '야구를 부탁해', '이상미디어', 13000,null);
INSERT INTO product VALUES('P0009','tablet', '갤럭시탭', '삼성전자', 7500,'11인치(27.9cm), 128GB, WiFi, 안드로이드');
INSERT INTO product VALUES('P0010','kitchen', '후라이팬', 'happycall', 13000, '36cm');

INSERT INTO Customer VALUES ('pjs','pjs1234', '박지성','M','19800121','pjs@gmail.com', '000-5000-0001','영국 맨체스타','230403');
INSERT INTO Customer VALUES ('kim','kim1234', '김연아','W','19870620','kim@gmail.com', '000-6000-0001','대한민국 서울','230403'); 
INSERT INTO Customer VALUES ('jmr','jmr1234', '장미란','W','19821021','jmr@gmail.com', '000-7000-0001','대한민국 강원도','230403');
INSERT INTO Customer VALUES ('choo','ch1234', '추신수','M','19800312','choo@gmail.com', '000-8000-0001','미국 클리블랜드','230403');
INSERT INTO Customer VALUES ('park','sr1234', '박세리','W','19790505','park@gmail.com', NULL,'대한민국 대전','230401');

INSERT INTO Orders VALUES (orderno_seq.nextval, 'pjs', 'P0001', 6000, TO_DATE('2014-07-01','yyyy-mm-dd'),null); 
INSERT INTO Orders VALUES (orderno_seq.nextval, 'pjs', 'P0003', 21000, TO_DATE('2014-07-03','yyyy-mm-dd'),'ordered');
INSERT INTO Orders VALUES (orderno_seq.nextval, 'kim', 'P0005', 8000, TO_DATE('2014-07-03','yyyy-mm-dd'),'ordered');
INSERT INTO Orders VALUES (orderno_seq.nextval, 'jmr', 'P0006', 6000, TO_DATE('2014-07-04','yyyy-mm-dd'),'ordered'); 
INSERT INTO Orders VALUES (orderno_seq.nextval, 'choo', 'P0007', 20000, TO_DATE('2014-07-05','yyyy-mm-dd'),'ordered');
INSERT INTO Orders VALUES (orderno_seq.nextval, 'pjs', 'P0002', 12000, TO_DATE('2014-07-07','yyyy-mm-dd'),'ordered');
INSERT INTO Orders VALUES (orderno_seq.nextval, 'choo', 'P0008', 13000, TO_DATE( '2014-07-07','yyyy-mm-dd'),'delivered');
INSERT INTO Orders VALUES (orderno_seq.nextval, 'jmr', 'P0010', 12000, TO_DATE('2014-07-08','yyyy-mm-dd'),'delivered'); 
INSERT INTO Orders VALUES (orderno_seq.nextval, 'kim', 'P0010', 7000, TO_DATE('2014-07-09','yyyy-mm-dd'),'completed'); 
INSERT INTO Orders VALUES (orderno_seq.nextval, 'jmr', 'P0008', 13000, TO_DATE('2014-07-10','yyyy-mm-dd'),'completed');

DROP TABLE categori_map
CREATE TABLE categori_map(
 cust_id VARCHAR2(10) PRIMARY KEY, 
 categori_id VARCHAR2(10)
 );

