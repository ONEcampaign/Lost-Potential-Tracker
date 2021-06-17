
**************************************************
**************Calculating indicators**************
**************************************************


***************************PER YEAR********************************************
**Number of children everyday who reach age 10 and have lost potential**

use "$interim/Lost_Potential_Database_Scenarios_Before_Indicators_Covid.dta", clear

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen e_lostpotential_`x'_f_covid=(age10_female`x'*e_lp_`x'_femalecovid)/365
gen e_lostpotential_`x'_m_covid=(age10_male`x'*e_lp_`x'_malecovid)/365
gen e_lostpotential_`x'_both_covid=e_lostpotential_`x'_f_covid+e_lostpotential_`x'_m_covid
egen e_lost_sum_`x'_f_covid=sum(e_lostpotential_`x'_f_covid)
egen e_lost_sum_`x'_m_covid=sum(e_lostpotential_`x'_m_covid)
egen e_lost_sum_`x'_both_covid=sum(e_lostpotential_`x'_both_covid)
}
*

**Number of children everyday who reach age 10 and have their opportunity secured**


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {
gen e_learningrich_`x'_f_covid=1-e_lp_`x'_femalecovid
gen e_learningrich_`x'_m_covid=1-e_lp_`x'_malecovid
}
*


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen e_oppsecured_`x'_f_covid=(age10_female`x'*e_learningrich_`x'_f_covid)/365
gen e_oppsecured_`x'_m_covid=(age10_male`x'*e_learningrich_`x'_m_covid)/365
gen e_oppsecured_`x'_both_covid=e_oppsecured_`x'_f_covid+e_oppsecured_`x'_m_covid
egen e_sum_os_`x'_f_covid=sum(e_oppsecured_`x'_f_covid)
egen e_sum_os_`x'_m_covid=sum(e_oppsecured_`x'_m_covid)
egen e_sum_os_`x'_both_covid=sum(e_oppsecured_`x'_both_covid)
}
sort countrycode


save "$interim/Lost_Potential_Database_With_Indicators_Ending_Covid.dta", replace
