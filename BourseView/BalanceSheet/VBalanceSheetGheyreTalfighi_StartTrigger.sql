



CREATE TRIGGER [dbo].[VBalanceSheetGheyreTalfighi_StartTrigger]
   ON  [dbo].[PreProcessBalanceSheet]
   AFTER INSERT
AS 
BEGIN

	drop table if exists 
	PreBalanceSheetGheyreTalfighi
	select * 
	into PreBalanceSheetGheyreTalfighi
	from VPreBalanceSheetGheyreTalfighi

	drop table if exists PreBalanceSheetTalfighi
	select * 
	into PreBalanceSheetTalfighi
	from VPreBalanceSheetTalfighi
	
	
	drop table if exists [dbo].[VBalanceSheetGheyreTalfighi]
	
	select [InstrumentId] as [InstrumentId],b.[symbolFA] as [symbolFA],[day] as [day],[سال مالی] as [سال_مالی],[ماه مالی] as [ماه_مالی],[روز آخر دوره] as [روز_آخر_دوره],[روز آخر سال مالی] as [روز_آخر_سال_مالی],[تاریخ انتشار] as [تاریخ_انتشار],['فروش'] as [فروش],['بهای تمام شده کالای فروش رفته'] as [بهای_تمام_شده_کالای_فروش_رفته],['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات'] as [سود_(زیان)_خالص_عملیات_در_حال_تداوم_قبل_از_مالیات],['موجودی نقد'] as [موجودی_نقد],['سرمایه گذاری کوتاه مدت'] as [سرمایه_گذاری_کوتاه_مدت],['سایر حسابها و اسناد دریافتنی'] as [سایر_حسابها_و_اسناد_دریافتنی],['موجودی مواد و کالا'] as [موجودی_مواد_و_کالا],['پیش پرداخت ها'] as [پیش_پرداخت_ها],['دارایی های نگهداری شده برای فروش'] as [دارایی_های_نگهداری_شده_برای_فروش],['جمع داراییهای جاری'] as [جمع_داراییهای_جاری],['سرمایه گذاریهای بلند مدت'] as [سرمایه_گذاریهای_بلند_مدت],['داراییهای ثابت مشهود'] as [داراییهای_ثابت_مشهود],['حسابها و اسناد دریافتنی تجاری بلند مدت'] as [حسابها_و_اسناد_دریافتنی_تجاری_بلند_مدت],['سایر دارایی ها'] as [سایر_دارایی_ها],['جمع داراییهای غیرجاری'] as [جمع_داراییهای_غیرجاری],['ج'مع داراییها] as [جمع_داراییها],['پیش دریافتها'] as [پیش_دریافتها],['ذخیره مالیات بر درامد'] as [ذخیره_مالیات_بر_درامد],['سود سهام پیشنهادی و پرداختنی'] as [سود_سهام_پیشنهادی_و_پرداختنی],['حصه جاری تسهیلات مالی دریافتی'] as [حصه_جاری_تسهیلات_مالی_دریافتی],['جمع بدهیهای جاری'] as [جمع_بدهیهای_جاری],['حسابها و اسناد پرداختنی بلند مدت'] as [حسابها_و_اسناد_پرداختنی_بلند_مدت],['تسهیلات مالی دریافتی بلند مدت'] as [تسهیلات_مالی_دریافتی_بلند_مدت],['سود (زیان) انباشته'] as [سود_(زیان)_انباشته],['دریافتنی‌های تجاری و سایر دریافتنی‌ها'] as [دریافتنی‌های_تجاری_و_سایر_دریافتنی‌ها],['پرداختنی‌های تجاری و سایر پرداختنی‌ها'] as [پرداختنی‌های_تجاری_و_سایر_پرداختنی‌ها],['سرمایه گذاری در املاک'] as [سرمایه_گذاری_در_املاک],['ذخایر'] as [ذخایر],['مطالبات از سایر بانکها و موسسات اعتباری'] as [مطالبات_از_سایر_بانکها_و_موسسات_اعتباری],['مطالبات از بانک مرکزی'] as [مطالبات_از_بانک_مرکزی],['سپرده های دیداری'] as [سپرده_های_دیداری],['سپرده های قرض الحسنه و پس اندار و مشابه'] as [سپرده_های_قرض_الحسنه_و_پس_اندار_و_مشابه],['بدهی به بانک مرکزی'] as [بدهی_به_بانک_مرکزی],['سایر سپرده ها'] as [سایر_سپرده_ها],['بدهی به بانکها و موسسات اعتباری'] as [بدهی_به_بانکها_و_موسسات_اعتباری],['مطالبات از دولت'] as [مطالبات_از_دولت],['تسهیلات اعطایی و مطالبات از اشخاص دولتی'] as [تسهیلات_اعطایی_و_مطالبات_از_اشخاص_دولتی],['تسهیلات اعطایی به سایر اشخاص'] as [تسهیلات_اعطایی_به_سایر_اشخاص],['سپرده های سرمایه گذاری مدت دار'] as [سپرده_های_سرمایه_گذاری_مدت_دار],['حسابها و اسناد دریافتنی تجاری'] as [حسابها_و_اسناد_دریافتنی_تجاری],['حسابها و اسناد پرداختنی تجاری'] as [حسابها_و_اسناد_پرداختنی_تجاری],['سایر حسابها و اسناد پرداختنی'] as [سایر_حسابها_و_اسناد_پرداختنی],['سپرده قانونی'] as [سپرده_قانونی],['اندوخته صرف سهام'] as [اندوخته_صرف_سهام],['پیش پرداخت های سرمایه ای'] as [پیش_پرداخت_های_سرمایه_ای],['بدهی‌های مرتبط با دارایی‌های غیر جاری نگهداری شده برای فروش'] as [بدهی‌های_مرتبط_با_دارایی‌های_غیر_جاری_نگهداری_شده_برای_فروش],b.[CreateDate] as [CreateDate],[سود خالص تعدیل شده یک ساله] as [سود_خالص_تعدیل_شده_یک_ساله],[فروش تعدیل شده یک ساله] as [فروش_تعدیل_شده_یک_ساله],[بهای تمام شده تعدیل شده یک ساله] as [بهای_تمام_شده_تعدیل_شده_یک_ساله],[نسبت بدهی جاری به دارایی جاری] as [نسبت_بدهی_جاری_به_دارایی_جاری],[خالص داریی جاری] as [خالص_داریی_جاری],[نسبت بدهی به فروش] as [نسبت_بدهی_به_فروش],[نسبت سود به فروش] as [نسبت_سود_به_فروش],[بهای تمام شده کالا به فروش] as [بهای_تمام_شده_کالا_به_فروش],[بدهی به بازار] as [بدهی_به_بازار],[نسبت موجودی مواد و کالا به فروش] as [نسبت_موجودی_مواد_و_کالا_به_فروش],[درصد سود هر شرکت از کل سود شرکت ها] as [درصد_سود_هر_شرکت_از_کل_سود_شرکت_ها],[سهم هر شرکت از کل دارایی ثابت شرکت ها] as [سهم_هر_شرکت_از_کل_دارایی_ثابت_شرکت_ها],[نسبت فروش هر شرکت از کل فروش شرکت ها] as [نسبت_فروش_هر_شرکت_از_کل_فروش_شرکت_ها],[سهم هر شرکت از کل وجوه نقد و موجودی نزد بانک ها] as [سهم_هر_شرکت_از_کل_وجوه_نقد_و_موجودی_نزد_بانک_ها],[درصد سود خالص هر شرکت از کل سود خالص شرکت ها] as [درصد_سود_خالص_هر_شرکت_از_کل_سود_خالص_شرکت_ها],[درصد فروش هر شرکت از کل فروش شرکت ها] as [درصد_فروش_هر_شرکت_از_کل_فروش_شرکت_ها],[درصد خالص دارایی هر شرکت از کل دارایی شرکت ها] as [درصد_خالص_دارایی_هر_شرکت_از_کل_دارایی_شرکت_ها],[GroupName] as [GroupName],[فروش چند برابر خالص دارایی جاریست] as [فروش_چند_برابر_خالص_دارایی_جاریست],[نسبت فروش به ارزش بازار] as [نسبت_فروش_به_ارزش_بازار],[سود خالص به ارزش بازار] as [سود_خالص_به_ارزش_بازار],[دوران بازگشت سرمایه] as [دوران_بازگشت_سرمایه],[نسبت بدهی به فروش تعدیل شده یک ساله] as [نسبت_بدهی_به_فروش_تعدیل_شده_یک_ساله],[سهم هر شرکت از کل هر سرمایه گذاری و سایر دارایی] as [سهم_هر_شرکت_از_کل_هر_سرمایه_گذاری_و_سایر_دارایی],[نسبت موجودی مواد و کالا به بدهی] as [نسبت_موجودی_مواد_و_کالا_به_بدهی],[نسبت دارایی جاری به فروش] as [نسبت_دارایی_جاری_به_فروش],[خالص دارایی جاری به فروش] as [خالص_دارایی_جاری_به_فروش],[نسبت پیش دریافت به فروش] as [نسبت_پیش_دریافت_به_فروش],[درصد شرکت انرژی محور چند درصد از کل سود خالص] as [درصد_شرکت_انرژی_محور_چند_درصد_از_کل_سود_خالص],[درصد معادن چند درصد از کل سود خالص] as [درصد_معادن_چند_درصد_از_کل_سود_خالص],[ارزش بازار] as [ارزش_بازار],[نسبت سود تقسیمی به سود تعدیل شده یک ساله] as [نسبت_سود_تقسیمی_به_سود_تعدیل_شده_یک_ساله],[نسبت بدهی هر شرکت به بانک به کل بدهی شرکت ها به بانک] as [نسبت_بدهی_هر_شرکت_به_بانک_به_کل_بدهی_شرکت_ها_به_بانک],[چهار سپرده] as [چهار_سپرده],[نسبت سود تقسیمی به سود تعدیل شده یکساله] as [نسبت_سود_تقسیمی_به_سود_تعدیل_شده_یکساله],[طلب از بازار به فروش] as [طلب_از_بازار_به_فروش],[درصد هر بانک از چهارسپرده] as [درصد_هر_بانک_از_چهارسپرده],[بدهی به بانک و بازار] as [بدهی_به_بانک_و_بازار],[درصد بدهی هر بانک به سایر بانک ها] as [درصد_بدهی_هر_بانک_به_سایر_بانک_ها],[بدهی به بانکها] as [بدهی_به_بانکها],[درصد بدهی هر شرکت به بانک از کل شرکت ها] as [درصد_بدهی_هر_شرکت_به_بانک_از_کل_شرکت_ها],[درصد هر شرکت از کل سود پیشنهادی و پرداختی] as [درصد_هر_شرکت_از_کل_سود_پیشنهادی_و_پرداختی],[نسبت دارایی جاری به فروش تعدیل شده یکساله] as [نسبت_دارایی_جاری_به_فروش_تعدیل_شده_یکساله],[نسبت بدهی به بانک به فروش] as [نسبت_بدهی_به_بانک_به_فروش],[ارزش بازار چند برابر خالص دارایی جاری] as [ارزش_بازار_چند_برابر_خالص_دارایی_جاری],['سرمایه گذاری در اوراق بهادار'] as [سرمایه_گذاری_در_اوراق_بهادار],['سایر دریافتنی‌ها و پیش‌پرداخت‌ها'] as [سایر_دریافتنی‌ها_و_پیش‌پرداخت‌ها],['سایر سرمایه گذاری ها'] as [سایر_سرمایه_گذاری_ها],['تسهیلات اعطایی به اشخاص'] as [تسهیلات_اعطایی_به_اشخاص],['سرمایه‌گذاری‌ در اوراق بهادار وسپرده های بانکی'] as [سرمایه‌گذاری‌_در_اوراق_بهادار_وسپرده_های_بانکی], [سود خالص به خالص دارایی جاری], [آیا تلفیقی هست],['جمع بدهیها و حقوق صاحبان سهام'],
	['جمع بدهیهای جاری و غیر جاری'],
	['جمع حقوق صاحبان سهام']
	, ['ذخیره مزایای پایان خدمت']
	, ['ذخایر و سایر بدهی ها']
	, ['سپرده های مشتریان']
	, ['سود (زیان) عملیات در حال تداوم قبل از مالیات']
	, ['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم - عملیاتی']
	, ['سود (زیان) پایه هر سهم ناشی از عملیات در حال تداوم']
	, ['بدهی بابت بیمه عمر و مدیریت سرمایه']
	, ['مطالبات از بیمه گران و بیمه‌گران اتکایی']
	, ['مطالبات از بیمه‌گذاران و نمایندگان']
	, ['سهم بیمه گران اتکایی از ذخایر فنی']
	, ['بدهی به بیمه‌گذاران و نمایندگان']
	, ['بدهی به بیمه‌گران و بیمه‌گران اتکایی']
	, ['ذخیره خسارت معوق ']
	, ['سایر ذخایر فنی']
	, ['ذخیره ریسک‌های منقضی نشده']
	, c.nameFa [نام کامل]
	, ['سود (زیان) خالص']
	, ['داراییهای نامشهود']
	, ['هزینه‌های مالی']
	, ['خالص سایر درآمدها و هزینه‌های غیرعملیاتی']
	, ['سایر درآمدهای عملیاتی']
	, ['سایر هزینه‌های عملیاتی']
	, ['سهم گروه از سود شرکت‌های وابسته و مشارکت‌های خاص'] 
	, ['هزینه مالیات بر درآمد سال جاری']
	, ['هزینه استهلاک']
	, ['هزینه های عمومی, اداری و تشکیلاتی']
	, ['هزینه های تولید']
	, ['هزینه سهم مشارکت در منافع']
	, ['سود (زیان) ناخالص فعالیتهای بیمه ای']
	, ['هزینه کاهش ارزش دریافتنی‌‏ها (هزینه استثنایی)']
	, ['هزینه تامین منابع مالی عملیات لیزینگ']
	, ['سایر هزینه های بیمه ای']
	, ['هزینه مالیات بر درآمد سال‌های قبل']
	, ['سایر درآمدها و هزینه‌های غیرعملیاتی - اقلام متفرقه']
	, ['هزینه ارائه خدمات']
	, ['درآمدهای عملیاتی']
	, ['بهای تمام ‌شده درآمدهای عملیاتی']
	, ['سود (زیان) عملیاتی']
	into [VBalanceSheetGheyreTalfighi]
	from [dbo].[VBalanceSheet_GheyreTalfighi_Talfighi_new] b
	left join vCompany c on c.ticker = b.instrumentId	

end
