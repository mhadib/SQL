create view  [dbo].VMaliatBarDaramadShakhsi
as 
select Keshvar, Gozashte 
from MaliatBarDaramadShakhsi b
where not exists(select 1 from [dbo].MaliatBarDaramadShakhsi b2 where b.keshvar = b2.keshvar and b2.createdate > b.createdate)