USE orders;

SELECT * FROM orders;

-- Get the total amount spent for each customer (round to the second decimal)

SELECT CustomerID, ROUND(SUM(amount_spent),2)
FROM orders
GROUP BY CustomerID;

-- Get those customers whose total amount spent is higher than 100000 and order them descendingly by the total amount spent

SELECT CustomerID, ROUND(SUM(amount_spent),2)
FROM orders
GROUP BY CustomerID
HAVING ROUND(SUM(amount_spent),2) > 100000
ORDER BY ROUND(SUM(amount_spent),2) DESC;

-- Get the total amount spent for each month in the year 2011 (round to the second decimal) and order them descendingly by the total amount spent

SELECT month, ROUND(SUM(amount_spent),2)
FROM orders
WHERE year=2011
GROUP BY month
ORDER BY ROUND(SUM(amount_spent),2) DESC;

-- Get those countries whose total amount spent in the year 2011 is higher than 250000

SELECT Country, ROUND(SUM(amount_spent),2)
FROM orders
WHERE year=2011
GROUP BY Country
HAVING ROUND(SUM(amount_spent),2) > 250000;