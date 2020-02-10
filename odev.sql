Use Northwind
select * from Orders
select * from [Order Details]
----------------------------
Select OrderID,sum(UnitPrice*Quantity)as Tutar  from  [Order Details] where (UnitPrice*Quantity) between 2500 and 3500   group by OrderID order by Tutar asc

Select OrderID,sum(Quantity) as miktar from [Order Details] Group by OrderID having SUM(Quantity)<200 order by miktar desc

Select CategoryID,Sum(UnitsInStock) as  'stok sayýsý' from Products Group by CategoryID 

select e.EmployeeID,sum(UnitPrice*Quantity) AS 'Toplam tutar' 
from Employees e 
join Orders o 
on e.EmployeeID=o.EmployeeID 
join [Order Details] oe 
on oe.OrderID=o.OrderID 
group by e.EmployeeID 
order by EmployeeID asc
---------------------------
select o.OrderID,em.FirstName,em.LastName,em.TitleOfCourtesy,em.Title,em.HireDate,
cu.CompanyName,cu.ContactName,cu.Phone,
p.ProductName, p.UnitsInStock as 'Stok Miktarý',p.UnitPrice as 'Birim Fiyatý',
od.UnitPrice as 'Sipariþ Birim Fiyatý',od.Quantity as 'Sipariþ Miktarý',
ca.CategoryName from Orders as o 
join [Order Details] as od
on o.OrderID=od.OrderID
join Customers as cu
on o.CustomerID=cu.CustomerID
join Products as p
on od.ProductID=p.ProductID
join Categories as ca
on p.CategoryID=ca.CategoryID
join Employees as em
on o.EmployeeID=em.EmployeeID
-----------------------------