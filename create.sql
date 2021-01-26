create table test(
    id NUMBER(4),
    name varchar2(3));

desc test;

INSERT into test values(1000, '홍길동'); --한글은 글자하나당 2BYTE
INSERT into test values(1000, 'ABC');    --영어는 글자하나당 1BYTE로 처리

--언어마다 서로 다른 BYTE처리를 보완하기 위해 nchar, nvarchar2

-- DROP TABLE TEST2; --지우기


--nchar, nvarchar2 차이 :고정된 길이를 항상 가지고 있느냐 아니냐 차이.
--NCAHAR 경우에는 글자가 1만 입력이 되도 4자리를 항상 유지

create table test2(
    id NCHAR(4),
    name Nvarchar2(3));
    
INSERT INTO TEST2 VALUES('황보강성','홍길동');


----------------------------------------------------------------------
SELECT*FROM TEST3;

CREATE TABLE TEST3(
        ID NVARCHAR2(4),
        NAME NVARCHAR2(4),
        REG_DATE DATE);
        
INSERT INTO TEST3 VALUES ('황보강성','홍길동', SYSDATE);
INSERT INTO TEST3 VALUES ('황보강성','홍길동', '2020-11-09');


----------------------------------------------------------------------
--테이블 생성하는 방법들.
--CREATE TABLE 테이블명( 열이름 타입,-----)
--CREATE TABLE 테이블명 AS SELECT*FROM EMP;
--CREATE TABLE 테이블명 AS SELECT*FROM EMP WHERE DEPTNO =20;
--구조만 복사.
--CREATE TABLE 테이블명 AS SELECT*FROM EMP WHERE 1<>1;

DESC EMP;


CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4),
    ENAME VACHAR2(10),
    JOB VACHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2), --전체 자릿수는 7자리 (소수점 2자리를 포함할 수 있음)
    COMM NUMBER(7,2), --12345.67
    DEPTNO NUMBER(2));

CREATE TABLE EMP_DDL(
                    EMPNO  NUMBER(4),    
                    ENAME  VARCHAR2(10),
                    JOB    VARCHAR2(9), 
                    MGR    NUMBER(4),    
                    HIREDATE DATE,      
                    SAL NUMBER(7,2), 
                    COMM NUMBER(7,2), 
                    DEPTNO NUMBER(2));  

--컬럼 추가
ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);

--컬럼명 변경
ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL;

--기존 타입변경

ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);

--기존특정열 삭제
ALTER TABLE EMP_DDL DROP COLUMN TEL;


--테이블명 변경
RENAME EMP_DDL TO EMP_RENAME;


DESC EMP_DDL;


--ppt실습1.
CREATE TABLE MEMBER(
                    ID char (8), --고정형
                    NAME nvarchar2 (10), --가변형 문자열(한글)
                    ADDR nvarchar2(50), --가변형 문자열(한글,숫자)
                    NATION nchar(4), --고정형 문자(한글)
                    EMAIL varchar2(50), -- 가변형 문자
                    AGE number(7,2)); --소수 둘째자리까지 표현
                    
--member 테이블에 BIGO열 추가
--가변형 문자열 길이는 20
ALTER TABLE MEMBER ADD BIGO NVARCHAR2(20); 

--BIGO 열 크기 30으로 변경
ALTER TABLE member MODIFY bigo NVARCHAR2(30);

--bigo열 이름 REMARK로 변경
ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK; 

DROP TABLE MEMBER; -- 테이블 삭제
DESC MEMBER;
