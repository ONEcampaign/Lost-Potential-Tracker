**************************************************
*******Countries in income groups and regions*****
**************************************************
clear all


use "$interim//learning_poverty_autom.dta"
merge 1:1 countrycode using "$interim/pop_10yrs.dta"
drop _merge
merge 1:1 countrycode using "$interim/lays.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge
merge 1:1 countrycode using "$interim/hlos.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge
merge 1:1 countrycode using "$interim/eyrs.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge
merge 1:1 countrycode using "$interim/oos_both.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge
merge 1:1 countrycode using "$interim/oos_female.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge
merge 1:1 countrycode using "$interim/oos_male.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge
merge 1:1 countrycode using "$interim/bmp_both.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge
merge 1:1 countrycode using "$interim/bmp_female.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge
merge 1:1 countrycode using "$interim/bmp_male.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge
merge 1:1 countrycode using "$interim/oos_full_both.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge
merge 1:1 countrycode using "$interim/oos_full_female.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge

merge 1:1 countrycode using "$interim/oos_full_male.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge

******************* ppp_conversion_factor gdp_ppp_current gdp_per_capita_ppp_current spend_per_pupil_primary_of_gdp net_enrolment_preprimary
merge 1:1 countrycode using "$interim/ppp_conversion_factor.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge

merge 1:1 countrycode using "$interim/gdp_ppp_current.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge

merge 1:1 countrycode using "$interim/gdp_per_capita_ppp_current.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge

merge 1:1 countrycode using "$interim/gni_per_capita_current.dta"
* one not classified country we can drop
drop if _merge==2
drop _merge

merge 1:1 countrycode using "$interim/spend_per_pupil_primary_of_gdp.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge

merge 1:1 countrycode using "$interim/net_enrolment_preprimary.dta"
* none not classified country we can drop
drop if _merge==2
drop _merge


save "$interim//Lost_Potential_Database_First_Merging.dta", replace
** Merging with income group gni






gen income_group=1 if incomelevel=="LIC"
replace income_group=2 if incomelevel=="LMC"
replace income_group=3 if incomelevel=="UMC"
replace income_group=4 if incomelevel=="HIC"
label define income_group_values 1 "LIC" 2 "LMIC" 3 "UMIC" 4 "HIC"
label values income_group income_group_values
drop incomelevel
gen world_region=1 if regionname =="East Asia and Pacific"
replace world_region=2 if regionname=="Europe and Central Asia"
replace world_region=3 if regionname=="Latin America and Caribbean"
replace world_region=4 if regionname=="Middle East and North Africa"
replace world_region=5 if regionname=="North America"
replace world_region=6 if regionname=="South Asia"
replace world_region=7 if regionname=="Sub-Saharan Africa"
label define region_values 1 "EAP" 2 "ECA" 3 "LAC" 4 "MENA" 5 "NA" 6 "SA" 7 "SSA"
label values world_region region_values
drop regionname
/*
gen un_region=1 if GEO_un =="Africa"
replace un_region=2 if GEO_un=="Americas"
replace un_region=3 if GEO_un=="Asia"
replace un_region=4 if GEO_un=="Europe"
replace un_region=5 if GEO_un=="Oceania"
label define un_region_values 1 "Africa" 2 "Americas" 3 "Asia" 4 "Europe" 5 "Oceania"
label values un_region un_region_values
drop GEO_un
*/
*The nine UN groups used are: East Asia and Pacific (EAP), Eastern Europe and Central Asia (EECA), Western Europe (WE), Latin America and Caribbean (LAC), Middle East and North Africa (MENA), North America (NA), South Asia (SA), Eastern and Southern Africa (ESA) and West and Central Africa (WCA). 

gen un_region = .
replace un_region=1 if GEO_un =="Australia and New Zealand"
replace un_region=1 if GEO_un =="Eastern Asia"
replace un_region=1 if GEO_un =="Melanesia"
replace un_region=1 if GEO_un =="Micronesia"
replace un_region=1 if GEO_un =="Polynesia"
replace un_region=1 if GEO_un =="South-Eastern Asia"


replace un_region=2 if GEO_un =="Central Asia"
replace un_region=2 if GEO_un =="Eastern Europe"
replace un_region=2 if GEO_un =="Western Asia"&countryname=="Armenia"
replace un_region=2 if GEO_un =="Western Asia"&countryname=="Azerbaijan"
replace un_region=2 if GEO_un =="Western Asia"&countryname=="Georgia"
replace un_region=2 if GEO_un =="Western Asia"&countryname=="Turkey"
replace un_region=2 if GEO_un =="Southern Europe"&countryname=="Albania"
replace un_region=2 if GEO_un =="Southern Europe"&countryname=="Bosnia and Herzegovina"
replace un_region=2 if GEO_un =="Southern Europe"&countryname=="Croatia"
replace un_region=2 if GEO_un =="Southern Europe"&countryname=="North Macedonia"

replace un_region=3 if GEO_un =="Northern Europe"
replace un_region=3 if GEO_un =="Western Europe"
replace un_region=3 if GEO_un =="Western Asia"&countryname=="Cyprus"
replace un_region=3 if GEO_un =="Southern Europe"&countryname=="Greece"
replace un_region=3 if GEO_un =="Southern Europe"&countryname=="Italy"
replace un_region=3 if GEO_un =="Southern Europe"&countryname=="Malta"
replace un_region=3 if GEO_un =="Southern Europe"&countryname=="Portugal"
replace un_region=3 if GEO_un =="Southern Europe"&countryname=="Slovenia"
replace un_region=3 if GEO_un =="Southern Europe"&countryname=="Spain"

replace un_region=4 if GEO_un =="Caribbean"
replace un_region=4 if GEO_un =="Central America"
replace un_region=4 if GEO_un =="South America"

replace un_region=5 if GEO_un =="Northern Africa"&countryname=="Algeria"
replace un_region=5 if GEO_un =="Northern Africa"&countryname=="Egypt, Arab Rep"
replace un_region=5 if GEO_un =="Northern Africa"&countryname=="Libya"
replace un_region=5 if GEO_un =="Northern Africa"&countryname=="Morocco"
replace un_region=5 if GEO_un =="Northern Africa"&countryname=="Tunisia"
replace un_region=5 if GEO_un =="Southern Asia"&countryname=="Iran, Islamic Rep"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="Bahrain"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="Iraq"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="Israel"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="Jordan"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="Kuwait"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="Lebanon"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="Oman"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="Qatar"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="Saudi Arabia"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="Syrian Arab Republic"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="United Arab Emirates"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="West Bank and Gaza"
replace un_region=5 if GEO_un =="Western Asia"&countryname=="Yemen, Rep"

replace un_region=6 if GEO_un =="Northern America"

replace un_region=7 if GEO_un =="Southern Asia"&countryname=="Afghanistan"
replace un_region=7 if GEO_un =="Southern Asia"&countryname=="Bangladesh"
replace un_region=7 if GEO_un =="Southern Asia"&countryname=="Bhutan"
replace un_region=7 if GEO_un =="Southern Asia"&countryname=="India"
replace un_region=7 if GEO_un =="Southern Asia"&countryname=="Maldives"
replace un_region=7 if GEO_un =="Southern Asia"&countryname=="Nepal"
replace un_region=7 if GEO_un =="Southern Asia"&countryname=="Pakistan"
replace un_region=7 if GEO_un =="Southern Asia"&countryname=="Sri Lanka"

replace un_region=8 if GEO_un =="Eastern Africa"
replace un_region=8 if GEO_un =="Southern Africa"
replace un_region=8 if GEO_un =="Middle Africa"&countryname=="Angola"
replace un_region=8 if GEO_un =="Northern Africa"&countryname=="South Sudan"
replace un_region=8 if GEO_un =="Northern Africa"&countryname=="Sudan"

replace un_region=9 if GEO_un =="Western Africa"
replace un_region=9 if GEO_un =="Middle Africa"&countryname=="Cameroon"
replace un_region=9 if GEO_un =="Middle Africa"&countryname=="Central African Republic"
replace un_region=9 if GEO_un =="Middle Africa"&countryname=="Chad"
replace un_region=9 if GEO_un =="Middle Africa"&countryname=="Congo, Dem Rep"
replace un_region=9 if GEO_un =="Middle Africa"&countryname=="Congo, Rep"
replace un_region=9 if GEO_un =="Middle Africa"&countryname=="Equatorial Guinea"
replace un_region=9 if GEO_un =="Middle Africa"&countryname=="Gabon"
replace un_region=9 if GEO_un =="Middle Africa"&countryname=="Sao Tome and Principe"

*** Small states and small island statest not included in the UN list, first replace with the closest comparison to WB where applicable
*eap to eap
replace un_region=1 if un_region==.&world_region==1
* lac to lac
replace un_region=4 if un_region==.&world_region==3
*mena to mena
replace un_region=5 if un_region==.&world_region==4
*na to na
replace un_region=6 if un_region==.&world_region==5
*sa to sa
replace un_region=7 if un_region==.&world_region==6

replace un_region=3 if countryname=="Andorra"
replace un_region=3 if countryname=="Channel Islands"
replace un_region=3 if countryname=="Faroe Islands"
replace un_region=3 if countryname=="Gibraltar"
replace un_region=3 if countryname=="Greenland"
replace un_region=3 if countryname=="Isle of Man"
replace un_region=3 if countryname=="Liechtenstein"
replace un_region=3 if countryname=="Monaco"
replace un_region=3 if countryname=="San Marino"

replace un_region=2 if countryname=="Montenegro"
replace un_region=2 if countryname=="Serbia"
replace un_region=2 if countryname=="Kosovo"

replace un_region=4 if countryname=="Netherlands Antilles"

replace un_region=1 if countryname=="Tokelau"


label define un_region_values 1 "EAP" 2 "EECA" 3 "WE" 4 "LAC" 5 "MENA" 6 "NA" 7 "SA" 8 "ESA" 9 "WCA"
label values un_region un_region_values

drop GEO_un




** Using OECD Fragile States List

** 2020 list

gen oecd_fragile = 0

foreach y in  AFG AGO BGD BFA BDI KHM CMR CAF TCD COM COG CIV DJI PRK COD GNQ ERI SWZ ETH GMB GTM GIN GNB HTI HND IRN IRQ KEN LAO LSO LBR LBY MDG MLI MRT MOZ MMR NIC NER NGA PAK PNG SLE SLB SOM SSD SDN SYR TJK TZA TGO UGA VEN PSE YEM ZMB ZWE  {
replace oecd_fragile = 1 if countrycode =="`y'"
}
*
*tab oecd_fragile
** 57 countries in 2020 OECD List - checked

** For tracking and counting when learningpoverty data is missing

gen learningpoverty_both_missing= 0
gen learningpoverty_female_missing=0
gen learningpoverty_male_missing=0
replace learningpoverty_both_missing = 1 if learningpoverty_both == .
replace learningpoverty_female_missing = 1 if learningpoverty_female == .
replace learningpoverty_male_missing = 1 if learningpoverty_male == .
gen learningpoverty_missing_count = 0

** no case where one gender is available and not the other
replace learningpoverty_missing_count = learningpoverty_both_missing+learningpoverty_female_missing+learningpoverty_male_missing

** so here, a score of 0 means they have gender and total, a score of 2 means they have total but not gender, and a score of 3 means they have none 
**







**Keeping if merges match and if country is Kosovo**
***Keep 192 countries

** If learning poverty data is missing by gender, use the country

**Assigning values for learning poverty by income group (both genders)

*** Both - NOTE: The figure for both is often not between the figures for male and female
*** We therefore use by gender

gen lp_LIC_both=learningpoverty_both if countrycode=="LIC"
sort lp_LIC_both
replace lp_LIC_both = lp_LIC_both[_n-1] if missing(lp_LIC_both)

gen lp_LMIC_both=learningpoverty_both if countrycode=="LMC"
sort lp_LMIC_both
replace lp_LMIC_both = lp_LMIC_both[_n-1] if missing(lp_LMIC_both)

gen lp_UMIC_both=learningpoverty_both if countrycode=="UMC"
sort lp_UMIC_both
replace lp_UMIC_both = lp_UMIC_both[_n-1] if missing(lp_UMIC_both)

gen lp_HIC_both=learningpoverty_both if countrycode=="HIC"
sort lp_HIC_both
replace lp_HIC_both = lp_HIC_both[_n-1] if missing(lp_HIC_both)


*** Female

gen lp_LIC_female=learningpoverty_female if countrycode=="LIC"
sort lp_LIC_female
replace lp_LIC_female = lp_LIC_female[_n-1] if missing(lp_LIC_female)

gen lp_LMIC_female=learningpoverty_female if countrycode=="LMC"
sort lp_LMIC_female
replace lp_LMIC_female = lp_LMIC_female[_n-1] if missing(lp_LMIC_female)

gen lp_UMIC_female=learningpoverty_female if countrycode=="UMC"
sort lp_UMIC_female
replace lp_UMIC_female = lp_UMIC_female[_n-1] if missing(lp_UMIC_female)

gen lp_HIC_female=learningpoverty_female if countrycode=="HIC"
sort lp_HIC_female
replace lp_HIC_female = lp_HIC_female[_n-1] if missing(lp_HIC_female)


*** Male

gen lp_LIC_male=learningpoverty_male if countrycode=="LIC"
sort lp_LIC_male
replace lp_LIC_male = lp_LIC_male[_n-1] if missing(lp_LIC_male)

gen lp_LMIC_male=learningpoverty_male if countrycode=="LMC"
sort lp_LMIC_male
replace lp_LMIC_male = lp_LMIC_male[_n-1] if missing(lp_LMIC_male)

gen lp_UMIC_male=learningpoverty_male if countrycode=="UMC"
sort lp_UMIC_male
replace lp_UMIC_male = lp_UMIC_male[_n-1] if missing(lp_UMIC_male)

gen lp_HIC_male=learningpoverty_male if countrycode=="HIC"
sort lp_HIC_male
replace lp_HIC_male = lp_HIC_male[_n-1] if missing(lp_HIC_male)

sort countrycode

drop region adminregion adminregionname incomelevelname lendingtype lendingtypename
order countrycode countryname income_group income_group world_region un_region

*** Drop aggregates and Tokelau, Mayotte and Netherlands Antilles

keep if income_group !=.
keep if age10_both2015!=.

save "$interim/Lost_Potential_Database_Before_Replacing_Missing.dta", replace


** First replace any missing gender by the total
replace learningpoverty_female=learningpoverty_both if learningpoverty_female==.
replace learningpoverty_male=learningpoverty_both if learningpoverty_male==.


*** We do it all for both, female and male - the gender is what is actually used in the later calculations though

*** For BOTH

gen lp_both_missing=.
gen lp_both_missing_type = "."
gen lp_both_missing_replace_both = .


** If missing

replace lp_both_missing=1 if learningpoverty_both==.
replace lp_both_missing=0 if learningpoverty_both!=.


** Only want to replace by regional and income average if there's 3 or more countries with data, so count the number of non missing

** Then we want the population weighted average when we do, (in this case population of 10 year olds) which means multiplying the learning poverty rate by the number of 10 year olds in 2020, adding those all up, and then dividing by the number of 10 year olds
forval i = 1/4 {
    forval j = 1/7 {
				egen c_learningpoverty_both_`i'_`j' = count(learningpoverty_both) if income_group==`i'&world_region==`j'
				
					gen lp_both_x_10_year_olds_`i'_`j' = learningpoverty_both*age10_both2020 if income_group==`i'&world_region==`j'&lp_both_missing==0
					egen tot_lp_both_x_10_year_olds_`i'_`j' = total(lp_both_x_10_year_olds_`i'_`j') if income_group==`i'&world_region==`j'&lp_both_missing==0
					egen tot_10_year_olds_both_`i'_`j' = total(age10_both2020) if income_group==`i'&world_region==`j'&lp_both_missing==0
					gen weight_lp_both_`i'_`j' = tot_lp_both_x_10_year_olds_`i'_`j' / tot_10_year_olds_both_`i'_`j' if income_group==`i'&world_region==`j'&lp_both_missing==0
					egen weighted_lp_both_`i'_`j' = mean(weight_lp_both_`i'_`j') if income_group==`i'&world_region==`j'
					}
				}




				
egen count_learningpoverty_both_nm= rowtotal(c_learningpoverty_both_*)





forval i = 1/4 {
    forval j = 1/7 {

replace lp_both_missing_type = "Income Group and Region" if lp_both_missing==1&count_learningpoverty_both_nm>=3&count_learningpoverty_both_nm!=.
replace lp_both_missing_type = "Income Group" if lp_both_missing==1&count_learningpoverty_both_nm<3

	}
}

** We use our own calculation for by income group and region

forval i = 1/4 {
    forval j = 1/7 {
	
replace learningpoverty_both = weighted_lp_both_`i'_`j' if income_group==`i'&world_region==`j'&lp_both_missing_type=="Income Group and Region"

	}
}

** We use the World Bank aggregate for by income group
replace learningpoverty_both = lp_LIC_both if income_group==1&lp_both_missing_type=="Income Group"
replace learningpoverty_both = lp_LMIC_both if income_group==2&lp_both_missing_type=="Income Group"
replace learningpoverty_both = lp_UMIC_both if income_group==3&lp_both_missing_type=="Income Group"
replace learningpoverty_both = lp_HIC_both if income_group==4&lp_both_missing_type=="Income Group"


replace lp_both_missing_replace_both = learningpoverty_both if lp_both_missing==1

*** For FEMALE

gen lp_female_missing=.
gen lp_female_missing_type = "."
gen lp_female_missing_replace_female = .


** If missing

replace lp_female_missing=1 if learningpoverty_female==.
replace lp_female_missing=0 if learningpoverty_female!=.


** Only want to replace by regional and income average if there's 3 or more countries with data, so count the number of non missing

** Then we want the population weighted average when we do, (in this case population of 10 year olds) which means multiplying the learning poverty rate by the number of 10 year olds in 2020, adding those all up, and then dividing by the number of 10 year olds
forval i = 1/4 {
    forval j = 1/7 {
				egen c_learningpoverty_female_`i'_`j' = count(learningpoverty_female) if income_group==`i'&world_region==`j'
				
					gen lp_female_x_10_year_olds_`i'_`j' = learningpoverty_female*age10_female2020 if income_group==`i'&world_region==`j'&lp_female_missing==0
					egen tot_lp_female_x_10_year_olds_`i'_`j' = total(lp_female_x_10_year_olds_`i'_`j') if income_group==`i'&world_region==`j'&lp_female_missing==0
					egen tot_10_year_olds_female_`i'_`j' = total(age10_female2020) if income_group==`i'&world_region==`j'&lp_female_missing==0
					gen weight_lp_female_`i'_`j' = tot_lp_female_x_10_year_olds_`i'_`j' / tot_10_year_olds_female_`i'_`j' if income_group==`i'&world_region==`j'&lp_female_missing==0
					egen weighted_lp_female_`i'_`j' = mean(weight_lp_female_`i'_`j') if income_group==`i'&world_region==`j'
					}
				}




				
egen count_learningpoverty_female_nm= rowtotal(c_learningpoverty_female_*)





forval i = 1/4 {
    forval j = 1/7 {

replace lp_female_missing_type = "Income Group and Region" if lp_female_missing==1&count_learningpoverty_female_nm>=3&count_learningpoverty_female_nm!=.
replace lp_female_missing_type = "Income Group" if lp_female_missing==1&count_learningpoverty_female_nm<3

	}
}



forval i = 1/4 {
    forval j = 1/7 {
	
replace learningpoverty_female = weighted_lp_female_`i'_`j' if income_group==`i'&world_region==`j'&lp_female_missing_type=="Income Group and Region"

	}
}

replace learningpoverty_female = lp_LIC_female if income_group==1&lp_female_missing_type=="Income Group"
replace learningpoverty_female = lp_LMIC_female if income_group==2&lp_female_missing_type=="Income Group"
replace learningpoverty_female = lp_UMIC_female if income_group==3&lp_female_missing_type=="Income Group"
replace learningpoverty_female = lp_HIC_female if income_group==4&lp_female_missing_type=="Income Group"


replace lp_female_missing_replace_female = learningpoverty_female if lp_female_missing==1
*** For MALE

gen lp_male_missing=.
gen lp_male_missing_type = "."
gen lp_male_missing_replace_male = .


** If missing

replace lp_male_missing=1 if learningpoverty_male==.
replace lp_male_missing=0 if learningpoverty_male!=.


** Only want to replace by regional and income average if there's 3 or more countries with data, so count the number of non missing

** Then we want the population weighted average when we do, (in this case population of 10 year olds) which means multiplying the learning poverty rate by the number of 10 year olds in 2020, adding those all up, and then dividing by the number of 10 year olds
forval i = 1/4 {
    forval j = 1/7 {
				egen c_learningpoverty_male_`i'_`j' = count(learningpoverty_male) if income_group==`i'&world_region==`j'
				
					gen lp_male_x_10_year_olds_`i'_`j' = learningpoverty_male*age10_male2020 if income_group==`i'&world_region==`j'&lp_male_missing==0
					egen tot_lp_male_x_10_year_olds_`i'_`j' = total(lp_male_x_10_year_olds_`i'_`j') if income_group==`i'&world_region==`j'&lp_male_missing==0
					egen tot_10_year_olds_male_`i'_`j' = total(age10_male2020) if income_group==`i'&world_region==`j'&lp_male_missing==0
					gen weight_lp_male_`i'_`j' = tot_lp_male_x_10_year_olds_`i'_`j' / tot_10_year_olds_male_`i'_`j' if income_group==`i'&world_region==`j'&lp_male_missing==0
					egen weighted_lp_male_`i'_`j' = mean(weight_lp_male_`i'_`j') if income_group==`i'&world_region==`j'
					}
				}




				
egen count_learningpoverty_male_nm= rowtotal(c_learningpoverty_male_*)





forval i = 1/4 {
    forval j = 1/7 {

replace lp_male_missing_type = "Income Group and Region" if lp_male_missing==1&count_learningpoverty_male_nm>=3&count_learningpoverty_male_nm!=.
replace lp_male_missing_type = "Income Group" if lp_male_missing==1&count_learningpoverty_male_nm<3

	}
}



forval i = 1/4 {
    forval j = 1/7 {
	
replace learningpoverty_male = weighted_lp_male_`i'_`j' if income_group==`i'&world_region==`j'&lp_male_missing_type=="Income Group and Region"

	}
}

replace learningpoverty_male = lp_LIC_male if income_group==1&lp_male_missing_type=="Income Group"
replace learningpoverty_male = lp_LMIC_male if income_group==2&lp_male_missing_type=="Income Group"
replace learningpoverty_male = lp_UMIC_male if income_group==3&lp_male_missing_type=="Income Group"
replace learningpoverty_male = lp_HIC_male if income_group==4&lp_male_missing_type=="Income Group"


replace lp_male_missing_replace_male = learningpoverty_male if lp_male_missing==1



/*

** Then replace by the income group average if no total by the gender
replace learningpoverty_female=lp_LIC_female if learningpoverty_female==. & income_group==1
replace learningpoverty_female=lp_LMIC_female if learningpoverty_female==. & income_group==2
replace learningpoverty_female=lp_UMIC_female if learningpoverty_female==. & income_group==3
replace learningpoverty_female=lp_HIC_female if learningpoverty_female==. & income_group==4

replace learningpoverty_male=lp_LIC_male if learningpoverty_male==. & income_group==1
replace learningpoverty_male=lp_LMIC_male if learningpoverty_male==. & income_group==2
replace learningpoverty_male=lp_UMIC_male if learningpoverty_male==. & income_group==3
replace learningpoverty_male=lp_HIC_male if learningpoverty_male==. & income_group==4
*/

save "$interim/Lost_Potential_Database_After_Replacing_Missing.dta", replace
