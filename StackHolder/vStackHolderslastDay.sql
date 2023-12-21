



CREATE     view [dbo].[vStackHolderslastDay]

as
(
select [سهامدار],[اسم شرکت]
--,[تعداد سهم],[میزان تغییر],[ChangeDateFa],[nameFA],[symbolFA],[FinalPrice]
,sum([ارزش معامله]) [ارزش معامله در آخرین روز کاری]
from dbo.vStackHoldersPre
where cast(ChangeDateEnPersist as date) = (select top 1 cast(ChangeDateEnPersist as date)from dbo.vStackHolders order by ChangeDateEnPersist desc)
group by [سهامدار],[اسم شرکت]

)
