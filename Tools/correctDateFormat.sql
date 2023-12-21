CREATE function dbo.correctDateFormat (@D varchar(10))
returns varchar(10)
as
begin

declare @Part1 varchar(5)
declare @Part2 varchar(5)
declare @Part3 varchar(5)
set @Part3 =SUBSTRING(@D, 1,CHARINDEX('/', @D)-1)
set @D =SUBSTRING(@D,CHARINDEX('/', @D)+1,LEN(@D))
set @Part2 =SUBSTRING(@D, 1,CHARINDEX('/', @D)-1)
set @Part1 =SUBSTRING(@D,CHARINDEX('/', @D)+1,LEN(@D))
declare @X varchar(10)
set @X = @Part3 +'/'+REPLICATE('0', 2-LEN(@Part2))+ @Part2 +'/'+REPLICATE('0', 2-LEN(@Part1))+ @Part1
return @X
end