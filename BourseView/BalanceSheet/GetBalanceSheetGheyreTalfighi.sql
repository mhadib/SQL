create   Procedure [dbo].[GetBalanceSheetGheyreTalfighi](@Date date = null)
as
begin
	if	@date is null
		set @Date = cast(getdate() as date)
	select distinct InstrumentId,symbolFA,day,[سال مالی],[ماه مالی],[روز آخر دوره],[روز آخر سال مالی],[تاریخ انتشار],['فروش'],['بهای تمام شده کالای فروش رفته'],['سود (زیان) خالص عملیات در حال تداوم قبل از مالیات'],['موجودی نقد'],['سرمایه گذاری کوتاه مدت'],['سایر حسابها و اسناد دریافتنی'],['موجودی مواد و کالا'],['پیش پرداخت ها']
,['دارایی های نگهداری شده برای فروش'],['جمع داراییهای جاری'],['سرمایه گذاریهای بلند مدت'],['داراییهای ثابت مشهود'],['حسابها و اسناد دریافتنی تجاری بلند مدت'],['سایر دارایی ها'],['جمع داراییهای غیرجاری'],['جمع داراییها'],['پیش دریافتها'],['ذخیره مالیات بر درامد'],['سود سهام پیشنهادی و پرداختنی'],['حصه جاری تسهیلات مالی دریافتی'],['جمع بدهیهای جاری'],['حسابها و اسناد پرداختنی بلند مدت'],['تسهیلات مالی دریافتی بلند مدت'],['سود (زیان) انباشته'],['دریافتنی‌های تجاری و سایر دریافتنی‌ها'],['پرداختنی‌های تجاری و سایر پرداختنی‌ها'],['سرمایه گذاری در املاک'],['ذخایر'],['مطالبات از سایر بانکها و موسسات اعتباری'],['مطالبات از بانک مرکزی'],['سپرده های دیداری'],['سپرده های قرض الحسنه و پس اندار و مشابه'],['بدهی به بانک مرکزی'],['سایر سپرده ها'],['بدهی به بانکها و موسسات اعتباری'],['مطالبات از دولت'],['تسهیلات اعطایی و مطالبات از اشخاص دولتی']
,['سپرده های سرمایه گذاری مدت دار']['تسهیلات اعطایی به سایر اشخاص'],['حسابها و اسناد دریافتنی تجاری'],['حسابها و اسناد پرداختنی تجاری'],['سایر حسابها و اسناد پرداختنی'],['سپرده قانونی'],['اندوخته صرف سهام'],['پیش پرداخت های سرمایه ای'],['بدهی‌های مرتبط با دارایی‌های غیر جاری نگهداری شده برای فروش']
	from BalanceSheetGheyreTalfighi hc
	where not exists(select 1 from BalanceSheetGheyreTalfighi h where hc.instrumentId = h.instrumentId and h.CreateDate > hc.CreateDate)and 
	(cast([CreateDate] as date) =  cast(@DATE as date) or day = convert(varchar, @DATE, 112))
	order by 1 desc
end