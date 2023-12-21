--select * from VVaziateArzi
--select * from vsharayetekar
--select * from VBedehiKhareji
--select * from vShakhesHayeMadar
--drop table vShakhesHayeMadar
--select * into vShakhesHayeMadar from ShakhesHayeMadar
CREATE view [dbo].[ShakhesHayeMadar]
as
with cte as (
select kh.['Keshvar'] Keshvar, gs.[گردش سرمایه به ملیون دلار], gs.[نسبت از کل] [نسبت از کل گردش سرمایه],   cast(SUM(gs.[نسبت از کل]) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [جمع تجمعی گردش سرمایه], gs.[نسبت از کل منفی] [نسبت از
 کل گردش سرمایه منفی], sgk.[سرمایه گذاری خارجی به ملیون دلار], sgk.[نسبت از کل] [نسبت از کل سرمایه گذاری خارجی],
cast(SUM(sgk.[نسبت از کل]) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [جمع تجمعی سرمایه گذاری خارجی], sgk.[نسبت از کل منفی] [نسبت از کل سرمایه گذاری خارجی منفی],mt.[گذشته به ملیون دلار] [موازنه تجاری به ملیون دلار], mt.[نسبت از کل] [نسبت از کل موازنه تجاری],
cast(SUM(mt.[نسبت از کل]) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [جمع تجمعی موازنه تجاری],

--n.[نقدینگی در نقطه موجود], n.['واحد'] [واحد نقدینگی], n.['2005'] [نقدینگی 2005], n.['2019'] [نقدینگی 2019], n.['رشد نقدینگی نسبت به 2005'] [رشد نقدینگی نسبت به 2005], n.['رشد نقدینگی نسبت به 2019'] [رشد نقدینگی نسبت به 2019],
--n.[نسبت از کل] [نقدینگی نسبت از کل],  cast(SUM(n.[نسبت از کل]) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [جمع تجمعی نقدینگی], n.[نقدینگی در سال 2005 به  ملیون انس طلا], n.[نقدینگی در نقطه موجود به ملیون انس طلا], 
--n.[رشد نقدینگی نسبت به سال 2005 به ملیون انس طلا], sm.Gozashte [شاخص مسکن در نقطه موجود], 

--sm.[2005] [شاخص مسکن در 2005], sm.[رشد نسبت به سال 2005] [رشد مسکن نسبت به سال 2005],
--sm.[شاخص مسکن در نقطه موجود به قیمت ثابت طلا در سال 2005], sm.[رشد شاخص مسکن در نقطه موجود نسبت به سال 2005 به قیمت ثابت طلا],

--bbk.[بدهی بخش خصوصی به ملیون دلار] [گذشته ملیون دلار بدهی بخش خصوصی],
--bbk.NesbatAzKol [نسبت از کل بدهی بخش خصوصی],
--cast(SUM(bbk.NesbatAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی بدهی بخش خصوصی],


-- bsbtn.[نسبت بدهی بخش خصوصی به تولید ناخالص داخلی], bsbtn.[نسبت بدهی خانواده به تولید ناخالص ], bsbtn.[نسبت بدهی شرکت ها به تولید ناخالص ملی], bsbtn.[نسبت بدهی بخش خصوصی به تولید ناخالص داخلی2005], bsbtn.[نسبت بدهی خانواده به تولید ناخالص 2005]
--, bsbtn.[نسبت بدهی شرکت ها به تولید ناخالص ملی2005]

--, vbk.GozashteMDollar [وام به بخش خصوصی به ملیون دلار]
--, vbk.NesbatAzKol [نسبت از کل وام به بخش خصوصی]
--, cast(SUM(vbk.NesbatAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [جمع تجمعی وام به بخش خصوصی],

--nbb.gozashte [نرخ بهره بانکی در نقطه موجود],nvb.gozashte [نرخ وام بانکی در نقطه موجود] 
--, bk.[بدهی خارجی به ملیون دلار] [بدهی خارجی ملیون دلار],  bk.[نسبت از کل بدهی خارجی] [نسبت از کل بدهی خارجی],  cast(SUM(bk.[نسبت از کل بدهی خارجی]) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [جمع تجمعی بدهی خارجی], 
 --m.[مالیات بر درآمد شخصی], m.[مالیات بر فروش], m.[مالیات شرکت ها], m.[میانه سنی جمعیت], 

 --nb.PName [نام ارز], nb.[نرخ برابری], nb.[نرخ برابری در سال 2005], nb.[رشد نسبت به سال 2005] [رشد نرخ برابری ارز نسبت به سال 2005],
 
-- za.GozashteMDollar [ذخایر ارزی به ملیون دلار], za.NesbatAzKol [نسبت از کل ذخایر ارزی], cast(SUM(za.NesbatAzKol) OVER(ORDER 
--BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2))[جمع تجمعی ذخایر ارزی],  

kh.['دوره'] [دوره], kh.['Name'] [نوع ارز], kh.['Rate'] [Rate],
kh.['گذشته به ملیون دلار'] [کسری حساب جاری به ملیون دلار], kh.NesbatAzKol [نسبت از کل کسری حساب جاری],  cast(SUM(kh.NesbatAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [جمع تجمعی کسری حساب جاری],
kh.NesbatAzKolManfi [نسبت از کل کسری حساب جاری منفی],kh.[2005], kh.[2010], kh.[2011], kh.[2012], kh.[2013], kh.[2014], kh.[2015], kh.[2016], kh.[2017], kh.[2018], kh.[2019], kh.[2020],kh.[جمع ردیف از 2005 تا 2020]

from VKasriHesabeJari kh 
--left join VAndazeAslTavarom at on  kh.['Keshvar'] = at.Keshvar
--left join VBedehiDolatBeTolidNakhales bdnm on bdnm.Keshvar =  kh.['keshvar']
--left join VBedehiKhanevarBeDaramad bkbd on bkbd.Keshvar =  kh.['keshvar']
--left join vBedehiSherkatHaBeTolidNakhalesDakheli bsbtn on bsbtn.[کشور] =  kh.['keshvar']
--left join VBedehiKhareji bk on bk.کشور =  kh.['keshvar']
--left join VBourse b on b.Name =  kh.['keshvar']
left join VGardeshSarmaye  gs on gs.[Keshvar] =  kh.['keshvar']
--left join VHadeAghalDastmozd had on had.Keshvar =  kh.['keshvar']
--left join VMaliatBarDaramadShakhsi mbds on mbds.Keshvar =  kh.['keshvar']
--left join VMaliatBarSherkatHa Mbs on mbs.Keshvar = kh.['keshvar']
--left join VNaghdinegi n on n.Keshvar = kh.['keshvar']
--left join VNerkheBahreBanki nbb on nbb.Keshvar = kh.['keshvar']
--left join VNerkheVaamBanki nvb on nvb.Keshvar = kh.['keshvar']
--left join VPasandazShakhsi ps on ps.Keshvar = kh.['keshvar']
left join VSarmayeGozariKhareji sgk on sgk.Keshvar = kh.['keshvar']
--left join VTolidKhodro tk on tk.Keshvar = kh.['keshvar']
--left join VTolidNaftKhaam tnk on tnk.Keshvar = kh.['keshvar']
--left join vVaamBeBakhsheKhosusi vbk on vbk.Keshvar = kh.['keshvar']
--left join VZakhayerArzi za on za.Keshvar = kh.['keshvar']
--left join VZakhayerTala zt on zt.Keshvar = kh.['keshvar']
--left join VShakhesMaskan sm on sm.Keshvar = kh.['keshvar']
--left join VTolidNakhalesDakheli tnm on tnm.Keshvar = kh.['Keshvar']
left join VMovazeneTejari mt on mt.Keshvar = kh.['keshvar']
--left join VBedehiBakhshKhosusi bbk on bbk.Keshvar = kh.['keshvar']
--left join vMaliatHa m on m.Keshvar = kh.['keshvar']
--left join vNerkheBarabari nb on nb.PName like N'%'+kh.['keshvar']+'%'

)
select * froM cte
where keshvar is not null



