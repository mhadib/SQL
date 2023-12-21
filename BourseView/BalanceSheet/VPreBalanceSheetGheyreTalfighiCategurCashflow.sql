create view VPreBalanceSheetGheyreTalfighiCategurCashflow
as
select * 
from BalanceSheetGheyreTalfighiCategurCashflow_Bourse
union all 
select * 
from BalanceSheetGheyreTalfighiCategurCashflow_faraBourse
