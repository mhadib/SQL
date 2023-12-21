CREATE view  [dbo].VPasandazShakhsi
as 
select Keshvar, Gozashte 
from PasandazShakhsi b
where not exists(select 1 from [dbo].PasandazShakhsi b2 where b.keshvar = b2.keshvar and b2.createdate > b.createdate)
and gozashte < 100