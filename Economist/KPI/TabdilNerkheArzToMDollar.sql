
CREATE FUNCTION [dbo].[TabdilNerkheArzToMDollar] (@Gozashte float, @DollarDevid bit, @Vahed nvarchar(100), @rate float)
RETURNS float AS
BEGIN
    return case 
	 when @Vahed like N'%CNY-HML%' then @Gozashte * 100 
	 when @Vahed like N'%سعی هزار%' then @Gozashte / 1000000
	 when @Vahed like N'%هزار%' then @Gozashte / 1000
	 when @Vahed like N'%USD-HML%' then @Gozashte * 1000
	 when @Vahed like N'%HML%' then @Gozashte * 1000 --usd 1000, cny hml 1000, cny miliard 1000
	 --when @Vahed like N'%میلیارد%' and @vahed like N'%THB%' then @Gozashte / 100
	 --when @Vahed like N'CNY - میلیارد' then @Gozashte * 1000000 
	 when @Vahed like N'%میلیارد%' then @Gozashte * 1000 
	 when @Vahed like N'%USD - صد - میلیون%' then @Gozashte * 100
	 else @Gozashte end *
isnull(case when @DollarDevid = 0 then @rate 
else 1/@rate end,1) 
END
