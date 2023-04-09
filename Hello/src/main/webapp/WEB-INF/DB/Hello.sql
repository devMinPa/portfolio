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
 consignee VARCHAR2(20),
 phone VARCHAR2(20),
 address VARCHAR2(90),
 orderdate DATE,
 status VARCHAR2(10)
);

DROP TABLE OrderList;
CREATE TABLE OrderList (
 order_id NUMBER(8),
 p_id VARCHAR2(10),
 saleprice NUMBER(8),
 quantity NUMBER(3),
 rating NUMBER(1,1)
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
INSERT INTO product VALUES('P0003','갤럭시탭', '삼성전자', 750000,'11인치(27.9cm), 128GB, WiFi, 안드로이드');
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

INSERT INTO Orders VALUES (orderno_seq.nextval, 'pjs', '박지성', '000-5000-0001', '영국 맨체스타', TO_DATE('2014-07-01','yyyy-mm-dd'),'completed'); 
INSERT INTO Orders VALUES (orderno_seq.nextval, 'pjs', '박지성', '000-5000-0001', '영국 맨체스타', TO_DATE('2014-07-03','yyyy-mm-dd'),'completed');
INSERT INTO Orders VALUES (orderno_seq.nextval, 'kim', '김연아', '000-6000-0001', '대한민국 서울', TO_DATE('2014-07-03','yyyy-mm-dd'),'completed');
INSERT INTO Orders VALUES (orderno_seq.nextval, 'jmr', '장미란', '000-7000-0001', '대한민국 강원도', TO_DATE('2014-07-04','yyyy-mm-dd'),'completed'); 
INSERT INTO Orders VALUES (orderno_seq.nextval, 'choo', '추신수', '000-8000-0001' ,'미국 클리블랜드', TO_DATE('2014-07-05','yyyy-mm-dd'),'completed');
INSERT INTO Orders VALUES (orderno_seq.nextval, 'pjs', '박지성', '000-5000-0001', '영국 맨체스타', TO_DATE('2014-07-07','yyyy-mm-dd'),'completed');
INSERT INTO Orders VALUES (orderno_seq.nextval, 'choo', '추신수', '000-8000-0001', '미국 클리블랜드', TO_DATE( '2014-07-07','yyyy-mm-dd'),'delivered');
INSERT INTO Orders VALUES (orderno_seq.nextval, 'jmr', '장미란', '000-7000-0001', '대한민국 강원도', TO_DATE('2014-07-08','yyyy-mm-dd'),'delivered'); 
INSERT INTO Orders VALUES (orderno_seq.nextval, 'kim', '김연아', '000-6000-0001', '대한민국 서울', TO_DATE('2014-07-09','yyyy-mm-dd'),'ordered'); 
INSERT INTO Orders VALUES (orderno_seq.nextval, 'jmr', '장미란', '000-7000-0001', '대한민국 강원도', TO_DATE('2014-07-10','yyyy-mm-dd'),'ordered');

INSERT INTO orderList VALUES (1, 'P0001', 7000, 2, 4.5);
INSERT INTO orderList VALUES (1, 'P0004', 13000, 1, 4);
INSERT INTO orderList VALUES (2, 'P0009', 130000, 2, 4.5);
INSERT INTO orderList VALUES (3, 'P0005', 8000000, 1, 4);
INSERT INTO orderList VALUES (3, 'P0006', 1490000, 1, 4);
INSERT INTO orderList VALUES (3, 'P0010', 13000, 1, 3);
INSERT INTO orderList VALUES (4, 'P0009', 130000, 1, 2);
INSERT INTO orderList VALUES (5, 'P0001', 7000, 2, 4);
INSERT INTO orderList VALUES (6, 'P0011', 1300000, 1, 4.5);
INSERT INTO orderList VALUES (6, 'P0012', 1000000, 1, 4);
INSERT INTO orderList VALUES (7, 'P0004', 13000, 2, 4);
INSERT INTO orderList VALUES (8, 'P0006', 1490000, 1, 4.5);
INSERT INTO orderList VALUES (9, 'P0003', 750000, 1, 4);
INSERT INTO orderList VALUES (10, 'P0010', 13000, 1, 3.5);

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
INSERT INTO category_map VALUES('P0009','C0010');
INSERT INTO category_map VALUES('P0010','C0002');
INSERT INTO category_map VALUES('P0010','C0011');
INSERT INTO category_map VALUES('P0011','C0013');
INSERT INTO category_map VALUES('P0012','C0014');

INSERT INTO interests VALUES('pjs','CM001');
INSERT INTO interests VALUES('pjs','CM006');
INSERT INTO interests VALUES('kim','CM001');
INSERT INTO interests VALUES('kim','CM002');
INSERT INTO interests VALUES('kim','CM005');


-- products(All)
select 
        mc.ctg_name, s.ctg_name, p.pname, manufacturer, price, p_description
  from 
        product p,category_map m,sub_category s, major_category mc
 where  
        p.p_id = m.p_id
    and m.ctg_id= s.ctg_id
    and s.major_ctg= mc.ctg_id
order by major_ctg,s.ctg_id,p.p_id;

-- products(Books)-대분류
select 
        mc.ctg_name, s.ctg_name, p.pname, manufacturer, price, p_description
  from 
        product p,category_map m,sub_category s, major_category mc
 where  
        p.p_id = m.p_id
    and m.ctg_id= s.ctg_id
    and s.major_ctg= mc.ctg_id
    and s.major_ctg='CM001' --'major_ctg'
order by s.ctg_id,p.p_id;

-- products(sportsBook)-소분류
select 
        mc.ctg_name, s.ctg_name, p.pname, manufacturer, price, p_description
  from 
        product p,category_map m,sub_category s, major_category mc
 where  
        p.p_id = m.p_id
    and m.ctg_id= s.ctg_id
    and s.major_ctg= mc.ctg_id
    and s.major_ctg='CM001' --'major_ctg'
    and s.ctg_id='C0001' --'ctg_id'
order by s.ctg_id,p.p_id;

-- login sucess - 고객 관심분야 인기상품 추천
select
        o.c_id, l.p_id, l.rating
  from
        orders o, orderlist l
 where
        o.order_id=l.order_id
order by p_id;