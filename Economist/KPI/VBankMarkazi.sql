
--select * from VBankMarkazi

create view [dbo].[VBankMarkazi]
as
with cte as(
select b.*, dbo.RetreiveVahed(b.Vahed) Vahed1, tgju.rate, 
dbo.TabdilNerkheArzToMDollar(b.Akharin, DollarDevids, b.Vahed, tgju.rate) [تراز بانک مرکزی به ملیون دلار],
dbo.TabdilNerkheArzToMDollar(cast(bmh.[تراز بانک مرکزی سال2005] as decimal(30,2)), 0, b.Vahed, nb.[نرخ برابری در سال 2005]) [تراز بانک مرکزی در سال 2005 به ملیون دلار], 
bmh.[تراز بانک مرکزی سال2005]
--,N'' [تراز بانک مرکزی در سال 2005 به ملیون انس طلا]
from BankMarkazi b
left join vtgjuCurrency tgju on (dbo.RetreiveVahed(b.Vahed) = substring(rtrim(ltrim(pName)),1,3))
left join BankMarkaziHistory bmh on b.Keshvar = bmh.Keshvar
left join vNerkheBarabari nb on nb.PName like N'%'+dbo.RetreiveVahed(b.Vahed)+'%'
where not exists(select 1 from BankMarkazi b2 where b.Keshvar = b2.Keshvar  and b2.CreateDate > b.CreateDate)
and b.Keshvar in (select ['keshvar'] from VKasriHesabeJari))
,cte2 as (
select * ,
cast([تراز بانک مرکزی در سال 2005 به ملیون دلار] / 535 as decimal(10,0))
[تراز بانک مرکزی در سال 2005 به  ملیون انس طلا],

cast([تراز بانک مرکزی به ملیون دلار] / 1857 as decimal(10,0))
[تراز بانک مرکزی در نقطه موجود به ملیون انس طلا]  
from cte
where Keshvar not like N'%مونت%' and Keshvar not like N'%منطقهیورو%'),
cte3 as(
select *,case when [تراز بانک مرکزی به ملیون دلار] > 0 then [تراز بانک مرکزی به ملیون دلار]/(select sum([تراز بانک مرکزی به ملیون دلار]) from cte2 where [تراز بانک مرکزی به ملیون دلار] > 0 ) else 0 end as [نسبت از کل] ,

cast(case when [تراز بانک مرکزی در سال 2005 به  ملیون انس طلا]  != 0 then 
([تراز بانک مرکزی در نقطه موجود به ملیون انس طلا]  - [تراز بانک مرکزی در سال 2005 به  ملیون انس طلا]) /[تراز بانک مرکزی در سال 2005 به  ملیون انس طلا] else 0 end as decimal(10,3)) 
[رشد تراز بانک مرکزی  نسبت به سال 2005 به ملیون انس طلا]
from cte2)
select 
Keshvar, Akharin, Vahed, Vahed1, rate, cast([تراز بانک مرکزی به ملیون دلار] as decimal(20,0)) [تراز بانک مرکزی به ملیون دلار], [تراز بانک مرکزی سال2005], cast([نسبت از کل] as decimal(6, 2))[نسبت از کل]
, cast(case when [تراز بانک مرکزی سال2005] != 0 then ([تراز بانک مرکزی به ملیون دلار] - [تراز بانک مرکزی سال2005])/[تراز بانک مرکزی سال2005] else 0 end as decimal(20, 2)) [رشد نسبت به سال 2005]
,   cast(SUM([نسبت از کل]) OVER(ORDER BY [نسبت از کل] desc) as decimal(4,2)) تجمعی, [تراز بانک مرکزی در سال 2005 به  ملیون انس طلا], [تراز بانک مرکزی در نقطه موجود به ملیون انس طلا], [رشد تراز بانک مرکزی  نسبت به سال 2005 به ملیون انس طلا]
from cte3 
