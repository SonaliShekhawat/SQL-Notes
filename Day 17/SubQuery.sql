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

