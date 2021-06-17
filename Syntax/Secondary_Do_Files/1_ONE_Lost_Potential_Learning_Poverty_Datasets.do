
**************************************************
************Learning Poverty dataset**************
**************************************************

*** Female

*** data from world bank https://datacatalog.worldbank.org/dataset/learning-poverty
wbopendata, indicator(SE.LPV.PRIM.FE) year(2000:2030) clear

**Keeping the latest year where data is available**	
	gen lp_female=.
	local year yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 yr2009	yr2008	yr2007	yr2006	yr2005	yr2004	yr2003	yr2002	yr2001	yr2000	
	
	foreach x of local year {
	replace lp_female=`x' if lp_female==.
	}
	
*

gen learningpoverty_female=lp_female/100

drop lp_female 
sort countrycode
save "$interim//learning_poverty_f.dta", replace

*** Male

*** data from world bank https://datacatalog.worldbank.org/dataset/learning-poverty
wbopendata, indicator(SE.LPV.PRIM.MA) year(2000:2030) clear

**Keeping the latest year where data is available**	
	gen lp_male=.
	local year yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 yr2009	yr2008	yr2007	yr2006	yr2005	yr2004	yr2003	yr2002	yr2001	yr2000	
	
	foreach x of local year {
	replace lp_male=`x' if lp_male==.
	}
*	

**Converting to a proportion**
gen learningpoverty_male=lp_male/100
drop lp_male 
sort countrycode
save "$interim//learning_poverty_m.dta", replace

*** data from world bank https://datacatalog.worldbank.org/dataset/learning-poverty
clear
wbopendata, indicator(SE.LPV.PRIM) year(2000:2030) clear

**Keeping the latest year where data is available**	
	gen lp_both=.
local year yr2019 yr2018 yr2017 yr2016 yr2015 yr2014 yr2013 yr2012 yr2011 yr2010 yr2009	yr2008	yr2007	yr2006	yr2005	yr2004	yr2003	yr2002	yr2001	yr2000	
	
	foreach x of local year {
	replace lp_both=`x' if lp_both==.
	}
	*
	
**Converting to a proportion**
gen learningpoverty_both=lp_both/100

drop lp_both 
sort countrycode
save "$interim//learning_poverty_both.dta", replace


*** Merging and saving

use  "$interim//learning_poverty_both.dta", replace

merge countrycode using "$interim//learning_poverty_f.dta"
drop _merge
sort countrycode
merge countrycode using "$interim//learning_poverty_m.dta"




sort countrycode 
keep countrycode countryname region regionname adminregion adminregionname incomelevel incomelevelname lendingtype lendingtypename learningpoverty_both ///
 learningpoverty_male learningpoverty_female 
 sort countrycode
save "$interim//learning_poverty_autom.dta", replace

** we now have by country the learning poverty, and also the income group ones across all
