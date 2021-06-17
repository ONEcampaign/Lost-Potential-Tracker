***************************************************
**Scenarios - Halving and Ending Learning Poverty**
***************************************************
set more off
use "$interim/Lost_Potential_Database_With_Indicators.dta", clear

gen target_h_lp_female = learningpoverty_female/2
gen target_h_lp_male = learningpoverty_male/2
gen target_e_lp_female = 0
gen target_e_lp_male = 0


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen h_lp_`x'_female = .
replace h_lp_`x'_female = learningpoverty_female+(((target_h_lp_female-learningpoverty_female))/((2030-2015)/(`x'-2015)))
replace h_lp_`x'_female = learningpoverty_female if `x'==2015

gen h_lp_`x'_male = .
replace h_lp_`x'_male = learningpoverty_male+(((target_h_lp_male-learningpoverty_male))/((2030-2015)/(`x'-2015)))
replace h_lp_`x'_male = learningpoverty_male if `x'==2015

gen e_lp_`x'_female = .
replace e_lp_`x'_female = learningpoverty_female+(((target_e_lp_female-learningpoverty_female))/((2030-2015)/(`x'-2015)))
replace e_lp_`x'_female = learningpoverty_female if `x'==2015

gen e_lp_`x'_male = .
replace e_lp_`x'_male = learningpoverty_male+(((target_e_lp_male-learningpoverty_male))/((2030-2015)/(`x'-2015)))
replace e_lp_`x'_male = learningpoverty_male if `x'==2015

}
*


save "$interim/Lost_Potential_Database_Scenarios_Before_Indicators.dta", replace
