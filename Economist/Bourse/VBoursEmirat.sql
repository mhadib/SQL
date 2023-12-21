


 CREATE      view  [dbo].[VBoursEmirat] as 
 select * 
 from VBoursEmirat_Denormal
 --where isnull([رشد شاخص بورس نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم],0) < 5000
