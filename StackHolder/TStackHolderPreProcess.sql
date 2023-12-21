-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TStackHolderPreProcess]
   ON  [dbo].[StackHoldersTriger]
   AFTER INSERT
AS 
BEGIN
DROP TABLE IF EXISTS [dbo].[vStackHolders]
select * 
into [dbo].[vStackHolders]
from [dbo].[vStackHoldersPre]
order by 1 desc

truncate table StackHoldersForLastDay1Mounth6Mounth
insert into StackHoldersForLastDay1Mounth6Mounth
select * from vStackHoldersForLastDay1Mounth6Mounth

END
