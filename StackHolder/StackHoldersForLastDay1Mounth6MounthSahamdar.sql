
Create View [dbo].[StackHoldersForLastDay1Mounth6MounthSahamdar]
as
 select [سهامدار], sum([ارزش معامله در شش ماه])[ارزش معامله در شش ماه], sum([ارزش معامله در یک ماه])[ارزش معامله در یک ماه], 
sum([ارزش معامله در آخرین روز کاری])[ارزش معامله در آخرین روز کاری] 
from StackHoldersForLastDay1Mounth6Mounth with(nolock) 
group by [سهامدار]--order by sum([ارزش معامله در یک ماه]) desc
