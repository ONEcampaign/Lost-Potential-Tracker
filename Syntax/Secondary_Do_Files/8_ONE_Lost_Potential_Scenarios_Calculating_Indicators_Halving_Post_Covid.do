
**************************************************
**************Calculating indicators**************
**************************************************


***************************PER YEAR********************************************
**Number of children everyday who reach age 10 and have lost potential**

use "$interim/Lost_Potential_Database_Scenarios_Before_Indicators_Covid.dta", clear

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen h_lostpotential_`x'_f_covid=(age10_female`x'*h_lp_`x'_femalecovid)/365
gen h_lostpotential_`x'_m_covid=(age10_male`x'*h_lp_`x'_malecovid)/365
gen h_lostpotential_`x'_both_covid=h_lostpotential_`x'_f_covid+h_lostpotential_`x'_m_covid
egen h_lost_sum_`x'_f_covid=sum(h_lostpotential_`x'_f_covid)
egen h_lost_sum_`x'_m_covid=sum(h_lostpotential_`x'_m_covid)
egen h_lost_sum_`x'_both_covid=sum(h_lostpotential_`x'_both_covid)
}
*

**Number of children everyday who reach age 10 and have their opportunity secured**


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {
gen h_learningrich_`x'_f_covid=1-h_lp_`x'_femalecovid
gen h_learningrich_`x'_m_covid=1-h_lp_`x'_malecovid
}
*


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen h_oppsecured_`x'_f_covid=(age10_female`x'*h_learningrich_`x'_f_covid)/365
gen h_oppsecured_`x'_m_covid=(age10_male`x'*h_learningrich_`x'_m_covid)/365
gen h_oppsecured_`x'_both_covid=h_oppsecured_`x'_f_covid+h_oppsecured_`x'_m_covid
egen h_sum_os_`x'_f_covid=sum(h_oppsecured_`x'_f_covid)
egen h_sum_os_`x'_m_covid=sum(h_oppsecured_`x'_m_covid)
egen h_sum_os_`x'_both_covid=sum(h_oppsecured_`x'_both_covid)
}
sort countrycode



save "$interim/Lost_Potential_Database_With_Indicators_Halving_Covid.dta", replace
