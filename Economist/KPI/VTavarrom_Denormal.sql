


--select * from VTavarrom_Denormal
CREATE   view [dbo].[VTavarrom_Denormal] as 
select 

t0.Id,t0.[Name],t0.['قیمت'],t0.['تاریخ'],th.['2005'],th.['2019'],th.['2021/3/30'] ['2021/3/30'],

cast(cast((t0.['قیمت'] - th.['2005'])/th.['2005'] as decimal(18,4))  * 100 as decimal(18,1)) ['رشد نسبت به سال 2005'],
cast(cast((t0.['قیمت'] - th.['2005'])/th.['2005'] as decimal(18,4))  * 100  * 0.64 as decimal(18,2))
[رشد نسبت به سال 2005 با کسر 56 درصد تورم از سال 2005 تا اکنون],
cast(cast((t0.['قیمت'] - th.['2019'])/th.['2019'] as decimal(18,4)) * 100 as decimal(18,1))['رشد نسبت به سال 2019']

,

cast(cast((t0.['قیمت'] - th.['2021/3/30'])/th.['2021/3/30'] as decimal(18,4)) * 100 as decimal(18,1)) ['رشد نسبت به سال 2021'],

cast(replace(replace(t0.YoY, N'%', N''),N',',N'')as decimal(10,1)) [رشد نسبت به یک سال قبل],

cast(cast(replace(replace(t0.['ماهیانه'],N'%',N''), N',',N'') as float)as decimal(10,1)) ['رشد نسبت به یک ماه قبل'], t0.[CreateDate]
 
from Tavarrom t0
join TavarromHistorical th on th.name like N'%'+t0.Name+N'%'
where not exists(select 1 from tavarrom t where t.[Name] = t0.[name] and t.CreateDate > t0.CreateDate)

