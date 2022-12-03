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