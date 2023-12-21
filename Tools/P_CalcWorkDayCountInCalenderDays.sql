
CREATE procedure [dbo].[P_CalcWorkDayCountInCalenderDays]
as
begin
declare @Old365 int = -1* dbo.findLastWorkDayAfterDays(365)
print 1
declare @Old180 int = -1* dbo.findLastWorkDayAfterDays(180)
print 2
declare @Old90 int =  -1* dbo.findLastWorkDayAfterDays(90)
print 3
declare @Old30 int =  -1* dbo.findLastWorkDayAfterDays(30)
print 4
declare @Old14 int = -1* dbo.findLastWorkDayAfterDays(14)
print 5
declare @Old7 int =  -1* dbo.findLastWorkDayAfterDays(7)
print 6
declare @Old3 int =  -1* dbo.findLastWorkDayAfterDays(3);
print 7
DROP TABLE IF EXISTS WorkDayCountInCalenderDays; 
with Old180Days as(
select instrumentId,count([day]) WorkDayCountIn180CalenderDays
from HistoricalChartayi
where  [day] >= convert(varchar, dateadd(day,@Old180,GETDATE()), 112)
group by instrumentId),
Old90Days as(
select instrumentId,count([day]) WorkDayCountIn90CalenderDays
from HistoricalChartayi
where  [day] >= convert(varchar, dateadd(day,@Old90,GETDATE()), 112)
group by instrumentId),
Old30Days as(
select instrumentId,count([day]) WorkDayCountIn30CalenderDays
from HistoricalChartayi
where  [day] >= convert(varchar, dateadd(day,@Old30,GETDATE()), 112)
group by instrumentId),
Old14Days as(
select instrumentId,count([day]) WorkDayCountIn14CalenderDays
from HistoricalChartayi
where  [day] >= convert(varchar, dateadd(day,@Old14,GETDATE()), 112)
group by instrumentId),
Old7Days as(
select instrumentId,count([day]) WorkDayCountIn7CalenderDays
from HistoricalChartayi
where  [day] >= convert(varchar, dateadd(day,@Old7,GETDATE()), 112)
group by instrumentId),
Old3Days as(
select instrumentId,count([day]) WorkDayCountIn3CalenderDays
from HistoricalChartayi
where  [day] >= convert(varchar, dateadd(day,@Old3,GETDATE()), 112)
group by instrumentId),
Old365Days as(
select instrumentId,count([day]) WorkDayCountIn365CalenderDays
from HistoricalChartayi
where  [day] >= convert(varchar, dateadd(day,@Old365,GETDATE()), 112)
group by instrumentId)
select o365.*,isnull(o90.WorkDayCountIn90CalenderDays, 0 ) WorkDayCountIn90CalenderDays, isnull(o30.WorkDayCountIn30CalenderDays,0)WorkDayCountIn30CalenderDays, isnull(o14.WorkDayCountIn14CalenderDays,0)WorkDayCountIn14CalenderDays, isnull(o7.WorkDayCountIn7CalenderDays,0)WorkDayCountIn7CalenderDays, isnull(o3.WorkDayCountIn3CalenderDays,0)WorkDayCountIn3CalenderDays, isnull(o180.WorkDayCountIn180CalenderDays,0)WorkDayCountIn180CalenderDays 
into WorkDayCountInCalenderDays
from Old365Days o365
left join Old90Days o90 on o365.instrumentId = o90.instrumentId
left join Old30Days o30 on o365.instrumentId = o30.instrumentId
left join Old14Days o14 on o365.instrumentId = o14.instrumentId
left join Old7Days o7 on o365.instrumentId = o7.instrumentId
left join Old3Days o3 on o365.instrumentId = o3.instrumentId
left join Old180Days o180 on o365.instrumentId = o180.instrumentId
end
