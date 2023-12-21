CREATE View VSoodSherkatHa
as 
select s.*, cast(tgju.rate as decimal(9,4)) [نرخ برابری], 
cast(dbo.TabdilNerkheArzToMDollar(s.Gozashte, DollarDevids, s.Vahed, rate) as decimal(30,0)) [گذشته به ملیون دلار]
--select * 
from SoodSherkatHa s
--left join NerkheBarabariHistory nah on  nah.pname like N'%'+s.Keshvar+'%'
--left join vNerkheBarabari nb on nb.PName like N'%'+dbo.RetreiveVahed(substring(nah.pname,1,3))+'%'
left join vtgjuCurrency tgju on (substring(rtrim(ltrim(s.Vahed)),1,3)  = substring(rtrim(ltrim(tgju.pName)),1,3)) 

where not exists(select 1 from SoodSherkatHa s2 where s.keshvar = s2.Keshvar and s2.createdate > s.createdate) 

