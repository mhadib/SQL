
CREATE procedure [archive].[archiveOldTables]
as
begin 

declare @dateString nvarchar(100)
select @dateString = replace(replace(replace(replace(convert(varchar, getdate(),121),'-',''),N':',N''),N' ',N''),N'.',N'')
declare @tableName nvarchar(max) 
declare @count int
declare @getRowCountCmd nvarchar(max)
declare @archiveCmd nvarchar(max) 
declare @deleteCmd nvarchar(max)
declare @dateColumnName nvarchar(100) = N'CreateDate'
DECLARE db_cursor CURSOR FOR 
SELECT distinct t.name 
from sys.dm_db_index_usage_stats us
       JOIN sys.tables t
         ON t.object_id = us.object_id
WHERE  database_id = db_id()
and t.name in (select name from NeedsToArchive )

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @tableName  

WHILE @@FETCH_STATUS = 0  
BEGIN  
	set xact_abort on 
	begin tran
		print(@tableName)
		if(@tableName = N'tgjuCurrency')
			set @dateColumnName = N'CurrentDate'
		else set @dateColumnName = N'CreateDate'
		
		
		select @getRowCountCmd = N'select @count = count(1) from '+ @tableName
		EXECUTE sp_executesql @getRowCountCmd, N'@count int out',@count out
		if(@count > 5000)
		begin 
			select @archiveCmd= N'select * into archive.' + @tableName + N'_' + @dateString + N' from ' + @tableName + N' where '+@dateColumnName+' < dateadd(Day,-7,getdate()) '
			exec(@archiveCmd)
			select @deleteCmd = N'delete '+ @tableName + N' where '+@dateColumnName+' < dateadd(Day,-7,getdate()) '
			exec(@deleteCmd)
		end
	commit tran

    FETCH NEXT FROM db_cursor INTO @tableName 
END 

CLOSE db_cursor  
DEALLOCATE db_cursor 

insert into archive.YTMFaraBourse20231119070358
select *
from YTMFaraBourse yt
where exists(select 1 from YTMFaraBourse y where yt.SymboleFa = y.SymboleFa and y.CreateDate > yt.CreateDate)
OR ytm = N'سررسید شده'

DELETE YTMFaraBourse
FROM YTMFaraBourse YT
where exists(select 1 from YTMFaraBourse y where yt.SymboleFa = y.SymboleFa and y.CreateDate > yt.CreateDate)
OR ytm = N'سررسید شده'

end

--select * from AndazeAslTavarom