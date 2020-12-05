select * from onlineretail;

select customerID, 
       max(InvoiceDate) as last_order_date,
       count(*) as count_order,
       sum(quantity * unitprice) as total_amount,
       avg(quantity * unitprice) as avg_amount
from onlineretail
group by customerID;

select customerID, rfm_recency, rfm_frequency, rfm_monetary, 
       rfm_recency*100 + rfm_frequency*10 + rfm_monetary as rfm_combined 
from 
(select customerID, 
   ntile (4) over (order by last_order_date) as rfm_recency, 
   ntile (4) over (order by count_order)    as rfm_frequency, 
   ntile (4) over (order by avg_amount)       as rfm_monetary 
 from 
 (select customerID,  
         max(InvoiceDate)     as last_order_date, 
         count(*)             as count_order, 
         avg(quantity * unitprice) as avg_amount 
  from onlineretail 
  group by customerID) as dummy_1 
) as dummy_2
order by 4 desc;

#customerid_311 sql table containing customer ID  belonging to 311 groups who are almost lost customers
select * from (
select customerID, rfm_recency, rfm_frequency, rfm_monetary, 
       rfm_recency*100 + rfm_frequency*10 + rfm_monetary as rfm_combined
from 
(select customerID, 
   ntile (4) over (order by last_order_date) as rfm_recency, 
   ntile (4) over (order by count_order)    as rfm_frequency, 
   ntile (4) over (order by avg_amount)       as rfm_monetary 
 from 
 (select customerID,  
         max(InvoiceDate)     as last_order_date, 
         count(*)             as count_order, 
         avg(quantity * unitprice) as avg_amount 
  from onlineretail 
  group by customerID) as dummy_1 
) as dummy_2
order by 4 desc) as dummy_3 where rfm_combined = 311;