ChocSales dataset

-- QUERY 1 To get entire data TABLE
SELECT *  
FROM [dbo].[ChocSales];

-- QUERY 2 This is also Get Entire data TABLE
SELECT * 
FROM ChocSales;

-- QUERY 3 To get amount only amount column from data
SELECT amount 
FROM ChocSales;


-- QUERY 4 To get Country only amount column from data
SELECT country FROM ChocSales

-- QUERY 5 To get country,amount and Sales_Person data
SELECT country,amount,Sales_Personperson
FROM ChocSales

-- QUERY 6 To get Sales_Person,country,amount data this runs according to the sales person in first column
SELECT Sales_Person,country,amount
FROM ChocSales


--QUERY 7 To get indian sales person data only
SELECT sales_person FROM ChocSales
WHERE Country = 'India'


--QUERY 8 To get single count of country or I say Distinct count of country
SELECT DISTINCT Country
FROM ChocSales


--QUERY 9 To get Distinct count of Sales_Person/country
SELECT DISTINCT Sales_Person, Country
FROM ChocSales


--Query 10 To get data according sorting, We use Order BY for sorting.
SELECT * 
FROM ChocSales
ORDER BY Sales_Person ASC, Country ASC, Boxes_Shipped DESC


--QUERY 11 To get Top 10/20/30 Etc according to your prefrence.
SELECT TOP 10 *
FROM ChocSales

AND

SELECT TOP 50 *
FROM ChocSales

--QUERY 12 This is to get the half or the percent data whatever the percent you give, In this I give 2 percent 
SELECT TOP 2 PERCENT *
FROM ChocSales
ORDER BY Amount

--CLASS 2
--AGGREGATE FUNCTION IN SQL

--QUERY 1 To get sum from total amount column or sales
SELECT SUM (AMOUNT) AS Total_Sales
FROM ChocSales


--QUERY 2 To get average from total amount column or sales
SELECT AVG (AMOUNT) AS Total_Average
FROM ChocSales


--QUERY 3 To get Maximum number from total amount column or sales
SELECT MAX (AMOUNT) AS Max_Sales
FROM ChocSales

--QUERY 4 To get Minimum number from total amount column or sales
SELECT Min (AMOUNT) AS Min_Sales
FROM ChocSales


--QUERY 5 To get counts of sales from total amount column or sales

SELECT COUNT (AMOUNT) AS COUNT_OF_SALES
FROM ChocSales


--Inequality questions or Comparison questions

--QUERY 6 To get equal to value
SELECT * 
FROM ChocSales
WHERE Amount = 156600

--QUERY 7 To get not equal to value
SELECT * 
FROM ChocSales
WHERE Amount <> 156600


--QUERY 8 To get greater than and equal to value
SELECT * 
FROM ChocSales
WHERE Amount >= 22000

--QUERY 9 To get less than and equal to value
SELECT * 
FROM ChocSales
WHERE Amount <=50


--WHERE clause using with orderby
--QUERY 10 To get country not equal to with desc order sorting
SELECT * FROM ChocSales
WHERE COUNTRY <> 'UK'
ORDER BY COUNTRY DESC

--QUERY 11 To get country equal to with desc order sorting
SELECT * FROM ChocSales
WHERE COUNTRY = 'UK'
ORDER BY AMOUNT ASC

--QUERY 12 AND:- Both given conditions must be TRUE
SELECT *
FROM ChocSales
WHERE Amount <50 AND Amount >22000

--Same in the case of TEXT
SELECT *
FROM ChocSales
WHERE Country = 'India' AND Country = 'UK'

---FOR SAME RESULT AS ABOVE
SELECT *
FROM ChocSales
WHERE (PRODUCT) = 'DRINKING COCO' OR  (PRODUCT)= 'ECLAIRS'

--QUERY 12 OR:- At least 1 condition must be TRUE
SELECT *
FROM ChocSales
WHERE Amount <50 OR Amount >22000

--Same in the case of TEXT
SELECT *
FROM ChocSales
WHERE Country = 'India' OR Country = 'UK'

--QUERY 13 NOT:- To REVERSE the condition
SELECT * 
FROM ChocSales
WHERE NOT Amount < 50

--QUERY 14 IN CLAUSE:- Same like and equals to condition it will give us a values which we NEEDED
SELECT *
FROM ChocSales
WHERE Country IN ('INDIA,UK');

--WITH ORDER BY 
SELECT *
FROM ChocSales
WHERE Country IN ('INDIA','UK')
ORDER BY Country ASC

--with AND CLAUSE
SELECT *
FROM ChocSales
WHERE Sales_Person IN ('van tuxwell')
and COUNTRY = 'India'

--QUERY 15 BETWEEN clause / ALWAYS USE AND WITH BETWEEN
SELECT *
FROM ChocSales
WHERE Boxes_Shipped BETWEEN 50 AND 60

--WITH ORDER BY
SELECT *
FROM ChocSales
WHERE Country BETWEEN 'INDIA' AND 'UK'
ORDER BY Country

---TO FIND A DATE BETWEEN 
SELECT *
FROM ChocSales
where [Date] between '2022-01-01' and '2022-05-01'


--QUERY 16 ITS A LIKE CLAUSE IN WHICH MANY WILDCARDS USE LIKE -> % () _
--%
-- ()
-- _ UNDERSCORE
--BELOW IS SHOWING STARTING CHARACTER IS 'U%' IN Country
SELECT *
FROM ChocSales
WHERE Country LIKE 'U%'

--BELOW IS SHOWING ENDING CHARACTER IS '%A' IN country
SELECT *
FROM ChocSales
WHERE Country LIKE '%A'

--BELOW IS SHOWING CONTAIN CHARACTER IS '%DARK%' IN Product
SELECT *
FROM ChocSales
WHERE (Product) LIKE '%DARK%'

--BELOW IS SHOWING STARTING CHARACTER IS '%van%' IN Sales_Person
SELECT *
FROM ChocSales
WHERE (Sales_Person) LIKE 'VAN%'

--QUERY 17 BY USING "_" IN LIKE CLAUSE
--BELOW IS SHOWING FIRST CHARACTER COULD BE ANYTHING BUT SECOND CHARACTER MUST BE '_A&' IN NAMES
SELECT *
FROM ChocSales
WHERE (Sales_Person) LIKE '_A%'

----BELOW IS SHOWING FIRST CHARACTER COULD BE ANYTHING BUT SECOND CHARACTER MUST BE '_??&' IN NAMES

SELECT *
FROM ChocSales
WHERE Sales_Person LIKE '_AN%';

----QUERY 18 BY USING "[]" IN LIKE CLAUSE WITH ORDER BY
--below is used for where country or etc start with any letter you want like in below example, I want country starts with U & I
SELECT * FROM ChocSales
WHERE COUNTRY LIKE '[UI]%'
ORDER BY COUNTRY


--This will give us a range data between D to G starts in names of sales person, Basically in SQL hyphen - defines a range selection example 1-3, a-d etc.
SELECT *
FROM ChocSales
WHERE Sales_Person LIKE '[D-G]%';


--This will give us a apart from range data between D to G starts in names of sales person, Basically in SQL ^ defines a not in range selection example [^1-3], [^a-d] etc.

SELECT *
FROM ChocSales
WHERE Sales_Person LIKE '[^D-G]%'
order by Sales_Person


--CLASS 3 Group by

--QUERY 1 This query will give us a Pivot summary of country's total sales in each country
SELECT Country, SUM([AMOUNT]) AS TOTAL_SALES
FROM ChocSales
GROUP BY Country
ORDER BY TOTAL_SALES

--Same as above QUERY
SELECT Sales_Person, SUM([AMOUNT]) AS TOTAL_SALES
FROM ChocSales
GROUP BY Sales_Person
ORDER BY TOTAL_SALES

-- Maximum Sales using group by in country for Amount column
select Country, max([amount]) Maximum_Sales
from ChocSales
group by Country
order by Maximum_Sales


---This below query is for sum of product and group by with Product
select [PRODUCT], 
              sum([amount]) As Total_Sales
from ChocSales
group by [Product]
order by Total_Sales;

---This below query is for Minimum of product and group by with Product

select [PRODUCT], 
              Min([amount]) As Minimum_Sales
from ChocSales
group by [Product]
order by Minimum_Sales;


--Below query is showing top 3 months on the basis of amount in group by
select Top 3 Month([date]) as [Month], 
  Sum(amount) As [Sales_By_Month]
From ChocSales
Group by Month(Date)
order by Sales_By_Month  DESC

--Below query is showing top 3 country on the basis of amount in group by
SELECT Top 3 
   [Country],
   Sum(amount) as [total_sales]
from ChocSales
group by [Country]
order by [total_sales] desc

--Below query is showing top 5 Product on the basis of amount in group by
SELECT Top 5 
   [Product],
   Sum(amount) as [total_sales]
from ChocSales
group by [Product]
order by [total_sales] Desc;

--For bottom 5 or 3 we can just use "ASC" in order by
SELECT Top 5 
   [Product],
   Sum(amount) as [total_sales]
from ChocSales
group by [Product]
order by [total_sales] ASC;

--Top 5 Sales person by using group by
SELECT Top 5 
   [Sales_Person],
   Sum(amount) as [total_sales]
from ChocSales
group by [Sales_Person]
order by [total_sales] Desc;

----Topic 5 HAVING
--'HAVING' is used for filter out the data after 'Group by' it will used after AGGREGATE FUNCTION
--THIS WIL SHOW COUNTRY WHICH HAVING GREATER THAN 50 COUNTS OF ORDER
SELECT [COUNTRY],
     COUNT(*) AS TOTAL_ORDER
FROM ChocSales
GROUP BY [COUNTRY]
HAVING COUNT(*) > 50
ORDER BY TOTAL_ORDER DESC

--THIS WILL SHOW THE PRODUCT AVG WHICH IS HAVING GREATER THAN 200
SELECT [PRODUCT],
     AVG(AMOUNT) AS TOTAL_AVG
FROM ChocSales
GROUP BY [PRODUCT]
HAVING AVG(AMOUNT) > 200
ORDER BY TOTAL_AVG DESC

--THIS WILL SHOW THE SALES_PERSON SUM WHICH IS HAVING GREATER THAN 300000
SELECT Sales_Person
       ,SUM(AMOUNT) AS TOTAL_SALES
       FROM ChocSales
       GROUP BY Sales_Person
       HAVING SUM(AMOUNT) > 300000
	   
--THIS WILL SHOW YOU THE Boxes_Shipped BY Sales_Person WHICH HAVING BOXES SHIPPED GREATER THAN 8500	   
 SELECT Sales_Person
     ,SUM(Boxes_Shipped) AS TOTAL_BOXES
       FROM ChocSales
       GROUP BY Sales_Person
       HAVING SUM(Boxes_Shipped) > 8500

--THIS WILL SHOW YOU THE Boxes_Shipped BY COUNTRY WHICH HAVING BOXES SHIPPED GREATER THAN 15000	   
SELECT [Country]
      ,SUM(Boxes_Shipped) AS TOTAL_BOXES
      FROM ChocSales
      GROUP BY [Country]
      HAVING SUM(Boxes_Shipped) > 15000
      ORDER BY TOTAL_BOXES DESC
	  
	---This query will give us a answer of sales person total sales which range should having between 300000 to 350000 in desc order
	  SELECT [Sales_Person], SUM(Amount) As SalesbyPerson
   FROM ChocSales
   group by [Sales_Person]
   having Sum(Amount) between 300000 and 350000
   order by SalesbyPerson DESC
   
   
   ---This query will show us that we can use 2 different functions after or before having as we use sum before and after, also we can use other AGGREGATE function as well
   
   SELECT [COUNTRY], SUM(boxes_Shipped) As Total_Boxes
   FROM ChocSales
   group by [country]
   having Sum(Boxes_Shipped) > 500 And SUM(amount) > 30000
   
   
   --CLASS 4--CTE Common Text Expression ---IMPORTANT TOPIC----
----   
   With My_CTE AS(
SELECT Top 3[Sales_Person], SUM(Amount) As SalesbyPerson
   FROM ChocSales
   group by [Sales_Person]
   having Sum(Amount) between 300000 and 350000
   order by SalesbyPerson DESC
   )

   SELECT SUM(salesbyperson) AS Total_Sales_Top3
   From My_CTE
   
---below query is the solution of total avg sales by country by CTE   

 With TQ1 AS(
SELECT Top 3[Sales_Person], avg(Amount) As AvgPerson
   FROM ChocSales
   group by [Sales_Person]
   having AVG(amount) > 50
   order by AvgPerson DESC
   )

   Select avg(AvgPerson) As AvgTOP3
   From TQ1
   
   
---below query is the solution of total avg sales by country by CTE   
   With Tq1 As (
select [country], sum(amount) As TotalCountrySales
From ChocSales
Group by Country
   )
   Select AVG(totalcountrySales) as AvgSales
   From Tq1
   
   
   
 ---now below is the CTE query to solve the avg by country for which is higher than total sales 
   With Tq1 As (
select [country], sum(amount) As TotalCountrySales
From ChocSales
Group by Country
   )
   Select *
   From Tq1 
   where [TotalCountrySales] > (select avg(TotalCountrySales)
                                   from Tq1)
								   
								   
								   
								   
Topic 6 Over By
----Over function
----What is OVER() in SQL?

OVER() is used with window functions.

The key idea is:

--GROUP BY combines rows into fewer rows, while OVER() performs calculations across related rows without removing the individual rows.
---Sum with Over By or it can be product, sales_person, date also
select *, SUM([amount]) over() as total_sales
from ChocSales		

--Max with over By
select *, MAX([amount]) over() as Max_Sales
from ChocSales

--MIN with over By
select *, MIN([amount]) over() as Min_Sales
from ChocSales

---Count not null with over By
select *, Count([amount]) over() as Min_Sales_Not_Null
from ChocSales

--Avg With over By
select *, Avg([amount]) over() as Avg_total
from ChocSales

--All Count with over By
select *, Count(*) over() as Total_rows
from ChocSales			

Topic 7 Partition By			  
----What is PARTITION BY?
---PARTITION BY divides your data into groups for calculation, but unlike GROUP BY, it does not combine/remove the individual rows.
--Think of it as:
--"Calculate separately for each group, but keep every row."


--Sum with Partition By Country or it can be product, sales_person, date also
select *, SUM([amount]) over(partition by Country) as Country_Total
from ChocSales

--Max with Partition By
select *, MAX([amount]) over(partition by Country) as Country_Max
from ChocSales

--Min with Partition By
select *, MIN([amount]) over(partition by Country) as Country_MIN
from ChocSales

--Count with partition by
select *, Count([amount]) over(partition by Country) as Country_Count_NotNull
from ChocSales

--Count all with partition By
select *, Count(*) over(partition by Country) as Country_Count_All
from ChocSales




---This query will give us all sales over partion by month os sales
select *, sum([amount]) over(partition by month([date])) as Sales_by_month
from ChocSales


---This query will give us specific sales over partion by month os sales
select *, sum([amount]) over(partition by month([date])) as Sales_by_month
from ChocSales
where Month([Date]) = 1


---Topic 8 ROW_NUMBER - ----What is ROW_NUMBER()?

----ROW_NUMBER() is a SQL Window Function that assigns a unique sequential number to each row.

----Question 1 — Basic Ranking

Write a query to assign a row number to every sale based on Amount from highest to lowest.

Hint: ROW_NUMBER() + ORDER BY

SELECT Sales_Person,
       Country,
       Product,
       [Date],
       Amount,
       Boxes_Shipped,
       ROW_NUMBER() OVER(
           ORDER BY Amount DESC
       ) AS Row_Num
FROM ChocSales;


---OR---

SELECT *,
       ROW_NUMBER() OVER(
           ORDER BY Amount DESC
       ) AS Row_Num
FROM ChocSales;

----Question 2 — Ranking by Sales Person

For each Sales_Person, assign a row number to their sales based on Amount from highest to lowest.

Hint: Use PARTITION BY Sales_Person.

With Top_1 As(
select *,
row_number()
over(partition by Sales_person
    order by [amount] desc)
    as Sales_person_Ranks
    from ChocSales
    )

    Select *
    from Top_1
    where Sales_person_Ranks = 1
	
	
	---OR---
SELECT Sales_Person,
       Country,
       Product,
       [Date],
       Amount,
       Boxes_Shipped,
       ROW_NUMBER() OVER(
           PARTITION BY Sales_Person
           ORDER BY Amount DESC
       ) AS Row_Num
FROM ChocSales;

	
----Question 3 — Top Sale of Each Sales Person

Find the highest sale made by each Sales_Person using ROW_NUMBER().

Hint:

Use PARTITION BY Sales_Person
Use ORDER BY Amount DESC
Filter Row_Number = 1

SELECT *
FROM
(
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY Sales_Person
               ORDER BY Amount DESC
           ) AS Row_Num
    FROM ChocSales
) AS SalesData
WHERE Row_Num = 1;



----Logic to remember
PARTITION BY Sales_Person
        ↓
Separate each salesperson
        ↓
ORDER BY Amount DESC
        ↓
Highest sale gets Row_Num = 1
        ↓
WHERE Row_Num = 1
        ↓
Highest sale of each salesperson

Interview pattern:

ROW_NUMBER() OVER(
    PARTITION BY column
    ORDER BY column DESC
)

then use a subquery/CTE to filter the row number.



----Question 4 — Latest Sale by Each Country

Find the latest sale record for each Country using ROW_NUMBER().



SELECT *
FROM
(
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY Country
               ORDER BY [Date] DESC
           ) AS Row_Num
    FROM ChocSales
) AS CountrySales
WHERE Row_Num = 1;


----Question 5 — Top 2 Products by Sales Amount for Each Country

Find the top 2 sales records for each Country based on Amount.

SELECT *
FROM
(
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY Country
               ORDER BY Amount DESC
           ) AS Row_Num
    FROM ChocSales
) AS CountrySales
WHERE Row_Num <= 2;

---This will give us 7th or any nth rank number value
With T1 As(
select *,
row_number() over(order by [amount] desc)
as [Rank]
from ChocSales)

select *
from T1
where [Rank] = 7

----OR---- 

select *
from (
select *,
row_number() over(order by [amount] desc)
as [Rank]
from ChocSales)
As T1
where [rank] = 2 


---OR----
select *
from (
select *,
row_number() over(order by [amount] desc)
as [Rank]
from ChocSales)
As T1
where [rank] = 2 OR [rank] =7



---This Query will give us a latest or Highest Rank in the data on the basis of Amount column
select *,
row_Number() over(partition by Country
                  Order By [amount] Desc)
                  As [Big_Rank]
                  from ChocSales
				  
				  
----This Query will give us a Highest and lowest Rank in the data on the basis of Amount column
select *,
row_Number() over(partition by Country
                  Order By [amount] Desc)
                  As [Big_Rank]
              ,
                  row_Number() over(partition by Country
                  Order By [amount] Asc)
                  As [Small_Rank]
                  from ChocSales				  
				 
				 
---Topic 9 DENSE RANK
---DENSE RANK DENSE_RANK() assigns the same rank to tied values and does not leave gaps in the ranking sequence.
---For your SQL interview preparation, make sure you can clearly explain ROW_NUMBER() vs RANK() vs DENSE_RANK()—this is a very common window-function question.				 

SELECT *,
DENSE_RANK() OVER(ORDER BY Amount DESC)
FROM ChocSales


---Topic 10 NTILE
----NTILE() divides the rows into a specified number of approximately equal groups (buckets).

---THIS WILL PROVIDE US A QUARTILE RANKS DATA ACCORDING TO AMOUNT COLUMNS
SELECT *,
NTILE(4) OVER(ORDER BY [AMOUNT]) AS QUARTILE
FROM ChocSales

---THIS WILL GIVE US A RANK 1 DATA FROM THE QUARTILE RANKS
WITH TQ1 AS (
SELECT *,
NTILE(4) OVER(ORDER BY [AMOUNT]) AS QUARTILE
FROM ChocSales
)

SELECT *
FROM TQ1
WHERE QUARTILE = 1

-------Topic 11 Lead function
----LEAD() is a Window Function used to look at the value from a following row without using a self-join. In simple words:
--LEAD() lets you see the value from the next row.


--This will give us a next value & the last value of lead will take us to NULL
select *,
Lead([Amount]) over(order by [amount]) as Next_Values
From ChocSales

---This will give us a next sales date or order date. this will show us a time TRANSACTION data
SELECT Sales_Person,
       [Date],
       LEAD([Date]) OVER(
           PARTITION BY Sales_Person
           ORDER BY [Date]
       ) AS Next_Sale_Date
FROM ChocSales;


----Topic 12 LAG function
---LAG() is a Window Function that allows you to access a value from a previous row without using a self-join. In simple words:
--LAG() lets you look at the previous row's value.

--This will give us a Previous value based on amount & the Starting value of lag will take us to NULL
select *,
Lag([Amount]) over(order by [amount]) as Previous_Sales
From ChocSales

--This will give us a Previous value based on Date & the Starting value of lag will take us to NULL
SELECT *,
       LAG([Amount]) OVER(
           ORDER BY [date]
       ) AS Previous_Month_Sales
FROM ChocSales;




---This will give us a Running Sum of sales
	select *,
	Sum([amount]) over(order by [amount] 
					   Rows between Unbounded Preceding And Current Row) As [Running_Sales]
					   From ChocSales
					   
					  



---Topic 13 TEXT functions IN SQL

select 
Sales_person,Country,
len([Sales_person]) as Person_Length,
Upper([Sales_person]) as Upper_Names,
Lower([Sales_person]) as Lower_Names,
Left([Sales_person],5) as Left_5,
Right([Sales_person],4) as Right_4,
Trim([Sales_person]) as Trim_Names,
RTrim([Sales_person]) as Rtrim_Names,
LTrim([Sales_person]) as Ltrim_Names,
Concat(Sales_person,' ',Country) as Person_Country
From ChocSales


---Replace function application
SELECT [PRODUCT],
REPLACE ([Product],'Mint','Lemon') as Replace_word
from ChocSales
---In Date
SELECT [Date],
REPLACE ([Date],'-','/') as Replace_word
from ChocSales

---CHARINDEX WILL GIVE THE NUMBER OF CHARCTER OR INDEX OF CHARCTER
select CHARINDEX('A','Database')

---THIS WILL REVERSE THE CHARCTER OR words
SELECT REVERSE('VIKRANT')

---THIS WILL GIVES US A SPECIFIC CHARCTERS ACCORDING TO THE GIVEN INSTANCES
SELECT SUBSTRING('VIKRANT KUMAR',1,7)



--SQL Server 2025 introduced native regular-expression functions, so if you're using SQL Server 2025+, you have actual regex support.
--The main regex functions to know
REGEXP_LIKE()	Check whether text matches a regex pattern
REGEXP_COUNT()	Count regex matches
REGEXP_INSTR()	Find the position of a regex match
REGEXP_SUBSTR()	Extract text matching a regex
REGEXP_REPLACE()	Replace text using a regex

END

--TOPIC - 14
---UNION is used to combine the results of two or more SELECT queries into one result.

SELECT DISTINCT [SALES_PERSON]
FROM ChocSales

UNION

SELECT DISTINCT [COUNTRY]
FROM ChocSales

---UNION ALL is used to combine the results of two or more SELECT queries and keep all duplicate rows.
SELECT DISTINCT [SALES_PERSON]
FROM ChocSales

UNION ALL

SELECT DISTINCT [Sales_Person]
FROM ChocSales


--TOPIC - 15 CASE CASE is used in SQL to apply conditions and return different values based on those conditions.
---Think of it like IF / ELSE in programming.

SELECT [SALES_PERSON],       
   SUM([AMOUNT]) AS TOTAL_SALES,
   CASE 
   WHEN SUM([AMOUNT]) <100000 THEN 'LESS'
   WHEN SUM([AMOUNT]) <200000 THEN 'AVERAGE'
   WHEN SUM([AMOUNT]) <250000 THEN 'GOOD'
   ELSE 'VERY GOOD'
  END  AS SALES_PERFORMANCE
FROM ChocSales
GROUP BY [Sales_Person]
ORDER BY TOTAL_SALES DESC


--CASE-2---

SELECT [PRODUCT],
SUM([AMOUNT]) AS TOTAL_SALES_PRODUCT,

   CASE 
        WHEN SUM([Amount]) <100000 THEN 'LOW SALES'
        WHEN SUM([AMOUNT]) <200000 THEN 'AVERAGE SALES'
        WHEN SUM([AMOUNT]) <250000 THEN 'GOOD SALES'
        ELSE 'EXCELLENT'
        END AS PRODUCT_SALES
FROM ChocSales
GROUP BY [PRODUCT]
ORDER BY PRODUCT_SALES DESC


---CASE 3 GENERIC INTERVIEW QUESTION
SELECT        
   CASE 
   WHEN [AMOUNT] <5000 THEN 'LESS'
   WHEN [AMOUNT] <10000 THEN 'AVERAGE'
   WHEN [AMOUNT] <15000 THEN 'GOOD'
   ELSE 'VERY GOOD'
  END  AS AMOUNT_SLAB, COUNT(*) AS [COUNT]
FROM ChocSales
GROUP BY CASE 
   WHEN [AMOUNT] <5000 THEN 'LESS'
   WHEN [AMOUNT] <10000 THEN 'AVERAGE'
   WHEN [AMOUNT] <15000 THEN 'GOOD'
   ELSE 'VERY GOOD'
   END
   ORDER BY [COUNT] DESC
   
   
 ---CASE 4 FIND TOP 3 COUNTRIES WITH HIGHER COUNT 
   SELECT DISTINCT  TOP 3     
   CASE 
   WHEN [COUNTRY] ='INDIA' THEN 'IND'
   WHEN [COUNTRY] ='CANADA' THEN 'CAN'
   WHEN [COUNTRY] ='UK' THEN 'UK'
   WHEN [COUNTRY] = 'AUSTRALIA' THEN 'AUS'
   WHEN [COUNTRY] = 'NEW ZEALAND' THEN 'NZD'
   WHEN [COUNTRY] = 'USA' THEN 'USA'
   END AS COUNTRY_CODE, COUNT(*) AS [COUNTRY_COUNT]
   FROM ChocSales
   GROUP BY 
 CASE 
   WHEN [COUNTRY] ='INDIA' THEN 'IND'
   WHEN [COUNTRY] ='CANADA' THEN 'CAN'
   WHEN [COUNTRY] ='UK' THEN 'UK'
   WHEN [COUNTRY] = 'AUSTRALIA' THEN 'AUS'
   WHEN [COUNTRY] = 'NEW ZEALAND' THEN 'NZD'
   WHEN [COUNTRY] = 'USA' THEN 'USA'
   END
   ORDER BY COUNTRY_CODE ASC