-- Role: ej_lotto
-- DROP ROLE IF EXISTS ej_lotto;

CREATE ROLE ej_lotto WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  CREATEDB
  NOCREATEROLE
  NOREPLICATION
  ENCRYPTED PASSWORD 'SCRAM-SHA-256$4096:sP+kNtYPyOvs77EOZvGHhA==$Xr8RDnLe0xCrlikHwMe4auwoh681tvfJLOqEsxgHy4I=:crXTLQ59j7V1Q2GYch9Kgee6SishRkV7PASgHJwNN1w=';

-- Database: ej_lotto
-- DROP DATABASE IF EXISTS ej_lotto;

CREATE DATABASE ej_lotto
    WITH 
    OWNER = ej_lotto
    ENCODING = 'UTF8'
    LC_COLLATE = 'German_Germany.1252'
    LC_CTYPE = 'German_Germany.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


-- Table: public.ej_draw
-- DROP TABLE IF EXISTS public.ej_draw;

CREATE TABLE IF NOT EXISTS public.ej_draw (
    date date NOT NULL,
    n1 integer NOT NULL,
    n2 integer NOT NULL,
    n3 integer NOT NULL,
    n4 integer NOT NULL,
    n5 integer NOT NULL,
    en1 integer NOT NULL,
    en2 integer NOT NULL,
    CONSTRAINT ej_draw_pkey PRIMARY KEY (date)
)

ALTER TABLE IF EXISTS public.ej_draw OWNER to ej_lotto;



-- Table: public.ej_row
-- DROP TABLE IF EXISTS public.ej_row;

CREATE TABLE IF NOT EXISTS public.ej_row (
    row_id integer NOT NULL DEFAULT nextval('ej_row_row_id_seq'::regclass),
    n1 integer NOT NULL,
    n2 integer NOT NULL,
    n3 integer NOT NULL,
    n4 integer NOT NULL,
    n5 integer NOT NULL,
    CONSTRAINT ej_row_pkey PRIMARY KEY (row_id)
)

ALTER TABLE IF EXISTS public.ej_row OWNER to ej_lotto;


-- PROCEDURE: public.pr_ej_all_rows()
-- DROP PROCEDURE IF EXISTS public.pr_ej_all_rows();

CREATE OR REPLACE PROCEDURE public.pr_ej_all_rows()
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    _from int;
	_n1 int;
	_n2 int;
	_n3 int;
	_n4 int;
	_n5 int;
  BEGIN
  	_from := 50;
	_n1 := 1;
    FOR _n1 IN 1 .. _from - 4 LOOP
		FOR _z2 IN _n1 + 1 .. _from - 3 LOOP
			FOR _n3 IN _n2 + 1 .. _from - 2 LOOP
				FOR _n4 IN _n3 + 1 .. _from - 1 LOOP
					FOR _n5 IN _n4 + 1 .. _from LOOP
						INSERT INTO ej_row (n1, n2, n3, n4, n5) VALUES (_n1, _n2, _n3, _n4, _n5);
					END LOOP;
				END LOOP;
			END LOOP;
		END LOOP;
	END LOOP;
  END;
$BODY$;

ALTER PROCEDURE public.pr_ej_all_rows() OWNER TO ej_lotto;
