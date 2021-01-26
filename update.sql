CREATE TABLE DEPT_TEMP2 AS SELECT*FROM DEPT;

SELECT * FROM DEPT_TEMP2;



-- DEPT_TEMP2에 있는 LOC모두 수정

UPDATE dept_temp2 --테이블명령
SET LOC ='SEOUL'; -- 수정할 내용                             



SELECT * FROM DEPT_TEMP2;


ROLLBACK; --되돌리기.

--  DEPT_TEMP2에 있는 LOC, 특정하여 수정
UPDATE dept_temp2 --테이블명령
SET LOC ='SEOUL' -- 수정할 내용    
WHERE DEPTNO=10; -- 업데이트 조건 DEPTNO 10번만.



SELECT * FROM EMP_TEMP;
--EMP_TEMP 테이블의 사원들 중에서 급여가 3000이하인 사원만 추가수당을 50으로 수정
UPDATE EMP_TEMP
SET COMM = 50
WHERE SAL <= 3000;



--서브쿼리 이용한 데이터 수정
--40번 부서의 부서명과 지역수정

SELECT * FROM dept_temp2;

UPDATE dept_temp2
SET (DNAME,LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO  =30)
WHERE DEPTNO=40;

UPDATE dept_temp2
SET LOC ='SEOUL'
WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME = 'OPERATIONS');

COMMIT;



