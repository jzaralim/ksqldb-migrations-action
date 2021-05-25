INSERT INTO ALL_ORDER_EVENTS
SELECT orderid, name, items, cost, ordertime, 'WEBSITE'
FROM ORDER_EVENTS;

INSERT INTO ALL_ORDER_EVENTS
SELECT CAST(id AS STRING), name, items, price, FROM_UNIXTIME(ordertime), 'APP'
FROM ORDER_EVENTS;
