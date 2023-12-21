Create view vTestChartayi
as
select 
  MAX(WorkDayCountIn365CalenderDays) AS [365]
, MAX(WorkDayCountIn90CalenderDays ) AS [90]
, MAX(WorkDayCountIn30CalenderDays ) AS [30]
, MAX(WorkDayCountIn14CalenderDays ) AS [14]
, MAX(WorkDayCountIn7CalenderDays  ) AS [7]
, MAX(WorkDayCountIn3CalenderDays  ) AS [3]
, MAX(WorkDayCountIn180CalenderDays) AS [180]
from WorkDayCountInCalenderDays
