

CREATE view [dbo].[VExecutionTime] as 

with s as (
select 
creation_time,
last_execution_time,
execution_count,
--total_worker_time/1000 as CPU,
--convert(float, (total_worker_time))/(execution_count*1000)as [AvgCPUTime],
qs.last_elapsed_time/1000000 as Duration,
convert(float, (qs.total_elapsed_time))/(execution_count*1000)as [AvgDur],
--total_logical_reads as [Reads],
--total_logical_writes as [Writes],
--total_logical_reads+total_logical_writes as [AggIO],
--convert(float, (total_logical_reads+total_logical_writes)/(execution_count + 0.0)) as [AvgIO],
[sql_handle],
plan_handle,
statement_start_offset,
statement_end_offset,
--plan_generation_num,
--total_physical_reads,
--convert(float, total_physical_reads/(execution_count + 0.0)) as [AvgIOPhysicalReads],
--convert(float, total_logical_reads/(execution_count + 0.0)) as [AvgIOLogicalReads],
--convert(float, total_logical_writes/(execution_count + 0.0)) as [AvgIOLogicalWrites],
--query_hash,
--query_plan_hash,
total_rows
--convert(float, total_rows/(execution_count + 0.0)) as [AvgRows],
--total_dop,
--convert(float, total_dop/(execution_count + 0.0)) as [AvgDop],
--total_grant_kb,
--convert(float, total_grant_kb/(execution_count + 0.0)) as [AvgGrantKb],
--total_used_grant_kb,
--convert(float, total_used_grant_kb/(execution_count + 0.0)) as [AvgUsedGrantKb],
--total_ideal_grant_kb,
--convert(float, total_ideal_grant_kb/(execution_count + 0.0)) as [AvgIdealGrantKb],
--total_reserved_threads,
--convert(float, total_reserved_threads/(execution_count + 0.0)) as [AvgReservedThreads],
--total_used_threads,
--convert(float, total_used_threads/(execution_count + 0.0)) as [AvgUsedThreads]

from sys.dm_exec_query_stats as qs with(readuncommitted)
--order by convert(float, (qs.total_elapsed_time))/(execution_count*1000) desc
--where cast(creation_time as date) = cast(DATEADD(day, 0, getdate()) as date)
)
select
s.creation_time,
s.last_execution_time,
s.execution_count,
--s.CPU,
--s.[AvgCPUTime],
s.Duration,
s.[AvgDur],
--s.[AvgIOLogicalReads],
--s.[AvgIOLogicalWrites],
--s.[AggIO],
--s.[AvgIO],
--s.[AvgIOPhysicalReads],
--s.plan_generation_num,
--s.[AvgRows],
--s.[AvgDop],
--s.[AvgGrantKb],
--s.[AvgUsedGrantKb],
--s.[AvgIdealGrantKb],
--s.[AvgReservedThreads],
--s.[AvgUsedThreads],
--st.text as query_text,
case
when sql_handle IS NULL then ' '
else(substring(st.text,(s.statement_start_offset+2)/2,(
case
when s.statement_end_offset =-1 then len(convert(nvarchar(MAX),st.text))*2      
else s.statement_end_offset    
end - s.statement_start_offset)/2  ))
end as query_text
--db_name(st.dbid) as database_name,
--object_schema_name(st.objectid, st.dbid)+'.'+object_name(st.objectid, st.dbid) as [object_name],
--sp.[query_plan],
--s.[sql_handle]
--s.plan_handle,
--s.query_hash,
--s.query_plan_hash
, l.loginName
from s
cross apply sys.dm_exec_sql_text(s.[sql_handle]) as st
CROSS APPLY sys.dm_exec_plan_attributes(s.plan_handle) pa
   JOIN sys.sysusers u ON pa.value = u.uid
   JOIN syslogins l ON u.sid = l.sid
--cross apply sys.dm_exec_query_plan(s.[plan_handle]) as sp

