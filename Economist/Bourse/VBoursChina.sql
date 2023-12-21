




	   CREATE   view  [dbo].[VBoursChina]  as 
	   select * 
	   from VBoursChina_Denormal
	   where [سود خالص] is not null
	   --order by [رشد شاخص بورس نسبت به سال 2005 با تعدیل برابری نرخ ارز] desc
	   --where isnull([رشد شاخص بورس نسبت به سال 2005 با تعدیل برابری نرخ ارز],0) < 2000
