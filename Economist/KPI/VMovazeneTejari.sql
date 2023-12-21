
--select * from VMovazeneTejari
CREATE view [dbo].[VMovazeneTejari]
as
with cte
as(
select Keshvar, Gozashte, dbo.RetreiveVahed(S.Vahed) Vahed, 
dbo.TabdilNerkheArzToMDollar (Gozashte , DollarDevids , Vahed , rate ) GozashteMDollar,CreateDate
from MovazeneTejari S
left join vtgjuCurrency tgju on dbo.RetreiveVahed(S.Vahed) = substring(rtrim(ltrim(pName)),1,3)
where not exists(select 1 from MovazeneTejari S2 where s.Keshvar = s2.Keshvar and s2.CreateDate > s.CreateDate)
and s.Keshvar in (select ['Keshvar'] from VKasriHesabeJari))
,cte2 as (
select  Keshvar, Gozashte, Vahed, isnull(GozashteMDollar,Gozashte) GozashteMDollar from cte)
,cte3 as (
select *,case when GozashteMDollar > 0 then GozashteMDollar/(select sum(GozashteMDollar) from cte2 where GozashteMDollar > 0 ) else 0 end as NesbatAzKol from cte2)
select Keshvar, Gozashte [موازنه تجاری در نقطه موجود], Vahed [واحد], cast(GozashteMDollar as decimal(20, 0)) [گذشته به ملیون دلار], cast(NesbatAzKol as decimal(20, 2))[نسبت از کل], cast(Sum(NesbatAzKol)Over(order by NesbatAzKol desc) as decimal(4,2)) [جمع تجمعی]  from cte3
--order by GozashteMDollar desc
