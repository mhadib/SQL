





CREATE view [dbo].[VKasriHesabeJari]
  as 
  with cte as (
  select ['Keshvar'] , [2005], [2010] ,[2011] ,[2012] ,[2013] ,[2014] ,[2015] ,[2016] ,[2017] ,[2018] ,[2019] ,[2020] ,([2005]+ [2010] +[2011] +[2012] +[2013] +[2014] +[2015] +[2016] +[2017] +[2018] +[2019] +[2020]) [جمع ردیف از 2005 تا 2020] ,['دوره'] ,['گذشته'] ,['مرجع'] ,['واحد'] ,['Name'],['Rate'],dbo.RetreiveVahed(k.['واحد']) Vahed,
  cast(
  case when rtrim(ltrim(['دوره'])) = N'سه ماهه'  then 1.0 /3 
                         when rtrim(ltrim(['دوره'])) = N'دوازده ماهه'  then 1.0 /12 
						 else 1 end *
  
dbo.TabdilNerkheArzToMDollar(k.['گذشته'], DollarDevids, k.['واحد'], rate) as decimal(20,0)) ['گذشته به ملیون دلار']
--,k.['گذشته'], DollarDevids, k.['واحد'], rate

from KasriHesabeJari k
left join vtgjuCurrency tgju on (dbo.RetreiveVahed(k.['واحد']) = substring(rtrim(ltrim(pName)),1,3))
where not exists(select 1 from KasriHesabeJari k2 where k.['Keshvar'] = k2.['Keshvar'] and k2.CreateDate > k.CreateDate)
  and ['Keshvar'] not like N'%بوقلمون%' and ['Keshvar'] not like N'%لبنان%'
  ),
cte2 as(
  select *,cast(case when ['گذشته به ملیون دلار'] > 0 then cast(['گذشته به ملیون دلار'] as float)/(select sum(['گذشته به ملیون دلار']) from cte where ['گذشته به ملیون دلار'] > 0 ) else 0 end as decimal(4,2)) as NesbatAzKol,
  cast(case when ['گذشته به ملیون دلار'] < 0 then abs(cast(['گذشته به ملیون دلار'] as float))/(select sum(['گذشته به ملیون دلار']) from cte where ['گذشته به ملیون دلار'] < 0 ) else 0 end as decimal(4,2)) as NesbatAzKolManfi from cte)

select *, cast(SUM(NesbatAzKol) OVER(ORDER BY NesbatAzKol desc) as decimal(4,2)) Tajamoi
from cte2 
