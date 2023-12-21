
CREATE FUNCTION [dbo].[RetreiveVahed] (@Vahed nvarchar(100))
RETURNS nvarchar(100) AS
BEGIN
    return left(replace(replace(replace(replace(replace(@Vahed,N' ',N''),N'-',N''),N'میلیون',N''),N'هزار',N''),N'USDHML',N'CNY') ,3)
END