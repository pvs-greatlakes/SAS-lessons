data scores;
        infile "/home/u58742920/data/scores.csv" dlm = ",";
        input Volunteer_id B_score E_score;
run;

PROC TTEST DATA = scores ALPHA = .05;
    PAIRED B_score * E_score;
RUN;
/* In the PROC TTEST statement, the DATA option specifies the name of your dataset. 
* The optional ALPHA option specifies the desired significance level. 
* By default, PROC TTEST uses ALPHA=.05 (i.e., 5% significance), 
* but you can set it to ALPHA=.01 for 1% significance, or ALPHA=.10 for 10% significance, etc.
*
* The PAIRED statement is where you specify the pair(s) of variables you will test, 
* using an asterisk between the variable names denote a pair. 
* You can specify multiple pairings by separating each pairing with a space.
* https://libguides.library.kent.edu/SAS/PairedSamplestTest
*/