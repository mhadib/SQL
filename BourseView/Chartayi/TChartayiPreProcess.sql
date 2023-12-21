

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TChartayiPreProcess]
   ON  [dbo].[StartTriger]
   AFTER INSERT
AS 
BEGIN
declare @Old365 int = -1* dbo.findLastWorkDayAfterDays(365)
declare @Old180 int = -1* dbo.findLastWorkDayAfterDays(180)
--declare @Old90 int =  -1* dbo.findLastWorkDayAfterDays(90)
declare @Old30 int =  -1* dbo.findLastWorkDayAfterDays(30)
--declare @Old14 int = -1* dbo.findLastWorkDayAfterDays(14)
--declare @Old7 int =  -1* dbo.findLastWorkDayAfterDays(7)
--declare @Old3 int =  -1* dbo.findLastWorkDayAfterDays(3);
--declare @Old1 int =  -1* dbo.findLastWorkDayAfterDays(1);
	truncate table VChartayi
	
	insert into VChartayi
	--drop table VChartayi
	select distinct [instrumentId],[ارزش دیروز بازار],نماد,/*[1DaysVolume]*/[سهام معامله شده در یک روز],[day],/*[3DaysVolume]*/[سهام معامله شده در سه روز],/*[7DaysVolume]*/[سهام معامله شده در هفت روز],/*[14DaysVolume]*/ [سهام معامله شده در چهارده روز],/*[30DaysVolume]*/  [سهام معامله شده در سی روز],/*[180DaysVolume]*/[سهام معامله شده در شش ماه],[dayMarketCap],[ارزش بازار],[رشد ارزش بازار نسبت به روز قبل],[درصد سهام شناور],[ارزش بازار سی روز قبل],[رشد ارزش بازار نسبت به سی روز قبل],[ارزش بازار سه روز قبل],[رشد ارزش بازار نسبت به سه روز قبل],[ارزش بازار هفت روز قبل],[رشد ارزش بازار نسبت به هفت روز قبل],[ارزش بازار چهارده روز قبل],[رشد ارزش بازار نسبت به چهارده روز قبل],[فروش حقیقی],[خرید حقیقی],[فروش حقوقی],[خرید حقوقی],[فروش حقیقی چهارده روز],[خرید حقیقی چهارده روز],[فروش حقوقی چهارده روز],[خرید حقوقی چهارده روز],[فروش حقیقی نود روز],[خرید حقیقی نود روز],[فروش حقوقی نود روز],[خرید حقوقی نود روز],[خرید حقوقی سه روز],[خرید حقوقی هفت روز],[خرید حقیقی سه روز],[خرید حقیقی هفت روز],[فروش حقوقی سه روز],[فروش حقیقی سه روز],[فروش حقوقی هفت روز],[فروش حقیقی هفت روز],[خرید حقوقی سی روز],[خرید حقیقی سی روز],[فروش حقوقی سی روز],[فروش حقیقی سی روز],/*[90DaysVolume]*/[سهام معامله شده در نود روز],[رشد ارزش بازار نسبت به نود روز قبل],[رشد ارزش بازار نسبت به شش ماه قبل],[createdate],[متوسط سهام معامله شده در سه روز گذشته],[متوسط سهام معامله شده در چهارده روز گذشته],[متوسط سهام معامله شده در یک هفته گذشته],[متوسط سهام معامله شده در سه ماه گذشته],[متوسط سهام معامله شده در شش ماه گذشته],[خالص خرید حقیقی],[خالص خرید حقیقی در سه روز گذشته],[خالص خرید حقیقی در هفت روز گذشته],[خالص خرید حقوقی],[خالص خرید حقوقی در سه روز گذشته],[خالص خرید حقوقی در هفت روز گذشته],[خالص خرید حقوقی در چهارده روز گذشته],[خالص خرید حقیقی در یک ماه گذشته],[خالص خرید حقیقی در سه ماه گذشته],[خالص خرید حقوقی در یک ماه گذشته],[خالص خرید حقوقی در سه ماه گذشته],[خالص خرید حقیقی در چهارده روز گذشته],[ارزش سهام شناور از ارزش روز شرکت] 
,[درصد سهام معامله شده هر شرکت به کل سهام معامله شده در دو هفته],[درصد سهام معامله شده هر شرکت از کل سهام معامله شده],[درصد سهام معامله شده هر شرکت از کل سهام معامله شده در شش ماه],[درصد سهام معامله شده هر شرکت از کل سهام معامله شده در یک هفته],[درصد ارزش بازار روز هر شرکت به کل ارزش بازار],[نسبت سهام معامله شده در دو هفته چند درصد سهام شناور],[نسبت سهام معامله شده در یک ماه چند درصد سهام شناور],[نسبت سهام معامله شده در سه روز گذشته چند درصد سهام شناور],
	[نسبت سهام معامله شده در سه ماه گذشته چند درصد سهام شناور],
	[نسبت سهام معامله شده در شش ماه چند درصد سهام شناور],[درصد سهام معامله شده هر شرکت به کل سهام معامله شده در سه روز],
	[درصد سهام معامله شده هر شرکت از کل سهام معامله شده در یک هفته] [درصد سهام معامله شده هر شرکت از کل سهام معامله شده در یک هفته(تکراری)],[درصد سهام معامله شده هر شرکت به کل سهام معامله شده در سی روز],[درصد خرید حقوقی ها در نود روز گذشته شرکت به کل شرکت ها],[درصد خرید حقیقی ها در نود روز گذشته شرکت به کل شرکت ها],[متوسط سهام معامله شده در هفته ماقبل],[تغییر رفتار سهامدار در هفته جاری نسبت به هفته قبل],[متوسط سهام معامله شده دو هفته ماقبل],[رشد متوسط روزانه سهام معامله شده در دوهفته اخیر نسبت به دو هفته ماقبل],
	[رشد سهام خریده شده در یک هفته نسبت به متوسط سهام معاملاتی سه ماه گذشته],[تغییر رفتار سهامدار در روز جاری نسبت به متوسط دو هفته قبل],[تغییر رفتار سهامدار در یک هفته نسبت به یک ماه],[متوسط خرید حقوقی در دو هفته ماقبل],[تغییر رفتار حقوقی در دو هفته اخیر نسبت به دو هفته قبل],[ارزش بازار به ریال در اسفند 98],[GroupName],[رشد ارزش بازار به ریال نسبت به اسفند 98],
	[نسبت سهام معامله شده در یک هفته چند درصد سهام شناور],[سود خالص دارندگان سهام شناور در روز جاری],[سود خالص دارندگان سهام شناور در یک ماه],[سود خالص دارندگان سهام شناور در سه روز],[درصد سود خالص دارندگان سهام شناور از کل شرکت ها در سه روز گذشته],[سود خالص دارندگان سهام شناور در دو هفته],[درصد سود خالص دارندگان سهام شناور از کل شرکت ها در دو هفته گذشته],[درصد سود خالص دارندگان سهام شناور از کل شرکت ها در روز جاری],[متوسط سهام معامله شده در سی روز],[درصد سهام معامله شده هر شرکت به کل سهام معامله شده در دو هفته] [درصد سهام معامله شده هر شرکت به کل سهام معامله شده در دو هفته(تکراری)],[درصد سود خالص دارندگان سهام شناور از کل شرکت ها در یک ماه گذشته],
[درصد خرید حقوقی در روز جاری شرکت به کل شرکت ها],[درصد خرید حقوقی در سه روز گذشته به کل شرکت ها ],[درصد خرید حقوقی در هفت روز شرکت به کل شرکت ها],[درصد خرید حقوقی ها در چهارده روز شرکت به کل شرکت ها],[درصد خرید حقیقی ها در روز جاری شرکت به کل شرکت ها],[درصد خرید حقیقی ها در سه روز گذشته شرکت به کل شرکت ها],[رشد سهام معامله شده در روز جاری نسبت به معدل سهام معامله شده در یک ماه],[تغییر رفتار سهامدار در سه روز گذشته نسبت به دو هفته قبل],

[درصد خرید حقیقی ها در نود روز گذشته شرکت به کل شرکت ها] [درصد خرید حقیقی ها در نود روز گذشته شرکت به کل شرکت ها(تکراری)],[درصد خرید حقوقی ها در نود روز گذشته شرکت به کل شرکت ها] [درصد خرید حقوقی ها در نود روز گذشته شرکت به کل شرکت ها(تکراری)],
	[نسبت سهام معامله شده در روز جاری چند درصد سهام شناور],[سود حقیقی ها در سه روز],
	[درصد خرید حقیقی ها در چهارده روز شرکت به کل شرکت ها],
	[درصد خرید حقیقی ها در هفت روز شرکت به کل شرکت ها ],[درصد سهام معامله شده هر شرکت در سه ماه گذشته به کل شرکت ها],[درصد ارزش ریالی سهام شناور هر شرکت از کل شرکت ها],[درصد سهام معامله شده هر شرکت به کل سهام معامله شده در سه روز] [درصد سهام معامله شده هر شرکت به کل سهام معامله شده در سه روز(تکراری)],[درصد سود خالص دارندگان سهام شناور از کل شرکت ها در نود روز گذشته],[سود خالص دارندگان سهام شناور در یک هفته],[نسبت سهام معامله شده در یک هفته به ارزش روز سهام شناور],[سود خالص دارندگان سهام شناور در شش ماه گذشته],[تعداد روز فعال در سه روز],[تعداد روز فعال در هفت روز],[تعداد روز فعال در چهارده روز],
	[تعداد روز فعال در سی روز],[تعداد روز فعال در نود روز],[تعداد روز فعال در شش ماه],
	[رشد ارزش بازار نسبت به یک سال قبل],/*['365DaysVolume']*/[سهام معامله شده در یک سال],['خرید حقیقی یک سال'],['خرید حقوقی یک سال'],['فروش حقیقی یک سال'],['فروش حقوقی یک سال'],[تعداد روز فعال در یک سال],[خالص خرید حقیقی در یک سال گذشته],[خالص خرید حقوقی در یک سال گذشته],[سود خالص دارندگان سهام شناور و غیر شناور در یک سال],[درصد سهام معامله شده هر شرکت از کل سهام معامله شده در یک سال],[ارزش بازار یک سال قبل],[ارزش بازار نود روز قبل],[ارزش بازار شش ماه قبل],[درصد سهام شناور سه روز قبل],[درصد سهام شناور هفت روز قبل],
	[درصد سهام شناور چهارده روز قبل],[درصد سهام شناور سی روز قبل],[درصد سهام شناور نود روز قبل],[درصد سهام شناور شش ماه قبل],
	[درصد سهام شناور یک سال قبل],[ارزش ریالی سهام شناور یک سال قبل],[ارزش ریالی سهام شناور شش ماه قبل],[ارزش ریالی سهام شناور نود روز قبل],[ارزش ریالی سهام شناور سی روز قبل],[ارزش ریالی سهام شناور چهارده روز قبل],[ارزش ریالی سهام شناور هفت روز قبل],[ارزش ریالی سهام شناور سه روز قبل],[ارزش ریالی سهام شناور دیروز],[سود خالص دارندگان سهام شناور در یک سال گذشته],[قیمت پایانی سهم],[اوراق فروخته شده در روز جاری],[اوراق فروخته شده در دو هفته],
	[اوراق فروخته شده در شش ماه]
	,[اوراق فروخته شده در سه روز],[اوراق فروخته شده در سی روز],[اوراق فروخته شده در یک سال],[اوراق فروخته شده در یک هفته],[اوراق فروخته شده در سه ماه],[عملیات بازار باز در یک روز],[پذیره نویسی دولت],[سایر],[عملیات بازار باز در سی روز],[سی روز پذیره نویسی دولت],[سی روز سایر],
	[عملیات بازار باز در شش ماه],[شش ماه پذیره نویسی دولت],[شش ماه سایر],[عملیات بازار باز در یک سال],[یک سال پذیره نویسی دولت],[یک سال سایر],[قیمت سهم در چهارده روز گذشته],[قیمت سهم در روز گذشته],[قیمت سهم در هفت روز گذشته],[قیمت سهم در نود روز گذشته],[قیمت سهم شش ماه گذشته],[قیمت سهم در سه روز گذشته],[قیمت سهم در سی روز گذشته],[قیمت سهم در یک سال گذشته],[بازده سالانه اوراق],[آخرین روز معاملاتی], [قیمت روز اوراق],[تاریخ آخرین سررسید],[نماد در اوراق فرابورس],[نرخ سود تا سررسید],[رشد ارزش بازار نسبت به شش مرداد 99],['فروش حقوقی 6 مرداد 99'],['خرید حقوقی 6 مرداد 99'],['فروش حقیقی 6 مرداد 99'],['خرید حقیقی 6 مرداد 99'],[سهام معامله شده از شش مرداد 99 تا امروز],[سهام معامله شده در هفته ما قبل],[سهام معامله شده در دو هفته ماقبل],[نام رشته], [نام کامل]
,[تغییر رفتار سهامدار در متوسط سه روز گذشته به متوسط شش ماه گذشته]
    --into VChartayi
	from VChartayiPreProcess
	union all 
	select instrumentId as [instrumentId],null as [ارزش دیروز بازار],symbolFa as [symbolFA],[1DaysVolume] as [1DaysVolume],tradedate as [day],[3DaysVolume] as [3DaysVolume],[7DaysVolume] as [7DaysVolume],[14DaysVolume] as [14DaysVolume], [30DaysVolume] as [30DaysVolume],[180DaysVolume] as [180DaysVolume],null as [dayMarketCap],null as [ارزش بازار],null as [رشد],null as [float],null as [ارزش سی روز گذشته بازار],null as [رشد سی روزه],null as [ارزش سه روز گذشته بازار],null as [رشد سه روزه],null as [ارزش هفت روز گذشته بازار],null as [رشد هفت روزه],null as [ارزش چهارده روز گذشته بازار],null as [رشد چهارده روزه],null as [فروش حقیقی],null as [خرید حقیقی],null as [فروش حقوقی],null as [خرید حقوقی],null as [فروش حقیقی چهارده روز],null as [خرید حقیقی چهارده روز],null as [فروش حقوقی چهارده روز],null as [خرید حقوقی چهارده روز],null as [فروش حقیقی نود روز],null as [خرید حقیقی نود روز],null as [فروش حقوقی نود روز],null as [خرید حقوقی نود روز],null as [خرید حقوقی سه روز],null as [خرید حقوقی هفت روز],null as [خرید حقیقی سه روز],null as [خرید حقیقی هفت روز],null as [فروش حقوقی سه روز],null as [فروش حقیقی سه روز],null as [فروش حقوقی هفت روز],null as [فروش حقیقی هفت روز],null as [خرید حقوقی سی روز],null as [خرید حقیقی سی روز],null as [فروش حقوقی سی روز],null as [فروش حقیقی سی روز],[90DaysVolume] as [90DaysVolume],null as [رشد نود روزه],null as [رشد شش ماهه],null as [createdate],null as [متوسط سهام معامله شده در سه روز گذشته],null as [متوسط سهام معامله شده در چهارده روز گذشته],null as [متوسط سهام معامله شده در یک هفته گذشته],null as [متوسط سهام معامله شده در سه ماه گذشته],null as [متوسط سهام معامله شده در شش ماه گذشته],null as [خالص خرید حقیقی],null as [خالص خرید حقیقی در سه روز گذشته],null as [خالص خرید حقیقی در هفت روز گذشته],null as [خالص خرید حقوقی],null as [خالص خرید حقوقی در سه روز گذشته],null as [خالص خرید حقوقی در هفت روز گذشته],null as [خالص خرید حقوقی در چهارده روز گذشته],null as [خالص خرید حقیقی در یک ماه گذشته],null as [خالص خرید حقیقی در سه ماه گذشته],null as [خالص خرید حقوقی در یک ماه گذشته],null as [خالص خرید حقوقی در سه ماه گذشته],null as [خالص خرید حقیقی در چهارده روز گذشته],null as [ارزش سهام شناور از ارزش روز شرکت],null as [درصد سهام معامله شده هر شرکت به کل سهام معامله شده در دو هفته],null as [درصد سهام معامله شده هر شرکت از کل سهام معامله شده],null as [درصد سهام معامله شده هر شرکت از کل سهام معامله شده در شش ماه],null as [درصد سهام معامله شده هر شرکت از کل سهام معامله شده در یک هفته],null as [نسبت ارزش بازار روز هر شرکت به کل ارزش بازار],null as [نسبت سهام معامله شده در دو هفته به سهام شناور],null as [نسبت سهام معامله شده در یک ماه به سهام شناور],null as [نسبت سهام معامله شده در سه روز گذشته به سهام شناور],null as [سهام معامله شده در سه ماه گذشته چند درصد سهام شناور],null as [سهام معامله شده در شش ماه چند درصد سهام شناور],null as [درصد سهام معامله شده هر شرکت به کل سهام معامله شده در سه روز],null as [درصد سهام معامله شده هر شرکت به کل سهام معامله شده در یک هفته],null as [درصد سهام معامله شده هر شرکت به کل سهام معامله شده در سی روز],null as [درصد خرید حقوقی ها در نود روز گذشته از کل خرید شرکت],null as [درصد خرید حقیقی ها در نود روز گذشته از کل خرید شرکت],null as [متوسط سهام معامله شده در هفته ماقبل]
	,null as [تغییر رفتار سهامدار در هفته جاری نسبت به هفته قبل],null as [متوسط سهام معامله شده دو هفته ماقبل],null as [رشد متوسط روزانه سهام معامله شده در دوهفته اخیر نسبت به دو هفته ماقبل],null as [میزان رشد سهام خریده شده در یک هفته نسبت به متوسط سهام معاملاتی سه ماه گذشته]
	,null as [تغییر رفتار سهامدار در روز جاری نسبت به متوسط دو هفته قبل],null as [تغییر رفتار سهامدار در یک هفته نسبت به یک ماه],null as [متوسط خرید حقوقی در دو هفته ماقبل],null as [تغییر رفتار حقوقی در دو هفته اخیر نسبت به دو هفته قبل],null as [ارزش بازار به ریال در اسفند 98],null as [GroupName],null as [رشد ارزش بازار به ریال نسبت به اسفند 98],null as [سهام معامله شده در یک هفته چند درصد سهام شناور],null as [سود خالص دارندگان سهام شناور در روز جاری],null as [سود خالص دارندگان سهام شناور در یک ماه],null as [سود خالص دارندگان سهام شناور در سه روز],null as [درصد سود خالص دارندگان سهام شناور هر شرکت از کل شرکت ها در سه روز گذشته],null as [سود خالص دارندگان سهام شناور در دو هفته],null as [درصد سود خالص دارندگان سهام شناور هر شرکت از کل شرکت ها در دو هفته گذشته],null as [درصد سود خالص دارندگان سهام شناور هر شرکت از کل شرکت ها در روز جاری],null as [متوسط سهام معامله شده در سی روز],null as [درصد سهام معامله شده هر شرکت به کل سهام معامله شده هر شرکت در چهارده روز],null as [درصد سود خالص دارندگان سهام شناور از کل شرکت ها در یک ماه گذشته],null as [نسبت خرید حقوقی در روز جاری شرکت به کل شرکت ها],null as [نسبت خرید حقوقی در سه روز گذشته به کل شرکت ها ],null as [نسبت خرید حقوقی در هفت روز شرکت به کل شرکت ها],null as [نسبت خرید حقوقی ها در چهارده روز شرکت به کل شرکت ها],null as [نسبت خرید حقیقی ها در روز جاری شرکت به کل شرکت ها],null as [درصد خرید حقیقی ها در سه روز گذشته شرکت به کل شرکت ها],null as [رشد سهام معامله شده در روز جاری نسبت به معدل سهام معامله شده در یک ماه]
	,null as [تغییر رفتار سهامدار در سه روز گذشته نسبت به دو هفته قبل]
	
	,null as [درصد خرید حقیقی ها در نود روز گذشته شرکت به کل شرکت ها],null as [درصد خرید حقوقی ها در نود روز گذشته شرکت به کل شرکت ها],null as [سهام معامله شده در روز جاری چند درصد سهام شناور],null as [سود حقیقی ها در سه روز],null as [نسبت خرید حقیقی ها در چهارده روز شرکت به کل شرکت ها],null as [نسبت خرید حقیقی ها در هفت روز شرکت به کل شرکت ها ],null as [نسبت متوسط سهام معامله شده در سه ماه گذشته به کل شرکت ها],null as [درصد ارزش ریالی سهام شناور هر شرکت از کل شرکت ها],null as [نسبت سهام معامله شده هر شرکت از کل شرکت ها در سه روز گذشته],null as [درصد سود خالص دارندگان سهام شناور در نود روز از کل شرکت ها],null as [سود خالص دارندگان سهام شناور در یک هفته],null as [نسبت سهام معامله شده در یک هفته به ارزش روز سهام شناور],null as [سود خالص دارندگان سهام شناور در شش ماه گذشته],null as [WorkDayCountIn3CalenderDays],null as [WorkDayCountIn7CalenderDays],null as [WorkDayCountIn14CalenderDays],null as [WorkDayCountIn30CalenderDays],null as [WorkDayCountIn90CalenderDays],null as [WorkDayCountIn180CalenderDays],null as ['رشد یک ساله'],[365DaysVolume] as ['365DaysVolume'],null as ['خرید حقیقی یک سال'],null as ['خرید حقوقی یک سال'],null as ['فروش حقیقی یک سال'],null as ['فروش حقوقی یک سال'],null as [WorkDayCountIn365CalenderDays],null as [خالص خرید حقیقی در یک سال گذشته],null as [خالص خرید حقوقی در یک سال گذشته],null as [سود خالص دارندگان سهام شناور و غیر شناور در یک سال],null as [درصد سهام معامله شده هر شرکت از کل سهام معامله شده در یک سال],null as [ارزش یک سال گذشته بازار],null as [ارزش نود روز گذشته بازار],null as [ارزش شش ماهه گذشته بازار],null as [3DaysFloat],null as [7DaysFloat],null as [14DaysFloat],null as [30DaysFloat],null as [90DaysFloat],null as [180DaysFloat],null as [365DaysFloat],null as [ارزش ریالی سهام شناور یک سال قبل],null as [ارزش ریالی سهام شناور شش ماه قبل],null as [ارزش ریالی سهام شناور نود روز قبل],null as [ارزش ریالی سهام شناور سی روز قبل],null as [ارزش ریالی سهام شناور چهارده روز قبل],null as [ارزش ریالی سهام شناور هفت روز قبل],null as [ارزش ریالی سهام شناور سه روز قبل],null as [ارزش ریالی سهام شناور دیروز],null as [سود خالص دارندگان سهام شناور در یک سال گذشته],null as [FinalPrice], 
[1DaysVolumeSell] [1DaysVolumeSell],[14DaysVolumeSell] [14DaysVolumeSell], [180DaysVolumeSell] [180DaysVolumeSell],[3DaysVolumeSell] [3DaysVolumeSell], [30DaysVolumeSell] [30DaysVolumeSell], [365DaysVolumeSell] [365DaysVolumeSell], [7DaysVolumeSell] [7DaysVolumeSell], [90DaysVolumeSell] [90DaysVolumeSell],AmaliatBazarBaaz, PazireNevisiDolati, Saayer,
 [30DayAmaliatBazarBaaz],
 [30PazireNevisiDolati],
 [30Saayer],
 [180DayAmaliatBazarBaaz],
 [180PazireNevisiDolati],
 [180Saayer],
 [365DayAmaliatBazarBaaz],
 [365PazireNevisiDolati],
 [365Saayer],
null as   ChardahDaysFinalPrice
,null as  DiruzFinalPrice
,null as  HaftDaysFinalPrice
,null as  NavadDaysFinalPrice
,null as  SadoHashtadDaysFinalPrice
,null as  SeDaysFinalPrice
,null as  SiDaysFinalPrice
,null as  YekSaalDaysFinalPrice
,null as BazdehSalaneOragh
,null as LastTradeDateOragh
,null as Price
,null as SarresidDateOragh
,null as SymboleFa
,null as YTM
--,null as StackHolders
,null ['رشد شش مرداد 99'],null ['فروش حقوقی 6 مرداد 99'], null ['خرید حقوقی 6 مرداد 99'] ,null ['فروش حقیقی 6 مرداد 99']  ,null['خرید حقیقی 6 مرداد 99'], null ['6Mordad99DaysVolume'],null [سهام معامله شده در هفته ما قبل],
null [سهام معامله شده در دو هفته ماقبل],
N'اوراق' [نام رشته],
null [نام کامل],
null as [تغییر رفتار سهامدار در متوسط سه روز گذشته به متوسط شش ماه گذشته]
from (
select N'IRODolat' instrumentId,TradeDate,N'دولت' symbolFa, (KharidDolat1/10) [1DaysVolume], (KharidDolat14/10) [14DaysVolume], (KharidDolat180/10) [180DaysVolume], (KharidDolat3/10) [3DaysVolume], (KharidDolat30/10) [30DaysVolume], (KharidDolat365/10) [365DaysVolume], (KharidDolat7/10) [7DaysVolume], (KharidDolat90/10) [90DaysVolume],
(ForushDolat1/10) [1DaysVolumeSell], (ForushDolat14/10) [14DaysVolumeSell], (ForushDolat180/10) [180DaysVolumeSell], (ForushDolat3/10) [3DaysVolumeSell], (ForushDolat30/10) [30DaysVolumeSell], (ForushDolat365/10) [365DaysVolumeSell], (ForushDolat7/10) [7DaysVolumeSell], (ForushDolat90/10) [90DaysVolumeSell],null as AmaliatBazarBaaz,null as PazireNevisiDolati,null Saayer,
null [30DayAmaliatBazarBaaz],
null [30PazireNevisiDolati],
null [30Saayer],
null [180DayAmaliatBazarBaaz],
null [180PazireNevisiDolati],
null [180Saayer],
null [365DayAmaliatBazarBaaz],
null [365PazireNevisiDolati],
null [365Saayer]
from AmareOraghFaraBoursePreProcess a
union all 

select N'IROBanMarkazi' instrumentId,a.TradeDate,N'بانک مرکزی', KharidBankMarkazi1 /10 [1DaysVolume], KharidBankMarkazi14 /10 [14DaysVolume], KharidBankMarkazi180 /10 [180DaysVolume], KharidBankMarkazi3 /10 [3DaysVolume], KharidBankMarkazi30 /10 [30DaysVolume], KharidBankMarkazi365 /10 [365DaysVolume], KharidBankMarkazi7 /10 [7DaysVolume], KharidBankMarkazi90 /10 [90DaysVolume],
ForushBankMarkazi1 /10 [1DaysVolumeSell],ForushBankMarkazi14 /10 [14DaysVolumeSell], ForushBankMarkazi180 /10 [180DaysVolumeSell],ForushBankMarkazi3 /10 [3DaysVolumeSell], ForushBankMarkazi30 /10 [30DaysVolumeSell], ForushBankMarkazi365 /10 [365DaysVolumeSell], ForushBankMarkazi7 /10 [7DaysVolumeSell], ForushBankMarkazi90 /10 [90DaysVolumeSell],vb.AmaliatBazarBaaz/10 AmaliatBazarBaaz, vb.PazireNevisiDolati/10 PazireNevisiDolati, vb.Saayer/10 Saayer,
(select sum(AmaliatBazarBaaz/10) from VAmareBazareBaazFaraBourse where TradeDate > convert(varchar, dateadd(day,@Old30,GETDATE()), 112)) [30DayAmaliatBazarBaaz],
(select sum(PazireNevisiDolati/10) from VAmareBazareBaazFaraBourse where TradeDate > convert(varchar, dateadd(day,@Old30,GETDATE()), 112)) [30PazireNevisiDolati],
(select sum(Saayer/10) from VAmareBazareBaazFaraBourse where TradeDate > convert(varchar, dateadd(day,@Old30,GETDATE()), 112)) [30Saayer],
(select sum(AmaliatBazarBaaz/10) from VAmareBazareBaazFaraBourse where TradeDate > convert(varchar, dateadd(day,@Old180,GETDATE()), 112)) [180DayAmaliatBazarBaaz],
(select sum(PazireNevisiDolati/10) from VAmareBazareBaazFaraBourse where TradeDate > convert(varchar, dateadd(day,@Old180,GETDATE()), 112)) [180PazireNevisiDolati],
(select sum(Saayer/10) from VAmareBazareBaazFaraBourse where TradeDate > convert(varchar, dateadd(day,@Old180,GETDATE()), 112)) [180Saayer],
(select sum(AmaliatBazarBaaz/10) from VAmareBazareBaazFaraBourse where TradeDate > convert(varchar, dateadd(day,@Old365,GETDATE()), 112)) [365DayAmaliatBazarBaaz],
(select sum(PazireNevisiDolati/10) from VAmareBazareBaazFaraBourse where TradeDate > convert(varchar, dateadd(day,@Old365,GETDATE()), 112)) [365PazireNevisiDolati],
(select sum(Saayer/10) from VAmareBazareBaazFaraBourse where TradeDate > convert(varchar, dateadd(day,@Old365,GETDATE()), 112)) [365Saayer]
from AmareOraghFaraBoursePreProcess a
left join VAmareBazareBaazFaraBourse vb on a.TradeDate = vb.TradeDate 

union all

select N'IROSayerAshkhas' instrumentId, TradeDate,N'سایر اشخاص', KharidSayerAshkhas1 /10 [1DaysVolume], KharidSayerAshkhas14 /10 [14DaysVolume], KharidSayerAshkhas180 /10 [180DaysVolume], KharidSayerAshkhas3 /10 [3DaysVolume], KharidSayerAshkhas30 /10 [30DaysVolume], KharidSayerAshkhas365 /10 [365DaysVolume], KharidSayerAshkhas7 /10 [7DaysVolume], KharidSayerAshkhas90 /10 [90DaysVolume],
ForushSayerAshkhas1 /10 [1DaysVolumeSell],ForushSayerAshkhas14 /10 [14DaysVolumeSell], ForushSayerAshkhas180 /10 [180DaysVolumeSell],ForushSayerAshkhas3 /10 [3DaysVolumeSell], ForushSayerAshkhas30 /10 [30DaysVolumeSell], ForushSayerAshkhas365 /10 [365DaysVolumeSell], ForushSayerAshkhas7 /10 [7DaysVolumeSell], ForushSayerAshkhas90 /10 [90DaysVolumeSell],null as AmaliatBazarBaaz,null as PazireNevisiDolati,null Saayer,
null [30DayAmaliatBazarBaaz],
null [30PazireNevisiDolati],
null [30Saayer],
null [180DayAmaliatBazarBaaz],
null [180PazireNevisiDolati],
null [180Saayer],
null [365DayAmaliatBazarBaaz],
null [365PazireNevisiDolati],
null [365Saayer]
from AmareOraghFaraBoursePreProcess a


union all 

select N'IROSandoghHa' instrumentId, TradeDate,N'صندوق ها', KharidSandoghHa1 /10 [1DaysVolume], KharidSandoghHa14 /10 [14DaysVolume], KharidSandoghHa180 /10 [180DaysVolume], KharidSandoghHa3 /10 [3DaysVolume], KharidSandoghHa30 /10 [30DaysVolume], KharidSandoghHa365 /10 [365DaysVolume], KharidSandoghHa7 /10 [7DaysVolume], KharidSandoghHa90 /10 [90DaysVolume],
ForushSandoghHa1 /10 [1DaysVolumeSell],ForushSandoghHa14 /10 [14DaysVolumeSell], ForushSandoghHa180 /10 [180DaysVolumeSell],ForushSandoghHa3 /10 [3DaysVolumeSell], ForushSandoghHa30 /10 [30DaysVolumeSell], ForushSandoghHa365 /10 [365DaysVolumeSell], ForushSandoghHa7 /10 [7DaysVolumeSell], ForushSandoghHa90 /10 [90DaysVolumeSell],null as AmaliatBazarBaaz,null as PazireNevisiDolati,null Saayer,
null [30DayAmaliatBazarBaaz],
null [30PazireNevisiDolati],
null [30Saayer],
null [180DayAmaliatBazarBaaz],
null [180PazireNevisiDolati],
null [180Saayer],
null [365DayAmaliatBazarBaaz],
null [365PazireNevisiDolati],
null [365Saayer]
from AmareOraghFaraBoursePreProcess a

union all 

select N'IROBankha' instrumentId, TradeDate,N'بانک ها', KharidBankHa1 /10 [1DaysVolume], KharidBankHa14 /10 [14DaysVolume], KharidBankHa180 /10 [180DaysVolume], KharidBankHa3 /10 [3DaysVolume], KharidBankHa30 /10 [30DaysVolume], KharidBankHa365 /10 [365DaysVolume], KharidBankHa7 /10 [7DaysVolume], KharidBankHa90 /10 [90DaysVolume],
ForushBankHa1 /10 [1DaysVolumeSell],ForushBankHa14 /10 [14DaysVolumeSell], ForushBankHa180 /10 [180DaysVolumeSell],ForushBankHa3 /10 [3DaysVolumeSell], ForushBankHa30 /10 [30DaysVolumeSell], ForushBankHa365 /10 [365DaysVolumeSell], ForushBankHa7 /10 [7DaysVolumeSell], ForushBankHa90 /10 [90DaysVolumeSell],null as AmaliatBazarBaaz,null as PazireNevisiDolati,null Saayer,
null [30DayAmaliatBazarBaaz],
null [30PazireNevisiDolati],
null [30Saayer],
null [180DayAmaliatBazarBaaz],
null [180PazireNevisiDolati],
null [180Saayer],
null [365DayAmaliatBazarBaaz],
null [365PazireNevisiDolati],
null [365Saayer]
from AmareOraghFaraBoursePreProcess a

) as t


END

