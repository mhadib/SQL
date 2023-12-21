create view VAmaliatBazarBazDorei
as
with cte1month
as (
select N'یک ماهه' [دوره], sum(PazireNevisiDolati)/10 [پذیره نویسی دولتی], sum(AmaliatBazarBaaz)/10 [عملیات بازار باز], sum(Saayer)/10 [سایر]
from [dbo].[VAmareBazareBaazFaraBourse]
where cast(cast(tradedate as nvarchar(20))as date) > dateadd(day,-30,getdate())
), cte1day as (
select N'یک روزه' [دوره], sum(PazireNevisiDolati)/10 [پذیره نویسی دولتی], sum(AmaliatBazarBaaz)/10 [عملیات بازار باز], sum(Saayer)/10 [سایر]
from [dbo].[VAmareBazareBaazFaraBourse]
where cast(cast(tradedate as nvarchar(20))as date) > dateadd(day,-1,getdate())
), cte6month as (
select N'شش ماهه' [دوره], sum(PazireNevisiDolati)/10 [پذیره نویسی دولتی], sum(AmaliatBazarBaaz)/10 [عملیات بازار باز], sum(Saayer)/10 [سایر]
from [dbo].[VAmareBazareBaazFaraBourse]
where cast(cast(tradedate as nvarchar(20))as date) > dateadd(day,-180,getdate())
)
select *
from cte1day
union all
select * 
from cte1month 
union all 
select * 
from cte6month