USE Restaraunt

--������� ������ ��������� ������� �����
SELECT name_cooking, price FROM Cookings

--������� ������ �� ������� � ������� �������
SELECT lname AS '�������', fname AS '���', Discount.id AS 'Discount,%' FROM Clients
JOIN Discount ON Clients.discount_id = Discount.id

--���������� ����������������� �����������
SELECT Providers.provider_name FROM Components 
RIGHT OUTER JOIN Providers ON Providers.provider_id = Components.provider_id
WHERE name IS NULL

--������� ������ � ���, ��� ������ �����, ��� �������, ���� �����, ���-�� ������, ��������� ������ ��� ����� ������, ����� ���� � ��� ��� ����������
SELECT Clients.lname AS '�������', Clients.fname AS '���', Cookings.name_cooking AS '�����', Cookings.price AS '����', Orders.amount AS '���-��', Orders.cost AS '���������', CashiersCheck.id AS '����� ����', Staff.lname AS '��������'
FROM Clients, Cookings, Orders, CashiersCheck, Staff
WHERE ((Cookings.id = Orders.cooking_id) AND (Staff.id = CashiersCheck.staff_id) AND (CashiersCheck.client_id = Clients.id)  AND (Orders.check_id = CashiersCheck.id))


--����������� �������� � ����� ������ � ��������� ��������� �� �������
SELECT A.fname,A.lname FROM Clients as A, Clients as B
WHERE A.fname = B.fname AND  A.id <> B.id
ORDER BY A.lname

--���������� ���������� ����, ������� ���������� � ������� �� ����������
SELECT * FROM Cookings
WHERE EXISTS (SELECT * FROM Orders WHERE Orders.cooking_id = Cookings.id)
SELECT * FROM Cookings
WHERE NOT EXISTS (SELECT * FROM Orders WHERE Orders.cooking_id = Cookings.id)

--���������� ��� ��������� � ��������� ������ ���������
SELECT Components.name AS �������, Providers.provider_name AS ��������� FROM Providers,Components
WHERE Components.name IN('���������','������','��������','����') AND Providers.provider_id = Components.provider_id

--���������� ����� �� ��������� ������� ����
SELECT Cookings.name_cooking as �����, Cookings.price as ���� FROM Cookings
WHERE price BETWEEN 50 AND 80;

SELECT Cookings.name_cooking as �����, Cookings.price as ���� FROM Cookings
WHERE price NOT BETWEEN 50 AND 80

--������� ����������, ���� �� ����, � ���� ���� ������� ������ 100
SELECT provider_name FROM Providers
WHERE provider_id = ALL (SELECT provider_id FROM Components WHERE primecost > 100)

--������� �����������, � ���� ���������� ���� ������ 70
SELECT provider_name FROM Providers
WHERE provider_id = ANY (SELECT provider_id FROM Components WHERE primecost > 70)

--���������� ��������, � ������� ��� ���������� � ����� "A"
SELECT fname, lname FROM Clients
WHERE fname LIKE '�%';

----���������� ��������� ���� � �������� ���� ������
SELECT
   Cookings.name_cooking,Cookings.price as ����, Discount.value  as ���������,
  CASE
    WHEN Discount.id = 0 THEN Cookings.price*Discount.value
    WHEN Discount.id = 3 THEN Cookings.price*Discount.value
	WHEN Discount.id = 5 THEN Cookings.price*Discount.value
	WHEN Discount.id = 7 THEN Cookings.price*Discount.value
	WHEN Discount.id = 10 THEN Cookings.price*Discount.value
	WHEN Discount.id = 15 THEN Cookings.price*Discount.value
  END ����� 
FROM Cookings, Discount
ORDER BY Cookings.name_cooking

---������� � ��������������� �����
SELECT Cookings.name_cooking, CAST(Cookings.price AS nvarchar) + ' ���.' as   ����
FROM Cookings
SELECT CONVERT(nvarchar, Orders.createdDate, 3)
FROM Orders

--������� ������� ������ � �������, ���� ����, �� ������� ��������
SELECT fname, lname,
IIF(discount_id = 0, '������ ���', CAST(discount_id as nvarchar) + '%') as '������� ������'
FROM Clients 

--������ ������� replace, ��� ��������� ������
SELECT fname as '�� ������', REPLACE(fname, '�������', '����') as '����� ������'
FROM Clients;

--������ �������� � ������� �������
SELECT fname, UPPER(fname) FROM Clients

--������ ������������� unicode � ascii. ������� ������ �� �������� ������� �������.
SELECT fname, ASCII(fname), UNICODE(fname) FROM Clients

--������ ������������� nchar. ������� ������ �� ������� ������.
SELECT price, NCHAR(price) FROM Cookings

---������ ������������� datepart
SELECT createdDate, DATEPART(YY, createdDate) FROM Orders

--������ ������������� dateadd
SELECT createdDate, DATEADD(YY, 10, createdDate) FROM Orders

--������ ��������� ������� ���������� � �������������� ����
SELECT SYSDATETIMEOFFSET(), CONVERT(datetime,SYSDATETIMEOFFSET()), CONVERT(date,SYSDATETIMEOFFSET())

--������ ������������� Group by, ������� �� �������� � �� �����������, ������������ �� �������� ��������, ������� �� ���������� "������"
SELECT Components.name, Providers.provider_name FROM Components,Providers
WHERE Components.provider_id=Providers.provider_id
GROUP BY Components.name, Providers.provider_name
HAVING Providers.provider_name <> '"������"'
