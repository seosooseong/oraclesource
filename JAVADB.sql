create table userTBL(
    no number(8) CONSTRAINT pk_userTBL PRIMARY KEY,
    userName nchar(4) not null,
    birthYear number(4) not null,
    addr nchar(2) not null,
    mobile nvarchar2(12));

create sequence userTBL_seq;


--���� Ÿ�Ժ���

ALTER TABLE userTBL MODIFY  mobile nvarchar2(13);


insert into usertbl 
values(usertbl_seq.nextval,'ȫ�浿', 1955, '����', '010-1235-1456');

insert into usertbl 
values(usertbl_seq.nextval,'������', 1965, '�λ�', '010-3568-1456');

insert into usertbl 
values(usertbl_seq.nextval,'�ս¿�', 1975, '�뱸', '010-8596-1456');

insert into usertbl 
values(usertbl_seq.nextval,'�ŵ���', 1985, '��õ', '010-7777-1456');

insert into usertbl 
values(usertbl_seq.nextval,'�輮ȣ', 1995, '�Ȼ�','010-8888-1456');


--����
delete from userTBL where username ='������';

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

insert into member values(member_seq.nextval,'ȫ�浿','����� ������','�̱�','hong@naver.com',20);

insert into member values(member_seq.nextval,'������','������ ���뱸','�ѱ�','tntjd@naver.com',20);