USE BMW;

go
create or alter view Total_Revenue AS
SELECT
	SUM(REVENUE) AS Total_Revenue
FROM
	BMW_Sales_Data;

go
create or alter view Average_Revenue AS
select
    round(avg(revenue),2) as AVG_Revenue
from
    BMW_Sales_Data;

go
create or alter view Total_Quantity AS
select
	sum(Quantity_Sold) AS Total_Quantity
from
	BMW_Sales_Data;

go
create or alter view Total_Revenue_By_Models AS
select
	(sum(revenue)) as Total_Revenue,(Model)
from
	BMW_Sales_Data
group by
	Model;

go
create or alter view Average_Revenue_By_Model AS
select
    round(avg(revenue),2) as AVG_Revenue,Model
from
    BMW_Sales_Data
group by
    model;

go
create or alter view Average_Revenue_By_Country AS
select
    round(avg(revenue),2) as AVG_Revenue,Country
from
    BMW_Sales_Data
group by
    country;

go
create or alter view Average_Revenue_By_Region AS
select
    round(avg(revenue),2) as AVG_Revenue,region
from
    BMW_Sales_Data
group by
    Region;

go
create or alter view Average_Revenue_By_Year AS
select
    round(avg(revenue),2) as AVG_Revenue,Year
from
    BMW_Sales_Data
group by
    Year;

go
create or alter view Average_Revenue_By_Channel AS
select
    round(avg(revenue),2) as AVG_Revenue,Channel
from
    BMW_Sales_Data
group by
    Channel;

go
create or alter view Total_Revenue_By_Year AS
select
	sum(revenue) as Total_Revenue,year
from
	BMW_Sales_Data
group by
	year;
	
go
create or alter view Total_Quantity_By_model AS
select
	sum(Quantity_Sold) as Total_Quantity,Model
from
	BMW_Sales_Data
group by
	Model;

go
create or alter view Total_Quantity_By_Year AS
select
	sum(Quantity_Sold) as Total_Quantity,year
from
	BMW_Sales_Data
group by
	year;

go
create or alter view Total_Revenue_By_Region AS
select
	sum(Revenue) as Total_Revenue,Region
from
	BMW_Sales_Data
group by
	Region;

go
create or alter view Total_Quantity_By_Region AS
select
	sum(Quantity_Sold) as Total_Quantity,Region
from
	BMW_Sales_Data
group by
	Region;

go
create or alter view Total_Quantity_By_Channel AS
select
	sum(Quantity_Sold) as Total_Quantity,Channel
from
	BMW_Sales_Data
group by
	Channel;

go
create or alter view Total_Revenue_By_Channal AS
select
	sum(Revenue) as Total_Revenue,Channel
from
	BMW_Sales_Data
group by
	Channel;

go
create or alter view Total_Quantity_By_Country AS
select
	sum(Quantity_Sold) as Total_Quantity,Country
from
	BMW_Sales_Data
group by
	country;

go
create or alter view Total_Revenue_By_Country AS
select
	sum(Revenue) as Total_Revenue,Country
from
	BMW_Sales_Data
group by
	Country;
go
CREATE OR ALTER VIEW Yearly_Trend_Total_Revenue AS
SELECT 
    YEAR(date) AS Year_Number,
    SUM(Revenue) AS Total_Revenue,
    SUM(Revenue * Quantity_Sold) AS Total_Value
FROM BMW_Sales_Data
GROUP BY 
    YEAR(date);
go
CREATE OR ALTER VIEW Yearly_Trend_Total_Revenue AS
SELECT
    YEAR([date]) AS Year_Number,                           -- —ﬁ„ «·”‰… (INT)
    DATEFROMPARTS(YEAR([date]), 1, 1) AS Year_Start_Date, --  «—ÌŒ »œ«Ì… «·”‰… (Date) -> „„ «“ ·· — Ì»
    SUM(Revenue) AS Total_Revenue,
    SUM(Revenue * Quantity_Sold) AS Total_Value
FROM BMW_Sales_Data
GROUP BY 
    YEAR([date]),
    DATEFROMPARTS(YEAR([date]), 1, 1);



go
CREATE OR ALTER VIEW Monthly_Trend_Total_Revenue AS
SELECT 
    DATEPART(MONTH, Date) AS Month_Num,
    DATENAME(MONTH, Date) AS Month_Name,
    sum( Revenue) AS Total_Revenue,
    sum(REVENUE * Quantity_Sold) AS Total_Value
FROM BMW_Sales_Data
GROUP BY DATENAME(MONTH, Date), DATEPART(MONTH, Date);

go
CREATE OR ALTER VIEW Monthly_Trend_Total_Quantity AS
SELECT 
    DATEPART(MONTH, Date) AS Month_Num,
    DATENAME(MONTH, Date) AS Month_Name,
    sum( Quantity_Sold) AS Total_Quantity
FROM BMW_Sales_Data
GROUP BY DATENAME(MONTH, Date), DATEPART(MONTH, Date);

go
CREATE OR ALTER VIEW Daily_Trend_Total_Revenue AS
SELECT 
    DATEPART(WEEKDAY, date) AS Day_Num,
    DATENAME(WEEKDAY, date) AS Order_day,
    sum(revenue) AS Total_Revenue,
    sum(REVENUE * Quantity_Sold) AS Total_Value
FROM BMW_Sales_Data
GROUP BY DATENAME(WEEKDAY, date), DATEPART(WEEKDAY, date);

go
CREATE OR ALTER VIEW Daily_Trend_Total_Quantity AS
SELECT 
    DATEPART(WEEKDAY, date) AS Day_Num,
    DATENAME(WEEKDAY, date) AS Order_day,
    sum(Quantity_Sold) AS Total_Quantity
FROM BMW_Sales_Data
GROUP BY DATENAME(WEEKDAY, date), DATEPART(WEEKDAY, date);

go
CREATE OR ALTER VIEW Pct_Revenue_By_Model AS
SELECT 
    Model,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(
        SUM(Revenue) * 100.0 /
        (SELECT SUM(Revenue) FROM BMW_Sales_Data),
    2) AS PCT
FROM BMW_Sales_Data
GROUP BY Model;

go
CREATE OR ALTER VIEW Pct_Quantity_By_Model AS
SELECT 
    Model,
    ROUND(SUM(Quantity_Sold), 2) AS Total_Quantity,
    ROUND(
        SUM(Quantity_Sold) * 100.0 /
        (SELECT SUM(Quantity_Sold) FROM BMW_Sales_Data),
    2) AS PCT
FROM BMW_Sales_Data
GROUP BY Model;

go
CREATE OR ALTER VIEW Top10_BMW_ModelS_By_Revenue AS
SELECT TOP 10
    MODEL,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM BMW_Sales_Data
GROUP BY MODEL
ORDER BY Total_Revenue DESC;

go
CREATE OR ALTER VIEW Top5_BMW_ModelS_By_Revenue AS
SELECT TOP 5
    MODEL,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM BMW_Sales_Data
GROUP BY MODEL
ORDER BY Total_Revenue DESC;

go
CREATE OR ALTER VIEW Top10_BMW_ModelS_By_Quantity AS
SELECT TOP 10
    MODEL,
    ROUND(SUM(Quantity_Sold), 2) AS Total_Quantity
FROM BMW_Sales_Data
GROUP BY MODEL
ORDER BY Total_Quantity DESC;

go
CREATE OR ALTER VIEW Top5_BMW_ModelS_By_Quantity AS
SELECT TOP 5
    MODEL,
    ROUND(SUM(Quantity_Sold), 2) AS Total_Quantity
FROM BMW_Sales_Data
GROUP BY MODEL
ORDER BY Total_Quantity DESC;

go
CREATE OR ALTER VIEW Bottom10_BMW_ModelS_By_Revenue AS
SELECT TOP 10
    MODEL,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM BMW_Sales_Data
GROUP BY MODEL
ORDER BY Total_Revenue ASC;

go
CREATE OR ALTER VIEW Bottom5_BMW_ModelS_By_Revenue AS
SELECT TOP 5
    MODEL,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM BMW_Sales_Data
GROUP BY MODEL
ORDER BY Total_Revenue ASC;

go
CREATE OR ALTER VIEW Bottom10_BMW_ModelS_By_Quantity AS
SELECT TOP 10
    MODEL,
    ROUND(SUM(Quantity_Sold), 2) AS Total_Quantity
FROM BMW_Sales_Data
GROUP BY MODEL
ORDER BY Total_Quantity ASC;

go
CREATE OR ALTER VIEW Bottom5_BMW_ModelS_By_Quantity AS
SELECT TOP 5
    MODEL,
    ROUND(SUM(Quantity_Sold), 2) AS Total_Quantity
FROM BMW_Sales_Data
GROUP BY MODEL
ORDER BY Total_Quantity ASC;

go
create or alter view Total_Value AS
SELECT
	SUM(REVENUE * Quantity_Sold) AS Total_Value
FROM
	BMW_Sales_Data;

go
create or alter view Total_Value_By_Year AS
SELECT
	SUM(REVENUE * Quantity_Sold) AS Total_Value,Year
FROM
	BMW_Sales_Data
group by
    year;

go
create or alter view Total_Value_By_Country AS
SELECT
	SUM(REVENUE * Quantity_Sold) AS Total_Value,COUNTRY
FROM
	BMW_Sales_Data
group by
    Country;

go
create or alter view Total_Value_By_Region AS
SELECT
	SUM(REVENUE * Quantity_Sold) AS Total_Value,region
FROM
	BMW_Sales_Data
group by
    region;

go
create or alter view Total_Value_By_Model AS
SELECT
	SUM(REVENUE * Quantity_Sold) AS Total_Value,model
FROM
	BMW_Sales_Data
group by
    model;

go
create or alter view Total_Value_By_Channel AS
SELECT
	SUM(REVENUE * Quantity_Sold) AS Total_Value,channel
FROM
	BMW_Sales_Data
group by
    channel;


