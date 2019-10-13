CREATE TABLE customers
(
  cust_id      int       NOT NULL AUTO_INCREMENT COMMENT '唯一的顾客ID',
  cust_name    char(50)  NOT NULL COMMENT '顾客名',
  cust_address char(50)  NULL COMMENT '顾客的地址',
  cust_city    char(50)  NULL COMMENT '顾客的城市',
  cust_state   char(5)   NULL COMMENT '顾客的州',
  cust_zip     char(10)  NULL COMMENT '顾客的邮政编码',
  cust_country char(50)  NULL COMMENT '顾客的国家',
  cust_contact char(50)  NULL COMMENT '顾客的联系名',
  cust_email   char(255) NULL COMMENT '顾客的联系email地址',
  PRIMARY KEY (cust_id)
) ENGINE=InnoDB;
CREATE TABLE orderitems
(
  order_num  int          NOT NULL COMMENT '订单号',
  order_item int          NOT NULL COMMENT '订单物品号',
  prod_id    char(10)     NOT NULL COMMENT '产品ID',
  quantity   int          NOT NULL COMMENT '物品数量',
  item_price decimal(8,2) NOT NULL COMMENT '物品价格',
  PRIMARY KEY (order_num, order_item)
) ENGINE=InnoDB;
CREATE TABLE orders
(
  order_num  int      NOT NULL AUTO_INCREMENT COMMENT '唯一订单号',
  order_date datetime NOT NULL COMMENT '订单日期',
  cust_id    int      NOT NULL COMMENT '订单顾客ID',
  PRIMARY KEY (order_num)
) ENGINE=InnoDB;
CREATE TABLE products
(
  prod_id    char(10)      NOT NULL COMMENT '唯一的产品ID',
  vend_id    int           NOT NULL COMMENT '产品供应商ID',
  prod_name  char(255)     NOT NULL COMMENT '产品名',
  prod_price decimal(8,2)  NOT NULL COMMENT '产品价格',
  prod_desc  text          NULL COMMENT '产品描述',
  PRIMARY KEY(prod_id)
) ENGINE=InnoDB;
CREATE TABLE vendors
(
  vend_id      int      NOT NULL AUTO_INCREMENT COMMENT '唯一的供应商ID',
  vend_name    char(50) NOT NULL COMMENT '供应商名',
  vend_address char(50) NULL COMMENT '供应商的地址',
  vend_city    char(50) NULL COMMENT '供应商的城市',
  vend_state   char(5)  NULL COMMENT '供应商的州',
  vend_zip     char(10) NULL COMMENT '供应商的邮政编码',
  vend_country char(50) NULL COMMENT '供应商的国家',
  PRIMARY KEY (vend_id)
) ENGINE=InnoDB;
CREATE TABLE productnotes
(
  note_id    int           NOT NULL AUTO_INCREMENT COMMENT '唯一注释ID',
  prod_id    char(10)      NOT NULL COMMENT '产品ID',
  note_date datetime       NOT NULL COMMENT '增加注释的日期',
  note_text  text          NULL COMMENT '注释文本',
  PRIMARY KEY(note_id),
  FULLTEXT(note_text)
) ENGINE=MyISAM;
ALTER TABLE orderitems ADD CONSTRAINT fk_orderitems_orders FOREIGN KEY (order_num) REFERENCES orders (order_num);
ALTER TABLE orderitems ADD CONSTRAINT fk_orderitems_products FOREIGN KEY (prod_id) REFERENCES products (prod_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_customers FOREIGN KEY (cust_id) REFERENCES customers (cust_id);
ALTER TABLE products ADD CONSTRAINT fk_products_vendors FOREIGN KEY (vend_id) REFERENCES vendors (vend_id);
