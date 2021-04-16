// 1h. Erwthsh
MATCH (c1:Customer)-[:MADE]->(o1:Order)-[:CONTAINS]->(product:Product)<-[:CONTAINS]-(o2:Order)<-[:MADE]-(c2:Customer)
WITH c1.fullName as c1Name, c2.fullName as c2Name, collect(product.productName) 
as commonProducts
WHERE size(commonProducts) >= 2
RETURN c1Name, c2Name, commonProducts;

// 2h. Erwthsh
MATCH (order:Order)
WHERE order.requiredDate IS NOT NULL  and  order.orderDate IS NOT NULL and order.shippedDate IS NOT NULL
SET order.requiredDate=date(order.requiredDate), order.orderDate=date(order.orderDate), order.shippedDate=date(order.shippedDate);

// 3. Erwthsh
MATCH (order:Order)
where order.orderDate=date("2021-07-08")
return "komvos:"+order.orderID, order.orderDate;

// 4. Erwthsh
match (category1:Category {categoryName: "Smartphones"}) // brhskw kathgoria smartphones
match (product1:Product {productName: "Apple MacBook PRO 2020"}) // brhskw sugkekrimenw antikeimnw
match (product1)-[r:PART_OF]->(category1) // brhskw thn sxesh
match (category2:Category {categoryName: "Laptops"}) // brhskw kathgoria Laptops
create (product1)-[rNew:PART_OF]->(category2) // thn ftiaxnw
delete r // diagrafw thn palia sxesh

test
