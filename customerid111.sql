#import data
show global variables like "local_infile";
set global local_infile=1;
show global variables like "local_infile";

use november;

CREATE TABLE onlineretail (
    InvoiceNo INT NOT NULL,
    StockCode VARCHAR(50) NOT NULL,
    Descriptions VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    InvoiceDate DATETIME NOT NULL,
    UnitPrice VARCHAR(20) NOT NULL,
    CustomerID INT NOT NULL,
    Country VARCHAR(50) NOT NULL
);
desc onlineretail;

load data local infile "C:\\Users\\SPK\\Desktop\\datascience\\DataOnlineRetail.csv" into table onlineretail 
character set latin1 fields terminated by ';' enclosed by '"' lines terminated by '\r\n' ignore 1 lines
(InvoiceNo,StockCode,Descriptions,Quantity,@tmp_date,UnitPrice,CustomerID,Country)
set InvoiceDate = str_to_date(@tmp_date, '%d/%m/%Y %h:%i:%s');

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

#  customerid_111 sql table containing customer ID belonging to 111 groups who are best customers
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
order by 4 desc) as dummy_3 where rfm_combined = 111;
