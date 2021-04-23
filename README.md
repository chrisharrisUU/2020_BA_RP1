R code for 

*Citation*

[OSF Repository](https://osf.io/) (*not included yet*)



### Structure of the repository

The data files are organized as follows: The main scripts can be found in the folder `Analyses`. These scripts load the raw data (from the `Data` folder), as well as helper functions that have been outsourced to the `Auxiliary` folder. The respective analyses are grouped and in the same order also found in the manuscript, though within groups the order of individual statistical tests might vary slightly. Output (especially the graphs) is saved to the `Output` folder. Finally, the `Survey` folder includes stimulus material as well as the xml-files that make up the experiment as it was run on SosciSurvey.  

The `Analyses` folder furthermore contains a script which allowed us to copy/paste Bayesian t-tests for robustness analyses. It requires copying the respective test and some manual adjustments! The `Auxiliary` folder contains two scripts for each experiment. One to import the raw data as it was downloaded from SosciSurvey into an R environment and one script that trims the dataset to completed cases, renames the variables of interest from SosciSurvey, and provides a function that recodes the counterbalancing measures we had taken during the survey.  

We also provide a second readme file in the `Data` folder that provides a codebook for the variables we use in these datasets. **Not done yet**