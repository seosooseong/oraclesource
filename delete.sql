create table EMP_TEMP2 as select*from EMP;

SELECT * FROM emp_temp2;


-- JOB�� MANNAGER�� ������ �����ϱ�
delete from emp_temp2 where job ='MANAGER';

ROLLBACK;


delete emp_temp2; --���� ���󰣴�.



--emp_temp2���̺��� ����߿��� �޿��� 5000�̻��� ��� ����

delete from emp_temp2
where sal >= 5000;

commit;


--�޿� ����� 3��� ���̿� �ִ� 30�� �μ��� ����鸸 ����
delete from emp_temp2 where empno in (select e.empno 
                                        from emp_temp2 e, salgrade s
                                        where e.sal between s.losal and s.hisal
                                        and s.grade=3 and deptno = 30);


--ppt ��������.
create table EXAM_EMP




