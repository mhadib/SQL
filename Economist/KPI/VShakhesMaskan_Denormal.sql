--select * from VShakhesMaskan order by [رشد شاخص مسکن نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم] desc
create   view [dbo].[VShakhesMaskan_Denormal]
as
with cte as (
select s.Keshvar, s.Gozashte, s.Vahed, s.Marja, smh.[2005'] [2005], cast((s.Gozashte - smh.[2005'] )/smh.[2005'] *100 as decimal(20,1)) [رشد نسبت به سال 2005],
case when s.Keshvar = N'ایران' then 0.0193 
	 when s.Keshvar = N'ایالات متحده' then 1
else nb.[رشد نسبت به سال 2005] end [رشد نرخ برابری ارز نسبت به سال 2005]
from ShakhesMaskan S
join ShakhesMaskanHistorical smh on s.Keshvar = smh.keshvar
left join NerkheBarabariHistory na on  na.pname like N'%'+s.Keshvar+'%'
left join vNerkheBarabari nb on nb.PName like N'%'+dbo.RetreiveVahed(substring(na.pname,1,3))+'%'
where not exists(select 1 from ShakhesMaskan S2 where s.Keshvar = s2.Keshvar and s2.CreateDate > s.CreateDate)
),cte2 as(
select * ,
cast((Gozashte / 2.47) as decimal(20,0))
[شاخص مسکن در نقطه موجود به قیمت ثابت طلا در سال 2005]
from cte)
select * ,
 cast(cte2.[رشد نسبت به سال 2005] * (case when cte2.Keshvar = N'ایالات متحده' then 0 else
cte2.[رشد نرخ برابری ارز نسبت به سال 2005]/100 end + 1) as decimal(10,2))
[رشد شاخص مسکن نسبت به سال 2005 با تعدیل برابری نرخ ارز]
, cast(cte2.[رشد نسبت به سال 2005] * (
cte2.[رشد نرخ برابری ارز نسبت به سال 2005]/100 + 1) 
 * 0.64 as decimal(10,2)) [رشد شاخص مسکن نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم],

cast((([شاخص مسکن در نقطه موجود به قیمت ثابت طلا در سال 2005] - 
[2005]) / [2005])*100 as decimal(20,1))
[رشد شاخص مسکن در نقطه موجود نسبت به سال 2005 به قیمت ثابت طلا]
from cte2
