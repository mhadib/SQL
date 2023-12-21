


CREATE view [dbo].[vCompany]

as 
select ticker
,symbol
,name
,symbolFA
,nameFA
,marketName
,exchangeName
,industryIndex
,exchange
,company
,status
,board
,market
,firstTradingDay
,companyCode
,minQuantityOrder
,maxQuantityOrder
,[type.code]
,[industry.tse]
,[industry.bourseview]
,[company.key]
,[company.type]
,[company.nationalCode]
,CreateDate
, Id
from dbo.company b
where not exists(select 1 from dbo.company b2 where b.ticker = b2.ticker and b2.CreateDate > b.CreateDate)

