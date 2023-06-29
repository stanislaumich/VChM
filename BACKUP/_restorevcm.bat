chcp 1251
@echo off
s:
cd \
cd vchm
cd backup
sqlplus sys/manager1 as sysdba @create_vcm.sql
imp vcm/vcm ignore=y parfile=restorevcm.dat
