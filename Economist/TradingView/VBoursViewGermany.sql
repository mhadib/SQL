create   view [dbo].[VBoursViewGermany]
as
with cte as(
select b.*, 
case when b.[Market cap] like N'%T EUR%' then cast(replace(b.[Market cap],N'T EUR', N'') as float) * 1000 
     when b.[Market cap] like N'%B EUR%' then cast(replace(b.[Market cap],N'B EUR', N'') as float)
	 when b.[Market cap] like N'%M EUR%' then cast(replace(b.[Market cap],N'M EUR', N'') as float)/1000
 else b.[Market cap]
	end [Market Cap B],
case when b.[Net income(FY)] like N'%T EUR%' then cast(replace(b.[Net income(FY)],N'T EUR', N'') as float) * 1000 
     when b.[Net income(FY)] like N'%B EUR%' then cast(replace(b.[Net income(FY)],N'B EUR', N'') as float)
	 when b.[Net income(FY)] like N'%M EUR%' then cast(replace(b.[Net income(FY)],N'M EUR', N'') as float)/1000
 else b.[Net income(FY)]
	end [Net income(FY) B]
from BoursViewGermany b
where not exists(select 1 from [dbo].BoursViewGermany b2 where b.Symbol = b2.Symbol and b2.createdate > b.createdate)
)
select Id
,[Symbol]
,[Net income(FY) B] [Net income(FY)]
,[Price]
,[Change % 1D]
,[Change 1D]
,[Technical Rating 1D]
,[Volume 1D]
,[Volume * Price 1D]
,[Market cap]
,[Market cap perf % 1Y]
,[P/E]
,[EPS(TTM)]
,[Employees(FY)]
,Sector
,createdate
,[Market Cap B]
,[Net income(FY) B]
,cast([Market Cap B] /[Net income(FY) B] as decimal(10,0))[InvestmentReturnPeriod]
from cte
