


CREATE view [dbo].[vStackHoldersForLastDay1Mounth6Mounth]

as
select sxm.[سهامدار]
,sxm.[اسم شرکت]
,sxm.[ارزش معامله در شش ماه]
,isnull(om.[ارزش معامله در یک ماه],0) [ارزش معامله در یک ماه], isnull(lsd.[ارزش معامله در آخرین روز کاری] ,0)[ارزش معامله در آخرین روز کاری] 
--this is grouped by [سهامدار],[اسم شرکت]
from dbo.VAggregateStackholdersForCompany sxm 
full join dbo.vStackHolderslastDay lsd on lsd.سهامدار = sxm.سهامدار and lsd.[اسم شرکت] = sxm.[اسم شرکت]
full join dbo.VAggregateStackholders om on sxm.سهامدار = om.سهامدار and om.[اسم شرکت] = sxm.[اسم شرکت]
where sxm.[ارزش معامله در شش ماه] != 0 
and [ارزش معامله در یک ماه] != 0
