create   view [dbo].[VNaghdinegi_PreProcess]
as 
with cte as(
select Na.Id, Na.Keshvar, Na.['گذشته'] [نقدینگی در نقطه موجود], Na.['قبلی'], Na.['مرجع'], Na.['واحد'], Nh.['2005'], Nh.['2019'], cast((Na.['گذشته'] - Nh.['2005'])/Nh.['2005']*100 as decimal(20,2)) ['رشد نقدینگی نسبت به 2005'],cast((Na.['گذشته'] - Nh.['2019'])/nh.['2019']*100 as decimal(20,1)) ['رشد نقدینگی نسبت به 2019'], dbo.RetreiveVahed(na.['واحد']) [واحد], 
cast(dbo.TabdilNerkheArzToMDollar(na.['گذشته'], DollarDevids, na.['واحد'], rate) as decimal(30,0)) [نقدینگی به ملیون دلار],
dbo.TabdilNerkheArzToMDollar(cast(nh.['2005'] as decimal(30,2)), 0, na.['واحد'], nb.[نرخ برابری در سال 2005]) [نقدینگی در سال 2005 به ملیون دلار], 
nb.[نرخ برابری در سال 2005],
case when na.Keshvar = N'ایران' then 0.0193 
	 when na.Keshvar = N'ایالات متحده' then 1
else nb.[رشد نسبت به سال 2005] end [رشد نرخ برابری ارز نسبت به سال 2005]

from Naghdinegi Na
left join NaghdinegiHistorical nh on na.Keshvar = nh.Keshvar
left join NerkheBarabariHistory nah on  nah.pname like N'%'+na.Keshvar+'%'
left join vNerkheBarabari nb on nb.PName like N'%'+dbo.RetreiveVahed(substring(nah.pname,1,3))+'%'
left join vtgjuCurrency tgju on (dbo.RetreiveVahed(nb.PName) = substring(rtrim(ltrim(tgju.pName)),1,3)) 
--select * from vNerkheBarabari
where not exists(select 1 from Naghdinegi n where n.Keshvar = na.Keshvar and n.CreateDate > na.CreateDate)
)
,cte2 as(
select *, cast(case when [نقدینگی به ملیون دلار] > 0 then cast([نقدینگی به ملیون دلار] as float)/(select sum([نقدینگی به ملیون دلار]) from cte where [نقدینگی به ملیون دلار] > 0 ) else 0 end as decimal(4,2)) as  [نسبت از کل], 

cast([نقدینگی در سال 2005 به ملیون دلار] / 535 as decimal(10,0))
[نقدینگی در سال 2005 به  ملیون انس طلا],

cast([نقدینگی به ملیون دلار] / 1857 as decimal(10,0))
[نقدینگی در نقطه موجود به ملیون انس طلا]  
from cte), cte3 as(
select cte2.*

,vb.[تراز بانک مرکزی به ملیون دلار], vb.[تراز بانک مرکزی سال2005], vb.[تراز بانک مرکزی در سال 2005 به  ملیون انس طلا], vb.[تراز بانک مرکزی در نقطه موجود به ملیون انس طلا], vb.[رشد تراز بانک مرکزی  نسبت به سال 2005 به ملیون انس طلا], 
cast(case when [نقدینگی در سال 2005 به  ملیون انس طلا]  != 0 then 
([نقدینگی در نقطه موجود به ملیون انس طلا]  - [نقدینگی در سال 2005 به  ملیون انس طلا]) /[نقدینگی در سال 2005 به  ملیون انس طلا] else 0 end as decimal(10,3)) [رشد نقدینگی نسبت به سال 2005 به ملیون انس طلا]
,   cast(SUM(cte2.[نسبت از کل]) OVER(ORDER BY cte2.[نسبت از کل] desc) as decimal(4,2)) [جمع تجمعی]
from cte2
join VBankMarkazi vb on cte2.Keshvar = vb.Keshvar
)
select cte3.Id
, cte3.[Keshvar]
, cte3.[نقدینگی در نقطه موجود]
, cte3.['قبلی']
, cte3.['مرجع']
, cte3.['واحد']
, cte3.['2005']
, cte3.['2019']
, cte3.['رشد نقدینگی نسبت به 2005']
, cte3.[رشد نرخ برابری ارز نسبت به سال 2005]
, cast(cte3.['رشد نقدینگی نسبت به 2005'] * (case when cte3.Keshvar = N'ایالات متحده' then 0 else
cte3.[رشد نرخ برابری ارز نسبت به سال 2005]/100 end + 1) as decimal(10,2))
[رشد نقدینگی نسبت به سال 2005 با تعدیل برابری نرخ ارز]
, cast(cte3.['رشد نقدینگی نسبت به 2005'] * (
cte3.[رشد نرخ برابری ارز نسبت به سال 2005]/100 + 1) 
 * 0.44 as decimal(10,2)) [رشد نقدینگی نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم]

, cte3.['رشد نقدینگی نسبت به 2019']
, cte3.[واحد]
, cte3.[نقدینگی به ملیون دلار]
, cte3.[نقدینگی در سال 2005 به ملیون دلار]
, cte3.[نرخ برابری در سال 2005]

, cte3.[نقدینگی در سال 2005 به  ملیون انس طلا]
, cte3.[نقدینگی در نقطه موجود به ملیون انس طلا]
, cte3.[تراز بانک مرکزی به ملیون دلار]
, cte3.[تراز بانک مرکزی سال2005]
, cte3.[تراز بانک مرکزی در سال 2005 به  ملیون انس طلا]
, cte3.[تراز بانک مرکزی در نقطه موجود به ملیون انس طلا]
, cte3.[رشد تراز بانک مرکزی  نسبت به سال 2005 به ملیون انس طلا]
, cte3.[رشد نقدینگی نسبت به سال 2005 به ملیون انس طلا]
, cte3.[نسبت از کل]
, cte3.[جمع تجمعی]
from cte3
