# FP_Analysis
Custom-written MATLAB scripts to import , analyze, and plot fiber photometry data obtained through OceanOptics spectrometer and software


# Fiber Photometry Single Color Detrending Script
This script is used in conjunction with the output from OceanOptics spectrometer and software

The data must be imported into Excel from the text file output used by OceanOptics.
Once the data is imported to Excel, delete the informational columns (e.g. rows 1-14)
First column contains the Date/Time data
Second column contains the UNIX time code (NOTE: Code needs to be updated once a bug within OceanOptics is fixed). For now, the integration time is generated in the MATLAB script.
The rest of the columns contain the values of each specific wavelength at each sample taken.
This script only pulls out green light relevant data (e.g. ~500nm - ~540nm)
Delta F/F, Z Score, and MAD Z Score are calculated and subplotted in a graph
***Note: Both the OceanOptics text file and Excel file have been uploaded as test files
