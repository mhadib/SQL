
--select * from VShakhesMaskan_denormal order by [رشد شاخص مسکن نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم] desc
create     view [dbo].[VShakhesMaskan_preprocess]
as
select * 
from VShakhesMaskan_Denormal
where [رشد شاخص مسکن نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم] < 200
