create view  [dbo].VMaliatBarSherkatHa
as 
select Keshvar, Gozashte 
from MaliatBarSherkatHa b
where not exists(select 1 from [dbo].MaliatBarSherkatHa b2 where b.keshvar = b2.keshvar and b2.createdate > b.createdate)
