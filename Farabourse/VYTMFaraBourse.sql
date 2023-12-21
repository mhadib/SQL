CREATE View VYTMFaraBourse
as
select SymboleFa, Price, 
case when LastDate = N'' then null else cast(format([dbo].[PersianToMiladi](LastDate),'yyyyMMdd') as int) end LastTradeDateOragh,
case when (SarresidDate = N'' or SarresidDate = N'0' ) then null else cast(format([dbo].[PersianToMiladi](SarresidDate),'yyyyMMdd') as int) end SarresidDateOragh,
--SarresidDate,
cast(replace(replace(YTM,N'%',N''),N'/',N'.') as float) YTM,
cast(replace(replace(BazdehSalane,N'%',N''),N'/',N'.') as float) BazdehSalaneOragh
from YTMFaraBourse yt
where not exists(select 1 from YTMFaraBourse y where yt.SymboleFa = y.SymboleFa and y.CreateDate > yt.CreateDate)
and ytm != N'سررسید شده'