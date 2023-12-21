



CREATE view [dbo].[vStackHoldersPre]

as
with cte as (
select  StackHolderTitle [سهامدار], CompanyTitle [اسم شرکت], ShareCount [تعداد سهم], 
cast(case when isnumeric(ChangeCount)=cast(1 as bit)  then ChangeCount else --N'-'+
-1*cast(replace(replace(replace(replace(ChangeCount,N',',N''),N'(',N''),N')',N''),N' 0',N'')as float) end as float) [میزان تغییر]
, 
ChangeDateFa, nameFA,t.symbolFA, v.[قیمت پایانی سهم],ChangeDateEn, ChangeDateEnPersist

from dbo.StackHolders s1
left join dbo.vcompany t on  replace(replace(replace(nameFA,N'ي',N'ی'),N'ك',N'ک'),N' ',N'') = replace(replace(replace(CompanyTitle,N'ي',N'ی'),N'ك',N'ک'),N' ',N'')
left join dbo.VChartayi v on t.symbolFA = v.نماد
where not exists(select 1 from dbo.StackHolders s2 where s1.CompanyTitle = s2.CompanyTitle and s1.StackHolderTitle = s2.StackHolderTitle and s1.ChangeDateEnPersist = s2.ChangeDateEnPersist and s2.id > s1.id))
select 
[سهامدار]
, [اسم شرکت]
, [تعداد سهم]
, [میزان تغییر]
, ChangeDateFa
, nameFA
, symbolFA
, [قیمت پایانی سهم]
, ChangeDateEn
, ChangeDateEnPersist


, cast(([قیمت پایانی سهم]* [میزان تغییر])/10000000000 as decimal(10,2)) [ارزش معامله]
from cte
