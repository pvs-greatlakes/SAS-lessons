data almond;
        infile "/home/u58742920/data/CONTROL_GROUP_HDL_mg_dl20210316_134515.csv" dlm = "," firstobs = 2;
        input Volunteer_id $ B_HDL E_HDL;
		diff   =  B_HDL - E_HDL;
run;

proc means data = almond NONOBS n mean STDDEV maxdec = 2;
run; 
