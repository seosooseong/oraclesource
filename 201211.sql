select*from registerTBL;
delete TABLE registerTBL;                 
commit;

--1.
CREATE TABLE registerTBL(
                    userID char (8) PRIMARY KEY, --고정형
                    userName nvarchar2 (10) not null, 
                    birthYear number(4) not null,
                    addr nchar(2) not null, 
                    mobile1 char(3),
                    mobile2 char(8),
                    mDate date);
      
--2. registerTBL  userName, birthYear, addr - not null  수정
Alter Table registerTBL Alter Column userName nvarchar2 NOT NULL;

alter table registerTBL
Alter column userName nvarchar2 not null;

--3.
insert into registerTBL(userID, userName, birthYear,addr,mobile1,mobile2,mDate) 
            values('SJS','소지섭',1977,'서울',010,52638593,'2016-08-18');
insert into registerTBL(userID, userName, birthYear,addr,mobile1,mobile2,mDate) 
            values('PSK','박성광',1983,'경기',010,12341234,'2017-07-15');
insert into registerTBL(userID, userName, birthYear,addr,mobile1,mobile2,mDate) 
            values('LYJ','이영자',1970,'서울',010,45678963,'2016-09-15');
insert into registerTBL(userID, userName, birthYear,addr,mobile1,mobile2,mDate) 
            values('KKH','김경호',1971,'전남',010,35689541,'2018-09-16');
insert into registerTBL(userID, userName, birthYear,addr,mobile1,mobile2,mDate) 
            values('KBS','김범수',1979,'부산',010,78963214,'2018-09-17');         
            
COMMIT;



--4. KBS삭제
DELETE FROM registerTBL WHERE userID = 'KBS';

--5.registerTBL에서 userID가 KKH 인 USER의 지역을 서울로 변경하고, 
--  전화번호를 89653652로 변경하는 SQL 문을 작성 하시오.
UPDATE registerTBL  
    set 
    addr = '서울',
    mobile2= 89653652
    where userID = 'KKH';
    
--6.트랜잭션이란 무엇인가?
데이터베이스의 상태를 변환시키기 위해 수행하는 작업을 한번에 수행되어야 하는 하나의 연산



--7.트랜잭션을 취소하고 싶을 때 사용하는 명령어
ROLLBACK;

--8.scott 계정에서 사용 가능한 데이터 사전을 보기 위한 명령어
SELECT * FROM dict where scott;
SELECT * FROM scott;
--9.인덱스란?
테이블에 저장된 데이터를 빠르게 조회하기 위한 데이터베이스 객체


--9

            