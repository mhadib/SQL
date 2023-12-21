create   function dbo.charindex_nth (
  @FindThis varchar(8000),
  @InThis varchar(max),
  @NthOccurence tinyint
)
returns bigint
as
begin
  /*
  Returns the position of the nth occurance of @FindThis in @InThis

  Who   When    What
  PJR   160421  Initial   
  */

  return dbo._charindex_nth(@FindThis, @InThis, 1, @NthOccurence)
end