create database data_analysis;
use data_analysis;
select * from bike_sales;


select count(*)  as count from bike_sales;

describe bike_sales;

select count(*) as total_purchsed_bike from bike_sales
where `purchased bike` ='yes';


 select occupation, avg(income) as income
 from bike_sales
 group by occupation
 order by income desc;
   
   
select `purchased bike`,(count(`purchased bike`)) as total_bike_selling
from bike_sales 
group by `purchased bike`
having `purchased bike` ='yes';


-- find duplicate values --

select id,count(*) as no_of_id
from bike_sales
group by id
having no_of_id >1;



-- remove duplicates from table --

CREATE TABLE bike_sales_clean AS
SELECT DISTINCT *
FROM bike_sales;


select count(*) from bike_sales_clean;



-- CHECK WHETHER NULL IS THERE OR NOT --
 
select count(*) from bike_sales_clean
where `Marital status` is null
or Gender is null 
or Income is null 
or Children is null 
or Education is null 
or Occupation is null 
or `Home Owner` is null 
or Cars is null 
or `Commute Distance` is null
or Region is null 
or Age is null 
or `Purchased Bike` is null;                                    



--  TRIM THE COLUMN NAME --

select * from bike_sales_clean
where trim(`Marital status`)=''
or trim(`home owner`)=''
or trim(`home owner`)=''
or trim(`commute distance`)=''
or trim(`purchased bike`)='';


select `purchased bike` from bike_sales_clean;



-- Categorical value audit — confirm only expected labels exist  --

select distinct `marital status` from bike_sales_clean;
select distinct `Gender` from bike_sales_clean;
select distinct `Children` from bike_sales_clean;
select distinct `Education` from bike_sales_clean;
select distinct `Occupation` from bike_sales_clean;
select distinct `Home Owner` from bike_sales_clean;
select distinct `Commute Distance` from bike_sales_clean;
select distinct `Region` from bike_sales_clean;
select distinct `Purchased Bike` from bike_sales_clean;



----- TO CHECK INVALID VALUES -----
select * from bike_sales_clean 
where income <0 or 
 children <0 or
 cars < 0 or 
 age < 0 or age>100;
 
 
 -- ADDING NEW COLUMN AS INCOME_BAND --
 
 alter table bike_sales_clean add column income_band text;
 
update bike_sales_clean 
 set income_band =case
when income<30000 then 'low' 
when income >30000 and income <60000 then 'medium'
when income >60000  and income <100000 then 'high'
else 'very high'
end;

select distinct income_band from bike_sales_clean;

-- set sql_safe_updates=1;-- 
-- ADDING NEW COLUMN AS AGE_GROUP--

alter table bike_sales_clean add column age_group text;

update bike_sales_clean  
set age_group= case 
when age < 30 then 'under 30'
when age between 30 and 39 then '30-39'
when age between 40 and 49 then '40-49'
when age between 50 and 59 then '50-59'
else '60+'
end ;

select  distinct age_group from bike_sales_clean
limit 5;

select distinct `commute distance` from bike_sales_clean;


select 
count(*)        as total_customer,
min(income)     as min_salary,
max(income)     as max_salary,
round(avg(age),2)        as average_age,
sum(case when `purchased bike`='yes' then 1 else 0 end)  as total_purchased
from bike_sales_clean; 


--  FIND THE  LARGEST PURCHASE RATE GROUP BY REGION --

select region ,
count(*)   as total_customer,
sum(case when `purchased bike`='yes' then 1 else 0 end) as purchase_total,
round(sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100,2)  as perchase_rate
from bike_sales_clean
group by region
order by perchase_rate desc;

--  FIND THE PURCHASE RATE BY OCCUPATION --
select occupation,
round(sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100,2) as purchased_rate
from bike_sales_clean
group  by occupation
having purchased_rate >50
order by  purchased_rate desc;


SELECT
    Occupation, COUNT(*) AS total_customers,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS size_rank
FROM bike_sales_clean
GROUP BY Occupation;



select id,region,income,occupation from(
select id,region,income,occupation,
row_number()  over(
partition by region 
order by income desc) as rn
from bike_sales_clean
) as t
where rn=1;

select age_group,
total_customers,
purchase_rate,
dense_rank() over (
order by purchase_rate desc) as dense_rnk
from
(select age_group,
 round(sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100,2)
as purchase_rate,
count(*) as total_customers
from bike_sales_clean
group by age_group
) as age_group_summary;

 
 
 select 
 nn as income_quartile,
 count(*) as total_customers,
 (sum(case when `purchased bike`='yes' then 1 else 0 end)) 
 as buyers,
 round((sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100))as purchase_rate
 from (
 select `purchased bike`,income,
 ntile(4) over(order by income) as nn
 from bike_sales_clean
 )as t
 group by nn
 order by nn ;

 
 
 select income_band,count(*)
 from bike_sales_clean
 group by income_band
 order by income_band desc;
 
-- ============================================================
-- SECTION B: REGIONAL PERFORMANCE
-- ============================================================
 
 -- FIND THE TOP 1 PURCHASED RATE BY REGION--
 
select* from(
select region,purchase_rate,row_number() 
over( order by purchase_rate desc) as rn
from(
select region,round(sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100) as purchase_rate
from bike_sales_clean
group by region
) as t
) as x
where rn=1;


select *from(
select id, region,income,row_number() 
over( partition by region 
order by income desc) as high_salary
from bike_sales_clean
) as t
where high_salary=1;

-- FIND THE PURCHASE RATE BY USING REGION & OCCUPATION TOP 5 --
 
 select region,occupation,
round(sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100,2) as purchased_rate
from bike_sales_clean
group  by region,occupation
having purchased_rate >20
order by  purchased_rate desc
limit 5;

-- find the largest purchase_rate by region --
 
select region ,
count(*)   as total_customer,
sum(case when `purchased bike`='yes' then 1 else 0 end) as purchase_total,
round(sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100,2)  as perchase_rate
from bike_sales_clean
group by region
order by perchase_rate desc;

-- ============================================================
-- SECTION C: DEMOGRAPHIC & LIFESTYLE ANALYSIS
-- ============================================================

-- Does marital status combined with gender affect purchase behaviour? --

select `marital status`,gender, 
round(sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100,2) as purchase_rate
from bike_sales_clean
group by `marital status`,gender
order by purchase_rate desc;

 
--  Does education level influence the likelihood of purchase?

SELECT
    Education, COUNT(*) AS total_customers,
    ROUND(100.0 * SUM(CASE WHEN `Purchased Bike`='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS purchase_rate_pct
FROM bike_sales_clean
GROUP BY Education
ORDER BY purchase_rate_pct DESC;

 -- Does home ownership affect purchase likelihood? --
 
SELECT
      `home owner`, COUNT(*) AS total_customers,
    ROUND(100.0 * SUM(CASE WHEN `Purchased Bike`='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS purchase_rate
FROM bike_sales_clean
group by `home owner`
order by `home owner` desc;


-- Q11. How does the number of children in the household affect purchases?

SELECT
    Children, COUNT(*) AS total_customers,
    ROUND(100.0 * SUM(CASE WHEN `Purchased Bike`='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS purchase_rate
FROM bike_sales_clean
GROUP BY Children
ORDER BY Purchase_rate desc;


-- ============================================================
-- SECTION D: COMMUTE, VEHICLE OWNERSHIP & LIFESTYLE FIT
-- ============================================================

 -- Does commute distance affect the likelihood of buying a bike? --
 
select `Commute Distance`,
round(sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100,2) as percentage
from bike_sales_clean
group by`Commute Distance`
order by percentage desc;

-- -- Q14. Does the number of cars owned affect bike purchase likelihood? --

select `Cars`,
round(sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100,2) as percentage
from bike_sales_clean
group by`Cars`
order by percentage desc;


-- What is the average profile of a BUYER vs a NON-BUYER? --

select 'buyers' as segment,
round(avg(age),2) as avg_age,
round(avg(income),2) as avg_income,
round(avg(children),2) as avg_children,
round(avg(cars),2) as avg_cars
from bike_sales_clean 
where `purchased bike`='yes'
union all
select 'non buyers' as segment,
round(avg(age),2) as avg_age,
round(avg(income),2) as avg_income,
round(avg(children),2) as avg_children,
round(avg(cars),2) as avg_cars
from bike_sales_clean 
where `purchased bike`='no';


-- ============================================================
-- SECTION E: INCOME-DEPTH ANALYSIS
-- ============================================================

-- FIND THE INCOME ABOVE AVERAGE INCOME --

select * from bike_sales_clean as above_average_income
where income>(select avg(income)
from bike_sales_clean
);




select quartile_income,
count(*) as total_customers,
round(sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100,2)
as purchase_rate ,
sum(case when `purchased bike`='yes' then 1 else 0 end)  as total_buyers
from (
select income,`purchased bike`,ntile(4) over(order by income) as quartile_income
from bike_sales_clean 
) t
group by quartile_income
order by quartile_income;


SELECT
	COUNT(*) AS total_customers,
    RANK() OVER (ORDER BY count(*)  DESC) AS size_rank,
    occupation
from
bike_sales_clean 
GROUP BY Occupation;



SELECT
    COUNT(*) AS ideal_profile_customers,
    SUM(CASE WHEN `Purchased Bike`='Yes' THEN 1 ELSE 0 END) AS buyers,
    ROUND(100.0 * SUM(CASE WHEN `Purchased Bike`='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS purchase_rate_pct
FROM bike_sales_clean
WHERE Cars = 0 AND `Commute Distance` IN ('0-1 Miles', '2-5 Miles');


select min(income) as top_20_pct_income_threshold
from(
select id,income,row_number()
over (order by income desc) as rnk,
count(*) over() as total_n
from bike_sales_clean
) as t
 where rnk <=cast(total_n*0.2 as signed);

SELECT ID, Age, Income, `Marital Status`, Region
FROM bike_sales_clean
WHERE Age < 35 AND Occupation = 'Professional' AND `Marital Status` = 'S'
ORDER BY Income DESC
LIMIT 10;

-- FIND THE PURCHASE RATE BY Commute Distance --

select `Commute Distance`,
round(sum(case when `purchased bike`='yes' then 1 else 0 end)/count(*)*100,2) as purchase_ratio
from bike_sales_clean
group by  `Commute Distance`;