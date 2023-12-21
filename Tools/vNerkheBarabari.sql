

CREATE view [dbo].[vNerkheBarabari] as
select distinct t.PName, t.Name,cast(t.Rate as decimal(20,7))  [نرخ برابری] ,cast(h.[نرخ برابری در سال 2005] as decimal(20, 7))[نرخ برابری در سال 2005],cast((rate - h.[نرخ برابری در سال 2005])/h.[نرخ برابری در سال 2005] as decimal(20,2))  * 100 [رشد نسبت به سال 2005]
from vtgjuCurrency t
left join NerkheBarabariHistory h on t.PName = substring(h.PName,1,3)
where t.DollarDevids = 0 
