
CREATE procedure [dbo].[PAmareOraghFaraBoursePreProcess]
as
DROP TABLE IF EXISTS AmareOraghFaraBoursePreProcess; 
declare @Old365 int = -1* dbo.findLastWorkDayAfterDays(365)
declare @Old180 int = -1* dbo.findLastWorkDayAfterDays(180)
declare @Old90 int =  -1* dbo.findLastWorkDayAfterDays(90)
declare @Old30 int =  -1* dbo.findLastWorkDayAfterDays(30)
declare @Old14 int = -1* dbo.findLastWorkDayAfterDays(14)
declare @Old7 int =  -1* dbo.findLastWorkDayAfterDays(7)
declare @Old3 int =  -1* dbo.findLastWorkDayAfterDays(3);
declare @Old1 int =  -1* dbo.findLastWorkDayAfterDays(1);

WITH CTE AS (
SELECT *
FROM VAmareOraghFaraBourse)

,NavadDaysBefore as (
select  
sum(KharidDolat)KharidDolat
,sum(KharidBankMarkazi)KharidBankMarkazi
,sum(KharidSandoghHa)KharidSandoghHa
,sum(KharidBankHa)KharidBankHa
,sum(KharidSayerAshkhas)KharidSayerAshkhas
,sum(ForushDolat)ForushDolat
,sum(ForushBankMarkazi) ForushSandoghHa
,sum(ForushSandoghHa)ForushBankHa
,sum(ForushBankHa)ForushBankMarkazi
,sum(ForushSayerAshkhas)ForushSayerAshkhas
from cte 
where TradeDate > convert(varchar, dateadd(day,@Old90,GETDATE()), 112)),
SiDaysBefore as (
select  
sum(KharidDolat)KharidDolat
,sum(KharidBankMarkazi)KharidBankMarkazi
,sum(KharidSandoghHa)KharidSandoghHa
,sum(KharidBankHa)KharidBankHa
,sum(KharidSayerAshkhas)KharidSayerAshkhas
,sum(ForushDolat)ForushDolat
,sum(ForushBankMarkazi) ForushBankMarkazi
,sum(ForushSandoghHa)ForushSandoghHa
,sum(ForushBankHa)ForushBankHa
,sum(ForushSayerAshkhas)ForushSayerAshkhas
from cte 
where TradeDate > convert(varchar, dateadd(day,@Old30,GETDATE()), 112))
,ChardahDaysBefore as (
select  
sum(KharidDolat)KharidDolat
,sum(KharidBankMarkazi)KharidBankMarkazi
,sum(KharidSandoghHa)KharidSandoghHa
,sum(KharidBankHa)KharidBankHa
,sum(KharidSayerAshkhas)KharidSayerAshkhas
,sum(ForushDolat)ForushDolat
,sum(ForushSandoghHa)ForushSandoghHa
,sum(ForushBankMarkazi) ForushBankMarkazi
,sum(ForushBankHa)ForushBankHa
,sum(ForushSayerAshkhas)ForushSayerAshkhas
from cte 
where TradeDate > convert(varchar, dateadd(day,@Old14,GETDATE()), 112))
,haftDaysBefore as (
select  
sum(KharidDolat)KharidDolat
,sum(KharidBankMarkazi)KharidBankMarkazi
,sum(KharidSandoghHa)KharidSandoghHa
,sum(KharidBankHa)KharidBankHa
,sum(KharidSayerAshkhas)KharidSayerAshkhas
,sum(ForushDolat)ForushDolat
,sum(ForushSandoghHa)ForushSandoghHa
,sum(ForushBankMarkazi) ForushBankMarkazi
,sum(ForushBankHa)ForushBankHa
,sum(ForushSayerAshkhas)ForushSayerAshkhas
from cte 
where TradeDate > convert(varchar, dateadd(day,@Old7,GETDATE()), 112))
,seDaysBefore as (
select  
sum(KharidDolat)KharidDolat
,sum(KharidBankMarkazi)KharidBankMarkazi
,sum(KharidSandoghHa)KharidSandoghHa
,sum(KharidBankHa)KharidBankHa
,sum(KharidSayerAshkhas)KharidSayerAshkhas
,sum(ForushDolat)ForushDolat
,sum(ForushSandoghHa)ForushSandoghHa
,sum(ForushBankMarkazi) ForushBankMarkazi
,sum(ForushBankHa)ForushBankHa
,sum(ForushSayerAshkhas)ForushSayerAshkhas
from cte 
where TradeDate > convert(varchar, dateadd(day,@Old3,GETDATE()), 112))
,sadoHashtadDaysBefore as (
select  
sum(KharidDolat)KharidDolat
,sum(KharidBankMarkazi)KharidBankMarkazi
,sum(KharidSandoghHa)KharidSandoghHa
,sum(KharidBankHa)KharidBankHa
,sum(KharidSayerAshkhas)KharidSayerAshkhas
,sum(ForushDolat)ForushDolat
,sum(ForushSandoghHa)ForushSandoghHa
,sum(ForushBankMarkazi) ForushBankMarkazi
,sum(ForushBankHa)ForushBankHa
,sum(ForushSayerAshkhas)ForushSayerAshkhas
from cte 
where TradeDate > convert(varchar, dateadd(day,@Old180,GETDATE()), 112))
,YekSaalDaysBefore as (
select  
sum(KharidDolat)KharidDolat
,sum(KharidBankMarkazi)KharidBankMarkazi
,sum(KharidSandoghHa)KharidSandoghHa
,sum(KharidBankHa)KharidBankHa
,sum(KharidSayerAshkhas)KharidSayerAshkhas
,sum(ForushDolat)ForushDolat
,sum(ForushSandoghHa)ForushSandoghHa
,sum(ForushBankMarkazi) ForushBankMarkazi
,sum(ForushBankHa)ForushBankHa
,sum(ForushSayerAshkhas)ForushSayerAshkhas
from cte 
where TradeDate > convert(varchar, dateadd(day,@Old365,GETDATE()), 112))
,yekRuzeBefore as (
select  
sum(KharidDolat)KharidDolat
,sum(KharidBankMarkazi)KharidBankMarkazi
,sum(KharidSandoghHa)KharidSandoghHa
,sum(KharidBankHa)KharidBankHa
,sum(KharidSayerAshkhas)KharidSayerAshkhas
,sum(ForushDolat)ForushDolat
,sum(ForushSandoghHa)ForushSandoghHa
,sum(ForushBankMarkazi) ForushBankMarkazi
,sum(ForushBankHa)ForushBankHa
,sum(ForushSayerAshkhas)ForushSayerAshkhas
from cte 
where TradeDate > convert(varchar, dateadd(day,@Old1,GETDATE()), 112))

select CTE.*,
NavadDaysBefore.ForushBankMarkazi ForushBankMarkazi90, NavadDaysBefore.ForushBankHa ForushBankHa90, NavadDaysBefore.ForushDolat ForushDolat90, NavadDaysBefore.ForushSandoghHa ForushSandoghHa90, NavadDaysBefore.ForushSayerAshkhas ForushSayerAshkhas90,
NavadDaysBefore.kharidBankMarkazi KharidBankMarkazi90,NavadDaysBefore.kharidBankHa KharidBankHa90, NavadDaysBefore.KharidDolat KharidDolat90, NavadDaysBefore.KharidSandoghHa KharidSandoghHa90, NavadDaysBefore.KharidSayerAshkhas KharidSayerAshkhas90,

SiDaysBefore.ForushBankMarkazi ForushBankMarkazi30, SiDaysBefore.ForushBankHa ForushBankHa30, SiDaysBefore.ForushDolat ForushDolat30, SiDaysBefore.ForushSandoghHa ForushSandoghHa30, SiDaysBefore.ForushSayerAshkhas ForushSayerAshkhas30,
SiDaysBefore.kharidBankMarkazi KharidBankMarkazi30, SiDaysBefore.kharidBankHa KharidBankHa30, SiDaysBefore.KharidDolat KharidDolat30, SiDaysBefore.KharidSandoghHa KharidSandoghHa30, SiDaysBefore.KharidSayerAshkhas KharidSayerAshkhas30,

ChardahDaysBefore.ForushBankMarkazi ForushBankMarkazi14, ChardahDaysBefore.ForushBankHa ForushBankHa14, ChardahDaysBefore.ForushDolat ForushDolat14, ChardahDaysBefore.ForushSandoghHa ForushSandoghHa14,ChardahDaysBefore.ForushSayerAshkhas ForushSayerAshkhas14,
ChardahDaysBefore.kharidBankMarkazi KharidBankMarkazi14, ChardahDaysBefore.kharidBankHa KharidBankHa14, ChardahDaysBefore.KharidDolat KharidDolat14, ChardahDaysBefore.KharidSandoghHa KharidSandoghHa14,ChardahDaysBefore.KharidSayerAshkhas KharidSayerAshkhas14,

HaftDaysBefore.ForushBankMarkazi ForushBankMarkazi7, HaftDaysBefore.ForushBankHa ForushBankHa7, HaftDaysBefore.ForushDolat ForushDolat7, HaftDaysBefore.ForushSandoghHa ForushSandoghHa7,HaftDaysBefore.ForushSayerAshkhas ForushSayerAshkhas7,
HaftDaysBefore.kharidBankMarkazi KharidBankMarkazi7, HaftDaysBefore.kharidBankHa KharidBankHa7, HaftDaysBefore.KharidDolat KharidDolat7, HaftDaysBefore.KharidSandoghHa KharidSandoghHa7,HaftDaysBefore.KharidSayerAshkhas KharidSayerAshkhas7,

SeDaysBefore.ForushBankMarkazi ForushBankMarkazi3, SeDaysBefore.ForushBankHa ForushBankHa3, SeDaysBefore.ForushDolat ForushDolat3, SeDaysBefore.ForushSandoghHa ForushSandoghHa3,SeDaysBefore.ForushSayerAshkhas ForushSayerAshkhas3,
SeDaysBefore.kharidBankMarkazi KharidBankMarkazi3, SeDaysBefore.kharidBankHa KharidBankHa3, SeDaysBefore.KharidDolat KharidDolat3, SeDaysBefore.KharidSandoghHa KharidSandoghHa3,SeDaysBefore.KharidSayerAshkhas KharidSayerAshkhas3,

SadoHashtadDaysBefore.ForushBankMarkazi ForushBankMarkazi180, SadoHashtadDaysBefore.ForushBankHa ForushBankHa180, SadoHashtadDaysBefore.ForushDolat ForushDolat180, SadoHashtadDaysBefore.ForushSandoghHa ForushSandoghHa180,SadoHashtadDaysBefore.ForushSayerAshkhas ForushSayerAshkhas180,
SadoHashtadDaysBefore.kharidBankMarkazi KharidBankMarkazi180, SadoHashtadDaysBefore.kharidBankHa KharidBankHa180, SadoHashtadDaysBefore.KharidDolat KharidDolat180, SadoHashtadDaysBefore.KharidSandoghHa KharidSandoghHa180,SadoHashtadDaysBefore.KharidSayerAshkhas KharidSayerAshkhas180,


YekSaalDaysBefore.ForushBankMarkazi ForushBankMarkazi365, YekSaalDaysBefore.ForushBankHa ForushBankHa365, YekSaalDaysBefore.ForushDolat ForushDolat365, YekSaalDaysBefore.ForushSandoghHa ForushSandoghHa365,YekSaalDaysBefore.ForushSayerAshkhas ForushSayerAshkhas365,
YekSaalDaysBefore.kharidBankMarkazi KharidBankMarkazi365, YekSaalDaysBefore.kharidBankHa KharidBankHa365, YekSaalDaysBefore.KharidDolat KharidDolat365, YekSaalDaysBefore.KharidSandoghHa KharidSandoghHa365,YekSaalDaysBefore.KharidSayerAshkhas KharidSayerAshkhas365,

YekRuzeBefore.ForushBankMarkazi ForushBankMarkazi1, YekRuzeBefore.ForushBankHa ForushBankHa1, YekRuzeBefore.ForushDolat ForushDolat1, YekRuzeBefore.ForushSandoghHa ForushSandoghHa1,YekRuzeBefore.ForushSayerAshkhas ForushSayerAshkhas1,
YekRuzeBefore.kharidBankMarkazi KharidBankMarkazi1, YekRuzeBefore.kharidBankHa KharidBankHa1, YekRuzeBefore.KharidDolat KharidDolat1, YekRuzeBefore.KharidSandoghHa KharidSandoghHa1,YekRuzeBefore.KharidSayerAshkhas KharidSayerAshkhas1

into AmareOraghFaraBoursePreProcess
from cte 
left join NavadDaysBefore on 1=1
left join SiDaysBefore  on 1=1
left join ChardahDaysBefore on 1=1
left join HaftDaysBefore  on 1=1
left join SeDaysBefore on 1=1
left join SadoHashtadDaysBefore  on 1=1
left join YekSaalDaysBefore  on 1=1
left join yekRuzeBefore  on 1=1
where not exists(select 1 from cte c2 where c2.TradeDate > cte.TradeDate)

