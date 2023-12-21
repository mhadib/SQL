create view v_JobStatus
as 
SELECT 
	j.name AS JobName
	,CONVERT(VARCHAR,DATEADD(S,(run_time/10000)*60*60 /* hours */  
          +((run_time - (run_time/10000) * 10000)/100) * 60 /* mins */  
          + (run_time - (run_time/100) * 100)  /* secs */
           ,CONVERT(DATETIME,RTRIM(run_date),113)),100) AS RunTimeStamp
	--,CASE 
	--	WHEN j.enabled = 1 THEN 'Enabled'  
	--	ELSE 'Disabled'  
	--END JobStatus
	,CASE 
		WHEN jh.run_status = 0 THEN 'Failed'
		WHEN jh.run_status = 1 THEN 'Succeeded'
		WHEN jh.run_status = 2 THEN 'Retry'
		WHEN jh.run_status = 3 THEN 'Cancelled'
		ELSE 'Unknown'  
	END JobRunStatus
FROM msdb.dbo.sysjobs j
OUTER APPLY(
	SELECT TOP 1 * 
	FROM msdb.dbo.sysjobhistory jh
	WHERE jh.job_id = j.job_id AND jh.step_id = 0 
	order by jh.instance_id DESC) jh
where j.name like 'SchaduledJobs' or j.name like N'maint.Subplan_1'
--ORDER BY j.name, jh.run_date, jh.run_time 
 