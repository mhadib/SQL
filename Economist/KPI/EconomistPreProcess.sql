


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[EconomistPreProcess]
   ON  [dbo].[StartTriger_Economist]
   AFTER INSERT
AS 
BEGIN
	truncate table VNaghdinegi
	insert into VNaghdinegi
	select *
	from VNaghdinegi_PreProcess

	truncate table VBedehiKhareji
	insert into VBedehiKhareji
	select * 
	from VBedehiKhareji_PreProcess

	truncate table VBourse
	insert into VBourse
	select * 
	from VBourse_preProcess

	truncate table VShakhesMaskan
	insert into VShakhesMaskan
	select * 
	from VShakhesMaskan_preprocess

	truncate table VBoursFrance
	insert into VBoursFrance
	select * 
	from VBoursFrance_preprocess
	
 
END
