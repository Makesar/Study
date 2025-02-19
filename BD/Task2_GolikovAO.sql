USE Restaraunt

--�������� ������� ���� (Cookings)

CREATE TABLE Cookings (
id int IDENTITY(1,1) PRIMARY KEY,
name_cooking varchar(128) NOT NULL,
price real NOT NULL,
discription text);

GO

--���������� ������� ���� 

INSERT INTO Cookings(name_cooking,price,discription)
 VALUES ('��� ��������', 60, '��� ��������'),
        ('����� ������', 70, '������ ������, ������� ������, ������, ���������� �����'),
		('������', 90, '������� �������, ������� �������, ���������, ����, ������ ������������'),
		('����� ��������', 95, '��������, �������� �������, ���, ����, ������ ������'),
		('����� ��� �����', 95, '������, �������, �����, ����, ���������'),
		('�������', 70, '����, ������� �������, ���������, ����, ������ ������'),
		('����', 90, '��������, ������, �������, �������, ���������'),
		('��� �������', 75, '������, ���������, �������, ���, �����'),
		('��������� ����', 40, '���������'),
		('��������� ���', 45, '���������'),
		('��������� ��-����������', 50, '���������'),
		('������� ��-����������', 150, '�������, ������� ������, ���, �������'),
		('������� ��-�������', 100, '������, ������'),
		('��������', 110, '�������'),
		('������� ��������', 90, '������'),
		('���', 50, '���'),
		('����', 75, '���, ��������, �������, ���'),
		('���� ���������', 65, '������'),
		('��� ������',30, '��� ������'),
		('��� �������', 30, '��� �������'),
		('����', 40, '����'),
		('��� ��������', 60, '��� ��������'),
		('����', 50, '��������, ������� ���������, ������ ���������, ������'),
        ('����-����', 70, '����-����');

GO


--�������� � ���������� ������� ������ (Discount)

CREATE TABLE Discount (
id int PRIMARY KEY,
value real NOT NULL);
GO

INSERT INTO Discount(id,value)
VALUES (3, 0.97),
       (5, 0.95),
	   (7, 0.93),
	   (10, 0.9),
	   (15, 0.85),
       (0,1);

--�������� ������� ������� (Orders)
CREATE TABLE Orders (
id int IDENTITY(1,1) PRIMARY KEY,
cooking_id int,
amount int,
cost real,
check_id int,
createdDate datetime  NOT NULL);
GO

--�������� � ���������� ������� ��������� (Components)
CREATE TABLE Components(
name varchar(128) PRIMARY KEY,
amount int NOT NULL,
primecost real NOT NULL,
provider_id int);
GO

INSERT INTO Components(name,amount,primecost,provider_id)
 VALUES ('���������', 10, 11, 2),
        ('������', 6, 9, 2),
		('������ ������', 9, 13, 2),
		('������� ������', 12, 13, 2),
		('���������� �����', 6, 10, 2),
		('�������', 8, 11, 2),
		('�������', 7, 8, 2),
		('������', 10, 7, 2),
		('������', 10, 80, 1),
		('�������', 5, 185, 1),
		('��������', 5, 190, 1),
		('������', 8, 100, 1),
		('������� �������', 3, 70, 3),
		('��������', 3, 75, 3),
		('������� �������', 5, 85, 3),
		('���', 5, 54, 3),
		('��������', 3, 230, 1),
		('�������� �������', 4, 65, 3),
		('����', 30, 9, 1),
		('������ ������������', 3, 35, 3),
		('����', 3, 20, 4),
		('���', 6, 10, 2),
		('�����', 6, 15, 3),
		('���', 4, 85, 3),
		('�������', 4, 20, 3),
		('������', 3, 40, 3),
		('��� ������', 15, 15, 4),
		('��� �������', 15, 17, 4),
		('����', 10, 20, 4),
		('��� ��������', 7, 15, 4),
		('��� ��������', 7, 15, 4),
		('����-����', 10, 25, 4),
		('��������', 3, 25, 2),
		('������� ���������', 3, 20, 2),
		('������ ���������', 3, 20, 2),
		('������', 3, 27, 2);

GO

--�������� � ���������� ������� ����������� (Providers)

CREATE TABLE Providers(
provider_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
provider_name varchar(128) NOT NULL);



INSERT INTO Providers (provider_name)
VALUES ('"����������� ����"'),
       ('�� ������ �.�.'),
	   ('"������"'),
	   ('�� ������� �.�.'),
       ('�� �������� �.�');
GO

--�������� �������� ��� (CashiersCheck)
CREATE TABLE CashiersCheck (
id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
client_id int NOT NULL,
staff_id int NOT NULL,
summ real);

--�������� � ���������� ������� �������� (Clients)
CREATE TABLE Clients (
id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
fname varchar(128) NOT NULL,
mname varchar(128),
lname varchar(128) NOT NULL,
discount_id int);

INSERT INTO Clients (lname,fname,mname,discount_id)
VALUES ('������','�������','��������',5),
       ('��������','�������','���������',0),
	   ('������','��������','��������',15),
	   ('�������','�����','����������',7),
	   ('�������','�����','����������',3),
	   ('����������','�������','���������',0),
	   ('����������','������','�������������',10),
	   ('John','Simple',NULL,5);

GO

--�������� � ���������� ������� ��������� (Staff)
CREATE TABLE Staff (
id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
fname varchar(128) NOT NULL,
mname varchar(128),
lname varchar(128) NOT NULL,
salary real);


INSERT INTO Staff (lname,fname,mname,salary)
VALUES ('��������','�������','�������������',13700),
       ('�������','������','����������',15000),
	   ('�����','�������','����������',17300),
	   ('���������','��������','����������',12000),
	   ('Black','Margo',NULL, 13500);

GO

--�������� ������� �������� (Delivery)
CREATE TABLE Delivery (
id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
provider_id int,
component varchar(128),
date datetime);


--�������� ������� ���� �������� ������/������� (Transactions)
CREATE TABLE Transactions (
id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
timedata datetime,
value real,
description text);

--�������� � ���������� ������� ������� ��������� (Budget)
CREATE TABLE Budget (
budget real,
last_date_salary date);

INSERT INTO Budget (budget,last_date_salary)
VALUES (100000, GETDATE());

--���������� ������� Orders
INSERT INTO Orders (cooking_id, amount, createdDate, check_id)
VALUES (5,2,GETDATE(), 1),
       (3,1,GETDATE(), 1),
	   (24,1,GETDATE(), 1),
	   (7,3,GETDATE(), 2),
	   (8,2,GETDATE(), 2),
	   (18,1,GETDATE(), 3);

--������� ��������� ��� ��� ����������� �������
UPDATE Orders
SET cost = amount * Cookings.price FROM Cookings
JOIN Orders ON Cookings.id = Orders.cooking_id

--���������� ������� ��������� ���� (CashiersCheck)
INSERT INTO CashiersCheck (client_id,staff_id)
VALUES (2,2),
       (1,3),
	   (3,4),
	   (2,1);
--���������� ����� ���� �� ��� ����������� �����
UPDATE CashiersCheck
SET summ = (SELECT SUM(ABC) FROM (
SELECT cost as ABC FROM Orders 
WHERE 
(Orders.check_id=CashiersCheck.id) 
)A) *  Discount.value FROM Discount 
JOIN Clients ON Discount.id = Clients.discount_id
JOIN CashiersCheck ON Clients.id = CashiersCheck.client_id

--�������� ������� ������ ������
ALTER TABLE Orders
WITH CHECK ADD CONSTRAINT FK_Orders_Cookings FOREIGN KEY(cooking_id) REFERENCES Cookings(id)
ALTER TABLE CashiersCheck
WITH CHECK ADD CONSTRAINT FK_Check_Client FOREIGN KEY (client_id) REFERENCES Clients(id)
ALTER TABLE CashiersCheck
WITH CHECK ADD CONSTRAINT FK_Check_Staff FOREIGN KEY (staff_id) REFERENCES Staff(id)
ALTER TABLE Clients
WITH CHECK ADD CONSTRAINT FK_Clients_Discount FOREIGN KEY (discount_id) REFERENCES Discount(id)
ALTER TABLE Components
WITH CHECK ADD CONSTRAINT FK_Components_Provider FOREIGN KEY(provider_id) REFERENCES Providers(provider_id)
ALTER TABLE Delivery
WITH CHECK ADD CONSTRAINT FK_Delivery_Provider FOREIGN KEY(provider_id) REFERENCES Providers(provider_id)
ALTER TABLE Delivery
WITH CHECK ADD CONSTRAINT FK_Delivery_Components FOREIGN KEY(component) REFERENCES Components(name)

----���������� ������� ����� �������: ���������� ��� ����� � �������������� ���� ���� ��� ���������� ������ � ������� �������
ALTER TABLE Cookings
ADD CONSTRAINT DF_Cookings_name_cooking_unique UNIQUE (name_cooking)
ALTER TABLE Orders
ADD CONSTRAINT DF_Orders_createdDate_Default DEFAULT (getdate()) FOR createdDate

----������� ������ ������� � �� �������� �� �������� �������
CREATE TABLE TestTable (
id int,
pole1 varchar(128),
pole2 datetime);

INSERT INTO TestTable (id,pole1,pole2)
VALUES (1,'fsfs', GETDATE()),
       (2,'tttttttttt', GETDATE()),
       (3,'7yd77777a8hn', GETDATE());

TRUNCATE TABLE TestTable
DROP TABLE TestTable