/*
use Admin
go
*/
CREATE procedure [dbo].[trc_Template] @Folder nvarchar(200)
as
/*
Start a 60 minute profiler trace storing the captured output in
provider folder.
The folder must exist. A subfolder will be created using the start date
and time to allow for repeated running of this profile without
replacing the
previuos captured trace files.
On SQL Server 2005, XP_CMDSHELL needs to be enable to create the
subfolder. You
might want to disable it when you are done running your scheduled
trace.
Sample Command: exec trc_Template @Folder =
'C:\Output\ProfilerTrace\Template'
*/
set nocount on


declare @Id int
DECLARE db_cursor CURSOR FOR 
select distinct TraceId
from fn_trace_getinfo(null)
where traceid != 1

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @Id  

WHILE @@FETCH_STATUS = 0  
BEGIN  
	  EXEC sp_trace_setstatus @traceid = @Id, @status = 0
	  EXEC sp_trace_setstatus @traceid = @Id, @status = 2
      FETCH NEXT FROM db_cursor INTO @Id 
END 

CLOSE db_cursor  
DEALLOCATE db_cursor

-- To change the traces duration, modify the following statement
declare @StopTime datetime ; set @StopTime = dateadd(mi,60,getdate())
declare @StartDatetime varchar(13) ; set @StartDatetime =
convert(char(8),getdate(),112) + '_' +
cast(replace(convert(varchar(5),getdate(),108),':','') as char(4)) --['YYYYMMDD_HHMM']
declare @rc int
declare @TraceID int
declare @TraceFile nvarchar(100)
declare @MaxFileSize bigint ; set @MaxFileSize = 200 -- The maximum trace file in megabytes
declare @cmd nvarchar(2000)
declare @msg nvarchar(200)
If right(@Folder,1)<>'\' set @Folder = @Folder + '\'
-- Check if Folder exists
set @cmd = 'dir ' +@Folder
exec @rc = master..xp_cmdshell @cmd,no_output
if (@rc != 0) begin set @msg = 'The specified folder ' + @Folder + '
does not exist, Please specify an existing drive:\folder '+ cast(@rc as
varchar(10)) raiserror(@msg,10,1) return(-1)
end
--Create new trace file folder
set @cmd = 'mkdir ' +@Folder+@StartDatetime
exec @rc = master..xp_cmdshell @cmd,no_output
if (@rc != 0) begin set @msg = 'Error creating trace folder : ' +
cast(@rc as varchar(10)) set @msg = @msg + 'SQL Server 2005 or later
instance require OLE Automation to been enabled' raiserror(@msg,10,1)
return(-1)
end
set @TraceFile = @Folder+@StartDatetime+'\profile'
exec @rc = sp_trace_create @TraceID output, 2, @TraceFile,
@MaxFileSize, null
if (@rc != 0) begin set @msg = 'Error creating trace : ' + cast(@rc as
varchar(10)) raiserror(@msg,10,1) return(-1)
end
--> Using your saved trace file, add the '-- Set the events' section below <-- 

-- Set the events
declare @on bit
set @on = 1
exec sp_trace_setevent @TraceID, 33, 1, @on
exec sp_trace_setevent @TraceID, 33, 9, @on
exec sp_trace_setevent @TraceID, 33, 3, @on
exec sp_trace_setevent @TraceID, 33, 11, @on
exec sp_trace_setevent @TraceID, 33, 4, @on
exec sp_trace_setevent @TraceID, 33, 6, @on
exec sp_trace_setevent @TraceID, 33, 7, @on
exec sp_trace_setevent @TraceID, 33, 8, @on
exec sp_trace_setevent @TraceID, 33, 10, @on
exec sp_trace_setevent @TraceID, 33, 12, @on
exec sp_trace_setevent @TraceID, 33, 14, @on
exec sp_trace_setevent @TraceID, 33, 20, @on
exec sp_trace_setevent @TraceID, 33, 26, @on
exec sp_trace_setevent @TraceID, 33, 30, @on
exec sp_trace_setevent @TraceID, 33, 31, @on
exec sp_trace_setevent @TraceID, 33, 35, @on
exec sp_trace_setevent @TraceID, 33, 41, @on
exec sp_trace_setevent @TraceID, 33, 49, @on
exec sp_trace_setevent @TraceID, 33, 50, @on
exec sp_trace_setevent @TraceID, 33, 51, @on
exec sp_trace_setevent @TraceID, 33, 60, @on
exec sp_trace_setevent @TraceID, 33, 64, @on
exec sp_trace_setevent @TraceID, 33, 66, @on
exec sp_trace_setevent @TraceID, 10, 1, @on
exec sp_trace_setevent @TraceID, 10, 9, @on
exec sp_trace_setevent @TraceID, 10, 2, @on
exec sp_trace_setevent @TraceID, 10, 66, @on
exec sp_trace_setevent @TraceID, 10, 10, @on
exec sp_trace_setevent @TraceID, 10, 3, @on
exec sp_trace_setevent @TraceID, 10, 4, @on
exec sp_trace_setevent @TraceID, 10, 6, @on
exec sp_trace_setevent @TraceID, 10, 7, @on
exec sp_trace_setevent @TraceID, 10, 8, @on
exec sp_trace_setevent @TraceID, 10, 11, @on
exec sp_trace_setevent @TraceID, 10, 12, @on
exec sp_trace_setevent @TraceID, 10, 13, @on
exec sp_trace_setevent @TraceID, 10, 14, @on
exec sp_trace_setevent @TraceID, 10, 15, @on
exec sp_trace_setevent @TraceID, 10, 16, @on
exec sp_trace_setevent @TraceID, 10, 17, @on
exec sp_trace_setevent @TraceID, 10, 18, @on
exec sp_trace_setevent @TraceID, 10, 25, @on
exec sp_trace_setevent @TraceID, 10, 26, @on
exec sp_trace_setevent @TraceID, 10, 31, @on
exec sp_trace_setevent @TraceID, 10, 34, @on
exec sp_trace_setevent @TraceID, 10, 35, @on
exec sp_trace_setevent @TraceID, 10, 41, @on
exec sp_trace_setevent @TraceID, 10, 48, @on
exec sp_trace_setevent @TraceID, 10, 49, @on
exec sp_trace_setevent @TraceID, 10, 50, @on
exec sp_trace_setevent @TraceID, 10, 51, @on
exec sp_trace_setevent @TraceID, 10, 60, @on
exec sp_trace_setevent @TraceID, 10, 64, @on
exec sp_trace_setevent @TraceID, 12, 1, @on
exec sp_trace_setevent @TraceID, 12, 9, @on
exec sp_trace_setevent @TraceID, 12, 3, @on
exec sp_trace_setevent @TraceID, 12, 11, @on
exec sp_trace_setevent @TraceID, 12, 4, @on
exec sp_trace_setevent @TraceID, 12, 6, @on
exec sp_trace_setevent @TraceID, 12, 7, @on
exec sp_trace_setevent @TraceID, 12, 8, @on
exec sp_trace_setevent @TraceID, 12, 10, @on
exec sp_trace_setevent @TraceID, 12, 12, @on
exec sp_trace_setevent @TraceID, 12, 13, @on
exec sp_trace_setevent @TraceID, 12, 14, @on
exec sp_trace_setevent @TraceID, 12, 15, @on
exec sp_trace_setevent @TraceID, 12, 16, @on
exec sp_trace_setevent @TraceID, 12, 17, @on
exec sp_trace_setevent @TraceID, 12, 18, @on
exec sp_trace_setevent @TraceID, 12, 26, @on
exec sp_trace_setevent @TraceID, 12, 31, @on
exec sp_trace_setevent @TraceID, 12, 35, @on
exec sp_trace_setevent @TraceID, 12, 41, @on
exec sp_trace_setevent @TraceID, 12, 48, @on
exec sp_trace_setevent @TraceID, 12, 49, @on
exec sp_trace_setevent @TraceID, 12, 50, @on
exec sp_trace_setevent @TraceID, 12, 51, @on
exec sp_trace_setevent @TraceID, 12, 60, @on
exec sp_trace_setevent @TraceID, 12, 64, @on
exec sp_trace_setevent @TraceID, 12, 66, @on
exec sp_trace_setevent @TraceID, 13, 1, @on
exec sp_trace_setevent @TraceID, 13, 9, @on
exec sp_trace_setevent @TraceID, 13, 3, @on
exec sp_trace_setevent @TraceID, 13, 11, @on
exec sp_trace_setevent @TraceID, 13, 4, @on
exec sp_trace_setevent @TraceID, 13, 6, @on
exec sp_trace_setevent @TraceID, 13, 7, @on
exec sp_trace_setevent @TraceID, 13, 8, @on
exec sp_trace_setevent @TraceID, 13, 10, @on
exec sp_trace_setevent @TraceID, 13, 12, @on
exec sp_trace_setevent @TraceID, 13, 14, @on
exec sp_trace_setevent @TraceID, 13, 26, @on
exec sp_trace_setevent @TraceID, 13, 35, @on
exec sp_trace_setevent @TraceID, 13, 41, @on
exec sp_trace_setevent @TraceID, 13, 49, @on
exec sp_trace_setevent @TraceID, 13, 50, @on
exec sp_trace_setevent @TraceID, 13, 51, @on
exec sp_trace_setevent @TraceID, 13, 60, @on
exec sp_trace_setevent @TraceID, 13, 64, @on
exec sp_trace_setevent @TraceID, 13, 66, @on


-- Set the Filters
declare @intfilter int
declare @bigintfilter bigint

exec sp_trace_setfilter @TraceID, 10, 0, 7, N'%SQL Server Profiler%'
-- Set the trace status to start
exec sp_trace_setstatus @TraceID, 1


--exec sp_trace_setfilter @TraceID, 11, 0, 6, N'%jannejad%'
--exec sp_trace_setfilter @TraceID, 11, 1, 6, N'%Admin%'

--> Using your saved trace file, add the '-- Set the Filters' section below <-- 
--> Customization is now completed <--
-----------------------------------------------------------------------------
-- This filter is added to exclude all profiler traces.
--exec sp_trace_setfilter @TraceID, 1, 0, 7, N'%sp_datatype%'
--exec sp_trace_setfilter @TraceID, 1, 0, 7, N'%sp_unprepare%'
--exec sp_trace_setfilter @TraceID, 10, 0, 6, N'%Excel%'
--exec sp_trace_setfilter @TraceID, 10, 1, 6, N'%Python%'
--exec sp_trace_setfilter @TraceID, 10, 0, 7, N'SQL Profiler%'
-- Set the trace status to start
exec sp_trace_setstatus @TraceID, 1 -- start trace
select 'Trace id = ', @TraceID, 'Path=', @Folder+@StartDatetime+'\'
select 'To Stop this trace sooner, execute these two commands'
select ' EXEC sp_trace_setstatus @traceid = ' , @TraceID , ', @status = 0; -- Stop/pause Trace'
select ' EXEC sp_trace_setstatus @traceid = ' , @TraceID , ', @status = 2; -- Close trace and delete it from the server'
return
