

CREATE view [dbo].[vSaraffiBankMelliCurrency]
as 
with cte as (
select case when CurrencyId = 1 then N'دلار' end Currency, IsHavale, IsForush, Price,(select avg(cast(price as float)) from SaraffiBankMelliCurrency where CreateDate > DATEADD(day,-30,getdate()) and Price !='0' and IsHavale = 1) as [میانگین یک ماه گذشته برای حواله],
(select avg(cast(price as float)) from SaraffiBankMelliCurrency where CreateDate > DATEADD(day,-30,getdate()) and Price !='0' and IsHavale = 0) as [میانگین یک ماه گذشته برای غیر حواله]
from SaraffiBankMelliCurrency s
where not exists(select 1 from SaraffiBankMelliCurrency s2 where s.CurrencyId = s2.CurrencyId and s.IsHavale = s2.IsHavale and s.IsForush = s2.IsForush and s2.CreateDate > s.CreateDate and s.price != N'0')
and s.price != N'0')
select * ,(price - [میانگین یک ماه گذشته برای غیر حواله])/[میانگین یک ماه گذشته برای غیر حواله] [رشد قیمت دلار نسبت به میانگین یک ماه گذشته] from cte
