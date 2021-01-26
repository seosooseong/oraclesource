create table userTBL(
    no number(8) CONSTRAINT pk_userTBL PRIMARY KEY,
    userName nchar(4) not null,
    birthYear number(4) not null,
    addr nchar(2) not null,
    mobile nvarchar2(12));

create sequence userTBL_seq;


--기존 타입변경

ALTER TABLE userTBL MODIFY  mobile nvarchar2(13);


insert into usertbl 
values(usertbl_seq.nextval,'홍길동', 1955, '서울', '010-1235-1456');

insert into usertbl 
values(usertbl_seq.nextval,'김지우', 1965, '부산', '010-3568-1456');

insert into usertbl 
values(usertbl_seq.nextval,'손승연', 1975, '대구', '010-8596-1456');

insert into usertbl 
values(usertbl_seq.nextval,'신동완', 1985, '인천', '010-7777-1456');

insert into usertbl 
values(usertbl_seq.nextval,'김석호', 1995, '안산','010-8888-1456');


--삭제
delete from userTBL where username ='김진우';

---------------------
select * from usertbl;

commit;

---------------------------------------------
CREATE TABLE member(
	id number primary key,
	name varchar2(10) unique not null,
	addr varchar2(50) not null,
	nation varchar2(12) not null,
	email varchar2(30) not null,
	age number null);
	
select * from member;
CREATE SEQUENCE members_seq;
delete member; 

DROP TABLE member;

commit;
rollback;

insert into member values(member_seq.nextval,'홍길동','서울시 강남구','미국','hong@naver.com',20);

insert into member values(member_seq.nextval,'서수성','수원시 영통구','한국','tntjd@naver.com',20);