create view VPreBalanceSheetTalfighiCategurCashflow
as
select * 
from BalanceSheetTalfighiCategurCashflow_Bourse
union all 
select * 
from BalanceSheetTalfighiCategurCashflow_faraBourse