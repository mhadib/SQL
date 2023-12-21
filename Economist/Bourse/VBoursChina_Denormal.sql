

--select * from NerkheBarabariHistory where Name like N'%چین%'

	   CREATE   view  [dbo].[VBoursChina_Denormal]  as with cte as (  select b.Name, b.FullName , Gheymat [شاخص], YearDarsad [درصد تغییر نسبت با سال گذشته],bh.[شاخص بورس چین  ۲۰۰۵ ] [شاخص بورس ۲۰۰۵ ],cast(cast((b.Gheymat - bh.[شاخص بورس چین  ۲۰۰۵ ]) /bh.[شاخص بورس چین  ۲۰۰۵ ] as decimal(10,4))* 100 as decimal(10,2))[درصد تغییر نسبت به سال 2005],bh.[فعالیت شرکت], bh.[معرفی شرکت],null as [رتبه بندی شرکت], bh.[سال ورود ] [سال ورود ]  ,nba.[رشد نسبت به سال 2005] [رشد نرخ برابری ارز نسبت به سال 2005] , v.[Net income(FY)] [سود خالص], v.[Market cap] [حجم بازار],  v.InvestmentReturnPeriod [دوران بازگشت سرمایه]
	   from BoursChina b  
	   join BoursChinaHistorical bh on b.Name = bh.Name 
	   left join NerkheBarabariHistory na on na.Name like N'%چین%'
	   left join vNerkheBarabari nba on nba.PName like N'%'+dbo.RetreiveVahed(substring(na.pname,1,3))+'%'
	   left join vBoursViewChina v  on b.Name = v.symbol

	   where not exists(select 1 from [dbo].BoursChina b2 where b.Name = b2.Name and b2.createdate > b.createdate) ) 
	   
	   
select [Name], FullName,[دوران بازگشت سرمایه], [سود خالص], [حجم بازار],  [شاخص], [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], 
	  cast([درصد تغییر نسبت به سال 2005] as decimal(10,1)) [درصد تغییر نسبت به سال 2005],
	  cast([درصد تغییر نسبت به سال 2005] * 0.64 as decimal(10,2)) [رشد شاخص بورس نسبت به سال 2005 با کسر تورم],
	 
case   
when [دوران بازگشت سرمایه] < 10 Then N'Grade A, حفظ سهم, پیشنهاد به ایرانیان برای فعالیت در بخش تولید, بازرگانی و خدمات این نوع کسب و کار در قالب شرکتهای فوق العاده کوچک که محصول خود را به شرکتهای بزرگ میفروشد'   
when [دوران بازگشت سرمایه] >= 10 and [دوران بازگشت سرمایه] < 15 Then N'Grade B, حفظ سهم, پیشنهاد به ایرانیان برای فعالیت در بخش تولید, بازرگانی و خدمات این نوع کسب و کار در قالب شرکتهای فوق العاده کوچک که محصول خود را به شرکتهای بزرگ میفروشد'   
when [دوران بازگشت سرمایه] >= 15 and [دوران بازگشت سرمایه] < 20 Then N'Grade C, حفظ سهم, پیشنهاد به ایرانیان برای فعالیت در بخش تولید, بازرگانی و خدمات این نوع کسب و کار در قالب شرکتهای فوق العاده کوچک که محصول خود را به شرکتهای بزرگ میفروشد' 

when [دوران بازگشت سرمایه] >= 20 
 Then case     
 
	when [فعالیت شرکت ] in (select [فعالیت شرکت ] from cte where [دوران بازگشت سرمایه]>= 20 ) then N'Grade D+, این رشته فعالیت در این کشور توجیه اقتصادی دارد اما این شرکت نابهره ور است, پیشنهاد فروش سهم '  
	when   [فعالیت شرکت ] not in (select [فعالیت شرکت ] from cte where [دوران بازگشت سرمایه] >= 20 ) then N'Grade D-, پیشنهاد به ایرانیان برای عدم فعالیت در این نوع کسب و کار در بخش تولید, بازرگانی و خدمات, توصیه سیو صد در صد سود در بورس'  
end   end

[رتبه بندی شرکت],     [فعالیت شرکت ], [معرفی شرکت], N'('+cast([سال ورود ] as nvarchar(200))+N')' [سال ورود ] 
	  from cte  
