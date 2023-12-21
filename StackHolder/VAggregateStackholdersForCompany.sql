



CREATE view [dbo].[VAggregateStackholdersForCompany]

as 

with   cte as (select convert(varchar, dateadd(day,-1 * dbo.findLastWorkDayAfterDays(180),GETDATE()), 112) as [180daysOlderDate])
, cte2 as (select [سهامدار],[اسم شرکت],[ارزش معامله] from dbo.vStackHoldersPre where cast(ChangeDateEnPersist as date) > (select  [180daysOlderDate] from cte))

select [سهامدار],[اسم شرکت],sum([ارزش معامله]) [ارزش معامله در شش ماه]
froM cte2 v
group by [سهامدار],[اسم شرکت]


