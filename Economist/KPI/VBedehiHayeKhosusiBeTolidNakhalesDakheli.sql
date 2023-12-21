
CREATE view [dbo].[VBedehiHayeKhosusiBeTolidNakhalesDakheli]
as
select Keshvar, Gozashte , CreateDate
from BedehiHayeKhosusiBeTolidNakhalesDakheli S
where not exists(select 1 from BedehiHayeKhosusiBeTolidNakhalesDakheli S2 where s.Keshvar = s2.Keshvar and s2.CreateDate > s.CreateDate)
and s.Keshvar in (select ['Keshvar'] from VKasriHesabeJari)
--order by GozashteMDollar desc
