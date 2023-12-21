
CREATE   view  [dbo].[VBoursAustralia] as 
 select * 
 from VBoursAustralia_Denormal
 --where isnull([رشد شاخص بورس نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم],0) < 1000
 where [سود خالص] is not null
