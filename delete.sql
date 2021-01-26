create table EMP_TEMP2 as select*from EMP;

SELECT * FROM emp_temp2;


-- JOB이 MANNAGER인 데이터 삭제하기
delete from emp_temp2 where job ='MANAGER';

ROLLBACK;


delete emp_temp2; --전부 날라간다.



--emp_temp2테이블의 사원중에서 급여가 5000이상인 사원 삭제

delete from emp_temp2
where sal >= 5000;

commit;


--급여 등급이 3등급 사이에 있는 30번 부서의 사원들만 삭제
delete from emp_temp2 where empno in (select e.empno 
                                        from emp_temp2 e, salgrade s
                                        where e.sal between s.losal and s.hisal
                                        and s.grade=3 and deptno = 30);


--ppt 연습문제.
create table EXAM_EMP




