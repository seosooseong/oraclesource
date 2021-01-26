-- 데이터 사전 : 데이터베이스 메모리, 성능, 사용자, 권한, 객체와 같은 오라클
-- 운영에 필요한 중요한 데이터가 보관된 장소

-- scott 계정에서 사용 가능한 데이터 사전
SELECT * FROM dict;

SELECT * FROM user_tables;

SELECT * FROM all_tables;

-- 뷰 : 가상 테이블

CREATE view vm_emp20 as (select empno, ename, job, deptno 
                         from emp 
                         where deptno=20);

SELECT * FROM vm_emp20;

-- 뷰 확인
SELECT * FROM USER_VIEWS;

CREATE VIEW vm_emp30all as SELECT * FROM EMP;

-- 생성된 뷰를 통해서 INSERT 작업

INSERT INTO vm_emp30all 
VALUES(7777,'KIM','JUNKI',NULL,'20/10/19',2650,NULL,20);

SELECT * FROM vm_emp30all;
SELECT * FROM emp;

-- 뷰는 SELECT만 가능하도록 생성
CREATE VIEW VM_EMP_READ AS 
    SELECT EMPNO, ENAME, JOB FROM EMP WITH READ ONLY;



-- 생성된 뷰에 수정이 가능한가?
SELECT * FROM user_updatable_columns WHERE table_name='VM_EMP30ALL';

SELECT * FROM user_updatable_columns WHERE table_name='VM_EMP_READ';

-- 뷰를 사용하는 목적
-- 보안(원본 테이블이 가지고 있는 민감한 정보 제한)
SELECT * FROM EMP; -- SAL,COMM
-- 서브쿼리, 조인과 같은 복잡한 쿼리 결과를 저장해서 사용

-- 인덱스 - 색인이기 때문에 select 문에 효능을 높임

-- scott 계정이 소유한 인덱스 정보 보기
SELECT * FROM user_indexes;

-- 기본키 생성 => 자동 인덱스가 됨

-- 인덱스 생성(emp 테이블의 sal 열에 인덱스 생성)
CREATE INDEX idx_emp_sql on emp(sal);

select * from emp WHERE sal=1250;

-- 기본키가 설정된 테이블 인덱스 확인
create table userTBL(
    userID char(8) NOT NULL PRIMARY KEY,
    userName nvarchar2(10) NOT NULL,
    birthYear number(4) NOT NULL,
    mobile char(3));

SELECT index_name,uniqueness,index_type FROM user_indexes;

SELECT * FROM user_indexes;

-- 시퀀스 : 특정 규칙에 맞는 연속 숫자 생성
--        : 게시글 번호, 상품 번호, 주문번호....

CREATE SEQUENCE DEPT_SEQ 
INCREMENT BY 10 -- 10씩 증가
START WITH 10  -- 처음 시작 숫자
MAXVALUE 90    -- 마지막 숫자
MINVALUE 0     -- START 값보다 작게 설정
NOCYCLE CACHE 2; -- 반복하지 않음, 미리 생성할 것인지 여부

CREATE TABLE DEPT_SEQ_TBL AS SELECT * FROM DEPT WHERE 1<>1;

-- 시퀀스를 이용해서 삽입
SELECT * FROM dept_seq_tbl;
INSERT INTO DEPT_SEQ_TBL VALUES(DEPT_SEQ.nextval,'DATABASE','SEOUL');

-- 시퀀스 수정
ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE;

-- 마지막 발행된 시퀀스 확인하기
SELECT DEPT_SEQ.currval FROM DUAL;


-- SYNONYM(동의어) : 공식 별칭
-- 테이블, 뷰, 시퀀스 등 객체들에게 대신 사용할 수 있는 이름 부여

CREATE SYNONYM E FOR EMP;

SELECT * FROM E;  

DROP SYNONYM E;


-- 연습문제
-- 
CREATE TABLE EMPIDX AS SELECT * FROM EMP WHERE 1<>1;

CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(EMPNO);

SELECT * FROM USER_INDEXES;

CREATE VIEW EMPIDX_OVER15K AS SELECT * FROM EMPIDX WHERE SAL > 1500;


CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;

DROP SEQUENCE DEPTSEQ;

CREATE SEQUENCE DEPTSEQ
INCREMENT BY 1 
START WITH 1  
MAXVALUE 99 
MINVALUE 1 
NOCYCLE NOCACHE;

SELECT * FROM USER_SEQUENCES;

INSERT INTO DEPTSEQ VALUES(DEPTSEQ.nextval, 'DATABASE', 'SEOUL');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ.nextval, 'WEB', 'BUSAN');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ.nextval, 'MOBILE', 'ILSAN');

SELECT * FROM DEPTSEQ;




