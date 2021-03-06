INSERT INTO ALL_ORDER_EVENTS
SELECT orderid, name, items, cost, ordertime, 'WEBSITE' AS PURCHASE_METHOD
FROM ORDER_EVENTS;

INSERT INTO ALL_ORDER_EVENTS
SELECT CAST(id AS STRING) AS ORDERID, name, items, price AS COST, FROM_UNIXTIME(ordertime) AS ORDERTIME, 'APP' AS PURCHASE_METHOD
FROM APP_ORDER_EVENTS;
