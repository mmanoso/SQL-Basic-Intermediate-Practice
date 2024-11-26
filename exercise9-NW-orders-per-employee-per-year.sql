-- Exercise 9: Create a query to get the count of orders per employee per year
SELECT
	aux.EmployeeID,
	e.FirstName,
	e.LastName,
	aux.Years,
	aux.TotalOrdersPerEmployee
FROM
	(SELECT
		EmployeeID,
		YEAR(OrderDate) AS Years,
		COUNT(OrderID) AS TotalOrdersPerEmployee
	FROM Orders
	GROUP BY YEAR(OrderDate), EmployeeID) AS aux
LEFT JOIN Employees e ON e.EmployeeID = aux.EmployeeID
ORDER BY aux.Years, aux.EmployeeID