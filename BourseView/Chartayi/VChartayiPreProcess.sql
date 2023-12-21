
--select * from VChartayiPreProcess where [نام رشته] is null

CREATE view [dbo].[VChartayiPreProcess]
as 

SELECT distinct
VChartayiPreProcess_first.[instrumentId],
c.nameFa [نام کامل],
VChartayiPreProcess_first.[symbolFA] [نماد],
isnull(ind.namefa, case when o.ticker is not null or c.namefa like N'%مرابحه عام دولت%' or c.namefa like N'%گواهی اعتبارمولد%' 
or c.namefa like N'%گواهی اعتبار مولد%' or c.namefa like N'%تسهیلات مسکن%' or c.namefa like N'%امتیازتسهیلات%' or c.namefa like N'%اجاره اعتماد%' or c.namefa like N'%خزانه%' or c.nameFA like N'اوراق%' or c.nameFa like N'شهرداری%' or c.nameFa like N'مرابحه%' or c.nameFa like N'منفعت%' then N'اوراق' 
						when c.marketName = N'بازار ابزارهای نوین مالی فرابورس' or c.marketName = N'بازار ابزارهای نوین مالی' then N'صندوق' 
						when c.namefa like N'%صندوق%' then N'صندوق'
						when c.namefa like N'%تامین مالی%' or c.namefa like N'%تامین سرمایه%' or c.namefa like N'%ح . تامین%' then N'تامین'
						else null end) [نام رشته],
[dayMarketCap],
cast([ارزش بازار]/10000000000 as decimal(30,0)) [ارزش بازار],
cast(VChartayiPreProcess_first.[ارزش دیروز بازار]/10000000000 as decimal(30,0)) [ارزش دیروز بازار],
[float] [درصد سهام شناور],
VChartayiPreProcess_first.createdate,
isnull(i.GroupName, ind.namefa) GroupName,
[day],
[ارزش سهام شناور از ارزش روز شرکت],
cast([1DaysVolume]/10000000000 as decimal(30,0)) [سهام معامله شده در یک روز],
cast(VChartayiPreProcess_first.[3DaysVolume]/10000000000 as decimal(30,0))[سهام معامله شده در سه روز],
cast(VChartayiPreProcess_first.[7DaysVolume]/10000000000 as decimal(30,0))[سهام معامله شده در هفت روز],
cast(VChartayiPreProcess_first.[14DaysVolume]/10000000000 as decimal(30,0)) [سهام معامله شده در چهارده روز],
cast(VChartayiPreProcess_first.[30DaysVolume]/10000000000 as decimal(30,0)) [سهام معامله شده در سی روز],
cast(VChartayiPreProcess_first.[90DaysVolume]/10000000000 as decimal(30,0)) [سهام معامله شده در نود روز] ,
cast(VChartayiPreProcess_first.[180DaysVolume]/10000000000 as decimal(30,0)) [سهام معامله شده در شش ماه],
cast(VChartayiPreProcess_first.['365DaysVolume']/10000000000 as decimal(30,0)) [سهام معامله شده در یک سال],
['6Mordad99DaysVolume'] [سهام معامله شده از شش مرداد 99 تا امروز],


cast(([خرید حقیقی] - [فروش حقیقی])/10000000000  as decimal(30,0))[خالص خرید حقیقی],
cast((VChartayiPreProcess_first.[خرید حقیقی سه روز] - VChartayiPreProcess_first.[فروش حقیقی سه روز])/10000000000  as decimal(30,0))[خالص خرید حقیقی در سه روز گذشته],
cast((VChartayiPreProcess_first.[خرید حقیقی هفت روز] - VChartayiPreProcess_first.[فروش حقیقی هفت روز])/10000000000  as decimal(30,0))[خالص خرید حقیقی در هفت روز گذشته],
cast(([خرید حقوقی] - [فروش حقوقی])/10000000000  as decimal(30,0))[خالص خرید حقوقی],
cast((VChartayiPreProcess_first.[خرید حقوقی سه روز] - VChartayiPreProcess_first.[فروش حقوقی سه روز])/10000000000  as decimal(30,0))[خالص خرید حقوقی در سه روز گذشته],
cast((VChartayiPreProcess_first.[خرید حقوقی هفت روز] - VChartayiPreProcess_first.[فروش حقوقی هفت روز])/10000000000  as decimal(30,0))[خالص خرید حقوقی در هفت روز گذشته],
cast((VChartayiPreProcess_first.[خرید حقوقی چهارده روز] - VChartayiPreProcess_first.[فروش حقوقی چهارده روز])/10000000000  as decimal(30,0))[خالص خرید حقوقی در چهارده روز گذشته],
cast((VChartayiPreProcess_first.[خرید حقیقی سی روز] - VChartayiPreProcess_first.[فروش حقیقی سی روز])/10000000000  as decimal(30,0))[خالص خرید حقیقی در یک ماه گذشته],
cast((VChartayiPreProcess_first.[خرید حقیقی نود روز] - VChartayiPreProcess_first.[فروش حقیقی نود روز])/10000000000  as decimal(30,0))[خالص خرید حقیقی در سه ماه گذشته],
cast((VChartayiPreProcess_first.[خرید حقوقی سی روز] - VChartayiPreProcess_first.[فروش حقوقی سی روز])/10000000000  as decimal(30,0))[خالص خرید حقوقی در یک ماه گذشته],
cast((VChartayiPreProcess_first.[خرید حقوقی نود روز] - VChartayiPreProcess_first.[فروش حقوقی نود روز])/10000000000  as decimal(30,0))[خالص خرید حقوقی در سه ماه گذشته],
cast((VChartayiPreProcess_first.[خرید حقیقی چهارده روز] - VChartayiPreProcess_first.[فروش حقیقی چهارده روز])/10000000000  as decimal(30,0))[خالص خرید حقیقی در چهارده روز گذشته],
cast((VChartayiPreProcess_first.['خرید حقوقی یک سال'] - VChartayiPreProcess_first.['فروش حقوقی یک سال'])/10000000000 as decimal(30,0))[خالص خرید حقوقی در یک سال گذشته],
cast((VChartayiPreProcess_first.['خرید حقیقی یک سال'] - VChartayiPreProcess_first.['فروش حقیقی یک سال'])/10000000000 as decimal(30,0)) [خالص خرید حقیقی در یک سال گذشته],

cast((VChartayiPreProcess_first.[14DaysVolume] - VChartayiPreProcess_first.[7DaysVolume])/10000000000 as decimal(10,2)) [سهام معامله شده در هفته ما قبل],
cast((VChartayiPreProcess_first.[30DaysVolume] - VChartayiPreProcess_first.[14DaysVolume])/10000000000 as decimal(10,2))[سهام معامله شده در دو هفته ماقبل],

cast([فروش حقیقی]/10000000000  as decimal(30,0)) [فروش حقیقی]
,cast([خرید حقیقی]/10000000000  as decimal(30,0))[خرید حقیقی]
,cast([فروش حقوقی]/10000000000  as decimal(30,0)) [فروش حقوقی]
,cast([خرید حقوقی]/10000000000  as decimal(30,0))[خرید حقوقی]
,cast(VChartayiPreProcess_first.[فروش حقیقی سه روز]/10000000000  as decimal(30,0))[فروش حقیقی سه روز]
,cast(VChartayiPreProcess_first.[خرید حقیقی سه روز]/10000000000  as decimal(30,0))[خرید حقیقی سه روز]
,cast(VChartayiPreProcess_first.[فروش حقوقی سه روز]/10000000000  as decimal(30,0))[فروش حقوقی سه روز]
,cast(VChartayiPreProcess_first.[خرید حقوقی سه روز]/10000000000  as decimal(30,0))[خرید حقوقی سه روز]
,cast(VChartayiPreProcess_first.[فروش حقیقی هفت روز]/10000000000  as decimal(30,0))[فروش حقیقی هفت روز]
,cast(VChartayiPreProcess_first.[خرید حقیقی هفت روز]/10000000000  as decimal(30,0))[خرید حقیقی هفت روز]
,cast(VChartayiPreProcess_first.[فروش حقوقی هفت روز]/10000000000  as decimal(30,0))[فروش حقوقی هفت روز]
,cast(VChartayiPreProcess_first.[خرید حقوقی هفت روز]/10000000000  as decimal(30,0))[خرید حقوقی هفت روز]

,cast(VChartayiPreProcess_first.[فروش حقیقی چهارده روز]/10000000000 as decimal(30,0))[فروش حقیقی چهارده روز]
,cast(VChartayiPreProcess_first.[خرید حقیقی چهارده روز]/10000000000 as decimal(30,0))[خرید حقیقی چهارده روز]
,cast(VChartayiPreProcess_first.[فروش حقوقی چهارده روز]/10000000000 as decimal(30,0))[فروش حقوقی چهارده روز]
,cast(VChartayiPreProcess_first.[خرید حقوقی چهارده روز]/10000000000 as decimal(30,0))[خرید حقوقی چهارده روز]

,cast(VChartayiPreProcess_first.[فروش حقیقی سی روز]/10000000000  as decimal(30,0))[فروش حقیقی سی روز]
,cast(VChartayiPreProcess_first.[خرید حقیقی سی روز]/10000000000  as decimal(30,0))[خرید حقیقی سی روز]
,cast(VChartayiPreProcess_first.[فروش حقوقی سی روز]/10000000000  as decimal(30,0))[فروش حقوقی سی روز]
,cast(VChartayiPreProcess_first.[خرید حقوقی سی روز]/10000000000  as decimal(30,0))[خرید حقوقی سی روز]

,cast(VChartayiPreProcess_first.[فروش حقیقی نود روز]/10000000000  as decimal(30,0))[فروش حقیقی نود روز] 
,cast(VChartayiPreProcess_first.[خرید حقیقی نود روز]/10000000000  as decimal(30,0))[خرید حقیقی نود روز]
,cast(VChartayiPreProcess_first.[فروش حقوقی نود روز]/10000000000  as decimal(30,0))[فروش حقوقی نود روز]
,cast(VChartayiPreProcess_first.[خرید حقوقی نود روز]/10000000000  as decimal(30,0))[خرید حقوقی نود روز]

,cast(VChartayiPreProcess_first.['فروش حقیقی یک سال']/1000000000  as decimal(30,0))['فروش حقیقی یک سال']
,cast(VChartayiPreProcess_first.['خرید حقیقی یک سال']/1000000000  as decimal(30,0))['خرید حقیقی یک سال']
,cast(VChartayiPreProcess_first.['فروش حقوقی یک سال']/1000000000  as decimal(30,0))['فروش حقوقی یک سال']
,cast(VChartayiPreProcess_first.['خرید حقوقی یک سال']/1000000000  as decimal(30,0))['خرید حقوقی یک سال']

,cast(['فروش حقوقی 6 مرداد 99']/1000000000  as decimal(30,0))['فروش حقوقی 6 مرداد 99']
,cast(['خرید حقیقی 6 مرداد 99']/1000000000  as decimal(30,0))['خرید حقیقی 6 مرداد 99']
,cast(['فروش حقیقی 6 مرداد 99']/1000000000  as decimal(30,0))['فروش حقیقی 6 مرداد 99']
,cast(['خرید حقوقی 6 مرداد 99']/1000000000  as decimal(30,0))['خرید حقوقی 6 مرداد 99']

,[متوسط سهام معامله شده در سه روز گذشته] 
,[متوسط سهام معامله شده در یک هفته گذشته] 
,[متوسط سهام معامله شده در چهارده روز گذشته]  
,[متوسط سهام معامله شده در ماه گذشته] [متوسط سهام معامله شده در سی روز]
,[متوسط سهام معامله شده در سه ماه گذشته] 
,[متوسط سهام معامله شده در شش ماه گذشته]
,[متوسط سهام معامله شده در چهارده روز گذشته] - [متوسط سهام معامله شده در یک هفته گذشته] [متوسط سهام معامله شده در هفته ماقبل]
,[متوسط سهام معامله شده در ماه گذشته] - [متوسط سهام معامله شده در چهارده روز گذشته] [متوسط سهام معامله شده دو هفته ماقبل]
,[متوسط خرید حقوقی در یک ماه گذشته] - [متوسط خرید حقوقی در چهارده روز گذشته] [متوسط خرید حقوقی در دو هفته ماقبل]


,cast(VChartayiPreProcess_first.[ارزش سه روز گذشته بازار]/10000000000 as decimal(30,0))[ارزش بازار سه روز قبل]
,cast(VChartayiPreProcess_first.[ارزش هفت روز گذشته بازار]/10000000000 as decimal(30,0))[ارزش بازار هفت روز قبل]
,cast(VChartayiPreProcess_first.[ارزش چهارده روز گذشته بازار]/10000000000 as decimal(30,0))[ارزش بازار چهارده روز قبل]
,cast(VChartayiPreProcess_first.[ارزش سی روز گذشته بازار]/10000000000 as decimal(30,0))  [ارزش بازار سی روز قبل]
,cast(t.[ارزش نود روز گذشته بازار]/10000000000 as decimal(30,0))[ارزش بازار نود روز قبل]
,cast(t.[ارزش شش ماهه گذشته بازار]/10000000000 as decimal(30,0))[ارزش بازار شش ماه قبل]
,cast(t.[ارزش یک سال گذشته بازار]/10000000000 as decimal(30,0))[ارزش بازار یک سال قبل]
,cast(isnull(i.Esfand98,0) as float) [ارزش بازار به ریال در اسفند 98]


,[رشد] [رشد ارزش بازار نسبت به روز قبل]
,[رشد سه روزه] [رشد ارزش بازار نسبت به سه روز قبل]
,[رشد هفت روزه] [رشد ارزش بازار نسبت به هفت روز قبل]
,[رشد چهارده روزه] [رشد ارزش بازار نسبت به چهارده روز قبل]
,[رشد سی روزه] [رشد ارزش بازار نسبت به سی روز قبل]
,[رشد نود روزه] [رشد ارزش بازار نسبت به نود روز قبل]
,[رشد شش ماهه] [رشد ارزش بازار نسبت به شش ماه قبل]
,VChartayiPreProcess_first.['رشد یک ساله'] [رشد ارزش بازار نسبت به یک سال قبل]
,case when cast(i.Esfand98 as float) !=0 then (([ارزش بازار]/10000000000) - cast(i.Esfand98 as float))/i.Esfand98 else 0 end*0.32
[رشد ارزش بازار به ریال نسبت به اسفند 98]
,['رشد شش مرداد 99'] [رشد ارزش بازار نسبت به شش مرداد 99]
,cast( case when VChartayiPreProcess_first.[30DaysVolume] - VChartayiPreProcess_first.[14DaysVolume] != 0 then (VChartayiPreProcess_first.[14DaysVolume] - (VChartayiPreProcess_first.[30DaysVolume] - VChartayiPreProcess_first.[14DaysVolume]))/(VChartayiPreProcess_first.[30DaysVolume] - VChartayiPreProcess_first.[14DaysVolume]) else 0 end as decimal(30,2))
[رشد متوسط روزانه سهام معامله شده در دوهفته اخیر نسبت به دو هفته ماقبل],
case when [متوسط سهام معامله شده در سه ماه گذشته] != 0 then ([متوسط سهام معامله شده در یک هفته گذشته] - [متوسط سهام معامله شده در سه ماه گذشته])/[متوسط سهام معامله شده در سه ماه گذشته] else 0 end
[رشد سهام خریده شده در یک هفته نسبت به متوسط سهام معاملاتی سه ماه گذشته],
case when [متوسط سهام معامله شده در ماه گذشته] != 0 then رشد/[متوسط سهام معامله شده در ماه گذشته] else 0 end
[رشد سهام معامله شده در روز جاری نسبت به معدل سهام معامله شده در یک ماه]

--سهام شناور
,
cast(case when [ارزش سهام شناور از ارزش روز شرکت] != 0 then [1DaysVolume] * 100/[ارزش سهام شناور از ارزش روز شرکت]/10000000000 else 0 end as decimal(30,4)) [نسبت سهام معامله شده در روز جاری چند درصد سهام شناور],
cast(case when [ارزش سهام شناور از ارزش روز شرکت] != 0 then VChartayiPreProcess_first.[3DaysVolume]* 100/[ارزش سهام شناور از ارزش روز شرکت]/10000000000 else 0 end as decimal(30,4)) [نسبت سهام معامله شده در سه روز گذشته چند درصد سهام شناور]
,cast(case when [ارزش سهام شناور از ارزش روز شرکت] != 0 then VChartayiPreProcess_first.[7DaysVolume]* 100/[ارزش سهام شناور از ارزش روز شرکت]/10000000000 else 0 end as decimal(35,4))  [نسبت سهام معامله شده در یک هفته چند درصد سهام شناور]
,cast(case when [ارزش سهام شناور از ارزش روز شرکت] != 0 then VChartayiPreProcess_first.[14DaysVolume]* 100/[ارزش سهام شناور از ارزش روز شرکت]/10000000000 else 0 end as decimal(30,4)) [نسبت سهام معامله شده در دو هفته چند درصد سهام شناور],
cast(case when [ارزش سهام شناور از ارزش روز شرکت] != 0 then VChartayiPreProcess_first.[30DaysVolume]* 100/[ارزش سهام شناور از ارزش روز شرکت]/10000000000 else 0 end as decimal(30,4)) [نسبت سهام معامله شده در یک ماه چند درصد سهام شناور]
,cast(case when [ارزش سهام شناور از ارزش روز شرکت] != 0 then VChartayiPreProcess_first.[90DaysVolume]* 100/[ارزش سهام شناور از ارزش روز شرکت]/10000000000 else 0 end as decimal(30,4)) [نسبت سهام معامله شده در سه ماه گذشته چند درصد سهام شناور]
,cast(case when [ارزش سهام شناور از ارزش روز شرکت] != 0 then VChartayiPreProcess_first.[180DaysVolume]* 100/[ارزش سهام شناور از ارزش روز شرکت]/10000000000 else 0 end as decimal(30,4)) [نسبت سهام معامله شده در شش ماه چند درصد سهام شناور]
,cast(case when [ارزش سهام شناور از ارزش روز شرکت] != 0 then VChartayiPreProcess_first.[7DaysVolume]/[ارزش سهام شناور از ارزش روز شرکت]/10000000000 else 0 end as decimal(30,4))
[نسبت سهام معامله شده در یک هفته به ارزش روز سهام شناور]


,[ارزش سهام شناور از ارزش روز شرکت] * [رشد]
[سود خالص دارندگان سهام شناور در روز جاری]
,
cast(t.[ارزش سه روز گذشته بازار]/10000000000 * t.[3DaysFloat] * [رشد سه روزه]  as decimal(30,0)) 
[سود خالص دارندگان سهام شناور در سه روز]
,
case when t.[ارزش هفت روز گذشته بازار]/((10000000000 * t.[7DaysFloat] * [رشد هفت روزه])+0.00001)   < 0.0000000000001 then 0 
else cast(t.[ارزش هفت روز گذشته بازار]  /((10000000000 * t.[7DaysFloat] * [رشد هفت روزه]) +0.00001) as decimal(30,0))  end
[سود خالص دارندگان سهام شناور در یک هفته]
,
cast(t.[ارزش چهارده روز گذشته بازار]/10000000000 * t.[14DaysFloat] * [رشد چهارده روزه]  as decimal(30,0))
[سود خالص دارندگان سهام شناور در دو هفته]
,
case when cast(t.[ارزش سی روز گذشته بازار]/10000000000 * t.[30DaysFloat] as decimal(30,0)) * [رشد سی روزه] < 0.0000000000001 then 0 else cast(t.[ارزش سی روز گذشته بازار]/10000000000 * t.[30DaysFloat] as decimal(30,0)) * [رشد سی روزه]  end
[سود خالص دارندگان سهام شناور در یک ماه]
,
case when cast(t.[ارزش شش ماهه گذشته بازار]/10000000000 * t.[180DaysFloat] as decimal(30,0)) * [رشد شش ماهه] < 0.0000000000001 then 0 else cast(t.[ارزش شش ماهه گذشته بازار]/10000000000 * t.[180DaysFloat] as decimal(30,0)) * [رشد شش ماهه]  end
[سود خالص دارندگان سهام شناور در شش ماه گذشته]
,
cast(t.[ارزش یک سال گذشته بازار]/10000000000 * t.[365DaysFloat] * ['رشد یک ساله'] as decimal(30,0))
[سود خالص دارندگان سهام شناور در یک سال گذشته]
,
([ارزش سهام شناور از ارزش روز شرکت] * [رشد]) *100.00/((select sum([ارزش سهام شناور از ارزش روز شرکت] * [رشد] ) from VChartayiPreProcess_first)+0.00001)
[درصد سود خالص دارندگان سهام شناور از کل شرکت ها در روز جاری]
,
([ارزش سهام شناور از ارزش روز شرکت] * [رشد سه روزه]) *100.00 /((select sum([ارزش سهام شناور از ارزش روز شرکت] * [رشد سه روزه] ) from VChartayiPreProcess_first)+0.00001)
[درصد سود خالص دارندگان سهام شناور از کل شرکت ها در سه روز گذشته]
,
([ارزش سهام شناور از ارزش روز شرکت] * [رشد چهارده روزه])*100.00 /((select sum([ارزش سهام شناور از ارزش روز شرکت] * [رشد چهارده روزه] ) from VChartayiPreProcess_first)+0.00001)
[درصد سود خالص دارندگان سهام شناور از کل شرکت ها در دو هفته گذشته]
,
([ارزش سهام شناور از ارزش روز شرکت] * [رشد سی روزه])*100.00 /((select sum([ارزش سهام شناور از ارزش روز شرکت] * [رشد سی روزه] ) from VChartayiPreProcess_first)+0.00001)
[درصد سود خالص دارندگان سهام شناور از کل شرکت ها در یک ماه گذشته]
,
([ارزش سهام شناور از ارزش روز شرکت] * [رشد نود روزه])*100.00 /((select sum([ارزش سهام شناور از ارزش روز شرکت] * [رشد نود روزه] ) from VChartayiPreProcess_first)+0.00001)
[درصد سود خالص دارندگان سهام شناور از کل شرکت ها در نود روز گذشته]
,cast(t.[ارزش یک سال گذشته بازار]/10000000000 * ['رشد یک ساله'] as decimal(30,0)) [سود خالص دارندگان سهام شناور و غیر شناور در یک سال]


,cast(t.[ارزش دیروز بازار]/10000000000 * t.YesterdayFloat as decimal(30,0)) [ارزش ریالی سهام شناور دیروز]
,cast(t.[ارزش سه روز گذشته بازار]/10000000000 * t.[3DaysFloat] as decimal(30,0)) [ارزش ریالی سهام شناور سه روز قبل]
,cast(t.[ارزش هفت روز گذشته بازار]/10000000000 * t.[7DaysFloat] as decimal(30,0)) [ارزش ریالی سهام شناور هفت روز قبل]
,cast(t.[ارزش چهارده روز گذشته بازار]/10000000000 * t.[14DaysFloat] as decimal(30,0)) [ارزش ریالی سهام شناور چهارده روز قبل]
,cast(t.[ارزش سی روز گذشته بازار]/10000000000 * t.[30DaysFloat] as decimal(30,0)) [ارزش ریالی سهام شناور سی روز قبل]
,cast(t.[ارزش نود روز گذشته بازار]/10000000000 * t.[90DaysFloat] as decimal(30,0)) [ارزش ریالی سهام شناور نود روز قبل]
,cast(t.[ارزش شش ماهه گذشته بازار]/10000000000 * t.[180DaysFloat] as decimal(30,0)) [ارزش ریالی سهام شناور شش ماه قبل]
,cast(t.[ارزش یک سال گذشته بازار]/10000000000 * t.[365DaysFloat] as decimal(30,0)) [ارزش ریالی سهام شناور یک سال قبل]


,CAST((([ارزش سهام شناور از ارزش روز شرکت]) /((select SUM([ارزش سهام شناور از ارزش روز شرکت]) from VChartayiPreProcess_first)+0.00001))AS DECIMAL(30,4)) 
[درصد ارزش ریالی سهام شناور هر شرکت از کل شرکت ها]

,CAST((([ارزش بازار]) * 100 /((select SUM([ارزش بازار]) from VChartayiPreProcess_first)+0.00001))AS DECIMAL(30,4)) AS [درصد ارزش بازار روز هر شرکت به کل ارزش بازار]


 ---درصدی ها
,CAST(((VChartayiPreProcess_first.[1DaysVolume])*100/((select SUM([1DaysVolume]) from VChartayiPreProcess_first)+0.00001))AS DECIMAL(30,4)) [درصد سهام معامله شده هر شرکت از کل سهام معامله شده]
,CAST(((VChartayiPreProcess_first.[3DaysVolume])*100/(select SUM([3DaysVolume]) from VChartayiPreProcess_first)+0.00000000001)AS DECIMAL(30,4))[درصد سهام معامله شده هر شرکت به کل سهام معامله شده در سه روز]
,CAST(((VChartayiPreProcess_first.[7DaysVolume])*100/((select SUM([7DaysVolume]) from VChartayiPreProcess_first)+0.00001))AS DECIMAL(30,4))[درصد سهام معامله شده هر شرکت از کل سهام معامله شده در یک هفته]
,CAST(((VChartayiPreProcess_first.[14DaysVolume])*100/((select SUM([14DaysVolume]) from VChartayiPreProcess_first)+0.00001))AS DECIMAL(30,4))[درصد سهام معامله شده هر شرکت به کل سهام معامله شده در دو هفته]
,CAST(((VChartayiPreProcess_first.[30DaysVolume])*100/(select SUM([30DaysVolume]) from VChartayiPreProcess_first)+0.00000001) AS DECIMAL(30,4))[درصد سهام معامله شده هر شرکت به کل سهام معامله شده در سی روز]
,CAST(((VChartayiPreProcess_first.[90DaysVolume])*100/((select SUM([90DaysVolume]) from VChartayiPreProcess_first)+0.00001))AS DECIMAL(30,4))[درصد سهام معامله شده هر شرکت در سه ماه گذشته به کل شرکت ها]
,CAST(((VChartayiPreProcess_first.[180DaysVolume])*100/((select SUM([180DaysVolume]) from VChartayiPreProcess_first)+0.00001))AS DECIMAL(30,4))[درصد سهام معامله شده هر شرکت از کل سهام معامله شده در شش ماه]
,CAST(((['365DaysVolume'])*100/(select SUM(['365DaysVolume']) from VChartayiPreProcess_first))AS DECIMAL(30,6)) [درصد سهام معامله شده هر شرکت از کل سهام معامله شده در یک سال]



,CAST(([خرید حقیقی] * 100.00 / ((SELECT SUM([خرید حقیقی] ) FROM VChartayiPreProcess_first)+0.00001)) AS DECIMAL(35,4))
[درصد خرید حقیقی ها در روز جاری شرکت به کل شرکت ها],
CAST((VChartayiPreProcess_first.[خرید حقیقی سه روز]*100 / ((SELECT SUM([خرید حقیقی سه روز] ) FROM VChartayiPreProcess_first)+0.00001)) AS DECIMAL(35,4))
[درصد خرید حقیقی ها در سه روز گذشته شرکت به کل شرکت ها],
CAST(((VChartayiPreProcess_first.[خرید حقیقی هفت روز])* 100.00 /(select SUM([خرید حقیقی هفت روز]) from VChartayiPreProcess_first)+0.00000000001)AS DECIMAL(30,4))
[درصد خرید حقیقی ها در هفت روز شرکت به کل شرکت ها ],
CAST(((VChartayiPreProcess_first.[خرید حقیقی چهارده روز])* 100.00 /(select SUM([خرید حقیقی چهارده روز]) from VChartayiPreProcess_first)+0.00000000001)AS DECIMAL(30,4)) 
[درصد خرید حقیقی ها در چهارده روز شرکت به کل شرکت ها],
cast((VChartayiPreProcess_first.[خرید حقیقی نود روز]*100/((select sum([خرید حقیقی نود روز])from VChartayiPreProcess_first )+0.00001)) as decimal(35,4))
[درصد خرید حقیقی ها در نود روز گذشته شرکت به کل شرکت ها],


CAST(([خرید حقوقی] * 100.00 / ((SELECT SUM([خرید حقوقی] ) FROM VChartayiPreProcess_first)+0.00001)) AS DECIMAL(35,4))
[درصد خرید حقوقی در روز جاری شرکت به کل شرکت ها],
CAST((VChartayiPreProcess_first.[خرید حقوقی سه روز] * 100.00 / ((SELECT SUM([خرید حقوقی سه روز] ) FROM VChartayiPreProcess_first)+0.00001)) AS DECIMAL(35,4))
[درصد خرید حقوقی در سه روز گذشته به کل شرکت ها ],
CAST((VChartayiPreProcess_first.[خرید حقوقی هفت روز] * 100.00 / ((SELECT SUM([خرید حقوقی هفت روز] ) FROM VChartayiPreProcess_first)+0.00001)) AS DECIMAL(35,4))
[درصد خرید حقوقی در هفت روز شرکت به کل شرکت ها],
CAST((VChartayiPreProcess_first.[خرید حقوقی چهارده روز] * 100.00 / ((SELECT SUM([خرید حقوقی چهارده روز] ) FROM VChartayiPreProcess_first)+0.00001)) AS DECIMAL(35,4))
[درصد خرید حقوقی ها در چهارده روز شرکت به کل شرکت ها],
cast((VChartayiPreProcess_first.[خرید حقوقی نود روز]*100/((select sum([خرید حقوقی نود روز])from VChartayiPreProcess_first )+0.00001)) as decimal(35,4))
[درصد خرید حقوقی ها در نود روز گذشته شرکت به کل شرکت ها],



case when [متوسط سهام معامله شده در چهارده روز گذشته] != 0 then (([1DaysVolume]/10000000000.00) - [متوسط سهام معامله شده در چهارده روز گذشته])/cast([متوسط سهام معامله شده در چهارده روز گذشته] as float) else 0 end
[تغییر رفتار سهامدار در روز جاری نسبت به متوسط دو هفته قبل],
case when [متوسط سهام معامله شده در چهارده روز گذشته] != 0 then ([متوسط سهام معامله شده در سه روز گذشته] - [متوسط سهام معامله شده در چهارده روز گذشته])/cast([متوسط سهام معامله شده در چهارده روز گذشته] as float)else 0 end
[تغییر رفتار سهامدار در سه روز گذشته نسبت به دو هفته قبل],
case when [متوسط سهام معامله شده در شش ماه گذشته] != 0 then ([متوسط سهام معامله شده در سه روز گذشته] - [متوسط سهام معامله شده در شش ماه گذشته])/cast([متوسط سهام معامله شده در شش ماه گذشته] as float)else 0 end
[تغییر رفتار سهامدار در متوسط سه روز گذشته به متوسط شش ماه گذشته],

cast(case when VChartayiPreProcess_first.[14DaysVolume] - VChartayiPreProcess_first.[7DaysVolume] != 0 then (VChartayiPreProcess_first.[7daysvolume] - (VChartayiPreProcess_first.[14DaysVolume] - VChartayiPreProcess_first.[7DaysVolume]))/(VChartayiPreProcess_first.[14DaysVolume] - VChartayiPreProcess_first.[7DaysVolume])else 0 end as decimal(30,2))
[تغییر رفتار سهامدار در هفته جاری نسبت به هفته قبل],
case when [متوسط سهام معامله شده در ماه گذشته] != 0 then ([متوسط سهام معامله شده در یک هفته گذشته] - [متوسط سهام معامله شده در ماه گذشته])/[متوسط سهام معامله شده در ماه گذشته] else 0 end
[تغییر رفتار سهامدار در یک هفته نسبت به یک ماه],
case when ([متوسط خرید حقوقی در یک ماه گذشته] - [متوسط خرید حقوقی در چهارده روز گذشته] ) != 0 then ([متوسط خرید حقوقی در چهارده روز گذشته] - ([متوسط خرید حقوقی در یک ماه گذشته] - [متوسط خرید حقوقی در چهارده روز گذشته] ))/
([متوسط خرید حقوقی در یک ماه گذشته] - [متوسط خرید حقوقی در چهارده روز گذشته] ) else 0 end
[تغییر رفتار حقوقی در دو هفته اخیر نسبت به دو هفته قبل]


,VChartayiPreProcess_first.[خرید حقیقی سه روز]* [رشد سه روزه]/10000000000 [سود حقیقی ها در سه روز]
, w.WorkDayCountIn3CalenderDays [تعداد روز فعال در سه روز]
, w.WorkDayCountIn7CalenderDays [تعداد روز فعال در هفت روز]
, w.WorkDayCountIn14CalenderDays [تعداد روز فعال در چهارده روز]
, w.WorkDayCountIn30CalenderDays [تعداد روز فعال در سی روز]
, w.WorkDayCountIn90CalenderDays [تعداد روز فعال در نود روز]
, w.WorkDayCountIn180CalenderDays [تعداد روز فعال در شش ماه]
, w.WorkDayCountIn365CalenderDays [تعداد روز فعال در یک سال]
, t.[3DaysFloat] [درصد سهام شناور سه روز قبل]
, t.[7DaysFloat] [درصد سهام شناور هفت روز قبل]
, t.[14DaysFloat] [درصد سهام شناور چهارده روز قبل]
, t.[30DaysFloat] [درصد سهام شناور سی روز قبل]
, t.[90DaysFloat] [درصد سهام شناور نود روز قبل]
, t.[180DaysFloat] [درصد سهام شناور شش ماه قبل]
, t.[365DaysFloat] [درصد سهام شناور یک سال قبل]
, FinalPrice [قیمت پایانی سهم]
,null [اوراق فروخته شده در روز جاری],null [اوراق فروخته شده در دو هفته], null [اوراق فروخته شده در شش ماه],null [اوراق فروخته شده در سه روز], null [اوراق فروخته شده در سی روز],null [اوراق فروخته شده در یک سال],null [اوراق فروخته شده در یک هفته],null [اوراق فروخته شده در سه ماه]
,null [عملیات بازار باز در یک روز]
,null [پذیره نویسی دولت]
,null [سایر]
,null [عملیات بازار باز در سی روز]
,null [سی روز پذیره نویسی دولت]
,null [سی روز سایر]
,null [عملیات بازار باز در شش ماه]
,null [شش ماه پذیره نویسی دولت]
,null [شش ماه سایر]
,null [عملیات بازار باز در یک سال]
,null [یک سال پذیره نویسی دولت]
,null [یک سال سایر]
,t.ChardahDaysFinalPrice [قیمت سهم در چهارده روز گذشته]
,t.DiruzFinalPrice [قیمت سهم در روز گذشته]
,t.HaftDaysFinalPrice [قیمت سهم در هفت روز گذشته]
,t.NavadDaysFinalPrice [قیمت سهم در نود روز گذشته]
,t.SadoHashtadDaysFinalPrice [قیمت سهم شش ماه گذشته]
,t.SeDaysFinalPrice [قیمت سهم در سه روز گذشته]
,t.SiDaysFinalPrice [قیمت سهم در سی روز گذشته]
,t.YekSaalDaysFinalPrice [قیمت سهم در یک سال گذشته]
,y.BazdehSalaneOragh [بازده سالانه اوراق]
,y.LastTradeDateOragh [آخرین روز معاملاتی]
,y.Price [قیمت روز اوراق]
,y.SarresidDateOragh [تاریخ آخرین سررسید]
,y.SymboleFa [نماد در اوراق فرابورس]
,y.YTM [نرخ سود تا سررسید]

--,p.StackHolders
--select * 
--into #temp
FROM VChartayiPreProcess_first
left join ForConvert i on VChartayiPreProcess_first.instrumentId = i.InstrumentId
left join WorkDayCountInCalenderDays w on w.instrumentid = VChartayiPreProcess_first.InstrumentId
left join temp t on VChartayiPreProcess_first.instrumentId = t.instrumentId
left join VYTMFaraBourse y on VChartayiPreProcess_first.symbolFA = y.SymboleFa
left join vCompany c on c.ticker = VChartayiPreProcess_first.instrumentId
left join Industries ind on c.[industry.tse] = ind.code
left join oragh o on o.ticker = VChartayiPreProcess_first.instrumentId
--left join vStackHoldersPre p on p.instrumentId = VChartayiPreProcess_first.instrumentId
where w.WorkDayCountIn365CalenderDays != 0 
---and w.WorkDayCountIn90CalenderDays != 0 
and isnull(['رشد شش مرداد 99'],0) < 3
