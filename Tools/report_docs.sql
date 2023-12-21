CREATE procedure [dbo].[report_docs]
as 
begin


--delete existing file
exec master.dbo.xp_cmdshell 'del E:\Moini\مستندات_و_سلامت_سیستم.xlsx;' 

--create new file from blank template
exec master.dbo.xp_cmdshell 'copy E:\Moini\template.xlsx E:\Moini\مستندات_و_سلامت_سیستم.xlsx' 

declare @sql nvarchar(max)
set @sql = 
N'insert into OPENROWSET(''Microsoft.ACE.OLEDB.12.0'', 
    ''Excel 12.0;Database=E:\Moini\مستندات_و_سلامت_سیستم.xlsx;'', 
    ''SELECT * FROM [Sheet1$]'') select cast([اولین توضیح] as nvarchar(250)),cast([توضیح دوم] as nvarchar(250)),cast([توضیح سوم] as nvarchar(250)),
	cast([توضیح چهارم] as nvarchar(250)),
	cast([توضیح پنجم] as nvarchar(250)),
	cast([توضیح ششم] as nvarchar(250)),
	cast([توضیح هفتم] as nvarchar(250)),
	cast([توضیح هشتم] as nvarchar(250)),
	cast([توضیح نهم] as nvarchar(250))
	
	
	,cast([به کجا ارسال میشود] as nvarchar(250)),ReportName, [365] 
	,[90] ,[30] ,[14] ,[7],[3] ,[180],cast([آخرین زمان بروز رسانی] as nvarchar(100)),cast(Mostanadat as nvarchar(250)), cast([کجا را میخواند] as nvarchar(250))
	, cast([کجا را میخواند دوم] as nvarchar(250)), cast([کاربرد] as nvarchar(250))
	from systemtest'
	print @sql
	exec (@sql)


end
