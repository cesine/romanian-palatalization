#commands to do the duration 
SPLIT FILE
  OFF.

GRAPH
  /BAR(GROUPED)=MEAN(duration) BY placeOfArticulation BY itemContext
  /INTERVAL CI( 95).

SORT CASES BY placeOfArticulation .
SPLIT FILE
  LAYERED BY placeOfArticulation .

UNIANOVA
  duration  BY coda front
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /PLOT = PROFILE( front*coda )
  /EMMEANS = TABLES(coda) COMPARE ADJ(BONFERRONI)
  /EMMEANS = TABLES(front) COMPARE ADJ(BONFERRONI)
  /EMMEANS = TABLES(coda*front)
  /PRINT = ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = coda front coda*front .

#commands to do the spectral promancences
