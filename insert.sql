--회원가입, 게시글 등록, 입금...

--기존의 dept테이블을 복사해서 dept_temp 테이블 생성

CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

SELECT * FROM dept_temp;

-- 데이터 추가하기(방법1) / 필드명 주면서..
insert into dept_temp(deptno, dname, loc)
values(50,'DATABASE','SEOUL');

-- 데이터 추가하기(방법2) / 필드명이 없다면 정확하게 순서대로 입력.
insert into dept_temp values(60,'NEWWORK','BUSAN');


--SQL 오류: ORA-00947: 값의 수가 충분하지 않습니다
--00947. 00000 -  "not enough values"
insert into dept_temp(deptno, dname, loc) values(50,'DATABASE');

--이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
insert into dept_temp(deptno, dname, loc) values(500,'DATABASE','SEOUL');



--NULL삽입하기
--명시적으로 NULL삽입 (NULL, '')
insert into dept_temp(deptno, dname, loc) values(70,'DATABASE',NULL); --NULL
insert into dept_temp(deptno, dname, loc) values(80,'MOBILE',''); --''


--묵시적으로 NULL삽입
INSERT INTO dept_temp(deptno, loc) values (90,'INCHEON');



--EMP테이블을 복사하여 EMP_TEMP테이블 생성
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;

--테이블 삭제
DROP TABLE EMP_TEMP;

--EMP테이블을 복사하여 EMP_TEMP테이블 생성 / 구조만 복사하기
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;
SELECT * FROM EMP_temp; 

DESC EMP_TEMP;
INSERT INTO emp_temp(empno,ename,job,mgr, hiredate,sal, comm, deptno)
values(9999,'홍길동','PRESIDENT','','2020-11-09',4000,NULL,10);

INSERT INTO emp_temp(empno,ename,job,mgr, hiredate,sal, comm, deptno)
values(8888,'성춘향','MANAGER',NULL,'2020/10/09',3000,'',10);


--최종반영 "COMMIT" 필수 //커밋 완료.
COMMIT;







SELECT * FROM emp_temp;


-- 날짜 형식의 지정에 불필요한 데이터가 포함되어 있습니다
INSERT INTO emp_temp(empno,ename,job,mgr, hiredate,sal, comm, deptno)
values(7777,'유승호','MANAGER',NULL,'07/01/2010',4000,'',20);

--TO_DATE('07/01/2010','DD/MM/YYYY')  날짜데이터로 지정.
INSERT INTO emp_temp(empno,ename,job,mgr, hiredate,sal, comm, deptno)
values(7777,'유승호','MANAGER',NULL,TO_DATE('07/01/2010','DD/MM/YYYY'),4000,'',20);

INSERT INTO emp_temp(empno,ename,job,mgr, hiredate,sal, comm, deptno)
values (6666,'이순신','MANAGER',NULL,SYSDATE,4000,NULL,20);





-- EMP테이블에서 SALGRADE 테이블을 참조하여 급여 1등급인 사원만
-- EMP_TEMP테이블에 추가하고 싶다면?????
-- 서브쿼리로 작성하기 (데이터가 추가되는 테이블의 열개수와 서브쿼리의 열개수 일치!)

INSERT into emp_temp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
select empno,ename,job,mgr,hiredate,sal,comm,deptno /* <-- */
from emp e, salgrade s
where e.sal between s.losal and s.hisal and s.grade =1;


--오류 (데이터가 추가되는 테이블의 열개수와 서브쿼리의 열개수 일치!)
INSERT into emp_temp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
select * /* <-- */
from emp e, salgrade s
where e.sal between s.losal and s.hisal and s.grade =1;

COMMIT;



--다시 되돌리기 "ROLLBACK"

