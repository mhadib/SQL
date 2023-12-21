

CREATE   view  [dbo].[VTolidNaftKhaam]
as
with cte as (
select Keshvar, Gozashte 
from TolidNaftKhaam b
where not exists(select 1 from [dbo].TolidNaftKhaam b2 where b.keshvar = b2.keshvar and b2.createdate > b.createdate)
and b.Keshvar in (select ['Keshvar'] from VKasriHesabeJari)
),
cte2 as (
select *, cast(Gozashte/(select sum(Gozashte) from cte)  as decimal(6,5)) DarsadAzKol from cte)
select *, sum(DarsadAzKol)over (order by Darsadazkol desc ) Tajamoi from cte2

