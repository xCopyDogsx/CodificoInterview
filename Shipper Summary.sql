SELECT shippers.companyname AS CompanyName,
SUM(orders.freight) AS TotalFreight,
SUM(ordersdetails.qty*ordersdetails.unitprice) AS TotalCostShipped,
SUM(ordersdetails.qty) AS TotalItemsShippeds 
FROM  Sales.Shippers AS shippers
JOIN Sales.Orders AS orders
ON shippers.shipperid=orders.shipperid
JOIN Sales.OrderDetails AS ordersdetails
ON orders.orderid = ordersdetails.orderid
GROUP BY shippers.companyname
ORDER BY shippers.companyname ASC;