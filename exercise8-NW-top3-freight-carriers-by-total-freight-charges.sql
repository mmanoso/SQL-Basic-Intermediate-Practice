-- Exercise 8: Find the top 3 freight carriers by total freight charges
SELECT TOP(3)
	s.CompanyName,
	aux.TotalFreightCharges
FROM
	(SELECT
		ShipVia,
		SUM(Freight) AS TotalFreightCharges
	FROM Orders
	GROUP BY ShipVia) AS aux
LEFT JOIN Shippers s ON s.ShipperID = aux.ShipVia
ORDER BY TotalFreightCharges DESC