CREATE TABLE DEPT_TLC AS SELECT * FROM DEPT;

SELECT * FROM dept_tlc;
INSERT INTO dept_tlc VALUES(50,'DATABASE','SEOUL');

commit;

select * from dept_tlc;

rollback;




--�ϳ��� Ʈ����� ����

insert into dept_tlc values(60,'NETWORK', 'BUSAN');

UPDATE DEPT_TLC SET loc = 'SEOUL' WHERE DEPTNO = 40;

DELETE FROM DEPT_TLC WHERE DNAME ='RESERCH';

SELECT*FROM DEPT_TLC;

RENAME DEPT_TLC TO DEPT_TCL;