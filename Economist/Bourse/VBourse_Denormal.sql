


--select * from VBourse_Denormal
CREATE   view [dbo].[VBourse_Denormal]
as
with cte as (
select 
--case 
--when Name = N'tasi' then N'عربستان سعودی'
--when Name = N'eu50' then N'منطقه یورو'
--when Name = N'gb100' then N'انگلیس'
--when Name = N'catsx' then N'کانادا'
--when Name = N'Au200' then N'استرالیا'
--when name = N'SHANGHAI' then N'چین' 
--when name = N'JP225' then N'ژاپن'
--when name = N'IT40' then N'ایتالیا'
--when name = N'DE40' then N'آلمان'
--when name = N'BIST100' then N'ترکیه'
--when name = N'MOEX' then N'روسیه'
--when name = N'US30' then N'ایالات متحده'
--end 
b2.Keshvar
Name
, case when b2.Keshvar = N'ایران' then 1956000 else [index] end [index],
--case 
--when Name = N'tasi' then 16568
--when Name = N'eu50' then 2820
--when Name = N'gb100' then 5739
--when Name = N'catsx' then 10145
--when Name = N'Au200' then 4142
--when name = N'SHANGHAI' then 1178
--when name = N'JP225' then 14967
--when name = N'IT40' then 33366
--when name = N'DE40' then 4620
--when name = N'BIST100' then 210
--when name = N'MOEX' then 820
--when name = N'US30' then 10160
--end [2005],
b2.[ارزش بورس] [2005],
case 
when b.Name = N'tasi' then 8153
when b.Name = N'eu50' then 3752
when b.Name = N'gb100' then 7492
when b.Name = N'catsx' then 17099
when b.Name = N'Au200' then 6767
when b.name = N'SHANGHAI' then 3019
when b.name = N'JP225' then 23604
when b.name = N'IT40' then 23822
when b.name = N'DE40' then 13287
when b.name = N'BIST100' then 1153
when b.name = N'MOEX' then 3058
when b.name = N'US30' then 29762
end [2019],

b.Name [BoursName],
--cast((b.[Index] /  3.47) as decimal(20,0)) [شاخص بورس به قیمت ثابت طلا در سال 2005],
case when b2.Keshvar = N'ایران' then 1.8569
	 when b2.Keshvar = N'ایالات متحده' then 1
else nb.[رشد نسبت به سال 2005] end [رشد نرخ برابری ارز نسبت به سال 2005]

--select * 
from Bourse b
left join Bourse2005 b2 on b.Name = b2.[نام تجاری ]
left join NerkheBarabariHistory na on  na.pname like N'%'+b2.Keshvar+'%'
left join vNerkheBarabari nb on nb.PName like N'%'+dbo.RetreiveVahed(substring(na.pname,1,3))+'%'
where b2.Keshvar in (select ['Keshvar'] from VKasriHesabeJari) and 
not exists(select 1 from Bourse b2 where b.[name] = b2.[name] and b2.createdate > b.createdate)
--and not exists(select 1 from Naghdinegi na2 where na.Keshvar = na2.Keshvar and na.createdate > na2.createdate)
)
select [Name]
,[index]
,[2005]
,[2019]
,BoursName
--,[شاخص بورس به قیمت ثابت طلا در سال 2005],
--cast(case when  [2005] != 0 then ([شاخص بورس به قیمت ثابت طلا در سال 2005] - [2005])/[2005] else 0 end as decimal(5,2)) [رشد شاخص بورس در نقطه موجود نسبت به سال 2005 به قیمت ثابت طلا]
,case when [2005] != 0 then cast(([index] - [2005])/[2005]*100 as decimal(10,2)) else null end [رشد نسبت به 2005],
[رشد نرخ برابری ارز نسبت به سال 2005],
cast(case when [2005] != 0 then (([index] - [2005])/[2005]*100) else null end * (case when cte.name = N'ایالات متحده' then 0 else 
[رشد نرخ برابری ارز نسبت به سال 2005]/100 end + case when cte.Name = N'ایران' then 0 else 1 end) as decimal(10,2))
[رشد شاخص بورس نسبت به سال 2005 با تعدیل برابری نرخ ارز],
cast(case when [2005] != 0 then ([index] - [2005])/[2005]*100  else null end * (
[رشد نرخ برابری ارز نسبت به سال 2005]/100 + case when cte.Name = N'ایران' then 0 else 1 end) 
 * 0.64 as decimal(10,2)) [رشد شاخص بورس نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم],
case when [2019] != 0 then cast(([index] - [2019])/[2019] *100 as decimal(10,2)) else null end [رشد نسبت به 2019]

from cte
