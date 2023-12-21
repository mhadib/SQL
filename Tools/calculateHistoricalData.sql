CREATE procedure [dbo].[calculateHistoricalData]
as
begin
DROP TABLE IF EXISTS Temp; 
declare @Old365 int = -1* dbo.findLastWorkDayAfterDays(365)
declare @Old180 int = -1* dbo.findLastWorkDayAfterDays(180)
declare @Old90 int =  -1* dbo.findLastWorkDayAfterDays(90)
declare @Old30 int =  -1* dbo.findWorkDay(22)
declare @Old14 int = -1* dbo.findWorkDay(10)
declare @Old7 int =  -1* dbo.findWorkDay(5)
declare @Old3 int =  -1* dbo.findWorkDay(3);
declare @Old1 int =  -1* dbo.findWorkDay(1);

declare @Old365f int = -1* dbo.findLastWorkDayAfterDays(364)
declare @Old180f int = -1* dbo.findLastWorkDayAfterDays(179)
declare @Old90f int =  -1* dbo.findLastWorkDayAfterDays(89)
declare @Old30f int =  -1* dbo.findLastWorkDayAfterDays(29)
declare @Old14f int = -1* dbo.findLastWorkDayAfterDays(13)
declare @Old7f int =  -1* dbo.findLastWorkDayAfterDays(6)
declare @Old3f int =  -1* dbo.findLastWorkDayAfterDays(2);
declare @Old1f int =  -1* dbo.findLastWorkDayAfterDays(0);



WITH CTE AS (
SELECT DENSE_RANK() over( order by daymarketcap asc) rnumber, *
FROM HistoricalChartayi
where [day]<convert(varchar,getdate(), 112))

,NavadDaysBefore as (
select instrumentId,sum([خرید حقوقی])[خرید حقوقی],sum([فروش حقوقی])[فروش حقوقی] ,sum([خرید حقیقی])[خرید حقیقی],sum([فروش حقیقی])[فروش حقیقی], sum([1DaysVolume])[1DaysVolume]
from cte 
where [day] > convert(varchar, dateadd(day,@Old90,GETDATE()), 112)
group by instrumentId),

NavadDaysBeforeArzesh as (
select instrumentId, [ارزش بازار], [float],FinalPrice
from cte 
where [dayMarketCap] = convert(varchar, dateadd(day,@Old90f,GETDATE()), 112)
)

,SiDaysBefore as (
select instrumentId,sum([خرید حقوقی])[خرید حقوقی],sum([فروش حقوقی])[فروش حقوقی] ,sum([خرید حقیقی])[خرید حقیقی],sum([فروش حقیقی])[فروش حقیقی], sum([1DaysVolume])[1DaysVolume]
from cte 
where [day] > convert(varchar, dateadd(day,@Old30,GETDATE()), 112)
group by instrumentId)


,SiDaysBeforeArzesh as (
select instrumentId, [ارزش بازار], [float],FinalPrice
from cte 
where [dayMarketCap] = convert(varchar, dateadd(day,@Old30f,GETDATE()), 112)
)

,[6Mordad99] as (
select instrumentId,sum([خرید حقوقی])[خرید حقوقی],sum([فروش حقوقی])[فروش حقوقی] ,sum([خرید حقیقی])[خرید حقیقی],sum([فروش حقیقی])[فروش حقیقی], sum([1DaysVolume])[1DaysVolume]
from cte 
where [day] >= '20200728'
group by instrumentId)


,[6Mordad99Arzesh] as (
select instrumentId, [ارزش بازار], [float],FinalPrice
from cte 
where [dayMarketCap] = '20200728'
)


,ChardahDaysBefore as (
select instrumentId,sum([خرید حقوقی])[خرید حقوقی],sum([فروش حقوقی])[فروش حقوقی] ,sum([خرید حقیقی])[خرید حقیقی],sum([فروش حقیقی])[فروش حقیقی], sum([1DaysVolume])[1DaysVolume]
from cte 
where [day] > convert(varchar, dateadd(day,@Old14,GETDATE()), 112)
group by instrumentId)

,ChardahDaysArzesh as (
select instrumentId, [ارزش بازار], [float],FinalPrice
from cte 
where [dayMarketCap] = convert(varchar, dateadd(day,@Old14f,GETDATE()), 112)
)

,HaftDaysBefore as (
select instrumentId,sum([خرید حقوقی])[خرید حقوقی],sum([فروش حقوقی])[فروش حقوقی] ,sum([خرید حقیقی])[خرید حقیقی],sum([فروش حقیقی])[فروش حقیقی], sum([1DaysVolume])[1DaysVolume]
from cte 
where [day] > convert(varchar, dateadd(day,@Old7,GETDATE()), 112)
group by instrumentId)

,HaftDaysArzesh as (
select instrumentId, [ارزش بازار], [float],FinalPrice
from cte 
where [dayMarketCap] = convert(varchar, dateadd(day,@Old7f,GETDATE()), 112)
)


,SeDaysBefore as (
select instrumentId,sum([خرید حقوقی])[خرید حقوقی],sum([فروش حقوقی])[فروش حقوقی] ,sum([خرید حقیقی])[خرید حقیقی],sum([فروش حقیقی])[فروش حقیقی], sum([1DaysVolume])[1DaysVolume]
from cte 
where [day] > convert(varchar, dateadd(day,@Old3,GETDATE()), 112)
group by instrumentId)

,SeDaysArzesh as (
select instrumentId, [ارزش بازار], [float],FinalPrice
from cte 
where [dayMarketCap] = convert(varchar, dateadd(day,@Old3f,GETDATE()), 112)
)


,SadoHashtadDaysBefore as (
select instrumentId, sum([1DaysVolume])[1DaysVolume]
from cte 
where [day] > convert(varchar, dateadd(day,@Old180,GETDATE()), 112)
group by instrumentId)

,SadoHashtadDaysArzesh as (
select instrumentId, [ارزش بازار], [float],FinalPrice
from cte 
where [dayMarketCap] = convert(varchar, dateadd(day,@Old180f,GETDATE()), 112)
)
,YekSaalDaysBefore as (
select instrumentId, sum([1DaysVolume])[1DaysVolume],sum([خرید حقوقی])[خرید حقوقی],sum([فروش حقوقی])[فروش حقوقی] ,sum([خرید حقیقی])[خرید حقیقی],sum([فروش حقیقی])[فروش حقیقی]
from cte 
where [day] > convert(varchar, dateadd(day,@Old365,GETDATE()), 112)
group by instrumentId)

,YekSaalDaysArzesh as (
select instrumentId, [ارزش بازار], [float],FinalPrice
from cte 
where [dayMarketCap] = convert(varchar, dateadd(day,@Old365f,GETDATE()), 112)
)
,DiruzArzesh as (
select instrumentId, [ارزش بازار], [float],FinalPrice
from cte 
where [dayMarketCap] = convert(varchar, dateadd(day,@Old1f,GETDATE()), 112)
)


select distinct rnumber, cte.instrumentId,cte.symbolFA, 
NavadDaysBefore.[فروش حقوقی] [فروش حقوقی نود روز],
NavadDaysBefore.[خرید حقوقی] [خرید حقوقی نود روز],
NavadDaysBefore.[فروش حقیقی] [فروش حقیقی نود روز],
NavadDaysBefore.[خرید حقیقی] [خرید حقیقی نود روز],
NavadDaysBefore.[1DaysVolume] [90DaysVolume],
NavadDaysBeforeArzesh.[ارزش بازار] [ارزش نود روز گذشته بازار],

SiDaysBefore.[فروش حقوقی] [فروش حقوقی سی روز],
SiDaysBefore.[خرید حقوقی] [خرید حقوقی سی روز],
SiDaysBefore.[فروش حقیقی] [فروش حقیقی سی روز],
SiDaysBefore.[خرید حقیقی] [خرید حقیقی سی روز],
SiDaysBefore.[1DaysVolume] [30DaysVolume],
SiDaysBeforeArzesh.[ارزش بازار] [ارزش سی روز گذشته بازار],

[6Mordad99].[فروش حقوقی] [فروش حقوقی شش مرداد 99],
[6Mordad99].[خرید حقوقی] [خرید حقوقی شش مرداد 99],
[6Mordad99].[فروش حقیقی] [فروش حقیقی شش مرداد 99],
[6Mordad99].[خرید حقیقی] [خرید حقیقی شش مرداد 99],
[6Mordad99].[1DaysVolume] [6Mordad99DaysVolume],
[6Mordad99Arzesh].[ارزش بازار] [ارزش 6 مرداد 99],

ChardahDaysBefore.[فروش حقوقی] [فروش حقوقی چهارده روز],
ChardahDaysBefore.[خرید حقوقی] [خرید حقوقی چهارده روز],
ChardahDaysBefore.[فروش حقیقی] [فروش حقیقی چهارده روز],
ChardahDaysBefore.[خرید حقیقی] [خرید حقیقی چهارده روز],
ChardahDaysBefore.[1DaysVolume] [14DaysVolume],
ChardahDaysArzesh.[ارزش بازار] [ارزش چهارده روز گذشته بازار],

HaftDaysBefore.[فروش حقوقی] [فروش حقوقی هفت روز],
HaftDaysBefore.[خرید حقوقی] [خرید حقوقی هفت روز],
HaftDaysBefore.[فروش حقیقی] [فروش حقیقی هفت روز],
HaftDaysBefore.[خرید حقیقی] [خرید حقیقی هفت روز],
HaftDaysBefore.[1DaysVolume] [7DaysVolume],
HaftDaysArzesh.[ارزش بازار] [ارزش هفت روز گذشته بازار],

SeDaysBefore.[فروش حقوقی] [فروش حقوقی سه روز],
SeDaysBefore.[خرید حقوقی] [خرید حقوقی سه روز],
SeDaysBefore.[فروش حقیقی] [فروش حقیقی سه روز],
SeDaysBefore.[خرید حقیقی] [خرید حقیقی سه روز],
SeDaysBefore.[1DaysVolume] [3DaysVolume],
SeDaysArzesh.[ارزش بازار] [ارزش سه روز گذشته بازار],

SadoHashtadDaysBefore.[1DaysVolume] [180DaysVolume],
SadoHashtadDaysArzesh.[ارزش بازار] [ارزش شش ماهه گذشته بازار],

YekSaalDaysBefore.[1DaysVolume] [365DaysVolume],
YekSaalDaysArzesh.[ارزش بازار] [ارزش یک سال گذشته بازار],
YekSaalDaysBefore.[فروش حقوقی] [فروش حقوقی یک سال],
YekSaalDaysBefore.[خرید حقوقی] [خرید حقوقی یک سال],
YekSaalDaysBefore.[فروش حقیقی] [فروش حقیقی یک سال],
YekSaalDaysBefore.[خرید حقیقی] [خرید حقیقی یک سال],


SeDaysArzesh.float [3DaysFloat],
HaftDaysArzesh.float [7DaysFloat],
ChardahDaysArzesh.float [14DaysFloat],
SiDaysBeforeArzesh.float [30DaysFloat],
[6Mordad99Arzesh].float [6Mordad99Float],
NavadDaysBeforeArzesh.float [90DaysFloat],
SadoHashtadDaysArzesh.float [180DaysFloat],
YekSaalDaysArzesh.float [365DaysFloat],
DiruzArzesh.float YesterdayFloat,
DiruzArzesh.[ارزش بازار] [ارزش دیروز بازار],
ChardahDaysArzesh.FinalPrice  ChardahDaysFinalPrice,
DiruzArzesh.FinalPrice  DiruzFinalPrice,
HaftDaysArzesh.FinalPrice  HaftDaysFinalPrice,
SadoHashtadDaysArzesh.FinalPrice  SadoHashtadDaysFinalPrice,
SeDaysArzesh.FinalPrice  SeDaysFinalPrice,
YekSaalDaysArzesh.FinalPrice  YekSaalDaysFinalPrice,
SiDaysBeforeArzesh.FinalPrice SiDaysFinalPrice,
[6Mordad99Arzesh].FinalPrice [6Mordad99FinalPrice],
NavadDaysBeforeArzesh.FinalPrice NavadDaysFinalPrice
into temp
from cte
left join NavadDaysBefore on cte.instrumentId = NavadDaysBefore.instrumentId
left join NavadDaysBeforeArzesh on cte.instrumentId = NavadDaysBeforeArzesh.instrumentId
left join SiDaysBefore on cte.instrumentId = SiDaysBefore.instrumentId
left join SiDaysBeforeArzesh on cte.instrumentId = SiDaysBeforeArzesh.instrumentId
left join [6Mordad99] on cte.instrumentId = [6Mordad99].instrumentId
left join [6Mordad99Arzesh] on cte.instrumentId = [6Mordad99Arzesh].instrumentId
left join ChardahDaysBefore on cte.instrumentId = ChardahDaysBefore.instrumentId
left join ChardahDaysArzesh on cte.instrumentId = ChardahDaysArzesh.instrumentId
left join HaftDaysBefore on cte.instrumentId = HaftDaysBefore.instrumentId
left join HaftDaysArzesh on cte.instrumentId = HaftDaysArzesh.instrumentId
left join SeDaysBefore on cte.instrumentId = SeDaysBefore.instrumentId
left join SeDaysArzesh on cte.instrumentId = SeDaysArzesh.instrumentId
left join SadoHashtadDaysBefore on cte.instrumentId = SadoHashtadDaysBefore.instrumentId
left join SadoHashtadDaysArzesh on cte.instrumentId = SadoHashtadDaysArzesh.instrumentId
left join YekSaalDaysBefore on cte.instrumentId = YekSaalDaysBefore.instrumentId
left join YekSaalDaysArzesh on cte.instrumentId = YekSaalDaysArzesh.instrumentId
left join DiruzArzesh on cte.instrumentId = DiruzArzesh.instrumentId
where not exists(select 1 from cte c2 where c2.instrumentId = cte.instrumentId and c2.rnumber > cte.rnumber)

return
end
