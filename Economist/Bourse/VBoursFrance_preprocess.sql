



    create   view  [dbo].[VBoursFrance_preprocess]    as 
	  select * 
  from VBoursFrance_Denormal
  where [سود خالص] is not null
