
***************************************************
**************Outputting Combined Tables Simplified *******************
**************************************************



*** Lost Potential 
set more off

use "$interim/Lost_Potential_Database_With_Indicators.dta", clear

putexcel set "$outputs\Tables_Combined_Simplified.xlsx", sheet(1. LP BAU) replace

putexcel A5 = ("Female")
putexcel A6 = ("Male")

sum lost_sum_2015_f
return list
putexcel B4 = (2015)
putexcel B5 = (`r(mean)')

sum lost_sum_2016_f
return list
putexcel C4 = (2016)
putexcel C5 = (`r(mean)')

sum lost_sum_2017_f
return list
putexcel D4 = (2017)
putexcel D5 = (`r(mean)')

sum lost_sum_2018_f
return list
putexcel E4 = (2018)
putexcel E5 = (`r(mean)')

sum lost_sum_2019_f
return list
putexcel F4 = (2019)
putexcel F5 = (`r(mean)')

sum lost_sum_2020_f
return list
putexcel G4 = (2020)
putexcel G5 = (`r(mean)')

sum lost_sum_2021_f
return list
putexcel H4 = (2021)
putexcel H5 = (`r(mean)')

sum lost_sum_2022_f
return list
putexcel I4 = (2022)
putexcel I5 = (`r(mean)')

sum lost_sum_2023_f
return list
putexcel J4 = (2023)
putexcel J5 = (`r(mean)')

sum lost_sum_2024_f
return list
putexcel K4 = (2024)
putexcel K5 = (`r(mean)')

sum lost_sum_2025_f
return list
putexcel L4 = (2025)
putexcel L5 = (`r(mean)')

sum lost_sum_2026_f
return list
putexcel M4 = (2026)
putexcel M5 = (`r(mean)')

sum lost_sum_2027_f
return list
putexcel N4 = (2027)
putexcel N5 = (`r(mean)')

sum lost_sum_2028_f
return list
putexcel O4 = (2028)
putexcel O5 = (`r(mean)')

sum lost_sum_2029_f
return list
putexcel P4 = (2029)
putexcel P5 = (`r(mean)')

sum lost_sum_2030_f
return list
putexcel Q4 = (2030)
putexcel Q5 = (`r(mean)')




sum lost_sum_2015_m
return list
putexcel B6 = (`r(mean)')

sum lost_sum_2016_m
return list
putexcel C6 = (`r(mean)')


sum lost_sum_2017_m
return list
putexcel D6  = (`r(mean)')


sum lost_sum_2018_m
return list
putexcel E6 = (`r(mean)')


sum lost_sum_2019_m
return list
putexcel F6 = (`r(mean)')

sum lost_sum_2020_m
return list
putexcel G6 = (`r(mean)')

sum lost_sum_2021_m
return list
putexcel H6 = (`r(mean)')

sum lost_sum_2022_m
return list
putexcel I6 = (`r(mean)')

sum lost_sum_2023_m
return list
putexcel J6 = (`r(mean)')

sum lost_sum_2024_m
return list
putexcel K6 = (`r(mean)')

sum lost_sum_2025_m
return list
putexcel L6 = (`r(mean)')

sum lost_sum_2026_m
return list
putexcel M6 = (`r(mean)')


sum lost_sum_2027_m
return list
putexcel N6 = (`r(mean)')

sum lost_sum_2028_m
return list
putexcel O6 = (`r(mean)')

sum lost_sum_2029_m
return list
putexcel P6 = (`r(mean)')

sum lost_sum_2030_m
return list
putexcel Q6 = (`r(mean)')


putexcel A7 = ("Both")
putexcel B7= formula(=(B5+B6))
putexcel C7= formula(=(C5+C6))
putexcel D7= formula(=(D5+D6))
putexcel E7= formula(=(E5+E6))
putexcel F7= formula(=(F5+F6))
putexcel G7= formula(=(G5+G6))
putexcel H7= formula(=(H5+H6))
putexcel I7= formula(=(I5+I6))
putexcel J7= formula(=(J5+J6))
putexcel K7= formula(=(K5+K6))
putexcel L7= formula(=(L5+L6))
putexcel M7= formula(=(M5+M6))
putexcel N7= formula(=(N5+N6))
putexcel O7= formula(=(O5+O6))
putexcel P7= formula(=(P5+P6))
putexcel Q7= formula(=(Q5+Q6))



foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen LIC_`x'_f=total(lostpotential_`x'_f) if income_group==1
egen LIC_`x'_m=total(lostpotential_`x'_m) if income_group==1
egen LMIC_`x'_f=total(lostpotential_`x'_f) if income_group==2
egen LMIC_`x'_m=total(lostpotential_`x'_m) if income_group==2
egen UMIC_`x'_f=total(lostpotential_`x'_f) if income_group==3
egen UMIC_`x'_m=total(lostpotential_`x'_m) if income_group==3
egen HIC_`x'_f=total(lostpotential_`x'_f) if income_group==4
egen HIC_`x'_m=total(lostpotential_`x'_m) if income_group==4

}
*

****Income table******

**** Low Income
putexcel A10= ("Low Income")
putexcel A11= ("Female")
tabstat LIC_2015_f LIC_2016_f LIC_2017_f LIC_2018_f LIC_2019_f LIC_2020_f  LIC_2021_f LIC_2022_f LIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B11= matrix(results)
tabstat LIC_2024_f LIC_2025_f LIC_2026_f LIC_2027_f LIC_2028_f LIC_2029_f  LIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K11= matrix(results)
putexcel A12= ("Male")
tabstat LIC_2015_m LIC_2016_m LIC_2017_m LIC_2018_m LIC_2019_m LIC_2020_m  LIC_2021_m LIC_2022_m LIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B12= matrix(results)
tabstat LIC_2024_m LIC_2025_m LIC_2026_m LIC_2027_m LIC_2028_m LIC_2029_m  LIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K12= matrix(results)
putexcel A13= ("Both")
putexcel B13= formula(=(B11+B12))
putexcel C13= formula(=(C11+C12))
putexcel D13= formula(=(D11+D12))
putexcel E13= formula(=(E11+E12))
putexcel F13= formula(=(F11+F12))
putexcel G13= formula(=(G11+G12))
putexcel H13= formula(=(H11+H12))
putexcel I13= formula(=(I11+I12))
putexcel J13= formula(=(J11+J12))
putexcel K13= formula(=(K11+K12))
putexcel L13= formula(=(L11+L12))
putexcel M13= formula(=(M11+M12))
putexcel N13= formula(=(N11+N12))
putexcel O13= formula(=(O11+O12))
putexcel P13= formula(=(P11+P12))
putexcel Q13= formula(=(Q11+Q12))

*****Low_middle Income
putexcel A15= ("Lower-Middle Income")
putexcel A16= ("Female")
tabstat LMIC_2015_f LMIC_2016_f LMIC_2017_f LMIC_2018_f LMIC_2019_f LMIC_2020_f  LMIC_2021_f LMIC_2022_f LMIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B16= matrix(results)
tabstat LMIC_2024_f LMIC_2025_f LMIC_2026_f LMIC_2027_f LMIC_2028_f LMIC_2029_f  LMIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K16= matrix(results)
putexcel A17= ("Male")
tabstat LMIC_2015_m LMIC_2016_m LMIC_2017_m LMIC_2018_m LMIC_2019_m LMIC_2020_m  LMIC_2021_m LMIC_2022_m LMIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B17= matrix(results)
tabstat LMIC_2024_m LMIC_2025_m LMIC_2026_m LMIC_2027_m LMIC_2028_m LMIC_2029_m  LMIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K17= matrix(results)
putexcel A18= ("Both")
putexcel B18= formula(=(B17+B16))
putexcel C18= formula(=(C17+C16))
putexcel D18= formula(=(D17+D16))
putexcel E18= formula(=(E17+E16))
putexcel F18= formula(=(F17+F16))
putexcel G18= formula(=(G17+G16))
putexcel H18= formula(=(H17+H16))
putexcel I18= formula(=(I17+I16))
putexcel J18= formula(=(J17+J16))
putexcel K18= formula(=(K17+K16))
putexcel L18= formula(=(L17+L16))
putexcel M18= formula(=(M17+M16))
putexcel N18= formula(=(N17+N16))
putexcel O18= formula(=(O17+O16))
putexcel P18= formula(=(P17+P16))
putexcel Q18= formula(=(Q17+Q16))

**********************Upper Middle Income
putexcel A20= ("Upper-Middle Income")
putexcel A21= ("Female")
tabstat UMIC_2015_f UMIC_2016_f UMIC_2017_f UMIC_2018_f UMIC_2019_f UMIC_2020_f  UMIC_2021_f UMIC_2022_f UMIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B21= matrix(results)
tabstat UMIC_2024_f UMIC_2025_f UMIC_2026_f UMIC_2027_f UMIC_2028_f UMIC_2029_f  UMIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K21= matrix(results)
putexcel A22= ("Male")
tabstat UMIC_2015_m UMIC_2016_m UMIC_2017_m UMIC_2018_m UMIC_2019_m UMIC_2020_m  UMIC_2021_m UMIC_2022_m UMIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B22= matrix(results)
tabstat UMIC_2024_m UMIC_2025_m UMIC_2026_m UMIC_2027_m UMIC_2028_m UMIC_2029_m  UMIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K22= matrix(results)

putexcel A23= ("Both")
putexcel B23= formula(=(B22+B21))
putexcel C23= formula(=(C22+C21))
putexcel D23= formula(=(D22+D21))
putexcel E23= formula(=(E22+E21))
putexcel F23= formula(=(F22+F21))
putexcel G23= formula(=(G22+G21))
putexcel H23= formula(=(H22+H21))
putexcel I23= formula(=(I22+I21))
putexcel J23= formula(=(J22+J21))
putexcel K23= formula(=(K22+K21))
putexcel L23= formula(=(L22+L21))
putexcel M23= formula(=(M22+M21))
putexcel N23= formula(=(N22+N21))
putexcel O23= formula(=(O22+O21))
putexcel P23= formula(=(P22+P21))
putexcel Q23= formula(=(Q22+Q21))

**********************High Income
putexcel A25= ("High Income")
putexcel A26= ("Female")
tabstat HIC_2015_f HIC_2016_f HIC_2017_f HIC_2018_f HIC_2019_f HIC_2020_f  HIC_2021_f HIC_2022_f HIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B26= matrix(results)
tabstat HIC_2024_f HIC_2025_f HIC_2026_f HIC_2027_f HIC_2028_f HIC_2029_f  HIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K26= matrix(results)
putexcel A27= ("Male")
tabstat HIC_2015_m HIC_2016_m HIC_2017_m HIC_2018_m HIC_2019_m HIC_2020_m  HIC_2021_m HIC_2022_m HIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B27= matrix(results)
tabstat HIC_2024_m HIC_2025_m HIC_2026_m HIC_2027_m HIC_2028_m HIC_2029_m  HIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K27= matrix(results)
putexcel A28= ("Both")
putexcel B28= formula(=(B27+B26))
putexcel C28= formula(=(C27+C26))
putexcel D28= formula(=(D27+D26))
putexcel E28= formula(=(E27+E26))
putexcel F28= formula(=(F27+F26))
putexcel G28= formula(=(G27+G26))
putexcel H28= formula(=(H27+H26))
putexcel I28= formula(=(I27+I26))
putexcel J28= formula(=(J27+J26))
putexcel K28= formula(=(K27+K26))
putexcel L28= formula(=(L27+L26))
putexcel M28= formula(=(M27+M26))
putexcel N28= formula(=(N27+N26))
putexcel O28= formula(=(O27+O26))
putexcel P28= formula(=(P27+P26))
putexcel Q28= formula(=(Q27+Q26))


**** Region --  World Bank


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen EAP_`x'_f=total(lostpotential_`x'_f) if world_region==1
egen EAP_`x'_m=total(lostpotential_`x'_m) if world_region==1
egen ECA_`x'_f=total(lostpotential_`x'_f) if world_region==2
egen ECA_`x'_m=total(lostpotential_`x'_m) if world_region==2
egen LAC_`x'_f=total(lostpotential_`x'_f) if world_region==3
egen LAC_`x'_m=total(lostpotential_`x'_m) if world_region==3
egen MENA_`x'_f=total(lostpotential_`x'_f) if world_region==4
egen MENA_`x'_m=total(lostpotential_`x'_m) if world_region==4
egen NA_`x'_f=total(lostpotential_`x'_f) if world_region==5
egen NA_`x'_m=total(lostpotential_`x'_m) if world_region==5
egen SA_`x'_f=total(lostpotential_`x'_f) if world_region==6
egen SA_`x'_m=total(lostpotential_`x'_m) if world_region==6
egen SSA_`x'_f=total(lostpotential_`x'_f) if world_region==7
egen SSA_`x'_m=total(lostpotential_`x'_m) if world_region==7


}
*

*local regioncodes EAP ECA LAC MENA NA SA SSA
*foreach reg of regioncodes 

****Region table******

**** East Asia and Pacific EAP
putexcel A31= ("WB - East Asia and Pacific")
putexcel A32= ("Female")
tabstat EAP_2015_f EAP_2016_f EAP_2017_f EAP_2018_f EAP_2019_f EAP_2020_f  EAP_2021_f EAP_2022_f EAP_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B32= matrix(results)
tabstat EAP_2024_f EAP_2025_f EAP_2026_f EAP_2027_f EAP_2028_f EAP_2029_f  EAP_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K32= matrix(results)
putexcel A33= ("Male")
tabstat EAP_2015_m EAP_2016_m EAP_2017_m EAP_2018_m EAP_2019_m EAP_2020_m  EAP_2021_m EAP_2022_m EAP_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B33= matrix(results)
tabstat EAP_2024_m EAP_2025_m EAP_2026_m EAP_2027_m EAP_2028_m EAP_2029_m  EAP_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K33= matrix(results)
putexcel A34= ("Both")
putexcel B34= formula(=(B32+B33))
putexcel C34= formula(=(C32+C33))
putexcel D34= formula(=(D32+D33))
putexcel E34= formula(=(E32+E33))
putexcel F34= formula(=(F32+F33))
putexcel G34= formula(=(G32+G33))
putexcel H34= formula(=(H32+H33))
putexcel I34= formula(=(I32+I33))
putexcel J34= formula(=(J32+J33))
putexcel K34= formula(=(K32+K33))
putexcel L34= formula(=(L32+L33))
putexcel M34= formula(=(M32+M33))
putexcel N34= formula(=(N32+N33))
putexcel O34= formula(=(O32+O33))
putexcel P34= formula(=(P32+P33))
putexcel Q34= formula(=(Q32+Q33))

**** Europe and Central Asia ECA
putexcel A36= ("WB - Europe and Central Asia")
putexcel A37= ("Female")
tabstat ECA_2015_f ECA_2016_f ECA_2017_f ECA_2018_f ECA_2019_f ECA_2020_f  ECA_2021_f ECA_2022_f ECA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B37= matrix(results)
tabstat ECA_2024_f ECA_2025_f ECA_2026_f ECA_2027_f ECA_2028_f ECA_2029_f  ECA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K37= matrix(results)
putexcel A38= ("Male")
tabstat ECA_2015_m ECA_2016_m ECA_2017_m ECA_2018_m ECA_2019_m ECA_2020_m  ECA_2021_m ECA_2022_m ECA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B38= matrix(results)
tabstat ECA_2024_m ECA_2025_m ECA_2026_m ECA_2027_m ECA_2028_m ECA_2029_m  ECA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K38= matrix(results)
putexcel A39= ("Both")
putexcel B39= formula(=(B37+B38))
putexcel C39= formula(=(C37+C38))
putexcel D39= formula(=(D37+D38))
putexcel E39= formula(=(E37+E38))
putexcel F39= formula(=(F37+F38))
putexcel G39= formula(=(G37+G38))
putexcel H39= formula(=(H37+H38))
putexcel I39= formula(=(I37+I38))
putexcel J39= formula(=(J37+J38))
putexcel K39= formula(=(K37+K38))
putexcel L39= formula(=(L37+L38))
putexcel M39= formula(=(M37+M38))
putexcel N39= formula(=(N37+N38))
putexcel O39= formula(=(O37+O38))
putexcel P39= formula(=(P37+P38))
putexcel Q39= formula(=(Q37+Q38))

**** Latin America and Carribean LAC
putexcel A41= ("WB - Latin America and Carribean")
putexcel A42= ("Female")
tabstat LAC_2015_f LAC_2016_f LAC_2017_f LAC_2018_f LAC_2019_f LAC_2020_f  LAC_2021_f LAC_2022_f LAC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B42= matrix(results)
tabstat LAC_2024_f LAC_2025_f LAC_2026_f LAC_2027_f LAC_2028_f LAC_2029_f  LAC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K42= matrix(results)
putexcel A43= ("Male")
tabstat LAC_2015_m LAC_2016_m LAC_2017_m LAC_2018_m LAC_2019_m LAC_2020_m  LAC_2021_m LAC_2022_m LAC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B43= matrix(results)
tabstat LAC_2024_m LAC_2025_m LAC_2026_m LAC_2027_m LAC_2028_m LAC_2029_m  LAC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K43= matrix(results)
putexcel A44= ("Both")
putexcel B44= formula(=(B42+B43))
putexcel C44= formula(=(C42+C43))
putexcel D44= formula(=(D42+D43))
putexcel E44= formula(=(E42+E43))
putexcel F44= formula(=(F42+F43))
putexcel G44= formula(=(G42+G43))
putexcel H44= formula(=(H42+H43))
putexcel I44= formula(=(I42+I43))
putexcel J44= formula(=(J42+J43))
putexcel K44= formula(=(K42+K43))
putexcel L44= formula(=(L42+L43))
putexcel M44= formula(=(M42+M43))
putexcel N44= formula(=(N42+N43))
putexcel O44= formula(=(O42+O43))
putexcel P44= formula(=(P42+P43))
putexcel Q44= formula(=(Q42+Q43))

**** Middle East and North Africa MENA
putexcel A46= ("WB - Middle East and North Africa")
putexcel A47= ("Female")
tabstat MENA_2015_f MENA_2016_f MENA_2017_f MENA_2018_f MENA_2019_f MENA_2020_f  MENA_2021_f MENA_2022_f MENA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B47= matrix(results)
tabstat MENA_2024_f MENA_2025_f MENA_2026_f MENA_2027_f MENA_2028_f MENA_2029_f  MENA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K47= matrix(results)
putexcel A48= ("Male")
tabstat MENA_2015_m MENA_2016_m MENA_2017_m MENA_2018_m MENA_2019_m MENA_2020_m  MENA_2021_m MENA_2022_m MENA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B48= matrix(results)
tabstat MENA_2024_m MENA_2025_m MENA_2026_m MENA_2027_m MENA_2028_m MENA_2029_m  MENA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K48= matrix(results)
putexcel A49= ("Both")
putexcel B49= formula(=(B47+B48))
putexcel C49= formula(=(C47+C48))
putexcel D49= formula(=(D47+D48))
putexcel E49= formula(=(E47+E48))
putexcel F49= formula(=(F47+F48))
putexcel G49= formula(=(G47+G48))
putexcel H49= formula(=(H47+H48))
putexcel I49= formula(=(I47+I48))
putexcel J49= formula(=(J47+J48))
putexcel K49= formula(=(K47+K48))
putexcel L49= formula(=(L47+L48))
putexcel M49= formula(=(M47+M48))
putexcel N49= formula(=(N47+N48))
putexcel O49= formula(=(O47+O48))
putexcel P49= formula(=(P47+P48))
putexcel Q49= formula(=(Q47+Q48))

**** North America NA
putexcel A51= ("WB - North America")
putexcel A52= ("Female")
tabstat NA_2015_f NA_2016_f NA_2017_f NA_2018_f NA_2019_f NA_2020_f  NA_2021_f NA_2022_f NA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B52= matrix(results)
tabstat NA_2024_f NA_2025_f NA_2026_f NA_2027_f NA_2028_f NA_2029_f  NA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K52= matrix(results)
putexcel A53= ("Male")
tabstat NA_2015_m NA_2016_m NA_2017_m NA_2018_m NA_2019_m NA_2020_m  NA_2021_m NA_2022_m NA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B53= matrix(results)
tabstat NA_2024_m NA_2025_m NA_2026_m NA_2027_m NA_2028_m NA_2029_m  NA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K53= matrix(results)
putexcel A54= ("Both")
putexcel B54= formula(=(B52+B53))
putexcel C54= formula(=(C52+C53))
putexcel D54= formula(=(D52+D53))
putexcel E54= formula(=(E52+E53))
putexcel F54= formula(=(F52+F53))
putexcel G54= formula(=(G52+G53))
putexcel H54= formula(=(H52+H53))
putexcel I54= formula(=(I52+I53))
putexcel J54= formula(=(J52+J53))
putexcel K54= formula(=(K52+K53))
putexcel L54= formula(=(L52+L53))
putexcel M54= formula(=(M52+M53))
putexcel N54= formula(=(N52+N53))
putexcel O54= formula(=(O52+O53))
putexcel P54= formula(=(P52+P53))
putexcel Q54= formula(=(Q52+Q53))

**** South Asia  SA
putexcel A56= ("WB - South Asia")
putexcel A57= ("Female")
tabstat SA_2015_f SA_2016_f SA_2017_f SA_2018_f SA_2019_f SA_2020_f  SA_2021_f SA_2022_f SA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B57= matrix(results)
tabstat SA_2024_f SA_2025_f SA_2026_f SA_2027_f SA_2028_f SA_2029_f  SA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K57= matrix(results)
putexcel A58= ("Male")
tabstat SA_2015_m SA_2016_m SA_2017_m SA_2018_m SA_2019_m SA_2020_m  SA_2021_m SA_2022_m SA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B58= matrix(results)
tabstat SA_2024_m SA_2025_m SA_2026_m SA_2027_m SA_2028_m SA_2029_m  SA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K58= matrix(results)
putexcel A59= ("Both")
putexcel B59= formula(=(B57+B58))
putexcel C59= formula(=(C57+C58))
putexcel D59= formula(=(D57+D58))
putexcel E59= formula(=(E57+E58))
putexcel F59= formula(=(F57+F58))
putexcel G59= formula(=(G57+G58))
putexcel H59= formula(=(H57+H58))
putexcel I59= formula(=(I57+I58))
putexcel J59= formula(=(J57+J58))
putexcel K59= formula(=(K57+K58))
putexcel L59= formula(=(L57+L58))
putexcel M59= formula(=(M57+M58))
putexcel N59= formula(=(N57+N58))
putexcel O59= formula(=(O57+O58))
putexcel P59= formula(=(P57+P58))
putexcel Q59= formula(=(Q57+Q58))

**** Sub Saharan Africa  SSA
putexcel A61= ("WB - Sub-Saharan Africa")
putexcel A62= ("Female")
tabstat SSA_2015_f SSA_2016_f SSA_2017_f SSA_2018_f SSA_2019_f SSA_2020_f  SSA_2021_f SSA_2022_f SSA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B62= matrix(results)
tabstat SSA_2024_f SSA_2025_f SSA_2026_f SSA_2027_f SSA_2028_f SSA_2029_f  SSA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K62= matrix(results)
putexcel A63= ("Male")
tabstat SSA_2015_m SSA_2016_m SSA_2017_m SSA_2018_m SSA_2019_m SSA_2020_m  SSA_2021_m SSA_2022_m SSA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B63= matrix(results)
tabstat SSA_2024_m SSA_2025_m SSA_2026_m SSA_2027_m SSA_2028_m SSA_2029_m  SSA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K63= matrix(results)
putexcel A64= ("Both")
putexcel B64= formula(=(B62+B63))
putexcel C64= formula(=(C62+C63))
putexcel D64= formula(=(D62+D63))
putexcel E64= formula(=(E62+E63))
putexcel F64= formula(=(F62+F63))
putexcel G64= formula(=(G62+G63))
putexcel H64= formula(=(H62+H63))
putexcel I64= formula(=(I62+I63))
putexcel J64= formula(=(J62+J63))
putexcel K64= formula(=(K62+K63))
putexcel L64= formula(=(L62+L63))
putexcel M64= formula(=(M62+M63))
putexcel N64= formula(=(N62+N63))
putexcel O64= formula(=(O62+O63))
putexcel P64= formula(=(P62+P63))
putexcel Q64= formula(=(Q62+Q63))



**** Region --  UN


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen un_EAP_`x'_f=total(lostpotential_`x'_f) if un_region==1
egen un_EAP_`x'_m=total(lostpotential_`x'_m) if un_region==1
egen un_EECA_`x'_f=total(lostpotential_`x'_f) if un_region==2
egen un_EECA_`x'_m=total(lostpotential_`x'_m) if un_region==2
egen un_WE_`x'_f=total(lostpotential_`x'_f) if un_region==3
egen un_WE_`x'_m=total(lostpotential_`x'_m) if un_region==3
egen un_LAC_`x'_f=total(lostpotential_`x'_f) if un_region==4
egen un_LAC_`x'_m=total(lostpotential_`x'_m) if un_region==4
egen un_MENA_`x'_f=total(lostpotential_`x'_f) if un_region==5
egen un_MENA_`x'_m=total(lostpotential_`x'_m) if un_region==5
egen un_NA_`x'_f=total(lostpotential_`x'_f) if un_region==6
egen un_NA_`x'_m=total(lostpotential_`x'_m) if un_region==6
egen un_SA_`x'_f=total(lostpotential_`x'_f) if un_region==7
egen un_SA_`x'_m=total(lostpotential_`x'_m) if un_region==7
egen un_ESA_`x'_f=total(lostpotential_`x'_f) if un_region==8
egen un_ESA_`x'_m=total(lostpotential_`x'_m) if un_region==8
egen un_WCA_`x'_f=total(lostpotential_`x'_f) if un_region==9
egen un_WCA_`x'_m=total(lostpotential_`x'_m) if un_region==9


}
*

*local regioncodes label define un_region_values 1 "EAP" 2 "EECA" 3 "WE" 4 "LAC" 5 "MENA" 6 "NA" 7 "SA" 8 "ESA" 9 "WCA"
*foreach reg of regioncodes 

****Region table******

**** East Asia and Pacific EAP
putexcel A67= ("UN - East Asia and Pacific")
putexcel A68= ("Female")
tabstat un_EAP_2015_f un_EAP_2016_f un_EAP_2017_f un_EAP_2018_f un_EAP_2019_f un_EAP_2020_f  un_EAP_2021_f un_EAP_2022_f un_EAP_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B68= matrix(results)
tabstat un_EAP_2024_f un_EAP_2025_f un_EAP_2026_f un_EAP_2027_f un_EAP_2028_f un_EAP_2029_f  un_EAP_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K68= matrix(results)
putexcel A69= ("Male")
tabstat un_EAP_2015_m un_EAP_2016_m un_EAP_2017_m un_EAP_2018_m un_EAP_2019_m un_EAP_2020_m  un_EAP_2021_m un_EAP_2022_m un_EAP_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B69= matrix(results)
tabstat un_EAP_2024_m un_EAP_2025_m un_EAP_2026_m un_EAP_2027_m un_EAP_2028_m un_EAP_2029_m  un_EAP_2030_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  K69= matrix(results)
putexcel A70= ("Both")
putexcel B70= formula(=(B68+B69))
putexcel C70= formula(=(C68+C69))
putexcel D70= formula(=(D68+D69))
putexcel E70= formula(=(E68+E69))
putexcel F70= formula(=(F68+F69))
putexcel G70= formula(=(G68+G69))
putexcel H70= formula(=(H68+H69))
putexcel I70= formula(=(I68+I69))
putexcel J70= formula(=(J68+J69))
putexcel K70= formula(=(K68+K69))
putexcel L70= formula(=(L68+L69))
putexcel M70= formula(=(M68+M69))
putexcel N70= formula(=(N68+N69))
putexcel O70= formula(=(O68+O69))
putexcel P70= formula(=(P68+P69))
putexcel Q70= formula(=(Q68+Q69))

**** Eastern Europe and Central Asia EECA
putexcel A72= ("UN - Eastern Europe and Central Asia")
putexcel A73= ("Female")
tabstat un_EECA_2015_f un_EECA_2016_f un_EECA_2017_f un_EECA_2018_f un_EECA_2019_f un_EECA_2020_f  un_EECA_2021_f un_EECA_2022_f un_EECA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B73= matrix(results)
tabstat un_EECA_2024_f un_EECA_2025_f un_EECA_2026_f un_EECA_2027_f un_EECA_2028_f un_EECA_2029_f  un_EECA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K73= matrix(results)
putexcel A74= ("Male")
tabstat un_EECA_2015_m un_EECA_2016_m un_EECA_2017_m un_EECA_2018_m un_EECA_2019_m un_EECA_2020_m  un_EECA_2021_m un_EECA_2022_m un_EECA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B74= matrix(results)
tabstat un_EECA_2024_m un_EECA_2025_m un_EECA_2026_m un_EECA_2027_m un_EECA_2028_m un_EECA_2029_m  un_EECA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K74= matrix(results)
putexcel A75= ("Both")
putexcel B75= formula(=(B73+B74))
putexcel C75= formula(=(C73+C74))
putexcel D75= formula(=(D73+D74))
putexcel E75= formula(=(E73+E74))
putexcel F75= formula(=(F73+F74))
putexcel G75= formula(=(G73+G74))
putexcel H75= formula(=(H73+H74))
putexcel I75= formula(=(I73+I74))
putexcel J75= formula(=(J73+J74))
putexcel K75= formula(=(K73+K74))
putexcel L75= formula(=(L73+L74))
putexcel M75= formula(=(M73+M74))
putexcel N75= formula(=(N73+N74))
putexcel O75= formula(=(O73+O74))
putexcel P75= formula(=(P73+P74))
putexcel Q75= formula(=(Q73+Q74))

**** Western Europe WE
putexcel A77= ("UN - Western Europe")
putexcel A78= ("Female")
tabstat un_WE_2015_f un_WE_2016_f un_WE_2017_f un_WE_2018_f un_WE_2019_f un_WE_2020_f  un_WE_2021_f un_WE_2022_f un_WE_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B78= matrix(results)
tabstat un_WE_2024_f un_WE_2025_f un_WE_2026_f un_WE_2027_f un_WE_2028_f un_WE_2029_f  un_WE_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K78= matrix(results)
putexcel A79= ("Male")
tabstat un_WE_2015_m un_WE_2016_m un_WE_2017_m un_WE_2018_m un_WE_2019_m un_WE_2020_m  un_WE_2021_m un_WE_2022_m un_WE_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B79= matrix(results)
tabstat un_WE_2024_m un_WE_2025_m un_WE_2026_m un_WE_2027_m un_WE_2028_m un_WE_2029_m  un_WE_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K79= matrix(results)
putexcel A80= ("Both")
putexcel B80= formula(=(B78+B79))
putexcel C80= formula(=(C78+C79))
putexcel D80= formula(=(D78+D79))
putexcel E80= formula(=(E78+E79))
putexcel F80= formula(=(F78+F79))
putexcel G80= formula(=(G78+G79))
putexcel H80= formula(=(H78+H79))
putexcel I80= formula(=(I78+I79))
putexcel J80= formula(=(J78+J79))
putexcel K80= formula(=(K78+K79))
putexcel L80= formula(=(L78+L79))
putexcel M80= formula(=(M78+M79))
putexcel N80= formula(=(N78+N79))
putexcel O80= formula(=(O78+O79))
putexcel P80= formula(=(P78+P79))
putexcel Q80= formula(=(Q78+Q79))


**** Latin America and Carribean LAC
putexcel A82= ("UN - Latin America and Carribean")
putexcel A83= ("Female")
tabstat un_LAC_2015_f un_LAC_2016_f un_LAC_2017_f un_LAC_2018_f un_LAC_2019_f un_LAC_2020_f  un_LAC_2021_f un_LAC_2022_f un_LAC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B83= matrix(results)
tabstat un_LAC_2024_f un_LAC_2025_f un_LAC_2026_f un_LAC_2027_f un_LAC_2028_f un_LAC_2029_f  un_LAC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K83= matrix(results)
putexcel A84= ("Male")
tabstat un_LAC_2015_m un_LAC_2016_m un_LAC_2017_m un_LAC_2018_m un_LAC_2019_m un_LAC_2020_m  un_LAC_2021_m un_LAC_2022_m un_LAC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B84= matrix(results)
tabstat un_LAC_2024_m un_LAC_2025_m un_LAC_2026_m un_LAC_2027_m un_LAC_2028_m un_LAC_2029_m  un_LAC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K84= matrix(results)
putexcel A85= ("Both")
putexcel B85= formula(=(B83+B84))
putexcel C85= formula(=(C83+C84))
putexcel D85= formula(=(D83+D84))
putexcel E85= formula(=(E83+E84))
putexcel F85= formula(=(F83+F84))
putexcel G85= formula(=(G83+G84))
putexcel H85= formula(=(H83+H84))
putexcel I85= formula(=(I83+I84))
putexcel J85= formula(=(J83+J84))
putexcel K85= formula(=(K83+K84))
putexcel L85= formula(=(L83+L84))
putexcel M85= formula(=(M83+M84))
putexcel N85= formula(=(N83+N84))
putexcel O85= formula(=(O83+O84))
putexcel P85= formula(=(P83+P84))
putexcel Q85= formula(=(Q83+Q84))


**** Middle East and North Africa MENA
putexcel A87= ("UN - Middle East and North Africa")
putexcel A88= ("Female")
tabstat un_MENA_2015_f un_MENA_2016_f un_MENA_2017_f un_MENA_2018_f un_MENA_2019_f un_MENA_2020_f  un_MENA_2021_f un_MENA_2022_f un_MENA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B88= matrix(results)
tabstat un_MENA_2024_f un_MENA_2025_f un_MENA_2026_f un_MENA_2027_f un_MENA_2028_f un_MENA_2029_f  un_MENA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K88= matrix(results)
putexcel A89= ("Male")
tabstat un_MENA_2015_m un_MENA_2016_m un_MENA_2017_m un_MENA_2018_m un_MENA_2019_m un_MENA_2020_m  un_MENA_2021_m un_MENA_2022_m un_MENA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B89= matrix(results)
tabstat un_MENA_2024_m un_MENA_2025_m un_MENA_2026_m un_MENA_2027_m un_MENA_2028_m un_MENA_2029_m  un_MENA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K89= matrix(results)
putexcel A90= ("Both")
putexcel B90= formula(=(B88+B89))
putexcel C90= formula(=(C88+C89))
putexcel D90= formula(=(D88+D89))
putexcel E90= formula(=(E88+E89))
putexcel F90= formula(=(F88+F89))
putexcel G90= formula(=(G88+G89))
putexcel H90= formula(=(H88+H89))
putexcel I90= formula(=(I88+I89))
putexcel J90= formula(=(J88+J89))
putexcel K90= formula(=(K88+K89))
putexcel L90= formula(=(L88+L89))
putexcel M90= formula(=(M88+M89))
putexcel N90= formula(=(N88+N89))
putexcel O90= formula(=(O88+O89))
putexcel P90= formula(=(P88+P89))
putexcel Q90= formula(=(Q88+Q89))


**** North America  NA
putexcel A92= ("UN - North America")
putexcel A93= ("Female")
tabstat un_NA_2015_f un_NA_2016_f un_NA_2017_f un_NA_2018_f un_NA_2019_f un_NA_2020_f  un_NA_2021_f un_NA_2022_f un_NA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B93= matrix(results)
tabstat un_NA_2024_f un_NA_2025_f un_NA_2026_f un_NA_2027_f un_NA_2028_f un_NA_2029_f  un_NA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K93= matrix(results)
putexcel A94= ("Male")
tabstat un_NA_2015_m un_NA_2016_m un_NA_2017_m un_NA_2018_m un_NA_2019_m un_NA_2020_m  un_NA_2021_m un_NA_2022_m un_NA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B94= matrix(results)
tabstat un_NA_2024_m un_NA_2025_m un_NA_2026_m un_NA_2027_m un_NA_2028_m un_NA_2029_m  un_NA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K94= matrix(results)
putexcel A95= ("Both")
putexcel B95= formula(=(B93+B94))
putexcel C95= formula(=(C93+C94))
putexcel D95= formula(=(D93+D94))
putexcel E95= formula(=(E93+E94))
putexcel F95= formula(=(F93+F94))
putexcel G95= formula(=(G93+G94))
putexcel H95= formula(=(H93+H94))
putexcel I95= formula(=(I93+I94))
putexcel J95= formula(=(J93+J94))
putexcel K95= formula(=(K93+K94))
putexcel L95= formula(=(L93+L94))
putexcel M95= formula(=(M93+M94))
putexcel N95= formula(=(N93+N94))
putexcel O95= formula(=(O93+O94))
putexcel P95= formula(=(P93+P94))
putexcel Q95= formula(=(Q93+Q94))


**** South Asia  SA
putexcel A97= ("UN - South Asia")
putexcel A98= ("Female")
tabstat un_SA_2015_f un_SA_2016_f un_SA_2017_f un_SA_2018_f un_SA_2019_f un_SA_2020_f  un_SA_2021_f un_SA_2022_f un_SA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B98= matrix(results)
tabstat un_SA_2024_f un_SA_2025_f un_SA_2026_f un_SA_2027_f un_SA_2028_f un_SA_2029_f  un_SA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K98= matrix(results)
putexcel A99= ("Male")
tabstat un_SA_2015_m un_SA_2016_m un_SA_2017_m un_SA_2018_m un_SA_2019_m un_SA_2020_m  un_SA_2021_m un_SA_2022_m un_SA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B99= matrix(results)
tabstat un_SA_2024_m un_SA_2025_m un_SA_2026_m un_SA_2027_m un_SA_2028_m un_SA_2029_m  un_SA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K99= matrix(results)
putexcel A100= ("Both")
putexcel B100= formula(=(B98+B99))
putexcel C100= formula(=(C98+C99))
putexcel D100= formula(=(D98+D99))
putexcel E100= formula(=(E98+E99))
putexcel F100= formula(=(F98+F99))
putexcel G100= formula(=(G98+G99))
putexcel H100= formula(=(H98+H99))
putexcel I100= formula(=(I98+I99))
putexcel J100= formula(=(J98+J99))
putexcel K100= formula(=(K98+K99))
putexcel L100= formula(=(L98+L99))
putexcel M100= formula(=(M98+M99))
putexcel N100= formula(=(N98+N99))
putexcel O100= formula(=(O98+O99))
putexcel P100= formula(=(P98+P99))
putexcel Q100= formula(=(Q98+Q99))


**** Eastern and Southern Africa ESA
putexcel A102= ("UN - Eastern and Southern Africa")
putexcel A103= ("Female")
tabstat un_ESA_2015_f un_ESA_2016_f un_ESA_2017_f un_ESA_2018_f un_ESA_2019_f un_ESA_2020_f  un_ESA_2021_f un_ESA_2022_f un_ESA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B103= matrix(results)
tabstat un_ESA_2024_f un_ESA_2025_f un_ESA_2026_f un_ESA_2027_f un_ESA_2028_f un_ESA_2029_f  un_ESA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K103= matrix(results)
putexcel A104= ("Male")
tabstat un_ESA_2015_m un_ESA_2016_m un_ESA_2017_m un_ESA_2018_m un_ESA_2019_m un_ESA_2020_m  un_ESA_2021_m un_ESA_2022_m un_ESA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B104= matrix(results)
tabstat un_ESA_2024_m un_ESA_2025_m un_ESA_2026_m un_ESA_2027_m un_ESA_2028_m un_ESA_2029_m  un_ESA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K104= matrix(results)
putexcel A105= ("Both")
putexcel B105= formula(=(B103+B104))
putexcel C105= formula(=(C103+C104))
putexcel D105= formula(=(D103+D104))
putexcel E105= formula(=(E103+E104))
putexcel F105= formula(=(F103+F104))
putexcel G105= formula(=(G103+G104))
putexcel H105= formula(=(H103+H104))
putexcel I105= formula(=(I103+I104))
putexcel J105= formula(=(J103+J104))
putexcel K105= formula(=(K103+K104))
putexcel L105= formula(=(L103+L104))
putexcel M105= formula(=(M103+M104))
putexcel N105= formula(=(N103+N104))
putexcel O105= formula(=(O103+O104))
putexcel P105= formula(=(P103+P104))
putexcel Q105= formula(=(Q103+Q104))



**** Western and Central Africa
putexcel A107= ("UN - Western and Central Africa")
putexcel A108= ("Female")
tabstat un_WCA_2015_f un_WCA_2016_f un_WCA_2017_f un_WCA_2018_f un_WCA_2019_f un_WCA_2020_f  un_WCA_2021_f un_WCA_2022_f un_WCA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B108= matrix(results)
tabstat un_WCA_2024_f un_WCA_2025_f un_WCA_2026_f un_WCA_2027_f un_WCA_2028_f un_WCA_2029_f  un_WCA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K108= matrix(results)
putexcel A109= ("Male")
tabstat un_WCA_2015_m un_WCA_2016_m un_WCA_2017_m un_WCA_2018_m un_WCA_2019_m un_WCA_2020_m  un_WCA_2021_m un_WCA_2022_m un_WCA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B109= matrix(results)
tabstat un_WCA_2024_m un_WCA_2025_m un_WCA_2026_m un_WCA_2027_m un_WCA_2028_m un_WCA_2029_m  un_WCA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K109= matrix(results)
putexcel A110= ("Both")
putexcel B110= formula(=(B108+B109))
putexcel C110= formula(=(C108+C109))
putexcel D110= formula(=(D108+D109))
putexcel E110= formula(=(E108+E109))
putexcel F110= formula(=(F108+F109))
putexcel G110= formula(=(G108+G109))
putexcel H110= formula(=(H108+H109))
putexcel I110= formula(=(I108+I109))
putexcel J110= formula(=(J108+J109))
putexcel K110= formula(=(K108+K109))
putexcel L110= formula(=(L108+L109))
putexcel M110= formula(=(M108+M109))
putexcel N110= formula(=(N108+N109))
putexcel O110= formula(=(O108+O109))
putexcel P110= formula(=(P108+P109))
putexcel Q110= formula(=(Q108+Q109))



**** Region --  UN


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen non_fragile_`x'_f=total(lostpotential_`x'_f) if oecd_fragile==0
egen non_fragile_`x'_m=total(lostpotential_`x'_m) if oecd_fragile==0
egen fragile_`x'_f=total(lostpotential_`x'_f) if oecd_fragile==1
egen fragile_`x'_m=total(lostpotential_`x'_m) if oecd_fragile==1
}
*

**** Non-Fragile
putexcel A113= ("OECD 2020 - Non-Fragile")
putexcel A114= ("Female")
tabstat non_fragile_2015_f non_fragile_2016_f non_fragile_2017_f non_fragile_2018_f non_fragile_2019_f non_fragile_2020_f  non_fragile_2021_f non_fragile_2022_f non_fragile_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B114= matrix(results)
tabstat non_fragile_2024_f non_fragile_2025_f non_fragile_2026_f non_fragile_2027_f non_fragile_2028_f non_fragile_2029_f  non_fragile_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K114= matrix(results)
putexcel A115= ("Male")
tabstat non_fragile_2015_m non_fragile_2016_m non_fragile_2017_m non_fragile_2018_m non_fragile_2019_m non_fragile_2020_m  non_fragile_2021_m non_fragile_2022_m non_fragile_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B115= matrix(results)
tabstat non_fragile_2024_m non_fragile_2025_m non_fragile_2026_m non_fragile_2027_m non_fragile_2028_m non_fragile_2029_m  non_fragile_2030_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  K115= matrix(results)
putexcel A116= ("Both")
putexcel B116= formula(=(B114+B115))
putexcel C116= formula(=(C114+C115))
putexcel D116= formula(=(D114+D115))
putexcel E116= formula(=(E114+E115))
putexcel F116= formula(=(F114+F115))
putexcel G116= formula(=(G114+G115))
putexcel H116= formula(=(H114+H115))
putexcel I116= formula(=(I114+I115))
putexcel J116= formula(=(J114+J115))
putexcel K116= formula(=(K114+K115))
putexcel L116= formula(=(L114+L115))
putexcel M116= formula(=(M114+M115))
putexcel N116= formula(=(N114+N115))
putexcel O116= formula(=(O114+O115))
putexcel P116= formula(=(P114+P115))
putexcel Q116= formula(=(Q114+Q115))


**** Fragile
putexcel A118= ("OECD 2020 - Fragile")
putexcel A119= ("Female")
tabstat fragile_2015_f fragile_2016_f fragile_2017_f fragile_2018_f fragile_2019_f fragile_2020_f  fragile_2021_f fragile_2022_f fragile_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B119= matrix(results)
tabstat fragile_2024_f fragile_2025_f fragile_2026_f fragile_2027_f fragile_2028_f fragile_2029_f  fragile_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K119= matrix(results)
putexcel A120= ("Male")
tabstat fragile_2015_m fragile_2016_m fragile_2017_m fragile_2018_m fragile_2019_m fragile_2020_m  fragile_2021_m fragile_2022_m fragile_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B120= matrix(results)
tabstat fragile_2024_m fragile_2025_m fragile_2026_m fragile_2027_m fragile_2028_m fragile_2029_m  fragile_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K120= matrix(results)
putexcel A121= ("Both")
putexcel B121= formula(=(B119+B120))
putexcel C121= formula(=(C119+C120))
putexcel D121= formula(=(D119+D120))
putexcel E121= formula(=(E119+E120))
putexcel F121= formula(=(F119+F120))
putexcel G121= formula(=(G119+G120))
putexcel H121= formula(=(H119+H120))
putexcel I121= formula(=(I119+I120))
putexcel J121= formula(=(J119+J120))
putexcel K121= formula(=(K119+K120))
putexcel L121= formula(=(L119+L120))
putexcel M121= formula(=(M119+M120))
putexcel N121= formula(=(N119+N120))
putexcel O121= formula(=(O119+O120))
putexcel P121= formula(=(P119+P120))
putexcel Q121= formula(=(Q119+Q120))




clear

use "$interim/Lost_Potential_Database_With_Indicators.dta", clear

putexcel set "$outputs\Tables_Combined_Simplified.xlsx", sheet(2. OS BAU) modify


putexcel A5 = ("Female")
putexcel A6 = ("Male")

sum sum_os_2015_f
return list
putexcel B4 = (2015)
putexcel B5 = (`r(mean)')

sum sum_os_2016_f
return list
putexcel C4 = (2016)
putexcel C5 = (`r(mean)')

sum sum_os_2017_f
return list
putexcel D4 = (2017)
putexcel D5 = (`r(mean)')

sum sum_os_2018_f
return list
putexcel E4 = (2018)
putexcel E5 = (`r(mean)')

sum sum_os_2019_f
return list
putexcel F4 = (2019)
putexcel F5 = (`r(mean)')

sum sum_os_2020_f
return list
putexcel G4 = (2020)
putexcel G5 = (`r(mean)')

sum sum_os_2021_f
return list
putexcel H4 = (2021)
putexcel H5 = (`r(mean)')

sum sum_os_2022_f
return list
putexcel I4 = (2022)
putexcel I5 = (`r(mean)')

sum sum_os_2023_f
return list
putexcel J4 = (2023)
putexcel J5 = (`r(mean)')

sum sum_os_2024_f
return list
putexcel K4 = (2024)
putexcel K5 = (`r(mean)')

sum sum_os_2025_f
return list
putexcel L4 = (2025)
putexcel L5 = (`r(mean)')

sum sum_os_2026_f
return list
putexcel M4 = (2026)
putexcel M5 = (`r(mean)')

sum sum_os_2027_f
return list
putexcel N4 = (2027)
putexcel N5 = (`r(mean)')

sum sum_os_2028_f
return list
putexcel O4 = (2028)
putexcel O5 = (`r(mean)')

sum sum_os_2029_f
return list
putexcel P4 = (2029)
putexcel P5 = (`r(mean)')

sum sum_os_2030_f
return list
putexcel Q4 = (2030)
putexcel Q5 = (`r(mean)')




sum sum_os_2015_m
return list
putexcel B6 = (`r(mean)')

sum sum_os_2016_m
return list
putexcel C6 = (`r(mean)')


sum sum_os_2017_m
return list
putexcel D6  = (`r(mean)')


sum sum_os_2018_m
return list
putexcel E6 = (`r(mean)')


sum sum_os_2019_m
return list
putexcel F6 = (`r(mean)')

sum sum_os_2020_m
return list
putexcel G6 = (`r(mean)')

sum sum_os_2021_m
return list
putexcel H6 = (`r(mean)')

sum sum_os_2022_m
return list
putexcel I6 = (`r(mean)')

sum sum_os_2023_m
return list
putexcel J6 = (`r(mean)')

sum sum_os_2024_m
return list
putexcel K6 = (`r(mean)')

sum sum_os_2025_m
return list
putexcel L6 = (`r(mean)')

sum sum_os_2026_m
return list
putexcel M6 = (`r(mean)')


sum sum_os_2027_m
return list
putexcel N6 = (`r(mean)')

sum sum_os_2028_m
return list
putexcel O6 = (`r(mean)')

sum sum_os_2029_m
return list
putexcel P6 = (`r(mean)')

sum sum_os_2030_m
return list
putexcel Q6 = (`r(mean)')


putexcel A7 = ("Both")
putexcel B7= formula(=(B5+B6))
putexcel C7= formula(=(C5+C6))
putexcel D7= formula(=(D5+D6))
putexcel E7= formula(=(E5+E6))
putexcel F7= formula(=(F5+F6))
putexcel G7= formula(=(G5+G6))
putexcel H7= formula(=(H5+H6))
putexcel I7= formula(=(I5+I6))
putexcel J7= formula(=(J5+J6))
putexcel K7= formula(=(K5+K6))
putexcel L7= formula(=(L5+L6))
putexcel M7= formula(=(M5+M6))
putexcel N7= formula(=(N5+N6))
putexcel O7= formula(=(O5+O6))
putexcel P7= formula(=(P5+P6))
putexcel Q7= formula(=(Q5+Q6))



foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen LIC_`x'_f=total(oppsecured_`x'_f) if income_group==1
egen LIC_`x'_m=total(oppsecured_`x'_m) if income_group==1
egen LMIC_`x'_f=total(oppsecured_`x'_f) if income_group==2
egen LMIC_`x'_m=total(oppsecured_`x'_m) if income_group==2
egen UMIC_`x'_f=total(oppsecured_`x'_f) if income_group==3
egen UMIC_`x'_m=total(oppsecured_`x'_m) if income_group==3
egen HIC_`x'_f=total(oppsecured_`x'_f) if income_group==4
egen HIC_`x'_m=total(oppsecured_`x'_m) if income_group==4

}
*

****Income table******

**** Low Income
putexcel A10= ("Low Income")
putexcel A11= ("Female")
tabstat LIC_2015_f LIC_2016_f LIC_2017_f LIC_2018_f LIC_2019_f LIC_2020_f  LIC_2021_f LIC_2022_f LIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B11= matrix(results)
tabstat LIC_2024_f LIC_2025_f LIC_2026_f LIC_2027_f LIC_2028_f LIC_2029_f  LIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K11= matrix(results)
putexcel A12= ("Male")
tabstat LIC_2015_m LIC_2016_m LIC_2017_m LIC_2018_m LIC_2019_m LIC_2020_m  LIC_2021_m LIC_2022_m LIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B12= matrix(results)
tabstat LIC_2024_m LIC_2025_m LIC_2026_m LIC_2027_m LIC_2028_m LIC_2029_m  LIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K12= matrix(results)
putexcel A13= ("Both")
putexcel B13= formula(=(B11+B12))
putexcel C13= formula(=(C11+C12))
putexcel D13= formula(=(D11+D12))
putexcel E13= formula(=(E11+E12))
putexcel F13= formula(=(F11+F12))
putexcel G13= formula(=(G11+G12))
putexcel H13= formula(=(H11+H12))
putexcel I13= formula(=(I11+I12))
putexcel J13= formula(=(J11+J12))
putexcel K13= formula(=(K11+K12))
putexcel L13= formula(=(L11+L12))
putexcel M13= formula(=(M11+M12))
putexcel N13= formula(=(N11+N12))
putexcel O13= formula(=(O11+O12))
putexcel P13= formula(=(P11+P12))
putexcel Q13= formula(=(Q11+Q12))

*****Low_middle Income
putexcel A15= ("Lower-Middle Income")
putexcel A16= ("Female")
tabstat LMIC_2015_f LMIC_2016_f LMIC_2017_f LMIC_2018_f LMIC_2019_f LMIC_2020_f  LMIC_2021_f LMIC_2022_f LMIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B16= matrix(results)
tabstat LMIC_2024_f LMIC_2025_f LMIC_2026_f LMIC_2027_f LMIC_2028_f LMIC_2029_f  LMIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K16= matrix(results)
putexcel A17= ("Male")
tabstat LMIC_2015_m LMIC_2016_m LMIC_2017_m LMIC_2018_m LMIC_2019_m LMIC_2020_m  LMIC_2021_m LMIC_2022_m LMIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B17= matrix(results)
tabstat LMIC_2024_m LMIC_2025_m LMIC_2026_m LMIC_2027_m LMIC_2028_m LMIC_2029_m  LMIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K17= matrix(results)
putexcel A18= ("Both")
putexcel B18= formula(=(B17+B16))
putexcel C18= formula(=(C17+C16))
putexcel D18= formula(=(D17+D16))
putexcel E18= formula(=(E17+E16))
putexcel F18= formula(=(F17+F16))
putexcel G18= formula(=(G17+G16))
putexcel H18= formula(=(H17+H16))
putexcel I18= formula(=(I17+I16))
putexcel J18= formula(=(J17+J16))
putexcel K18= formula(=(K17+K16))
putexcel L18= formula(=(L17+L16))
putexcel M18= formula(=(M17+M16))
putexcel N18= formula(=(N17+N16))
putexcel O18= formula(=(O17+O16))
putexcel P18= formula(=(P17+P16))
putexcel Q18= formula(=(Q17+Q16))

**********************Upper Middle Income
putexcel A20= ("Upper-Middle Income")
putexcel A21= ("Female")
tabstat UMIC_2015_f UMIC_2016_f UMIC_2017_f UMIC_2018_f UMIC_2019_f UMIC_2020_f  UMIC_2021_f UMIC_2022_f UMIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B21= matrix(results)
tabstat UMIC_2024_f UMIC_2025_f UMIC_2026_f UMIC_2027_f UMIC_2028_f UMIC_2029_f  UMIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K21= matrix(results)
putexcel A22= ("Male")
tabstat UMIC_2015_m UMIC_2016_m UMIC_2017_m UMIC_2018_m UMIC_2019_m UMIC_2020_m  UMIC_2021_m UMIC_2022_m UMIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B22= matrix(results)
tabstat UMIC_2024_m UMIC_2025_m UMIC_2026_m UMIC_2027_m UMIC_2028_m UMIC_2029_m  UMIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K22= matrix(results)

putexcel A23= ("Both")
putexcel B23= formula(=(B22+B21))
putexcel C23= formula(=(C22+C21))
putexcel D23= formula(=(D22+D21))
putexcel E23= formula(=(E22+E21))
putexcel F23= formula(=(F22+F21))
putexcel G23= formula(=(G22+G21))
putexcel H23= formula(=(H22+H21))
putexcel I23= formula(=(I22+I21))
putexcel J23= formula(=(J22+J21))
putexcel K23= formula(=(K22+K21))
putexcel L23= formula(=(L22+L21))
putexcel M23= formula(=(M22+M21))
putexcel N23= formula(=(N22+N21))
putexcel O23= formula(=(O22+O21))
putexcel P23= formula(=(P22+P21))
putexcel Q23= formula(=(Q22+Q21))

**********************High Income
putexcel A25= ("High Income")
putexcel A26= ("Female")
tabstat HIC_2015_f HIC_2016_f HIC_2017_f HIC_2018_f HIC_2019_f HIC_2020_f  HIC_2021_f HIC_2022_f HIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B26= matrix(results)
tabstat HIC_2024_f HIC_2025_f HIC_2026_f HIC_2027_f HIC_2028_f HIC_2029_f  HIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K26= matrix(results)
putexcel A27= ("Male")
tabstat HIC_2015_m HIC_2016_m HIC_2017_m HIC_2018_m HIC_2019_m HIC_2020_m  HIC_2021_m HIC_2022_m HIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B27= matrix(results)
tabstat HIC_2024_m HIC_2025_m HIC_2026_m HIC_2027_m HIC_2028_m HIC_2029_m  HIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K27= matrix(results)
putexcel A28= ("Both")
putexcel B28= formula(=(B27+B26))
putexcel C28= formula(=(C27+C26))
putexcel D28= formula(=(D27+D26))
putexcel E28= formula(=(E27+E26))
putexcel F28= formula(=(F27+F26))
putexcel G28= formula(=(G27+G26))
putexcel H28= formula(=(H27+H26))
putexcel I28= formula(=(I27+I26))
putexcel J28= formula(=(J27+J26))
putexcel K28= formula(=(K27+K26))
putexcel L28= formula(=(L27+L26))
putexcel M28= formula(=(M27+M26))
putexcel N28= formula(=(N27+N26))
putexcel O28= formula(=(O27+O26))
putexcel P28= formula(=(P27+P26))
putexcel Q28= formula(=(Q27+Q26))


**** Region --  World Bank


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen EAP_`x'_f=total(oppsecured_`x'_f) if world_region==1
egen EAP_`x'_m=total(oppsecured_`x'_m) if world_region==1
egen ECA_`x'_f=total(oppsecured_`x'_f) if world_region==2
egen ECA_`x'_m=total(oppsecured_`x'_m) if world_region==2
egen LAC_`x'_f=total(oppsecured_`x'_f) if world_region==3
egen LAC_`x'_m=total(oppsecured_`x'_m) if world_region==3
egen MENA_`x'_f=total(oppsecured_`x'_f) if world_region==4
egen MENA_`x'_m=total(oppsecured_`x'_m) if world_region==4
egen NA_`x'_f=total(oppsecured_`x'_f) if world_region==5
egen NA_`x'_m=total(oppsecured_`x'_m) if world_region==5
egen SA_`x'_f=total(oppsecured_`x'_f) if world_region==6
egen SA_`x'_m=total(oppsecured_`x'_m) if world_region==6
egen SSA_`x'_f=total(oppsecured_`x'_f) if world_region==7
egen SSA_`x'_m=total(oppsecured_`x'_m) if world_region==7


}
*

*local regioncodes EAP ECA LAC MENA NA SA SSA
*foreach reg of regioncodes 

****Region table******

**** East Asia and Pacific EAP
putexcel A31= ("WB - East Asia and Pacific")
putexcel A32= ("Female")
tabstat EAP_2015_f EAP_2016_f EAP_2017_f EAP_2018_f EAP_2019_f EAP_2020_f  EAP_2021_f EAP_2022_f EAP_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B32= matrix(results)
tabstat EAP_2024_f EAP_2025_f EAP_2026_f EAP_2027_f EAP_2028_f EAP_2029_f  EAP_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K32= matrix(results)
putexcel A33= ("Male")
tabstat EAP_2015_m EAP_2016_m EAP_2017_m EAP_2018_m EAP_2019_m EAP_2020_m  EAP_2021_m EAP_2022_m EAP_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B33= matrix(results)
tabstat EAP_2024_m EAP_2025_m EAP_2026_m EAP_2027_m EAP_2028_m EAP_2029_m  EAP_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K33= matrix(results)
putexcel A34= ("Both")
putexcel B34= formula(=(B32+B33))
putexcel C34= formula(=(C32+C33))
putexcel D34= formula(=(D32+D33))
putexcel E34= formula(=(E32+E33))
putexcel F34= formula(=(F32+F33))
putexcel G34= formula(=(G32+G33))
putexcel H34= formula(=(H32+H33))
putexcel I34= formula(=(I32+I33))
putexcel J34= formula(=(J32+J33))
putexcel K34= formula(=(K32+K33))
putexcel L34= formula(=(L32+L33))
putexcel M34= formula(=(M32+M33))
putexcel N34= formula(=(N32+N33))
putexcel O34= formula(=(O32+O33))
putexcel P34= formula(=(P32+P33))
putexcel Q34= formula(=(Q32+Q33))

**** Europe and Central Asia ECA
putexcel A36= ("WB - Europe and Central Asia")
putexcel A37= ("Female")
tabstat ECA_2015_f ECA_2016_f ECA_2017_f ECA_2018_f ECA_2019_f ECA_2020_f  ECA_2021_f ECA_2022_f ECA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B37= matrix(results)
tabstat ECA_2024_f ECA_2025_f ECA_2026_f ECA_2027_f ECA_2028_f ECA_2029_f  ECA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K37= matrix(results)
putexcel A38= ("Male")
tabstat ECA_2015_m ECA_2016_m ECA_2017_m ECA_2018_m ECA_2019_m ECA_2020_m  ECA_2021_m ECA_2022_m ECA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B38= matrix(results)
tabstat ECA_2024_m ECA_2025_m ECA_2026_m ECA_2027_m ECA_2028_m ECA_2029_m  ECA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K38= matrix(results)
putexcel A39= ("Both")
putexcel B39= formula(=(B37+B38))
putexcel C39= formula(=(C37+C38))
putexcel D39= formula(=(D37+D38))
putexcel E39= formula(=(E37+E38))
putexcel F39= formula(=(F37+F38))
putexcel G39= formula(=(G37+G38))
putexcel H39= formula(=(H37+H38))
putexcel I39= formula(=(I37+I38))
putexcel J39= formula(=(J37+J38))
putexcel K39= formula(=(K37+K38))
putexcel L39= formula(=(L37+L38))
putexcel M39= formula(=(M37+M38))
putexcel N39= formula(=(N37+N38))
putexcel O39= formula(=(O37+O38))
putexcel P39= formula(=(P37+P38))
putexcel Q39= formula(=(Q37+Q38))

**** Latin America and Carribean LAC
putexcel A41= ("WB - Latin America and Carribean")
putexcel A42= ("Female")
tabstat LAC_2015_f LAC_2016_f LAC_2017_f LAC_2018_f LAC_2019_f LAC_2020_f  LAC_2021_f LAC_2022_f LAC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B42= matrix(results)
tabstat LAC_2024_f LAC_2025_f LAC_2026_f LAC_2027_f LAC_2028_f LAC_2029_f  LAC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K42= matrix(results)
putexcel A43= ("Male")
tabstat LAC_2015_m LAC_2016_m LAC_2017_m LAC_2018_m LAC_2019_m LAC_2020_m  LAC_2021_m LAC_2022_m LAC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B43= matrix(results)
tabstat LAC_2024_m LAC_2025_m LAC_2026_m LAC_2027_m LAC_2028_m LAC_2029_m  LAC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K43= matrix(results)
putexcel A44= ("Both")
putexcel B44= formula(=(B42+B43))
putexcel C44= formula(=(C42+C43))
putexcel D44= formula(=(D42+D43))
putexcel E44= formula(=(E42+E43))
putexcel F44= formula(=(F42+F43))
putexcel G44= formula(=(G42+G43))
putexcel H44= formula(=(H42+H43))
putexcel I44= formula(=(I42+I43))
putexcel J44= formula(=(J42+J43))
putexcel K44= formula(=(K42+K43))
putexcel L44= formula(=(L42+L43))
putexcel M44= formula(=(M42+M43))
putexcel N44= formula(=(N42+N43))
putexcel O44= formula(=(O42+O43))
putexcel P44= formula(=(P42+P43))
putexcel Q44= formula(=(Q42+Q43))

**** Middle East and North Africa MENA
putexcel A46= ("WB - Middle East and North Africa")
putexcel A47= ("Female")
tabstat MENA_2015_f MENA_2016_f MENA_2017_f MENA_2018_f MENA_2019_f MENA_2020_f  MENA_2021_f MENA_2022_f MENA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B47= matrix(results)
tabstat MENA_2024_f MENA_2025_f MENA_2026_f MENA_2027_f MENA_2028_f MENA_2029_f  MENA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K47= matrix(results)
putexcel A48= ("Male")
tabstat MENA_2015_m MENA_2016_m MENA_2017_m MENA_2018_m MENA_2019_m MENA_2020_m  MENA_2021_m MENA_2022_m MENA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B48= matrix(results)
tabstat MENA_2024_m MENA_2025_m MENA_2026_m MENA_2027_m MENA_2028_m MENA_2029_m  MENA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K48= matrix(results)
putexcel A49= ("Both")
putexcel B49= formula(=(B47+B48))
putexcel C49= formula(=(C47+C48))
putexcel D49= formula(=(D47+D48))
putexcel E49= formula(=(E47+E48))
putexcel F49= formula(=(F47+F48))
putexcel G49= formula(=(G47+G48))
putexcel H49= formula(=(H47+H48))
putexcel I49= formula(=(I47+I48))
putexcel J49= formula(=(J47+J48))
putexcel K49= formula(=(K47+K48))
putexcel L49= formula(=(L47+L48))
putexcel M49= formula(=(M47+M48))
putexcel N49= formula(=(N47+N48))
putexcel O49= formula(=(O47+O48))
putexcel P49= formula(=(P47+P48))
putexcel Q49= formula(=(Q47+Q48))

**** North America NA
putexcel A51= ("WB - North America")
putexcel A52= ("Female")
tabstat NA_2015_f NA_2016_f NA_2017_f NA_2018_f NA_2019_f NA_2020_f  NA_2021_f NA_2022_f NA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B52= matrix(results)
tabstat NA_2024_f NA_2025_f NA_2026_f NA_2027_f NA_2028_f NA_2029_f  NA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K52= matrix(results)
putexcel A53= ("Male")
tabstat NA_2015_m NA_2016_m NA_2017_m NA_2018_m NA_2019_m NA_2020_m  NA_2021_m NA_2022_m NA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B53= matrix(results)
tabstat NA_2024_m NA_2025_m NA_2026_m NA_2027_m NA_2028_m NA_2029_m  NA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K53= matrix(results)
putexcel A54= ("Both")
putexcel B54= formula(=(B52+B53))
putexcel C54= formula(=(C52+C53))
putexcel D54= formula(=(D52+D53))
putexcel E54= formula(=(E52+E53))
putexcel F54= formula(=(F52+F53))
putexcel G54= formula(=(G52+G53))
putexcel H54= formula(=(H52+H53))
putexcel I54= formula(=(I52+I53))
putexcel J54= formula(=(J52+J53))
putexcel K54= formula(=(K52+K53))
putexcel L54= formula(=(L52+L53))
putexcel M54= formula(=(M52+M53))
putexcel N54= formula(=(N52+N53))
putexcel O54= formula(=(O52+O53))
putexcel P54= formula(=(P52+P53))
putexcel Q54= formula(=(Q52+Q53))

**** South Asia  SA
putexcel A56= ("WB - South Asia")
putexcel A57= ("Female")
tabstat SA_2015_f SA_2016_f SA_2017_f SA_2018_f SA_2019_f SA_2020_f  SA_2021_f SA_2022_f SA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B57= matrix(results)
tabstat SA_2024_f SA_2025_f SA_2026_f SA_2027_f SA_2028_f SA_2029_f  SA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K57= matrix(results)
putexcel A58= ("Male")
tabstat SA_2015_m SA_2016_m SA_2017_m SA_2018_m SA_2019_m SA_2020_m  SA_2021_m SA_2022_m SA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B58= matrix(results)
tabstat SA_2024_m SA_2025_m SA_2026_m SA_2027_m SA_2028_m SA_2029_m  SA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K58= matrix(results)
putexcel A59= ("Both")
putexcel B59= formula(=(B57+B58))
putexcel C59= formula(=(C57+C58))
putexcel D59= formula(=(D57+D58))
putexcel E59= formula(=(E57+E58))
putexcel F59= formula(=(F57+F58))
putexcel G59= formula(=(G57+G58))
putexcel H59= formula(=(H57+H58))
putexcel I59= formula(=(I57+I58))
putexcel J59= formula(=(J57+J58))
putexcel K59= formula(=(K57+K58))
putexcel L59= formula(=(L57+L58))
putexcel M59= formula(=(M57+M58))
putexcel N59= formula(=(N57+N58))
putexcel O59= formula(=(O57+O58))
putexcel P59= formula(=(P57+P58))
putexcel Q59= formula(=(Q57+Q58))

**** Sub Saharan Africa  SSA
putexcel A61= ("WB - Sub-Saharan Africa")
putexcel A62= ("Female")
tabstat SSA_2015_f SSA_2016_f SSA_2017_f SSA_2018_f SSA_2019_f SSA_2020_f  SSA_2021_f SSA_2022_f SSA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B62= matrix(results)
tabstat SSA_2024_f SSA_2025_f SSA_2026_f SSA_2027_f SSA_2028_f SSA_2029_f  SSA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K62= matrix(results)
putexcel A63= ("Male")
tabstat SSA_2015_m SSA_2016_m SSA_2017_m SSA_2018_m SSA_2019_m SSA_2020_m  SSA_2021_m SSA_2022_m SSA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B63= matrix(results)
tabstat SSA_2024_m SSA_2025_m SSA_2026_m SSA_2027_m SSA_2028_m SSA_2029_m  SSA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K63= matrix(results)
putexcel A64= ("Both")
putexcel B64= formula(=(B62+B63))
putexcel C64= formula(=(C62+C63))
putexcel D64= formula(=(D62+D63))
putexcel E64= formula(=(E62+E63))
putexcel F64= formula(=(F62+F63))
putexcel G64= formula(=(G62+G63))
putexcel H64= formula(=(H62+H63))
putexcel I64= formula(=(I62+I63))
putexcel J64= formula(=(J62+J63))
putexcel K64= formula(=(K62+K63))
putexcel L64= formula(=(L62+L63))
putexcel M64= formula(=(M62+M63))
putexcel N64= formula(=(N62+N63))
putexcel O64= formula(=(O62+O63))
putexcel P64= formula(=(P62+P63))
putexcel Q64= formula(=(Q62+Q63))



**** Region --  UN


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen un_EAP_`x'_f=total(oppsecured_`x'_f) if un_region==1
egen un_EAP_`x'_m=total(oppsecured_`x'_m) if un_region==1
egen un_EECA_`x'_f=total(oppsecured_`x'_f) if un_region==2
egen un_EECA_`x'_m=total(oppsecured_`x'_m) if un_region==2
egen un_WE_`x'_f=total(oppsecured_`x'_f) if un_region==3
egen un_WE_`x'_m=total(oppsecured_`x'_m) if un_region==3
egen un_LAC_`x'_f=total(oppsecured_`x'_f) if un_region==4
egen un_LAC_`x'_m=total(oppsecured_`x'_m) if un_region==4
egen un_MENA_`x'_f=total(oppsecured_`x'_f) if un_region==5
egen un_MENA_`x'_m=total(oppsecured_`x'_m) if un_region==5
egen un_NA_`x'_f=total(oppsecured_`x'_f) if un_region==6
egen un_NA_`x'_m=total(oppsecured_`x'_m) if un_region==6
egen un_SA_`x'_f=total(oppsecured_`x'_f) if un_region==7
egen un_SA_`x'_m=total(oppsecured_`x'_m) if un_region==7
egen un_ESA_`x'_f=total(oppsecured_`x'_f) if un_region==8
egen un_ESA_`x'_m=total(oppsecured_`x'_m) if un_region==8
egen un_WCA_`x'_f=total(oppsecured_`x'_f) if un_region==9
egen un_WCA_`x'_m=total(oppsecured_`x'_m) if un_region==9


}
*

*local regioncodes label define un_region_values 1 "EAP" 2 "EECA" 3 "WE" 4 "LAC" 5 "MENA" 6 "NA" 7 "SA" 8 "ESA" 9 "WCA"
*foreach reg of regioncodes 

****Region table******

**** East Asia and Pacific EAP
putexcel A67= ("UN - East Asia and Pacific")
putexcel A68= ("Female")
tabstat un_EAP_2015_f un_EAP_2016_f un_EAP_2017_f un_EAP_2018_f un_EAP_2019_f un_EAP_2020_f  un_EAP_2021_f un_EAP_2022_f un_EAP_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B68= matrix(results)
tabstat un_EAP_2024_f un_EAP_2025_f un_EAP_2026_f un_EAP_2027_f un_EAP_2028_f un_EAP_2029_f  un_EAP_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K68= matrix(results)
putexcel A69= ("Male")
tabstat un_EAP_2015_m un_EAP_2016_m un_EAP_2017_m un_EAP_2018_m un_EAP_2019_m un_EAP_2020_m  un_EAP_2021_m un_EAP_2022_m un_EAP_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B69= matrix(results)
tabstat un_EAP_2024_m un_EAP_2025_m un_EAP_2026_m un_EAP_2027_m un_EAP_2028_m un_EAP_2029_m  un_EAP_2030_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  K69= matrix(results)
putexcel A70= ("Both")
putexcel B70= formula(=(B68+B69))
putexcel C70= formula(=(C68+C69))
putexcel D70= formula(=(D68+D69))
putexcel E70= formula(=(E68+E69))
putexcel F70= formula(=(F68+F69))
putexcel G70= formula(=(G68+G69))
putexcel H70= formula(=(H68+H69))
putexcel I70= formula(=(I68+I69))
putexcel J70= formula(=(J68+J69))
putexcel K70= formula(=(K68+K69))
putexcel L70= formula(=(L68+L69))
putexcel M70= formula(=(M68+M69))
putexcel N70= formula(=(N68+N69))
putexcel O70= formula(=(O68+O69))
putexcel P70= formula(=(P68+P69))
putexcel Q70= formula(=(Q68+Q69))

**** Eastern Europe and Central Asia EECA
putexcel A72= ("UN - Eastern Europe and Central Asia")
putexcel A73= ("Female")
tabstat un_EECA_2015_f un_EECA_2016_f un_EECA_2017_f un_EECA_2018_f un_EECA_2019_f un_EECA_2020_f  un_EECA_2021_f un_EECA_2022_f un_EECA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B73= matrix(results)
tabstat un_EECA_2024_f un_EECA_2025_f un_EECA_2026_f un_EECA_2027_f un_EECA_2028_f un_EECA_2029_f  un_EECA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K73= matrix(results)
putexcel A74= ("Male")
tabstat un_EECA_2015_m un_EECA_2016_m un_EECA_2017_m un_EECA_2018_m un_EECA_2019_m un_EECA_2020_m  un_EECA_2021_m un_EECA_2022_m un_EECA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B74= matrix(results)
tabstat un_EECA_2024_m un_EECA_2025_m un_EECA_2026_m un_EECA_2027_m un_EECA_2028_m un_EECA_2029_m  un_EECA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K74= matrix(results)
putexcel A75= ("Both")
putexcel B75= formula(=(B73+B74))
putexcel C75= formula(=(C73+C74))
putexcel D75= formula(=(D73+D74))
putexcel E75= formula(=(E73+E74))
putexcel F75= formula(=(F73+F74))
putexcel G75= formula(=(G73+G74))
putexcel H75= formula(=(H73+H74))
putexcel I75= formula(=(I73+I74))
putexcel J75= formula(=(J73+J74))
putexcel K75= formula(=(K73+K74))
putexcel L75= formula(=(L73+L74))
putexcel M75= formula(=(M73+M74))
putexcel N75= formula(=(N73+N74))
putexcel O75= formula(=(O73+O74))
putexcel P75= formula(=(P73+P74))
putexcel Q75= formula(=(Q73+Q74))

**** Western Europe WE
putexcel A77= ("UN - Western Europe")
putexcel A78= ("Female")
tabstat un_WE_2015_f un_WE_2016_f un_WE_2017_f un_WE_2018_f un_WE_2019_f un_WE_2020_f  un_WE_2021_f un_WE_2022_f un_WE_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B78= matrix(results)
tabstat un_WE_2024_f un_WE_2025_f un_WE_2026_f un_WE_2027_f un_WE_2028_f un_WE_2029_f  un_WE_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K78= matrix(results)
putexcel A79= ("Male")
tabstat un_WE_2015_m un_WE_2016_m un_WE_2017_m un_WE_2018_m un_WE_2019_m un_WE_2020_m  un_WE_2021_m un_WE_2022_m un_WE_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B79= matrix(results)
tabstat un_WE_2024_m un_WE_2025_m un_WE_2026_m un_WE_2027_m un_WE_2028_m un_WE_2029_m  un_WE_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K79= matrix(results)
putexcel A80= ("Both")
putexcel B80= formula(=(B78+B79))
putexcel C80= formula(=(C78+C79))
putexcel D80= formula(=(D78+D79))
putexcel E80= formula(=(E78+E79))
putexcel F80= formula(=(F78+F79))
putexcel G80= formula(=(G78+G79))
putexcel H80= formula(=(H78+H79))
putexcel I80= formula(=(I78+I79))
putexcel J80= formula(=(J78+J79))
putexcel K80= formula(=(K78+K79))
putexcel L80= formula(=(L78+L79))
putexcel M80= formula(=(M78+M79))
putexcel N80= formula(=(N78+N79))
putexcel O80= formula(=(O78+O79))
putexcel P80= formula(=(P78+P79))
putexcel Q80= formula(=(Q78+Q79))


**** Latin America and Carribean LAC
putexcel A82= ("UN - Latin America and Carribean")
putexcel A83= ("Female")
tabstat un_LAC_2015_f un_LAC_2016_f un_LAC_2017_f un_LAC_2018_f un_LAC_2019_f un_LAC_2020_f  un_LAC_2021_f un_LAC_2022_f un_LAC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B83= matrix(results)
tabstat un_LAC_2024_f un_LAC_2025_f un_LAC_2026_f un_LAC_2027_f un_LAC_2028_f un_LAC_2029_f  un_LAC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K83= matrix(results)
putexcel A84= ("Male")
tabstat un_LAC_2015_m un_LAC_2016_m un_LAC_2017_m un_LAC_2018_m un_LAC_2019_m un_LAC_2020_m  un_LAC_2021_m un_LAC_2022_m un_LAC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B84= matrix(results)
tabstat un_LAC_2024_m un_LAC_2025_m un_LAC_2026_m un_LAC_2027_m un_LAC_2028_m un_LAC_2029_m  un_LAC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K84= matrix(results)
putexcel A85= ("Both")
putexcel B85= formula(=(B83+B84))
putexcel C85= formula(=(C83+C84))
putexcel D85= formula(=(D83+D84))
putexcel E85= formula(=(E83+E84))
putexcel F85= formula(=(F83+F84))
putexcel G85= formula(=(G83+G84))
putexcel H85= formula(=(H83+H84))
putexcel I85= formula(=(I83+I84))
putexcel J85= formula(=(J83+J84))
putexcel K85= formula(=(K83+K84))
putexcel L85= formula(=(L83+L84))
putexcel M85= formula(=(M83+M84))
putexcel N85= formula(=(N83+N84))
putexcel O85= formula(=(O83+O84))
putexcel P85= formula(=(P83+P84))
putexcel Q85= formula(=(Q83+Q84))


**** Middle East and North Africa MENA
putexcel A87= ("UN - Middle East and North Africa")
putexcel A88= ("Female")
tabstat un_MENA_2015_f un_MENA_2016_f un_MENA_2017_f un_MENA_2018_f un_MENA_2019_f un_MENA_2020_f  un_MENA_2021_f un_MENA_2022_f un_MENA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B88= matrix(results)
tabstat un_MENA_2024_f un_MENA_2025_f un_MENA_2026_f un_MENA_2027_f un_MENA_2028_f un_MENA_2029_f  un_MENA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K88= matrix(results)
putexcel A89= ("Male")
tabstat un_MENA_2015_m un_MENA_2016_m un_MENA_2017_m un_MENA_2018_m un_MENA_2019_m un_MENA_2020_m  un_MENA_2021_m un_MENA_2022_m un_MENA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B89= matrix(results)
tabstat un_MENA_2024_m un_MENA_2025_m un_MENA_2026_m un_MENA_2027_m un_MENA_2028_m un_MENA_2029_m  un_MENA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K89= matrix(results)
putexcel A90= ("Both")
putexcel B90= formula(=(B88+B89))
putexcel C90= formula(=(C88+C89))
putexcel D90= formula(=(D88+D89))
putexcel E90= formula(=(E88+E89))
putexcel F90= formula(=(F88+F89))
putexcel G90= formula(=(G88+G89))
putexcel H90= formula(=(H88+H89))
putexcel I90= formula(=(I88+I89))
putexcel J90= formula(=(J88+J89))
putexcel K90= formula(=(K88+K89))
putexcel L90= formula(=(L88+L89))
putexcel M90= formula(=(M88+M89))
putexcel N90= formula(=(N88+N89))
putexcel O90= formula(=(O88+O89))
putexcel P90= formula(=(P88+P89))
putexcel Q90= formula(=(Q88+Q89))


**** North America  NA
putexcel A92= ("UN - North America")
putexcel A93= ("Female")
tabstat un_NA_2015_f un_NA_2016_f un_NA_2017_f un_NA_2018_f un_NA_2019_f un_NA_2020_f  un_NA_2021_f un_NA_2022_f un_NA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B93= matrix(results)
tabstat un_NA_2024_f un_NA_2025_f un_NA_2026_f un_NA_2027_f un_NA_2028_f un_NA_2029_f  un_NA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K93= matrix(results)
putexcel A94= ("Male")
tabstat un_NA_2015_m un_NA_2016_m un_NA_2017_m un_NA_2018_m un_NA_2019_m un_NA_2020_m  un_NA_2021_m un_NA_2022_m un_NA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B94= matrix(results)
tabstat un_NA_2024_m un_NA_2025_m un_NA_2026_m un_NA_2027_m un_NA_2028_m un_NA_2029_m  un_NA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K94= matrix(results)
putexcel A95= ("Both")
putexcel B95= formula(=(B93+B94))
putexcel C95= formula(=(C93+C94))
putexcel D95= formula(=(D93+D94))
putexcel E95= formula(=(E93+E94))
putexcel F95= formula(=(F93+F94))
putexcel G95= formula(=(G93+G94))
putexcel H95= formula(=(H93+H94))
putexcel I95= formula(=(I93+I94))
putexcel J95= formula(=(J93+J94))
putexcel K95= formula(=(K93+K94))
putexcel L95= formula(=(L93+L94))
putexcel M95= formula(=(M93+M94))
putexcel N95= formula(=(N93+N94))
putexcel O95= formula(=(O93+O94))
putexcel P95= formula(=(P93+P94))
putexcel Q95= formula(=(Q93+Q94))


**** South Asia  SA
putexcel A97= ("UN - South Asia")
putexcel A98= ("Female")
tabstat un_SA_2015_f un_SA_2016_f un_SA_2017_f un_SA_2018_f un_SA_2019_f un_SA_2020_f  un_SA_2021_f un_SA_2022_f un_SA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B98= matrix(results)
tabstat un_SA_2024_f un_SA_2025_f un_SA_2026_f un_SA_2027_f un_SA_2028_f un_SA_2029_f  un_SA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K98= matrix(results)
putexcel A99= ("Male")
tabstat un_SA_2015_m un_SA_2016_m un_SA_2017_m un_SA_2018_m un_SA_2019_m un_SA_2020_m  un_SA_2021_m un_SA_2022_m un_SA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B99= matrix(results)
tabstat un_SA_2024_m un_SA_2025_m un_SA_2026_m un_SA_2027_m un_SA_2028_m un_SA_2029_m  un_SA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K99= matrix(results)
putexcel A100= ("Both")
putexcel B100= formula(=(B98+B99))
putexcel C100= formula(=(C98+C99))
putexcel D100= formula(=(D98+D99))
putexcel E100= formula(=(E98+E99))
putexcel F100= formula(=(F98+F99))
putexcel G100= formula(=(G98+G99))
putexcel H100= formula(=(H98+H99))
putexcel I100= formula(=(I98+I99))
putexcel J100= formula(=(J98+J99))
putexcel K100= formula(=(K98+K99))
putexcel L100= formula(=(L98+L99))
putexcel M100= formula(=(M98+M99))
putexcel N100= formula(=(N98+N99))
putexcel O100= formula(=(O98+O99))
putexcel P100= formula(=(P98+P99))
putexcel Q100= formula(=(Q98+Q99))


**** Eastern and Southern Africa ESA
putexcel A102= ("UN - Eastern and Southern Africa")
putexcel A103= ("Female")
tabstat un_ESA_2015_f un_ESA_2016_f un_ESA_2017_f un_ESA_2018_f un_ESA_2019_f un_ESA_2020_f  un_ESA_2021_f un_ESA_2022_f un_ESA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B103= matrix(results)
tabstat un_ESA_2024_f un_ESA_2025_f un_ESA_2026_f un_ESA_2027_f un_ESA_2028_f un_ESA_2029_f  un_ESA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K103= matrix(results)
putexcel A104= ("Male")
tabstat un_ESA_2015_m un_ESA_2016_m un_ESA_2017_m un_ESA_2018_m un_ESA_2019_m un_ESA_2020_m  un_ESA_2021_m un_ESA_2022_m un_ESA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B104= matrix(results)
tabstat un_ESA_2024_m un_ESA_2025_m un_ESA_2026_m un_ESA_2027_m un_ESA_2028_m un_ESA_2029_m  un_ESA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K104= matrix(results)
putexcel A105= ("Both")
putexcel B105= formula(=(B103+B104))
putexcel C105= formula(=(C103+C104))
putexcel D105= formula(=(D103+D104))
putexcel E105= formula(=(E103+E104))
putexcel F105= formula(=(F103+F104))
putexcel G105= formula(=(G103+G104))
putexcel H105= formula(=(H103+H104))
putexcel I105= formula(=(I103+I104))
putexcel J105= formula(=(J103+J104))
putexcel K105= formula(=(K103+K104))
putexcel L105= formula(=(L103+L104))
putexcel M105= formula(=(M103+M104))
putexcel N105= formula(=(N103+N104))
putexcel O105= formula(=(O103+O104))
putexcel P105= formula(=(P103+P104))
putexcel Q105= formula(=(Q103+Q104))



**** Western and Central Africa
putexcel A107= ("UN - Western and Central Africa")
putexcel A108= ("Female")
tabstat un_WCA_2015_f un_WCA_2016_f un_WCA_2017_f un_WCA_2018_f un_WCA_2019_f un_WCA_2020_f  un_WCA_2021_f un_WCA_2022_f un_WCA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B108= matrix(results)
tabstat un_WCA_2024_f un_WCA_2025_f un_WCA_2026_f un_WCA_2027_f un_WCA_2028_f un_WCA_2029_f  un_WCA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K108= matrix(results)
putexcel A109= ("Male")
tabstat un_WCA_2015_m un_WCA_2016_m un_WCA_2017_m un_WCA_2018_m un_WCA_2019_m un_WCA_2020_m  un_WCA_2021_m un_WCA_2022_m un_WCA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B109= matrix(results)
tabstat un_WCA_2024_m un_WCA_2025_m un_WCA_2026_m un_WCA_2027_m un_WCA_2028_m un_WCA_2029_m  un_WCA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K109= matrix(results)
putexcel A110= ("Both")
putexcel B110= formula(=(B108+B109))
putexcel C110= formula(=(C108+C109))
putexcel D110= formula(=(D108+D109))
putexcel E110= formula(=(E108+E109))
putexcel F110= formula(=(F108+F109))
putexcel G110= formula(=(G108+G109))
putexcel H110= formula(=(H108+H109))
putexcel I110= formula(=(I108+I109))
putexcel J110= formula(=(J108+J109))
putexcel K110= formula(=(K108+K109))
putexcel L110= formula(=(L108+L109))
putexcel M110= formula(=(M108+M109))
putexcel N110= formula(=(N108+N109))
putexcel O110= formula(=(O108+O109))
putexcel P110= formula(=(P108+P109))
putexcel Q110= formula(=(Q108+Q109))



**** Region --  UN


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen non_fragile_`x'_f=total(oppsecured_`x'_f) if oecd_fragile==0
egen non_fragile_`x'_m=total(oppsecured_`x'_m) if oecd_fragile==0
egen fragile_`x'_f=total(oppsecured_`x'_f) if oecd_fragile==1
egen fragile_`x'_m=total(oppsecured_`x'_m) if oecd_fragile==1
}
*

**** Non-Fragile
putexcel A113= ("OECD 2020 - Non-Fragile")
putexcel A114= ("Female")
tabstat non_fragile_2015_f non_fragile_2016_f non_fragile_2017_f non_fragile_2018_f non_fragile_2019_f non_fragile_2020_f  non_fragile_2021_f non_fragile_2022_f non_fragile_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B114= matrix(results)
tabstat non_fragile_2024_f non_fragile_2025_f non_fragile_2026_f non_fragile_2027_f non_fragile_2028_f non_fragile_2029_f  non_fragile_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K114= matrix(results)
putexcel A115= ("Male")
tabstat non_fragile_2015_m non_fragile_2016_m non_fragile_2017_m non_fragile_2018_m non_fragile_2019_m non_fragile_2020_m  non_fragile_2021_m non_fragile_2022_m non_fragile_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B115= matrix(results)
tabstat non_fragile_2024_m non_fragile_2025_m non_fragile_2026_m non_fragile_2027_m non_fragile_2028_m non_fragile_2029_m  non_fragile_2030_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  K115= matrix(results)
putexcel A116= ("Both")
putexcel B116= formula(=(B114+B115))
putexcel C116= formula(=(C114+C115))
putexcel D116= formula(=(D114+D115))
putexcel E116= formula(=(E114+E115))
putexcel F116= formula(=(F114+F115))
putexcel G116= formula(=(G114+G115))
putexcel H116= formula(=(H114+H115))
putexcel I116= formula(=(I114+I115))
putexcel J116= formula(=(J114+J115))
putexcel K116= formula(=(K114+K115))
putexcel L116= formula(=(L114+L115))
putexcel M116= formula(=(M114+M115))
putexcel N116= formula(=(N114+N115))
putexcel O116= formula(=(O114+O115))
putexcel P116= formula(=(P114+P115))
putexcel Q116= formula(=(Q114+Q115))


**** Fragile
putexcel A118= ("OECD 2020 - Fragile")
putexcel A119= ("Female")
tabstat fragile_2015_f fragile_2016_f fragile_2017_f fragile_2018_f fragile_2019_f fragile_2020_f  fragile_2021_f fragile_2022_f fragile_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B119= matrix(results)
tabstat fragile_2024_f fragile_2025_f fragile_2026_f fragile_2027_f fragile_2028_f fragile_2029_f  fragile_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K119= matrix(results)
putexcel A120= ("Male")
tabstat fragile_2015_m fragile_2016_m fragile_2017_m fragile_2018_m fragile_2019_m fragile_2020_m  fragile_2021_m fragile_2022_m fragile_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B120= matrix(results)
tabstat fragile_2024_m fragile_2025_m fragile_2026_m fragile_2027_m fragile_2028_m fragile_2029_m  fragile_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K120= matrix(results)
putexcel A121= ("Both")
putexcel B121= formula(=(B119+B120))
putexcel C121= formula(=(C119+C120))
putexcel D121= formula(=(D119+D120))
putexcel E121= formula(=(E119+E120))
putexcel F121= formula(=(F119+F120))
putexcel G121= formula(=(G119+G120))
putexcel H121= formula(=(H119+H120))
putexcel I121= formula(=(I119+I120))
putexcel J121= formula(=(J119+J120))
putexcel K121= formula(=(K119+K120))
putexcel L121= formula(=(L119+L120))
putexcel M121= formula(=(M119+M120))
putexcel N121= formula(=(N119+N120))
putexcel O121= formula(=(O119+O120))
putexcel P121= formula(=(P119+P120))
putexcel Q121= formula(=(Q119+Q120))



clear

use "$interim/Lost_Potential_Database_With_Indicators_Covid.dta", clear

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

rename lost_sum_`x'_f old_lost_sum_`x'_f
rename lost_sum_`x'_f_covid lost_sum_`x'_f
rename lost_sum_`x'_m old_lost_sum_`x'_m
rename lost_sum_`x'_m_covid lost_sum_`x'_m

rename lostpotential_`x'_f old_lostpotential_`x'_f
rename lostpotential_`x'_f_covid lostpotential_`x'_f
rename lostpotential_`x'_m old_lostpotential_`x'_m
rename lostpotential_`x'_m_covid lostpotential_`x'_m

}
*


putexcel set "$outputs\Tables_Combined_Simplified.xlsx", sheet(7. LP C19 BAU) modify

putexcel A5 = ("Female")
putexcel A6 = ("Male")

sum lost_sum_2015_f
return list
putexcel B4 = (2015)
putexcel B5 = (`r(mean)')

sum lost_sum_2016_f
return list
putexcel C4 = (2016)
putexcel C5 = (`r(mean)')

sum lost_sum_2017_f
return list
putexcel D4 = (2017)
putexcel D5 = (`r(mean)')

sum lost_sum_2018_f
return list
putexcel E4 = (2018)
putexcel E5 = (`r(mean)')

sum lost_sum_2019_f
return list
putexcel F4 = (2019)
putexcel F5 = (`r(mean)')

sum lost_sum_2020_f
return list
putexcel G4 = (2020)
putexcel G5 = (`r(mean)')

sum lost_sum_2021_f
return list
putexcel H4 = (2021)
putexcel H5 = (`r(mean)')

sum lost_sum_2022_f
return list
putexcel I4 = (2022)
putexcel I5 = (`r(mean)')

sum lost_sum_2023_f
return list
putexcel J4 = (2023)
putexcel J5 = (`r(mean)')

sum lost_sum_2024_f
return list
putexcel K4 = (2024)
putexcel K5 = (`r(mean)')

sum lost_sum_2025_f
return list
putexcel L4 = (2025)
putexcel L5 = (`r(mean)')

sum lost_sum_2026_f
return list
putexcel M4 = (2026)
putexcel M5 = (`r(mean)')

sum lost_sum_2027_f
return list
putexcel N4 = (2027)
putexcel N5 = (`r(mean)')

sum lost_sum_2028_f
return list
putexcel O4 = (2028)
putexcel O5 = (`r(mean)')

sum lost_sum_2029_f
return list
putexcel P4 = (2029)
putexcel P5 = (`r(mean)')

sum lost_sum_2030_f
return list
putexcel Q4 = (2030)
putexcel Q5 = (`r(mean)')




sum lost_sum_2015_m
return list
putexcel B6 = (`r(mean)')

sum lost_sum_2016_m
return list
putexcel C6 = (`r(mean)')


sum lost_sum_2017_m
return list
putexcel D6  = (`r(mean)')


sum lost_sum_2018_m
return list
putexcel E6 = (`r(mean)')


sum lost_sum_2019_m
return list
putexcel F6 = (`r(mean)')

sum lost_sum_2020_m
return list
putexcel G6 = (`r(mean)')

sum lost_sum_2021_m
return list
putexcel H6 = (`r(mean)')

sum lost_sum_2022_m
return list
putexcel I6 = (`r(mean)')

sum lost_sum_2023_m
return list
putexcel J6 = (`r(mean)')

sum lost_sum_2024_m
return list
putexcel K6 = (`r(mean)')

sum lost_sum_2025_m
return list
putexcel L6 = (`r(mean)')

sum lost_sum_2026_m
return list
putexcel M6 = (`r(mean)')


sum lost_sum_2027_m
return list
putexcel N6 = (`r(mean)')

sum lost_sum_2028_m
return list
putexcel O6 = (`r(mean)')

sum lost_sum_2029_m
return list
putexcel P6 = (`r(mean)')

sum lost_sum_2030_m
return list
putexcel Q6 = (`r(mean)')


putexcel A7 = ("Both")
putexcel B7= formula(=(B5+B6))
putexcel C7= formula(=(C5+C6))
putexcel D7= formula(=(D5+D6))
putexcel E7= formula(=(E5+E6))
putexcel F7= formula(=(F5+F6))
putexcel G7= formula(=(G5+G6))
putexcel H7= formula(=(H5+H6))
putexcel I7= formula(=(I5+I6))
putexcel J7= formula(=(J5+J6))
putexcel K7= formula(=(K5+K6))
putexcel L7= formula(=(L5+L6))
putexcel M7= formula(=(M5+M6))
putexcel N7= formula(=(N5+N6))
putexcel O7= formula(=(O5+O6))
putexcel P7= formula(=(P5+P6))
putexcel Q7= formula(=(Q5+Q6))



foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen LIC_`x'_f=total(lostpotential_`x'_f) if income_group==1
egen LIC_`x'_m=total(lostpotential_`x'_m) if income_group==1
egen LMIC_`x'_f=total(lostpotential_`x'_f) if income_group==2
egen LMIC_`x'_m=total(lostpotential_`x'_m) if income_group==2
egen UMIC_`x'_f=total(lostpotential_`x'_f) if income_group==3
egen UMIC_`x'_m=total(lostpotential_`x'_m) if income_group==3
egen HIC_`x'_f=total(lostpotential_`x'_f) if income_group==4
egen HIC_`x'_m=total(lostpotential_`x'_m) if income_group==4

}
*

****Income table******

**** Low Income
putexcel A10= ("Low Income")
putexcel A11= ("Female")
tabstat LIC_2015_f LIC_2016_f LIC_2017_f LIC_2018_f LIC_2019_f LIC_2020_f  LIC_2021_f LIC_2022_f LIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B11= matrix(results)
tabstat LIC_2024_f LIC_2025_f LIC_2026_f LIC_2027_f LIC_2028_f LIC_2029_f  LIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K11= matrix(results)
putexcel A12= ("Male")
tabstat LIC_2015_m LIC_2016_m LIC_2017_m LIC_2018_m LIC_2019_m LIC_2020_m  LIC_2021_m LIC_2022_m LIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B12= matrix(results)
tabstat LIC_2024_m LIC_2025_m LIC_2026_m LIC_2027_m LIC_2028_m LIC_2029_m  LIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K12= matrix(results)
putexcel A13= ("Both")
putexcel B13= formula(=(B11+B12))
putexcel C13= formula(=(C11+C12))
putexcel D13= formula(=(D11+D12))
putexcel E13= formula(=(E11+E12))
putexcel F13= formula(=(F11+F12))
putexcel G13= formula(=(G11+G12))
putexcel H13= formula(=(H11+H12))
putexcel I13= formula(=(I11+I12))
putexcel J13= formula(=(J11+J12))
putexcel K13= formula(=(K11+K12))
putexcel L13= formula(=(L11+L12))
putexcel M13= formula(=(M11+M12))
putexcel N13= formula(=(N11+N12))
putexcel O13= formula(=(O11+O12))
putexcel P13= formula(=(P11+P12))
putexcel Q13= formula(=(Q11+Q12))

*****Low_middle Income
putexcel A15= ("Lower-Middle Income")
putexcel A16= ("Female")
tabstat LMIC_2015_f LMIC_2016_f LMIC_2017_f LMIC_2018_f LMIC_2019_f LMIC_2020_f  LMIC_2021_f LMIC_2022_f LMIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B16= matrix(results)
tabstat LMIC_2024_f LMIC_2025_f LMIC_2026_f LMIC_2027_f LMIC_2028_f LMIC_2029_f  LMIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K16= matrix(results)
putexcel A17= ("Male")
tabstat LMIC_2015_m LMIC_2016_m LMIC_2017_m LMIC_2018_m LMIC_2019_m LMIC_2020_m  LMIC_2021_m LMIC_2022_m LMIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B17= matrix(results)
tabstat LMIC_2024_m LMIC_2025_m LMIC_2026_m LMIC_2027_m LMIC_2028_m LMIC_2029_m  LMIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K17= matrix(results)
putexcel A18= ("Both")
putexcel B18= formula(=(B17+B16))
putexcel C18= formula(=(C17+C16))
putexcel D18= formula(=(D17+D16))
putexcel E18= formula(=(E17+E16))
putexcel F18= formula(=(F17+F16))
putexcel G18= formula(=(G17+G16))
putexcel H18= formula(=(H17+H16))
putexcel I18= formula(=(I17+I16))
putexcel J18= formula(=(J17+J16))
putexcel K18= formula(=(K17+K16))
putexcel L18= formula(=(L17+L16))
putexcel M18= formula(=(M17+M16))
putexcel N18= formula(=(N17+N16))
putexcel O18= formula(=(O17+O16))
putexcel P18= formula(=(P17+P16))
putexcel Q18= formula(=(Q17+Q16))

**********************Upper Middle Income
putexcel A20= ("Upper-Middle Income")
putexcel A21= ("Female")
tabstat UMIC_2015_f UMIC_2016_f UMIC_2017_f UMIC_2018_f UMIC_2019_f UMIC_2020_f  UMIC_2021_f UMIC_2022_f UMIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B21= matrix(results)
tabstat UMIC_2024_f UMIC_2025_f UMIC_2026_f UMIC_2027_f UMIC_2028_f UMIC_2029_f  UMIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K21= matrix(results)
putexcel A22= ("Male")
tabstat UMIC_2015_m UMIC_2016_m UMIC_2017_m UMIC_2018_m UMIC_2019_m UMIC_2020_m  UMIC_2021_m UMIC_2022_m UMIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B22= matrix(results)
tabstat UMIC_2024_m UMIC_2025_m UMIC_2026_m UMIC_2027_m UMIC_2028_m UMIC_2029_m  UMIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K22= matrix(results)

putexcel A23= ("Both")
putexcel B23= formula(=(B22+B21))
putexcel C23= formula(=(C22+C21))
putexcel D23= formula(=(D22+D21))
putexcel E23= formula(=(E22+E21))
putexcel F23= formula(=(F22+F21))
putexcel G23= formula(=(G22+G21))
putexcel H23= formula(=(H22+H21))
putexcel I23= formula(=(I22+I21))
putexcel J23= formula(=(J22+J21))
putexcel K23= formula(=(K22+K21))
putexcel L23= formula(=(L22+L21))
putexcel M23= formula(=(M22+M21))
putexcel N23= formula(=(N22+N21))
putexcel O23= formula(=(O22+O21))
putexcel P23= formula(=(P22+P21))
putexcel Q23= formula(=(Q22+Q21))

**********************High Income
putexcel A25= ("High Income")
putexcel A26= ("Female")
tabstat HIC_2015_f HIC_2016_f HIC_2017_f HIC_2018_f HIC_2019_f HIC_2020_f  HIC_2021_f HIC_2022_f HIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B26= matrix(results)
tabstat HIC_2024_f HIC_2025_f HIC_2026_f HIC_2027_f HIC_2028_f HIC_2029_f  HIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K26= matrix(results)
putexcel A27= ("Male")
tabstat HIC_2015_m HIC_2016_m HIC_2017_m HIC_2018_m HIC_2019_m HIC_2020_m  HIC_2021_m HIC_2022_m HIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B27= matrix(results)
tabstat HIC_2024_m HIC_2025_m HIC_2026_m HIC_2027_m HIC_2028_m HIC_2029_m  HIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K27= matrix(results)
putexcel A28= ("Both")
putexcel B28= formula(=(B27+B26))
putexcel C28= formula(=(C27+C26))
putexcel D28= formula(=(D27+D26))
putexcel E28= formula(=(E27+E26))
putexcel F28= formula(=(F27+F26))
putexcel G28= formula(=(G27+G26))
putexcel H28= formula(=(H27+H26))
putexcel I28= formula(=(I27+I26))
putexcel J28= formula(=(J27+J26))
putexcel K28= formula(=(K27+K26))
putexcel L28= formula(=(L27+L26))
putexcel M28= formula(=(M27+M26))
putexcel N28= formula(=(N27+N26))
putexcel O28= formula(=(O27+O26))
putexcel P28= formula(=(P27+P26))
putexcel Q28= formula(=(Q27+Q26))



**** Region --  World Bank


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen EAP_`x'_f=total(lostpotential_`x'_f) if world_region==1
egen EAP_`x'_m=total(lostpotential_`x'_m) if world_region==1
egen ECA_`x'_f=total(lostpotential_`x'_f) if world_region==2
egen ECA_`x'_m=total(lostpotential_`x'_m) if world_region==2
egen LAC_`x'_f=total(lostpotential_`x'_f) if world_region==3
egen LAC_`x'_m=total(lostpotential_`x'_m) if world_region==3
egen MENA_`x'_f=total(lostpotential_`x'_f) if world_region==4
egen MENA_`x'_m=total(lostpotential_`x'_m) if world_region==4
egen NA_`x'_f=total(lostpotential_`x'_f) if world_region==5
egen NA_`x'_m=total(lostpotential_`x'_m) if world_region==5
egen SA_`x'_f=total(lostpotential_`x'_f) if world_region==6
egen SA_`x'_m=total(lostpotential_`x'_m) if world_region==6
egen SSA_`x'_f=total(lostpotential_`x'_f) if world_region==7
egen SSA_`x'_m=total(lostpotential_`x'_m) if world_region==7


}
*

*local regioncodes EAP ECA LAC MENA NA SA SSA
*foreach reg of regioncodes 

****Region table******

**** East Asia and Pacific EAP
putexcel A31= ("WB - East Asia and Pacific")
putexcel A32= ("Female")
tabstat EAP_2015_f EAP_2016_f EAP_2017_f EAP_2018_f EAP_2019_f EAP_2020_f  EAP_2021_f EAP_2022_f EAP_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B32= matrix(results)
tabstat EAP_2024_f EAP_2025_f EAP_2026_f EAP_2027_f EAP_2028_f EAP_2029_f  EAP_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K32= matrix(results)
putexcel A33= ("Male")
tabstat EAP_2015_m EAP_2016_m EAP_2017_m EAP_2018_m EAP_2019_m EAP_2020_m  EAP_2021_m EAP_2022_m EAP_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B33= matrix(results)
tabstat EAP_2024_m EAP_2025_m EAP_2026_m EAP_2027_m EAP_2028_m EAP_2029_m  EAP_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K33= matrix(results)
putexcel A34= ("Both")
putexcel B34= formula(=(B32+B33))
putexcel C34= formula(=(C32+C33))
putexcel D34= formula(=(D32+D33))
putexcel E34= formula(=(E32+E33))
putexcel F34= formula(=(F32+F33))
putexcel G34= formula(=(G32+G33))
putexcel H34= formula(=(H32+H33))
putexcel I34= formula(=(I32+I33))
putexcel J34= formula(=(J32+J33))
putexcel K34= formula(=(K32+K33))
putexcel L34= formula(=(L32+L33))
putexcel M34= formula(=(M32+M33))
putexcel N34= formula(=(N32+N33))
putexcel O34= formula(=(O32+O33))
putexcel P34= formula(=(P32+P33))
putexcel Q34= formula(=(Q32+Q33))

**** Europe and Central Asia ECA
putexcel A36= ("WB - Europe and Central Asia")
putexcel A37= ("Female")
tabstat ECA_2015_f ECA_2016_f ECA_2017_f ECA_2018_f ECA_2019_f ECA_2020_f  ECA_2021_f ECA_2022_f ECA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B37= matrix(results)
tabstat ECA_2024_f ECA_2025_f ECA_2026_f ECA_2027_f ECA_2028_f ECA_2029_f  ECA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K37= matrix(results)
putexcel A38= ("Male")
tabstat ECA_2015_m ECA_2016_m ECA_2017_m ECA_2018_m ECA_2019_m ECA_2020_m  ECA_2021_m ECA_2022_m ECA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B38= matrix(results)
tabstat ECA_2024_m ECA_2025_m ECA_2026_m ECA_2027_m ECA_2028_m ECA_2029_m  ECA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K38= matrix(results)
putexcel A39= ("Both")
putexcel B39= formula(=(B37+B38))
putexcel C39= formula(=(C37+C38))
putexcel D39= formula(=(D37+D38))
putexcel E39= formula(=(E37+E38))
putexcel F39= formula(=(F37+F38))
putexcel G39= formula(=(G37+G38))
putexcel H39= formula(=(H37+H38))
putexcel I39= formula(=(I37+I38))
putexcel J39= formula(=(J37+J38))
putexcel K39= formula(=(K37+K38))
putexcel L39= formula(=(L37+L38))
putexcel M39= formula(=(M37+M38))
putexcel N39= formula(=(N37+N38))
putexcel O39= formula(=(O37+O38))
putexcel P39= formula(=(P37+P38))
putexcel Q39= formula(=(Q37+Q38))

**** Latin America and Carribean LAC
putexcel A41= ("WB - Latin America and Carribean")
putexcel A42= ("Female")
tabstat LAC_2015_f LAC_2016_f LAC_2017_f LAC_2018_f LAC_2019_f LAC_2020_f  LAC_2021_f LAC_2022_f LAC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B42= matrix(results)
tabstat LAC_2024_f LAC_2025_f LAC_2026_f LAC_2027_f LAC_2028_f LAC_2029_f  LAC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K42= matrix(results)
putexcel A43= ("Male")
tabstat LAC_2015_m LAC_2016_m LAC_2017_m LAC_2018_m LAC_2019_m LAC_2020_m  LAC_2021_m LAC_2022_m LAC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B43= matrix(results)
tabstat LAC_2024_m LAC_2025_m LAC_2026_m LAC_2027_m LAC_2028_m LAC_2029_m  LAC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K43= matrix(results)
putexcel A44= ("Both")
putexcel B44= formula(=(B42+B43))
putexcel C44= formula(=(C42+C43))
putexcel D44= formula(=(D42+D43))
putexcel E44= formula(=(E42+E43))
putexcel F44= formula(=(F42+F43))
putexcel G44= formula(=(G42+G43))
putexcel H44= formula(=(H42+H43))
putexcel I44= formula(=(I42+I43))
putexcel J44= formula(=(J42+J43))
putexcel K44= formula(=(K42+K43))
putexcel L44= formula(=(L42+L43))
putexcel M44= formula(=(M42+M43))
putexcel N44= formula(=(N42+N43))
putexcel O44= formula(=(O42+O43))
putexcel P44= formula(=(P42+P43))
putexcel Q44= formula(=(Q42+Q43))

**** Middle East and North Africa MENA
putexcel A46= ("WB - Middle East and North Africa")
putexcel A47= ("Female")
tabstat MENA_2015_f MENA_2016_f MENA_2017_f MENA_2018_f MENA_2019_f MENA_2020_f  MENA_2021_f MENA_2022_f MENA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B47= matrix(results)
tabstat MENA_2024_f MENA_2025_f MENA_2026_f MENA_2027_f MENA_2028_f MENA_2029_f  MENA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K47= matrix(results)
putexcel A48= ("Male")
tabstat MENA_2015_m MENA_2016_m MENA_2017_m MENA_2018_m MENA_2019_m MENA_2020_m  MENA_2021_m MENA_2022_m MENA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B48= matrix(results)
tabstat MENA_2024_m MENA_2025_m MENA_2026_m MENA_2027_m MENA_2028_m MENA_2029_m  MENA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K48= matrix(results)
putexcel A49= ("Both")
putexcel B49= formula(=(B47+B48))
putexcel C49= formula(=(C47+C48))
putexcel D49= formula(=(D47+D48))
putexcel E49= formula(=(E47+E48))
putexcel F49= formula(=(F47+F48))
putexcel G49= formula(=(G47+G48))
putexcel H49= formula(=(H47+H48))
putexcel I49= formula(=(I47+I48))
putexcel J49= formula(=(J47+J48))
putexcel K49= formula(=(K47+K48))
putexcel L49= formula(=(L47+L48))
putexcel M49= formula(=(M47+M48))
putexcel N49= formula(=(N47+N48))
putexcel O49= formula(=(O47+O48))
putexcel P49= formula(=(P47+P48))
putexcel Q49= formula(=(Q47+Q48))

**** North America NA
putexcel A51= ("WB - North America")
putexcel A52= ("Female")
tabstat NA_2015_f NA_2016_f NA_2017_f NA_2018_f NA_2019_f NA_2020_f  NA_2021_f NA_2022_f NA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B52= matrix(results)
tabstat NA_2024_f NA_2025_f NA_2026_f NA_2027_f NA_2028_f NA_2029_f  NA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K52= matrix(results)
putexcel A53= ("Male")
tabstat NA_2015_m NA_2016_m NA_2017_m NA_2018_m NA_2019_m NA_2020_m  NA_2021_m NA_2022_m NA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B53= matrix(results)
tabstat NA_2024_m NA_2025_m NA_2026_m NA_2027_m NA_2028_m NA_2029_m  NA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K53= matrix(results)
putexcel A54= ("Both")
putexcel B54= formula(=(B52+B53))
putexcel C54= formula(=(C52+C53))
putexcel D54= formula(=(D52+D53))
putexcel E54= formula(=(E52+E53))
putexcel F54= formula(=(F52+F53))
putexcel G54= formula(=(G52+G53))
putexcel H54= formula(=(H52+H53))
putexcel I54= formula(=(I52+I53))
putexcel J54= formula(=(J52+J53))
putexcel K54= formula(=(K52+K53))
putexcel L54= formula(=(L52+L53))
putexcel M54= formula(=(M52+M53))
putexcel N54= formula(=(N52+N53))
putexcel O54= formula(=(O52+O53))
putexcel P54= formula(=(P52+P53))
putexcel Q54= formula(=(Q52+Q53))

**** South Asia  SA
putexcel A56= ("WB - South Asia")
putexcel A57= ("Female")
tabstat SA_2015_f SA_2016_f SA_2017_f SA_2018_f SA_2019_f SA_2020_f  SA_2021_f SA_2022_f SA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B57= matrix(results)
tabstat SA_2024_f SA_2025_f SA_2026_f SA_2027_f SA_2028_f SA_2029_f  SA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K57= matrix(results)
putexcel A58= ("Male")
tabstat SA_2015_m SA_2016_m SA_2017_m SA_2018_m SA_2019_m SA_2020_m  SA_2021_m SA_2022_m SA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B58= matrix(results)
tabstat SA_2024_m SA_2025_m SA_2026_m SA_2027_m SA_2028_m SA_2029_m  SA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K58= matrix(results)
putexcel A59= ("Both")
putexcel B59= formula(=(B57+B58))
putexcel C59= formula(=(C57+C58))
putexcel D59= formula(=(D57+D58))
putexcel E59= formula(=(E57+E58))
putexcel F59= formula(=(F57+F58))
putexcel G59= formula(=(G57+G58))
putexcel H59= formula(=(H57+H58))
putexcel I59= formula(=(I57+I58))
putexcel J59= formula(=(J57+J58))
putexcel K59= formula(=(K57+K58))
putexcel L59= formula(=(L57+L58))
putexcel M59= formula(=(M57+M58))
putexcel N59= formula(=(N57+N58))
putexcel O59= formula(=(O57+O58))
putexcel P59= formula(=(P57+P58))
putexcel Q59= formula(=(Q57+Q58))

**** Sub Saharan Africa  SSA
putexcel A61= ("WB - Sub-Saharan Africa")
putexcel A62= ("Female")
tabstat SSA_2015_f SSA_2016_f SSA_2017_f SSA_2018_f SSA_2019_f SSA_2020_f  SSA_2021_f SSA_2022_f SSA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B62= matrix(results)
tabstat SSA_2024_f SSA_2025_f SSA_2026_f SSA_2027_f SSA_2028_f SSA_2029_f  SSA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K62= matrix(results)
putexcel A63= ("Male")
tabstat SSA_2015_m SSA_2016_m SSA_2017_m SSA_2018_m SSA_2019_m SSA_2020_m  SSA_2021_m SSA_2022_m SSA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B63= matrix(results)
tabstat SSA_2024_m SSA_2025_m SSA_2026_m SSA_2027_m SSA_2028_m SSA_2029_m  SSA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K63= matrix(results)
putexcel A64= ("Both")
putexcel B64= formula(=(B62+B63))
putexcel C64= formula(=(C62+C63))
putexcel D64= formula(=(D62+D63))
putexcel E64= formula(=(E62+E63))
putexcel F64= formula(=(F62+F63))
putexcel G64= formula(=(G62+G63))
putexcel H64= formula(=(H62+H63))
putexcel I64= formula(=(I62+I63))
putexcel J64= formula(=(J62+J63))
putexcel K64= formula(=(K62+K63))
putexcel L64= formula(=(L62+L63))
putexcel M64= formula(=(M62+M63))
putexcel N64= formula(=(N62+N63))
putexcel O64= formula(=(O62+O63))
putexcel P64= formula(=(P62+P63))
putexcel Q64= formula(=(Q62+Q63))



**** Region --  UN


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen un_EAP_`x'_f=total(lostpotential_`x'_f) if un_region==1
egen un_EAP_`x'_m=total(lostpotential_`x'_m) if un_region==1
egen un_EECA_`x'_f=total(lostpotential_`x'_f) if un_region==2
egen un_EECA_`x'_m=total(lostpotential_`x'_m) if un_region==2
egen un_WE_`x'_f=total(lostpotential_`x'_f) if un_region==3
egen un_WE_`x'_m=total(lostpotential_`x'_m) if un_region==3
egen un_LAC_`x'_f=total(lostpotential_`x'_f) if un_region==4
egen un_LAC_`x'_m=total(lostpotential_`x'_m) if un_region==4
egen un_MENA_`x'_f=total(lostpotential_`x'_f) if un_region==5
egen un_MENA_`x'_m=total(lostpotential_`x'_m) if un_region==5
egen un_NA_`x'_f=total(lostpotential_`x'_f) if un_region==6
egen un_NA_`x'_m=total(lostpotential_`x'_m) if un_region==6
egen un_SA_`x'_f=total(lostpotential_`x'_f) if un_region==7
egen un_SA_`x'_m=total(lostpotential_`x'_m) if un_region==7
egen un_ESA_`x'_f=total(lostpotential_`x'_f) if un_region==8
egen un_ESA_`x'_m=total(lostpotential_`x'_m) if un_region==8
egen un_WCA_`x'_f=total(lostpotential_`x'_f) if un_region==9
egen un_WCA_`x'_m=total(lostpotential_`x'_m) if un_region==9


}
*

*local regioncodes label define un_region_values 1 "EAP" 2 "EECA" 3 "WE" 4 "LAC" 5 "MENA" 6 "NA" 7 "SA" 8 "ESA" 9 "WCA"
*foreach reg of regioncodes 

****Region table******

**** East Asia and Pacific EAP
putexcel A67= ("UN - East Asia and Pacific")
putexcel A68= ("Female")
tabstat un_EAP_2015_f un_EAP_2016_f un_EAP_2017_f un_EAP_2018_f un_EAP_2019_f un_EAP_2020_f  un_EAP_2021_f un_EAP_2022_f un_EAP_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B68= matrix(results)
tabstat un_EAP_2024_f un_EAP_2025_f un_EAP_2026_f un_EAP_2027_f un_EAP_2028_f un_EAP_2029_f  un_EAP_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K68= matrix(results)
putexcel A69= ("Male")
tabstat un_EAP_2015_m un_EAP_2016_m un_EAP_2017_m un_EAP_2018_m un_EAP_2019_m un_EAP_2020_m  un_EAP_2021_m un_EAP_2022_m un_EAP_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B69= matrix(results)
tabstat un_EAP_2024_m un_EAP_2025_m un_EAP_2026_m un_EAP_2027_m un_EAP_2028_m un_EAP_2029_m  un_EAP_2030_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  K69= matrix(results)
putexcel A70= ("Both")
putexcel B70= formula(=(B68+B69))
putexcel C70= formula(=(C68+C69))
putexcel D70= formula(=(D68+D69))
putexcel E70= formula(=(E68+E69))
putexcel F70= formula(=(F68+F69))
putexcel G70= formula(=(G68+G69))
putexcel H70= formula(=(H68+H69))
putexcel I70= formula(=(I68+I69))
putexcel J70= formula(=(J68+J69))
putexcel K70= formula(=(K68+K69))
putexcel L70= formula(=(L68+L69))
putexcel M70= formula(=(M68+M69))
putexcel N70= formula(=(N68+N69))
putexcel O70= formula(=(O68+O69))
putexcel P70= formula(=(P68+P69))
putexcel Q70= formula(=(Q68+Q69))

**** Eastern Europe and Central Asia EECA
putexcel A72= ("UN - Eastern Europe and Central Asia")
putexcel A73= ("Female")
tabstat un_EECA_2015_f un_EECA_2016_f un_EECA_2017_f un_EECA_2018_f un_EECA_2019_f un_EECA_2020_f  un_EECA_2021_f un_EECA_2022_f un_EECA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B73= matrix(results)
tabstat un_EECA_2024_f un_EECA_2025_f un_EECA_2026_f un_EECA_2027_f un_EECA_2028_f un_EECA_2029_f  un_EECA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K73= matrix(results)
putexcel A74= ("Male")
tabstat un_EECA_2015_m un_EECA_2016_m un_EECA_2017_m un_EECA_2018_m un_EECA_2019_m un_EECA_2020_m  un_EECA_2021_m un_EECA_2022_m un_EECA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B74= matrix(results)
tabstat un_EECA_2024_m un_EECA_2025_m un_EECA_2026_m un_EECA_2027_m un_EECA_2028_m un_EECA_2029_m  un_EECA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K74= matrix(results)
putexcel A75= ("Both")
putexcel B75= formula(=(B73+B74))
putexcel C75= formula(=(C73+C74))
putexcel D75= formula(=(D73+D74))
putexcel E75= formula(=(E73+E74))
putexcel F75= formula(=(F73+F74))
putexcel G75= formula(=(G73+G74))
putexcel H75= formula(=(H73+H74))
putexcel I75= formula(=(I73+I74))
putexcel J75= formula(=(J73+J74))
putexcel K75= formula(=(K73+K74))
putexcel L75= formula(=(L73+L74))
putexcel M75= formula(=(M73+M74))
putexcel N75= formula(=(N73+N74))
putexcel O75= formula(=(O73+O74))
putexcel P75= formula(=(P73+P74))
putexcel Q75= formula(=(Q73+Q74))

**** Western Europe WE
putexcel A77= ("UN - Western Europe")
putexcel A78= ("Female")
tabstat un_WE_2015_f un_WE_2016_f un_WE_2017_f un_WE_2018_f un_WE_2019_f un_WE_2020_f  un_WE_2021_f un_WE_2022_f un_WE_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B78= matrix(results)
tabstat un_WE_2024_f un_WE_2025_f un_WE_2026_f un_WE_2027_f un_WE_2028_f un_WE_2029_f  un_WE_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K78= matrix(results)
putexcel A79= ("Male")
tabstat un_WE_2015_m un_WE_2016_m un_WE_2017_m un_WE_2018_m un_WE_2019_m un_WE_2020_m  un_WE_2021_m un_WE_2022_m un_WE_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B79= matrix(results)
tabstat un_WE_2024_m un_WE_2025_m un_WE_2026_m un_WE_2027_m un_WE_2028_m un_WE_2029_m  un_WE_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K79= matrix(results)
putexcel A80= ("Both")
putexcel B80= formula(=(B78+B79))
putexcel C80= formula(=(C78+C79))
putexcel D80= formula(=(D78+D79))
putexcel E80= formula(=(E78+E79))
putexcel F80= formula(=(F78+F79))
putexcel G80= formula(=(G78+G79))
putexcel H80= formula(=(H78+H79))
putexcel I80= formula(=(I78+I79))
putexcel J80= formula(=(J78+J79))
putexcel K80= formula(=(K78+K79))
putexcel L80= formula(=(L78+L79))
putexcel M80= formula(=(M78+M79))
putexcel N80= formula(=(N78+N79))
putexcel O80= formula(=(O78+O79))
putexcel P80= formula(=(P78+P79))
putexcel Q80= formula(=(Q78+Q79))


**** Latin America and Carribean LAC
putexcel A82= ("UN - Latin America and Carribean")
putexcel A83= ("Female")
tabstat un_LAC_2015_f un_LAC_2016_f un_LAC_2017_f un_LAC_2018_f un_LAC_2019_f un_LAC_2020_f  un_LAC_2021_f un_LAC_2022_f un_LAC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B83= matrix(results)
tabstat un_LAC_2024_f un_LAC_2025_f un_LAC_2026_f un_LAC_2027_f un_LAC_2028_f un_LAC_2029_f  un_LAC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K83= matrix(results)
putexcel A84= ("Male")
tabstat un_LAC_2015_m un_LAC_2016_m un_LAC_2017_m un_LAC_2018_m un_LAC_2019_m un_LAC_2020_m  un_LAC_2021_m un_LAC_2022_m un_LAC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B84= matrix(results)
tabstat un_LAC_2024_m un_LAC_2025_m un_LAC_2026_m un_LAC_2027_m un_LAC_2028_m un_LAC_2029_m  un_LAC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K84= matrix(results)
putexcel A85= ("Both")
putexcel B85= formula(=(B83+B84))
putexcel C85= formula(=(C83+C84))
putexcel D85= formula(=(D83+D84))
putexcel E85= formula(=(E83+E84))
putexcel F85= formula(=(F83+F84))
putexcel G85= formula(=(G83+G84))
putexcel H85= formula(=(H83+H84))
putexcel I85= formula(=(I83+I84))
putexcel J85= formula(=(J83+J84))
putexcel K85= formula(=(K83+K84))
putexcel L85= formula(=(L83+L84))
putexcel M85= formula(=(M83+M84))
putexcel N85= formula(=(N83+N84))
putexcel O85= formula(=(O83+O84))
putexcel P85= formula(=(P83+P84))
putexcel Q85= formula(=(Q83+Q84))


**** Middle East and North Africa MENA
putexcel A87= ("UN - Middle East and North Africa")
putexcel A88= ("Female")
tabstat un_MENA_2015_f un_MENA_2016_f un_MENA_2017_f un_MENA_2018_f un_MENA_2019_f un_MENA_2020_f  un_MENA_2021_f un_MENA_2022_f un_MENA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B88= matrix(results)
tabstat un_MENA_2024_f un_MENA_2025_f un_MENA_2026_f un_MENA_2027_f un_MENA_2028_f un_MENA_2029_f  un_MENA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K88= matrix(results)
putexcel A89= ("Male")
tabstat un_MENA_2015_m un_MENA_2016_m un_MENA_2017_m un_MENA_2018_m un_MENA_2019_m un_MENA_2020_m  un_MENA_2021_m un_MENA_2022_m un_MENA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B89= matrix(results)
tabstat un_MENA_2024_m un_MENA_2025_m un_MENA_2026_m un_MENA_2027_m un_MENA_2028_m un_MENA_2029_m  un_MENA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K89= matrix(results)
putexcel A90= ("Both")
putexcel B90= formula(=(B88+B89))
putexcel C90= formula(=(C88+C89))
putexcel D90= formula(=(D88+D89))
putexcel E90= formula(=(E88+E89))
putexcel F90= formula(=(F88+F89))
putexcel G90= formula(=(G88+G89))
putexcel H90= formula(=(H88+H89))
putexcel I90= formula(=(I88+I89))
putexcel J90= formula(=(J88+J89))
putexcel K90= formula(=(K88+K89))
putexcel L90= formula(=(L88+L89))
putexcel M90= formula(=(M88+M89))
putexcel N90= formula(=(N88+N89))
putexcel O90= formula(=(O88+O89))
putexcel P90= formula(=(P88+P89))
putexcel Q90= formula(=(Q88+Q89))


**** North America  NA
putexcel A92= ("UN - North America")
putexcel A93= ("Female")
tabstat un_NA_2015_f un_NA_2016_f un_NA_2017_f un_NA_2018_f un_NA_2019_f un_NA_2020_f  un_NA_2021_f un_NA_2022_f un_NA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B93= matrix(results)
tabstat un_NA_2024_f un_NA_2025_f un_NA_2026_f un_NA_2027_f un_NA_2028_f un_NA_2029_f  un_NA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K93= matrix(results)
putexcel A94= ("Male")
tabstat un_NA_2015_m un_NA_2016_m un_NA_2017_m un_NA_2018_m un_NA_2019_m un_NA_2020_m  un_NA_2021_m un_NA_2022_m un_NA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B94= matrix(results)
tabstat un_NA_2024_m un_NA_2025_m un_NA_2026_m un_NA_2027_m un_NA_2028_m un_NA_2029_m  un_NA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K94= matrix(results)
putexcel A95= ("Both")
putexcel B95= formula(=(B93+B94))
putexcel C95= formula(=(C93+C94))
putexcel D95= formula(=(D93+D94))
putexcel E95= formula(=(E93+E94))
putexcel F95= formula(=(F93+F94))
putexcel G95= formula(=(G93+G94))
putexcel H95= formula(=(H93+H94))
putexcel I95= formula(=(I93+I94))
putexcel J95= formula(=(J93+J94))
putexcel K95= formula(=(K93+K94))
putexcel L95= formula(=(L93+L94))
putexcel M95= formula(=(M93+M94))
putexcel N95= formula(=(N93+N94))
putexcel O95= formula(=(O93+O94))
putexcel P95= formula(=(P93+P94))
putexcel Q95= formula(=(Q93+Q94))


**** South Asia  SA
putexcel A97= ("UN - South Asia")
putexcel A98= ("Female")
tabstat un_SA_2015_f un_SA_2016_f un_SA_2017_f un_SA_2018_f un_SA_2019_f un_SA_2020_f  un_SA_2021_f un_SA_2022_f un_SA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B98= matrix(results)
tabstat un_SA_2024_f un_SA_2025_f un_SA_2026_f un_SA_2027_f un_SA_2028_f un_SA_2029_f  un_SA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K98= matrix(results)
putexcel A99= ("Male")
tabstat un_SA_2015_m un_SA_2016_m un_SA_2017_m un_SA_2018_m un_SA_2019_m un_SA_2020_m  un_SA_2021_m un_SA_2022_m un_SA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B99= matrix(results)
tabstat un_SA_2024_m un_SA_2025_m un_SA_2026_m un_SA_2027_m un_SA_2028_m un_SA_2029_m  un_SA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K99= matrix(results)
putexcel A100= ("Both")
putexcel B100= formula(=(B98+B99))
putexcel C100= formula(=(C98+C99))
putexcel D100= formula(=(D98+D99))
putexcel E100= formula(=(E98+E99))
putexcel F100= formula(=(F98+F99))
putexcel G100= formula(=(G98+G99))
putexcel H100= formula(=(H98+H99))
putexcel I100= formula(=(I98+I99))
putexcel J100= formula(=(J98+J99))
putexcel K100= formula(=(K98+K99))
putexcel L100= formula(=(L98+L99))
putexcel M100= formula(=(M98+M99))
putexcel N100= formula(=(N98+N99))
putexcel O100= formula(=(O98+O99))
putexcel P100= formula(=(P98+P99))
putexcel Q100= formula(=(Q98+Q99))


**** Eastern and Southern Africa ESA
putexcel A102= ("UN - Eastern and Southern Africa")
putexcel A103= ("Female")
tabstat un_ESA_2015_f un_ESA_2016_f un_ESA_2017_f un_ESA_2018_f un_ESA_2019_f un_ESA_2020_f  un_ESA_2021_f un_ESA_2022_f un_ESA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B103= matrix(results)
tabstat un_ESA_2024_f un_ESA_2025_f un_ESA_2026_f un_ESA_2027_f un_ESA_2028_f un_ESA_2029_f  un_ESA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K103= matrix(results)
putexcel A104= ("Male")
tabstat un_ESA_2015_m un_ESA_2016_m un_ESA_2017_m un_ESA_2018_m un_ESA_2019_m un_ESA_2020_m  un_ESA_2021_m un_ESA_2022_m un_ESA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B104= matrix(results)
tabstat un_ESA_2024_m un_ESA_2025_m un_ESA_2026_m un_ESA_2027_m un_ESA_2028_m un_ESA_2029_m  un_ESA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K104= matrix(results)
putexcel A105= ("Both")
putexcel B105= formula(=(B103+B104))
putexcel C105= formula(=(C103+C104))
putexcel D105= formula(=(D103+D104))
putexcel E105= formula(=(E103+E104))
putexcel F105= formula(=(F103+F104))
putexcel G105= formula(=(G103+G104))
putexcel H105= formula(=(H103+H104))
putexcel I105= formula(=(I103+I104))
putexcel J105= formula(=(J103+J104))
putexcel K105= formula(=(K103+K104))
putexcel L105= formula(=(L103+L104))
putexcel M105= formula(=(M103+M104))
putexcel N105= formula(=(N103+N104))
putexcel O105= formula(=(O103+O104))
putexcel P105= formula(=(P103+P104))
putexcel Q105= formula(=(Q103+Q104))



**** Western and Central Africa
putexcel A107= ("UN - Western and Central Africa")
putexcel A108= ("Female")
tabstat un_WCA_2015_f un_WCA_2016_f un_WCA_2017_f un_WCA_2018_f un_WCA_2019_f un_WCA_2020_f  un_WCA_2021_f un_WCA_2022_f un_WCA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B108= matrix(results)
tabstat un_WCA_2024_f un_WCA_2025_f un_WCA_2026_f un_WCA_2027_f un_WCA_2028_f un_WCA_2029_f  un_WCA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K108= matrix(results)
putexcel A109= ("Male")
tabstat un_WCA_2015_m un_WCA_2016_m un_WCA_2017_m un_WCA_2018_m un_WCA_2019_m un_WCA_2020_m  un_WCA_2021_m un_WCA_2022_m un_WCA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B109= matrix(results)
tabstat un_WCA_2024_m un_WCA_2025_m un_WCA_2026_m un_WCA_2027_m un_WCA_2028_m un_WCA_2029_m  un_WCA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K109= matrix(results)
putexcel A110= ("Both")
putexcel B110= formula(=(B108+B109))
putexcel C110= formula(=(C108+C109))
putexcel D110= formula(=(D108+D109))
putexcel E110= formula(=(E108+E109))
putexcel F110= formula(=(F108+F109))
putexcel G110= formula(=(G108+G109))
putexcel H110= formula(=(H108+H109))
putexcel I110= formula(=(I108+I109))
putexcel J110= formula(=(J108+J109))
putexcel K110= formula(=(K108+K109))
putexcel L110= formula(=(L108+L109))
putexcel M110= formula(=(M108+M109))
putexcel N110= formula(=(N108+N109))
putexcel O110= formula(=(O108+O109))
putexcel P110= formula(=(P108+P109))
putexcel Q110= formula(=(Q108+Q109))



**** Region --  UN


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen non_fragile_`x'_f=total(lostpotential_`x'_f) if oecd_fragile==0
egen non_fragile_`x'_m=total(lostpotential_`x'_m) if oecd_fragile==0
egen fragile_`x'_f=total(lostpotential_`x'_f) if oecd_fragile==1
egen fragile_`x'_m=total(lostpotential_`x'_m) if oecd_fragile==1
}
*

**** Non-Fragile
putexcel A113= ("OECD 2020 - Non-Fragile")
putexcel A114= ("Female")
tabstat non_fragile_2015_f non_fragile_2016_f non_fragile_2017_f non_fragile_2018_f non_fragile_2019_f non_fragile_2020_f  non_fragile_2021_f non_fragile_2022_f non_fragile_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B114= matrix(results)
tabstat non_fragile_2024_f non_fragile_2025_f non_fragile_2026_f non_fragile_2027_f non_fragile_2028_f non_fragile_2029_f  non_fragile_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K114= matrix(results)
putexcel A115= ("Male")
tabstat non_fragile_2015_m non_fragile_2016_m non_fragile_2017_m non_fragile_2018_m non_fragile_2019_m non_fragile_2020_m  non_fragile_2021_m non_fragile_2022_m non_fragile_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B115= matrix(results)
tabstat non_fragile_2024_m non_fragile_2025_m non_fragile_2026_m non_fragile_2027_m non_fragile_2028_m non_fragile_2029_m  non_fragile_2030_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  K115= matrix(results)
putexcel A116= ("Both")
putexcel B116= formula(=(B114+B115))
putexcel C116= formula(=(C114+C115))
putexcel D116= formula(=(D114+D115))
putexcel E116= formula(=(E114+E115))
putexcel F116= formula(=(F114+F115))
putexcel G116= formula(=(G114+G115))
putexcel H116= formula(=(H114+H115))
putexcel I116= formula(=(I114+I115))
putexcel J116= formula(=(J114+J115))
putexcel K116= formula(=(K114+K115))
putexcel L116= formula(=(L114+L115))
putexcel M116= formula(=(M114+M115))
putexcel N116= formula(=(N114+N115))
putexcel O116= formula(=(O114+O115))
putexcel P116= formula(=(P114+P115))
putexcel Q116= formula(=(Q114+Q115))


**** Fragile
putexcel A118= ("OECD 2020 - Fragile")
putexcel A119= ("Female")
tabstat fragile_2015_f fragile_2016_f fragile_2017_f fragile_2018_f fragile_2019_f fragile_2020_f  fragile_2021_f fragile_2022_f fragile_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B119= matrix(results)
tabstat fragile_2024_f fragile_2025_f fragile_2026_f fragile_2027_f fragile_2028_f fragile_2029_f  fragile_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K119= matrix(results)
putexcel A120= ("Male")
tabstat fragile_2015_m fragile_2016_m fragile_2017_m fragile_2018_m fragile_2019_m fragile_2020_m  fragile_2021_m fragile_2022_m fragile_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B120= matrix(results)
tabstat fragile_2024_m fragile_2025_m fragile_2026_m fragile_2027_m fragile_2028_m fragile_2029_m  fragile_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K120= matrix(results)
putexcel A121= ("Both")
putexcel B121= formula(=(B119+B120))
putexcel C121= formula(=(C119+C120))
putexcel D121= formula(=(D119+D120))
putexcel E121= formula(=(E119+E120))
putexcel F121= formula(=(F119+F120))
putexcel G121= formula(=(G119+G120))
putexcel H121= formula(=(H119+H120))
putexcel I121= formula(=(I119+I120))
putexcel J121= formula(=(J119+J120))
putexcel K121= formula(=(K119+K120))
putexcel L121= formula(=(L119+L120))
putexcel M121= formula(=(M119+M120))
putexcel N121= formula(=(N119+N120))
putexcel O121= formula(=(O119+O120))
putexcel P121= formula(=(P119+P120))
putexcel Q121= formula(=(Q119+Q120))



clear

use "$interim/Lost_Potential_Database_With_Indicators_Covid.dta", clear

putexcel set "$outputs\Tables_Combined_Simplified.xlsx", sheet(8. OS C19 BAU) modify

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

rename sum_os_`x'_f old_sum_os_`x'_f
rename sum_os_`x'_f_covid sum_os_`x'_f
rename sum_os_`x'_m old_sum_os_`x'_m
rename sum_os_`x'_m_covid sum_os_`x'_m

rename oppsecured_`x'_f old_oppsecured_`x'_f
rename oppsecured_`x'_f_covid oppsecured_`x'_f
rename oppsecured_`x'_m old_oppsecured_`x'_m
rename oppsecured_`x'_m_covid oppsecured_`x'_m

}
*

putexcel A5 = ("Female")
putexcel A6 = ("Male")

sum sum_os_2015_f
return list
putexcel B4 = (2015)
putexcel B5 = (`r(mean)')

sum sum_os_2016_f
return list
putexcel C4 = (2016)
putexcel C5 = (`r(mean)')

sum sum_os_2017_f
return list
putexcel D4 = (2017)
putexcel D5 = (`r(mean)')

sum sum_os_2018_f
return list
putexcel E4 = (2018)
putexcel E5 = (`r(mean)')

sum sum_os_2019_f
return list
putexcel F4 = (2019)
putexcel F5 = (`r(mean)')

sum sum_os_2020_f
return list
putexcel G4 = (2020)
putexcel G5 = (`r(mean)')

sum sum_os_2021_f
return list
putexcel H4 = (2021)
putexcel H5 = (`r(mean)')

sum sum_os_2022_f
return list
putexcel I4 = (2022)
putexcel I5 = (`r(mean)')

sum sum_os_2023_f
return list
putexcel J4 = (2023)
putexcel J5 = (`r(mean)')

sum sum_os_2024_f
return list
putexcel K4 = (2024)
putexcel K5 = (`r(mean)')

sum sum_os_2025_f
return list
putexcel L4 = (2025)
putexcel L5 = (`r(mean)')

sum sum_os_2026_f
return list
putexcel M4 = (2026)
putexcel M5 = (`r(mean)')

sum sum_os_2027_f
return list
putexcel N4 = (2027)
putexcel N5 = (`r(mean)')

sum sum_os_2028_f
return list
putexcel O4 = (2028)
putexcel O5 = (`r(mean)')

sum sum_os_2029_f
return list
putexcel P4 = (2029)
putexcel P5 = (`r(mean)')

sum sum_os_2030_f
return list
putexcel Q4 = (2030)
putexcel Q5 = (`r(mean)')




sum sum_os_2015_m
return list
putexcel B6 = (`r(mean)')

sum sum_os_2016_m
return list
putexcel C6 = (`r(mean)')


sum sum_os_2017_m
return list
putexcel D6  = (`r(mean)')


sum sum_os_2018_m
return list
putexcel E6 = (`r(mean)')


sum sum_os_2019_m
return list
putexcel F6 = (`r(mean)')

sum sum_os_2020_m
return list
putexcel G6 = (`r(mean)')

sum sum_os_2021_m
return list
putexcel H6 = (`r(mean)')

sum sum_os_2022_m
return list
putexcel I6 = (`r(mean)')

sum sum_os_2023_m
return list
putexcel J6 = (`r(mean)')

sum sum_os_2024_m
return list
putexcel K6 = (`r(mean)')

sum sum_os_2025_m
return list
putexcel L6 = (`r(mean)')

sum sum_os_2026_m
return list
putexcel M6 = (`r(mean)')


sum sum_os_2027_m
return list
putexcel N6 = (`r(mean)')

sum sum_os_2028_m
return list
putexcel O6 = (`r(mean)')

sum sum_os_2029_m
return list
putexcel P6 = (`r(mean)')

sum sum_os_2030_m
return list
putexcel Q6 = (`r(mean)')


putexcel A7 = ("Both")
putexcel B7= formula(=(B5+B6))
putexcel C7= formula(=(C5+C6))
putexcel D7= formula(=(D5+D6))
putexcel E7= formula(=(E5+E6))
putexcel F7= formula(=(F5+F6))
putexcel G7= formula(=(G5+G6))
putexcel H7= formula(=(H5+H6))
putexcel I7= formula(=(I5+I6))
putexcel J7= formula(=(J5+J6))
putexcel K7= formula(=(K5+K6))
putexcel L7= formula(=(L5+L6))
putexcel M7= formula(=(M5+M6))
putexcel N7= formula(=(N5+N6))
putexcel O7= formula(=(O5+O6))
putexcel P7= formula(=(P5+P6))
putexcel Q7= formula(=(Q5+Q6))



foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen LIC_`x'_f=total(oppsecured_`x'_f) if income_group==1
egen LIC_`x'_m=total(oppsecured_`x'_m) if income_group==1
egen LMIC_`x'_f=total(oppsecured_`x'_f) if income_group==2
egen LMIC_`x'_m=total(oppsecured_`x'_m) if income_group==2
egen UMIC_`x'_f=total(oppsecured_`x'_f) if income_group==3
egen UMIC_`x'_m=total(oppsecured_`x'_m) if income_group==3
egen HIC_`x'_f=total(oppsecured_`x'_f) if income_group==4
egen HIC_`x'_m=total(oppsecured_`x'_m) if income_group==4

}
*

****Income table******

**** Low Income
putexcel A10= ("Low Income")
putexcel A11= ("Female")
tabstat LIC_2015_f LIC_2016_f LIC_2017_f LIC_2018_f LIC_2019_f LIC_2020_f  LIC_2021_f LIC_2022_f LIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B11= matrix(results)
tabstat LIC_2024_f LIC_2025_f LIC_2026_f LIC_2027_f LIC_2028_f LIC_2029_f  LIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K11= matrix(results)
putexcel A12= ("Male")
tabstat LIC_2015_m LIC_2016_m LIC_2017_m LIC_2018_m LIC_2019_m LIC_2020_m  LIC_2021_m LIC_2022_m LIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B12= matrix(results)
tabstat LIC_2024_m LIC_2025_m LIC_2026_m LIC_2027_m LIC_2028_m LIC_2029_m  LIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K12= matrix(results)
putexcel A13= ("Both")
putexcel B13= formula(=(B11+B12))
putexcel C13= formula(=(C11+C12))
putexcel D13= formula(=(D11+D12))
putexcel E13= formula(=(E11+E12))
putexcel F13= formula(=(F11+F12))
putexcel G13= formula(=(G11+G12))
putexcel H13= formula(=(H11+H12))
putexcel I13= formula(=(I11+I12))
putexcel J13= formula(=(J11+J12))
putexcel K13= formula(=(K11+K12))
putexcel L13= formula(=(L11+L12))
putexcel M13= formula(=(M11+M12))
putexcel N13= formula(=(N11+N12))
putexcel O13= formula(=(O11+O12))
putexcel P13= formula(=(P11+P12))
putexcel Q13= formula(=(Q11+Q12))

*****Low_middle Income
putexcel A15= ("Lower-Middle Income")
putexcel A16= ("Female")
tabstat LMIC_2015_f LMIC_2016_f LMIC_2017_f LMIC_2018_f LMIC_2019_f LMIC_2020_f  LMIC_2021_f LMIC_2022_f LMIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B16= matrix(results)
tabstat LMIC_2024_f LMIC_2025_f LMIC_2026_f LMIC_2027_f LMIC_2028_f LMIC_2029_f  LMIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K16= matrix(results)
putexcel A17= ("Male")
tabstat LMIC_2015_m LMIC_2016_m LMIC_2017_m LMIC_2018_m LMIC_2019_m LMIC_2020_m  LMIC_2021_m LMIC_2022_m LMIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B17= matrix(results)
tabstat LMIC_2024_m LMIC_2025_m LMIC_2026_m LMIC_2027_m LMIC_2028_m LMIC_2029_m  LMIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K17= matrix(results)
putexcel A18= ("Both")
putexcel B18= formula(=(B17+B16))
putexcel C18= formula(=(C17+C16))
putexcel D18= formula(=(D17+D16))
putexcel E18= formula(=(E17+E16))
putexcel F18= formula(=(F17+F16))
putexcel G18= formula(=(G17+G16))
putexcel H18= formula(=(H17+H16))
putexcel I18= formula(=(I17+I16))
putexcel J18= formula(=(J17+J16))
putexcel K18= formula(=(K17+K16))
putexcel L18= formula(=(L17+L16))
putexcel M18= formula(=(M17+M16))
putexcel N18= formula(=(N17+N16))
putexcel O18= formula(=(O17+O16))
putexcel P18= formula(=(P17+P16))
putexcel Q18= formula(=(Q17+Q16))

**********************Upper Middle Income
putexcel A20= ("Upper-Middle Income")
putexcel A21= ("Female")
tabstat UMIC_2015_f UMIC_2016_f UMIC_2017_f UMIC_2018_f UMIC_2019_f UMIC_2020_f  UMIC_2021_f UMIC_2022_f UMIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B21= matrix(results)
tabstat UMIC_2024_f UMIC_2025_f UMIC_2026_f UMIC_2027_f UMIC_2028_f UMIC_2029_f  UMIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K21= matrix(results)
putexcel A22= ("Male")
tabstat UMIC_2015_m UMIC_2016_m UMIC_2017_m UMIC_2018_m UMIC_2019_m UMIC_2020_m  UMIC_2021_m UMIC_2022_m UMIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B22= matrix(results)
tabstat UMIC_2024_m UMIC_2025_m UMIC_2026_m UMIC_2027_m UMIC_2028_m UMIC_2029_m  UMIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K22= matrix(results)

putexcel A23= ("Both")
putexcel B23= formula(=(B22+B21))
putexcel C23= formula(=(C22+C21))
putexcel D23= formula(=(D22+D21))
putexcel E23= formula(=(E22+E21))
putexcel F23= formula(=(F22+F21))
putexcel G23= formula(=(G22+G21))
putexcel H23= formula(=(H22+H21))
putexcel I23= formula(=(I22+I21))
putexcel J23= formula(=(J22+J21))
putexcel K23= formula(=(K22+K21))
putexcel L23= formula(=(L22+L21))
putexcel M23= formula(=(M22+M21))
putexcel N23= formula(=(N22+N21))
putexcel O23= formula(=(O22+O21))
putexcel P23= formula(=(P22+P21))
putexcel Q23= formula(=(Q22+Q21))

**********************High Income
putexcel A25= ("High Income")
putexcel A26= ("Female")
tabstat HIC_2015_f HIC_2016_f HIC_2017_f HIC_2018_f HIC_2019_f HIC_2020_f  HIC_2021_f HIC_2022_f HIC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B26= matrix(results)
tabstat HIC_2024_f HIC_2025_f HIC_2026_f HIC_2027_f HIC_2028_f HIC_2029_f  HIC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K26= matrix(results)
putexcel A27= ("Male")
tabstat HIC_2015_m HIC_2016_m HIC_2017_m HIC_2018_m HIC_2019_m HIC_2020_m  HIC_2021_m HIC_2022_m HIC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B27= matrix(results)
tabstat HIC_2024_m HIC_2025_m HIC_2026_m HIC_2027_m HIC_2028_m HIC_2029_m  HIC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K27= matrix(results)
putexcel A28= ("Both")
putexcel B28= formula(=(B27+B26))
putexcel C28= formula(=(C27+C26))
putexcel D28= formula(=(D27+D26))
putexcel E28= formula(=(E27+E26))
putexcel F28= formula(=(F27+F26))
putexcel G28= formula(=(G27+G26))
putexcel H28= formula(=(H27+H26))
putexcel I28= formula(=(I27+I26))
putexcel J28= formula(=(J27+J26))
putexcel K28= formula(=(K27+K26))
putexcel L28= formula(=(L27+L26))
putexcel M28= formula(=(M27+M26))
putexcel N28= formula(=(N27+N26))
putexcel O28= formula(=(O27+O26))
putexcel P28= formula(=(P27+P26))
putexcel Q28= formula(=(Q27+Q26))


**** Region --  World Bank


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen EAP_`x'_f=total(oppsecured_`x'_f) if world_region==1
egen EAP_`x'_m=total(oppsecured_`x'_m) if world_region==1
egen ECA_`x'_f=total(oppsecured_`x'_f) if world_region==2
egen ECA_`x'_m=total(oppsecured_`x'_m) if world_region==2
egen LAC_`x'_f=total(oppsecured_`x'_f) if world_region==3
egen LAC_`x'_m=total(oppsecured_`x'_m) if world_region==3
egen MENA_`x'_f=total(oppsecured_`x'_f) if world_region==4
egen MENA_`x'_m=total(oppsecured_`x'_m) if world_region==4
egen NA_`x'_f=total(oppsecured_`x'_f) if world_region==5
egen NA_`x'_m=total(oppsecured_`x'_m) if world_region==5
egen SA_`x'_f=total(oppsecured_`x'_f) if world_region==6
egen SA_`x'_m=total(oppsecured_`x'_m) if world_region==6
egen SSA_`x'_f=total(oppsecured_`x'_f) if world_region==7
egen SSA_`x'_m=total(oppsecured_`x'_m) if world_region==7


}
*

*local regioncodes EAP ECA LAC MENA NA SA SSA
*foreach reg of regioncodes 

****Region table******

**** East Asia and Pacific EAP
putexcel A31= ("WB - East Asia and Pacific")
putexcel A32= ("Female")
tabstat EAP_2015_f EAP_2016_f EAP_2017_f EAP_2018_f EAP_2019_f EAP_2020_f  EAP_2021_f EAP_2022_f EAP_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B32= matrix(results)
tabstat EAP_2024_f EAP_2025_f EAP_2026_f EAP_2027_f EAP_2028_f EAP_2029_f  EAP_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K32= matrix(results)
putexcel A33= ("Male")
tabstat EAP_2015_m EAP_2016_m EAP_2017_m EAP_2018_m EAP_2019_m EAP_2020_m  EAP_2021_m EAP_2022_m EAP_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B33= matrix(results)
tabstat EAP_2024_m EAP_2025_m EAP_2026_m EAP_2027_m EAP_2028_m EAP_2029_m  EAP_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K33= matrix(results)
putexcel A34= ("Both")
putexcel B34= formula(=(B32+B33))
putexcel C34= formula(=(C32+C33))
putexcel D34= formula(=(D32+D33))
putexcel E34= formula(=(E32+E33))
putexcel F34= formula(=(F32+F33))
putexcel G34= formula(=(G32+G33))
putexcel H34= formula(=(H32+H33))
putexcel I34= formula(=(I32+I33))
putexcel J34= formula(=(J32+J33))
putexcel K34= formula(=(K32+K33))
putexcel L34= formula(=(L32+L33))
putexcel M34= formula(=(M32+M33))
putexcel N34= formula(=(N32+N33))
putexcel O34= formula(=(O32+O33))
putexcel P34= formula(=(P32+P33))
putexcel Q34= formula(=(Q32+Q33))

**** Europe and Central Asia ECA
putexcel A36= ("WB - Europe and Central Asia")
putexcel A37= ("Female")
tabstat ECA_2015_f ECA_2016_f ECA_2017_f ECA_2018_f ECA_2019_f ECA_2020_f  ECA_2021_f ECA_2022_f ECA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B37= matrix(results)
tabstat ECA_2024_f ECA_2025_f ECA_2026_f ECA_2027_f ECA_2028_f ECA_2029_f  ECA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K37= matrix(results)
putexcel A38= ("Male")
tabstat ECA_2015_m ECA_2016_m ECA_2017_m ECA_2018_m ECA_2019_m ECA_2020_m  ECA_2021_m ECA_2022_m ECA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B38= matrix(results)
tabstat ECA_2024_m ECA_2025_m ECA_2026_m ECA_2027_m ECA_2028_m ECA_2029_m  ECA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K38= matrix(results)
putexcel A39= ("Both")
putexcel B39= formula(=(B37+B38))
putexcel C39= formula(=(C37+C38))
putexcel D39= formula(=(D37+D38))
putexcel E39= formula(=(E37+E38))
putexcel F39= formula(=(F37+F38))
putexcel G39= formula(=(G37+G38))
putexcel H39= formula(=(H37+H38))
putexcel I39= formula(=(I37+I38))
putexcel J39= formula(=(J37+J38))
putexcel K39= formula(=(K37+K38))
putexcel L39= formula(=(L37+L38))
putexcel M39= formula(=(M37+M38))
putexcel N39= formula(=(N37+N38))
putexcel O39= formula(=(O37+O38))
putexcel P39= formula(=(P37+P38))
putexcel Q39= formula(=(Q37+Q38))

**** Latin America and Carribean LAC
putexcel A41= ("WB - Latin America and Carribean")
putexcel A42= ("Female")
tabstat LAC_2015_f LAC_2016_f LAC_2017_f LAC_2018_f LAC_2019_f LAC_2020_f  LAC_2021_f LAC_2022_f LAC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B42= matrix(results)
tabstat LAC_2024_f LAC_2025_f LAC_2026_f LAC_2027_f LAC_2028_f LAC_2029_f  LAC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K42= matrix(results)
putexcel A43= ("Male")
tabstat LAC_2015_m LAC_2016_m LAC_2017_m LAC_2018_m LAC_2019_m LAC_2020_m  LAC_2021_m LAC_2022_m LAC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B43= matrix(results)
tabstat LAC_2024_m LAC_2025_m LAC_2026_m LAC_2027_m LAC_2028_m LAC_2029_m  LAC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K43= matrix(results)
putexcel A44= ("Both")
putexcel B44= formula(=(B42+B43))
putexcel C44= formula(=(C42+C43))
putexcel D44= formula(=(D42+D43))
putexcel E44= formula(=(E42+E43))
putexcel F44= formula(=(F42+F43))
putexcel G44= formula(=(G42+G43))
putexcel H44= formula(=(H42+H43))
putexcel I44= formula(=(I42+I43))
putexcel J44= formula(=(J42+J43))
putexcel K44= formula(=(K42+K43))
putexcel L44= formula(=(L42+L43))
putexcel M44= formula(=(M42+M43))
putexcel N44= formula(=(N42+N43))
putexcel O44= formula(=(O42+O43))
putexcel P44= formula(=(P42+P43))
putexcel Q44= formula(=(Q42+Q43))

**** Middle East and North Africa MENA
putexcel A46= ("WB - Middle East and North Africa")
putexcel A47= ("Female")
tabstat MENA_2015_f MENA_2016_f MENA_2017_f MENA_2018_f MENA_2019_f MENA_2020_f  MENA_2021_f MENA_2022_f MENA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B47= matrix(results)
tabstat MENA_2024_f MENA_2025_f MENA_2026_f MENA_2027_f MENA_2028_f MENA_2029_f  MENA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K47= matrix(results)
putexcel A48= ("Male")
tabstat MENA_2015_m MENA_2016_m MENA_2017_m MENA_2018_m MENA_2019_m MENA_2020_m  MENA_2021_m MENA_2022_m MENA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B48= matrix(results)
tabstat MENA_2024_m MENA_2025_m MENA_2026_m MENA_2027_m MENA_2028_m MENA_2029_m  MENA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K48= matrix(results)
putexcel A49= ("Both")
putexcel B49= formula(=(B47+B48))
putexcel C49= formula(=(C47+C48))
putexcel D49= formula(=(D47+D48))
putexcel E49= formula(=(E47+E48))
putexcel F49= formula(=(F47+F48))
putexcel G49= formula(=(G47+G48))
putexcel H49= formula(=(H47+H48))
putexcel I49= formula(=(I47+I48))
putexcel J49= formula(=(J47+J48))
putexcel K49= formula(=(K47+K48))
putexcel L49= formula(=(L47+L48))
putexcel M49= formula(=(M47+M48))
putexcel N49= formula(=(N47+N48))
putexcel O49= formula(=(O47+O48))
putexcel P49= formula(=(P47+P48))
putexcel Q49= formula(=(Q47+Q48))

**** North America NA
putexcel A51= ("WB - North America")
putexcel A52= ("Female")
tabstat NA_2015_f NA_2016_f NA_2017_f NA_2018_f NA_2019_f NA_2020_f  NA_2021_f NA_2022_f NA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B52= matrix(results)
tabstat NA_2024_f NA_2025_f NA_2026_f NA_2027_f NA_2028_f NA_2029_f  NA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K52= matrix(results)
putexcel A53= ("Male")
tabstat NA_2015_m NA_2016_m NA_2017_m NA_2018_m NA_2019_m NA_2020_m  NA_2021_m NA_2022_m NA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B53= matrix(results)
tabstat NA_2024_m NA_2025_m NA_2026_m NA_2027_m NA_2028_m NA_2029_m  NA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K53= matrix(results)
putexcel A54= ("Both")
putexcel B54= formula(=(B52+B53))
putexcel C54= formula(=(C52+C53))
putexcel D54= formula(=(D52+D53))
putexcel E54= formula(=(E52+E53))
putexcel F54= formula(=(F52+F53))
putexcel G54= formula(=(G52+G53))
putexcel H54= formula(=(H52+H53))
putexcel I54= formula(=(I52+I53))
putexcel J54= formula(=(J52+J53))
putexcel K54= formula(=(K52+K53))
putexcel L54= formula(=(L52+L53))
putexcel M54= formula(=(M52+M53))
putexcel N54= formula(=(N52+N53))
putexcel O54= formula(=(O52+O53))
putexcel P54= formula(=(P52+P53))
putexcel Q54= formula(=(Q52+Q53))

**** South Asia  SA
putexcel A56= ("WB - South Asia")
putexcel A57= ("Female")
tabstat SA_2015_f SA_2016_f SA_2017_f SA_2018_f SA_2019_f SA_2020_f  SA_2021_f SA_2022_f SA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B57= matrix(results)
tabstat SA_2024_f SA_2025_f SA_2026_f SA_2027_f SA_2028_f SA_2029_f  SA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K57= matrix(results)
putexcel A58= ("Male")
tabstat SA_2015_m SA_2016_m SA_2017_m SA_2018_m SA_2019_m SA_2020_m  SA_2021_m SA_2022_m SA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B58= matrix(results)
tabstat SA_2024_m SA_2025_m SA_2026_m SA_2027_m SA_2028_m SA_2029_m  SA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K58= matrix(results)
putexcel A59= ("Both")
putexcel B59= formula(=(B57+B58))
putexcel C59= formula(=(C57+C58))
putexcel D59= formula(=(D57+D58))
putexcel E59= formula(=(E57+E58))
putexcel F59= formula(=(F57+F58))
putexcel G59= formula(=(G57+G58))
putexcel H59= formula(=(H57+H58))
putexcel I59= formula(=(I57+I58))
putexcel J59= formula(=(J57+J58))
putexcel K59= formula(=(K57+K58))
putexcel L59= formula(=(L57+L58))
putexcel M59= formula(=(M57+M58))
putexcel N59= formula(=(N57+N58))
putexcel O59= formula(=(O57+O58))
putexcel P59= formula(=(P57+P58))
putexcel Q59= formula(=(Q57+Q58))

**** Sub Saharan Africa  SSA
putexcel A61= ("WB - Sub-Saharan Africa")
putexcel A62= ("Female")
tabstat SSA_2015_f SSA_2016_f SSA_2017_f SSA_2018_f SSA_2019_f SSA_2020_f  SSA_2021_f SSA_2022_f SSA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B62= matrix(results)
tabstat SSA_2024_f SSA_2025_f SSA_2026_f SSA_2027_f SSA_2028_f SSA_2029_f  SSA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K62= matrix(results)
putexcel A63= ("Male")
tabstat SSA_2015_m SSA_2016_m SSA_2017_m SSA_2018_m SSA_2019_m SSA_2020_m  SSA_2021_m SSA_2022_m SSA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B63= matrix(results)
tabstat SSA_2024_m SSA_2025_m SSA_2026_m SSA_2027_m SSA_2028_m SSA_2029_m  SSA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K63= matrix(results)
putexcel A64= ("Both")
putexcel B64= formula(=(B62+B63))
putexcel C64= formula(=(C62+C63))
putexcel D64= formula(=(D62+D63))
putexcel E64= formula(=(E62+E63))
putexcel F64= formula(=(F62+F63))
putexcel G64= formula(=(G62+G63))
putexcel H64= formula(=(H62+H63))
putexcel I64= formula(=(I62+I63))
putexcel J64= formula(=(J62+J63))
putexcel K64= formula(=(K62+K63))
putexcel L64= formula(=(L62+L63))
putexcel M64= formula(=(M62+M63))
putexcel N64= formula(=(N62+N63))
putexcel O64= formula(=(O62+O63))
putexcel P64= formula(=(P62+P63))
putexcel Q64= formula(=(Q62+Q63))



**** Region --  UN


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen un_EAP_`x'_f=total(oppsecured_`x'_f) if un_region==1
egen un_EAP_`x'_m=total(oppsecured_`x'_m) if un_region==1
egen un_EECA_`x'_f=total(oppsecured_`x'_f) if un_region==2
egen un_EECA_`x'_m=total(oppsecured_`x'_m) if un_region==2
egen un_WE_`x'_f=total(oppsecured_`x'_f) if un_region==3
egen un_WE_`x'_m=total(oppsecured_`x'_m) if un_region==3
egen un_LAC_`x'_f=total(oppsecured_`x'_f) if un_region==4
egen un_LAC_`x'_m=total(oppsecured_`x'_m) if un_region==4
egen un_MENA_`x'_f=total(oppsecured_`x'_f) if un_region==5
egen un_MENA_`x'_m=total(oppsecured_`x'_m) if un_region==5
egen un_NA_`x'_f=total(oppsecured_`x'_f) if un_region==6
egen un_NA_`x'_m=total(oppsecured_`x'_m) if un_region==6
egen un_SA_`x'_f=total(oppsecured_`x'_f) if un_region==7
egen un_SA_`x'_m=total(oppsecured_`x'_m) if un_region==7
egen un_ESA_`x'_f=total(oppsecured_`x'_f) if un_region==8
egen un_ESA_`x'_m=total(oppsecured_`x'_m) if un_region==8
egen un_WCA_`x'_f=total(oppsecured_`x'_f) if un_region==9
egen un_WCA_`x'_m=total(oppsecured_`x'_m) if un_region==9


}
*

*local regioncodes label define un_region_values 1 "EAP" 2 "EECA" 3 "WE" 4 "LAC" 5 "MENA" 6 "NA" 7 "SA" 8 "ESA" 9 "WCA"
*foreach reg of regioncodes 

****Region table******

**** East Asia and Pacific EAP
putexcel A67= ("UN - East Asia and Pacific")
putexcel A68= ("Female")
tabstat un_EAP_2015_f un_EAP_2016_f un_EAP_2017_f un_EAP_2018_f un_EAP_2019_f un_EAP_2020_f  un_EAP_2021_f un_EAP_2022_f un_EAP_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B68= matrix(results)
tabstat un_EAP_2024_f un_EAP_2025_f un_EAP_2026_f un_EAP_2027_f un_EAP_2028_f un_EAP_2029_f  un_EAP_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K68= matrix(results)
putexcel A69= ("Male")
tabstat un_EAP_2015_m un_EAP_2016_m un_EAP_2017_m un_EAP_2018_m un_EAP_2019_m un_EAP_2020_m  un_EAP_2021_m un_EAP_2022_m un_EAP_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B69= matrix(results)
tabstat un_EAP_2024_m un_EAP_2025_m un_EAP_2026_m un_EAP_2027_m un_EAP_2028_m un_EAP_2029_m  un_EAP_2030_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  K69= matrix(results)
putexcel A70= ("Both")
putexcel B70= formula(=(B68+B69))
putexcel C70= formula(=(C68+C69))
putexcel D70= formula(=(D68+D69))
putexcel E70= formula(=(E68+E69))
putexcel F70= formula(=(F68+F69))
putexcel G70= formula(=(G68+G69))
putexcel H70= formula(=(H68+H69))
putexcel I70= formula(=(I68+I69))
putexcel J70= formula(=(J68+J69))
putexcel K70= formula(=(K68+K69))
putexcel L70= formula(=(L68+L69))
putexcel M70= formula(=(M68+M69))
putexcel N70= formula(=(N68+N69))
putexcel O70= formula(=(O68+O69))
putexcel P70= formula(=(P68+P69))
putexcel Q70= formula(=(Q68+Q69))

**** Eastern Europe and Central Asia EECA
putexcel A72= ("UN - Eastern Europe and Central Asia")
putexcel A73= ("Female")
tabstat un_EECA_2015_f un_EECA_2016_f un_EECA_2017_f un_EECA_2018_f un_EECA_2019_f un_EECA_2020_f  un_EECA_2021_f un_EECA_2022_f un_EECA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B73= matrix(results)
tabstat un_EECA_2024_f un_EECA_2025_f un_EECA_2026_f un_EECA_2027_f un_EECA_2028_f un_EECA_2029_f  un_EECA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K73= matrix(results)
putexcel A74= ("Male")
tabstat un_EECA_2015_m un_EECA_2016_m un_EECA_2017_m un_EECA_2018_m un_EECA_2019_m un_EECA_2020_m  un_EECA_2021_m un_EECA_2022_m un_EECA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B74= matrix(results)
tabstat un_EECA_2024_m un_EECA_2025_m un_EECA_2026_m un_EECA_2027_m un_EECA_2028_m un_EECA_2029_m  un_EECA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K74= matrix(results)
putexcel A75= ("Both")
putexcel B75= formula(=(B73+B74))
putexcel C75= formula(=(C73+C74))
putexcel D75= formula(=(D73+D74))
putexcel E75= formula(=(E73+E74))
putexcel F75= formula(=(F73+F74))
putexcel G75= formula(=(G73+G74))
putexcel H75= formula(=(H73+H74))
putexcel I75= formula(=(I73+I74))
putexcel J75= formula(=(J73+J74))
putexcel K75= formula(=(K73+K74))
putexcel L75= formula(=(L73+L74))
putexcel M75= formula(=(M73+M74))
putexcel N75= formula(=(N73+N74))
putexcel O75= formula(=(O73+O74))
putexcel P75= formula(=(P73+P74))
putexcel Q75= formula(=(Q73+Q74))

**** Western Europe WE
putexcel A77= ("UN - Western Europe")
putexcel A78= ("Female")
tabstat un_WE_2015_f un_WE_2016_f un_WE_2017_f un_WE_2018_f un_WE_2019_f un_WE_2020_f  un_WE_2021_f un_WE_2022_f un_WE_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B78= matrix(results)
tabstat un_WE_2024_f un_WE_2025_f un_WE_2026_f un_WE_2027_f un_WE_2028_f un_WE_2029_f  un_WE_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K78= matrix(results)
putexcel A79= ("Male")
tabstat un_WE_2015_m un_WE_2016_m un_WE_2017_m un_WE_2018_m un_WE_2019_m un_WE_2020_m  un_WE_2021_m un_WE_2022_m un_WE_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B79= matrix(results)
tabstat un_WE_2024_m un_WE_2025_m un_WE_2026_m un_WE_2027_m un_WE_2028_m un_WE_2029_m  un_WE_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K79= matrix(results)
putexcel A80= ("Both")
putexcel B80= formula(=(B78+B79))
putexcel C80= formula(=(C78+C79))
putexcel D80= formula(=(D78+D79))
putexcel E80= formula(=(E78+E79))
putexcel F80= formula(=(F78+F79))
putexcel G80= formula(=(G78+G79))
putexcel H80= formula(=(H78+H79))
putexcel I80= formula(=(I78+I79))
putexcel J80= formula(=(J78+J79))
putexcel K80= formula(=(K78+K79))
putexcel L80= formula(=(L78+L79))
putexcel M80= formula(=(M78+M79))
putexcel N80= formula(=(N78+N79))
putexcel O80= formula(=(O78+O79))
putexcel P80= formula(=(P78+P79))
putexcel Q80= formula(=(Q78+Q79))


**** Latin America and Carribean LAC
putexcel A82= ("UN - Latin America and Carribean")
putexcel A83= ("Female")
tabstat un_LAC_2015_f un_LAC_2016_f un_LAC_2017_f un_LAC_2018_f un_LAC_2019_f un_LAC_2020_f  un_LAC_2021_f un_LAC_2022_f un_LAC_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B83= matrix(results)
tabstat un_LAC_2024_f un_LAC_2025_f un_LAC_2026_f un_LAC_2027_f un_LAC_2028_f un_LAC_2029_f  un_LAC_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K83= matrix(results)
putexcel A84= ("Male")
tabstat un_LAC_2015_m un_LAC_2016_m un_LAC_2017_m un_LAC_2018_m un_LAC_2019_m un_LAC_2020_m  un_LAC_2021_m un_LAC_2022_m un_LAC_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B84= matrix(results)
tabstat un_LAC_2024_m un_LAC_2025_m un_LAC_2026_m un_LAC_2027_m un_LAC_2028_m un_LAC_2029_m  un_LAC_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K84= matrix(results)
putexcel A85= ("Both")
putexcel B85= formula(=(B83+B84))
putexcel C85= formula(=(C83+C84))
putexcel D85= formula(=(D83+D84))
putexcel E85= formula(=(E83+E84))
putexcel F85= formula(=(F83+F84))
putexcel G85= formula(=(G83+G84))
putexcel H85= formula(=(H83+H84))
putexcel I85= formula(=(I83+I84))
putexcel J85= formula(=(J83+J84))
putexcel K85= formula(=(K83+K84))
putexcel L85= formula(=(L83+L84))
putexcel M85= formula(=(M83+M84))
putexcel N85= formula(=(N83+N84))
putexcel O85= formula(=(O83+O84))
putexcel P85= formula(=(P83+P84))
putexcel Q85= formula(=(Q83+Q84))


**** Middle East and North Africa MENA
putexcel A87= ("UN - Middle East and North Africa")
putexcel A88= ("Female")
tabstat un_MENA_2015_f un_MENA_2016_f un_MENA_2017_f un_MENA_2018_f un_MENA_2019_f un_MENA_2020_f  un_MENA_2021_f un_MENA_2022_f un_MENA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B88= matrix(results)
tabstat un_MENA_2024_f un_MENA_2025_f un_MENA_2026_f un_MENA_2027_f un_MENA_2028_f un_MENA_2029_f  un_MENA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K88= matrix(results)
putexcel A89= ("Male")
tabstat un_MENA_2015_m un_MENA_2016_m un_MENA_2017_m un_MENA_2018_m un_MENA_2019_m un_MENA_2020_m  un_MENA_2021_m un_MENA_2022_m un_MENA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B89= matrix(results)
tabstat un_MENA_2024_m un_MENA_2025_m un_MENA_2026_m un_MENA_2027_m un_MENA_2028_m un_MENA_2029_m  un_MENA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K89= matrix(results)
putexcel A90= ("Both")
putexcel B90= formula(=(B88+B89))
putexcel C90= formula(=(C88+C89))
putexcel D90= formula(=(D88+D89))
putexcel E90= formula(=(E88+E89))
putexcel F90= formula(=(F88+F89))
putexcel G90= formula(=(G88+G89))
putexcel H90= formula(=(H88+H89))
putexcel I90= formula(=(I88+I89))
putexcel J90= formula(=(J88+J89))
putexcel K90= formula(=(K88+K89))
putexcel L90= formula(=(L88+L89))
putexcel M90= formula(=(M88+M89))
putexcel N90= formula(=(N88+N89))
putexcel O90= formula(=(O88+O89))
putexcel P90= formula(=(P88+P89))
putexcel Q90= formula(=(Q88+Q89))


**** North America  NA
putexcel A92= ("UN - North America")
putexcel A93= ("Female")
tabstat un_NA_2015_f un_NA_2016_f un_NA_2017_f un_NA_2018_f un_NA_2019_f un_NA_2020_f  un_NA_2021_f un_NA_2022_f un_NA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B93= matrix(results)
tabstat un_NA_2024_f un_NA_2025_f un_NA_2026_f un_NA_2027_f un_NA_2028_f un_NA_2029_f  un_NA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K93= matrix(results)
putexcel A94= ("Male")
tabstat un_NA_2015_m un_NA_2016_m un_NA_2017_m un_NA_2018_m un_NA_2019_m un_NA_2020_m  un_NA_2021_m un_NA_2022_m un_NA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B94= matrix(results)
tabstat un_NA_2024_m un_NA_2025_m un_NA_2026_m un_NA_2027_m un_NA_2028_m un_NA_2029_m  un_NA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K94= matrix(results)
putexcel A95= ("Both")
putexcel B95= formula(=(B93+B94))
putexcel C95= formula(=(C93+C94))
putexcel D95= formula(=(D93+D94))
putexcel E95= formula(=(E93+E94))
putexcel F95= formula(=(F93+F94))
putexcel G95= formula(=(G93+G94))
putexcel H95= formula(=(H93+H94))
putexcel I95= formula(=(I93+I94))
putexcel J95= formula(=(J93+J94))
putexcel K95= formula(=(K93+K94))
putexcel L95= formula(=(L93+L94))
putexcel M95= formula(=(M93+M94))
putexcel N95= formula(=(N93+N94))
putexcel O95= formula(=(O93+O94))
putexcel P95= formula(=(P93+P94))
putexcel Q95= formula(=(Q93+Q94))


**** South Asia  SA
putexcel A97= ("UN - South Asia")
putexcel A98= ("Female")
tabstat un_SA_2015_f un_SA_2016_f un_SA_2017_f un_SA_2018_f un_SA_2019_f un_SA_2020_f  un_SA_2021_f un_SA_2022_f un_SA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B98= matrix(results)
tabstat un_SA_2024_f un_SA_2025_f un_SA_2026_f un_SA_2027_f un_SA_2028_f un_SA_2029_f  un_SA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K98= matrix(results)
putexcel A99= ("Male")
tabstat un_SA_2015_m un_SA_2016_m un_SA_2017_m un_SA_2018_m un_SA_2019_m un_SA_2020_m  un_SA_2021_m un_SA_2022_m un_SA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B99= matrix(results)
tabstat un_SA_2024_m un_SA_2025_m un_SA_2026_m un_SA_2027_m un_SA_2028_m un_SA_2029_m  un_SA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K99= matrix(results)
putexcel A100= ("Both")
putexcel B100= formula(=(B98+B99))
putexcel C100= formula(=(C98+C99))
putexcel D100= formula(=(D98+D99))
putexcel E100= formula(=(E98+E99))
putexcel F100= formula(=(F98+F99))
putexcel G100= formula(=(G98+G99))
putexcel H100= formula(=(H98+H99))
putexcel I100= formula(=(I98+I99))
putexcel J100= formula(=(J98+J99))
putexcel K100= formula(=(K98+K99))
putexcel L100= formula(=(L98+L99))
putexcel M100= formula(=(M98+M99))
putexcel N100= formula(=(N98+N99))
putexcel O100= formula(=(O98+O99))
putexcel P100= formula(=(P98+P99))
putexcel Q100= formula(=(Q98+Q99))


**** Eastern and Southern Africa ESA
putexcel A102= ("UN - Eastern and Southern Africa")
putexcel A103= ("Female")
tabstat un_ESA_2015_f un_ESA_2016_f un_ESA_2017_f un_ESA_2018_f un_ESA_2019_f un_ESA_2020_f  un_ESA_2021_f un_ESA_2022_f un_ESA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B103= matrix(results)
tabstat un_ESA_2024_f un_ESA_2025_f un_ESA_2026_f un_ESA_2027_f un_ESA_2028_f un_ESA_2029_f  un_ESA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K103= matrix(results)
putexcel A104= ("Male")
tabstat un_ESA_2015_m un_ESA_2016_m un_ESA_2017_m un_ESA_2018_m un_ESA_2019_m un_ESA_2020_m  un_ESA_2021_m un_ESA_2022_m un_ESA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B104= matrix(results)
tabstat un_ESA_2024_m un_ESA_2025_m un_ESA_2026_m un_ESA_2027_m un_ESA_2028_m un_ESA_2029_m  un_ESA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K104= matrix(results)
putexcel A105= ("Both")
putexcel B105= formula(=(B103+B104))
putexcel C105= formula(=(C103+C104))
putexcel D105= formula(=(D103+D104))
putexcel E105= formula(=(E103+E104))
putexcel F105= formula(=(F103+F104))
putexcel G105= formula(=(G103+G104))
putexcel H105= formula(=(H103+H104))
putexcel I105= formula(=(I103+I104))
putexcel J105= formula(=(J103+J104))
putexcel K105= formula(=(K103+K104))
putexcel L105= formula(=(L103+L104))
putexcel M105= formula(=(M103+M104))
putexcel N105= formula(=(N103+N104))
putexcel O105= formula(=(O103+O104))
putexcel P105= formula(=(P103+P104))
putexcel Q105= formula(=(Q103+Q104))



**** Western and Central Africa
putexcel A107= ("UN - Western and Central Africa")
putexcel A108= ("Female")
tabstat un_WCA_2015_f un_WCA_2016_f un_WCA_2017_f un_WCA_2018_f un_WCA_2019_f un_WCA_2020_f  un_WCA_2021_f un_WCA_2022_f un_WCA_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B108= matrix(results)
tabstat un_WCA_2024_f un_WCA_2025_f un_WCA_2026_f un_WCA_2027_f un_WCA_2028_f un_WCA_2029_f  un_WCA_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K108= matrix(results)
putexcel A109= ("Male")
tabstat un_WCA_2015_m un_WCA_2016_m un_WCA_2017_m un_WCA_2018_m un_WCA_2019_m un_WCA_2020_m  un_WCA_2021_m un_WCA_2022_m un_WCA_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B109= matrix(results)
tabstat un_WCA_2024_m un_WCA_2025_m un_WCA_2026_m un_WCA_2027_m un_WCA_2028_m un_WCA_2029_m  un_WCA_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K109= matrix(results)
putexcel A110= ("Both")
putexcel B110= formula(=(B108+B109))
putexcel C110= formula(=(C108+C109))
putexcel D110= formula(=(D108+D109))
putexcel E110= formula(=(E108+E109))
putexcel F110= formula(=(F108+F109))
putexcel G110= formula(=(G108+G109))
putexcel H110= formula(=(H108+H109))
putexcel I110= formula(=(I108+I109))
putexcel J110= formula(=(J108+J109))
putexcel K110= formula(=(K108+K109))
putexcel L110= formula(=(L108+L109))
putexcel M110= formula(=(M108+M109))
putexcel N110= formula(=(N108+N109))
putexcel O110= formula(=(O108+O109))
putexcel P110= formula(=(P108+P109))
putexcel Q110= formula(=(Q108+Q109))



**** Region --  UN


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

egen non_fragile_`x'_f=total(oppsecured_`x'_f) if oecd_fragile==0
egen non_fragile_`x'_m=total(oppsecured_`x'_m) if oecd_fragile==0
egen fragile_`x'_f=total(oppsecured_`x'_f) if oecd_fragile==1
egen fragile_`x'_m=total(oppsecured_`x'_m) if oecd_fragile==1
}
*

**** Non-Fragile
putexcel A113= ("OECD 2020 - Non-Fragile")
putexcel A114= ("Female")
tabstat non_fragile_2015_f non_fragile_2016_f non_fragile_2017_f non_fragile_2018_f non_fragile_2019_f non_fragile_2020_f  non_fragile_2021_f non_fragile_2022_f non_fragile_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B114= matrix(results)
tabstat non_fragile_2024_f non_fragile_2025_f non_fragile_2026_f non_fragile_2027_f non_fragile_2028_f non_fragile_2029_f  non_fragile_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K114= matrix(results)
putexcel A115= ("Male")
tabstat non_fragile_2015_m non_fragile_2016_m non_fragile_2017_m non_fragile_2018_m non_fragile_2019_m non_fragile_2020_m  non_fragile_2021_m non_fragile_2022_m non_fragile_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B115= matrix(results)
tabstat non_fragile_2024_m non_fragile_2025_m non_fragile_2026_m non_fragile_2027_m non_fragile_2028_m non_fragile_2029_m  non_fragile_2030_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  K115= matrix(results)
putexcel A116= ("Both")
putexcel B116= formula(=(B114+B115))
putexcel C116= formula(=(C114+C115))
putexcel D116= formula(=(D114+D115))
putexcel E116= formula(=(E114+E115))
putexcel F116= formula(=(F114+F115))
putexcel G116= formula(=(G114+G115))
putexcel H116= formula(=(H114+H115))
putexcel I116= formula(=(I114+I115))
putexcel J116= formula(=(J114+J115))
putexcel K116= formula(=(K114+K115))
putexcel L116= formula(=(L114+L115))
putexcel M116= formula(=(M114+M115))
putexcel N116= formula(=(N114+N115))
putexcel O116= formula(=(O114+O115))
putexcel P116= formula(=(P114+P115))
putexcel Q116= formula(=(Q114+Q115))


**** Fragile
putexcel A118= ("OECD 2020 - Fragile")
putexcel A119= ("Female")
tabstat fragile_2015_f fragile_2016_f fragile_2017_f fragile_2018_f fragile_2019_f fragile_2020_f  fragile_2021_f fragile_2022_f fragile_2023_f, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B119= matrix(results)
tabstat fragile_2024_f fragile_2025_f fragile_2026_f fragile_2027_f fragile_2028_f fragile_2029_f  fragile_2030_f , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K119= matrix(results)
putexcel A120= ("Male")
tabstat fragile_2015_m fragile_2016_m fragile_2017_m fragile_2018_m fragile_2019_m fragile_2020_m  fragile_2021_m fragile_2022_m fragile_2023_m, stat(mean)  save
matrix results = r(StatTotal)
putexcel  B120= matrix(results)
tabstat fragile_2024_m fragile_2025_m fragile_2026_m fragile_2027_m fragile_2028_m fragile_2029_m  fragile_2030_m , stat(mean)  save
matrix results = r(StatTotal)
putexcel  K120= matrix(results)
putexcel A121= ("Both")
putexcel B121= formula(=(B119+B120))
putexcel C121= formula(=(C119+C120))
putexcel D121= formula(=(D119+D120))
putexcel E121= formula(=(E119+E120))
putexcel F121= formula(=(F119+F120))
putexcel G121= formula(=(G119+G120))
putexcel H121= formula(=(H119+H120))
putexcel I121= formula(=(I119+I120))
putexcel J121= formula(=(J119+J120))
putexcel K121= formula(=(K119+K120))
putexcel L121= formula(=(L119+L120))
putexcel M121= formula(=(M119+M120))
putexcel N121= formula(=(N119+N120))
putexcel O121= formula(=(O119+O120))
putexcel P121= formula(=(P119+P120))
putexcel Q121= formula(=(Q119+Q120))


clear
