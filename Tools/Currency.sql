create view Currency as 
select Name,Rate CurrentRate, case when Name like N'%یورو%' then 1.185
when Name like N'%انگلیس%' then 1.745
when  Name like N'%استرالیا%' then 0.742
when  Name like N'%نیوزیلند%'then 0.694
when  Name like N'%ژاپن%'then 0.0084
when  Name like N'%چین%'then 0.123
when  Name like N'%سوئیس%'then 0.765
when  Name like N'%کانادا%'then 0.86
when  Name like N'%هند%'then 0.022
when  Name like N'%برزیل%'then 0.44
when  Name like N'%روسیه%' then 0.034
when  Name like N'%کره جنوبی%'then 0.00097
when  Name like N'%ترکیه%'then 0.739
when  Name like N'%سوئد%'then 0.125
when  Name like N'%سعودی%'then 0.266
end [2005]
from VtgjuCurrency
where (Name like N'%یورو%'
or Name like N'%انگلیس%'
or Name like N'%استرالیا%'
or Name like N'%نیوزیلند%'
or Name like N'%ژاپن%'
or Name like N'%چین%'
or Name like N'%سوئیس%'
or Name like N'%کانادا%'
or Name like N'%هند%'
or Name like N'%برزیل%'
or Name like N'%روسیه%' 
or Name like N'%کره جنوبی%'
or Name like N'%ترکیه%'
or Name like N'%سوئد%'
or Name like N'%سعودی%')
and left(Name,3) != N'usd'
