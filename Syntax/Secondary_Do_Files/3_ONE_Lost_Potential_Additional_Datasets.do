clear

**************************************************
************Additional Datasets ******************
**************************************************

** Brings in the latest data on additional aspects, not all of this is used in the final calculations.


*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(HD.HCI.LAYS) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen lays=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace lays=`x' if lays==.
	}
	
*

sort countrycode

keep countrycode lays
save "$interim//lays.dta", replace

clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(HD.HCI.HLOS) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen hlos=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010  	
	
	
	foreach x of local year {
	replace hlos=`x' if hlos==.
	}
	
*

sort countrycode

keep countrycode hlos
save "$interim//hlos.dta", replace

clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(HD.HCI.EYRS) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen eyrs=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 	
	
	foreach x of local year {
	replace eyrs=`x' if eyrs==.
	}
	
*

sort countrycode

keep countrycode eyrs
save "$interim//eyrs.dta", replace

clear



*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(SE.LPV.PRIM.OOS) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen oos_both=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace oos_both=`x' if oos_both==.
	}
	
*

sort countrycode

keep countrycode oos_both
save "$interim//oos_both.dta", replace

clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(SE.LPV.PRIM.OOS.FE) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen oos_female=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace oos_female=`x' if oos_female==.
	}
	
*

sort countrycode

keep countrycode oos_female
save "$interim//oos_female.dta", replace

clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(SE.LPV.PRIM.OOS.MA) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen oos_male=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace oos_male=`x' if oos_male==.
	}
	
*

sort countrycode

keep countrycode oos_male
save "$interim//oos_male.dta", replace

clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(SE.LPV.PRIM.BMP) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen bmp_both=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace bmp_both=`x' if bmp_both==.
	}
	
*

sort countrycode

keep countrycode bmp_both
save "$interim//bmp_both.dta", replace


clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(SE.LPV.PRIM.BMP.FE) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen bmp_female=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace bmp_female=`x' if bmp_female==.
	}
	
*

sort countrycode

keep countrycode bmp_female
save "$interim//bmp_female.dta", replace


clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(SE.LPV.PRIM.BMP.MA) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen bmp_male=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace bmp_male=`x' if bmp_male==.
	}
	
*

sort countrycode

keep countrycode bmp_male
save "$interim//bmp_male.dta", replace


clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(SE.PRM.UNER.ZS) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen oos_full_both=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace oos_full_both=`x' if oos_full_both==.
	}
	
*

sort countrycode

keep countrycode oos_full_both
save "$interim//oos_full_both.dta", replace


clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(SE.PRM.UNER.FE.ZS) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen oos_full_female=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace oos_full_female=`x' if oos_full_female==.
	}
	
*

sort countrycode

keep countrycode oos_full_female
save "$interim//oos_full_female.dta", replace


clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(SE.PRM.UNER.MA.ZS) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen oos_full_male=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace oos_full_male=`x' if oos_full_male==.
	}
	
*

sort countrycode

keep countrycode oos_full_male
save "$interim//oos_full_male.dta", replace


clear

*************

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(PA.NUS.PPP) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen ppp_conversion_factor=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace ppp_conversion_factor=`x' if ppp_conversion_factor==.
	}
	
*

sort countrycode

keep countrycode ppp_conversion_factor
save "$interim//ppp_conversion_factor.dta", replace


clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(NY.GDP.MKTP.PP.CD) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen gdp_ppp_current=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace gdp_ppp_current=`x' if gdp_ppp_current==.
	}
	
*

sort countrycode

keep countrycode gdp_ppp_current
save "$interim//gdp_ppp_current.dta", replace

clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(NY.GDP.PCAP.PP.CD) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen gdp_per_capita_ppp_current=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace gdp_per_capita_ppp_current=`x' if gdp_per_capita_ppp_current==.
	}
	
*

sort countrycode

keep countrycode gdp_per_capita_ppp_current
save "$interim//gdp_per_capita_ppp_current.dta", replace


clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(NY.GNP.PCAP.CD) year(2000:2020) clear
**Keeping the latest year where data is available**	
	gen gni_per_capita_current=.
	local year yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 yr2009 yr2008 yr2007 yr2006 yr2005 yr2004 yr2003 yr2002 yr2001 yr2000
	
	foreach x of local year {
	replace gni_per_capita_current=`x' if gni_per_capita_current==.
	}
	
*

sort countrycode

keep countrycode gni_per_capita_current
save "$interim//gni_per_capita_current.dta", replace

clear

*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(SE.XPD.PRIM.PC.ZS) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen spend_per_pupil_primary_of_gdp=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace spend_per_pupil_primary_of_gdp=`x' if spend_per_pupil_primary_of_gdp==.
	}
	
*

sort countrycode

keep countrycode spend_per_pupil_primary_of_gdp
save "$interim//spend_per_pupil_primary_of_gdp.dta", replace



clear



*** data from world bank https://datacatalog.worldbank.org/dataset/
wbopendata, indicator(SE.PRM.NENR) year(2010:2020) clear
*only avaiilable 2010 onwards

**Keeping the latest year where data is available**	
	gen net_enrolment_preprimary=.
	local year  yr2020 yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 
	
	foreach x of local year {
	replace net_enrolment_preprimary=`x' if net_enrolment_preprimary==.
	}
	
*

sort countrycode

keep countrycode net_enrolment_preprimary
save "$interim//net_enrolment_preprimary.dta", replace


clear




