





CREATE view [dbo].[VAggregateStackholders]
 as 
with 
  cte as (select convert(varchar, dateadd(day,-1 * dbo.findLastWorkDayAfterDays(30),GETDATE()), 112) as [30daysOlderDate])
, cte2 as (select [سهامدار],[اسم شرکت],[ارزش معامله] from dbo.vStackHoldersPre where cast(ChangeDateEnPersist as date) > (select  [30daysOlderDate] from cte))
 select [سهامدار],[اسم شرکت],sum([ارزش معامله]) [ارزش معامله در یک ماه]
froM cte2 v
group by [سهامدار],[اسم شرکت]

