# **Lost Potential Tracker**

This repository contains the data and scripts which power ONE's [Lost Potential Tracker](https://lostpotential.one.org/)

## Repository structure and Information

STATA version 15+ is needed in order to reproduce the analysis.  The analysis needs to be updated approximately once a year when new learning poverty data is available (*last updated in April 2021, next update due in September 2021*). Most of the analysis can be conducted automatically by running `.do` files. Updates to the model may require manually downloading new population data from UNDESA (when available).

The repository includes the following subfolders:
 - Data
 - Documents
 - Interim
 - Model
 - Outputs
 - RawData
 - Syntax

### Data
The data folder contains the main output Excel document for this project: `LPT_data_and_sources_*date*.xlsx`.  This file contains a *Cover Sheet* explaining the document structure, different versions of the results (*LP BAU, SP BAU, etc*), tracking lost or secured potential, and information on education financing (which is infrequently updated and not part of the analysis stored on this repository).

### Documents
The documents folder contains the methodology (pdf and editable format) and other important documents for this project.

### Interim
The interim folder contains many `.dta` files, Stata's dataset format. These files are used and updated as needed when the analysis is executed. Generally, users should not need to access these files.

### Model
The model folder contains an Excel file `LPC Financing - Methodology Tables and Summary - Final`, which enables a number of calculations on the impact of financing on learning poverty and related indicators. Users can use this file by modifying the rows highlighted in green on the *Summary* tab. Similar information is provided on the LPT website, but the Excel document allows for more granular control of the numbers.

### Outputs
The outputs folder contains a number of tables which track trends over time for the overall countries under study, for countries by income level, by UN and World Bank regions, and according to their inclusion in the OECD Fragility Framework. 

### RawData
This folder contains the raw population data `csv` files used in the analysis. When new estimates are available, they should be added to this folder. Note that the analysis uses the *medium variant* for projections. The anual population data must be downloaded for `Both Sexes`, `Male` and `Female`. 

### Syntax
The Syntax folder contains all of the Stata scripts required to conduct the analysis. It is organised in two folders:
 - Master_Do_File
 - Secondary_Do_Files

#### Master_Do_File
This folder contains a single file called `0_ONE_Lost_Potential_Master_Do_file.do`.  The entire analysis can be conducted by running this file. 

In order to run the analysis correctly, the user should modify the global directory variables, which by default point to the Fab Inc authors' computer.

Before running the analysis for the first time, users should install the `wbopendata` and `kountry` packages, which are used for the project. This can be done by running the following commands:
 - `ssc install wbopendata`
 - `ssc install kountry`

By default, running the analysis will overwrite the files stored in the RawData folder. If needed, backup versions of these files should be created before running the analysis.

Not every `.do` file stored in `Secondary_Do_Files` is executed from the Master. This is because the published analysis does not make use of all the indicators that were developed during the research phase.

#### Secondary_Do_Files
This folder contains around 30 `.do` files which are the building blocks of the analysis. Most users should not need to access these files directly, though they do contain more detailed explanations of the different steps.

The naming convention of these files (they all start with a number) makes it easy to follow each step sequentially.


## Updating the analysis
There are two main steps to update the analysis:
 - Updating the model with new data. For this it is important to coordinate with Kristyn Schrader-King at the World Bank to get an advance copy of the learning poverty data.
 - Updating the Lost Potential Tracker website. For this it is important to coordinate with ONE's digital team and, when needed, with Teal - the agency which developed the site.

## Sources
A detailed methodology can be accessed [here](https://github.com/ONEcampaign/Lost-Potential-Tracker/blob/main/documents/LPT_Methodology_en_v1.pdf)

## Contributors
The research and analysis for this dashboard has been conducted by:

 - Natasha Somji (Natasha.Somji@one.org)
 - Fab Inc Ltd (Alasdair Mackintosh alasdair.mackintosh@fabinc.co.uk)