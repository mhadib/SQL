
Create view  [dbo].[VMaliatBarForoush]
as 
select Keshvar, Gozashte 
from MaliatBarForoush b
where not exists(select 1 from [dbo].MaliatBarForoush b2 where b.keshvar = b2.keshvar and b2.createdate > b.createdate)
