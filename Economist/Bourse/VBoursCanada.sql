



CREATE   view  [dbo].[VBoursCanada] as 
select * 
from VBoursCanada_Denormal
--order by [رشد شاخص بورس نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم] desc
--where isnull([رشد شاخص بورس نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم],0) < 800
where [سود خالص] is not null
