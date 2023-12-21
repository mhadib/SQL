



CREATE   view [dbo].[systemtest6] 
as 
with cte6 as (

select N'EconomistVaamBeBakhsheKhosusi.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'‌' [به کجا ارسال میشود], N'VaamBeBakhsheKhosusi' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from VaamBeBakhsheKhosusi order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/country-list/loans-to-private-sector' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInVaamBeBakhsheKhosusi]
union all 
select N'EconomistZakhayerArzi.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'‌' [به کجا ارسال میشود], N'ZakhayerArzi' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from ZakhayerArzi order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/country-list/foreign-exchange-reserves' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInZakhayerArzi]
union all 
select N'EconomistZakhayerTala.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'‌' [به کجا ارسال میشود], N'ZakhayerTala' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from ZakhayerTala order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/country-list/gold-reserves' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInZakhayerTala]
union all 
select N'EconomistTavarrom.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'VTavarrom' [به کجا ارسال میشود], N'Tavarrom' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from Tavarrom order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/commodities' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInTavarrom]
union all 
select N'EconomistBourseUSNasdaq.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BoursUSNasdaq' [به کجا ارسال میشود], N'VBoursUSNasdaq' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursUSNasdaq order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/spx:ind' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInBoursUSNasdaq]
union all 
select N'EconomistBourseCanada.py' [اولین توضیح], N'مارکت کپ در تریدینگ ویو اینطوری شد که اگر خط تیر باشه اون شرکت نمایش داده نشود' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BoursCanada' [به کجا ارسال میشود], N'VBoursCanada' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursCanada order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/canada/stock-market' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInBoursCanada]
union all 
select N'EconomistBourseChina.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BoursChina' [به کجا ارسال میشود], N'VBoursChina' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursChina order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/china/stock-market' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInBoursChina]
union all 
select N'EconomistBourseKorea.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BoursKorea' [به کجا ارسال میشود], N'VBoursKorea' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursKorea order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/south-korea/stock-market' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInBoursKorea]
union all 
select N'EconomistBourseJapan.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BoursJapan' [به کجا ارسال میشود], N'VBoursJapan' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursJapan order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/japan/stock-market' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInBoursJapan]
union all 
select N'EconomistBourseTorkey.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BoursTorkey' [به کجا ارسال میشود], N'VBoursTorkey' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursTorkey order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/Turkey/stock-market' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInBoursTorkey]
union all 
select N'EconomistBourseFrance.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BoursFrance' [به کجا ارسال میشود], N'VBoursFrance' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursFrance  order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/France/stock-market' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInBoursFrance]
union all 
select N'EconomistBourseGermany.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BoursGermany' [به کجا ارسال میشود], N'VBoursGermany' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursGermany order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/Germany/stock-market' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInBoursGermany]

union all 
select N'EconomistSoodSherkatHa.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'SoodSherkatHa' [به کجا ارسال میشود], N'VSoodSherkatHa' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from SoodSherkatHa order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://fa.tradingeconomics.com/country-list/corporate-profits' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInSoodSherkatHa]


union all 
select N'BourseViewUSA.py' [اولین توضیح], N'هنگام درج داده در اس کیو ال سرور از نام ستون ها در سایت بورس ویو استفاده شد' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'BourseViewUSA' [به کجا ارسال میشود], N'BourseViewUSA' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursViewUSA order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://www.tradingview.com/markets/stocks-usa/market-movers-highest-net-income' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInBoursViewUSA]



union all 
select N'توضیح اول', N'توضیح دوم',N'توضیح سوم', N'توضیح چهارم',N'توضیح پنجم',N'توضیح ششم',N'توضیح هفتم',N'توضیح هشتم', N'نرخ ارز', N'آخرین بروز رسانی', N'به کجا ارسال میشود', N'به کجا ارسال میشود',N'به کجا ارسال میشود',N'به کجا ارسال میشود',N'به کجا ارسال میشود',N'به کجا ارسال میشود',N'',N'به کجا ارسال میشود',N'به کجا ارسال میشود',N'به کجا ارسال میشود', N'به کجا ارسال میشود', '' [کجا را میخواند دوم], N'' [کاربرد]
union all 
select N'[CNY-HML] در صد ضرب میشود', N'سعی هزار تقسیم بر 1000000 میشود', N'هزار تقسیم بر هزار میشود', N'USD-HML ضربدر 1000 میشود',N'HML ضربدر 1000 میشود',N'میلیارد ضربدر 1000 میشود',N'نسبت نرخ برابری ارز به دلار از این جهت که دلار در صورت باشد یا در مخرج در ستون دلار دیوایدز مشخص شده است که در محاسبات تبدیل نرخ ارز از این ستون حتما باید استفاده شود',N'توضیح هشتم',N'vtgjuCurrency',cast(max(currentDate)as nvarchar(100)) , N'VTolidNakhalesDakheli', N'VMovazeneTejari' , N'VNaghdinegi',N'VKasriHesabeJari',N'VBankMarkazi',N'VSarmayeGozariKhareji',N'vVaamBeBakhsheKhosusi',N'',N'VZakhayerArzi',N'VGardeshSarmaye',N'VBedehiKhareji', '' [کجا را میخواند دوم], N'' [کاربرد]
from vtgjuCurrency

union all 
select N'' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'' [به کجا ارسال میشود], N'-',N'-',N'-',N'-',N'-',N'-',N'-',N'-',N'' [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
union all 
select N'' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'' [به کجا ارسال میشود], 'JobName', 'RunTime', 'JobRunStatus', '', '', '', '', '',N'' [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
union all 
select N'' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'' [به کجا ارسال میشود], *,'','','','','',N'' [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
froM v_JobStatus
union all 
select N'' [اولین توضیح], N'داشبورد اکونومیست' [توضیح دوم], N'مقادیر تجمعی بر اساس مقدار گذشته به ملیون دلار گردش سرمایه مرتب شده است' [توضیح سوم],N'فقط کشورهای لیست کسری حساب جاری نمایش داده میشوند'[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'' [به کجا ارسال میشود], N'‌',N'-',N'-',N'-',N'-',N'-',N'-',N'-',N'' [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]

union all 
select N'ValuesOfTradePeriodicly_Light_DataBase.py' [اولین توضیح], N'' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'' [به کجا ارسال میشود], N'VChartayi',N'-',N'-',N'-',N'-',N'-',N'-',N'-',N'' [آخرین زمان بروز رسانی],N'', N'' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد])
select * 
 from cte6
