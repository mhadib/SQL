




  CREATE view  [dbo].[VBoursUSNasdaq]  as 
  select * 
  from VBoursUSNasdaq_Denormal
  where [سود خالص] is not null
  --order by [رشد شاخص بورس نسبت به سال 2005 با کسر تورم] desc
  --where isnull([رشد شاخص بورس نسبت به سال 2005 با کسر تورم],0) < 3000
  --where [سود خالص] is not null
