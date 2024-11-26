-- Exercise 1: Find the top 3 customers by TotalOrderValue
SELECT 
	C.CustomerID,
	C.CompanyName,
	aux.TotalOrderValue AS TotalOrderValue
FROM --List with top 3 CustomerID and TotalOrderValue
	(SELECT TOP (3)
		O.CustomerID,
		SUM(OD.OrderValue) AS TotalOrderValue
	FROM
		(SELECT
			OrderID,
			ROUND(SUM(UnitPrice*Quantity*(1-Discount)), 2) AS OrderValue
		FROM [dbo].[Order Details]
		GROUP BY OrderID) AS OD
	LEFT JOIN (
		SELECT
			O.OrderID,
			O.CustomerID
		FROM [dbo].[Orders] O
		LEFT JOIN [dbo].[Customers] C ON O.CustomerID = C.CustomerID
	) O ON OD.OrderID = O.OrderID
	GROUP BY O.CustomerID
	ORDER BY TotalOrderValue DESC) AS aux
LEFT JOIN [dbo].[Customers] C ON C.CustomerID = aux.CustomerID --Add the CompanyName to the top 3 CustomerID and TotalOrderValue
