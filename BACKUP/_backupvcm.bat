rem @echo off
del backupvcm_prev.dmp
ren backupvcm.dmp backupvcm_prev.dmp
rem del backupvcm.dmp
sqlplus vcm/vcm @backupvcm.sql
exp vcm/vcm parfile=backupvcm.dat
rem del *.log
rar a -m5 -ag_dd.mm.yyyy-hh-mi-ss backupvcm @backupvcm.lst
rem pause