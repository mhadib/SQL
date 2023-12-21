




      CREATE       view  [dbo].[VBoursUSDovJones]  as 
	  select * 
	  from VBoursUSDovJones_Denormal
	  where [سود خالص] is not null
	  --order by [رشد شاخص بورس نسبت به سال 2005 با کسر تورم] desc
	  --where isnull([رشد شاخص بورس نسبت به سال 2005 با کسر تورم],0) < 800
	  --where [سود خالص] is not null
