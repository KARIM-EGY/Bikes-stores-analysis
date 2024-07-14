select ord.order_id,
	CONCAT(cus.first_name , ' ', cus.Last_name) as Full_Name,
	cus.city,
	cus.state,
	order_date,
	sum(its.quantity) as Total_items,
	sum(its.quantity * its.list_price) as Revenue,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name ,' ', sta.last_name) as Seller,
	bra.brand_name

from sales.orders as ord
join sales.customers as cus ON ord.customer_id = cus.customer_id
join sales.order_items as its ON its.order_id = ord.order_id
join production.products as pro ON pro.product_id = its.product_id
join production.categories as cat ON cat.category_id = pro.category_id
join sales.stores as sto ON sto.store_id = ord.store_id
join sales.staffs as sta ON sta.staff_id = ord.staff_id
join production.brands as bra ON bra.brand_id = pro.brand_id

group by 
	ord.order_id,
	CONCAT(cus.first_name , ' ', cus.Last_name),
	cus.city,
	cus.state,
	order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name ,' ', sta.last_name),
	bra.brand_name

	
