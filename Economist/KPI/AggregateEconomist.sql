


CREATE view [dbo].[AggregateEconomist]
as
with cte as (
select kh.['Keshvar'] Keshvar,
gs.[گردش سرمایه در نقطه موجود] , gs.[گردش سرمایه به ملیون دلار], gs.واحد [واحد گردش سرمایه], gs.[نسبت از کل] [نسبت از کل گردش سرمایه],   cast(SUM(gs.[نسبت از کل]) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی گردش سرمایه], sgk.[واحد] [واحد سرمایه گذاری خارجی], sgk.[سرمایه گذاری خارجی به ملیون دلار], sgk.[نسبت از کل] [نسبت از کل سرمایه گذاری خارجی],
cast(SUM(sgk.[نسبت از کل]) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی سرمایه گذاری خارجی],mt.[واحد] [واحد موازنه تجاری], mt.[گذشته به ملیون دلار] [موازنه تجاری به ملیون دلار], mt.[نسبت از کل] [نسبت از کل موازنه تجاری],
cast(SUM(mt.[نسبت از کل]) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی موازنه تجاری],

bbk.[بدهی بخش خصوصی به ملیون دلار] [گذشته ملیون دلار بدهی بخش خصوصی], bbk.NesbatAzKol [نسبت از کل بدهی بخش خصوصی],
cast(SUM(bbk.NesbatAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی بدهی بخش خصوصی],

sm.Gozashte [گذشته شاخص مسکن], at.Gozashte [گذشته اصل تورم],
 bm.[تراز بانک مرکزی به ملیون دلار], bm.Vahed [واحد بانک مرکزی], bm.[نسبت از کل] [نسبت از کل بانک مرکزی],
cast(SUM(bm.[نسبت از کل]) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی بانک مرکزی],
bdnm.Gozashte [گذشته بدهی دولت به تولید ناخالص], bkbd.Gozashte [بدهی خانواده به درآمد], bkbtn.Gozashte [بدهی خانواده به تولید ناخالص], bk.Gozashte [بدهی خارجی گذشته], bk.GozashteMDollar[بدهی خارجی ملیون دلار],  bk.Vahed [بدهی خارجی واحد], bk.NesbatAzKol [نسبت از کل بدهی خارجی],  cast(SUM(bk.NesbatAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی بدهی خارجی], b.[index] [شاخص بورس], b.[2005] [شاخص بورس 2005], b.[2019] [شاخص بورس 2019], b.[رشد نسبت به 2005] [رشد شاخص بورس نسبت به 2005], b.[رشد نسبت به 2019] [رشد شاخص بورس نسبت به 2019], had.Gozashte [گذشته حداقل دستمزد], had.[حداقل دستمزد در ماه به دلار], had.Vahed [واحد حداقل دستمزد], mbds.Gozashte [گذشته مالیات بر درآمد شخصی], Mbs.gozashte [گذشته مالیات بر شرکت ها],
n.[نقدینگی در نقطه موجود] , n.['واحد'] [واحد نقدینگی], n.['2005'] [نقدینگی 2005], n.['2019'] [نقدینگی 2019], n.['رشد نقدینگی نسبت به 2005'] [رشد نقدینگی نسبت به 2005], n.['رشد نقدینگی نسبت به 2019'] [رشد نقدینگی نسبت به 2019], n.[نسبت از کل] [نقدینگی نسبت از کل],  cast(SUM(n.[نسبت از کل]) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [نقدینگی تجمعی],nbb.gozashte [گذشته نرخ بهره بانکی],nvb.gozashte [گذشته نرخ وام بانکی] ,ps.gozashte [گذشته پس انداز شخصی],
tk.Gozashte [گذشته تولید خودرو], tk.Vahed [واحد تولید خودرو], tk.DarsadAzKol [درصد از کل تولید خودرو], cast(SUM(tk.DarsadAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی تولید خودرو], tnk.Gozashte [گذشته تولید نفت خارجی], tnk.DarsadAzKol [نسبت از کل تولید نفت خارجی], cast(SUM(tnk.DarsadAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی تولید نفت خام], vbk.Vahed [واحد وام به بخش خصوصی], vbk.GozashteMDollar [گذشته به ملیون دلار وام به بخش خصوصی], vbk.NesbatAzKol [نسبت از کل وام به بخش خصوصی], cast(SUM(vbk.NesbatAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی وام به بخش خصوصی], za.Vahed [واحد ذخایر ارزی], za.GozashteMDollar [گذشته ملیون دلار ذخایر ارزی], za.NesbatAzKol [نسبت از کل ذخایر ارزی],  cast(SUM(za.NesbatAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی ذخایر ارزی], zt.Gozashte [گذشته ذخایر طلا], zt.DarsadAzKol [درصد از کل ذخایر طلا], cast(SUM(zt.DarsadAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی ذخایر طلا], tnm.Vahed [واحد تولید ناخالص ملی], tnm.GozashteMDollar [گذشته ملیون دلار تولید ناخالص ملی], tnm.NesbatAzKol [نسبت از کل تولید ناخالص ملی],  cast(SUM(tnm.NesbatAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی تولید ناخالص ملی], kh.[2005], kh.[2010], kh.[2011], kh.[2012], kh.[2013], kh.[2014], kh.[2015], kh.[2016], kh.[2017], kh.[2018], kh.[2019], kh.[2020],kh.[جمع ردیف از 2005 تا 2020], kh.['دوره'] [دوره], kh.['گذشته'] [گذشته کسری حساب جاری], kh.['مرجع'] [مرجع کسری حساب جاری] , kh.['واحد'] [واحد کسری حساب جاری], kh.['Name'] [Name], kh.['Rate'] [Rate], kh.['گذشته به ملیون دلار'] [گذشته به ملیون دلار کسری حساب جاری], kh.NesbatAzKol [نسبت از کل کسری حساب جاری],  cast(SUM(kh.NesbatAzKol) OVER(ORDER BY gs.[گردش سرمایه به ملیون دلار] desc) as decimal(4,2)) [تجمعی کسری حساب جاری]

from VKasriHesabeJari kh
left join VAndazeAslTavarom at on  kh.['Keshvar'] = at.Keshvar
left join VBankMarkazi bm on bm.Keshvar =  kh.['keshvar']
left join VBedehiDolatBeTolidNakhales bdnm on bdnm.Keshvar =  kh.['keshvar']
left join VBedehiKhanevarBeDaramad bkbd on bkbd.Keshvar =  kh.['keshvar']
left join VBedehiKhanevarBeTolidNakhales bkbtn on bkbtn.Keshvar =  kh.['keshvar']
left join VBedehiKhareji bk on bk.Keshvar =  kh.['keshvar']
left join VBourse b on b.Name =  kh.['keshvar']
left join VGardeshSarmaye gs on gs.Keshvar =  kh.['keshvar']
left join VHadeAghalDastmozd had on had.Keshvar =  kh.['keshvar']
left join VMaliatBarDaramadShakhsi mbds on mbds.Keshvar =  kh.['keshvar']
left join VMaliatBarSherkatHa Mbs on mbs.Keshvar = kh.['keshvar']
left join VNaghdinegi n on n.Keshvar = kh.['keshvar']
left join VNerkheBahreBanki nbb on nbb.Keshvar = kh.['keshvar']
left join VNerkheVaamBanki nvb on nvb.Keshvar = kh.['keshvar']
left join VPasandazShakhsi ps on ps.Keshvar = kh.['keshvar']
left join VSarmayeGozariKhareji sgk on sgk.Keshvar = kh.['keshvar']
left join VTolidKhodro tk on tk.Keshvar = kh.['keshvar']
left join VTolidNaftKhaam tnk on tnk.Keshvar = kh.['keshvar']
left join vVaamBeBakhsheKhosusi vbk on vbk.Keshvar = kh.['keshvar']
left join VZakhayerArzi za on za.Keshvar = kh.['keshvar']
left join VZakhayerTala zt on zt.Keshvar = kh.['keshvar']
left join VShakhesMaskan sm on sm.Keshvar = kh.['Keshvar']
left join VTolidNakhalesDakheli tnm on tnm.Keshvar = kh.['Keshvar']
left join VMovazeneTejari mt on mt.Keshvar = kh.['Keshvar']
left join VBedehiBakhshKhosusi bbk on bbk.Keshvar = kh.['Keshvar']

)
select * froM cte
where keshvar is not null

