create   view VLegalReal as
select InstrumentId, [خرید حقیقی], [فروش حقیقی], [خرید حقوقی], [فروش حقوقی], createdate
from LegalReal c
where not exists(select 1 from LegalReal m where c.instrumentid = m.instrumentid and m.CreateDate > c.CreateDate)