-- scott ����(scott) ��ȣ(tiger) ������ �� ���� �����ϱ�

alter user scott identified by tiger account unlock;

-- hr ����(hr) ��ȣ(12345) ������ �� ���� �����ϱ�

alter user hr identified by 12345 account unlock;




--���ο� ����� ���� (���ο� ��Ű�� ����) TEST / 12345
CREATE USER TEST IDENTIFIED BY 12345;


--1. ���� "���Ѻο�!" (�������� �ο�)
grant create session to test;

--2.���� �۾��� ������ ������ �ִ� �� �ο�
GRANT CONNECT, RESOURCE TO TEST;



-------------------------------------------------------------------------------

--TEST2 ����� ���� (�ƹ������� ���� ����� ����) 
CREATE USER TEST2 IDENTIFIED BY 12345;

--���Ѻο�
GRANT CREATE SESSION TO TEST2;
GRANT CONNECT, RESOURCE TO TEST2;

GRANT CREATE table TO TEST2;


--���� ���
REVOKE CREATE table from TEST2;


--��й�ȣ ����
ALTER USER TEST2 IDENTIFIED BY 00000;

--����� ���� (����ڰ� ���� ��ü�� �ƹ��͵� ���� ��)
DROP USER TEST2;

--����ڿ� ��ü (���̺�, �ε���, �� ��..) ��� ����
DROP USER TEST2 cascade;





--201110
--�������� ����� ����� ����
CREATE USER JAVADB IDENTIFIED BY 12345;
GRANT CONNECT, RESOURCE TO JAVADB;




