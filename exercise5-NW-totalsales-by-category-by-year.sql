-- Exercise 5: Create a report showing total sales per product category per year
-- Use order date as time
SELECT
	c.CategoryName,
	aux.Year,
	SUM((aux.UnitPrice*aux.Quantity)*(1-aux.Discount)) AS TotalSales
FROM
	(SELECT
		od.OrderID,
		od.ProductID,
		od.UnitPrice,
		od.Quantity,
		od.Discount,
		YEAR(o.OrderDate) AS Year
	FROM [Order Details] od
	LEFT JOIN Orders o ON o.OrderID = od.OrderID) AS aux
LEFT JOIN Products p ON p.ProductID = aux.ProductID	
LEFT JOIN Categories c ON c.CategoryID = p.CategoryID
GROUP BY aux.Year, c.CategoryName
ORDER BY aux.Year, c.CategoryName