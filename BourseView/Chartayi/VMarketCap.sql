
CREATE view [dbo].[VMarketCap] as
select InstrumentId, DayMarketCap, [ارزش بازار], [float], createdate
from MarketCap c
where not exists(select 1 from MarketCap m where c.instrumentid = m.instrumentid and m.CreateDate > c.CreateDate)
