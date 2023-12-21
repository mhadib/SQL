create view VChartayiPreProcess_first
as
WITH CTE AS (
select distinct [instrumentId],[ارزش دیروز بازار],[symbolFA],[1DaysVolume],[day],[3DaysVolume],[7DaysVolume],[14DaysVolume],
                          [30DaysVolume],[180DaysVolume],[dayMarketCap], [ارزش بازار],[رشد],[float],[ارزش سی روز گذشته بازار],
                          [رشد سی روزه],[ارزش سه روز گذشته بازار],[رشد سه روزه],[ارزش هفت روز گذشته بازار],[رشد هفت روزه],[ارزش چهارده روز گذشته بازار],[رشد چهارده روزه],[فروش حقیقی],[خرید حقیقی],[فروش حقوقی],[خرید حقوقی],[فروش حقیقی چهارده روز],[خرید حقیقی چهارده روز],[فروش حقوقی چهارده روز],[خرید حقوقی چهارده روز],  [فروش حقیقی نود روز], [خرید حقیقی نود روز], [فروش حقوقی نود روز], [خرید حقوقی نود روز], [خرید حقوقی سه روز], [خرید حقوقی هفت روز],
						  [خرید حقیقی سه روز],[خرید حقیقی هفت روز],[فروش حقوقی سه روز]

,[فروش حقیقی سه روز],[فروش حقوقی هفت روز],[فروش حقیقی هفت روز],[خرید حقوقی سی روز],[خرید حقیقی سی روز],[فروش حقوقی سی روز],[فروش حقیقی سی روز],[90DaysVolume],[رشد نود روزه],[رشد شش ماهه],createdate,
  cast([3DaysVolume]/3/10000000000  as decimal(30,0)) as [متوسط سهام معامله شده در سه روز گذشته]
, cast([14DaysVolume]/10/10000000000  as decimal(30,0)) as [متوسط سهام معامله شده در چهارده روز گذشته]
, cast([7DaysVolume]/5/10000000000  as decimal(30,0)) as [متوسط سهام معامله شده در یک هفته گذشته]
, cast([90DaysVolume]/66/10000000000  as decimal(30,0))as [متوسط سهام معامله شده در سه ماه گذشته]
, cast([180DaysVolume]/132/10000000000  as decimal(30,0))as [متوسط سهام معامله شده در شش ماه گذشته]
, cast([30DaysVolume]/22/10000000000  as decimal(30,0))as [متوسط سهام معامله شده در ماه گذشته],
cast( [خرید حقوقی چهارده روز]/10/10000000000 as decimal(30,0)) [متوسط خرید حقوقی در چهارده روز گذشته],
cast( [خرید حقوقی سی روز]/22/10000000000 as decimal(30,0)) [متوسط خرید حقوقی در یک ماه گذشته],


 cast([float]*[ارزش بازار]/10000000000 as decimal(30,2)) [ارزش سهام شناور از ارزش روز شرکت],


 ['رشد یک ساله'],
 ['365DaysVolume'],
 Cast(['خرید حقیقی یک سال'] as decimal(30,0))['خرید حقیقی یک سال'],
 Cast(['خرید حقوقی یک سال'] as decimal(30,0))['خرید حقوقی یک سال'],
 Cast(['فروش حقیقی یک سال'] as decimal(30,0))['فروش حقیقی یک سال'],
 Cast(['فروش حقوقی یک سال'] as decimal(30,0))['فروش حقوقی یک سال'],
 FinalPrice,
  ['رشد شش مرداد 99'] * 0.36 ['رشد شش مرداد 99'],
  cast(['فروش حقوقی 6 مرداد 99']  as decimal(30,0)) ['فروش حقوقی 6 مرداد 99'], 
  cast(['خرید حقوقی 6 مرداد 99']  as decimal(30,0)) ['خرید حقوقی 6 مرداد 99'],
  cast(['فروش حقیقی 6 مرداد 99']  as decimal(30,0)) ['فروش حقیقی 6 مرداد 99'] ,
  cast(['خرید حقیقی 6 مرداد 99']  as decimal(30,0)) ['خرید حقیقی 6 مرداد 99'], 
 cast(['6Mordad99DaysVolume']/10000000000  as decimal(30,0)) ['6Mordad99DaysVolume']

 	from HistoricalChartayi hc
	where 
	(isnull(day,0) != 0 or isnull(dayMarketCap,0) = 0)
	and not exists(select 1 from HistoricalChartayi h where hc.daymarketcap = h.daymarketcap and hc.day = h.day and hc.instrumentId = h.instrumentId and h.CreateDate > hc.CreateDate)
	AND not exists(select 1 from HistoricalChartayi h 
	where hc.instrumentId = h.instrumentId and isnull(h.day,h.dayMarketCap) > ISNULL(hc.day,h.dayMarketCap))
	and cast(hc.CreateDate as date) = cast((select top 1 createdate from HistoricalChartayi order by CreateDate desc)as date)
	and instrumentId not like N'irx%'
	)

	select * from cte 