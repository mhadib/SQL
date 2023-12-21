


CREATE procedure [dbo].[Clean_HistoricalData]
as 
begin
delete HistoricalChartayi
where exists(select 1 from HistoricalChartayi h2 where HistoricalChartayi.instrumentId = h2.instrumentId and HistoricalChartayi.day = h2.day and h2.id > HistoricalChartayi.id)

delete oragh
where exists(select 1 from oragh o where o.ticker = oragh.ticker and o.createdate > Oragh.createdate) 

--select * from Company
delete Company 
where --createdate < dateadd(day,-10, Getdate()) and 
 exists(select 1 from Company C where cast(c.CreateDate as date) > cast(Company.CreateDate as date))

--select * from Industries
delete Industries
where
--createdate < dateadd(day,-10, Getdate())and 
exists(select 1 from Industries i where i.nameFa = Industries.nameFa and i.CreateDate > Industries.CreateDate )





delete
from BalanceSheetGheyreTalfighiCategurbalancesheet_bourse 
where exists(select 1 from BalanceSheetGheyreTalfighiCategurbalancesheet_bourse b2 
where BalanceSheetGheyreTalfighiCategurbalancesheet_bourse.instrumentId = b2.instrumentId
and BalanceSheetGheyreTalfighiCategurbalancesheet_bourse.[day] = b2.[day]
and BalanceSheetGheyreTalfighiCategurbalancesheet_bourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetGheyreTalfighiCategurbalancesheet_bourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetGheyreTalfighiCategurbalancesheet_bourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetGheyreTalfighiCategurbalancesheet_bourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)

delete
from BalanceSheetGheyreTalfighiCategurbalancesheet_farabourse 
where exists(select 1 from BalanceSheetGheyreTalfighiCategurbalancesheet_farabourse b2 
where BalanceSheetGheyreTalfighiCategurbalancesheet_farabourse.instrumentId = b2.instrumentId
and BalanceSheetGheyreTalfighiCategurbalancesheet_farabourse.[day] = b2.[day]
and BalanceSheetGheyreTalfighiCategurbalancesheet_farabourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetGheyreTalfighiCategurbalancesheet_farabourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetGheyreTalfighiCategurbalancesheet_farabourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetGheyreTalfighiCategurbalancesheet_farabourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)

delete
from BalanceSheetGheyreTalfighiCategurIncomeStatement_bourse 
where exists(select 1 from BalanceSheetGheyreTalfighiCategurIncomeStatement_bourse  b2 
where BalanceSheetGheyreTalfighiCategurIncomeStatement_bourse.instrumentId = b2.instrumentId
and BalanceSheetGheyreTalfighiCategurIncomeStatement_bourse.[day] = b2.[day]
and BalanceSheetGheyreTalfighiCategurIncomeStatement_bourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetGheyreTalfighiCategurIncomeStatement_bourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetGheyreTalfighiCategurIncomeStatement_bourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetGheyreTalfighiCategurIncomeStatement_bourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)

delete
from BalanceSheetGheyreTalfighiCategurIncomeStatement_farabourse 
where exists(select 1 from BalanceSheetGheyreTalfighiCategurIncomeStatement_farabourse  b2 
where BalanceSheetGheyreTalfighiCategurIncomeStatement_farabourse.instrumentId = b2.instrumentId
and BalanceSheetGheyreTalfighiCategurIncomeStatement_farabourse.[day] = b2.[day]
and BalanceSheetGheyreTalfighiCategurIncomeStatement_farabourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetGheyreTalfighiCategurIncomeStatement_farabourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetGheyreTalfighiCategurIncomeStatement_farabourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetGheyreTalfighiCategurIncomeStatement_farabourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)


delete
from BalanceSheetGheyreTalfighiCategurCashflow_Bourse 
where exists(select 1 from BalanceSheetGheyreTalfighiCategurCashFlow_bourse   b2 
where BalanceSheetGheyreTalfighiCategurCashFlow_bourse.instrumentId = b2.instrumentId
and BalanceSheetGheyreTalfighiCategurCashFlow_bourse.[day] = b2.[day]
and BalanceSheetGheyreTalfighiCategurCashFlow_bourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetGheyreTalfighiCategurCashFlow_bourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetGheyreTalfighiCategurCashFlow_bourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetGheyreTalfighiCategurCashFlow_bourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)

delete
from BalanceSheetGheyreTalfighiCategurCashflow_FaraBourse 
where exists(select 1 from BalanceSheetGheyreTalfighiCategurCashflow_FaraBourse   b2 
where BalanceSheetGheyreTalfighiCategurCashflow_FaraBourse.instrumentId = b2.instrumentId
and BalanceSheetGheyreTalfighiCategurCashflow_FaraBourse.[day] = b2.[day]
and BalanceSheetGheyreTalfighiCategurCashflow_FaraBourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetGheyreTalfighiCategurCashflow_FaraBourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetGheyreTalfighiCategurCashflow_FaraBourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetGheyreTalfighiCategurCashflow_FaraBourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)


delete
from BalanceSheetTalfighiCategurbalancesheet_bourse 
where exists(select 1 from BalanceSheetTalfighiCategurbalancesheet_bourse b2 
where BalanceSheetTalfighiCategurbalancesheet_bourse.instrumentId = b2.instrumentId
and BalanceSheetTalfighiCategurbalancesheet_bourse.[day] = b2.[day]
and BalanceSheetTalfighiCategurbalancesheet_bourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetTalfighiCategurbalancesheet_bourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetTalfighiCategurbalancesheet_bourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetTalfighiCategurbalancesheet_bourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)

delete
from BalanceSheetTalfighiCategurbalancesheet_farabourse 
where exists(select 1 from BalanceSheetTalfighiCategurbalancesheet_farabourse b2 
where BalanceSheetTalfighiCategurbalancesheet_farabourse.instrumentId = b2.instrumentId
and BalanceSheetTalfighiCategurbalancesheet_farabourse.[day] = b2.[day]
and BalanceSheetTalfighiCategurbalancesheet_farabourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetTalfighiCategurbalancesheet_farabourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetTalfighiCategurbalancesheet_farabourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetTalfighiCategurbalancesheet_farabourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)

delete
from BalanceSheetTalfighiCategurIncomeStatement_bourse 
where exists(select 1 from BalanceSheetTalfighiCategurIncomeStatement_bourse  b2 
where BalanceSheetTalfighiCategurIncomeStatement_bourse.instrumentId = b2.instrumentId
and BalanceSheetTalfighiCategurIncomeStatement_bourse.[day] = b2.[day]
and BalanceSheetTalfighiCategurIncomeStatement_bourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetTalfighiCategurIncomeStatement_bourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetTalfighiCategurIncomeStatement_bourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetTalfighiCategurIncomeStatement_bourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)

delete
from BalanceSheetTalfighiCategurIncomeStatement_farabourse 
where exists(select 1 from BalanceSheetTalfighiCategurIncomeStatement_farabourse  b2 
where BalanceSheetTalfighiCategurIncomeStatement_farabourse.instrumentId = b2.instrumentId
and BalanceSheetTalfighiCategurIncomeStatement_farabourse.[day] = b2.[day]
and BalanceSheetTalfighiCategurIncomeStatement_farabourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetTalfighiCategurIncomeStatement_farabourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetTalfighiCategurIncomeStatement_farabourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetTalfighiCategurIncomeStatement_farabourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)


delete
from BalanceSheetTalfighiCategurCashflow_Bourse 
where exists(select 1 from BalanceSheetTalfighiCategurCashFlow_bourse   b2 
where BalanceSheetTalfighiCategurCashFlow_bourse.instrumentId = b2.instrumentId
and BalanceSheetTalfighiCategurCashFlow_bourse.[day] = b2.[day]
and BalanceSheetTalfighiCategurCashFlow_bourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetTalfighiCategurCashFlow_bourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetTalfighiCategurCashFlow_bourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetTalfighiCategurCashFlow_bourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)

delete
from BalanceSheetTalfighiCategurCashflow_FaraBourse 
where exists(select 1 from BalanceSheetTalfighiCategurCashflow_FaraBourse   b2 
where BalanceSheetTalfighiCategurCashflow_FaraBourse.instrumentId = b2.instrumentId
and BalanceSheetTalfighiCategurCashflow_FaraBourse.[day] = b2.[day]
and BalanceSheetTalfighiCategurCashflow_FaraBourse.[سال مالی] = b2.[سال مالی]
and BalanceSheetTalfighiCategurCashflow_FaraBourse.[ماه مالی] = b2.[ماه مالی]
and BalanceSheetTalfighiCategurCashflow_FaraBourse.[تاریخ انتشار] = b2.[تاریخ انتشار]
and BalanceSheetTalfighiCategurCashflow_FaraBourse.CreateDate > b2.CreateDate
)
or instrumentId not in (select ticker from vCompany)
end
