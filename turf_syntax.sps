* Encoding: UTF-8.
 Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
* Define Multiple Response Sets.
MRSETS
  /MDGROUP NAME=$Products CATEGORYLABELS=VARLABELS VARIABLES=Product1 Product2 Product3 Product4 
    Product5 Product6 Product7 Product8 Product9 Product10 Product11 Product12 Product13 Product14 
    Product15 Product16 Product17 Product18 Product19 Product20 Product21 Product22 Product23 Product24 
    Product25 Product26 Product27 VALUE=1
  /DISPLAY NAME=[$Products].



SPSSINC TURF VARIABLES = Product1 Product2 Product3 Product4 Product5 Product6 Product7 Product8 
    Product9 Product10 Product11 Product12 Product13 Product14 Product15 Product16 Product17 Product18 
    Product19 Product20 Product21 Product22 Product23 Product24 Product25 Product26 Product27  FORCE=0
/OPTIONS BESTN = 10 NUMBERTODISPLAY = 5 CRITERIA = 1 PLOT=YES
REMOVALCYCLES = 0 MAXSETS=5000000 
/HEATS USEHEATS=YES 
/IMPORTANCE STRICT=YES.

DATASET ACTIVATE DataSet2.
* Define Multiple Response Sets.
MRSETS
  /MDGROUP NAME=$prod CATEGORYLABELS=VARLABELS VARIABLES=Product1 Product2 Product3 Product4 
    Product5 Product6 Product7 Product8 Product9 Product10 Product11 Product12 Product13 VALUE=5
  /DISPLAY NAME=[$prod].

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=$prod DISPLAY=LABEL
  /TABLE $prod [COUNT F40.0, COLPCT.TOTALN PCT40.1, COLPCT.RESPONSES PCT40.1]
  /CATEGORIES VARIABLES=$prod  EMPTY=INCLUDE
  /CRITERIA CILEVEL=95.
