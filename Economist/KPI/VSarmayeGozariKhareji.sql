


--select * from VSarmayeGozariKhareji
CREATE view [dbo].[VSarmayeGozariKhareji]
as
with cte
as(
select Keshvar, Gozashte [سرمایه گذاری خارجی در نقطه موجود],  dbo.RetreiveVahed(S.Vahed) [واحد], dbo.TabdilNerkheArzToMDollar(Gozashte, DollarDevids, s.Vahed, rate)
* ( case when rtrim(ltrim(['دوره'])) = N'سه ماهه' and Keshvar != N'چین' then 1.0 /3 
       when rtrim(ltrim(['دوره'])) = N'دوازده ماهه'  then 1.0 /12 
	   else 1 end)   [سرمایه گذاری خارجی به ملیون دلار]
from SarmayeGozariKhareji S
left join vtgjuCurrency tgju on ( dbo.RetreiveVahed(S.Vahed) = substring(rtrim(ltrim(pName)),1,3))
left join VKasriHesabeJari k on k.['Keshvar'] = s.Keshvar
where not exists(select 1 from SarmayeGozariKhareji S2 where s.Keshvar = s2.Keshvar and s2.CreateDate > s.CreateDate)
and s.Keshvar in (select ['Keshvar'] from VKasriHesabeJari)
)
,cte2 as (
select  Keshvar, [سرمایه گذاری خارجی در نقطه موجود], [واحد], cast(isnull([سرمایه گذاری خارجی به ملیون دلار],[سرمایه گذاری خارجی در نقطه موجود])as decimal(20,0)) [سرمایه گذاری خارجی به ملیون دلار] from cte

where Keshvar not like N'%مونت%' and Keshvar not like N'%منطقهیورو%')
,cte3 as
(select *,cast(case when [سرمایه گذاری خارجی به ملیون دلار] > 0 then [سرمایه گذاری خارجی به ملیون دلار]/(select sum([سرمایه گذاری خارجی به ملیون دلار]) from cte2 where [سرمایه گذاری خارجی به ملیون دلار] > 0 ) else 0 end as decimal(4,2)) as [نسبت از کل],
cast(case when [سرمایه گذاری خارجی به ملیون دلار] < 0 then abs([سرمایه گذاری خارجی به ملیون دلار])/(select sum([سرمایه گذاری خارجی به ملیون دلار]) from cte2 where [سرمایه گذاری خارجی به ملیون دلار] < 0 ) else 0 end as decimal(4,2)) as [نسبت از کل منفی]
from cte2)
select *
,   cast(SUM([نسبت از کل]) OVER(ORDER BY [نسبت از کل] desc) as decimal(4,2)) [جمع تجمعی]
from cte3 
