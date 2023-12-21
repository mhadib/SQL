



CREATE   view  [dbo].[VBoursTorkey] as 
select * 
from VBoursTorkey_Denormal
where [سود خالص] is not null
--where isnull([رشد شاخص بورس نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم] ,0) < 150
