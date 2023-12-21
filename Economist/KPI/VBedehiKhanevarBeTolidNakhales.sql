create view VBedehiKhanevarBeTolidNakhales
as
select Keshvar, Gozashte
from BedehiKhanevarBeTolidNakhales b
where not exists(select 1 from BedehiKhanevarBeTolidNakhales b2 where b.Keshvar = b2.Keshvar and b2.CreateDate > b.CreateDate)