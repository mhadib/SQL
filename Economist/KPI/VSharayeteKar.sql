
CREATE view [dbo].[VSharayeteKar]
as
select mbds.Keshvar [کشور], hd.[حداقل دستمزد در ماه به دلار], mbds.Gozashte [مالیات بر درامد شخصی], 
mbf.Gozashte [مالیات بر فروش], mbs.Gozashte [مالیات بر شرکت ها], ps.Gozashte [پس انداز شخصی], mh.[میانه سنی جمعیت]
from VMaliatBarDaramadShakhsi mbds
left join VMaliatBarForoush mbf on mbds.Keshvar = mbf.Keshvar
left join VMaliatBarSherkatHa mbs on mbds.Keshvar = mbs.Keshvar
left join VPasandazShakhsi ps on mbds.Keshvar = ps.Keshvar
left join MaliatHaHistory mh on mbds.Keshvar = mh.Keshvar
left join VHadeAghalDastmozd hd on mbds.Keshvar = hd.Keshvar
