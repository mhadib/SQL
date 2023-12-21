create    view  [dbo].[VBoursSaudiarabia]
as
select b.Name, b.FullName , Gheymat [شاخص], YearDarsad [درصد تغییر نسبت با سال گذشته],null [ارزش بورس نزدک  ۲۰۰۵ ],null [درصد تغییر نسبت به سال 2005], null [سال ورود ]
from BoursSaudiarabia b
where not exists(select 1 from [dbo].BoursSaudiarabia b2 where b.Name = b2.Name and b2.createdate > b.createdate) 
