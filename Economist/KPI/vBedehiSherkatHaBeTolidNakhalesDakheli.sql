

CREATE view [dbo].[vBedehiSherkatHaBeTolidNakhalesDakheli]
as
select ISNULL(S.Keshvar, K.KESHVAR) [کشور], S.Gozashte [نسبت بدهی بخش خصوصی به تولید ناخالص داخلی], K.Gozashte [نسبت بدهی خانواده به تولید ناخالص ],S.Gozashte - K.Gozashte [نسبت بدهی شرکت ها به تولید ناخالص ملی] ,
h.[نسبت بدهی بخش خصوصی به تولید ناخالص داخلی2005], h.[نسبت بدهی خانواده به تولید ناخالص 2005], 
h.[نسبت بدهی بخش خصوصی به تولید ناخالص داخلی2005]- h.[نسبت بدهی خانواده به تولید ناخالص 2005]
[نسبت بدهی شرکت ها به تولید ناخالص ملی2005]
from vBedehiHayeKhosusiBeTolidNakhalesDakheli S 
FULL join vBedehiKhanevarBeTolidNakhales  K ON S.Keshvar = K.Keshvar 
left join BedehiSherkatHaBeTolidNaKhalesMeliHistory h on ISNULL(S.Keshvar, K.KESHVAR) = h.کشور
