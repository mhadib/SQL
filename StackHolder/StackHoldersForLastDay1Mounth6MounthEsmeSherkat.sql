Create view [dbo].[StackHoldersForLastDay1Mounth6MounthEsmeSherkat]
as
select [اسم شرکت], sum([ارزش معامله در شش ماه])[ارزش معامله در شش ماه], sum([ارزش معامله در یک ماه])[ارزش معامله در یک ماه], 
sum([ارزش معامله در آخرین روز کاری])[ارزش معامله در آخرین روز کاری] 
from StackHoldersForLastDay1Mounth6Mounth with(nolock)
group by [اسم شرکت] --order by sum([ارزش معامله در یک ماه]) desc
