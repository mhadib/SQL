

CREATE   view [dbo].[VBalanceSheet_GheyreTalfighi_Talfighi_New]
--SELECT * from PreBalanceSheetGheyreTalfighi where InstrumentId = N'IRO1APPE0001'
as 
with cte as (
select vp.*,null ['سهم گروه از سود شرکت های وابسته و مشارکت های خاص'],  N'خیر' IsTalfighi 
from PreBalanceSheetGheyreTalfighi vp
--غیر تلفیقی هایی که تلفیقی وجود ندارد برای آنها که سود خالص تعدیل شده یک ساله آن ها بیشتر باشد از غیر تلفیقی
where not exists(select 1 from PreBalanceSheetTalfighi g where vp.InstrumentId = g.InstrumentId and isnull(g.[سود خالص تعدیل شده یک ساله],0) > isnull(vp.[سود خالص تعدیل شده یک ساله],0)) )
,cte2 as (
select * 
from cte
union all
select * , N'بلی' IsTalfighi from  PreBalanceSheetTalfighi t 
--تلفیقی هایی که غیر تلفیقی وجود ندارد برای آنها که سود خالص تعدیل شده یک ساله آن ها بیشتر باشد از تلفیقی
where not exists(select 1 from PreBalanceSheetGheyreTalfighi g where t.InstrumentId = g.InstrumentId and isnull(g.[سود خالص تعدیل شده یک ساله],0) >= isnull(t.[سود خالص تعدیل شده یک ساله],0)))
--select [سود خالص تعدیل شده یک ساله],* from cte2 where instrumentid = N'IRO1FIBR0001'

select 
 isnull(cte2.[InstrumentId] ,v.[InstrumentId])[InstrumentId]
,isnull(cte2.[symbolFA],v.[symbolFA])[symbolFA]
,isnull(case when cte2.[day]=0 then null else cte2.[day] end ,v.[day])[day]
,isnull(case when cte2.[سال مالی]=0 then null else cte2.[سال مالی] end ,v.[سال مالی])[سال مالی]
,isnull(case when cte2.[ماه مالی]=0 then null else cte2.[ماه مالی] end ,v.[ماه مالی])[ماه مالی]
,isnull(case when cte2.[روز آخر دوره]=0 then null else cte2.[روز آخر دوره] end ,v.[روز آخر دوره])[روز آخر دوره]
,isnull(case when cte2.[روز آخر سال مالی]=0 then null else cte2.[روز آخر سال مالی] end ,v.[روز آخر سال مالی])[روز آخر سال مالی]
,isnull(cte2.[تاریخ انتشار] ,v.[تاریخ انتشار])[تاریخ انتشار]
,isnull(case when cte2.['فروش']=0 then null else cte2.['فروش'] end ,v.['فروش'])['فروش']
,isnull(case when cte2.['بهای تمام شده کالای فروش رفته']=0 then null else cte2.['بهای تمام شده کالای فروش رفته'] end ,v.['بهای تمام شده کالای فروش رفته'])['بهای تمام شده کالای فروش رفته']
,isnull(case when cte2.['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات']=0 then null else  cte2.['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات'] end ,v.['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات'])['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات']
,isnull(case when cte2.['موجودی نقد']=0 then null else cte2.['موجودی نقد'] end ,v.['موجودی نقد'])['موجودی نقد']
,isnull(case when cte2.['سرمایه گذاری کوتاه مدت']=0 then null else cte2.['سرمایه گذاری کوتاه مدت'] end ,v.['سرمایه گذاری کوتاه مدت'])['سرمایه گذاری کوتاه مدت']
,isnull(case when cte2.['سایر حسابها و اسناد دریافتنی']=0 then null else cte2.['سایر حسابها و اسناد دریافتنی'] end ,v.['سایر حسابها و اسناد دریافتنی'])['سایر حسابها و اسناد دریافتنی']
,isnull(case when cte2.['موجودی مواد و کالا']=0 then null else cte2.['موجودی مواد و کالا'] end ,v.['موجودی مواد و کالا'])['موجودی مواد و کالا']
,isnull(case when cte2.['پیش پرداخت ها']=0 then null else cte2.['پیش پرداخت ها'] end ,v.['پیش پرداخت ها'])['پیش پرداخت ها']
,isnull(case when cte2.['دارایی های نگهداری شده برای فروش']=0 then null else cte2.['دارایی های نگهداری شده برای فروش'] end ,v.['دارایی های نگهداری شده برای فروش'])['دارایی های نگهداری شده برای فروش']
,isnull(case when cte2.['جمع داراییهای جاری']=0 then null else cte2.['جمع داراییهای جاری'] end ,v.['جمع داراییهای جاری'])['جمع داراییهای جاری']
,isnull(case when cte2.['سرمایه گذاریهای بلند مدت']=0 then null else cte2.['سرمایه گذاریهای بلند مدت'] end ,v.['سرمایه گذاریهای بلند مدت'])['سرمایه گذاریهای بلند مدت']
,isnull(case when cte2.['داراییهای ثابت مشهود']=0 then null else cte2.['داراییهای ثابت مشهود'] end ,v.['داراییهای ثابت مشهود'])['داراییهای ثابت مشهود']
,isnull(case when cte2.['حسابها و اسناد دریافتنی تجاری بلند مدت']=0 then null else cte2.['حسابها و اسناد دریافتنی تجاری بلند مدت'] end ,v.['حسابها و اسناد دریافتنی تجاری بلند مدت'])['حسابها و اسناد دریافتنی تجاری بلند مدت']
,isnull(case when cte2.['سایر دارایی ها']=0 then null else cte2.['سایر دارایی ها'] end ,v.['سایر دارایی ها'])['سایر دارایی ها']
,isnull(case when cte2.['جمع داراییهای غیرجاری']=0 then null else cte2.['جمع داراییهای غیرجاری'] end ,v.['جمع داراییهای غیرجاری'])['جمع داراییهای غیرجاری']
,isnull(case when cte2.['ج'مع داراییها]=0 then null else cte2.['ج'مع داراییها] end ,v.['ج'مع داراییها])['ج'مع داراییها]
,isnull(case when cte2.['پیش دریافتها']=0 then null else cte2.['پیش دریافتها'] end ,v.['پیش دریافتها'])['پیش دریافتها']
,isnull(case when cte2.['ذخیره مالیات بر درامد']=0 then null else cte2.['ذخیره مالیات بر درامد'] end ,v.['ذخیره مالیات بر درامد'])['ذخیره مالیات بر درامد']
,isnull(case when cte2.['سود سهام پیشنهادی و پرداختنی']=0 then null else cte2.['سود سهام پیشنهادی و پرداختنی'] end ,v.['سود سهام پیشنهادی و پرداختنی'])['سود سهام پیشنهادی و پرداختنی']
,isnull(case when cte2.['حصه جاری تسهیلات مالی دریافتی']=0 then null else cte2.['حصه جاری تسهیلات مالی دریافتی'] end ,v.['حصه جاری تسهیلات مالی دریافتی'])['حصه جاری تسهیلات مالی دریافتی']
,isnull(case when cte2.['جمع بدهیهای جاری']=0 then null else cte2.['جمع بدهیهای جاری'] end ,v.['جمع بدهیهای جاری'])['جمع بدهیهای جاری']
,isnull(case when cte2.['حسابها و اسناد پرداختنی بلند مدت']=0 then null else cte2.['حسابها و اسناد پرداختنی بلند مدت'] end ,v.['حسابها و اسناد پرداختنی بلند مدت'])['حسابها و اسناد پرداختنی بلند مدت']
,isnull(case when cte2.['تسهیلات مالی دریافتی بلند مدت']=0 then null else cte2.['تسهیلات مالی دریافتی بلند مدت'] end ,v.['تسهیلات مالی دریافتی بلند مدت'])['تسهیلات مالی دریافتی بلند مدت']
,isnull(case when cte2.['سود (زیان) انباشته']=0 then null else cte2.['سود (زیان) انباشته'] end ,v.['سود (زیان) انباشته'])['سود (زیان) انباشته']
,isnull(case when cte2.['دریافتنی‌های تجاری و سایر دریافتنی‌ها']=0 then null else cte2.['دریافتنی‌های تجاری و سایر دریافتنی‌ها'] end ,v.['دریافتنی‌های تجاری و سایر دریافتنی‌ها'])['دریافتنی‌های تجاری و سایر دریافتنی‌ها']
,isnull(case when cte2.['پرداختنی‌های تجاری و سایر پرداختنی‌ها']=0 then null else cte2.['پرداختنی‌های تجاری و سایر پرداختنی‌ها'] end ,v.['پرداختنی‌های تجاری و سایر پرداختنی‌ها'])['پرداختنی‌های تجاری و سایر پرداختنی‌ها']
,isnull(case when cte2.['سرمایه گذاری در املاک']=0 then null else cte2.['سرمایه گذاری در املاک'] end ,v.['سرمایه گذاری در املاک'])['سرمایه گذاری در املاک']
,isnull(case when cte2.['ذخایر']=0 then null else cte2.['ذخایر'] end ,v.['ذخایر'])['ذخایر']
,isnull(case when cte2.['مطالبات از سایر بانکها و موسسات اعتباری']=0 then null else cte2.['مطالبات از سایر بانکها و موسسات اعتباری'] end ,v.['مطالبات از سایر بانکها و موسسات اعتباری'])['مطالبات از سایر بانکها و موسسات اعتباری']
,isnull(case when cte2.['مطالبات از بانک مرکزی']=0 then null else cte2.['مطالبات از بانک مرکزی'] end ,v.['مطالبات از بانک مرکزی'])['مطالبات از بانک مرکزی']
,isnull(case when cte2.['سپرده های دیداری']=0 then null else  cte2.['سپرده های دیداری'] end ,v.['سپرده های دیداری'])['سپرده های دیداری']
,isnull(case when cte2.['سپرده های قرض الحسنه و پس اندار و مشابه']=0 then null else cte2.['سپرده های قرض الحسنه و پس اندار و مشابه'] end ,v.['سپرده های قرض الحسنه و پس اندار و مشابه'])['سپرده های قرض الحسنه و پس اندار و مشابه']
,isnull(case when cte2.['بدهی به بانک مرکزی']=0 then null else cte2.['بدهی به بانک مرکزی'] end ,v.['بدهی به بانک مرکزی'])['بدهی به بانک مرکزی']
,isnull(case when cte2.['سایر سپرده ها']=0 then null else cte2.['سایر سپرده ها'] end ,v.['سایر سپرده ها'])['سایر سپرده ها']
,isnull(case when cte2.['بدهی به بانکها و موسسات اعتباری']=0 then null else cte2.['بدهی به بانکها و موسسات اعتباری'] end ,v.['بدهی به بانکها و موسسات اعتباری'])['بدهی به بانکها و موسسات اعتباری']
,isnull(case when cte2.['مطالبات از دولت']=0 then null else cte2.['مطالبات از دولت'] end ,v.['مطالبات از دولت'])['مطالبات از دولت']
,isnull(case when cte2.['تسهیلات اعطایی و مطالبات از اشخاص دولتی']=0 then null else cte2.['تسهیلات اعطایی و مطالبات از اشخاص دولتی'] end ,v.['تسهیلات اعطایی و مطالبات از اشخاص دولتی'])['تسهیلات اعطایی و مطالبات از اشخاص دولتی']
,isnull(case when cte2.['تسهیلات اعطایی به سایر اشخاص']=0 then null else  cte2.['تسهیلات اعطایی به سایر اشخاص'] end ,v.['تسهیلات اعطایی به سایر اشخاص'])['تسهیلات اعطایی به سایر اشخاص']
,isnull(case when cte2.['سپرده های سرمایه گذاری مدت دار']=0 then null else  cte2.['سپرده های سرمایه گذاری مدت دار'] end ,v.['سپرده های سرمایه گذاری مدت دار'])['سپرده های سرمایه گذاری مدت دار']
,isnull(case when cte2.['حسابها و اسناد دریافتنی تجاری']=0 then null else  cte2.['حسابها و اسناد دریافتنی تجاری'] end ,v.['حسابها و اسناد دریافتنی تجاری'])['حسابها و اسناد دریافتنی تجاری']
,isnull(case when cte2.['حسابها و اسناد پرداختنی تجاری']=0 then null else cte2.['حسابها و اسناد پرداختنی تجاری'] end ,v.['حسابها و اسناد پرداختنی تجاری'])['حسابها و اسناد پرداختنی تجاری']
,isnull(case when cte2.['سایر حسابها و اسناد پرداختنی']=0 then null else  cte2.['سایر حسابها و اسناد پرداختنی'] end ,v.['سایر حسابها و اسناد پرداختنی'])['سایر حسابها و اسناد پرداختنی']
,isnull(case when cte2.['سپرده قانونی']=0 then null else cte2.['سپرده قانونی'] end ,v.['سپرده قانونی'])['سپرده قانونی']
,isnull(case when cte2.['اندوخته صرف سهام']=0 then null else cte2.['اندوخته صرف سهام'] end ,v.['اندوخته صرف سهام'])['اندوخته صرف سهام']
,isnull(case when cte2.['پیش پرداخت های سرمایه ای']=0 then null else cte2.['پیش پرداخت های سرمایه ای'] end ,v.['پیش پرداخت های سرمایه ای'])['پیش پرداخت های سرمایه ای']
,isnull(case when cte2.['بدهی‌های مرتبط با دارایی‌های غیر جاری نگهداری شده برای فروش']=0 then null else cte2.['بدهی‌های مرتبط با دارایی‌های غیر جاری نگهداری شده برای فروش'] end ,v.['بدهی‌های مرتبط با دارایی‌های غیر جاری نگهداری شده برای فروش'])['بدهی‌های مرتبط با دارایی‌های غیر جاری نگهداری شده برای فروش'],

isnull(cte2.[CreateDate],v.[CreateDate])[CreateDate]
,isnull(case when cte2.[سود خالص تعدیل شده یک ساله]=0 then null else cte2.[سود خالص تعدیل شده یک ساله] end ,v.[سود خالص تعدیل شده یک ساله])[سود خالص تعدیل شده یک ساله]
,isnull(case when cte2.[فروش تعدیل شده یک ساله]=0 then null else cte2.[فروش تعدیل شده یک ساله] end ,v.[فروش تعدیل شده یک ساله])[فروش تعدیل شده یک ساله]
,isnull(case when cte2.[بهای تمام شده تعدیل شده یک ساله]=0 then null else cte2.[بهای تمام شده تعدیل شده یک ساله]  end ,v.[بهای تمام شده تعدیل شده یک ساله])[بهای تمام شده تعدیل شده یک ساله]
,isnull(case when cte2.[نسبت بدهی جاری به دارایی جاری]=0 then null else cte2.[نسبت بدهی جاری به دارایی جاری] end ,v.[نسبت بدهی جاری به دارایی جاری])[نسبت بدهی جاری به دارایی جاری]
,isnull(case when cte2.[خالص داریی جاری]=0 then null else cte2.[خالص داریی جاری] end ,v.[خالص داریی جاری])[خالص داریی جاری]
,isnull(case when cte2.[نسبت بدهی به فروش]=0 then null else cte2.[نسبت بدهی به فروش] end ,v.[نسبت بدهی به فروش])[نسبت بدهی به فروش]
,isnull(case when cte2.[نسبت سود به فروش]=0 then null else cte2.[نسبت سود به فروش] end ,v.[نسبت سود به فروش])[نسبت سود به فروش]
,isnull(case when cte2.[بهای تمام شده کالا به فروش]=0 then null else cte2.[بهای تمام شده کالا به فروش] end ,v.[بهای تمام شده کالا به فروش])[بهای تمام شده کالا به فروش]
,isnull(case when cte2.[بدهی به بازار]=0 then null else cte2.[بدهی به بازار] end ,v.[بدهی به بازار])[بدهی به بازار]
,isnull(case when cte2.[نسبت موجودی مواد و کالا به فروش]=0 then null else cte2.[نسبت موجودی مواد و کالا به فروش] end ,v.[نسبت موجودی مواد و کالا به فروش])[نسبت موجودی مواد و کالا به فروش]
,isnull(case when cte2.[درصد سود هر شرکت از کل سود شرکت ها]=0 then null else cte2.[درصد سود هر شرکت از کل سود شرکت ها] end ,v.[درصد سود هر شرکت از کل سود شرکت ها])[درصد سود هر شرکت از کل سود شرکت ها]
,isnull(case when cte2.[سهم هر شرکت از کل دارایی ثابت شرکت ها]=0 then null else cte2.[سهم هر شرکت از کل دارایی ثابت شرکت ها] end ,v.[سهم هر شرکت از کل دارایی ثابت شرکت ها])[سهم هر شرکت از کل دارایی ثابت شرکت ها]
,isnull(case when cte2.[نسبت فروش هر شرکت از کل فروش شرکت ها]=0 then null else cte2.[نسبت فروش هر شرکت از کل فروش شرکت ها] end ,v.[نسبت فروش هر شرکت از کل فروش شرکت ها])[نسبت فروش هر شرکت از کل فروش شرکت ها]
,isnull(case when cte2.[سهم هر شرکت از کل وجوه نقد و موجودی نزد بانک ها]=0 then null else cte2.[سهم هر شرکت از کل وجوه نقد و موجودی نزد بانک ها] end ,v.[سهم هر شرکت از کل وجوه نقد و موجودی نزد بانک ها])[سهم هر شرکت از کل وجوه نقد و موجودی نزد بانک ها],

isnull(case when cte2.[درصد سود خالص هر شرکت از کل سود خالص شرکت ها]=0 then null else  cte2.[درصد سود خالص هر شرکت از کل سود خالص شرکت ها] end ,v.[درصد سود خالص هر شرکت از کل سود خالص شرکت ها])[درصد سود خالص هر شرکت از کل سود خالص شرکت ها]
,isnull(case when cte2.[درصد فروش هر شرکت از کل فروش شرکت ها]=0 then null else cte2.[درصد فروش هر شرکت از کل فروش شرکت ها] end ,v.[درصد فروش هر شرکت از کل فروش شرکت ها])[درصد فروش هر شرکت از کل فروش شرکت ها]
,isnull(case when cte2.[درصد خالص دارایی هر شرکت از کل دارایی شرکت ها]=0 then null else cte2.[درصد خالص دارایی هر شرکت از کل دارایی شرکت ها] end ,v.[درصد خالص دارایی هر شرکت از کل دارایی شرکت ها])[درصد خالص دارایی هر شرکت از کل دارایی شرکت ها]
,isnull(case when cte2.[GroupName]=N'0' then null else cte2.[GroupName] end ,v.[GroupName])[GroupName],

isnull(case when cte2.[فروش چند برابر خالص دارایی جاریست]=0 then null else cte2.[فروش چند برابر خالص دارایی جاریست] end ,v.[فروش چند برابر خالص دارایی جاریست])[فروش چند برابر خالص دارایی جاریست]
,isnull(case when cte2.[نسبت فروش به ارزش بازار]=0 then null else cte2.[نسبت فروش به ارزش بازار] end ,v.[نسبت فروش به ارزش بازار])[نسبت فروش به ارزش بازار]
,isnull(case when cte2.[سود خالص به ارزش بازار]=0 then null else cte2.[سود خالص به ارزش بازار] end ,v.[سود خالص به ارزش بازار])[سود خالص به ارزش بازار]
,isnull(case when cte2.[دوران بازگشت سرمایه]=0 then null else cte2.[دوران بازگشت سرمایه] end ,v.[دوران بازگشت سرمایه])[دوران بازگشت سرمایه],

isnull(case when cte2.[نسبت بدهی به فروش تعدیل شده یک ساله]=0 then null else cte2.[نسبت بدهی به فروش تعدیل شده یک ساله] end ,v.[نسبت بدهی به فروش تعدیل شده یک ساله])[نسبت بدهی به فروش تعدیل شده یک ساله]
,isnull(case when cte2.[سهم هر شرکت از کل هر سرمایه گذاری و سایر دارایی]=0 then null else cte2.[سهم هر شرکت از کل هر سرمایه گذاری و سایر دارایی] end ,v.[سهم هر شرکت از کل هر سرمایه گذاری و سایر دارایی])[سهم هر شرکت از کل هر سرمایه گذاری و سایر دارایی]
,isnull(case when cte2.[نسبت موجودی مواد و کالا به بدهی]=0 then null else cte2.[نسبت موجودی مواد و کالا به بدهی] end ,v.[نسبت موجودی مواد و کالا به بدهی])[نسبت موجودی مواد و کالا به بدهی]
,isnull(case when cte2.[نسبت دارایی جاری به فروش]=0 then null else cte2.[نسبت دارایی جاری به فروش] end ,v.[نسبت دارایی جاری به فروش])[نسبت دارایی جاری به فروش]
,isnull(case when cte2.[خالص دارایی جاری به فروش]=0 then null else cte2.[خالص دارایی جاری به فروش] end ,v.[خالص دارایی جاری به فروش])[خالص دارایی جاری به فروش]
,isnull(case when cte2.[نسبت پیش دریافت به فروش]=0 then null else cte2.[نسبت پیش دریافت به فروش] end ,v.[نسبت پیش دریافت به فروش])[نسبت پیش دریافت به فروش],

isnull(case when cte2.[درصد شرکت انرژی محور چند درصد از کل سود خالص]=0 then null else cte2.[درصد شرکت انرژی محور چند درصد از کل سود خالص] end ,v.[درصد شرکت انرژی محور چند درصد از کل سود خالص])[درصد شرکت انرژی محور چند درصد از کل سود خالص]
,isnull(case when cte2.[درصد معادن چند درصد از کل سود خالص]=0 then null else cte2.[درصد معادن چند درصد از کل سود خالص] end ,v.[درصد معادن چند درصد از کل سود خالص])[درصد معادن چند درصد از کل سود خالص]
,isnull(case when cte2.[ارزش بازار]=0 then null else cte2.[ارزش بازار] end ,v.[ارزش بازار])[ارزش بازار]
,isnull(case when cte2.[نسبت سود تقسیمی به سود تعدیل شده یک ساله]=0 then null else cte2.[نسبت سود تقسیمی به سود تعدیل شده یک ساله] end ,v.[نسبت سود تقسیمی به سود تعدیل شده یک ساله])[نسبت سود تقسیمی به سود تعدیل شده یک ساله]
,isnull(case when cte2.[نسبت بدهی هر شرکت به بانک به کل بدهی شرکت ها به بانک]=0 then null else cte2.[نسبت بدهی هر شرکت به بانک به کل بدهی شرکت ها به بانک] end ,v.[نسبت بدهی هر شرکت به بانک به کل بدهی شرکت ها به بانک])[نسبت بدهی هر شرکت به بانک به کل بدهی شرکت ها به بانک]
,isnull(case when cte2.[چهار سپرده]=0 then null else cte2.[چهار سپرده] end ,v.[چهار سپرده])[چهار سپرده]
,isnull(case when cte2.[نسبت سود تقسیمی به سود تعدیل شده یکساله]=0 then null else cte2.[نسبت سود تقسیمی به سود تعدیل شده یکساله] end ,v.[نسبت سود تقسیمی به سود تعدیل شده یکساله])[نسبت سود تقسیمی به سود تعدیل شده یکساله],

isnull(case when cte2.[طلب از بازار به فروش]=0 then null else cte2.[طلب از بازار به فروش] end ,v.[طلب از بازار به فروش])[طلب از بازار به فروش]
,isnull(case when cte2.[درصد هر بانک از چهارسپرده]=0 then null else cte2.[درصد هر بانک از چهارسپرده] end ,v.[درصد هر بانک از چهارسپرده])[درصد هر بانک از چهارسپرده]
,isnull(case when cte2.[بدهی به بانک و بازار]=0 then null else cte2.[بدهی به بانک و بازار] end ,v.[بدهی به بانک و بازار])[بدهی به بانک و بازار]
,isnull(case when cte2.[درصد بدهی هر بانک به سایر بانک ها]=0 then null else cte2.[درصد بدهی هر بانک به سایر بانک ها] end ,v.[درصد بدهی هر بانک به سایر بانک ها])[درصد بدهی هر بانک به سایر بانک ها]
,isnull(case when cte2.[بدهی به بانکها]=0 then null else cte2.[بدهی به بانکها] end ,v.[بدهی به بانکها])[بدهی به بانکها]
,isnull(case when cte2.[درصد بدهی هر شرکت به بانک از کل شرکت ها]=0 then null else cte2.[درصد بدهی هر شرکت به بانک از کل شرکت ها] end ,v.[درصد بدهی هر شرکت به بانک از کل شرکت ها])[درصد بدهی هر شرکت به بانک از کل شرکت ها]
,isnull(case when cte2.[درصد هر شرکت از کل سود پیشنهادی و پرداختی]=0 then null else cte2.[درصد هر شرکت از کل سود پیشنهادی و پرداختی] end ,v.[درصد هر شرکت از کل سود پیشنهادی و پرداختی])[درصد هر شرکت از کل سود پیشنهادی و پرداختی]
,isnull(case when cte2.[نسبت دارایی جاری به فروش تعدیل شده یکساله]=0 then null else cte2.[نسبت دارایی جاری به فروش تعدیل شده یکساله] end ,v.[نسبت دارایی جاری به فروش تعدیل شده یکساله])[نسبت دارایی جاری به فروش تعدیل شده یکساله]
,isnull(case when cte2.[نسبت بدهی به بانک به فروش]=0 then null else cte2.[نسبت بدهی به بانک به فروش] end ,v.[نسبت بدهی به بانک به فروش]) [نسبت بدهی به بانک به فروش]
,isnull(case when cte2.[ارزش بازار چند برابر خالص دارایی جاری]=0 then null else cte2.[ارزش بازار چند برابر خالص دارایی جاری] end ,v.[ارزش بازار چند برابر خالص دارایی جاری])[ارزش بازار چند برابر خالص دارایی جاری]

,cte2.['سرمایه گذاری در اوراق بهادار'] 
,cte2.['سایر دریافتنی‌ها و پیش‌پرداخت‌ها'] 
,cte2.['سایر سرمایه گذاری ها'] 
,cte2.['تسهیلات اعطایی به اشخاص'] 
,cte2.['سرمایه‌گذاری‌ در اوراق بهادار وسپرده های بانکی'] 
,cte2.[سود خالص به خالص دارایی جاری]
,cte2.IsTalfighi [آیا تلفیقی هست]
,cte2.['جمع بدهیها و حقوق صاحبان سهام']
,cte2.['جمع بدهیهای جاری و غیر جاری']
,cte2.['جمع حقوق صاحبان سهام']
,cte2.['ذخیره مزایای پایان خدمت']
,cte2.['ذخایر و سایر بدهی ها']
,cte2.['سپرده های مشتریان']
from cte2
left join PreBalanceSheetGheyreTalfighi v on cte2.instrumentid = v.InstrumentId
