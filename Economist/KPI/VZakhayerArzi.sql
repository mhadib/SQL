


CREATE view [dbo].[VZakhayerArzi]
as
with cte
as(
select Keshvar, Gozashte, dbo.RetreiveVahed(s.Vahed) Vahed, dbo.TabdilNerkheArzToMDollar(s.Gozashte, DollarDevids, s.Vahed, rate)
  GozashteMDollar,CreateDate
from ZakhayerArzi S
left join vtgjuCurrency tgju on (dbo.RetreiveVahed(s.Vahed) = substring(rtrim(ltrim(pName)),1,3))
where not exists(select 1 from ZakhayerArzi S2 where s.Keshvar = s2.Keshvar and s2.CreateDate > s.CreateDate)
and s.Keshvar in (select ['Keshvar'] from VKasriHesabeJari))
,cte2 as (
select  Keshvar, Gozashte, Vahed, isnull(GozashteMDollar,Gozashte) GozashteMDollar from cte
where Keshvar not like N'%مونت%' and Keshvar not like N'%منطقهیورو%')
,cte3 as (
select *,cast(case when GozashteMDollar > 0 then GozashteMDollar/(select sum(GozashteMDollar) from cte2 where GozashteMDollar > 0 ) else 0 end as decimal(4,2)) as NesbatAzKol from cte2)
select *,Sum(NesbatAzKol)Over(order by NesbatAzKol desc) Tajamoi  from cte3
--order by GozashteMDollar desc
