create TRIGGER [dbo].[TKasriHesabeJari]
   ON  [dbo].[KasriHesabeJari]
   AFTER INSERT
AS 
BEGIN

update KasriHesabeJari
set ['گذشته به ملیون دلار'] = case when dollardevids = 1 then  ['گذشته']/rate else ['گذشته']*rate  end
--select ['گذشته'],['واحد'],['Name'],['Rate'],['گذشته به ملیون دلار'],['گذشته'],pname,dollardevids,rate
--,case when dollardevids = 1 then  ['گذشته']/rate else ['گذشته']*rate  end, *
from KasriHesabeJari k
left join vtgjuCurrency tgju on (left(k.['واحد'],3) = substring(rtrim(ltrim(pName)),1,3))
where left(k.['واحد'],3) != 'usd'and 
not exists(select 1 from KasriHesabeJari k2 where k.['Keshvar'] = k2.['Keshvar'] and k2.CreateDate > k.CreateDate)
and ['Name'] = '1' and rate is not null
end