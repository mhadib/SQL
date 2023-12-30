

CREATE   view [dbo].[VPreBalanceSheetGheyreTalfighi_FaraBourse_Drop_Bilion]
as 
select distinct hc.InstrumentId,hc.symbolFA,
	replace(replace(replace(hc.[day],N'''',N''),N'[',N''),N']',N'')day,
	hc.[سال مالی] ,hc.[ماه مالی], hc.[روز آخر دوره], hc.[روز آخر سال مالی], hc.[تاریخ انتشار],
	cast(cf.['فروش']/10000000000 as decimal(20,0)) ['فروش']
	,abs(cf.['بهای تمام شده کالای فروش رفته'])['بهای تمام شده کالای فروش رفته']
	,Cast(cf.['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات']/10000000000 as decimal(20,0))['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات']
	,cast(hc.['موجودی نقد']/10000000000 as decimal(20,0))['موجودی نقد']
	,cast(hc.['سرمایه گذاری کوتاه مدت'] /10000000000 as decimal(20,0))['سرمایه گذاری کوتاه مدت']
	,cast(hc.['سایر حسابها و اسناد دریافتنی']/10000000000 as decimal(20,0)) ['سایر حسابها و اسناد دریافتنی']
	,cast(hc.['موجودی مواد و کالا']/10000000000 as decimal(20,0))['موجودی مواد و کالا']
	,cast(hc.['پیش پرداخت ها']/10000000000 as decimal(20,0))['پیش پرداخت ها']
,cast(hc.['دارایی های نگهداری شده برای فروش']/10000000000 as decimal(20,0))['دارایی های نگهداری شده برای فروش']
,cast(hc.['جمع داراییهای جاری']/10000000000 as decimal(20,0))['جمع داراییهای جاری']
,cast(hc.['سرمایه گذاریهای بلند مدت']/10000000000 as decimal(20,0))['سرمایه گذاریهای بلند مدت']
,cast(hc.['داراییهای ثابت مشهود']/10000000000 as decimal(20,0))['داراییهای ثابت مشهود']
,cast(hc.['حسابها و اسناد دریافتنی تجاری بلند مدت']/10000000000 as decimal(20,0))['حسابها و اسناد دریافتنی تجاری بلند مدت']
,cast(hc.['سایر دارایی ها']/10000000000 as decimal(20,0))['سایر دارایی ها']
,cast(hc.['جمع داراییهای غیرجاری']/10000000000 as decimal(20,0))['جمع داراییهای غیرجاری']
,cast(hc.['جمع داراییها']/10000000000 as decimal(20,0))['ج'مع داراییها]
,cast(hc.['پیش دریافتها']/10000000000 as decimal(20,0))['پیش دریافتها']
,cast(hc.['ذخیره مالیات بر درامد']/10000000000 as decimal(20,0))['ذخیره مالیات بر درامد']
,cast(hc.['سود سهام پیشنهادی و پرداختنی']/10000000000 as decimal(20,0)) ['سود سهام پیشنهادی و پرداختنی']
,cast(hc.['حصه جاری تسهیلات مالی دریافتی']/10000000000 as decimal(20,0))['حصه جاری تسهیلات مالی دریافتی']
,cast(hc.['جمع بدهیهای جاری']/10000000000 as decimal(20,0))['جمع بدهیهای جاری']
,cast(hc.['حسابها و اسناد پرداختنی بلند مدت']/10000000000 as decimal(20,0))['حسابها و اسناد پرداختنی بلند مدت']
,cast(hc.['تسهیلات مالی دریافتی بلند مدت']/10000000000 as decimal(20,0))['تسهیلات مالی دریافتی بلند مدت']
,cast(hc.['سود (زیان) انباشته']/10000000000 as decimal(20,0))['سود (زیان) انباشته']
,cast(hc.['دریافتنی‌های تجاری و سایر دریافتنی‌ها']/10000000000 as decimal(20,0)) ['دریافتنی‌های تجاری و سایر دریافتنی‌ها']
,cast(hc.['پرداختنی‌های تجاری و سایر پرداختنی‌ها']/10000000000 as decimal(20,0))['پرداختنی‌های تجاری و سایر پرداختنی‌ها']
,cast(hc.['سرمایه گذاری در املاک']/10000000000 as decimal(20,0)) ['سرمایه گذاری در املاک']
,cast(hc.['ذخایر']/10000000000 as decimal(20,0)) ['ذخایر']
,cast(hc.['مطالبات از سایر بانکها و موسسات اعتباری']/10000000000 as decimal(20,0))['مطالبات از سایر بانکها و موسسات اعتباری']
,cast(hc.['مطالبات از بانک مرکزی']/10000000000 as decimal(20,0))['مطالبات از بانک مرکزی']
,cast(hc.['سپرده های مشتریان']/10000000000 as decimal(20,0))['سپرده های دیداری']
,cast(hc.['سپرده های قرض الحسنه و پس اندار و مشابه']/10000000000 as decimal(20,0))['سپرده های قرض الحسنه و پس اندار و مشابه']
,cast(hc.['بدهی به بانک مرکزی']/10000000000 as decimal(20,0))['بدهی به بانک مرکزی']
,cast(hc.['سایر سپرده ها']/10000000000 as decimal(20,0))['سایر سپرده ها']
,cast(hc.['بدهی به بانکها و موسسات اعتباری']/10000000000 as decimal(20,0))['بدهی به بانکها و موسسات اعتباری']
,cast(hc.['جمع بدهیها و حقوق صاحبان سهام']/10000000000 as decimal(20,0)) ['جمع بدهیها و حقوق صاحبان سهام']

,cast(hc.['مطالبات از دولت']/10000000000 as decimal(20,0))['مطالبات از دولت']
,cast(hc.['تسهیلات اعطایی و مطالبات از اشخاص دولتی']/10000000000 as decimal(20,0))['تسهیلات اعطایی و مطالبات از اشخاص دولتی']

,cast(hc.['تسهیلات اعطایی به سایر اشخاص']/10000000000 as decimal(20,0))['تسهیلات اعطایی به سایر اشخاص']
,cast(hc.['سپرده های سرمایه گذاری مدت دار']/10000000000 as decimal(20,0))['سپرده های سرمایه گذاری مدت دار']
,cast(hc.['حسابها و اسناد دریافتنی تجاری']/10000000000 as decimal(20,0))['حسابها و اسناد دریافتنی تجاری']
,cast(hc.['حسابها و اسناد پرداختنی تجاری']/10000000000 as decimal(20,0))['حسابها و اسناد پرداختنی تجاری']
,cast(hc.['سایر حسابها و اسناد پرداختنی']/10000000000 as decimal(20,0))['سایر حسابها و اسناد پرداختنی']
,cast(['سپرده قانونی']/10000000000 as decimal(20,0))['سپرده قانونی']
,cast(['اندوخته صرف سهام']/10000000000 as decimal(20,0))['اندوخته صرف سهام']
,cast(isnull(['پیش پرداخت های سرمایه ای'],0)/10000000000 as decimal(20,0))['پیش پرداخت های سرمایه ای']
,cast(isnull(['بدهی‌های مرتبط با دارایی‌های غیر جاری نگهداری شده برای فروش'],0)/10000000000 as decimal(20,0))['بدهی‌های مرتبط با دارایی‌های غیر جاری نگهداری شده برای فروش']
,hc.CreateDate,

--cast(((cf.['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات']/(cf.[ماه مالی]))*12)/10000000000 as decimal(30,4)) [سود خالص تعدیل شده یک ساله],
--cast(cf.['فروش']/cf.[ماه مالی]*12/10000000000 as decimal(20,4))[فروش تعدیل شده یک ساله],
--cast(cf.['بهای تمام شده کالای فروش رفته']/cf.[ماه مالی]*12/10000000000 as decimal(20,2))[بهای تمام شده تعدیل شده یک ساله],
--case when hc.['جمع داراییهای جاری'] != 0 then cast(hc.['جمع بدهیهای جاری'] / hc.['جمع داراییهای جاری'] as decimal(20,0)) else 0 end [نسبت بدهی جاری به دارایی جاری],
--cast(((hc.['جمع داراییهای جاری'] - hc.['جمع بدهیهای جاری'])/10000000000) as decimal(10,0)) [خالص داریی جاری],
hc.['سرمایه گذاری در اوراق بهادار']/10000000000 ['سرمایه گذاری در اوراق بهادار']
,isnull(['سایر دریافتنی‌ها و پیش‌پرداخت‌ها'],0) /10000000000 ['سایر دریافتنی‌ها و پیش‌پرداخت‌ها'] 
,['سایر سرمایه گذاری ها'] /10000000000 ['سایر سرمایه گذاری ها'] 
,['تسهیلات اعطایی به اشخاص'] /10000000000 ['تسهیلات اعطایی به اشخاص'] 
,isnull(['سرمایه‌گذاری‌ در اوراق بهادار وسپرده های بانکی'],0) /10000000000 ['سرمایه‌گذاری‌ در اوراق بهادار وسپرده های بانکی'] 
,cast(hc.['سپرده های مشتریان']/10000000000 as decimal(20,0)) ['سپرده های مشتریان']
,cast(cf.['سود (زیان) عملیات در حال تداوم قبل از مالیات']/10000000000 as decimal(20,0)) ['سود (زیان) عملیات در حال تداوم قبل از مالیات']
,cast(cf.['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم - عملیاتی']/10000000000 as decimal(20,0)) ['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم - عملیاتی']
,cast(cf.['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم']/10000000000 as decimal(20,0)) ['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم'],
cast(hc.['جمع بدهیهای جاری و غیر جاری']/10000000000 as decimal(20,0)) ['جمع بدهیهای جاری و غیر جاری']
,cast(hc.['جمع حقوق صاحبان سهام']/10000000000 as decimal(20,0)) ['جمع حقوق صاحبان سهام']
,cast(hc.['ذخیره مزایای پایان خدمت']/10000000000 as decimal(20,0)) ['ذخیره مزایای پایان خدمت']
,cast(hc.['ذخایر و سایر بدهی ها']/10000000000 as decimal(20,0)) ['ذخایر و سایر بدهی ها']
, cast(hc.['بدهی بابت بیمه عمر و مدیریت سرمایه'] /10000000000 as decimal(20,0)) ['بدهی بابت بیمه عمر و مدیریت سرمایه']
, cast(hc.['مطالبات از بیمه گران و بیمه‌گران اتکایی'] /10000000000 as decimal(20,0)) ['مطالبات از بیمه گران و بیمه‌گران اتکایی']
, cast(hc.['مطالبات از بیمه‌گذاران و نمایندگان'] /10000000000 as decimal(20,0)) ['مطالبات از بیمه‌گذاران و نمایندگان']
, cast(hc.['سهم بیمه گران اتکایی از ذخایر فنی'] /10000000000 as decimal(20,0)) ['سهم بیمه گران اتکایی از ذخایر فنی']
, cast(hc.['بدهی به بیمه‌گذاران و نمایندگان'] /10000000000 as decimal(20,0)) ['بدهی به بیمه‌گذاران و نمایندگان']
, cast(hc.['بدهی به بیمه‌گران و بیمه‌گران اتکایی'] /10000000000 as decimal(20,0)) ['بدهی به بیمه‌گران و بیمه‌گران اتکایی']
, cast(hc.['ذخیره خسارت معوق '] /10000000000 as decimal(20,0)) ['ذخیره خسارت معوق ']
, cast(hc.['سایر ذخایر فنی'] /10000000000 as decimal(20,0)) ['سایر ذخایر فنی']
, cast(hc.['ذخیره ریسک‌های منقضی نشده'] /10000000000 as decimal(20,0)) ['ذخیره ریسک‌های منقضی نشده']
, cast(cf.['سود (زیان) خالص']/10000000000 as decimal(20,0)) ['سود (زیان) خالص']


	from BalanceSheetGheyreTalfighiCategurbalancesheet_FaraBourse hc 
	left join BalanceSheetGheyreTalfighiCategurIncomeStatement_FaraBourse cf on hc.instrumentId = cf.instrumentId 
	where not exists(select 1 from BalanceSheetGheyreTalfighiCategurbalancesheet_FaraBourse h where hc.instrumentId = h.instrumentId and h.[تاریخ انتشار] > hc.[تاریخ انتشار])
	and not exists(select 1 from BalanceSheetGheyreTalfighiCategurbalancesheet_FaraBourse h where hc.instrumentId = h.instrumentId and h.createdate > hc.createdate)
	and not exists(select 1 from BalanceSheetGheyreTalfighiCategurbalancesheet_FaraBourse h where hc.instrumentId = h.instrumentId and h.[روز آخر سال مالی] > hc.[روز آخر سال مالی])
	and not exists(select 1 from BalanceSheetGheyreTalfighiCategurbalancesheet_bourse h where hc.instrumentId = h.instrumentId and h.[سال مالی] > hc.[سال مالی])

	and  cast(hc.[تاریخ انتشار] as date)  > dateadd(day, -365, getdate()) 
	
	and	not exists(select 1 from BalanceSheetGheyreTalfighiCategurIncomeStatement_FaraBourse h where cf.instrumentId = h.instrumentId and h.[تاریخ انتشار] > cf.[تاریخ انتشار])
	and not exists(select 1 from BalanceSheetGheyreTalfighiCategurIncomeStatement_FaraBourse h where cf.instrumentId = h.instrumentId and h.[سال مالی] > cf.[سال مالی])
	and not exists(select 1 from BalanceSheetGheyreTalfighiCategurIncomeStatement_FaraBourse h where cf.instrumentId = h.instrumentId and h.createdate > cf.createdate)
	and not exists(select 1 from BalanceSheetGheyreTalfighiCategurIncomeStatement_FaraBourse h where cf.instrumentId = h.instrumentId and h.[روز آخر سال مالی] > cf.[روز آخر سال مالی])
	and not exists(select 1 from BalanceSheetGheyreTalfighiCategurIncomeStatement_Farabourse h where cf.instrumentId = h.instrumentId and h.[سال مالی] > cf.[سال مالی])

	and  cast(cf.[تاریخ انتشار] as date)  > dateadd(day, -365, getdate())
	
	and hc.instrumentid in (select ticker from vcompany)
	and cf.instrumentid in (select ticker from vcompany)
