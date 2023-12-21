CREATE function [dbo].[getLastTSETMCData]()
RETURNS TABLE
AS
RETURN

select 
substring(t.val,0,dbo.charindex_nth(',', t.val, 1)) IsinCode
,substring(t.val,dbo.charindex_nth(',', t.val, 1)+1,dbo.charindex_nth(',', t.val, 2)-dbo.charindex_nth(',', t.val, 1)-1)InstrumentId
,substring(t.val,dbo.charindex_nth(',', t.val, 2)+1,dbo.charindex_nth(',', t.val, 3)-dbo.charindex_nth(',', t.val, 2)-1)Symbol
,substring(t.val,dbo.charindex_nth(',', t.val, 3)+1,dbo.charindex_nth(',', t.val, 4)-dbo.charindex_nth(',', t.val, 3)-1)CompanyName
,substring(t.val,dbo.charindex_nth(',', t.val, 4)+1,dbo.charindex_nth(',', t.val, 5)-dbo.charindex_nth(',', t.val, 4)-1)noName1
,substring(t.val,dbo.charindex_nth(',', t.val, 5)+1,dbo.charindex_nth(',', t.val, 6)-dbo.charindex_nth(',', t.val, 5)-1)FirstPrice
,substring(t.val,dbo.charindex_nth(',', t.val, 6)+1,dbo.charindex_nth(',', t.val, 7)-dbo.charindex_nth(',', t.val, 6)-1)FinalPrice
,substring(t.val,dbo.charindex_nth(',', t.val, 7)+1,dbo.charindex_nth(',', t.val, 8)-dbo.charindex_nth(',', t.val, 7)-1)LastPrice
,substring(t.val,dbo.charindex_nth(',', t.val, 8)+1,dbo.charindex_nth(',', t.val, 9)-dbo.charindex_nth(',', t.val, 8)-1)NumberOfTrade
,substring(t.val,dbo.charindex_nth(',', t.val, 9)+1,dbo.charindex_nth(',', t.val, 10)-dbo.charindex_nth(',', t.val, 9)-1)TradeVolume
,substring(t.val,dbo.charindex_nth(',', t.val, 10)+1,dbo.charindex_nth(',', t.val, 11)-dbo.charindex_nth(',', t.val, 10)-1)ArzesheMoamelat
,substring(t.val,dbo.charindex_nth(',', t.val, 11)+1,dbo.charindex_nth(',', t.val, 12)-dbo.charindex_nth(',', t.val, 11)-1)MinPriceToday
,substring(t.val,dbo.charindex_nth(',', t.val, 12)+1,dbo.charindex_nth(',', t.val, 13)-dbo.charindex_nth(',', t.val, 12)-1)MaxPriceToday
,substring(t.val,dbo.charindex_nth(',', t.val, 13)+1,dbo.charindex_nth(',', t.val, 14)-dbo.charindex_nth(',', t.val, 13)-1)Yesterday
,substring(t.val,dbo.charindex_nth(',', t.val, 14)+1,dbo.charindex_nth(',', t.val, 15)-dbo.charindex_nth(',', t.val, 14)-1)EPS
,substring(t.val,dbo.charindex_nth(',', t.val, 15)+1,dbo.charindex_nth(',', t.val, 16)-dbo.charindex_nth(',', t.val, 15)-1)HajmeMabna
,substring(t.val,dbo.charindex_nth(',', t.val, 16)+1,dbo.charindex_nth(',', t.val, 17)-dbo.charindex_nth(',', t.val, 16)-1)noName2
,substring(t.val,dbo.charindex_nth(',', t.val, 17)+1,dbo.charindex_nth(',', t.val, 18)-dbo.charindex_nth(',', t.val, 17)-1)noName3
,substring(t.val,dbo.charindex_nth(',', t.val, 18)+1,dbo.charindex_nth(',', t.val, 19)-dbo.charindex_nth(',', t.val, 18)-1)noName4
,substring(t.val,dbo.charindex_nth(',', t.val, 19)+1,dbo.charindex_nth(',', t.val, 20)-dbo.charindex_nth(',', t.val, 19)-1)MaxPriceLimit
,substring(t.val,dbo.charindex_nth(',', t.val, 20)+1,dbo.charindex_nth(',', t.val, 21)-dbo.charindex_nth(',', t.val, 20)-1)MinPriceLimit
,substring(t.val,dbo.charindex_nth(',', t.val, 21)+1,dbo.charindex_nth(',', t.val, 22)-dbo.charindex_nth(',', t.val, 21)-1)NumberOfShare
,substring(t.val,dbo.charindex_nth(',', t.val, 22)+1,100)noName5
,substring(h.val,dbo.charindex_nth(',', h.val, 1)+1,dbo.charindex_nth(',', h.val, 2)-dbo.charindex_nth(',', h.val, 1)-1) KharidHaghighiOrderCount
,substring(h.val,dbo.charindex_nth(',', h.val, 2)+1,dbo.charindex_nth(',', h.val, 3)-dbo.charindex_nth(',', h.val, 2)-1) KharidHoghughiOrderCount
,substring(h.val,dbo.charindex_nth(',', h.val, 3)+1,dbo.charindex_nth(',', h.val, 4)-dbo.charindex_nth(',', h.val, 3)-1) KharidHaghighiVolume
,substring(h.val,dbo.charindex_nth(',', h.val, 4)+1,dbo.charindex_nth(',', h.val, 5)-dbo.charindex_nth(',', h.val, 4)-1) KharidHoghughiVolume
,substring(h.val,dbo.charindex_nth(',', h.val, 5)+1,dbo.charindex_nth(',', h.val, 6)-dbo.charindex_nth(',', h.val, 5)-1) ForushHaghighiOrderCount
,substring(h.val,dbo.charindex_nth(',', h.val, 6)+1,dbo.charindex_nth(',', h.val, 7)-dbo.charindex_nth(',', h.val, 6)-1) ForushHoghughiOrderCount
,substring(h.val,dbo.charindex_nth(',', h.val, 7)+1,dbo.charindex_nth(',', h.val, 8)-dbo.charindex_nth(',', h.val, 7)-1) ForushHaghighiVolume
,substring(h.val,dbo.charindex_nth(',', h.val, 8)+1,100) ForushHoghughiVolume,
h.CreateDate,
c.[float]

from TsetmcTabular T
join HaghighiHoghughi H on substring(t.val,0,dbo.charindex_nth(',', t.val, 1)) = substring(h.val,0,dbo.charindex_nth(',', h.val, 1))
join InstrumentFloat c with(nolock) on c.InstrumentId = substring(t.val,dbo.charindex_nth(',', t.val, 1)+1,dbo.charindex_nth(',', t.val, 2)-dbo.charindex_nth(',', t.val, 1)-1)
where substring(t.val,CHARINDEX(N',',t.val,0)+1,charindex(',', t.val, (charindex(',', t.val, 1))+1) - CHARINDEX(N',',t.val,0) -1 )  like N'%IR%'
and dbo.charindex_nth(',', t.val, 22) > 0  
