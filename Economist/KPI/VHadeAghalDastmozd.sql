
--USE [Adib]
--GO

--/****** Object:  View [dbo].[VHadeAghalDastmozd]    Script Date: 9/1/2022 6:11:41 AM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

CREATE view [dbo].[VHadeAghalDastmozd]
as
with cte
as(
select Keshvar, Gozashte, Vahed, 
case 
	 when Vahed = N'USD / ساعت' then s.Gozashte 
	 when Vahed = N'JPY / ساعت' then case when DollarDevids = 1 then s.Gozashte / Rate /100
	 else s.Gozashte * Rate / 100 end  
else case when DollarDevids = 1 then s.Gozashte /Rate 
	 else s.Gozashte * Rate end end GozashteDollar, Rate, pname,name
from HadeAghalDastmozd S
--left join Currency on left(Vahed,3) = left(Name,3)
left join vtgjuCurrency tgju on (left(s.Vahed,3) = substring(rtrim(ltrim(pName)),1,3))
where not exists(select 1 from HadeAghalDastmozd S2 where s.Keshvar = s2.Keshvar and s2.CreateDate > s.CreateDate)
 and s.Keshvar in (select ['keshvar'] from VKasriHesabeJari))
,cte2 as (
select Keshvar, Gozashte, Vahed, isnull(GozashteDollar,Gozashte) GozashteDollar  from cte
where Keshvar not like N'%مونت%' and Keshvar not like N'%منطقهیورو%')
select Keshvar, Gozashte, Vahed, 

cast(Case when Vahed like N'%ساعت%' then GozashteDollar * 240
		  when Vahed like N'%هفته%' then GozashteDollar * 4.2
		  when Vahed like N'%روز%' then GozashteDollar * 30
		  else GozashteDollar end as decimal(10,0)) [حداقل دستمزد در ماه به دلار]
from cte2 
