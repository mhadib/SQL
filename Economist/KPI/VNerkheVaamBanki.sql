create view  [dbo].VNerkheVaamBanki
as 
select Keshvar, Gozashte 
from NerkheVaamBanki b
where not exists(select 1 from [dbo].NerkheVaamBanki b2 where b.keshvar = b2.keshvar and b2.createdate > b.createdate)