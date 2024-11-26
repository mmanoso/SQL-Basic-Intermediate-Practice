-- Exercise 7: Get the top 5 orders by total value, including customer name and order date
SELECT TOP(5)
	aux.OrderID,
	aux.TotalOrderValue,
	o.OrderDate,
	c.CompanyName
FROM
	(SELECT
		OrderID,
		SUM((UnitPrice*Quantity)*(1-Discount)) AS TotalOrderValue
	FROM [Order Details] od
	GROUP BY OrderID) AS aux
LEFT JOIN Orders o ON o.OrderID = aux.OrderID
LEFT JOIN Customers c ON c.CustomerID = o.CustomerID
ORDER BY TotalOrderValue DESC