create view VVaziateArzi
as 
select nb.Keshvar [کشور], GozashteMDollar [ذخایر ارزی به ملیون دلار], nb.NesbatAzKol [نسبت از کل ذخایر ارزی], nb.Tajamoi [تجمعی ذخایر ارزی], zt.Gozashte [ذخایر طلا], zt.DarsadAzKol [نسبت از کل ذخایر طلا], zt.Tajamoi [تجمعی ذخایر طلا]
from VZakhayerArzi nb
left join VZakhayerTala zt on nb.Keshvar = zt.Keshvar
