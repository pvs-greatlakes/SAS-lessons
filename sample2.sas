DATA TEMP;
INPUT ID $ NAME $ FBS PPBS;
LABEL ID = 'Volunteer ID';
DATALINES;
1 Antony 80 130
2 Benny 90 140
3 Cyril 103 153
4 David 112 180
5 Edward 102 160
6 Fawlin 93 145
7 Gabby 70 120
8 Henry 85 140
;
RUN;

ods rtf file = "sample2.rtf" path = "/home/u58742920/output";

PROC MEANS;
RUN;

PROC PRINT DATA = TEMP; WHERE FBS > 100 OR PPBS > 160;
RUN;
ods rtf close;
