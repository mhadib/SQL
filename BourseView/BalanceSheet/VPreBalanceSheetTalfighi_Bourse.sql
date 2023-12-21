

--select * from [dbo].[VPreBalanceSheetTalfighi_Bourse]
CREATE   view [dbo].[VPreBalanceSheetTalfighi_Bourse]
	as
	select distinct b.instrumentId InstrumentId,b.symbolFA,b.day,[سال مالی],[ماه مالی],[روز آخر دوره],[روز آخر سال مالی],[تاریخ انتشار],
	['فروش'],
	['بهای تمام شده کالای فروش رفته'],
	
	['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات'],
	['موجودی نقد'] ,
	['سرمایه گذاری کوتاه مدت'] ,
	['سایر حسابها و اسناد دریافتنی'],
	['موجودی مواد و کالا'],
	['پیش پرداخت ها'],
	['دارایی های نگهداری شده برای فروش'],
	['جمع داراییهای جاری'],
	['سرمایه گذاریهای بلند مدت'],
	['داراییهای ثابت مشهود'],
	['حسابها و اسناد دریافتنی تجاری بلند مدت'],
	['سایر دارایی ها'],
	['جمع داراییهای غیرجاری'],
	['جمع داراییها'],
	['پیش دریافتها'],
	['ذخیره مالیات بر درامد'],
	['سود سهام پیشنهادی و پرداختنی'],
	['حصه جاری تسهیلات مالی دریافتی'],
	['جمع بدهیهای جاری'],
	['جمع بدهیهای جاری و غیر جاری'],
	['حسابها و اسناد پرداختنی بلند مدت'],
	['تسهیلات مالی دریافتی بلند مدت'],
	['سود (زیان) انباشته'],
	['دریافتنی‌های تجاری و سایر دریافتنی‌ها'],
	['پرداختنی‌های تجاری و سایر پرداختنی‌ها'],
	['سرمایه گذاری در املاک'],
	['ذخایر']
	
	,['مطالبات از سایر بانکها و موسسات اعتباری']
,    ['مطالبات از بانک مرکزی']
,['سپرده های دیداری']
,['سپرده های قرض الحسنه و پس اندار و مشابه']
,['بدهی به بانک مرکزی']
,['سایر سپرده ها']
,['بدهی به بانکها و موسسات اعتباری']
,['جمع بدهیها و حقوق صاحبان سهام']
,['مطالبات از دولت']
,['تسهیلات اعطایی و مطالبات از اشخاص دولتی']
,['تسهیلات اعطایی به سایر اشخاص']
,['سپرده های سرمایه گذاری مدت دار']
,['حسابها و اسناد دریافتنی تجاری']
,['حسابها و اسناد پرداختنی تجاری']
,['سایر حسابها و اسناد پرداختنی']
	,['سپرده قانونی']
	,['اندوخته صرف سهام']
	,null as ['پیش پرداخت های سرمایه ای']
, null as ['بدهی‌های مرتبط با دارایی‌های غیر جاری نگهداری شده برای فروش']
, b.CreateDate as [CreateDate]
, cast(((['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات'])/[ماه مالی]*12) as decimal(30,4)) as [سود خالص تعدیل شده یک ساله]
, cast(['فروش']/[ماه مالی]*12 as decimal(20,4)) as [فروش تعدیل شده یک ساله]
, cast(['بهای تمام شده کالای فروش رفته']/[ماه مالی]*12 as decimal(20,2)) as [بهای تمام شده تعدیل شده یک ساله]

, ['سرمایه گذاری در اوراق بهادار']  as ['سرمایه گذاری در اوراق بهادار'] 
, ['سایر دریافتنی‌ها و پیش‌پرداخت‌ها'] as ['سایر دریافتنی‌ها و پیش‌پرداخت‌ها'] 
, ['سایر سرمایه گذاری ها'] as ['سایر سرمایه گذاری ها'] 
, ['تسهیلات اعطایی به اشخاص']  as ['تسهیلات اعطایی به اشخاص'] 
, ['سرمایه‌گذاری‌ در اوراق بهادار وسپرده های بانکی'] as ['سرمایه‌گذاری‌ در اوراق بهادار وسپرده های بانکی']
, null as [بهای تمام شده کالا به فروش]
, ['پرداختنی‌های تجاری و سایر پرداختنی‌ها'] as [بدهی به بازار]
, i.[GroupName]
, null as [فروش چند برابر خالص دارایی جاریست]
, null as [سود خالص به ارزش بازار]


, v.[ارزش بازار]
, null as [چهار سپرده]


, null as [بدهی به بانکها]
, null as [درصد سود هر شرکت از کل سود شرکت ها]
, null as [درصد سود خالص هر شرکت از کل سود خالص شرکت ها]
, null as [درصد فروش هر شرکت از کل فروش شرکت ها]
, null as [درصد خالص دارایی هر شرکت از کل دارایی شرکت ها]
, null as [درصد شرکت انرژی محور چند درصد از کل سود خالص]
, null as [درصد معادن چند درصد از کل سود خالص]
, null as [درصد هر بانک از چهارسپرده]
, null as [درصد بدهی هر بانک به سایر بانک ها]
, null as [درصد بدهی هر شرکت به بانک از کل شرکت ها]
, null as [درصد هر شرکت از کل سود پیشنهادی و پرداختی]
, null as [سهم هر شرکت از کل دارایی ثابت شرکت ها]
, null as [سهم هر شرکت از کل وجوه نقد و موجودی نزد بانک ها]
, null as [سهم هر شرکت از کل هر سرمایه گذاری و سایر دارایی]
, ['سهم گروه از سود شرکت های وابسته و مشارکت های خاص']
, case when ['جمع داراییهای جاری'] != 0 then cast(['جمع بدهیهای جاری'] / ['جمع داراییهای جاری'] as decimal(20,0)) else 0 end as [نسبت بدهی جاری به دارایی جاری]
, null as [نسبت بدهی به فروش]
, null as [نسبت سود به فروش]
, null as [نسبت موجودی مواد و کالا به فروش]
, null as [نسبت فروش هر شرکت از کل فروش شرکت ها]
, null as [نسبت فروش به ارزش بازار]
, null as [نسبت بدهی به فروش تعدیل شده یک ساله]
, null as [نسبت موجودی مواد و کالا به بدهی]
, null as [نسبت دارایی جاری به فروش]
, null as [نسبت پیش دریافت به فروش]
, null as [نسبت سود تقسیمی به سود تعدیل شده یک ساله]
, null as [نسبت بدهی هر شرکت به بانک به کل بدهی شرکت ها به بانک]
, null as [نسبت سود تقسیمی به سود تعدیل شده یکساله]
, null as [نسبت دارایی جاری به فروش تعدیل شده یکساله]
, null as [نسبت بدهی به بانک به فروش]
, null as [خالص دارایی جاری به فروش]
, null as [طلب از بازار به فروش]
, null as [سود خالص به خالص دارایی جاری]
, null as [دوران بازگشت سرمایه]
, null as [ارزش بازار چند برابر خالص دارایی جاری]
, null as [بدهی به بانک و بازار]
, cast(((['جمع داراییهای جاری'] - ['جمع بدهیهای جاری'])) as decimal(10,0)) as [خالص داریی جاری]
, ['جمع حقوق صاحبان سهام']
, ['ذخیره مزایای پایان خدمت']
, ['ذخایر و سایر بدهی ها']
, ['جمع بدهیهای جاری و غیر جاری'] - (['ذخیره مزایای پایان خدمت'] + ['ذخایر و سایر بدهی ها'] + ['بدهی به بانکها و موسسات اعتباری'] + ['سود سهام پیشنهادی و پرداختنی'])
['سپرده های مشتریان']
from VPreBalanceSheetTalfighi_Bourse_Drop_Bilion b
left join ForConvert i on b.InstrumentId = i.InstrumentId
left join VChartayi v on b.InstrumentId = v.instrumentId
