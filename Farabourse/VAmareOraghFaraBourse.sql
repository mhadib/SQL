


--declare @cmd nvarchar(max) = N''
--select @cmd = @cmd + 'v.['+name+'],' 
--from sys.columns
--where object_id = 2043154324
--select @cmd
CREATE view [dbo].[VAmareOraghFaraBourse] as 
select Id,  cast(format([dbo].[PersianToMiladi](TradeDate),'yyyyMMdd') as int) TradeDate, 

case when KharidDolat like N'%M%' then 0.001 else 1 end * cast(replace(replace(replace(Replace(KharidDolat,N',',N''),N'/',N'.'),N'B',N''),N'M',N'') as float) KharidDolat,

case when KharidBankMarkazi like N'%M%' then 0.001 else 1 end * cast(replace(replace(replace(Replace(KharidBankMarkazi,N',',N''),N'/',N'.'),N'B',N''),N'M',N'') as float) KharidBankMarkazi

,case when KharidSandoghHa like N'%M%' then 0.001 else 1 end * cast(replace(replace(replace(Replace(KharidSandoghHa,N',',N''),N'/',N'.'),N'B',N''),N'M',N'') as float) KharidSandoghHa

,case when KharidBankHa like N'%M%' then 0.001 else 1 end * cast(replace(replace(replace(Replace(KharidBankHa,N',',N''),N'/',N'.'),N'B',N''),N'M',N'') as float) KharidBankHa

,case when KharidSayerAshkhas like N'%M%' then 0.001 else 1 end * cast(replace(replace(replace(Replace(KharidSayerAshkhas,N',',N''),N'/',N'.'),N'B',N''),N'M',N'') as float) KharidSayerAshkhas

,case when ForushDolat like N'%M%' then 0.001 else 1 end * cast(replace(replace(replace(Replace(ForushDolat,N',',N''),N'/',N'.'),N'B',N''),N'M',N'') as float) ForushDolat

,case when ForushSandoghHa like N'%M%' then 0.001 else 1 end * cast(replace(replace(replace(Replace(ForushSandoghHa,N',',N''),N'/',N'.'),N'B',N''),N'M',N'') as float) ForushSandoghHa

,case when ForushBankHa like N'%M%' then 0.001 else 1 end * cast(replace(replace(replace(Replace(ForushBankHa,N',',N''),N'/',N'.'),N'B',N''),N'M',N'') as float) ForushBankHa

,case when ForushBankMarkazi like N'%M%' then 0.001 else 1 end * cast(replace(replace(replace(Replace(ForushBankMarkazi,N',',N''),N'/',N'.'),N'B',N''),N'M',N'') as float) ForushBankMarkazi

,case when ForushSayerAshkhas like N'%M%' then 0.001 else 1 end * cast(replace(replace(replace(Replace(ForushSayerAshkhas,N',',N''),N'/',N'.'),N'B',N''),N'M',N'') as float) ForushSayerAshkhas
,CreateDate
from AmareOraghFaraBourse a
where not exists(select 1 from AmareOraghFaraBourse t where t.TradeDate =  a.TradeDate and t.id > a.id)


