
CREATE View [dbo].[vMaliatHa]
as
select f.Keshvar, f.Gozashte [مالیات بر فروش], s.Gozashte [مالیات شرکت ها], d.Gozashte [مالیات بر درآمد شخصی], m.[میانه سنی جمعیت] [میانه سنی جمعیت]
from vMaliatBarForoush f
left join VMaliatBarSherkatHa s on f.Keshvar = s.Keshvar
left join vMaliatBarDaramadShakhsi d on f.Keshvar = d.Keshvar
left join MaliatHaHistory m on f.Keshvar = m.keshvar
