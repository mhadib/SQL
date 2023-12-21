

create VIEW [dbo].[P_CalcDayCountInBalanceSheetTalfighiCategurCashflow_FaraBourse]
AS
with cte as (
select distinct cast(createDate as date) CreateDate
from [BalanceSheetTalfighiCategurCashflow_FaraBourse]),
cte365 as(
select count(CreateDate) cnt
from cte
where DATEADD(Day,365,CreateDate) > GETDATE()),
cte180 as(
select count(CreateDate) cnt
from cte
where DATEADD(Day,180,CreateDate) > GETDATE()),
cte90 as(
select count(CreateDate) cnt
from cte
where DATEADD(Day,90,CreateDate) > GETDATE()),
cte60 as(
select count(CreateDate) cnt
from cte
where DATEADD(Day,60,CreateDate) > GETDATE()),
cte30 as(
select count(CreateDate) cnt
from cte
where DATEADD(Day,30,CreateDate) > GETDATE()),
cte14 as(
select count(CreateDate) cnt
from cte
where DATEADD(Day,14,CreateDate) > GETDATE()),
cte7 as(
select count(CreateDate) cnt
from cte
where DATEADD(Day,7,CreateDate) > GETDATE()),
cte3 as(
select count(CreateDate) cnt
from cte
where DATEADD(Day,3,CreateDate) > GETDATE())
select cte365.cnt CNT365, cte180.cnt CNT180
, cte90.cnt CNT90, cte60.cnt CNT60, cte30.cnt CNT30, cte14.cnt CNT14, cte7.cnt CNT7, cte3.cnt CNT3
from cte365
JOIN cte180 ON 1 = 1
JOIN cte90 ON 1 = 1
JOIN cte60 ON 1 = 1
JOIN cte30 ON 1 = 1
JOIN cte14 ON 1 = 1
JOIN cte7 ON 1 = 1
JOIN cte3 ON 1 = 1

