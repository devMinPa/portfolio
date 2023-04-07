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
 pname VARCHAR2(40),
 manufacturer VARCHAR2(40),
 price NUMBER(8),
 p_description VARCHAR2(100)
 );

DROP TABLE Customer; 
CREATE TABLE Customer (
 c_id VARCHAR2(10) PRIMARY KEY, 
 passwd VARCHAR2(10), 
 c_name VARCHAR2(40),
 gender VARCHAR2(4),
 birth VARCHAR2(10),
 email VARCHAR2(30),
 phone VARCHAR2(20),
 address VARCHAR2(90),
 regist_day VARCHAR2(50)
);

DROP TABLE interests; 
CREATE TABLE interests (
 user_id VARCHAR2(10), 
 ctg_id VARCHAR2(20)
);

DROP SEQUENCE "HELLO"."ORDERNO_SEQ";
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
 c_id VARCHAR2(10),
 p_id VARCHAR2(10),
 saleprice NUMBER(8) ,
 orderdate DATE,
 status VARCHAR2(10)
);

DROP TABLE major_category;
CREATE TABLE major_category (
 ctg_id VARCHAR2(10) PRIMARY KEY,
 ctg_name VARCHAR2(20)
);

DROP TABLE sub_category;
CREATE TABLE sub_category (
 ctg_id VARCHAR2(10),
 ctg_name VARCHAR2(20),
 major_ctg VARCHAR2(10)
);

DROP TABLE category_map;
CREATE TABLE category_map(
 p_id VARCHAR2(10),
 ctg_id VARCHAR2(10)
 );

/* Book, Customer, Orders 데이터 생성 */
INSERT INTO product VALUES('P0001','축구의 역사', '굿스포츠', 7000,null);
INSERT INTO product VALUES('P0002','축구아는 여자', '나무수', 13000,null);
INSERT INTO product VALUES('P0003','갤럭시탭', '삼성전자', 7500,'11인치(27.9cm), 128GB, WiFi, 안드로이드');
INSERT INTO product VALUES('P0004','후라이팬', 'happycall', 13000, '36cm');
INSERT INTO product VALUES('P0005','토드백2023ss', '버버리', 8000000,null);
INSERT INTO product VALUES('P0006','아이폰11', 'apple', 1490000,'pro');
INSERT INTO product VALUES('P0007','매직마우스', 'apple', 120000,null);
INSERT INTO product VALUES('P0008','4K모니터', 'LG', 1100000,'32Inch 4K 스마트TV');
INSERT INTO product VALUES('P0009','월드컵공인구','아디다스',130000,'2022카타르');
INSERT INTO product VALUES('P0010','정보처리기사필기','시나공',13000,'기출문제500제');
INSERT INTO product VALUES('P0011','건조기2010','LG',1300000,'건조기 10kg');
INSERT INTO product VALUES('P0012','통돌이2010','LG',1000000,'통돌이 10kg');

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

--카테고리(대분류)
INSERT INTO major_category VALUES('CM001','Books');
INSERT INTO major_category VALUES('CM002','Clothes');
INSERT INTO major_category VALUES('CM003','IT');
INSERT INTO major_category VALUES('CM004','Home Appliances');
INSERT INTO major_category VALUES('CM005','Kitchen Equipments');
INSERT INTO major_category VALUES('CM006','Sports');
INSERT INTO major_category VALUES('CM007','Contents');

--카테고리(기본)
INSERT INTO sub_category VALUES('C0001','sportsBook','CM001');
INSERT INTO sub_category VALUES('C0002','examinationBook','CM001');
INSERT INTO sub_category VALUES('C0003','historyBook','CM001');
INSERT INTO sub_category VALUES('C0006','mouse','CM003');
INSERT INTO sub_category VALUES('C0007','monitor','CM003');
INSERT INTO sub_category VALUES('C0008','bag','CM002');
INSERT INTO sub_category VALUES('C0009','fryingPan','CM005');
INSERT INTO sub_category VALUES('C0010','ball','CM006');
INSERT INTO sub_category VALUES('C0011','electricBook','CM001');
INSERT INTO sub_category VALUES('C0011','electricBook','CM007');
INSERT INTO sub_category VALUES('C0012','smartTV','CM004');
INSERT INTO sub_category VALUES('C0013','dryingMachine','CM004');
INSERT INTO sub_category VALUES('C0014','washingMachine','CM004');

select p_id,pname,ctg_id,ctg_name from product p,sub_category c;

INSERT INTO category_map VALUES('P0001','C0001');
INSERT INTO category_map VALUES('P0001','C0003');
INSERT INTO category_map VALUES('P0001','C0011');
INSERT INTO category_map VALUES('P0002','C0001');
INSERT INTO category_map VALUES('P0002','C0011');
INSERT INTO category_map VALUES('P0003','C0004');
INSERT INTO category_map VALUES('P0004','C0009');
INSERT INTO category_map VALUES('P0005','C0008');
INSERT INTO category_map VALUES('P0006','C0005');
INSERT INTO category_map VALUES('P0007','C0006');
INSERT INTO category_map VALUES('P0008','C0007');
INSERT INTO category_map VALUES('P0008','C0012');
INSERT INTO category_map VALUES('P0009','C0001');
INSERT INTO category_map VALUES('P0010','C0002');
INSERT INTO category_map VALUES('P0010','C0011');
INSERT INTO category_map VALUES('P0011','C0013');
INSERT INTO category_map VALUES('P0012','C0014');

select 
         s.major_ctg, mc.ctg_name, m.ctg_id, s.ctg_name, p.p_id, p.pname
  from 
        product p,category_map m,sub_category s, major_category mc
 where  
        p.p_id = m.p_id
    and m.ctg_id= s.ctg_id
    and s.major_ctg= mc.ctg_id
order by s.ctg_id,major_ctg;