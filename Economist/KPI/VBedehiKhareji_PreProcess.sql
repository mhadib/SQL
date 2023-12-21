




--select * from vbedehikhareji
create     view [dbo].[VBedehiKhareji_PreProcess]
as
with cte
as(
select s.Keshvar , s.Gozashte, dbo.RetreiveVahed(s.Vahed) Vahed, cast(dbo.TabdilNerkheArzToMDollar(s.Gozashte, DollarDevids, s.Vahed, tgju.rate) as decimal(20,0))
 GozashteMDollar, bt.Gozashte  [بدهی های خصوصی به تولید ناخالص داخلی],
 vb.GozashteMDollar [وام به بخش خصوصی به ملیون دلار],
 --vb.Tajamoi [تجمعی وام به بخش خصوصی],
 --vb.NesbatAzKol [نسبت از کل وام به بخش خصوصی], 
 nb.Gozashte [نرخ بهره بانکی], nv.Gozashte [نرخ وام بانکی], bk.Gozashte [بدهی خانواده به تولید ناخالص], bs.[نسبت بدهی شرکت ها به تولید ناخالص ملی], bs.[نسبت بدهی شرکت ها به تولید ناخالص ملی2005],
 case when s.Keshvar = N'ایران' then 1.8569
	 when s.Keshvar = N'ایالات متحده' then 1
else nba.[رشد نسبت به سال 2005] end [رشد نرخ برابری ارز نسبت به سال 2005]

from BedehiKhareji S
left join VBedehiHayeKhosusiBeTolidNakhalesDakheli bt on s.Keshvar = bt.Keshvar
left join vVaamBeBakhsheKhosusi vb on s.Keshvar = vb.Keshvar
left join VNerkheBahreBanki nb on s.Keshvar = nb.Keshvar
left join VNerkheVaamBanki nv on s.Keshvar = nv.Keshvar
left join VBedehiKhanevarBeTolidNakhales bk on s.Keshvar = bk.Keshvar 
left join vBedehiSherkatHaBeTolidNakhalesDakheli bs on s.Keshvar = bs.کشور
left join vtgjuCurrency tgju on (dbo.RetreiveVahed(s.Vahed) = substring(rtrim(ltrim(pName)),1,3))
left join NerkheBarabariHistory na on  na.pname like N'%'+s.Keshvar+'%'
left join vNerkheBarabari nba on nba.PName like N'%'+dbo.RetreiveVahed(substring(na.pname,1,3))+'%'
where not exists(select 1 from BedehiKhareji S2 where s.Keshvar = s2.Keshvar and s2.CreateDate > s.CreateDate)
and s.Keshvar in (select ['Keshvar'] from VKasriHesabeJari))
,cte2 as (
select Keshvar [کشور], Gozashte [بدهی خارجی], Vahed  [واحد بدهی خارجی], isnull(GozashteMDollar,Gozashte) [بدهی خارجی به ملیون دلار], [بدهی های خصوصی به تولید ناخالص داخلی], [وام به بخش خصوصی به ملیون دلار],
--[تجمعی وام به بخش خصوصی], 
--[نسبت از کل وام به بخش خصوصی], 
[نرخ بهره بانکی], [نرخ وام بانکی], [بدهی خانواده به تولید ناخالص], [نسبت بدهی شرکت ها به تولید ناخالص ملی], [نسبت بدهی شرکت ها به تولید ناخالص ملی2005], [رشد نرخ برابری ارز نسبت به سال 2005]
from cte
where Keshvar not like N'%مونت%' and Keshvar not like N'%منطقهیورو%'),
cte3 as(
select *,cast(case when [بدهی خارجی به ملیون دلار] > 0 then [بدهی خارجی به ملیون دلار]/(select sum([بدهی خارجی به ملیون دلار]) from cte2 where [بدهی خارجی به ملیون دلار] > 0 ) else 0 end as decimal(4,2)) as [نسبت از کل بدهی خارجی] from cte2)


select cte3.کشور, cte3.[واحد بدهی خارجی], cte3.[بدهی خارجی], cte3.[بدهی خارجی به ملیون دلار], cte3.[نسبت از کل بدهی خارجی]
,   cast(SUM([نسبت از کل بدهی خارجی]) OVER(ORDER BY [نسبت از کل بدهی خارجی] desc) as decimal(4,2)) [تجمعی بدهی خارجی], cte3.[بدهی های خصوصی به تولید ناخالص داخلی], [بدهی خانواده به تولید ناخالص],



[نسبت بدهی شرکت ها به تولید ناخالص ملی2005],

[نسبت بدهی شرکت ها به تولید ناخالص ملی]
,[رشد نرخ برابری ارز نسبت به سال 2005]
,
cast([نسبت بدهی شرکت ها به تولید ناخالص ملی2005] * (case when cte3.کشور = N'ایالات متحده' then 0 else
[رشد نرخ برابری ارز نسبت به سال 2005]/100 end + case when cte3.کشور= N'ایران' then 0 else 1 end) as decimal(10,2))
[رشد بدهی شرکت ها به تولید ناخالص ملی نسبت به سال 2005 با تعدیل برابری نرخ ارز],

cast([نسبت بدهی شرکت ها به تولید ناخالص ملی2005] * (
[رشد نرخ برابری ارز نسبت به سال 2005]/100 + case when cte3.کشور = N'ایران' then 0 else 1 end) 
 * 0.64 as decimal(10,2)) [رشد بدهی شرکت ها به تولید ناخالص ملی نسبت به سال 2005 با تعدیل برابری نرخ ارز و کسر تورم],
 cte3.[وام به بخش خصوصی به ملیون دلار], 
--cte3.[تجمعی وام به بخش خصوصی], 
--cte3.[نسبت از کل وام به بخش خصوصی], 
cte3.[نرخ وام بانکی], cte3.[نرخ بهره بانکی]
from cte3 
