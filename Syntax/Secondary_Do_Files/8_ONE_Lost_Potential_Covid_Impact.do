
**************************************************
**************Covid Impact ***********************
**************************************************

** Using the World Bank Paper 'Learning Poverty: Measures and Simulations, João Pedro Azevedo, 2020'

* Usign table in the Annex 'Table A.1 COVID-19 learning poverty simulations'

use "$interim/Lost_Potential_Database_With_Indicators.dta", clear

gen learningpoverty_femalecovid=.
gen learningpoverty_malecovid=.


* All countries, learning poverty gap, intermediate simulation, by income group and as a secondary option region
foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen learningpoverty_femalecovid_`x'=.
gen learningpoverty_malecovid_`x'=.

}
*
foreach x in 2015	2016	2017	2018	2019 {

replace learningpoverty_femalecovid_`x'=learningpoverty_female_`x'
replace learningpoverty_malecovid_`x'=learningpoverty_male_`x'

}


*
* by income - star this out if using by region below instead

** This gives the following estimates:
** Low income impact = 91.6-89.5= 2.1%
** Low-Middle impact = 65.1-55.8 = 9.3%
** Upper-Middle impact = 34.0-30.3 = 3.7%
** High income impact = 11.5-9.1 = 2.4%

*** Medium Covid Impact
/*

replace learningpoverty_femalecovid = learningpoverty_female + (0.021) if income_group==1
replace learningpoverty_femalecovid = learningpoverty_female + (0.093) if income_group==2
replace learningpoverty_femalecovid = learningpoverty_female + (0.037) if income_group==3
replace learningpoverty_femalecovid = learningpoverty_female + (0.024) if income_group==4

replace learningpoverty_malecovid = learningpoverty_male + (0.021) if income_group==1
replace learningpoverty_malecovid = learningpoverty_male + (0.093) if income_group==2
replace learningpoverty_malecovid = learningpoverty_male + (0.037) if income_group==3
replace learningpoverty_malecovid = learningpoverty_male + (0.024) if income_group==4
*/

*** Pessimistic Covid Impact

replace learningpoverty_femalecovid = learningpoverty_female + (0.029) if income_group==1
replace learningpoverty_femalecovid = learningpoverty_female + (0.136) if income_group==2
replace learningpoverty_femalecovid = learningpoverty_female + (0.058) if income_group==3
replace learningpoverty_femalecovid = learningpoverty_female + (0.044) if income_group==4

replace learningpoverty_malecovid = learningpoverty_male + (0.029) if income_group==1
replace learningpoverty_malecovid = learningpoverty_male + (0.136) if income_group==2
replace learningpoverty_malecovid = learningpoverty_male + (0.058) if income_group==3
replace learningpoverty_malecovid = learningpoverty_male + (0.044) if income_group==4

*** Medium Covid Impact
/*


foreach x in 2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

replace learningpoverty_femalecovid_`x' = learningpoverty_female_`x' + (0.021) if income_group==1
replace learningpoverty_femalecovid_`x' = learningpoverty_female_`x' + (0.093) if income_group==2
replace learningpoverty_femalecovid_`x' = learningpoverty_female_`x' + (0.037) if income_group==3
replace learningpoverty_femalecovid_`x' = learningpoverty_female_`x' + (0.024) if income_group==4

replace learningpoverty_malecovid_`x' = learningpoverty_male_`x' + (0.021) if income_group==1
replace learningpoverty_malecovid_`x' = learningpoverty_male_`x' + (0.093) if income_group==2
replace learningpoverty_malecovid_`x' = learningpoverty_male_`x' + (0.037) if income_group==3
replace learningpoverty_malecovid_`x' = learningpoverty_male_`x' + (0.024) if income_group==4

}

*/



*** Pessimistic Covid Impact

foreach x in 2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

replace learningpoverty_femalecovid_`x' = learningpoverty_female_`x' + (0.029) if income_group==1
replace learningpoverty_femalecovid_`x' = learningpoverty_female_`x' + (0.136) if income_group==2
replace learningpoverty_femalecovid_`x' = learningpoverty_female_`x' + (0.058) if income_group==3
replace learningpoverty_femalecovid_`x' = learningpoverty_female_`x' + (0.044) if income_group==4

replace learningpoverty_malecovid_`x' = learningpoverty_male_`x' + (0.029) if income_group==1
replace learningpoverty_malecovid_`x' = learningpoverty_male_`x' + (0.136) if income_group==2
replace learningpoverty_malecovid_`x' = learningpoverty_male_`x' + (0.058) if income_group==3
replace learningpoverty_malecovid_`x' = learningpoverty_male_`x' + (0.044) if income_group==4

}
*
/* 
by region - medium covid impact

EAP		24.6	19.8	4.8
ECA		10.7	8.8		1.9
LAC		58.0	50.8	7.2
MENA	63.1	58.7	4.4
NA		8.3		7.6		0.7
SA		70.0	58.2	11.8
SSA		89.8	86.7	3.1

replace learningpoverty_femalecovid = learningpoverty_female + (0.048) if world_region==1
replace learningpoverty_femalecovid = learningpoverty_female + (0.019) if world_region==2
replace learningpoverty_femalecovid = learningpoverty_female + (0.072) if world_region==3
replace learningpoverty_femalecovid = learningpoverty_female + (0.044) if world_region==4
replace learningpoverty_femalecovid = learningpoverty_female + (0.007) if world_region==5
replace learningpoverty_femalecovid = learningpoverty_female + (0.118) if world_region==6
replace learningpoverty_femalecovid = learningpoverty_female + (0.031) if world_region==7

replace learningpoverty_malecovid = learningpoverty_male + (0.048) if world_region==1
replace learningpoverty_malecovid = learningpoverty_male + (0.019) if world_region==2
replace learningpoverty_malecovid = learningpoverty_male + (0.072) if world_region==3
replace learningpoverty_malecovid = learningpoverty_male + (0.044) if world_region==4
replace learningpoverty_malecovid = learningpoverty_male + (0.007) if world_region==5
replace learningpoverty_malecovid = learningpoverty_male + (0.118) if world_region==6
replace learningpoverty_malecovid = learningpoverty_male + (0.031) if world_region==7

*/


save "$interim/Lost_Potential_Database_Before_Indicators_Covid.dta", replace













