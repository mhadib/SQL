-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create TRIGGER [dbo].[TUpdateStackHoldersChangeDateEnPersist]
   ON  [dbo].[StackHolders]
   AFTER INSERT
AS 
BEGIN
update StackHolders
Set ChangeDateEnPersist = ChangeDateEn
where ChangeDateEnPersist is null
end
