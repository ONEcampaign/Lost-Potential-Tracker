
**************************************************
**********Using UN Population Projections*********
**************************************************

/*

*NOTE: WE WANT FROM 2015-2030 

Data from: 
https://population.un.org/wpp/Download/Standard/Population/

--> Standard Projections (Estimates and Projection Variants)
--> Annual and Single Age Data
-->
Age composition	
Annual Population by Age - Both Sexes (XLSX, 33.99 MB)
Annual population by single age - Both Sexes. De facto population as of 1 July of the year indicated classified by single age (0, 1, 2, ..., 99, 100+). Data are presented in thousands.
Age composition	
Annual Population by Age - Male (XLSX, 33.02 MB)
Annual population by single age - Male. De facto population as of 1 July of the year indicated classified by single age (0, 1, 2, ..., 99, 100+). Data are presented in thousands.
Age composition	
Annual Population by Age - Female (XLSX, 33.02 MB)
Annual population by single age - Female. De facto population as of 1 July of the year indicated classified by single age (0, 1, 2, ..., 99, 100+). Data are presented in thousands.

Data comes with backwards looking 'Estimates' tab, forward looking 'Medium Variant' tab, and 'Notes' tab
* FOR 2015-2019
In 'Estimates' tab, delete rows 1-16, then set column I-DE to Number Format with 3 decimal places.
Save as CSV each for both sexes, male and female, with suffix _estimates_csv
* FOR 2020-2030
In 'Medium Variant' tab, delete rows 1-16, then set column I-DE to Number Format with 3 decimal places.
Save as CSV each for both sexes, male and female, with suffix _medium_variant_csv 
*/


import delimited "$rawdata\WPP2019_INT_F03_1_POPULATION_BY_AGE_ANNUAL_BOTH_SEXES_estimates_csv.csv", clear

rename	v19	age10



rename regionsubregioncountryorarea country_area
rename referencedateasof1july ref_date

keep if ref_date>=2015
keep if ref_date<=2020
replace age10="" if age10=="..."
destring age10, replace

*** Just keeping age 10

keep country_area countrycode ref_date age10
rename country_area country
rename countrycode countrycode
rename ref_date year


tostring year, replace
rename age10 age10_both
reshape wide age10_both , i(country) j( year ) string
sort country 
save "$interim\UN_10_yr_olds_2015_2020_both_estim.dta", replace


***************************MEDIAN VARIANT********************************************************************
***************************BOTH SEXES************************************************************************
*************************************************************************************************************
import delimited "$rawdata\WPP2019_INT_F03_1_POPULATION_BY_AGE_ANNUAL_BOTH_SEXES_medium_variant_csv.csv", clear

rename	v19	age10



rename regionsubregioncountryorarea country_area
rename referencedateasof1july ref_date

keep if ref_date>=2021
keep if ref_date<=2030
replace age10="" if age10=="..."
destring age10, replace

*** Just keeping age 10

keep country_area countrycode ref_date age10
rename country_area country
rename countrycode countrycode
rename ref_date year


tostring year, replace
rename age10 age10_both
reshape wide age10_both , i(country) j( year ) string
sort country 
save "$interim\\UN_10_yr_olds_2021_2030_both_medium.dta", replace

************************** Estimates********************************************************************
***************************MALE************************************************************************
*************************************************************************************************************
import delimited "$rawdata\WPP2019_INT_F03_2_POPULATION_BY_AGE_ANNUAL_MALE_estimates_csv.csv", clear 

rename	v19	age10



rename regionsubregioncountryorarea country_area
rename referencedateasof1july ref_date

keep if ref_date>=2015
keep if ref_date<=2020
replace age10="" if age10=="..."
destring age10, replace

** Just keeping 10

keep country_area countrycode ref_date age10
rename country_area country
rename countrycode countrycode
rename ref_date year


tostring year, replace
rename age10 age10_male
reshape wide age10_male , i(country) j( year ) string
sort country 
save "$interim\\UN_10_yr_olds_2015_2020_male_estim.dta", replace



***************************MEDIAN VARIANT********************************************************************
***************************MALE SEXES************************************************************************
*************************************************************************************************************
import delimited "$rawdata\WPP2019_INT_F03_2_POPULATION_BY_AGE_ANNUAL_MALE_medium_variant_csv.csv", clear 

rename	v19	age10



rename regionsubregioncountryorarea country_area
rename referencedateasof1july ref_date

keep if ref_date>=2021
keep if ref_date<=2030
replace age10="" if age10=="..."
destring age10, replace

** Just keeping 10

keep country_area countrycode ref_date age10
rename country_area country
rename countrycode countrycode
rename ref_date year


tostring year, replace
rename age10 age10_male
reshape wide age10_male , i(country) j( year ) string
sort country 
save "$interim\\UN_10_yr_olds_2021_2030_male_medium.dta", replace

***************************MEDIUM VARIANT********************************************************************
***************************FEMALE SEXES************************************************************************
*************************************************************************************************************
import delimited "$rawdata\WPP2019_INT_F03_3_POPULATION_BY_AGE_ANNUAL_FEMALE_estimates_csv.csv", clear

rename	v19	age10



rename regionsubregioncountryorarea country_area
rename referencedateasof1july ref_date

keep if ref_date>=2015
keep if ref_date<=2020
replace age10="" if age10=="..."
destring age10, replace

** Just keeping 10

keep country_area countrycode ref_date age10
rename country_area country
rename countrycode countrycode
rename ref_date year


tostring year, replace
rename age10 age10_female
reshape wide age10_female , i(country) j( year ) string
sort country 
save "$interim\UN_10_yr_olds_2015_2020_female_estim.dta", replace

***************************Estimates********************************************************************
***************************FEMALE SEXES************************************************************************
*************************************************************************************************************
import delimited "$rawdata\WPP2019_INT_F03_3_POPULATION_BY_AGE_ANNUAL_FEMALE_medium_variant_csv.csv", clear 

rename	v19	age10



rename regionsubregioncountryorarea country_area
rename referencedateasof1july ref_date

keep if ref_date>=2021
keep if ref_date<=2030
replace age10="" if age10=="..."
destring age10, replace



keep country_area countrycode ref_date age10
rename country_area country
rename countrycode countrycode
rename ref_date year


tostring year, replace
rename age10 age10_female
reshape wide age10_female , i(country) j( year ) string
sort country 
save "$interim\UN_10_yr_olds_2021_2030_female_medium.dta", replace

******************



*** How many 14-17 year olds 

clear

import delimited "$rawdata\WPP2019_INT_F03_1_POPULATION_BY_AGE_ANNUAL_BOTH_SEXES_estimates_csv.csv", clear

rename v13 age4
rename v14 age5
rename v15 age6
rename v16 age7
rename v17 age8
rename v18 age9
rename v19 age10
rename v20 age11
rename v21 age12
rename v22 age13
rename v23 age14
rename v24 age15
rename v25 age16
rename v26 age17

rename regionsubregioncountryorarea country_area
rename referencedateasof1july ref_date

keep if ref_date==2020

local laysaged age4 age5 age6 age7 age8 age9 age10 age11 age12 age13 age14 age15 age16 age17 

	foreach x of local laysaged {
	
	replace `x'="" if `x'=="..."
	destring `x', replace

	}
*	


*** Just keeping age 4-17


rename country_area country
rename countrycode countrycode
rename ref_date year

egen LAYSagedin2020 = rowtotal(age4 age5 age6 age7 age8 age9 age10 age11 age12 age13 age14 age15 age16 age17)

keep country countrycode year LAYSagedin2020 

tostring year, replace
reshape wide LAYSagedin2020, i(country) j( year ) string
rename LAYSagedin20202020 LAYSagedin2020
sort country 
save "$interim\UN_LAYSaged_in_2020.dta", replace


clear

*** How many 18-65 year olds 

clear

import delimited "$rawdata\WPP2019_INT_F03_1_POPULATION_BY_AGE_ANNUAL_BOTH_SEXES_estimates_csv.csv", clear



rename regionsubregioncountryorarea country_area
rename referencedateasof1july ref_date

keep if ref_date==2020

local workforceaged v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 v47 v48 v49 v50 v51 v52 v53 v54 v55 v56 v57 v58 v59 v60 v61 v62 v63 v64 v65 v66 v67 v68 v69 v70 v71 v72 v73 v74 
 
 

	foreach y of local workforceaged {
	
	replace `y'="" if `y'=="..."
	destring `y', replace

	}
*	


*** Just keeping age 18-65


rename country_area country
rename countrycode countrycode
rename ref_date year


egen workforceagedin2020 = rowtotal(v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 v47 v48 v49 v50 v51 v52 v53 v54 v55 v56 v57 v58 v59 v60 v61 v62 v63 v64 v65 v66 v67 v68 v69 v70 v71 v72 v73 v74 )


keep country countrycode year  workforceagedin2020

tostring year, replace
reshape wide workforceagedin2020, i(country) j( year ) string
rename workforceagedin20202020 workforceagedin2020
sort country 
save "$interim\UN_workforceaged_in_2020.dta", replace


clear

import delimited "$rawdata\WPP2019_INT_F03_3_POPULATION_BY_AGE_ANNUAL_FEMALE_estimates_csv.csv", clear

rename v13 age4
rename v14 age5
rename v15 age6
rename v16 age7
rename v17 age8
rename v18 age9
rename v19 age10
rename v20 age11
rename v21 age12
rename v22 age13
rename v23 age14
rename v24 age15
rename v25 age16
rename v26 age17

rename regionsubregioncountryorarea country_area
rename referencedateasof1july ref_date

keep if ref_date==2020

local laysaged age4 age5 age6 age7 age8 age9 age10 age11 age12 age13 age14 age15 age16 age17 

	foreach x of local laysaged {
	
	replace `x'="" if `x'=="..."
	destring `x', replace

	}
*	



*** Just keeping age 4-17


rename country_area country
rename countrycode countrycode
rename ref_date year

egen LAYSagedin2020female = rowtotal(age4 age5 age6 age7 age8 age9 age10 age11 age12 age13 age14 age15 age16 age17)

keep country countrycode year LAYSagedin2020female

tostring year, replace
reshape wide LAYSagedin2020female, i(country) j( year ) string
rename LAYSagedin2020female2020 LAYSagedin2020female
sort country 
save "$interim\UN_LAYSaged_in_2020_female.dta", replace


clear

import delimited "$rawdata\WPP2019_INT_F03_2_POPULATION_BY_AGE_ANNUAL_MALE_estimates_csv.csv", clear

rename v13 age4
rename v14 age5
rename v15 age6
rename v16 age7
rename v17 age8
rename v18 age9
rename v19 age10
rename v20 age11
rename v21 age12
rename v22 age13
rename v23 age14
rename v24 age15
rename v25 age16
rename v26 age17

rename regionsubregioncountryorarea country_area
rename referencedateasof1july ref_date

keep if ref_date==2020

local laysaged age4 age5 age6 age7 age8 age9 age10 age11 age12 age13 age14 age15 age16 age17 

	foreach x of local laysaged {
	
	replace `x'="" if `x'=="..."
	destring `x', replace

	}
*	



*** Just keeping age 4-17


rename country_area country
rename countrycode countrycode
rename ref_date year

egen LAYSagedin2020male = rowtotal(age4 age5 age6 age7 age8 age9 age10 age11 age12 age13 age14 age15 age16 age17)

keep country countrycode year LAYSagedin2020male

tostring year, replace
reshape wide LAYSagedin2020male, i(country) j( year ) string
rename LAYSagedin2020male2020 LAYSagedin2020male
sort country 
save "$interim\UN_LAYSaged_in_2020_male.dta", replace


***** total population


clear

import delimited "$rawdata\WPP2019_INT_F03_1_POPULATION_BY_AGE_ANNUAL_BOTH_SEXES_estimates_csv.csv", clear


rename regionsubregioncountryorarea country_area
rename referencedateasof1july ref_date

keep if ref_date==2020

local populationaged v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 v47 v48 v49 v50 v51 v52 v53 v54 v55 v56 v57 v58 v59 v60 v61 v62 v63 v64 v65 v66 v67 v68 v69 v70 v71 v72 v73 v74 v75 v76 v77 v78 v79 v80 v81 v82 v83 v84 v85 v86 v87 v88 v89 v90 v91 v92 v93 v94 v95 v96 v97 v98 v99 v100 v101 v102 v103 v104 v105 v106 v107 v108 v109


	foreach x of local populationaged {
	
	replace `x'="" if `x'=="..."
	destring `x', replace

	}
*	



*** Just keeping age 4-17


rename country_area country
rename countrycode countrycode
rename ref_date year

egen population_in_2020 = rowtotal(v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 v47 v48 v49 v50 v51 v52 v53 v54 v55 v56 v57 v58 v59 v60 v61 v62 v63 v64 v65 v66 v67 v68 v69 v70 v71 v72 v73 v74 v75 v76 v77 v78 v79 v80 v81 v82 v83 v84 v85 v86 v87 v88 v89 v90 v91 v92 v93 v94 v95 v96 v97 v98 v99 v100 v101 v102 v103 v104 v105 v106 v107 v108 v109)

keep country countrycode year population_in_2020

tostring year, replace
reshape wide population_in_2020, i(country) j( year ) string
rename population_in_20202020 population_in_2020
sort country 
save "$interim\UN_total_population_in_2020.dta", replace

***



use "$interim\UN_10_yr_olds_2015_2020_both_estim.dta", clear
merge 1:1 country using "$interim\UN_10_yr_olds_2021_2030_both_medium.dta"
sort country
drop _merge
merge 1:1 country using "$interim\UN_10_yr_olds_2015_2020_female_estim.dta"
sort country
drop _merge

merge 1:1 country using "$interim\\UN_10_yr_olds_2021_2030_female_medium.dta"
sort country
drop _merge

merge 1:1 country using "$interim\\UN_10_yr_olds_2015_2020_male_estim.dta"
sort country
drop _merge

merge 1:1 country using "$interim\UN_10_yr_olds_2021_2030_male_medium.dta"
sort country
drop _merge


merge 1:1 country using "$interim\UN_workforceaged_in_2020.dta"
sort country
drop _merge


merge 1:1 country using "$interim\UN_LAYSaged_in_2020.dta"
sort country
drop _merge

merge 1:1 country using "$interim\UN_LAYSaged_in_2020_female.dta"
sort country
drop _merge


merge 1:1 country using "$interim\UN_LAYSaged_in_2020_male.dta"
sort country
drop _merge


merge 1:1 country using "$interim\UN_total_population_in_2020.dta"
sort country
drop _merge



** As we are basing on the World Bank datasets, we convert the UN country code to world bank codes

kountry countrycode , from(iso3n) to(iso3c) geo(undet)
tab GEO
rename GEO GEO_un
kountry countrycode, from(iso3n)
sort NAMES_STD	



rename country CountryName
replace  CountryName="Least developed countries: UN classification	"	if CountryName=="Least developed countries"
replace  CountryName="Lower middle income"	if CountryName=="Lower-middle-income countries"
replace  CountryName="Middle income"	if CountryName=="Middle-income countries"
replace  CountryName="Upper middle income"	if CountryName=="Upper-middle-income countries"
replace  CountryName="World"	if CountryName=="WORLD"
replace  CountryName="Sub-Saharan Africa"	if CountryName=="SUB-SAHARAN AFRICA"
replace  CountryName="High income"	if CountryName=="High-income countries"
replace  CountryName="Low income"	if CountryName=="Low-income countries"


replace _ISO3C_="LIC" if CountryName=="Low income"
replace _ISO3C_="LMC" if CountryName=="Lower middle income"
replace _ISO3C_="MIC" if CountryName=="Middle income"
replace _ISO3C_="UMC" if CountryName=="Upper middle income"	
replace _ISO3C_="HIC" if CountryName=="High income"

replace _ISO3C_="LIC" if CountryName=="Low income"
replace _ISO3C_="LMC" if CountryName=="Lower middle income"
replace _ISO3C_="MIC" if CountryName=="Middle income"
replace _ISO3C_="UMC" if CountryName=="Upper middle income"	
replace _ISO3C_="HIC" if CountryName=="High income"
replace _ISO3C_="LCN" if CountryName=="Latin America and the Caribbean"

replace CountryName=trim(CountryName)
replace CountryName =proper(CountryName)
replace _ISO3C_="BMU" if CountryName=="Bermuda"
replace _ISO3C_="CUW" if CountryName=="CuraçAo"
replace _ISO3C_ ="DMA" if CountryName=="Dominica"
replace _ISO3C_ ="GIB" if CountryName=="Gibraltar"
replace _ISO3C_ ="KNA" if CountryName=="St. Kitts and Nevis"
replace _ISO3C_ ="LIE" if CountryName=="Liechtenstein"
replace _ISO3C_ ="MHL" if CountryName=="Marshall Islands"
replace _ISO3C_ ="MNE" if CountryName=="Montenegro"
replace _ISO3C_ ="NRU" if CountryName=="Nauru"
replace _ISO3C_ ="PLW" if CountryName=="Palau"
replace _ISO3C_ ="RUS" if CountryName=="Russian Federation"
replace _ISO3C_ ="SDN" if CountryName=="Sudan"
replace _ISO3C_ ="SMR" if CountryName=="San Marino"
replace _ISO3C_ ="SRB" if CountryName=="Serbia"
replace _ISO3C_ ="SSD" if CountryName=="South Sudan"
replace _ISO3C_ ="SXM" if CountryName=="Saint Maarten (Dutch part)"
replace _ISO3C_ ="TUV" if CountryName=="Tuvalu"
replace _ISO3C_ ="TZA" if CountryName=="United Republic Of Tanzania"
replace _ISO3C_ ="VGB" if CountryName=="British Virgin Islands"



drop countrycode
rename _ISO3C_ countrycode
sort countrycode
rename CountryName CountryName_UN
drop if countrycode==""
drop CountryName_UN NAMES_STD 
order countrycode

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {
replace age10_both`x' = age10_both`x'*1000
replace age10_female`x' = age10_female`x'*1000
replace age10_male`x' = age10_male`x'*1000
 
}
*
replace population_in_2020 = population_in_2020*1000

replace workforceagedin2020 = workforceagedin2020*1000


replace LAYSagedin2020 = LAYSagedin2020*1000


replace LAYSagedin2020female = LAYSagedin2020female*1000

replace LAYSagedin2020male = LAYSagedin2020male*1000

rename LAYSagedin2020 lays_aged_in_2020
rename LAYSagedin2020female lays_aged_in_2020_female
rename LAYSagedin2020male lays_aged_in_2020_male
rename workforceagedin2020 workforce_aged_in_2020


format %15.0f workforce_aged_in_2020 lays_aged_in_2020  lays_aged_in_2020_female lays_aged_in_2020_male population_in_2020 
save "$interim/pop_10yrs.dta", replace




