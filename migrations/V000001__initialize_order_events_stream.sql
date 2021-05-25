CREATE STREAM ORDER_EVENTS (
  orderid STRING, 
  name STRING, 
  items ARRAY<STRING>,
  cost DECIMAL(6, 2),
  ordertime TIMESTAMP
) WITH (
  kafka_topic='order_event', 
  partitions=1,
  value_format='json'
);
