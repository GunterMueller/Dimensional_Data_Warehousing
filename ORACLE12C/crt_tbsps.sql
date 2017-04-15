--
ALTER SESSION SET CONTAINER = gmoradb1pdb1
;
----
drop tablespace source_data_ts INCLUDING CONTENTS AND DATAFILES
;
drop tablespace source_idx_ts INCLUDING CONTENTS AND DATAFILES
;
drop tablespace source_temp_ts INCLUDING CONTENTS AND DATAFILES
;
drop tablespace dw_data_ts INCLUDING CONTENTS AND DATAFILES
;
drop tablespace dw_idx_ts INCLUDING CONTENTS AND DATAFILES
;
drop tablespace dw_temp_ts INCLUDING CONTENTS AND DATAFILES
;
create tablespace source_data_ts DATAFILE '/u01/GUNTER/PDB1/source_data_01.dbf' SIZE 512 M AUTOEXTEND ON
;
create tablespace source_idx_ts DATAFILE '/u01/GUNTER/PDB1/source_idx_01.dbf' SIZE 512 M AUTOEXTEND ON
;
create temporary tablespace source_temp_ts TEMPFILE '/u01/GUNTER/PDB1/source_temp_01.dbf' SIZE 512 M AUTOEXTEND ON
;
create tablespace dataware_data_ts   DATAFILE '/u01/GUNTER/PDB1/dataware_data_01.dbf' SIZE 512 M AUTOEXTEND ON
;
create tablespace dataware_idx_ts    DATAFILE  '/u01/GUNTER/PDB1/dataware_idx_01.dbf' SIZE 512 M AUTOEXTEND ON
;
create temporary tablespace dataware_temp_ts TEMPFILE '/u01/GUNTER/PDB1/dataware_temp_01.dbf' SIZE 512 M AUTOEXTEND ON
;
