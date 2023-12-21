




CREATE     view [dbo].[systemtest7] 
as 
with cte7 as (
select N'TradingViewUSA.py' [اولین توضیح], N'هنگام درج داده در اس کیو ال سرور از نام ستون ها در سایت بورس ویو استفاده شد' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'TradingViewUSA' [به کجا ارسال میشود], N'TradingViewUSA' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursViewUSA order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://www.tradingview.com/markets/stocks-usa/market-movers-highest-net-income' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInTradingViewUSA]
union all 
select N'TradingViewAustralia.py' [اولین توضیح], N'هنگام درج داده در اس کیو ال سرور از نام ستون ها در سایت بورس ویو استفاده شد' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'TradingViewAustralia' [به کجا ارسال میشود], N'TradingViewAustralia' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursViewAustralia order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://www.tradingview.com/markets/stocks-australia/market-movers-highest-net-income/' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInTradingViewAustralia]
union all 
select N'TradingViewCanada.py' [اولین توضیح], N'هنگام درج داده در اس کیو ال سرور از نام ستون ها در سایت بورس ویو استفاده شد' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'TradingViewCanada' [به کجا ارسال میشود], N'TradingViewCanada' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursViewCanada order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://www.tradingview.com/markets/stocks-canada/market-movers-highest-net-income/' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInTradingViewCanada]
union all 
select N'TradingViewChina.py' [اولین توضیح], N'هنگام درج داده در اس کیو ال سرور از نام ستون ها در سایت بورس ویو استفاده شد' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'TradingViewChina' [به کجا ارسال میشود], N'TradingViewChina' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursViewChina order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://www.tradingview.com/markets/stocks-China/market-movers-highest-net-income/' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInTradingViewChina]
union all 
select N'TradingViewEngland.py' [اولین توضیح], N'هنگام درج داده در اس کیو ال سرور از نام ستون ها در سایت بورس ویو استفاده شد' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'TradingViewEngland' [به کجا ارسال میشود], N'TradingViewEngland' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursViewEngland order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://www.tradingview.com/markets/stocks-China/market-movers-highest-net-income/' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInTradingViewEngland]
union all 
select N'TradingViewGermany.py' [اولین توضیح], N'هنگام درج داده در اس کیو ال سرور از نام ستون ها در سایت بورس ویو استفاده شد' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'TradingViewGermany' [به کجا ارسال میشود], N'TradingViewvJapan' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursViewGermany order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://www.tradingview.com/markets/stocks-Germany/market-movers-highest-net-income/' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInTradingViewGermany]
union all 
select N'TradingViewJapan.py' [اولین توضیح], N'هنگام درج داده در اس کیو ال سرور از نام ستون ها در سایت بورس ویو استفاده شد' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'TradingViewJapan' [به کجا ارسال میشود], N'TradingViewJapan' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursViewJapan order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://www.tradingview.com/markets/stocks-Japan/market-movers-highest-net-income/' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInTradingViewJapan]
union all 
select N'TradingViewKorea.py' [اولین توضیح], N'هنگام درج داده در اس کیو ال سرور از نام ستون ها در سایت بورس ویو استفاده شد' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'TradingViewKorea' [به کجا ارسال میشود], N'TradingViewKorea' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursViewJapan order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://www.tradingview.com/markets/stocks-Korea/market-movers-highest-net-income/' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInTradingViewKorea]
union all 
select N'TradingViewSpain.py' [اولین توضیح], N'هنگام درج داده در اس کیو ال سرور از نام ستون ها در سایت بورس ویو استفاده شد' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'TradingViewSpain' [به کجا ارسال میشود], N'TradingViewSpain' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursViewJapan order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://www.tradingview.com/markets/stocks-Spain/market-movers-highest-net-income/' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInTradingViewSpain]
union all 
select N'TradingViewTurkey.py' [اولین توضیح], N'هنگام درج داده در اس کیو ال سرور از نام ستون ها در سایت بورس ویو استفاده شد' [توضیح دوم], N'' [توضیح سوم],N''[توضیح چهارم],N''[توضیح پنجم],N''[توضیح ششم],N''[توضیح هفتم],N''[توضیح هشتم],N''[توضیح نهم], N'TradingViewTurkey' [به کجا ارسال میشود], N'TradingViewTurkey' ReportName,cast(CNT365 as nvarchar(20)) CNT365,cast(CNT90 as nvarchar(20)) CNT90,cast(CNT30 as nvarchar(20)) CNT30,cast(CNT14 as nvarchar(20)) CNT14,cast(CNT7 as nvarchar(20)) CNT7,cast(CNT3 as nvarchar(20)) CNT3,cast(CNT180 as nvarchar(20)) CNT180,(select top 1 cast(createdate as nvarchar(20)) from BoursViewJapan order by createdate desc) [آخرین زمان بروز رسانی],N'' [Mostanadat], N'https://www.tradingview.com/markets/stocks-Turkey/market-movers-highest-net-income/' [کجا را میخواند], '' [کجا را میخواند دوم], N'' [کاربرد]
from [P_CalcDayCountInTradingViewTurkey]
)
select * 
 from cte7