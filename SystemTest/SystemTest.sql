




--EXEC proc_generate_excel_with_columns 'Adib', 'SystemTest','E:\Moini\SalamateSystem.xls'
CREATE View [dbo].[SystemTest]
as
with cte as (
select N'tsetmc2.py' [اولین توضیح], N'اطلاعات معاملات را از سامانه تی اس ای تی ام سی میگیرد و مطابق فراخوانی چهارتایی بورس ویو زمان بندی شده اتس' [توضیح دوم], N'هیستوری از جدول تمپ که شبانه ساخته شده است گرفته میشود ' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'HistoricalChartayiTSETMC' [به کجا ارسال میشود], N'' ReportName,cast(CNT365 as nvarchar(20)) [365],cast(CNT90 as nvarchar(20)) [90],cast(CNT30 as nvarchar(20)) [30],cast(CNT14 as nvarchar(20)) [14],cast(CNT7 as nvarchar(20)) [7],cast(CNT3 as nvarchar(20)) [3],cast(CNT180 as nvarchar(20)) [180],(select top 1 cast(createdate as nvarchar(20)) from HistoricalChartayiTSETMC order by createdate desc) [آخرین زمان بروز رسانی],N''Mostanadat, N'http://www.tsetmc.com/tsev2/data/ClientTypeAll.aspx' [کجا را میخواند], 'http://www.tsetmc.com/tsev2/data/MarketWatchInit.aspx?h=0&r=0' [کجا را میخواند دوم], N'' [کاربرد]
from [dbo].P_CalcDayCountInHistoricalChartayiTSETMC
union all 
select N'ValuesOfTradePeriodicly_Light_DataBase.py' [اولین توضیح], N'هر شب ساعت ۳ اطلاعات مربوط به گذشته مثلا فروش یک سال حقیقی محاسبه میشود تا در طول روز حاظر و آماده باشد توسط جاب اس کیو ال سرور' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'HistoricalChartayi' [به کجا ارسال میشود], N'https://api.bourseview.com/v2/quotes?items=share&date=[20220915]',cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180, (select top 1 cast(createdate as nvarchar(20)) from HistoricalChartayi where [float] is not null order by createdate desc) [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N'ارزش بازار و شناوری' [کاربرد]
from P_CalcDayCountInFloatAndArzeshBazarInHistoricalChartayi
union all 
select N'ValuesOfTradePeriodicly_Light_DataBase.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'HistoricalChartayi' [به کجا ارسال میشود], N'https://api.bourseview.com/v2/quotes?items=indinst&exchanges=IRTSENO,IRIFBNO,IRIFBOTC&date=[20220915]',cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180, (select top 1 cast(createdate as nvarchar(20)) from HistoricalChartayi where [خرید حقوقی] is not null order by createdate desc) [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N'خرید حقیقی، فروش حقیقی، خرید حقوقی، فروش حقوقی' [کاربرد]
from P_CalcDayCountInHaghighiHoghughiHistoricalChartayi
union all 
select N'ValuesOfTradePeriodicly_Light_DataBase.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'HistoricalChartayi' [به کجا ارسال میشود], N'https://api.bourseview.com/v2/quotes?items=price&exchanges=IRIFBOTC&date=[20220915]',cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180, (select top 1 cast(createdate as nvarchar(20)) from HistoricalChartayi where FinalPrice is not null order by createdate desc) [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N'حجم معاملات سهام و قیمت سهم' [کاربرد]
from [dbo].[P_CalcDayCountInFinalPriceAnd1DaysVolumeInHistoricalChartayi]
union all 
select N'ValuesOfTradePeriodicly_Light_DataBase.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'HistoricalChartayi' [به کجا ارسال میشود], N'https://api.bourseview.com/v2/quotes?items=price&exchanges=IRTSENO&date=[20220915]',cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180, (select top 1 cast(createdate as nvarchar(20)) from HistoricalChartayi where FinalPrice is not null order by createdate desc) [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N'حجم معاملات سهام و قیمت سهم' [کاربرد]
from [dbo].[P_CalcDayCountInFinalPriceAnd1DaysVolumeInHistoricalChartayi]
union all 
select N'BalancSheetGheyreTalfighi_DataBase_BalancSheet_Bourse.py' [اولین توضیح], N'اطلاعات تکراری همه بالانس شیت ها در پروسیجر Clean_HistoricalData شبانه حذف میشود' [توضیح دوم], N'اگر شرکتی یک سال اطلاعات غیر تلفیقی خود را منتشر نکند بصورت خودکار در لیست های تلفیقی نشان داده نمیشود ' [توضیح سوم],N'همچنین اگر پانصد روز اطلاعات تلفیقی را منتشر نکند در لیست های تلفیقی نشان داده نمیشود '[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BalanceSheetGheyreTalfighiCategurbalancesheet_bourse' [به کجا ارسال میشود], N'https://api.bourseview.com/v2/stocks/statements',cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180, (select top 1 cast(createdate as nvarchar(20)) from BalanceSheetGheyreTalfighiCategurbalancesheet_bourse order by createdate desc) [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N' بالانس شیت غیر تلفیقی بورس' [کاربرد]
from [P_CalcDayCountInBalanceSheetGheyreTalfighiCategurbalancesheet_bourse]
union all 
select N'BalancSheetGheyreTalfighi_DataBase_BalancSheet_FaraBourse.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BalanceSheetGheyreTalfighiCategurbalancesheet_farabourse' [به کجا ارسال میشود], N'https://api.bourseview.com/v2/stocks/statements',cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180, (select top 1 cast(createdate as nvarchar(20)) from BalanceSheetGheyreTalfighiCategurbalancesheet_farabourse order by createdate desc) [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N' بالانس شیت غیر تلفیقی فرابورس' [کاربرد]
from [P_CalcDayCountInBalanceSheetGheyreTalfighiCategurbalancesheet_Farabourse]
union all 
select N'BalancSheetGheyreTalfighi_DataBase_cashflow_Bourse.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BalanceSheetGheyreTalfighiCategurCashflow_Bourse' [به کجا ارسال میشود], N'https://api.bourseview.com/v2/stocks/statements',cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180, (select top 1 cast(createdate as nvarchar(20)) from [BalanceSheetGheyreTalfighiCategurCashflow_Bourse] order by createdate desc) [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N' کش فلو غیر تلفیقی بورس' [کاربرد]
from [P_CalcDayCountInBalanceSheetGheyreTalfighiCategurCashflow_Bourse]
union all 
select N'BalancSheetGheyreTalfighi_DataBase_cashflow_faraBourse.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BalanceSheetGheyreTalfighiCategurCashflow_FaraBourse' [به کجا ارسال میشود], N'https://api.bourseview.com/v2/stocks/statements',cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180, (select top 1 cast(createdate as nvarchar(20)) from [BalanceSheetGheyreTalfighiCategurCashflow_FaraBourse] order by createdate desc) [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N' کش فلو غیر تلفیقی فرابورس' [کاربرد]
from [P_CalcDayCountInBalanceSheetGheyreTalfighiCategurCashflow_faraBourse]
union all 
select N'BalancSheetGheyreTalfighi_DataBase_incomeStatement_Bourse.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BalanceSheetGheyreTalfighiCategurincomestatement_Bourse' [به کجا ارسال میشود], N'https://api.bourseview.com/v2/stocks/statements',cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180, (select top 1 cast(createdate as nvarchar(20)) from [BalanceSheetGheyreTalfighiCategurincomestatement_Bourse] order by createdate desc) [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N' اینکام استیت منت غیر تلفیقی بورس' [کاربرد]
from [P_CalcDayCountInBalanceSheetGheyreTalfighiCategurincomestatement_Bourse])
select * from cte
