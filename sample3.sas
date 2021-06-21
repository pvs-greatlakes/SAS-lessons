DATA TEMP;
length Name $30;
INPUT ID GENDER $ NAME $ FBS PPBS;
LABEL ID = 'Volunteer ID';
DATALINES;
1 Male Antony 80 130
2 Male Benny 90 140
3 Male Cyril 103 153
4 Male David 112 180
5 Female Daisy 90 140
6 Male Edward 102 160
7 Female Elizabeth 89 150
8 Female Fawlin 93 145
9 Female Gabby 70 120
10 Male Henry 85 140
;
RUN;
ods rtf file = "sample3.rtf" path = "/home/u58742920/output";

/* The CONTENTS procedure generates summary information about the contents of a dataset */

proc contents data = TEMP;
run;

/* Sort the data by gender*/

proc sort data = temp;
  by gender;
run;

proc print data = temp;
title 'Blood Sugar Levels'; 
run;

PROC MEANS;
title 'Blood Sugar Levels summary statistics grouped by gender'; 
class gender;
RUN;

ods rtf close;

