create view  [dbo].VBedehiKhanevarBeDaramad
as 
select Keshvar, Gozashte 
from BedehiKhanevarBeDaramad b
where not exists(select 1 from [dbo].BedehiKhanevarBeDaramad b2 where b.keshvar = b2.keshvar and b2.createdate > b.createdate)
