#SUBQUERY

#wasq to fetch maximum amnt from payments table?
select max(amount) from payments;

select customerNumber,checkNumber,max(amount) from payments
group by 1,2;

select customernumber,checknumber,amount from payments
where amount=(select max(amount) from payments);

#wasq to fetch customernumber and amount of a customer
#whose amount is more than average?
select customernumber,amount from payments
where amount>(select avg(amount) from payments);

#wasq to fetch customerdetail who have not placed any order?(subquery)
select customername from customers
where customernumber not in (select customernumber from orders);

#wasq to fetch customerdetail who have placed any order?(subquery)
select customername from customers
where customernumber in (select customernumber from orders);

#wasq to fetch product whose buyprice is avg buyprice of all products?
select productname,buyprice from products
where buyprice>(select avg(buyprice) from products);

#wasq to fetch employeenumber,employeename who have not managed any customer?
select employeenumber,concat(firstname," ",lastname) as employeename from employees
where employeenumber not in (select employeenumber from customers);

#wasq to fetch productname that have not been sold? 
select productname from products
where productcode not in (select productcode from orderdetails);

#wasq to fetch productline whose tov is greater than avg ov of all productline?
select productline,sum(quantityordered*priceeach) as tov
from products join orderdetails using(productcode)
group by 1
having tov>(select sum(quantityordered*priceeach)/count(distinct productline) as avgtov from products join orderdetails using(productcode));

use dummy;
#wasq to fetch second and third highest product of each productline?

#wasq to fetch customername and their ordercount on the basis of ordercount create one custom column customer_type
#condiition are
#if ordercount is one than one time customer
#if ordercount is two than one repeated customer
#if ordercount is thre than one frequent customer
#if ordercount>=4 then loyal customer?


#wasq to fetch first and second least quantity sold products of each productline of each orderyear?
select * from
(select productline,productname,sum(quantityordered) as quansold,year(orderdate) as orderyear,
dense_rank() over(partition by productline,year(orderdate) order by sum(quantityordered) asc) as d_rn from products 
join orderdetails using(productcode)
join orders using(ordernumber)
group by 1,2,4) as derived
where d_rn in (1,2);


