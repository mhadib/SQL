


CREATE view [dbo].[vVaamBeBakhsheKhosusi]
as
with cte
as(
select Keshvar, Gozashte,dbo.RetreiveVahed(S.Vahed) Vahed, 
dbo.TabdilNerkheArzToMDollar(Gozashte, DollarDevids, Vahed, rate)
GozashteMDollar,rate
from VaamBeBakhsheKhosusi S
left join vtgjuCurrency tgju on (dbo.RetreiveVahed(S.Vahed) = substring(rtrim(ltrim(pName)),1,3))-- or ltrim(rtrim(tgju.PName)) like N'%'+ltrim(rtrim(s.Keshvar))+'%'
--left join vtgjuCurrency tgju2 on tg like N'''%'+s.Keshvar+'%'''
where not exists(select 1 from VaamBeBakhsheKhosusi S2 where s.Keshvar = s2.Keshvar and s2.CreateDate > s.CreateDate)
and s.Keshvar in (select ['Keshvar'] from VKasriHesabeJari)
)
,cte2 as (
select  Keshvar, Gozashte, Vahed, cast(isnull(GozashteMDollar,Gozashte)as decimal(20,0)) GozashteMDollar,rate from cte
where Keshvar not like N'%مونت%' and Keshvar not like N'%منطقهیورو%')
, cte3 as(
select *,cast(case when GozashteMDollar > 0 then GozashteMDollar/(select sum(GozashteMDollar) from cte2 where GozashteMDollar > 0 ) else 0 end as decimal(6,4)) as NesbatAzKol 
from cte2)
select *,Sum(NesbatAzKol)Over(order by NesbatAzKol desc) Tajamoi from cte3
--order by GozashteMDollar desc
