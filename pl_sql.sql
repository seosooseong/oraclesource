--���� ����� ȭ�鿡 ���

--������ �� ����
set SERVEROUTPUT ON;




BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
END;
/




--����

DECLARE
    -- ���� ���� : 1. ������ Ÿ��;
    --             2. ������ Ÿ�� :=��;
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME :='SCOTT';
    DBMS_OUTPUT.put_line('V_EMPNO :' || V_EMPNO);
    DBMS_OUTPUT.put_line('V_ENAME :' || V_ENAME);
END;
/

--��� (CONSTANT)
DECLARE
    v_tax CONSTANT NUMBER(1) :=3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_tax �� ' || v_tax);
END;
/


--������ �⺻�� ���� / DEFAULT
DECLARE
    v_deptno NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_line('v_deptno : ' || v_deptno);
end;
/



--������ null�� ���� ����
DECLARE
    v_deptno NUMBER(2) not null := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_deptno : ' || v_deptno);
end;
/

--���� �⺻���� null / not null DEFAULT 
DECLARE
    v_deptno NUMBER(2) not null DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_deptno : ' || v_deptno);
end;
/





-- �ڷ���
-- ��Į���� : ����Ŭ �����ͺ��̽����� ����ϴ� �ڷ��� + Boolean
-- ������ : �ٸ� ���̺��� �÷� �ڷ����̳� �ϳ��� �� ������ ����



-- Ư�� ���̺��� �÷� �ڷ��� ����
DECLARE
    -- dept ���̺��� deptno�� ���� �ڷ��� ���
    V_DEPTNO DEPTNO.DEPTNO%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_deptno : ' || v_deptno);
end;
/



-- dept ���̺��� ������ ���� �ڷ��� ���
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC  INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('deptno : ' || V_DEPT_row.DEPTNO); 
    DBMS_OUTPUT.PUT_LINE('dname : ' || V_DEPT_row.DNAME);
    DBMS_OUTPUT.PUT_LINE('loc : ' || V_DEPT_row.LOC);
END;
/





--���ǹ�

-- IF
DECLARE
    V_NUMBER NUMBER :=13; --Ȧ��
BEGIN
    IF MOD(V_NUMBER,2)=1 THEN  --MOD �� ��Ŭ������ %�� ���� ���������� �����´�.
        dbms_output.put_line('V_NUMER Ȧ�� ');
    END IF;
end;
/





-- IF ~ELSE
DECLARE
    V_NUMBER NUMBER :=14; --¦��
BEGIN
    IF MOD(V_NUMBER,2)=1 THEN  --MOD �� ��Ŭ������ %�� ���� ���������� �����´�.
        dbms_output.put_line('V_NUMER Ȧ�� ');
    ELSE
        dbms_output.put_line('V_NUMER ¦�� ');   
    END IF;
end;
/


-- IF ~ELSIF ~ELSE ���� ����

DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    IF V_SCORE >= 90 THEN
        dbms_output.put_line('A');
    ELSIF V_SCORE >= 80 THEN
        dbms_output.put_line('B');
    ELSIF V_SCORE >= 70 THEN
        dbms_output.put_line('C');
    ELSIF V_SCORE >= 60 THEN
        dbms_output.put_line('D');
    ELSE
        dbms_output.put_line('F');
    END IF;
end;
/
-- CASE ����
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE TRUNC(V_SCORE/10)
        WHEN 10 THEN
            dbms_output.put_line('A');
        WHEN 9 THEN
            dbms_output.put_line('B');
        WHEN 8 THEN
            dbms_output.put_line('C');
        WHEN 7 THEN
            dbms_output.put_line('D');
        ELSE
            dbms_output.put_line('F');
    END CASE;
end;
/



--�ݺ��� FOR


--LOOP �⺻ �ݺ���
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM +1;
        EXIT WHEN V_NUM >4; --�ݺ��� �������
    END LOOP;
end;
/


DECLARE
    V_NUM NUMBER :=0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM +1;
        IF V_NUM > 4 THEN
            EXIT;
        END IF ; --�ݺ��� �������
    END LOOP;
end;
/



--WHIILE
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM +1;
        
    END LOOP;
end;
/



--FOR
DECLARE
    V_NUM NUMBER :=0;
BEGIN
   FOR i in 0..4 LOOP --i�� 4�� ������.
        DBMS_OUTPUT.PUT_LINE('���� i : ' || i); --i
                
    END LOOP;
end;
/



--FOR reverse
DECLARE
    V_NUM NUMBER :=0;
BEGIN
   FOR i in REVERSE 0..4 LOOP --i�� 4�� ������.
        DBMS_OUTPUT.PUT_LINE('���� i : ' || i); --i
                
    END LOOP;
end;
/




--continue
DECLARE
    V_NUM NUMBER :=0;
BEGIN
   FOR i in 0..4 LOOP 
        CONTINUE when mod (i, 2) = 1; --continue ���������� 1�̸� �ǳ� �� (Ȧ��_)
        DBMS_OUTPUT.PUT_LINE('���� i : ' || i); 
                
    END LOOP;
end;
/





--[�ǽ�] 1~10���� ���
   
BEGIN
   FOR i in 1..10 LOOP 
        DBMS_OUTPUT.PUT_LINE(i);           
    END LOOP;
end;
/


--Ȧ���� ���
BEGIN
   FOR i in 1..10 LOOP 
        continue when mod (i,2) =1;
        DBMS_OUTPUT.PUT_LINE('Ȧ���� ��� : '|| i);           
    END LOOP;
end;

--������ 
BEGIN
   FOR i in 1..10 LOOP 
        if i mod 2=1 then
        DBMS_OUTPUT.PUT_LINE('Ȧ���� ��� : '|| i);           
        end if;
    END LOOP;
end;
/

--[�ǽ�2] p16
--DEPT ���̺��� DEPTNO �� �ڷ����� ���� ���� V_DEPTNO �� �����մϴ�. 
--�׸��� V_DEPTNO ���� ���� 10,20,30,40�� �������� �� ������ ���� 
--�μ� �̸��� ����ϴ� ���α׷��� �ۼ��ϱ�, 
--��, �μ� ��ȣ�� 10,20,30,40�� �ƴϸ� N/A �� ����ϱ�

-- 10 : accounting / 20 : reserch / 30: sales / 40 : operation

DECLARE
    v_deptno dept.Deptno%type := 30; --DEPT ���̺��� DEPTNO �� ���� ���� V_DEPTNO �� ����
BEGIN
    if v_deptnO = 10 then            --V_DEPTNO ���� ���� 10,20,30,40�� ����
        DBMS_OUTPUT.PUT_LINE ('DNAME : ACCOUNTING');
    ELSif v_deptNO = 20 then
        DBMS_OUTPUT.PUT_LINE ('DNAME : reserch');
    ELSif v_deptNO = 30 then
        DBMS_OUTPUT.PUT_LINE ('DNAME : sales');
    ELSif v_deptNO = 40 then
        DBMS_OUTPUT.PUT_LINE ('DNAME : operation');
    ELSE
        DBMS_OUTPUT.PUT_LINE ('DNAME : N/A');
    END IF; --����
end;
/











--���ڵ� : �ڷ����� ���� �ٸ� �����͸� �ϳ��� ������ ����

DECLARE
    type rec_dept is record( -- ���ڵ� �̸�
        deptno NUMBER (2) not null :=99, -- ���� ����
        dname dept.dname%type,-- DEPT dname�� ���
        loc dept.loc%TYPE     --    "
        );
        dept_rec REC_DEPT; -- dept_rec������ ���� ����

begin
    dept_rec.deptno :=99; --dept_rec. ���� ����
    dept_rec.dname := 'database';
    dept_rec.loc := 'seoul';
    dbms_output.put_line ('DEPTNO : ' || DEPT_REC.DEPTNO); --���
    dbms_output.put_line ('DNAME : ' || DEPT_REC.DNAME);
    dbms_output.put_line ('LOC : ' || DEPT_REC.LOC);
end;
/









--���̺� ���� (����) / dept���̺� ����)


CREATE TABLE dept_record
as select * from dept;

SELECT * FROM dept_record;



--���ڵ带 ����� insert

DECLARE
    type rec_dept is record( -- ���ڵ� �̸�
        deptno NUMBER (2) not null :=99, -- ���� ����
        dname dept.dname%type,-- DEPT dname�� ���
        loc dept.loc%TYPE     --    "
        );
        dept_rec REC_DEPT; -- dept_rec������ ���� ����

begin
    dept_rec.deptno :=99; --dept_rec. ���� ����
    dept_rec.dname := 'database';
    dept_rec.loc := 'seoul';
    
    insert into dept_record
    values dept_rec;
end;
/



--���ڵ带 ����� ������Ʈ (����)

DECLARE
    type rec_dept is record( -- ���ڵ� �̸�
        deptno NUMBER (2) not null :=99, -- ���� ����
        dname dept.dname%type,-- DEPT dname�� ���
        loc dept.loc%TYPE     --    "
        );
        dept_rec REC_DEPT; -- dept_rec������ ���� ����

begin
    dept_rec.deptno :=50; --dept_rec. ���� ����
    dept_rec.dname := 'jsp';
    dept_rec.loc := 'busan';
    
    UPDATE dept_record
    set row = dept_rec
    where deptno = 99;
end;
/


--���ڵ带 ������ ���ڵ�


DECLARE
    type rec_dept is record( 
        deptno NUMBER (2) not null :=99,
        dname dept.dname%type,
        loc dept.loc%TYPE    
        );
        dept_rec REC_DEPT; 
        TYPE rec_emp is RECORD(
        empno emp.empno%type,
        ename emp.empname%type,
        dinfo emp_dept);
    
    emp_rec REC_EMP;
begin
    select e.empno, e.ename, d.deptno, d.dname, d.loc
    into emp_rec.empno, emp_rec.ename, emp_rec.dinfo.deptno, emp_rec.dinfo.dname, emp_rec.dinfo.loc
    from EMP e, DEPT d
    where e.deptno = d.deptno and e.empno = 7788;
    DBMS_OUTPUT.put_line('EMPNO : ' || EMP_REC.EMPNO);
    DBMS_OUTPUT.put_line('ENAME : ' || EMP_REC.ENAME);
            
            DBMS_OUTPUT.put_line('DEPTNO : ' || EMP_REC.DINFO.DEPTNO);
            DBMS_OUTPUT.put_line('DNAME : ' || EMP_REC.DINFO.DNAME);
            DBMS_OUTPUT.put_line('LOC : ' || EMP_REC.DINFO.LOC);
end;
/





-- �÷��� : �ڷ����� ���� ���� ������ ���� (�迭, List ...)
-- "�����迭", ��ø���̺�, Varry

-- �����迭 : key, value

declare
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER; --�迭�� ITAB_EX / INDEXŸ���� PLS_INTEGER
    text_arr ITAB_EX;
    
BEGIN
    text_arr(1) := '1st data'; --1,2,3,4 PLS_INTEGER
    text_arr(2) := '2st data';
    text_arr(3) := '3st data';
    text_arr(4) := '4st data';
    
    DBMS_OUTPUT.PUT_LINE('text_arr(1) : ' || text_arr(1));
    DBMS_OUTPUT.PUT_LINE('text_arr(2) : ' || text_arr(2));
    DBMS_OUTPUT.PUT_LINE('text_arr(3) : ' || text_arr(3));
    DBMS_OUTPUT.PUT_LINE('text_arr(4) : ' || text_arr(4));
end;
/







-- ���ڵ带 Ȱ���� �����迭

declare --���ڵ� ����
    type REC_DEPT is record( 
        deptno DEPT.DEPTNO%TYPE,
        dname dept.dname%type
    );
    --�����迭 ����
    -- int arr[] = {}, Acount arr[]
    TYPE ITAB_DEPT IS TABLE OF REC_DEPT INDEX BY PLS_INTEGER;
    
    dept_arr IRAB_DEPT;
    idx PLS_INTEGER := 0;
BEGIN
    FOR i IN (SELECT DEPTNO, DNAME FROM DEPT) LOOP
    idx := idx + 1;
    dept_arr(idx).deptno := i.Deptno;
    dept_arr(idx).dname := i.Dname;
    
    DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno || ':' || dept_arr(idx).dname);
    
    end loop;
end;
/



-- �÷��� �޼���
declare
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER; --�迭�� ITAB_EX / INDEXŸ���� PLS_INTEGER
    text_arr ITAB_EX;
    
BEGIN
    text_arr(1) := '1st data'; --1,2,3,4 PLS_INTEGER
    text_arr(2) := '2st data';
    text_arr(3) := '3st data';
    text_arr(50) := '50st data';
    
    DBMS_OUTPUT.PUT_LINE('text_arr.count : ' || text_arr.count); --����
    DBMS_OUTPUT.PUT_LINE('text_arr.first : ' || text_arr.first); --ó��
    DBMS_OUTPUT.PUT_LINE('text_arr.last : ' || text_arr.last);  --������
    DBMS_OUTPUT.PUT_LINE('text_arr.prior(50) : ' || text_arr.prior(50)); --prior 50�� �տ�
    DBMS_OUTPUT.PUT_LINE('text_arr.next(50) : ' || text_arr.next(50)); --next 50�� ����
end;
/



-- [�ǽ�] p22
--������ ���� ����� �������� PL/SQL ���� �ۼ��ϱ�
--EMP ���̺�� ���� �� ������ ������ �� ���̺� EMP_RECORD�� �����ϴ� SQL�� �ۼ�
--EMP_RECORD ���̺� ���ڵ带 ����Ͽ� ���ο� ��� ������ ������ ���� �����ϴ� PL/SQL �� �ۼ�
DROP table EMP_RECORD;

SELECT * FROM EMP_RECORD;

CREATE TABLE EMP_RECORD
as select * from emp
where 1<>1;



DECLARE
    type emp_record is record(
    empno emp.empno%type,
    ename emp.ename%type,
    job emp.job%type,
    mgr emp.mgr%type,
    hiredate hiredate%type,
    sal emp.sal%type,
    comm emp.comm%type,
    deptno emp.deptno%type
    );
emp_rec emp_record;
    
begin
    emp_rec.empno := 6699;
    emp_rec.ename := 'JOHN';
    emp_rec.JOB := 'SALESMAN';
    emp_rec.MGR := 7902;
    emp_rec.HIREDATE := '07/11/05';
    emp_rec.SAL := 1500;
    emp_rec.COMM := NULL;
    emp_rec.deptno := 10;
    insert into emp_record values emp_rec;
                    
end;
/

--[�ǽ�2]�����迭

declare
    type ITAB_EMP IS TABLE OF EMP%ROWTYPE INDEX BY PLS_INTEGER;
    
    emp_arr ITAB_EMP;
    idx pls_integer :=0;
begin
    for i in (select * from emp) loop
    idx := idx+1;
    emp_arr(idx).empno := i.empno;
    emp_arr(idx).ename := i.ename;
    emp_arr(idx).job := i.job;
    emp_arr(idx).mgr := i.mgr;
    emp_arr(idx).hiredate := i.hiredate;
    emp_arr(idx).sal := i.sal;
    emp_arr(idx).comm := i.comm;
    emp_arr(idx).deptno := i.deptno;
    
    DBMS_OUTPUT.PUT_LINE (emp_arr(idx).empno || ' : ' || emp_arr(idx).ename
    || ' : ' ||emp_arr(idx).job || ' : ' ||emp_arr(idx).mgr|| ' : ' ||emp_arr(idx).hiredate
    || ' : ' ||emp_arr(idx).sal || ' : ' ||emp_arr(idx).comm || ' : ' ||emp_arr(idx).deptno);
    
    end loop;
end;







-- Ŀ�� :sql�� ����� ��� ������ �޸� ����(Private sql area)�� ������


--������ �����͸� �����ϴ� Ŀ��
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE; 
    --����� Ŀ�� ����
    cursor c1 is --Ŀ���̸� ���������� ���� 
        select deptno, dname, loc
        from dept
        where deptno = 40;
        
BEGIN
    --Ŀ�� ����
    open c1;
    
    --Ŀ���� ���� �о�� ������ ���(fetch)
    FETCH c1 into v_dept_row;
    
    DBMS_OUTPUT.PUT_line('deptno : ' || v_dept_row.deptno );
    DBMS_OUTPUT.PUT_line('dname : ' || v_dept_row.dname );
    DBMS_OUTPUT.PUT_line('loc : ' || v_dept_row.loc );
   
   --Ŀ�� �ݱ�
   close c1;
END;
/




--Ŀ�� �Ⱦ���
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE; 
     
BEGIN
   select deptno, dname, loc into v_dept_row
        from dept
        where deptno = 40;
    
    DBMS_OUTPUT.PUT_LINE('deptno : ' || V_DEPT_ROW.DEPTNO );
    DBMS_OUTPUT.PUT_LINE('dname : ' || V_DEPT_ROW.DNAME );
    DBMS_OUTPUT.PUT_LINE('loc : ' || V_DEPT_ROW.LOC );

END;
/






--�������� ��ȸ�Ǵ� ��� Ŀ��

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE; 
    --����� Ŀ�� ����
    cursor c1 is --Ŀ���̸� ���������� ���� 
        select deptno, dname, loc
        from dept;
        
BEGIN
    --Ŀ�� ����
    open c1;
    
    
    LOOP
    
        --Ŀ���� ���� �о�� ������ ���(fetch)
        FETCH c1 into v_dept_row;
        
        --Ŀ���� ������� �о���� -����
        EXIT WHEN c1%notfound;
        
        DBMS_OUTPUT.PUT_line('deptno : ' || v_dept_row.deptno );
        DBMS_OUTPUT.PUT_line('dname : ' || v_dept_row.dname );
        DBMS_OUTPUT.PUT_line('loc : ' || v_dept_row.loc );
   
   end loop;
   
   --Ŀ�� �ݱ�
   close c1;
END;
/



--------------------------------------------------
--Ŀ�� for

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE; 
    --����� Ŀ�� ����
    cursor c1 is --Ŀ���̸� ���������� ���� 
        select deptno, dname, loc
        from dept;
        
BEGIN
    --Ŀ�� for loop (�ڵ� open, fetch, cloes)
    for c1_rec in c1 loop
        
        DBMS_OUTPUT.PUT_line('deptno : ' || c1_rec.deptno );
        DBMS_OUTPUT.PUT_line('dname : ' || c1_rec.dname );
        DBMS_OUTPUT.PUT_line('loc : ' || c1_rec.loc );
   
   end loop;

END;
/





--Ŀ���� �Ķ���� ���
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE; 
    --����� Ŀ�� ����
    cursor c1(p_deptno DEPT.DEPTNO%TYPE) is 
        select deptno, dname, loc
        from DEPT
        WHERE DEPTNO = P_DEPTNO;
BEGIN
    --Ŀ�� ����
    open c1(10);
        LOOP
            --Ŀ���� ���� �о�� ������ ���(fetch)
            FETCH c1 into v_dept_row;
            --Ŀ���� ������� �о���� -����
            EXIT WHEN c1%notfound;
            
            DBMS_OUTPUT.PUT_line('10���μ� deptno : ' || v_dept_row.deptno || 'dname : ' || v_dept_row.dname 
            || 'loc : ' || v_dept_row.loc );
   
     end loop;
       
    open c1(20);
         LOOP
            --Ŀ���� ���� �о�� ������ ���(fetch)
            FETCH c1 into v_dept_row;
            --Ŀ���� ������� �о���� -����
            EXIT WHEN c1%notfound;
            
            DBMS_OUTPUT.PUT_line('20���μ� deptno : ' || v_dept_row.deptno || 'dname : ' || v_dept_row.dname 
            || 'loc : ' || v_dept_row.loc );
   
        end loop;
   
   --Ŀ�� �ݱ�
   close c1;
   
END;
/







--
DECLARE
    --����ڰ� �Է��� �μ���ȣ�� �����ϴ� ����
    V_DEPTNO DEPT.DEPTNO%TYPE; 
    
    --����� Ŀ�� ����
    cursor c1(p_deptno DEPT.DEPTNO%TYPE) is --Ŀ���̸� ���������� ���� 
        select deptno, dname, loc
        from dept WHERE deptno = p_deptno;
        
BEGIN
    V_DEPTNO :=&INPUT_DEPTNO;
    --Ŀ�� for loop (�ڵ� open, fetch, cloes)
    for c1_rec in c1(V_DEPTNO) loop
        
        DBMS_OUTPUT.PUT_line('deptno : ' || c1_rec.deptno || ' '
        || 'dname : ' || c1_rec.dname || ' ' || 'loc : ' || c1_rec.loc );
   
   end loop;

END;
/








--������ Ŀ��
BEGIN
    UPDATE dept_temp SET DNAME = 'DATABASE'
    WHERE DEPTNO=50;
    
    DBMS_OUTPUT.PUT_LINE ('���ŵ� ���� �� :' || SQL%ROWCOUNT);
    
        IF(SQL%FOUND) THEN
            DBMS_OUTPUT.PUT_LINE ('����  ��� �� ���� ���� : TRUE');
        ELSE
             DBMS_OUTPUT.PUT_LINE ('����  ��� �� ���� ���� : FALSE');
        END IF;
        
        IF(SQL%ISOPEN) THEN
            DBMS_OUTPUT.PUT_LINE ('Ŀ���� OPEN ���� : TRUE');
        ELSE
             DBMS_OUTPUT.PUT_LINE ('Ŀ���� OPEN ���� : FALSE');
        END IF;
END;
/

SELECT * FROM dept;

-- ����(����)
-- ������ / ��Ÿ�� ����

DECLARE
    v_wrong number;
begin
    select dname into v_wrong
    from dept
    where deptno =10;
    
exception 
    when value_error then
        dbms_output.put_line ('����ó�� - ��ġ �Ǵ� �� ���� �߻�');
end;
/





--�������� : Internal exception(���ο���) , user-difined exception(��������ǿ���)

DECLARE
    v_wrong number;
begin
    select dname into v_wrong
    from dept
    where deptno =10;
    
exception
    WHEN too_many_rows then
         dbms_output.put_line ('����ó�� - �䱸���� ���� �� ���� ���� �߻�');
    when value_error then
        dbms_output.put_line ('����ó�� - ��ġ �Ǵ� �� ���� �߻�');
    when others then
        dbms_output.put_line ('����ó�� - ���� ���� �� ���� �߻�');

end;
/


DECLARE
    v_wrong number;
begin
    select dname into v_wrong
    from dept
    where deptno =10;
    
exception
    when others then
        DBMS_OUTPUT.PUT_LINE ('����ó�� - ���� ���� �� ���� �߻�');
        dbms_output.put_line ('sqlcode : ' || TO_CHAR(sqlcode); --sqlcode (���� ��ȣ)
        dbms_output.put_line ('sqlerrm : ' || sqlerrm); --sqlerrm (���� �޼���)

end;
/


-- [�ǽ�] Ŀ�� p30
-- ����� Ŀ���� ����Ͽ� EMP ���̺��� ��ü �����͸� ��ȸ�� �� Ŀ�� ���� �����Ͱ� ������ ���� ���

-- 1.LOOP�� ����� ���

DECLARE
    --Ŀ�� �����Ͱ� �Էµ� ���� ����
    V_emp_ROW EMP%ROWTYPE; 
    --����� Ŀ�� ����
    cursor c1 is --Ŀ���̸� ���������� ���� 
        select * from EMP;
        
BEGIN
    --Ŀ�� ����
    open c1;
    
    LOOP
        --Ŀ���� ���� �о�� ������ ���(fetch)
        FETCH c1 into v_EMP_row;
        
        --Ŀ���� ������� �о���� -����
        EXIT WHEN c1%notfound;
        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_EMP_ROW.EMPNO || 'DNAME : ' || V_EMP_ROW.ENAME ||'loc : ' || V_EMP_ROW.job 
        ||'MGR : ' || V_EMP_ROW.MGR  ||'HIREDATE : ' || V_EMP_ROW.HIREDATE || 'SAL : ' || V_EMP_ROW.SAL ||'COMM : ' || V_EMP_ROW.COMM ||'DEPTNO : ' || V_EMP_ROW.DEPTNO );

   end loop;
   
   --Ŀ�� �ݱ�
   close c1;
END;
/



-- 2. FOR LOOP�� ����� ���

DECLARE
--Ŀ�� �����Ͱ� �Էµ� ���� ����
    V_emp_ROW EMP%ROWTYPE; 
    --����� Ŀ�� ����
    cursor c1 is --Ŀ���̸� ���������� ���� 
        select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
        from EMP;
        
BEGIN
    --Ŀ�� for loop (�ڵ� open, fetch, cloes)
    for c1_rec in c1 loop
       
        DBMS_OUTPUT.PUT_line('deptno : ' || c1_rec.EMPNO );
        DBMS_OUTPUT.PUT_line('dname : ' || c1_rec.ENAME );
        DBMS_OUTPUT.PUT_line('loc : ' || c1_rec.JOB );
        DBMS_OUTPUT.PUT_line('MGR : ' || c1_rec.MGR );
        DBMS_OUTPUT.PUT_line('HIREDATE : ' || c1_rec.HIREDATE );
        DBMS_OUTPUT.PUT_line('SAL : ' || c1_rec.SAL );
        DBMS_OUTPUT.PUT_line('COMM : ' || c1_rec.COMM );
        DBMS_OUTPUT.PUT_line('DEPTNO : ' || c1_rec.DEPTNO );
   end loop;

END;
/



-- �͸��� : �̸�X, ����X, ����� ������, ����X, �ٸ� �������α׷����� ȣ��X

-- ���� ���� ���α׷� : �̸�����, ���� ����, ����� �ѹ� ������, ��������, ȣ�� ����.


--���ν��� ����
CREATE OR REPLACE PROCEDURE pro_noparam
is
    v_empno number(4) := 7788;
    v_ename varchar(10);

begin
    v_ename :='SCOTT';
    DBMS_OUTPUT.PUT_LINE('v_empno : ' ||v_empno);
    DBMS_OUTPUT.PUT_LINE('v_ename : ' ||v_ename);
    
end;
/


--sql+������ �����غ���

execute pro_noparam;



-- pl/sql ��Ͽ��� ���ν��� ����

begin
    pro_noparam;
end;
/



--���ν��� ����

DROP PROCEDURE PRO_NOPARAM;



--------------------------------------------------------------------------------------------------------

-- ���ν��� �Ķ���� IN / OUT / IN OUT

-- IN �Ķ���� (�⺻)
CREATE OR REPLACE PROCEDURE pro_param_in
    (
    param1 in number,
    param2 number,
    param3 number :=3,
    oaram4 number default 2
    )
is
begin
    DBMS_OUTPUT.PUT_LINE('param1 : ' ||param1);
    DBMS_OUTPUT.PUT_LINE('param2 : ' ||param2);
    DBMS_OUTPUT.PUT_LINE('param3 : ' ||param3);
    DBMS_OUTPUT.PUT_LINE('param4 : ' ||param4);
end;
/


execute pro_param_in;




--out��� �Ķ���� : ���ν��� ���� �� ȣ���� ���α׷����� �� ��ȯ

create or replace procedure pro_param_out
(
    in_empno in emp.empno%type,
    out_ename out emp.ename%type,
    out_sal out emp.sal%type
)

is
begin
    SELECT ename, SAL INTO out_ename, out_sal
    FROM emp
    where empno = in_empno;
end;
/

execute pro_param_out;

--�ٸ� pl/sql ��Ͽ��� ���ν��� ���
DECLARE
    V_ENAME EMP.ENAME%TYPE;
    V_SAL EMP.SAL%TYPE;
BEGIN
    PRO_PARAM_OUT (7788,V_ENAME,V_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('Sal : ' || V_SAL);
END;
/



--in out : in, out ����� ���ÿ� ����
create or replace procedure pro_param_inout
(
    inout_no in out number
)
is
begin
    inout_no := inout_no * 2;
end;
/


declare
    no number;
begin
    no :=6;
    pro_param_inout(no);
    dbms_output.put_line ('no : ' || no);
end;
/


--javadb���� ����
create or replace PROCEDURE register_user
(
    name nvarchar2,
    year number,
    addr nchar,
    mobile nvarchar2
)
is
begin
    insert into userTBL(no, username, birthyear,addr,mobile)
    values(usertbl_seq.nextval, name, year,addr, mobile);
    commit;
    dbms_output.put_line (name || year|| addr || mobile);
end;
/

execute register_user ('������','1996','�λ�','010-4569-4568');

SELECT * FROM userTBL;









--[�ǽ�] ���ν��� ����
--1. DEPT ���̺� �μ���ȣ(DEPTNO)�� �Է� ������ ���� �� 
--�μ� ��ȣ(DEPTNO), �μ��̸�(DNAME), ����(LOC)�� ����ϴ� ���ν��� pro_dept_in �ۼ�

CREATE OR REPLACE PROCEDURE pro_dept_in
(
    inout_deptno in out dept.deptno%type,
    out_dname out dept.dname%type,
    out_loc out dept.loc%type
)
is
begin
    select deptno, dname, loc into inout_deptno,out_dname,out_loc
    from dept
    where deptno = inout_deptno;

end;
/

execute pro_dept_in;


--2.pro_dept_in ���ν����� ���� ��µ� �μ� ��ȣ(DEPTNO), �μ��̸�(DNAME), ����(LOC)�� 
--������ ���� ����ϴ� PL/SQL ���α׷� �ۼ�
declare
    v_deptno dept.deptno%type;
    v_dname dept.dname%type;
    v_loc dept.loc%type;
begin
    v_deptno :=10;
    pro_dept_in(v_deptno, v_dname, v_loc);
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ : '|| v_deptno);
    DBMS_OUTPUT.PUT_LINE('�μ��� : '|| v_dname);
    DBMS_OUTPUT.PUT_LINE('���� : '|| v_loc);
end;
/



/*
--Ʈ���� : �����ͺ��̽� ���� Ư�� ��Ȳ�̳� ����, �� �̺�Ʈ �߻��� �� �ڵ����� �����Ű�� ���.

--before Ʈ����
--Ʈ���Ÿ� ������ ���̺� ����.

create table emp_trg as select * from emp;


--emp_trg�� dml���� (�ָ��̶�� ������� ���� �Ұ�.) ���� Ʈ���� �߻�
--raise_application_error: ����� ���� ����

CREATE OR REPLACE TRIGGER trg_emp_nodml_weekend
BEFORE
-- Ʈ���� ����
INSERT OR UPDATE OR DELETE ON emp_trg
BEGIN
    IF to_char(sysdate, 'DY') IN ('��','��') THEN
        IF inserting THEN
            raise_application_error(-20000, '�ָ� ������� �߰� �Ұ�');
        ELSIF updating THEN
            raise_application_error(-20001, '�ָ� ������� �߰� �Ұ�');
        ELSIF deleting THEN
            raise_application_error(-20002, '�ָ� ������� �߰� �Ұ�');
        ELSE
            raise_application_error(-20003, '�ָ� ������� �߰� �Ұ�');
        END IF;
    END IF;
END;
/




select * from emp_trg;


update emp_trg
set sal = 3500
where empno = 7788;






-- AFTER

create table emp_TRG_log(
    tablename varchar2(10),
    dml_type varchar2(10),
    empno number(4),
    user_name varchar2(30),
    change_date date);
    
DROP TABLE trg_emp_log; 
DROP TABLE emp_TRG_log;
----- 
SELECT*FROM EMP_TRG;
SELECT*FROM trg_emp_log; 
------  
    
    
    
create or replace trigger trg_emp_log
after
insert or delete or update on emp_trg
for each row -- dml���忡 ���� ���� �޴� �ະ�� ����

begin
    if inserting then
        insert into emp_trg_log
        valueS('EMP_TRG' , 'INSERT', : NEW.EMPNO,
        SYS_CONTEXT('USERENV','SESSION_USER'), SYSDATE); --SYS_CONTEXT : ���� �����ͺ��̽� ������
    ELSif UPDATING then
        insert into emp_trg_log
        valueS('EMP_TRG' , 'UODATE', : OLD.EMPNO,
        SYS_CONTEXT('USERENV','SESSION_USER'), SYSDATE);
    ELSif DELETING then
        insert into emp_trg_log
        valueS('EMP_TRG' , 'DELETE', : OLD.EMPNO,
        SYS_CONTEXT('USERENV','SESSION_USER'), SYSDATE);
    END IF;

END;
/
    
-------------   
    
INSERT INTO EMP_TRG VALUES
            (9990, 'TESTtemp', 'CLERK',7788, TO_DATE('2018-03-03','YYY-MM-DD'),1200,NULL,20);
    
    
    
    
---
UPDATE EMP_TRG
SET SAL= 1300
WHERE MGR = 7788;
    


--Ʈ���� ��ȸ
SELECT*FROM USER_TRIGGERS;


--Ʈ���� ����
DROP TRIGGER trg_emp_log;
    
    
    
    
    
--Ʈ���� ����
ALTER TRIGGER trg_emp_log_WEEKEND DISABLE; --��Ȱ��ȭ

ALTER TRIGGER trg_emp_log_WEEKEND ENABLE; --Ȱ��ȭ
    
    
    
    
 */   


