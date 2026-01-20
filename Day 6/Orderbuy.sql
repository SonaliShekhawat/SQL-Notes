#Order by
#select col1,col2....colN from tablename 
#order by Col1[asc/desc],Col2.[asc/desc],....ColN[asc/desc];
#by default - Ascending order works
#
#order of execution
#from---->select....>orderby

#single column sorting
use dummy;
#wasql to fetch contactlastname,contactfirstname from the customers table and sort the data by contactlastname in ascendingorder?
select contactlastname,contactfirstname from customers
order by contactlastname asc;

#wasql to fetch customername,city,state,country and creditlimit from the customerstable and sort the data by highest to lowest credit limit?
select customername,city,state,country,creditlimit from customers
order by creditlimit desc;

#multiplecolumnsorting
#wasql that fetch contactlastname,contactfirstname from the customers table and 
#sort the record by contactlastname in descending order then by contactfirstname in ascending order?
select contactlastname,contactfirstname from customers
order by contactlastname desc,contactFirstName asc;

#wasql that fetch ordernumber and their ordervalue from orderdetails table sort the data by ordervalue in desc order?
select ordernumber,(quantityordered*priceeach) as ordervalue from orderdetails
order by ordervalue desc;




