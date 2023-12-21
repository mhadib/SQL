create view  [dbo].[VBedehiDolatBeTolidNakhales]
as 
select Keshvar, Gozashte 
from [dbo].[BedehiDolatBeTolidNakhales] b
where not exists(select 1 from [dbo].[BedehiDolatBeTolidNakhales] b2 where b.keshvar = b2.keshvar and b2.createdate > b.createdate)