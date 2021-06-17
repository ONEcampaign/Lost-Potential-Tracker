
**************************************************
**************Calculating indicators**************
**************************************************


***************************PER YEAR********************************************
**Number of children everyday who reach age 10 and have lost potential**

use "$interim/Lost_Potential_Database_Scenarios_Before_Indicators.dta", clear

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen e_lostpotential_`x'_f=(age10_female`x'*e_lp_`x'_female)/365
gen e_lostpotential_`x'_m=(age10_male`x'*e_lp_`x'_male)/365
gen e_lostpotential_`x'_both=e_lostpotential_`x'_f+e_lostpotential_`x'_m
egen e_lost_sum_`x'_f=sum(e_lostpotential_`x'_f)
egen e_lost_sum_`x'_m=sum(e_lostpotential_`x'_m)
egen e_lost_sum_`x'_both=sum(e_lostpotential_`x'_both)
}
*

**Number of children everyday who reach age 10 and have their opportunity secured**


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {
gen e_learningrich_`x'_f=1-e_lp_`x'_female
gen e_learningrich_`x'_m=1-e_lp_`x'_male
}
*


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen e_oppsecured_`x'_f=(age10_female`x'*e_learningrich_`x'_f)/365
gen e_oppsecured_`x'_m=(age10_male`x'*e_learningrich_`x'_m)/365
gen e_oppsecured_`x'_both=e_oppsecured_`x'_f+e_oppsecured_`x'_m
egen e_sum_os_`x'_f=sum(e_oppsecured_`x'_f)
egen e_sum_os_`x'_m=sum(e_oppsecured_`x'_m)
egen e_sum_os_`x'_both=sum(e_oppsecured_`x'_both)
}
sort countrycode


save "$interim/Lost_Potential_Database_With_Indicators_Ending.dta", replace
