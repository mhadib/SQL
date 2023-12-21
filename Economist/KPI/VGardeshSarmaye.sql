CREATE view [dbo].[VGardeshSarmaye]
as
with cte
as(
select Keshvar, Gozashte [گردش سرمایه در نقطه موجود], dbo.RetreiveVahed(S.Vahed) [واحد], 
dbo.TabdilNerkheArzToMDollar(Gozashte, DollarDevids, s.Vahed, rate)
* ( case 
when ['Keshvar'] = N'ایالات متحده' then 1
when rtrim(ltrim(['دوره'])) = N'سه ماهه'  then 1.0 /3 
when rtrim(ltrim(['دوره'])) = N'دوازده ماهه'  then 1.0 /12 
	   
	   else 1 end) GozashteMDollar, tgju.PName, rate,  kh.['دوره'] 
from GardeshSarmaye S
left join vtgjuCurrency tgju on (dbo.RetreiveVahed(S.Vahed) = substring(rtrim(ltrim(pName)),1,3))
left join GardasheSarmayDoare kh on kh.['Keshvar'] = s.Keshvar
where not exists(select 1 from GardeshSarmaye S2 where s.Keshvar = s2.Keshvar and s2.CreateDate > s.CreateDate)
and s.Keshvar in (select ['keshvar'] from VKasriHesabeJari))
,cte2 as (
select Keshvar, [گردش سرمایه در نقطه موجود], [واحد], cast(isnull(GozashteMDollar,[گردش سرمایه در نقطه موجود])  as decimal(20,0)) [گردش سرمایه به ملیون دلار], ['دوره'] from cte
where Keshvar not like N'%مونت%' and Keshvar not like N'%منطقهیورو%'),
cte3 as(
select cte2.*,cast(case when [گردش سرمایه به ملیون دلار] > 0 then [گردش سرمایه به ملیون دلار] else 0 end /(select sum([گردش سرمایه به ملیون دلار]) from cte2 where [گردش سرمایه به ملیون دلار] > 0 )as decimal(20,3)) [نسبت از کل], 
   cast(case when [گردش سرمایه به ملیون دلار] < 0 then abs([گردش سرمایه به ملیون دلار]) else 0 end /(select sum([گردش سرمایه به ملیون دلار]) from cte2 where [گردش سرمایه به ملیون دلار] < 0 )as decimal(20,3)) [نسبت از کل منفی]from cte2)
select *
,   cast(SUM([نسبت از کل]) OVER(ORDER BY [نسبت از کل] desc) as decimal(4,2)) [جمع تجمعی]
from cte3 