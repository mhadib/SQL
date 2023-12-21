
CREATE function [dbo].[findLastWorkDayAfterDays](@day int) 
returns int WITH SCHEMABINDING
as
begin
 while (1=1)
 begin
 if	exists(select 1 from dbo.HistoricalChartayi where [dayMarketCap] = convert(varchar, dateadd(day,-@day,GETDATE()), 112))
 begin
 return @day
 end
 set @day = @day + 1
 end
 return @day
-- return dbo.findLastWorkDayAfterDays(@day + 1)


end
