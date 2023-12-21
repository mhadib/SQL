create   view VFinalpriceAndVolumes as
select InstrumentId, SymbolFA, [1DaysVolume], FinalPrice, [DAY], createdate
from FinalpriceAndVolumes c
where not exists(select 1 from FinalpriceAndVolumes m where c.instrumentid = m.instrumentid and m.CreateDate > c.CreateDate)