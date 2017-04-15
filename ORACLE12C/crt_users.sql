--
ALTER SESSION SET CONTAINER = gmoradb1pdb1
;
------------------------
DROP USER DATAWARE
;
DROP USER SOURCE
;
CREATE USER DATAWARE IDENTIFIED BY DATAWARE
default tablespace dataware_data_ts
temporary tablespace  dataware_temp_ts
;
CREATE USER SOURCE IDENTIFIED BY SOURCE
default tablespace  source_data_ts
temporary tablespace source_temp_ts;
;
grant create session to dataware  WITH ADMIN OPTION;
;
grant create table to dataware
;
grant unlimited tablespace to  dataware
;
grant create session to source  WITH ADMIN OPTION;
;
grant create table to source
;
grant unlimited tablespace to  source
;
