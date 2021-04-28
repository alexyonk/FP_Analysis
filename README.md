# FP_Analysis
Custom-written MATLAB scripts to import , analyze, and plot fiber photometry data obtained through OceanOptics spectrometer and software


# Fiber Photometry Single Color Detrending Script
This script is used in conjunction with the output from OceanOptics spectrometer and software

1. The data must be imported into Excel from the text file output used by OceanOptics.
2. Once the data is imported to Excel, delete the informational columns (e.g. rows 1-14)
3. First column contains the Date/Time data
4. Second column contains the UNIX time code (NOTE: Code needs to be updated once a bug within OceanOptics is fixed). For now, the integration time is generated in the MATLAB script.
5. The rest of the columns contain the values of each specific wavelength at each sample taken.
6. This script only pulls out green light relevant data (e.g. ~500nm - ~540nm)
7. Delta F/F, Z Score, and MAD Z Score are calculated and subplotted in a graph
- ***Note: Unable to upload OceanOptics text file and Excel file as test files due to file size. Please email me if you would like these files (alex.yonk2@gmail.com)
