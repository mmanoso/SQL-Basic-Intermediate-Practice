-- Exercise 10: Find the 5 products with the highest total sales revenue
SELECT TOP(5)
	aux.ProductID,
	p.ProductName,
	c.CategoryName,
	aux.TotalSalesPerProduct
FROM
	(SELECT
		ProductID,
		SUM((UnitPrice*Quantity)*(1-Discount)) AS TotalSalesPerProduct
	FROM [Order Details] od
	GROUP BY ProductID) AS aux
LEFT JOIN Products p ON p.ProductID = aux.ProductID
LEFT JOIN Categories c ON c.CategoryID = P.CategoryID
ORDER BY TotalSalesPerProduct DESC