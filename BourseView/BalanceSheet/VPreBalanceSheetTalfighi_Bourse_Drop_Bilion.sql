--select distinct from [dbo].[VPreBalanceSheetTalfighi_Bourse_Drop_Bilion]
CREATE     view [dbo].[VPreBalanceSheetTalfighi_Bourse_Drop_Bilion]
	as
	select distinct hc.instrumentId InstrumentId,hc.symbolFA,hc.day,hc.[سال مالی],hc.[ماه مالی],hc.[روز آخر دوره],hc.[روز آخر سال مالی],hc.[تاریخ انتشار],
	cast(ics.['درآمدهای عملیاتی']/10000000000 as decimal(20,2)) ['فروش'],
	cast(ics.['بهای تمام ‌شده درآمدهای عملیاتی']/10000000000 as decimal(20,2)) as ['بهای تمام شده کالای فروش رفته'],
	
	cast(ics.['سود (زیان) قبل از کسر مالیات'] /10000000000 as decimal(20,2))['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات'],
	cast(hc.['موجودی نقد'] /10000000000 as decimal(20,0))['موجودی نقد'] ,
	cast(hc.['سرمایه گذاری کوتاه مدت'] /10000000000 as decimal(20,2))['سرمایه گذاری کوتاه مدت'] ,
	cast(hc.['سایر حسابها و اسناد دریافتنی']/10000000000 as decimal(20,2))['سایر حسابها و اسناد دریافتنی'],
	cast(hc.['موجودی مواد و کالا']/10000000000 as decimal(20,2))['موجودی مواد و کالا'],
	cast(hc.['پیش پرداخت ها']/10000000000 as decimal(20,2))['پیش پرداخت ها'],
	cast(hc.['دارایی های نگهداری شده برای فروش']/10000000000 as decimal(20,2))['دارایی های نگهداری شده برای فروش'],
	cast(hc.['جمع داراییهای جاری']/10000000000 as decimal(20,2))['جمع داراییهای جاری'],
	cast(hc.['سرمایه گذاریهای بلند مدت']/10000000000 as decimal(20,2))['سرمایه گذاریهای بلند مدت'],
	cast(hc.['داراییهای ثابت مشهود']/10000000000 as decimal(20,2))['داراییهای ثابت مشهود'],
	cast(hc.['حسابها و اسناد دریافتنی تجاری بلند مدت']/10000000000 as decimal(20,2))['حسابها و اسناد دریافتنی تجاری بلند مدت'],
	cast(hc.['سایر دارایی ها']/10000000000 as decimal(20,2))['سایر دارایی ها'],
	cast(hc.['جمع داراییهای غیرجاری']/10000000000 as decimal(20,2))['جمع داراییهای غیرجاری'],
	cast(hc.['جمع داراییها']/10000000000 as decimal(20,2))['جمع داراییها'],
	cast(hc.['پیش دریافتها']/10000000000 as decimal(20,2))['پیش دریافتها'],
	cast(hc.['ذخیره مالیات بر درامد']/10000000000 as decimal(20,2))['ذخیره مالیات بر درامد'],
	cast(hc.['سود سهام پیشنهادی و پرداختنی']/10000000000 as decimal(20,2))['سود سهام پیشنهادی و پرداختنی'],
	cast(hc.['حصه جاری تسهیلات مالی دریافتی']/10000000000 as decimal(20,2))['حصه جاری تسهیلات مالی دریافتی'],
	cast(hc.['جمع بدهیهای جاری']/10000000000 as decimal(20,2))['جمع بدهیهای جاری'],
	cast(hc.['حسابها و اسناد پرداختنی بلند مدت']/10000000000 as decimal(20,2))['حسابها و اسناد پرداختنی بلند مدت'],
	cast(hc.['تسهیلات مالی دریافتی بلند مدت']/10000000000 as decimal(20,2))['تسهیلات مالی دریافتی بلند مدت'],
	cast(hc.['سود (زیان) انباشته']/10000000000 as decimal(20,2)) ['سود (زیان) انباشته'], 
	cast(hc.['دریافتنی‌های تجاری و سایر دریافتنی‌ها']/10000000000 as decimal(20,2))['دریافتنی‌های تجاری و سایر دریافتنی‌ها'],
	cast(hc.['پرداختنی‌های تجاری و سایر پرداختنی‌ها']/10000000000 as decimal(20,2))['پرداختنی‌های تجاری و سایر پرداختنی‌ها'],
	cast(hc.['سرمایه گذاری در املاک']/10000000000 as decimal(20,2))['سرمایه گذاری در املاک'],
	cast(hc.['ذخایر']/10000000000 as decimal(20,2))['ذخایر']
	
	,cast(hc.['مطالبات از سایر بانکها و موسسات اعتباری']/10000000000 as decimal(20,2)) as ['مطالبات از سایر بانکها و موسسات اعتباری']
,cast(hc.['مطالبات از بانک مرکزی']/10000000000 as decimal(20,2)) as ['مطالبات از بانک مرکزی']

,cast(hc.['سپرده های دیداری']/10000000000 as decimal(20,2)) ['سپرده های دیداری']
, cast(hc.['سپرده های قرض الحسنه و پس اندار و مشابه']/10000000000 as decimal(20,2)) as ['سپرده های قرض الحسنه و پس اندار و مشابه']
, cast(hc.['بدهی به بانک مرکزی']/10000000000 as decimal(20,2)) as ['بدهی به بانک مرکزی']
, cast(hc.['سایر سپرده ها']/10000000000 as decimal(20,2))  as ['سایر سپرده ها']
, cast(hc.['بدهی به بانکها و موسسات اعتباری']/10000000000 as decimal(20,2)) as ['بدهی به بانکها و موسسات اعتباری']
,cast(hc.['جمع بدهیها و حقوق صاحبان سهام']/10000000000 as decimal(20,0)) ['جمع بدهیها و حقوق صاحبان سهام']
, cast(hc.['مطالبات از دولت']/10000000000 as decimal(20,2))as ['مطالبات از دولت']
, cast(hc.['تسهیلات اعطایی و مطالبات از اشخاص دولتی']/10000000000 as decimal(20,2)) as ['تسهیلات اعطایی و مطالبات از اشخاص دولتی']
, cast(hc.['تسهیلات اعطایی به سایر اشخاص']/10000000000 as decimal(20,2)) as ['تسهیلات اعطایی به سایر اشخاص']
, cast(hc.['سپرده های سرمایه گذاری مدت دار'] /10000000000 as decimal(20,2)) as ['سپرده های سرمایه گذاری مدت دار']
, cast(hc.['حسابها و اسناد دریافتنی تجاری']/10000000000 as decimal(20,2))as ['حسابها و اسناد دریافتنی تجاری']
, cast(hc.['حسابها و اسناد پرداختنی تجاری']/10000000000 as decimal(20,2)) as ['حسابها و اسناد پرداختنی تجاری']
, cast(hc.['سایر حسابها و اسناد پرداختنی']/10000000000 as decimal(20,2)) as ['سایر حسابها و اسناد پرداختنی']
	,cast(['سپرده قانونی']/10000000000 as decimal(20,2))['سپرده قانونی']
	,cast(['اندوخته صرف سهام']/10000000000 as decimal(20,2))['اندوخته صرف سهام']
,null as ['پیش پرداخت های سرمایه ای']
--, null as ['بدهی‌های مرتبط با دارایی‌های غیر جاری نگهداری شده برای فروش']
, hc.CreateDate as [CreateDate]
--, cast(((ics.['سود (زیان) قبل از کسر مالیات'])/ics.[ماه مالی]*12)/10000000000 as decimal(30,4)) as [سود خالص تعدیل شده یک ساله]
--, null as [فروش تعدیل شده یک ساله]
--, null as [بهای تمام شده تعدیل شده یک ساله]
--, null as [نسبت بدهی جاری به دارایی جاری]
--, null as [خالص داریی جاری]
, cast(hc.['سرمایه گذاری در اوراق بهادار']/10000000000 as decimal(20,2)) as ['سرمایه گذاری در اوراق بهادار'] 
, cast(hc.['سایر دریافتنی‌ها و پیش‌پرداخت‌ها']/10000000000 as decimal(20,2)) as ['سایر دریافتنی‌ها و پیش‌پرداخت‌ها'] 
, cast(hc.['سایر سرمایه گذاری ها'] /10000000000 as decimal(20,2)) as ['سایر سرمایه گذاری ها'] 
, cast(cf.['تسهیلات اعطایی به اشخاص'] /10000000000 as decimal(20,2)) as ['تسهیلات اعطایی به اشخاص'] 
, cast(hc.['سرمایه‌گذاری‌ در اوراق بهادار وسپرده های بانکی'] /10000000000 as decimal(20,2)) as ['سرمایه‌گذاری‌ در اوراق بهادار وسپرده های بانکی']

--, null as [نسبت بدهی به فروش]

--, null as [نسبت سود به فروش]
--, null as [بهای تمام شده کالا به فروش]
--, null as [بدهی به بازار]
--, null as [نسبت موجودی مواد و کالا به فروش]
--, null as [درصد سود هر شرکت از کل سود شرکت ها]
--, null as [سهم هر شرکت از کل دارایی ثابت شرکت ها]
--, null as [نسبت فروش هر شرکت از کل فروش شرکت ها]
--, null as [سهم هر شرکت از کل وجوه نقد و موجودی نزد بانک ها]
--, null as [درصد سود خالص هر شرکت از کل سود خالص شرکت ها]
--, null as [درصد فروش هر شرکت از کل فروش شرکت ها]
--, null as [درصد خالص دارایی هر شرکت از کل دارایی شرکت ها]
--, cast(null as nvarchar(max)) as [GroupName]
--, null as [فروش چند برابر خالص دارایی جاریست]
--, null as [نسبت فروش به ارزش بازار]
--, null as [سود خالص به ارزش بازار]
--, null as [دوران بازگشت سرمایه]
--, null as [نسبت بدهی به فروش تعدیل شده یک ساله]
--, null as [سهم هر شرکت از کل هر سرمایه گذاری و سایر دارایی]
--, null as [نسبت موجودی مواد و کالا به بدهی]
--, null as [نسبت دارایی جاری به فروش]
--, null as [خالص دارایی جاری به فروش]
--, null as [نسبت پیش دریافت به فروش]
--, null as [درصد شرکت انرژی محور چند درصد از کل سود خالص]
--, null as [درصد معادن چند درصد از کل سود خالص]
--, null as [ارزش بازار]
--, null as [نسبت سود تقسیمی به سود تعدیل شده یک ساله]
--, null as [نسبت بدهی هر شرکت به بانک به کل بدهی شرکت ها به بانک]
--, null as [چهار سپرده]
--, null as [نسبت سود تقسیمی به سود تعدیل شده یکساله]
--, null as [طلب از بازار به فروش]
--, null as [درصد هر بانک از چهارسپرده]
--, null as [بدهی به بانک و بازار]
--, null as [درصد بدهی هر بانک به سایر بانک ها]
--, null as [بدهی به بانکها]
--, null as [درصد بدهی هر شرکت به بانک از کل شرکت ها]
--, null as [درصد هر شرکت از کل سود پیشنهادی و پرداختی]
--, null as [نسبت دارایی جاری به فروش تعدیل شده یکساله]
--, null as [نسبت بدهی به بانک به فروش]
--, null as [ارزش بازار چند برابر خالص دارایی جاری]
--, null as [سود خالص به خالص دارایی جاری]
,cast(ics.['سهم گروه از سود شرکت های وابسته و مشارکت های خاص']/10000000000 as decimal(20,2)) ['سهم گروه از سود شرکت های وابسته و مشارکت های خاص']
, cast(hc.['سپرده های مشتریان']/10000000000 as decimal(20,2)) as ['سپرده های مشتریان']
,cast(ics.['سود (زیان) عملیات در حال تداوم قبل از مالیات']/10000000000 as decimal(20,0)) ['سود (زیان) عملیات در حال تداوم قبل از مالیات']
,cast(ics.['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم - عملیاتی']/10000000000 as decimal(20,0)) ['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم - عملیاتی']
,cast(ics.['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم']/10000000000 as decimal(20,0)) ['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم']
,cast(hc.['جمع بدهیهای جاری و غیر جاری']/10000000000 as decimal(20,0)) ['جمع بدهیهای جاری و غیر جاری']
,cast(hc.['جمع حقوق صاحبان سهام']/10000000000 as decimal(20,0)) ['جمع حقوق صاحبان سهام']
,cast(hc.['ذخیره مزایای پایان خدمت']/10000000000 as decimal(20,0)) ['ذخیره مزایای پایان خدمت']
,cast(hc.['ذخایر و سایر بدهی ها']/10000000000 as decimal(20,0)) ['ذخایر و سایر بدهی ها']
,cast(ics.['سود (زیان) خالص']/10000000000 as decimal(20,0)) ['سود (زیان) خالص']
,cast(hc.['داراییهای نامشهود']/10000000000 as decimal(20,0)) ['داراییهای نامشهود']


, cast(ics.['هزینه‌های مالی']/10000000000 as decimal(20,0)) ['هزینه‌های مالی']
, cast(ics.['خالص سایر درآمدها و هزینه‌های غیرعملیاتی']/10000000000 as decimal(20,0)) ['خالص سایر درآمدها و هزینه‌های غیرعملیاتی']
, cast(ics.['سایر درآمدهای عملیاتی']/10000000000 as decimal(20,0)) ['سایر درآمدهای عملیاتی']
, cast(ics.['سایر هزینه‌های عملیاتی']/10000000000 as decimal(20,0)) ['سایر هزینه‌های عملیاتی']
, cast(ics.['سهم گروه از سود شرکت‌های وابسته و مشارکت‌های خاص'] /10000000000 as decimal(20,0))
['سهم گروه از سود شرکت‌های وابسته و مشارکت‌های خاص'] 


, cast(ics.['هزینه مالیات بر درآمد سال جاری']/10000000000 as decimal(20,0)) ['هزینه مالیات بر درآمد سال جاری']
, cast(ics.['هزینه استهلاک']/10000000000 as decimal(20,0)) ['هزینه استهلاک']
, cast(ics.['هزینه های عمومی, اداری و تشکیلاتی']/10000000000 as decimal(20,0)) ['هزینه های عمومی, اداری و تشکیلاتی']
, null ['هزینه های تولید']
, cast(ics.['هزینه سهم مشارکت در منافع']/10000000000 as decimal(20,0)) ['هزینه سهم مشارکت در منافع']
, cast(ics.['سود (زیان) ناخالص فعالیتهای بیمه ای']/10000000000 as decimal(20,0)) ['سود (زیان) ناخالص فعالیتهای بیمه ای']
, null ['هزینه کاهش ارزش دریافتنی‌‏ها (هزینه استثنایی)']
, null ['هزینه تامین منابع مالی عملیات لیزینگ']
, cast(ics.['سایر هزینه های بیمه ای']/10000000000 as decimal(20,0)) ['سایر هزینه های بیمه ای']
, cast(ics.['هزینه مالیات بر درآمد سال‌های قبل']/10000000000 as decimal(20,0)) ['هزینه مالیات بر درآمد سال‌های قبل']
, null ['سایر درآمدها و هزینه‌های غیرعملیاتی - اقلام متفرقه']
, null ['هزینه ارائه خدمات']


,cast(ics.['درآمدهای عملیاتی']/10000000000 as decimal(20,0))  ['درآمدهای عملیاتی']
,cast(ics.['بهای تمام ‌شده درآمدهای عملیاتی'] /10000000000 as decimal(20,0)) ['بهای تمام ‌شده درآمدهای عملیاتی']
,cast(ics.['سود (زیان) عملیاتی']/10000000000 as decimal(20,0))  ['سود (زیان) عملیاتی']

	from BalanceSheetTalfighiCategurbalancesheet_Bourse hc
	join BalanceSheetTalfighiCategurincomestatement_Bourse ics on hc.instrumentId = ics.instrumentId
	join BalanceSheetTalfighiCategurCashflow_Bourse cf on cf.instrumentId = hc.instrumentId
	--where not exists(select 1 from BalanceSheetTalfighiCategurbalancesheet_Bourse h where hc.day = h.day and hc.instrumentId = h.instrumentId and h.CreateDate > hc.CreateDate)
	--and not exists(select 1 from BalanceSheetTalfighiCategurincomestatement_Bourse h where ics.day = h.day and ics.instrumentId = h.instrumentId and h.CreateDate > ics.CreateDate)


	where 
	--not exists(select 1 from BalanceSheetTalfighiCategurbalancesheet_bourse h where hc.instrumentId = h.instrumentId and h.day > hc.day)	and 
	not exists(select 1 from BalanceSheetTalfighiCategurbalancesheet_bourse h where hc.instrumentId = h.instrumentId and h.createdate > hc.createdate)
	and not exists(select 1 from BalanceSheetTalfighiCategurbalancesheet_bourse h where hc.instrumentId = h.instrumentId and h.[تاریخ انتشار] > hc.[تاریخ انتشار])
	and not exists(select 1 from BalanceSheetTalfighiCategurbalancesheet_bourse h where hc.instrumentId = h.instrumentId and h.[روز آخر سال مالی] > hc.[روز آخر سال مالی])
	and not exists(select 1 from BalanceSheetTalfighiCategurbalancesheet_bourse h where hc.instrumentId = h.instrumentId and h.[سال مالی] > hc.[سال مالی])
	and  cast(hc.[تاریخ انتشار] as date)  > dateadd(day, -500, getdate())

	--and not exists(select 1 from BalanceSheetTalfighiCategurIncomeStatement_bourse h where ics.instrumentId = h.instrumentId and h.day > ics.day)
	and not exists(select 1 from BalanceSheetTalfighiCategurIncomeStatement_bourse h where ics.instrumentId = h.instrumentId and h.createdate > ics.createdate)
	and not exists(select 1 from BalanceSheettalfighiCategurIncomeStatement_bourse h where ics.instrumentId = h.instrumentId and h.[تاریخ انتشار] > ics.[تاریخ انتشار])
	and not exists(select 1 from BalanceSheettalfighiCategurIncomeStatement_bourse h where ics.instrumentId = h.instrumentId and h.[روز آخر سال مالی] > ics.[روز آخر سال مالی])
	and not exists(select 1 from BalanceSheettalfighiCategurIncomeStatement_bourse h where ics.instrumentId = h.instrumentId and h.[سال مالی] > ics.[سال مالی])
	and  cast(ics.[تاریخ انتشار] as date)  > dateadd(day, -500, getdate()) 

	--and not exists(select 1 from BalanceSheetTalfighiCategurCashFlow_bourse h where cf.instrumentId = h.instrumentId and h.day > cf.day)
	and not exists(select 1 from BalanceSheetTalfighiCategurCashFlow_bourse h where cf.instrumentId = h.instrumentId and h.createdate > cf.createdate)
	and not exists(select 1 from BalanceSheettalfighiCategurCashFlow_bourse h where cf.instrumentId = h.instrumentId and h.[تاریخ انتشار] > cf.[تاریخ انتشار])
	and not exists(select 1 from BalanceSheettalfighiCategurCashFlow_bourse h where cf.instrumentId = h.instrumentId and h.[روز آخر سال مالی] > cf.[روز آخر سال مالی])
	and not exists(select 1 from BalanceSheettalfighiCategurCashFlow_bourse h where cf.instrumentId = h.instrumentId and h.[سال مالی] > cf.[سال مالی])
	and  cast(cf.[تاریخ انتشار] as date) > dateadd(day, -500, getdate()) 
	and hc.instrumentid in (select ticker from vcompany)
	and ics.instrumentid in (select ticker from vcompany)
	and cf.instrumentid in (select ticker from vcompany)
