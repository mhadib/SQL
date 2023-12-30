





--select * from VPreBalanceSheetGheyreTalfighi_FaraBourse
CREATE     view [dbo].[VPreBalanceSheetGheyreTalfighi_FaraBourse]
		as 
		with cte as 
	(
	select *,
cast(((
case when isnull(cf.['سود (زیان) عملیات در حال تداوم قبل از مالیات'],0)!= 0 then ['سود (زیان) عملیات در حال تداوم قبل از مالیات']
	 when isnull(cf.['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات'],0) != 0 then cf.['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات']
	 when isnull(['سود (زیان) خالص'],0) != 0 then ['سود (زیان) خالص']
end )/cf.[ماه مالی]*12) as decimal(30,4)) [سود خالص تعدیل شده یک ساله],
cast(cf.['فروش']/cf.[ماه مالی]*12 as decimal(20,4))[فروش تعدیل شده یک ساله],
cast(cf.['بهای تمام شده کالای فروش رفته']/cf.[ماه مالی]*12 as decimal(20,2))[بهای تمام شده تعدیل شده یک ساله],
case when cf.['جمع داراییهای جاری'] != 0 then cast(cf.['جمع بدهیهای جاری'] / cf.['جمع داراییهای جاری'] as decimal(20,0)) else 0 end [نسبت بدهی جاری به دارایی جاری],
cast(((cf.['جمع داراییهای جاری'] - cf.['جمع بدهیهای جاری'])) as decimal(10,0)) [خالص داریی جاری]
	from VPreBalanceSheetGheyreTalfighi_FaraBourse_Drop_Bilion cf
	), 
cteSums as (select sum([سود خالص تعدیل شده یک ساله])+0.00000001 [سود خالص تعدیل شده یک ساله],
sum(['داراییهای ثابت مشهود'])+0.00000001 ['داراییهای ثابت مشهود'] , sum([فروش تعدیل شده یک ساله])+0.00000001 [فروش تعدیل شده یک ساله], 
sum(['موجودی نقد'])+0.00000001 ['موجودی نقد'], sum(['سرمایه گذاری در املاک'])+0.00000001 ['سرمایه گذاری در املاک'] , sum(['سرمایه گذاری کوتاه مدت'])+0.00000001 ['سرمایه گذاری کوتاه مدت'], sum(['سرمایه گذاریهای بلند مدت'])+0.00000001 ['سرمایه گذاریهای بلند مدت'], 
sum([خالص داریی جاری]) [خالص داریی جاری], sum(['تسهیلات مالی دریافتی بلند مدت']) ['تسهیلات مالی دریافتی بلند مدت'],  sum(['حصه جاری تسهیلات مالی دریافتی']) ['حصه جاری تسهیلات مالی دریافتی'], sum(['سایر سپرده ها']) ['سایر سپرده ها'], SUM(['سپرده های سرمایه گذاری مدت دار']) ['سپرده های سرمایه گذاری مدت دار'] , sum(['سپرده های قرض الحسنه و پس اندار و مشابه']) ['سپرده های قرض الحسنه و پس اندار و مشابه'] , sum(['سپرده های دیداری']) ['سپرده های دیداری'], sum(['سود سهام پیشنهادی و پرداختنی']) ['سود سهام پیشنهادی و پرداختنی']
from cte)

select cte.[InstrumentId]
, cte.[symbolFA]
, cte.[day]
, cte.[سال مالی]
, cte.[ماه مالی]
, cte.[روز آخر دوره]
, cte.[روز آخر سال مالی]
, cte.[تاریخ انتشار]
, cte.['فروش']
, cte.['بهای تمام شده کالای فروش رفته']
, cte.['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات']
, cte.['موجودی نقد']
, cte.['سرمایه گذاری کوتاه مدت']
, cte.['سایر حسابها و اسناد دریافتنی']
, cte.['موجودی مواد و کالا']
, cte.['پیش پرداخت ها']
, cte.['دارایی های نگهداری شده برای فروش']
, cte.['جمع داراییهای جاری']
, cte.['سرمایه گذاریهای بلند مدت']
, cte.['داراییهای ثابت مشهود']
, cte.['حسابها و اسناد دریافتنی تجاری بلند مدت']
, cte.['سایر دارایی ها']
, cte.['جمع داراییهای غیرجاری']
, cte.['ج'مع داراییها]
, cte.['پیش دریافتها']
, cte.['ذخیره مالیات بر درامد']
, cte.['سود سهام پیشنهادی و پرداختنی']
, cte.['حصه جاری تسهیلات مالی دریافتی']
, cte.['جمع بدهیهای جاری']
, cte.['جمع بدهیهای جاری و غیر جاری']
, cte.['حسابها و اسناد پرداختنی بلند مدت']
, cte.['تسهیلات مالی دریافتی بلند مدت']
, cte.['سود (زیان) انباشته']
, cte.['دریافتنی‌های تجاری و سایر دریافتنی‌ها']
, cte.['پرداختنی‌های تجاری و سایر پرداختنی‌ها']
, cte.['سرمایه گذاری در املاک']
, cte.['ذخایر']
, cte.['مطالبات از سایر بانکها و موسسات اعتباری']
, cte.['مطالبات از بانک مرکزی']
, cte.['سپرده های دیداری']
, cte.['سپرده های قرض الحسنه و پس اندار و مشابه']
, cte.['بدهی به بانک مرکزی']
, cte.['سایر سپرده ها']
, cte.['بدهی به بانکها و موسسات اعتباری']
, cte.['جمع بدهیها و حقوق صاحبان سهام']
, cte.['مطالبات از دولت']
, cte.['تسهیلات اعطایی و مطالبات از اشخاص دولتی']
, cte.['تسهیلات اعطایی به سایر اشخاص']
, cte.['سپرده های سرمایه گذاری مدت دار']
, cte.['حسابها و اسناد دریافتنی تجاری']
, cte.['حسابها و اسناد پرداختنی تجاری']
, cte.['سایر حسابها و اسناد پرداختنی']
, cte.['سپرده قانونی']
, cte.['اندوخته صرف سهام']
, cte.['پیش پرداخت های سرمایه ای']
, cte.['بدهی‌های مرتبط با دارایی‌های غیر جاری نگهداری شده برای فروش']
, cte.[CreateDate]
, cte.['سرمایه گذاری در اوراق بهادار']
, cte.['سایر دریافتنی‌ها و پیش‌پرداخت‌ها']
, cte.['سایر سرمایه گذاری ها']
, cte.['تسهیلات اعطایی به اشخاص']
, cte.['سرمایه‌گذاری‌ در اوراق بهادار وسپرده های بانکی']
,cte.[سود خالص تعدیل شده یک ساله]
,cte.[فروش تعدیل شده یک ساله]
,cte.[بهای تمام شده تعدیل شده یک ساله]
,cte.['جمع حقوق صاحبان سهام']
,cte.['ذخیره مزایای پایان خدمت']
,cte.['ذخایر و سایر بدهی ها']
,
	cast (case when cte.[فروش تعدیل شده یک ساله] = 0 then 0 else  cte.[بهای تمام شده تعدیل شده یک ساله] / cte.[فروش تعدیل شده یک ساله] end as decimal(30,2)) [بهای تمام شده کالا به فروش],

cte.['پرداختنی‌های تجاری و سایر پرداختنی‌ها'] [بدهی به بازار]
	,i.GroupName ,
	cast(case when cte.[خالص داریی جاری] != 0 then cte.[فروش تعدیل شده یک ساله]/cte.[خالص داریی جاری] else 0 end as decimal(30,12)) [فروش چند برابر خالص دارایی جاریست],
cast(case when v.[ارزش بازار] != 0 then cte.[سود خالص تعدیل شده یک ساله] / v.[ارزش بازار] else 0 end as decimal(30,4)) [سود خالص به ارزش بازار]
  ,
v.[ارزش بازار]


,
--,['سرمایه گذاری در اوراق بهادار'] 
--,['سایر دریافتنی‌ها و پیش‌پرداخت‌ها'] 
--,['سایر سرمایه گذاری ها'] 
--,['تسهیلات اعطایی به اشخاص'] 
--,['سرمایه‌گذاری‌ در اوراق بهادار وسپرده های بانکی'] 
cte.[سود خالص تعدیل شده یک ساله] / (select [سود خالص تعدیل شده یک ساله] from cteSums) [درصد سود هر شرکت از کل سود شرکت ها]
,
cast(cte.[سود خالص تعدیل شده یک ساله]/ (select [سود خالص تعدیل شده یک ساله] from cteSums)as decimal(30,7)) [درصد سود خالص هر شرکت از کل سود خالص شرکت ها],
cast(cte.[فروش تعدیل شده یک ساله]/ (select [فروش تعدیل شده یک ساله] from cteSums)as decimal(30,7)) [درصد فروش هر شرکت از کل فروش شرکت ها],
cast(cte.[خالص داریی جاری]/ (select [خالص داریی جاری] from cteSums)as decimal(30,7)) [درصد خالص دارایی هر شرکت از کل دارایی شرکت ها],
case when i.GroupName = N'صنایع انرژی محور' then cte.[سود خالص تعدیل شده یک ساله]/(select [سود خالص تعدیل شده یک ساله] from cteSums) else 0 end [درصد شرکت انرژی محور چند درصد از کل سود خالص]
,
case when i.GroupName = N'معادن' then cte.[سود خالص تعدیل شده یک ساله]/(select [سود خالص تعدیل شده یک ساله] from cteSums) else 0 end [درصد معادن چند درصد از کل سود خالص]
,

case when i.GroupName = N'بانک' then( cte.['سایر سپرده ها'] + cte.['سپرده های سرمایه گذاری مدت دار'] + cte.['سپرده های قرض الحسنه و پس اندار و مشابه'] + cte.['سپرده های دیداری'])/(select ['سایر سپرده ها'] + ['سپرده های سرمایه گذاری مدت دار'] + ['سپرده های قرض الحسنه و پس اندار و مشابه'] + ['سپرده های دیداری'] from cteSums) else 0 end
[درصد هر بانک از چهارسپرده]
,
case when i.GroupName = N'بانک' then cte.['بدهی به بانکها و موسسات اعتباری']/(select ['بدهی به بانکها و موسسات اعتباری'] from cteSums where i.groupname = N'بانک') else 0 end 
[درصد بدهی هر بانک به سایر بانک ها],
cte.['تسهیلات مالی دریافتی بلند مدت'] + cte.['حصه جاری تسهیلات مالی دریافتی']
[بدهی به بانکها],
((cte.['تسهیلات مالی دریافتی بلند مدت'] + cte.['حصه جاری تسهیلات مالی دریافتی'])/(select ['تسهیلات مالی دریافتی بلند مدت'] + ['حصه جاری تسهیلات مالی دریافتی'] from cteSums))
[درصد بدهی هر شرکت به بانک از کل شرکت ها],
((cte.['سود سهام پیشنهادی و پرداختنی'])/(select ['سود سهام پیشنهادی و پرداختنی'] from cteSums))
[درصد هر شرکت از کل سود پیشنهادی و پرداختی],




cast(cte.['داراییهای ثابت مشهود'] / (select ['داراییهای ثابت مشهود'] from cteSums)as decimal(30,7)) [سهم هر شرکت از کل دارایی ثابت شرکت ها]
,
cast(cte.['موجودی نقد'] / (select ['موجودی نقد'] from cteSums)as decimal(30,7)) [سهم هر شرکت از کل وجوه نقد و موجودی نزد بانک ها],
cast((cte.['سرمایه گذاری در املاک'] + cte.['سرمایه گذاری کوتاه مدت'] + cte.['سرمایه گذاریهای بلند مدت'])/(select (['سرمایه گذاری در املاک'] + ['سرمایه گذاری کوتاه مدت'] + ['سرمایه گذاریهای بلند مدت']) from cteSums) as decimal(30,7))
[سهم هر شرکت از کل هر سرمایه گذاری و سایر دارایی],



case when cte.[فروش تعدیل شده یک ساله] != 0 then cast(( cte.['جمع بدهیهای جاری'] /(cte.[فروش تعدیل شده یک ساله])) as decimal(30,2)) else 0 end  [نسبت بدهی به فروش] ,
	case when cte.[فروش تعدیل شده یک ساله] != 0 then cast(cte.[سود خالص تعدیل شده یک ساله] / (cte.[فروش تعدیل شده یک ساله]) as decimal(30,10))else 0 end [نسبت سود به فروش],
	
cast(case when cte.[فروش تعدیل شده یک ساله] = 0 then 0 else cte.['موجودی مواد و کالا'] / cte.[فروش تعدیل شده یک ساله] end as decimal(30,2)) [نسبت موجودی مواد و کالا به فروش],
cast(cte.[فروش تعدیل شده یک ساله] / (select [فروش تعدیل شده یک ساله] from cteSums)as decimal(30,7)) 
[نسبت فروش هر شرکت از کل فروش شرکت ها],
cast(case when v.[ارزش بازار] != 0 then cte.[فروش تعدیل شده یک ساله] / v.[ارزش بازار] else 0 end as decimal(30,12)) [نسبت فروش به ارزش بازار],
cast(case when cte.[فروش تعدیل شده یک ساله] != 0 then cte.['جمع بدهیهای جاری']/cte.[فروش تعدیل شده یک ساله] else 0 end as decimal(30,5))[نسبت بدهی به فروش تعدیل شده یک ساله]
,
 cast(case when cte.['جمع بدهیهای جاری'] != 0 then cte.['موجودی مواد و کالا']/cte.['جمع بدهیهای جاری'] else 0 end as decimal(30,6))[نسبت موجودی مواد و کالا به بدهی]
,
  cast(case when cte.[فروش تعدیل شده یک ساله] != 0 then cte.['جمع داراییهای جاری']/cte.[فروش تعدیل شده یک ساله] else 0 end as decimal(30,6)) [نسبت دارایی جاری به فروش]
  ,
  (case when cte.[فروش تعدیل شده یک ساله] != 0 then cte.['پیش دریافتها']/cte.[فروش تعدیل شده یک ساله] else 0 end ) [نسبت پیش دریافت به فروش]
  ,case when cte.[سود خالص تعدیل شده یک ساله] != 0 then cte.['سود سهام پیشنهادی و پرداختنی']/cte.[سود خالص تعدیل شده یک ساله] else 0 end [نسبت سود تقسیمی به سود تعدیل شده یک ساله]
, (cte.['تسهیلات مالی دریافتی بلند مدت'] + cte.['حصه جاری تسهیلات مالی دریافتی'])/(select ['تسهیلات مالی دریافتی بلند مدت'] + ['حصه جاری تسهیلات مالی دریافتی'] from cteSums)	 [نسبت بدهی هر شرکت به بانک به کل بدهی شرکت ها به بانک],
 CASE WHEN cte.[سود خالص تعدیل شده یک ساله] != 0 THEN cte.['سود سهام پیشنهادی و پرداختنی']/ cte.[سود خالص تعدیل شده یک ساله]
 ELSE 0 END
[نسبت سود تقسیمی به سود تعدیل شده یکساله],
case when cte.[فروش تعدیل شده یک ساله] != 0 then cte.['جمع داراییهای جاری'] / cte.[فروش تعدیل شده یک ساله] else 0 end
[نسبت دارایی جاری به فروش تعدیل شده یکساله],

case when cte.[فروش تعدیل شده یک ساله] != 0 then 
(cte.['تسهیلات مالی دریافتی بلند مدت'] + cte.['حصه جاری تسهیلات مالی دریافتی']) / cte.[فروش تعدیل شده یک ساله] else 0 end
[نسبت بدهی به بانک به فروش]
,cte.[نسبت بدهی جاری به دارایی جاری]  
 ,cast(case when cte.[فروش تعدیل شده یک ساله] != 0 then cte.[خالص داریی جاری]/cte.[فروش تعدیل شده یک ساله] else 0 end as decimal(30,6)) [خالص دارایی جاری به فروش]
 ,
CASE WHEN cte.[فروش تعدیل شده یک ساله] != 0 THEN cte.['دریافتنی‌های تجاری و سایر دریافتنی‌ها']/cte.[فروش تعدیل شده یک ساله]
ELSE 0 END 
[طلب از بازار به فروش]
,
case when cte.[خالص داریی جاری]  != 0 then cast(([سود خالص تعدیل شده یک ساله] * 100 )/cte.[خالص داریی جاری] as decimal(10,1)) else 0 end  [سود خالص به خالص دارایی جاری]

,
cast(case when cte.[سود خالص تعدیل شده یک ساله]!= 0 then v.[ارزش بازار]  / cte.[سود خالص تعدیل شده یک ساله] else 0 end as decimal(30,0)) [دوران بازگشت سرمایه]
,
case when cte.[خالص داریی جاری] != 0 then v.[ارزش بازار]/cte.[خالص داریی جاری] else 0 end
[ارزش بازار چند برابر خالص دارایی جاری] ,

(cte.['تسهیلات مالی دریافتی بلند مدت'] + cte.['حصه جاری تسهیلات مالی دریافتی'])/*bedehi be bank*/ + cte.['پرداختنی‌های تجاری و سایر پرداختنی‌ها'] /*bedehi be bazar*/[بدهی به بانک و بازار]
,
cte.['سایر سپرده ها'] + cte.['سپرده های سرمایه گذاری مدت دار'] + cte.['سپرده های قرض الحسنه و پس اندار و مشابه'] + cte.['سپرده های دیداری']
[چهار سپرده]

,cte.[خالص داریی جاری]
, isnull(['جمع بدهیهای جاری و غیر جاری'],0) - (isnull(['ذخیره مالیات بر درامد'],0) +isnull(['ذخیره مزایای پایان خدمت'],0) + isnull(['ذخایر و سایر بدهی ها'],0) + isnull(['بدهی به بانکها و موسسات اعتباری'],0) + isnull(['سود سهام پیشنهادی و پرداختنی'],0))
['سپرده های مشتریان'],
cte.['سود (زیان) عملیات در حال تداوم قبل از مالیات'],
cte.['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم - عملیاتی'],
cte.['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم']
, cte.['بدهی بابت بیمه عمر و مدیریت سرمایه']
, cte.['مطالبات از بیمه گران و بیمه‌گران اتکایی']
, cte.['مطالبات از بیمه‌گذاران و نمایندگان']
, cte.['سهم بیمه گران اتکایی از ذخایر فنی']
, cte.['بدهی به بیمه‌گذاران و نمایندگان']
, cte.['بدهی به بیمه‌گران و بیمه‌گران اتکایی']
, cte.['ذخیره خسارت معوق ']
, cte.['سایر ذخایر فنی']
, cte.['ذخیره ریسک‌های منقضی نشده']
, cte.['سود (زیان) خالص']
, cte.['داراییهای نامشهود']
FROM CTE 
--join cteSums on 1 = 1
left join ForConvert i on cte.InstrumentId = i.InstrumentId
left join VChartayi v on cte.InstrumentId = v.instrumentId



