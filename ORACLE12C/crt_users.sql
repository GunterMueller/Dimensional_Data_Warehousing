--
DROP USER C##DATAWARE
;
DROP USER C##SOURCE
;
CREATE USER C##DATAWARE IDENTIFIED BY DATAWARE
default tablespace dataware_data_ts
temporary tablespace  dataware_temp_ts
;
CREATE USER C##SOURCE IDENTIFIED BY SOURCE
default tablespace  source_data_ts
temporary tablespace source_temp_ts;
;
grant create session to c##dataware  WITH ADMIN OPTION;
;
grant create table to c##dataware
;
grant unlimited tablespace to  c##dataware
;
grant create session to c##source  WITH ADMIN OPTION;
;
grant create table to c##source
;
grant unlimited tablespace to  c##source
;
