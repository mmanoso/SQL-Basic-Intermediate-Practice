-- Exercise 4: Find hte employees who have the most direct reports
SELECT
	e.FirstName,
	e.LastName,
	e.Title,
	aux.CantDirectReports
FROM
	(SELECT
		e1.ReportsTo,
		COUNT(e1.ReportsTo) AS CantDirectReports
	FROM Employees e1
	LEFT JOIN Employees e2 ON e2.EmployeeID = e1.ReportsTo
	WHERE e1.ReportsTo IS NOT NULL
	GROUP BY e1.ReportsTo) AS aux
LEFT JOIN Employees e ON e.EmployeeID = aux.ReportsTo
ORDER BY aux.CantDirectReports DESC