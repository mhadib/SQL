
CREATE view [dbo].[v_getLastTSETMCData]
as
select t.instrumentId, Symbol [symbolFA], cast(ForushHoghughiVolume as bigint) * cast(finalprice as bigint) [فروش حقوقی],
cast(ForushHaghighiVolume as bigint) * cast(finalprice as bigint) [فروش حقیقی],
cast(KharidHoghughiVolume as bigint) * cast(finalprice as bigint) [خرید حقوقی],
cast(KharidHaghighiVolume as bigint) * cast(finalprice as bigint) [خرید حقیقی],
cast(KharidHoghughiVolume as bigint) * cast(finalprice as bigint) + cast(KharidHaghighiVolume as bigint) * cast(finalprice as bigint) [1DaysVolume],
cast(NumberOfShare as bigint) * cast(FinalPrice as bigint) [ارزش بازار],
convert(varchar(10),t.createdate,112) [day],
convert(varchar(10),t.createdate,112) dayMarketCap,
t.float,
t.CreateDate
from getLastTSETMCData() t
