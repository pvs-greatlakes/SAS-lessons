
DATA scores;
     infile "/home/u58742920/data/scores.csv" dlm = ",";
     input Volunteer_id B_score E_score;
run;

PROC MEANS DATA = SCORES (DROP = Volunteer_id) N NMISS MEAN STD STDERR CLM; 
RUN;

PROC MEANS DATA = SCORES NOPRINT;
VAR B_score E_score;
OUTPUT OUT = SCORES2 mean(B_score E_score) = mean_B_score mean_E_score
                  std(B_score E_score)  = sd_B_score sd_E_score;
RUN;

DATA  SCORES3;
SET SCORES2;
MEAN_sd_B_score = trim(left(put(mean_B_score,10.2))) || 'c2b1'x || trim(left(put(sd_B_score,10.2))); 
MEAN_sd_E_score = trim(left(put(mean_E_score,10.2))) || 'c2b1'x || trim(left(put(sd_E_score,10.2)));

ods rtf file = "PAIRED-T-TEST.rtf" path = "/home/u58742920/output";

PROC  PRINT DATA = SCORES; * without plus minus symbol;
RUN;

PROC PRINT DATA = SCORES3; *with plus minus symbol;
RUN;

PROC TTEST DATA = scores ALPHA = .05;
    PAIRED B_score * E_score;
RUN;
ods rtf close;
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