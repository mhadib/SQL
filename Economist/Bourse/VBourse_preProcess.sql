

CREATE   view [dbo].[VBourse_preProcess]
as
select * 
from VBourse_Denormal
--where isnull([رشد نسبت به 2005],0) < 10000
