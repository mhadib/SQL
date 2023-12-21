
CREATE function [dbo].[findWorkDay](@day int) 
returns int
as
begin
	 declare @counter int = 1
	 declare @existCounter int = 0
	 declare @notExistCounter int = 0
	 while (1=1)
	 begin
		 
		 if	exists(select 1 from HistoricalChartayi where [dayMarketCap] = convert(varchar, dateadd(day,-@counter,GETDATE()), 112)) 
		 begin
			set @existCounter = @existCounter + 1
			if @existCounter = @day
				break
		 end
		 else 
			set @notExistCounter = @notExistCounter + 1

		 set @counter = @counter + 1
	 end
	 return @existCounter + @notExistCounter
end
