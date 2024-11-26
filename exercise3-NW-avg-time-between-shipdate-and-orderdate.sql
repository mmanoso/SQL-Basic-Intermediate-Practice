--Exercise 3: Calculate the average time(in days) between when an order is placed and when it is shipped.
SELECT
	AVG(DATEDiff(DAY, OrderDate, ShippedDate)) AS AvgTime
FROM Orders
WHERE OrderDate IS NOT NULL AND ShippedDate IS NOT NULL