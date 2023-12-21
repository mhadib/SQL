


 CREATE view  [dbo].[VBoursKorea]  as
 select * 
 from VBoursKorea_Denormal
 where [سود خالص] is not null
 --where isnull([درصد تغییر نسبت به سال 2005],0) < 1000
