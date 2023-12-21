

CREATE   view [dbo].[VTavarrom] as 
select *
from VTavarrom_Denormal
--order by  desc
where isnull([رشد نسبت به سال 2005 با کسر 56 درصد تورم از سال 2005 تا اکنون],0) < 170
