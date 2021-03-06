Python importing sas dataset with 505 columns and 100 thousand rows

 WPS/Proc Python solution

github
https://tinyurl.com/y8xf8wnt
https://github.com/rogerjdeangelis/python_importing_sas_dataset_with_505_columns_and_100_thousand_rows

StackOverflow
https://tinyurl.com/y6wruwg4
https://stackoverflow.com/questions/51281923/pandas-read-sas-valueerror-length-of-values-does-not-match-length-of-index

I have an inexpensive, $600 workstation, a dell T7400.

INPUT
=====

 505 columns and 100 000 rows

SD1.HAVE total obs=100,000

 -- NUMERIC --  Type    Length
N1                N8       9
N2                N8       9
N3                N8       9
...
N502              N8       9                   N502
N503              N8       9                   N503
N504              N8       9                   N504


EXAMPLE OUTPUT (last 5 rows printed by Python)
==============================================

        N1   N2   N3   N4   N5   N6   N7   N8   N9  N10    ...     N496  N497  \
99995  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0    ...      9.0   9.0
99996  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0    ...      9.0   9.0
99997  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0    ...      9.0   9.0
99998  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0    ...      9.0   9.0
99999  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0    ...      9.0   9.0

       N498  N499  N500  N501  N502  N503  N504       REC
99995   9.0   9.0   9.0   9.0   9.0   9.0   9.0   99996.0
99996   9.0   9.0   9.0   9.0   9.0   9.0   9.0   99997.0
99997   9.0   9.0   9.0   9.0   9.0   9.0   9.0   99998.0
99998   9.0   9.0   9.0   9.0   9.0   9.0   9.0   99999.0
99999   9.0   9.0   9.0   9.0   9.0   9.0   9.0  100000.0



PROCESS (working python code)
==============================

have = pandas.read_sas('d:/sd1/have.sas7bdat',encoding='ascii');
print(have.tail(5));


OUTPUT
======

NOTE: Submitted statements took :
      real time : 8.903
      cpu time  : 0.046
The PYTHON Procedure

        N1   N2   N3   N4   N5   N6   N7   N8   N9  N10    ...     N496  N497  \
99995  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0    ...      9.0   9.0
99996  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0    ...      9.0   9.0
99997  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0    ...      9.0   9.0
99998  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0    ...      9.0   9.0
99999  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0  9.0    ...      9.0   9.0

       N498  N499  N500  N501  N502  N503  N504       REC
99995   9.0   9.0   9.0   9.0   9.0   9.0   9.0   99996.0
99996   9.0   9.0   9.0   9.0   9.0   9.0   9.0   99997.0
99997   9.0   9.0   9.0   9.0   9.0   9.0   9.0   99998.0
99998   9.0   9.0   9.0   9.0   9.0   9.0   9.0   99999.0
99999   9.0   9.0   9.0   9.0   9.0   9.0   9.0  100000.0

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
  array nums[504] n1-n504 (504*9);
  do rec=1 to 100000;
    output;
  end;
run;quit;

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

* WPS Proc/Python;

%utl_submit_wps64("
options set=PYTHONHOME 'C:\Progra~1\Python~1.5\';
options set=PYTHONPATH 'C:\Progra~1\Python~1.5\lib\';
proc python;
submit;
import pandas as pd;
from sas7bdat import SAS7BDAT;
have = pandas.read_sas('d:/sd1/have.sas7bdat',encoding='ascii');
print(have.tail(5));
endsubmit;
run;quit;
");

