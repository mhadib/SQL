
CREATE Procedure GetChartayi(@Date date = null)
as
begin
	if	@date is null
		set @Date = cast(getdate() as date)
	select distinct [instrumentId],[ارزش دیروز بازار],[symbolFA],[1DaysVolume],[day],[3DaysVolume],[7DaysVolume],[14DaysVolume],
                          [30DaysVolume],[180DaysVolume],[dayMarketCap], [ارزش بازار],[رشد],[float],[ارزش سی روز گذشته بازار],
                          [رشد سی روزه],[ارزش سه روز گذشته بازار],[رشد سه روزه],[ارزش هفت روز گذشته بازار],[رشد هفت روزه],[ارزش چهارده روز گذشته بازار],[رشد چهارده روزه],[فروش حقیقی],[خرید حقیقی],[فروش حقوقی],[خرید حقوقی],[فروش حقیقی چهارده روز],[خرید حقیقی چهارده روز],[فروش حقوقی چهارده روز],[خرید حقوقی چهارده روز],  [فروش حقیقی نود روز], [خرید حقیقی نود روز], [فروش حقوقی نود روز], [خرید حقوقی نود روز], [خرید حقوقی سه روز], [خرید حقوقی هفت روز],[خرید حقیقی سه روز],[خرید حقیقی هفت روز],[فروش حقوقی سه روز],[فروش حقیقی سه روز],[فروش حقوقی هفت روز],[فروش حقیقی هفت روز],[خرید حقوقی سی روز],[خرید حقیقی سی روز],[فروش حقوقی سی روز],[فروش حقیقی سی روز],[90DaysVolume],[رشد نود روزه],[رشد شش ماهه]
	from HistoricalChartayi hc
	where not exists(select 1 from HistoricalChartayi h where hc.instrumentId = h.instrumentId and h.CreateDate > hc.CreateDate)and 
	([day] = convert(varchar, @date, 112)
	or [dayMarketCap] = convert(varchar, @Date, 112))
	order by 1 desc
end