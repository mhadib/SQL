CREATE view VBedehiBakhshKhosusi
as
with cte as(
select s.Keshvar, s.Gozashte/100.0 [نسبت بدهی خصوصی به تولید ناخالص داخلی ], s.Gozashte/100.0* t.GozashteMDollar [بدهی بخش خصوصی به ملیون دلار]
from VBedehiHayeKhosusiBeTolidNakhalesDakheli s
join VTolidNakhalesDakheli t on s.Keshvar = t.Keshvar),cte2 as(
select *,case when [بدهی بخش خصوصی به ملیون دلار] > 0 then [بدهی بخش خصوصی به ملیون دلار]/(select sum([بدهی بخش خصوصی به ملیون دلار]) from cte where [بدهی بخش خصوصی به ملیون دلار] > 0 ) else 0 end as NesbatAzKol from cte)
select *
,   cast(SUM(NesbatAzKol) OVER(ORDER BY NesbatAzKol desc) as decimal(4,2)) Tajamoi
from cte2
--order by s.Gozashte/100.0* t.GozashteMDollar desc