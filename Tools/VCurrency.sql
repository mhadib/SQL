CREATE view VCurrency
as
select *,(CurrentRate - [2005])/[2005] [رشد نسبت به سال 2005] 
from Currency
