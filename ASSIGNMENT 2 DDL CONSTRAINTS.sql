create  database Sales;
use  Sales;

create table Orders(
Order_ID int primary key auto_increment,
Customer_Name varchar(50) not null,
Product_Category  varchar(50), 
Ordered_Item varchar(50) not null,
Contact_No bigint unique
);


alter table Orders
add column Order_Quantity int;

desc orders;

alter table orders rename to Sales_Orders;

desc Sales_orders;

 insert into sales_orders(Order_ID,Customer_Name,Product_Category, Ordered_Item,Contact_No,Order_Quantity)
 values
 (default,'Daniel','Electronics','Oven',9874563210,3),
 (default,'Jack','Home Appliances','Refrigerator',9825746870,2),
 (default,'Julie','Fashion', 'Jacket',8521346287,2),
 (default,'Lilly','Grocery','Dry Fruits',8542369780,10),
 (default,'Alex','Electronics','Television',9654789210,1),
 (default,'Mary','Home Appliances','AC',765475520,5),
 (default,'Peter','Electronics','Laptop',8546542100,1),
 (default,'John','Fashion','T-Shirt',9206379210,7),
 (default,'Rose','Home Appliances','Chair',8528763210,10),
 (default,'Teresa','Electronics','Mobile',9863211751,1);
 
 select * from Sales_orders;
 
 select customer_name,Ordered_item from Sales_orders;
 
 update sales_orders set ordered_item= 'Banana'  where order_id = 4;
 
 drop table sales_orders;

 
 
 
 
 