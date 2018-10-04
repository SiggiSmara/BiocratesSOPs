## Appendix 7 B: Flow Injection Analysis (FIA) System Suitability Test
The Testmix must be used to perform a system suitability test before using the Kit. A proper Kit performance can only be
guaranteed when the Testmix run was performed successfully. Also, all system parts must be clean and the blank levels
low. Please find the Testmix vial (label “KIT1/KIT3 Testmix”) in the vial box of your Kit. The Testmix contains a ­selection of
metabolites (without internal standards) that are analyzed by the FIA part of the Kit. The ­Testmix is intended to check the
condition of your system and the ion spray stability. Here you find the instructions for using the Testmix.
### 1.	MetIDQ Software
* In order to import the required project template below you need the MetIDQ Boron version. If you are still
using an older MetIDQ Beryllium version, you can upgrade MetIDQ free of charge. Please contact our custo-
mer support.
* Import the database patch ”FIA_System_Template.jar“ according to appendix 6.6 of the MetIDQ Boron
manual. You find the patch in the ”Testmix Files“ folder on the USB stick.
* Go to the MetLIMS module in MetIDQ and import the project “FIA_System_Test_Template.metidq” (Import
Project button above the project tree).
* Select the worklist in the project tree and copy the worklist by using the right mouse button. Select “Copy”.
* Click on the project and generate a new submission (button “New Submission”), e.g. using the current date
as submission name. Click on the new submission in the project tree, do right mouse click and choose “Paste
Derived Worklist”.
* Note that there are several plate layouts in the worklist of the imported project. You can delete some worklists,
according to your needs and wishes.
* Change the OP according to your Kit and MS instruments: 6500 Series - KIT3-0-5604
* Finally, click the button Export Worklist for MS above the project tree. Choose your MS and autosampler type
and export the worklist. A batch file for your MS is now created (csv file for the SCIEX Analyst software). One
batch file per plate layout is created. You find the corresponding plate bar code in the file name.

### 2.	Installing Wash Solvents
Prepare and install the following wash solvents at your autosampler system. If it is not possible to install two wash
solvents, use solvent 1.
Solvent 1: 50% acetonitrile, 20% methanol, 15% isopropanol, 15% water, 0.25% formic acid
Solvent 2: 33% methanol, 33% isopropanol, 33% water

### 3.	Preparation of the Testmix
Add 200 μL of 90% methanol (in HPLC grade water) to the Testmix vial. Shake for 15 minutes at 600 rpm and
vortex afterwards. Further dilution of the Testmix depends on the MS type you are using:
Note: The Testmix is stable for 1 week at 4°C after preparation.

#### SCIEX 6500 Series
Transfer 10 μL to an empty vial and add 2 mL of FIA mobile phase.
See manual section 4.4.5. for preparing the solvent. Vortex the diluted
Testmix.

### 4.	Running the Testmix
* Take an empty 96-well plate (deepwell or standard). Fill each well of row 1 with 100 μL FIA mobile phase
(used as blank sample) and each well of row 2 with 100 μL of the prepared Testmix. seal the plate with a
silicon mat that you find in the Kit box. Place the plate in your autosampler.
* Import the batch file (created in MetIDQ as described above) into your MS operating software. Please find
instructions in section 5 of the manual for importing the file.
* The KIT3-FIA acquisition method must be used. The injection volume is 20 μL. Finally run the batch.

### 5.	Evaluation of the Testmix Measurement
Parse the obtained data files into MetIDQ (according to the MetIDQ manual section 5.2). Validate the plate run in
the MetVal module.
#### System Condition:
In the MetVal module of MetIDQ, the last measured blank well must be green. If it is not green, check if there
is a cleaning effect from the first to the last measured blank. Usually the blanks become better from injection to
injection. In case all blank wells are displayed yellow in MetVal, clean all autosampler devices with wash solvent
1. It is also recommended to fill FIA mobile phase into a clean glass vial or into empty wells of a 96-well plate and
to inject plenty of blanks in series. You can also try other wash solvents you have good experience with. Finally
repeat the FIA Testmix measurement as described above.

#### Ion Spray Stability and MS Sensitivity:
* Click on the Plate Run in the Plate Desk table in MetVal. Now you are linked directly to the “Display Data” tab
in the MetStat module. Click on the “Select Samples” tab and unlink the blank sample. Go to “Display Data”
again.
* Change the type of value from ”Concentration“ to ”Intensity Analyte [cps]“. Export the data to Excel.
* Copy the complete rows from the Excel file (created by MetIDQ) into the Excel template that you find on the
USB stick (subfolder ”Testmix Files“).
* Select “Werte einfügen” (deu) or “Paste values” (eng) for pasting the values into the Excel template. Make
sure that your data are copied correctly into the Excel sheet. There are three sets of example data with the
corresponding graphics in the templates, which show the values of different intensities for each metabolite.
* All analytes that are spiked into the Testmix are highlighted in red. Check the ion spray stability in the graphics
of the spiked analytes. There is one spreadsheet for each spiked analyte. The upper and lower limits in the
graphics (red lines) are dynamic. For each analyte, the limits are based on the median of the intensity (cps)
values. This median value is automatically calculated in the Excel template after importing the data. The lower
limit is set to 0.5 times the median and the upper limit is set to 1.5 times the median.
* The replicate measurements must show small intensity variations. They should also be in the same intensity
range when performing inter-day measurements. High variations point to an unstable ion spray. In this case,
please flush and re-adjust the ESI electrode, or replace the electrode if necessary.
* Values with yellow background are higher than 5 times the mean of all intensities (calculated for each analyte
separately, all values in one analyte column are considered for mean calculation). Those increased intensity
values might be generated by interfering signals, i.e. caused by contaminations (note that the MetVal module
in MetIDQ considers intensities of internal standards only). Electronic problems caused by mass spectrome-
ter devices can also be a reason. Single outliers are not problematic. If you obtain several outliers in plenty
of analytes, please contact Biocrates customer support to find a solution.
