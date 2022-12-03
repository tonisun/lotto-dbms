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

CREATE TABLE IF NOT EXISTS public.ej_draw
(
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

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ej_draw
    OWNER to ej_lotto;



-- Table: public.ej_row

-- DROP TABLE IF EXISTS public.ej_row;

CREATE TABLE IF NOT EXISTS public.ej_row
(
    row_id integer NOT NULL DEFAULT nextval('ej_row_row_id_seq'::regclass),
    n1 integer NOT NULL,
    n2 integer NOT NULL,
    n3 integer NOT NULL,
    n4 integer NOT NULL,
    n5 integer NOT NULL,
    CONSTRAINT ej_row_pkey PRIMARY KEY (row_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ej_row
    OWNER to ej_lotto;


-- PROCEDURE: public.pr_ej_all_rows()

-- DROP PROCEDURE IF EXISTS public.pr_ej_all_rows();

CREATE OR REPLACE PROCEDURE public.pr_ej_all_rows()
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    aus int;
	_z1 int;
	_z2 int;
	_z3 int;
	_z4 int;
	_z5 int;
  BEGIN
  	aus := 50;
	_z1 := 1;
    FOR _z1 IN 1 .. aus - 4 LOOP
		FOR _z2 IN _z1 + 1 .. aus - 3 LOOP
			FOR _z3 IN _z2 + 1 .. aus - 2 LOOP
				FOR _z4 IN _z3 + 1 .. aus - 1 LOOP
					FOR _z5 IN _z4 + 1 .. aus LOOP
						INSERT INTO ej_row (n1, n2, n3, n4, n5) VALUES (_z1, _z2, _z3, _z4, _z5);
					END LOOP;
				END LOOP;
			END LOOP;
		END LOOP;
	END LOOP;
  END;
$BODY$;

ALTER PROCEDURE public.pr_ej_all_rows() OWNER TO ej_lotto;
