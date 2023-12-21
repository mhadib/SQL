

CREATE   view  [dbo].[VTolidKhodro]
as
with cte as (
select Keshvar, case when  Vahed = N'صدواحد' then Gozashte *  100 
when  Vahed = N'هزارواحد' then Gozashte *  1000 
when  Vahed = N'میلیونواحد' then Gozashte *  1000000 
when  Vahed = N'دههزارواحد' then Gozashte *  10000 
else Gozashte
end Gozashte ,Vahed
from TolidKhodro b
where not exists(select 1 from [dbo].TolidKhodro b2 where b.keshvar = b2.keshvar and b2.createdate > b.createdate)
and b.Keshvar in (select ['Keshvar'] from VKasriHesabeJari)),

cte2 as (
select *, cast(Gozashte/(select sum(Gozashte) from cte)  as decimal(6,5)) DarsadAzKol from cte)
select *, sum(DarsadAzKol)over (order by Darsadazkol desc ) Tajamoi from cte2

