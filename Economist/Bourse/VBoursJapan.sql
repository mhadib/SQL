




CREATE   view  [dbo].[VBoursJapan] as 
select * 
from VBoursJapan_Denormal
where [سود خالص] is not null
--where isnull([درصد تغییر نسبت به سال 2005],0) < 1500
