-- Exercise 2: Identify the products that have never been ordered
SELECT
	p.ProductName,
	p.ProductID
FROM Products p
LEFT JOIN [Order Details] od ON p.ProductID = od.ProductID
WHERE od.OrderID IS NULL