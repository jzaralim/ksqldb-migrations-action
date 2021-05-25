CREATE STREAM APP_ORDER_EVENTS (
  id BIGINT, 
  name STRING, 
  items ARRAY<STRING>,
  price DECIMAL(6, 2),
  ordertime BIGINT
) WITH (
  kafka_topic='app_order_event', 
  partitions=1,
  value_format='json'
);

CREATE STREAM ALL_ORDER_EVENTS (
  orderid STRING, 
  name STRING, 
  items ARRAY<STRING>,
  cost DECIMAL(6, 2),
  ordertime TIMESTAMP,
  purchase_method STRING
) WITH (
  kafka_topic='all_order_events', 
  partitions=1,
  value_format='json'
);
