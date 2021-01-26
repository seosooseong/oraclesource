select*from registerTBL;
delete TABLE registerTBL;                 
commit;

--1.
CREATE TABLE registerTBL(
                    userID char (8) PRIMARY KEY, --������
                    userName nvarchar2 (10) not null, 
                    birthYear number(4) not null,
                    addr nchar(2) not null, 
                    mobile1 char(3),
                    mobile2 char(8),
                    mDate date);
      
--2. registerTBL  userName, birthYear, addr - not null  ����
Alter Table registerTBL Alter Column userName nvarchar2 NOT NULL;

alter table registerTBL
Alter column userName nvarchar2 not null;

--3.
insert into registerTBL(userID, userName, birthYear,addr,mobile1,mobile2,mDate) 
            values('SJS','������',1977,'����',010,52638593,'2016-08-18');
insert into registerTBL(userID, userName, birthYear,addr,mobile1,mobile2,mDate) 
            values('PSK','�ڼ���',1983,'���',010,12341234,'2017-07-15');
insert into registerTBL(userID, userName, birthYear,addr,mobile1,mobile2,mDate) 
            values('LYJ','�̿���',1970,'����',010,45678963,'2016-09-15');
insert into registerTBL(userID, userName, birthYear,addr,mobile1,mobile2,mDate) 
            values('KKH','���ȣ',1971,'����',010,35689541,'2018-09-16');
insert into registerTBL(userID, userName, birthYear,addr,mobile1,mobile2,mDate) 
            values('KBS','�����',1979,'�λ�',010,78963214,'2018-09-17');         
            
COMMIT;



--4. KBS����
DELETE FROM registerTBL WHERE userID = 'KBS';

--5.registerTBL���� userID�� KKH �� USER�� ������ ����� �����ϰ�, 
--  ��ȭ��ȣ�� 89653652�� �����ϴ� SQL ���� �ۼ� �Ͻÿ�.
UPDATE registerTBL  
    set 
    addr = '����',
    mobile2= 89653652
    where userID = 'KKH';
    
--6.Ʈ������̶� �����ΰ�?
�����ͺ��̽��� ���¸� ��ȯ��Ű�� ���� �����ϴ� �۾��� �ѹ��� ����Ǿ�� �ϴ� �ϳ��� ����



--7.Ʈ������� ����ϰ� ���� �� ����ϴ� ��ɾ�
ROLLBACK;

--8.scott �������� ��� ������ ������ ������ ���� ���� ��ɾ�
SELECT * FROM dict where scott;
SELECT * FROM scott;
--9.�ε�����?
���̺� ����� �����͸� ������ ��ȸ�ϱ� ���� �����ͺ��̽� ��ü


--9

            