





  CREATE   view  [dbo].[VBoursEnglis] as 
  select * 
  from VBoursEnglis_Denormal
  where [سود خالص] is not null
  --order by [رشد شاخص بورس نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم] desc
  --where isnull([رشد شاخص بورس نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم],0) < 100
