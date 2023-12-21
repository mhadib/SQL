

CREATE view [dbo].[vBoursPlus]
as
select N'استرالیا'[نام کشور], Name, FullName, [دوران بازگشت سرمایه], [سود خالص], [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ]
from VBoursAustralia_Denormal
union all 
select N'کانادا'[نام کشور], Name, FullName, [دوران بازگشت سرمایه], [سود خالص], [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ] from VBoursCanada_Denormal
union all 
select N'چین'[نام کشور], Name, FullName, [دوران بازگشت سرمایه], [سود خالص], [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ] from VBoursChina_Denormal
union all 
select N'امارات'[نام کشور], Name, FullName,null [دوران بازگشت سرمایه], null [سود خالص],null [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005],null [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ] from VBoursEmirat_Denormal
union all 
select N'انگلیس'[نام کشور], Name, FullName, [دوران بازگشت سرمایه], [سود خالص], [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ] from VBoursEnglis_Denormal
union all 
select N'فرانسه'[نام کشور], Name, FullName, [دوران بازگشت سرمایه], [سود خالص], [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ] from vBoursFrance
union all 
select N'آلمان'[نام کشور], Name, FullName, [دوران بازگشت سرمایه], [سود خالص], [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ] from VBoursGermany
union all 
select N'ژاپن'[نام کشور], Name, FullName, [دوران بازگشت سرمایه], [سود خالص], [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ] from VBoursJapan
union all 
select N'کره'[نام کشور], Name, FullName, [دوران بازگشت سرمایه], [سود خالص], [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ] from VBoursKorea_Denormal
union all 
select N'ترکیه'[نام کشور], Name, FullName, [دوران بازگشت سرمایه], [سود خالص], [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ] from VBoursTorkey_Denormal
union all 
select N'داوجونز'[نام کشور], Name, FullName, [دوران بازگشت سرمایه], [سود خالص], [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ] from VBoursUSDovJones_Denormal
union all 
select N'نزدک'[نام کشور], Name, FullName, [دوران بازگشت سرمایه], [سود خالص], [حجم بازار], [شاخص]
, [درصد تغییر نسبت با سال گذشته], [شاخص بورس ۲۰۰۵ ], [درصد تغییر نسبت به سال 2005], [رشد شاخص بورس نسبت به سال 2005 با کسر تورم], [رتبه بندی شرکت], [فعالیت شرکت ], [معرفی شرکت], [سال ورود ] from VBoursUSNasdaq_Denormal