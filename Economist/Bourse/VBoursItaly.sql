

CREATE view  [dbo].[VBoursItaly]

as with cte as (
select b.Name, b.FullName , Gheymat [شاخص], YearDarsad [درصد تغییر نسبت با سال گذشته],null [شاخص بورس ۲۰۰۵ ],null [درصد تغییر نسبت به سال 2005],null as [رتبه بندی شرکت], null [سال ورود ], null [فعالیت شرکت ], null [معرفی شرکت]
from BoursItaly b
--join BoursItalyHistorical bh on b.Name = bh.Name
where not exists(select 1 from [dbo].BoursItaly b2 where b.Name = b2.Name and b2.createdate > b.createdate) )
select [Name], FullName, [شاخص], [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], 
case 
when [درصد تغییر نسبت به سال 2005] > 10 Then N'Grade A, دارای مزیت نسبی, دارای مزیت رقابتی, فوق العاده موفق, با سیاست انقباظی امریکا کاندید ریزش سهام' 
when [درصد تغییر نسبت به سال 2005] > 5 and [درصد تغییر نسبت به سال 2005] <= 10 Then N'Grade B, دارای مزیت نسبی, دارای مزیت رقابتی, موفق و نه فوق العاده موفق , با سیاست انقباظی امریکا کاندید ریزش سهام' 
when [درصد تغییر نسبت به سال 2005] > 2.47 and [درصد تغییر نسبت به سال 2005] <= 5 Then N'Grade C, دارای مزیت نسبی, دارای مزیت رقابتی, موفق ضعیف, با سیاست انقباظی امریکا کاندید ریزش سهام' 
when [درصد تغییر نسبت به سال 2005] <= 2.47 Then case 

when [فعالیت شرکت ] in (select [فعالیت شرکت ] from cte where [درصد تغییر نسبت به سال 2005] > 2.47 ) then N'Grade D+, دارای مزیت نسبی, فاقد مزیت رقابتی, ناموفق, پیشنهاد فروش سهم'
when [فعالیت شرکت ] not in (select [فعالیت شرکت ] from cte where [درصد تغییر نسبت به سال 2005] > 2.47 ) then N'Grade D-, فاقد مزیت نسبی و رقابتی, فوق العاده ضعیف, با سیاست انقباظی امریکا در معرض ریزش سهم, پیشنهاد فروش'
end 
end [رتبه بندی شرکت],

 [فعالیت شرکت ], [معرفی شرکت],N'('+cast([سال ورود ] as nvarchar(200))+N')' [سال ورود ] from cte
