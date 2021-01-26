--제약조건 (DDL 작성)

--1. NOT NULL
CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));
    
INSERT INTO TABLE_NOTNULL values('seo1234','seo1234'); --값의 수가 충분하지 않습니다

--NULL을 ("TEST"."TABLE_NOTNULL"."LOGIN_PWD") 안에 삽입할 수 없습니다
INSERT INTO TABLE_NOTNULL(login_id,login_pwd)
values('seo1',null);  


INSERT INTO TABLE_NOTNULL(login_id,login_pwd)
values('seo1234','seo1234');


--NULL로 ("TEST"."TABLE_NOTNULL"."LOGIN_PWD")을 갱신할 수 없습니다
UPDATE table_notnull set login_pwd=null where login_id='seo1234';


SELECT * FROM table_notnull;



--제약조건 확인하기
SELECT * FROM user_constraints;


--제약조건명 지정하기
CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT tbl_nn_lgin_nn NOT NULL,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT tbl_nn_lginpwd_nn NOT NULL,
    TEL VARCHAR2(20));

--제약조건 추가
alter table table_notnull2 MODIFY (tel not null);
alter table table_notnull2 MODIFY (tel CONSTRAINT tbl_nn_tel_nn not null);

ALTER table table_notnull2 rename constraint SYS_C0011111 to TBL_NN_TEL_NN;

--제약조건 삭제
ALTER table table_notnull2 drop constraint tbl_nn_tel_nn;

update table_notnull set tel='010-1111-1111' where login_id='seo1234';
alter table table_notnull MODIFY (tel not null); --(TEST.) 사용으로 설정 불가 - 널 값이 발견되었습니다.




--2. UNIQUE : 중복되지 않는 값

create table table_unique(
            LOGIN_ID VARCHAR2(20) unique,
            LOGIN_PWD VARCHAR2(20) NOT NULL,
            TEL VARCHAR2(20));

insert into table_unique(login_id, login_pwd, tel)
values ('TEST_ID02','PWD01','010-1234-1234');

SELECT*FROM TABLE_UNIQUE;



--제약조건 확인하기--------------------------------------------------------
SELECT * FROM user_constraints;
--------------------------------------------------------------------------

create table table_unique2(
            LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ unique,
            LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNPWD_UNN NOT NULL,
            TEL VARCHAR2(20));
            
            
            
--3. PRIMARY KEY (NOT NULL + UNIQUE): 기본키
SELECT*FROM TABLE_PK;

create table TABLE_PK(
            LOGIN_ID VARCHAR2(20) PRIMARY KEY,
            LOGIN_PWD VARCHAR2(20) NOT NULL,
            TEL VARCHAR2(20));
            
insert into TABLE_PK(login_id, login_pwd, tel)
values ('TEST_ID01','PWD01','010-1234-1234'); --중복값, NULL X


create table TABLE_PK2(
            LOGIN_ID VARCHAR2(20) CONSTRAINT TBLPK2_LOGID_PK PRIMARY KEY,
            LOGIN_PWD VARCHAR2(20) NOT NULL,
            TEL VARCHAR2(20));
            
          
          
            
-- 제약조건만 모아서 주기 (아래쪽에...)
CREATE TABLE TABLE_CONSTRANT(
                            ID NUMBER (6),
                            NAME VARCHAR2(10),
                            ADDR VARCHAR2(20),
                            TEL VARCHAR2(20),
                            CONSTRAINT TBL_ID_PK PRIMARY KEY(ID),--제약조건만 모아서 주기
                            CONSTRAINT TBL_ID_UNQ UNIQUE(TEL));  --제약조건만 모아서 주기





--4. FOREIGN KEY (외래키) : 서로 다른 테이블 간 관계 정의

CREATE TABLE DEPT_FK(
            deptno NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK prImary KEY, --이름지정하면서 프라이머리
            dname varchAr2(14),
            loc VARCHAR2(13));

CREATE TABLE EMP_FK(
            EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
            ENAME VARCHAR2(10),
            JOB VARCHAR2 (9),
            MGR NUMBER(4),
            HIREDATE DATE,
            SAL NUMBER(7,2),
            COMM NUMBER(7,2),
            DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO)); --연결될것을 동일하게..
           --외래키 설정                 -- 가져올것을        --참조해서     
        

insert into dept_fk values (50, 'database', 'seoul');        
    
    
        
--부모 키가 없습니다
--그래서 부모테이블에 먼저 집어 넣어야 한다.     
INSERT INTO EMP_FK VALUES(1111,'홍길동', 'clerk', '7777', '2019/02/13', 1200,null,50);

--자식 레코드가 발견되었습니다 // 제거 안됨.
delete from dept_fk where deptno=50;


drop table emp_fk; --테이블 삭제 아래





-----------------------------------------
-- on delete cascade : 부모키가 제거될때 자식키도 같이 제거
CREATE TABLE EMP_FK(
            EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
            ENAME VARCHAR2(10),
            JOB VARCHAR2 (9),
            MGR NUMBER(4),
            HIREDATE DATE,
            SAL NUMBER(7,2),
            COMM NUMBER(7,2),
            DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK 
            REFERENCES DEPT_FK(DEPTNO) on delete cascade); 

--그래서 부모테이블에 먼저 집어 넣어야 한다.     
INSERT INTO EMP_FK VALUES(1111,'홍길동', 'clerk', '7777', '2019/02/13', 1200,null,50);

--자식 레코드가 발견되었습니다 // 제거 안됨.
delete from dept_fk where deptno=50;                                       ----------------
               
               
               
               
               
-- on delete set null : 부모키가 제거될때 자식키 값은 null로 변경.     
CREATE TABLE EMP_FK(
            EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
            ENAME VARCHAR2(10),
            JOB VARCHAR2 (9),
            MGR NUMBER(4),
            HIREDATE DATE,
            SAL NUMBER(7,2),
            COMM NUMBER(7,2),
            DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK 
            REFERENCES DEPT_FK(DEPTNO) on delete set null);
                                        ----------------
--그래서 부모테이블에 먼저 집어 넣어야 한다.     
INSERT INTO EMP_FK VALUES(1111,'홍길동', 'clerk', '7777', '2019/02/13', 1200,null,50);

--자식 레코드가 발견되었습니다 // 제거 안됨.
delete from dept_fk where deptno=50;  




rollback;
select * from emp_fk;

--5. CHECK : 열에 저장할 수 있는 값의 범위 또는 패턴 정의.

CREATE TABLE TABLE_CHECK(
            LOGIN_ID VARCHAR(20) CONSTRAINT TBLCK_LOGID_PK PRIMARY KEY,
            LOGIN_PWD VARCHAR(20) CONSTRAINT TBLCK_LOGPD_PK CHECK (LENGTH(LOGIN_PWD)>3),
            TEL VARCHAR2(20));
            
INSERT INTO TABLE_CHECK VALUES ('TEST_ID','1234','010-8620-0439');
  
           
           
            
--6. DEFAULT : 기본값 정하기

CREATE TABLE TABLE_DEFAULT(
            LOGIN_ID VARCHAR(20) CONSTRAINT TBLDF_LOGID_PK PRIMARY KEY,
            LOGIN_PWD VARCHAR(20) DEFAULT '1234', --기본값 1234 로 설정.
            TEL VARCHAR2(20));
            
DESC TABLE_DEFAULT;

INSERT INTO TABLE_DEFAULT VALUES('TEST_ID',NULL,'010-1111-1111');
INSERT INTO TABLE_DEFAULT VALUES('TEST_ID2', '5555','010-1111-2222');
INSERT INTO TABLE_DEFAULT(LOGIN_ID, TEL) VALUES('서수성','010-8620-2222');


SELECT * FROM TABLE_DEFAULT;

            