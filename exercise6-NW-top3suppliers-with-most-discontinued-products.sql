-- Exercise 6: Find 3 suppliers who have the highest percentage of discontinued products
SELECT TOP(3)
	CompanyName,
	CantProdDiscPerSupp,
	(CAST(CantProdDiscPerSupp AS decimal)/CantProdPerSupp)*100 AS PercentageDiscontinued
FROM
	(SELECT
		SupplierID,
		SUM(IIF(Discontinued = 1, 1, 0)) AS CantProdDiscPerSupp,
		COUNT(ProductID) AS CantProdPerSupp
	FROM Products
	GROUP BY SupplierID) AS aux
LEFT JOIN Suppliers s ON s.SupplierID = aux.SupplierID
ORDER BY PercentageDiscontinued DESC, aux.CantProdDiscPerSupp DESC