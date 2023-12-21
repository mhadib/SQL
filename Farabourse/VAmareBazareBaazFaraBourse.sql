


CREATE view [dbo].[VAmareBazareBaazFaraBourse]
as 
select Id, cast(format([dbo].[PersianToMiladi](TradeDate),'yyyyMMdd') as int) TradeDate,
case when PazireNevisiDolati like N'%B%' then cast(replace(replace(Replace(PazireNevisiDolati,N',',N''),N'/',N'.'),N'B',N'') as float)    
     when PazireNevisiDolati like N'%M%' then cast(replace(replace(Replace(PazireNevisiDolati,N',',N''),N'/',N'.'),N'M',N'') as float)/1000
	 else PazireNevisiDolati end PazireNevisiDolati,
cast(replace(replace(Replace(AmaliatBazarBaaz,N',',N''),N'/',N'.'),N'B',N'') as float) AmaliatBazarBaaz,
cast(replace(replace(Replace(Saayer,N',',N''),N'/',N'.'),N'B',N'') as float) Saayer,
CreateDate
from AmareBazareBaazFaraBourse a
where not exists(select 1 from AmareBazareBaazFaraBourse a2 where a.TradeDate = a2.TradeDate and a2.id > a.id)
