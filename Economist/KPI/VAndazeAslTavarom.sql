create view  [dbo].VAndazeAslTavarom
as 
select Keshvar, Gozashte 
from AndazeAslTavarom b
where not exists(select 1 from [dbo].AndazeAslTavarom b2 where b.keshvar = b2.keshvar and b2.createdate > b.createdate)