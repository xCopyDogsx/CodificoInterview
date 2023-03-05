SELECT 
    customer.companyname AS CompanyName,
    MAX(orders.orderdate) AS LastOrderDate,
    DATEADD(day, AVG(DATEDIFF(day, prev_orderdate, orders.orderdate)), MAX(orders.orderdate)) as NextOrderDate
FROM 
    Sales.Customers as customer
    JOIN (
        SELECT 
            *,
            LAG(orderdate) OVER (PARTITION BY custid ORDER BY orderdate) AS prev_orderdate
        FROM 
            Sales.Orders
    ) as orders
    ON customer.custid=orders.custid
WHERE 
    orders.orderdate IS NOT NULL
GROUP BY 
    customer.companyname
ORDER BY 
    customer.companyname ASC;