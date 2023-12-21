
create view  [dbo].[VNerkheBahreBanki]
as 
select Keshvar, Gozashte 
from NerkheBahreBanki b
where not exists(select 1 from [dbo].NerkheBahreBanki b2 where b.keshvar = b2.keshvar and b2.createdate > b.createdate)
