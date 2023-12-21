create   function dbo._charindex_nth (
  @FindThis varchar(8000),
  @InThis varchar(max),
  @StartFrom int,
  @NthOccurence tinyint
)
returns bigint
as
begin
  /*
  Recursive helper used by dbo.charindex_nth to return the position of the nth occurance of @FindThis in @InThis

  Who   When    What
  PJR   160421  Initial   
  */

  declare @Pos bigint

  if isnull(@NthOccurence, 0) <= 0 or isnull(@StartFrom, 0) <= 0
  begin
    select @Pos = 0
  end else begin
    if @NthOccurence = 1
    begin
      select @Pos = charindex(@FindThis, @InThis, @StartFrom)
    end else begin
      select @Pos = dbo._charindex_nth(@FindThis, @InThis, nullif(charindex(@FindThis, @InThis, @StartFrom), 0) + 1, @NthOccurence - 1)
    end
  end

  return @Pos
end
