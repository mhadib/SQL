





CREATE view [dbo].[vtgjuCurrency] as 
with cte as (
select replace(replace(replace(Name,N'usd/',N''),N'/usd',N''),N'usd',N'')PName,
case when t.Name like N'usd%' then 1 else 0 end DollarDevids,*
from tgjuCurrency t
where not exists(select 1 from tgjuCurrency t2 where t.[name] = t2.[name] and t2.CurrentDate > t.CurrentDate) 
)
select * 
from cte c
where not exists(select 1 from cte c2 where left(c.pname,3) = left(c2.PName,3) and c.DollarDevids > c2.DollarDevids)

union all select N'USD', 0, 1 , N'USDUSD',1,getdate() 

