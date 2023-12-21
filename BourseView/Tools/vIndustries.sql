create   view vIndustries
as 
select * 
from Industries b
where not exists(select 1 from Industries b2 where b.Code = b2.Code and b2.CreateDate > b.CreateDate)
