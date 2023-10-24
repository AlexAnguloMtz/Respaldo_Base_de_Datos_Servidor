--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE alejandro_perez;
ALTER ROLE alejandro_perez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:y/Xm2CqHiXhe9jjB0k0z9g==$YwYgoHXT2lA/h8f3/qENwBT0p6vObobZHSmHk/GOJd0=:tNiOET07ZphkzTnQNSgGjyO67EXtKZ8fmZC9bT6y00Q=';
CREATE ROLE ana_lopez;
ALTER ROLE ana_lopez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:hZc4l3ZQHhJvMhGQ3RTFyw==$BfuaFEnumF2obHMORvHdg4+GHut/H4Gd9OLect3dvbc=:3OrD4AgUSnaOCV4JrkJSIDeFibaHoy5oca5+ccK84ak=';
CREATE ROLE antonio_diaz;
ALTER ROLE antonio_diaz WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:EJd/p6ANmdkgo7iwkUj3Ow==$5dYPkQSFKsyUNFTIVMPV419izNcpuVKGXtdxI/+S+Gc=:5Jbf6wDb17hQ1mZ7kf2qWWutnYvD5J+TKD7DId3JGFo=';
CREATE ROLE app_user;
ALTER ROLE app_user WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Q1i4XmDXWCM8zBzPwES0oA==$+Rl8RkEAFYxD5qnlXqO9Y0xe2WnL61LN+oucqTfmo1g=:waDOaD038M1uOQgGzQvDemrq7E9gnEVUk4yAmWVOoik=';
CREATE ROLE carlos_lopez;
ALTER ROLE carlos_lopez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:kqHN42aIXV5n9jax1kcQOg==$O1MPCjxFsK/tp6hFqeGnhxttyK/mQEPDzaEmLU0urY8=:MqhxzmdUBCMQwgi2ha/8VVR6voLYEGIGLJJVr6NpT08=';
CREATE ROLE carmen_sanchez;
ALTER ROLE carmen_sanchez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Y+9Eb5hK3uU0b9osy5j2BQ==$7fDEHhGcXbIU4IWfkn+OWjqTsFJNuYFnujpdvQ8Mtpk=:WCO1FE1O1cV58Y4V9SzL4mq4tzBbKZpOr+tAbDZPBnc=';
CREATE ROLE elena_diaz;
ALTER ROLE elena_diaz WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:QZOlXg2iPbDJqXXPBWbsDg==$IyoffvBP6pGzF1eCRVxOsVif+1s6hlI4tgix/UzDVuU=:GFbHhmQhubCPSxbYT0ClKSdx4eLFAU20YguZk6v1xnA=';
CREATE ROLE fernando_gomez;
ALTER ROLE fernando_gomez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:iyyothPX6d3xYyzs4NNcRg==$sXcqpku3fjVgmI1PTuZJjr49d+G+l9maOjwJEcUIfTM=:Fdh32MnsbOEwU340dg3JHY/FcXQNWPeHxovBPMsr4Z4=';
CREATE ROLE isabel_martinez;
ALTER ROLE isabel_martinez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:YoCIao3n2Ociov/tMokquA==$xOr/WSoVzW0Ok/UTHio+vhr373nChoPwAHY/cijW63U=:bLy42/9Pz5CU9BPKxzsWivpKs2+it/ReL3TDnqfm6QI=';
CREATE ROLE javier_hernandez;
ALTER ROLE javier_hernandez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:ImHRAR4lxUou2gr2u0LMWQ==$LtdtJSYNG8hTS6ZaCX9XZNKrDnZG8RdWFhAKYlAFf6k=:6eN4SuzZonR8zSr08Sp6zG7t7WUAw+fXvFc01K0TRHY=';
CREATE ROLE jose_sanchez;
ALTER ROLE jose_sanchez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:qfyIlmSOU3dFahVI9XE0YA==$0i5sAT+XdzcQ7iFDud7yhbHT+tBZ212OJeVM8dUe65M=:J0IPUfIxRzShVmh8z/1d1O9akPU+XbeqcuTFmjer0VU=';
CREATE ROLE juan_gonzalez;
ALTER ROLE juan_gonzalez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:OPIqDv7n+1WVjU1qbe+Icg==$ADDD4KNk874WXt2lU9TMKUozaV2A+3A/0OQWPm2ioS0=:zytXqVI6TPSYv52dkTTlXYVS9YFTD58JxxtGoFRm50I=';
CREATE ROLE luis_rodriguez;
ALTER ROLE luis_rodriguez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:mIHxHlpC+bTGM353+04zKg==$exsJ87GZJM9Kf6AVoqjcsqj5JgD2qQsMoHFNuWaVrNo=:JiDSWPVOmqz46E9r/s4xv/AeVOh2bNmPcVddOKM6zws=';
CREATE ROLE luisa_perez;
ALTER ROLE luisa_perez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:XT+OsFFYRGNtJXHvRrLmig==$EUibeBcFJZJcLhYGSwM0HBcehvyH+++u+G1sWV43kSo=:rQytKtmT8SM64YZ8Fj/udl81Iwgo8kScTdRZqzHL83c=';
CREATE ROLE manuel_torres;
ALTER ROLE manuel_torres WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:O2WBljTQzJsOm4AIw2hcRQ==$DpLpMkjPrNSVShjzrMhOyfm00WY88OhlKGUwQ/fDLBA=:pRUV1YXyuO92NnV0FwOyXwUhm1QLcZaTnYSn+hPnA/0=';
CREATE ROLE maria_gonzalez;
ALTER ROLE maria_gonzalez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:vpKRIH845Mkfj2KADIT0vQ==$ncfUcXuBIxeBzimQyCttDu0g8gIRTBeG0NEfxsGxcSs=:vloFGmdPdQJ4+P3kPuj6JVZEOxrd+td2U1sWiVJyU0U=';
CREATE ROLE mariana_hernandez;
ALTER ROLE mariana_hernandez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:8ourddxTSu35ZY6T0U1S0g==$M1tbddbUAjI0JVlkL1QvgoUPBYcaHEszd3UTDAyN3Q4=:QhqwBW/iyAKXIFnR2nefICq5TZnoNr1tx/C9SUNDO4g=';
CREATE ROLE miguel_martinez;
ALTER ROLE miguel_martinez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:OHEVMEUv2GcqtRUX+w2Ptw==$54xvtt5ztFv+VVRjG8SqMS285J8Zzi5+qWcC3V0SexI=:5eWDNj/ayVDBIGUhwpCjPnblxQXXp4+YP/O2zG+UQZ0=';
CREATE ROLE sofia_rodriguez;
ALTER ROLE sofia_rodriguez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:wKwkxl9aIm+eKsjVmxUtvw==$TwK2akEVzDmpwlscJnYdqqxyf2L1axRf2f/Bn0aIguE=:iTtx4ayJABG6yoYfVXw10JndT78xe5ClDXfyeq5Egp8=';
CREATE ROLE teresa_torres;
ALTER ROLE teresa_torres WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:UtCunixrXbkQte0cBWHzjw==$OCSmjb3UnVfj7EKuZUyyo7BY2kFXb997je+JTndHcEI=:1/clcFveJ+/RlOkoZXp1d2Z0Hy0fkPPCgaGowHUkzMk=';
CREATE ROLE veronica_gomez;
ALTER ROLE veronica_gomez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:k6n+s3xbikNmkZ97vBnrNg==$ZUEw8BaLhqB8p6B5KghqbieXsWGUmCWwfbgC11hTMuw=:Ovazft6Os+kYCYR38G0RtbpM62t0KIPNl3l5J8vALWI=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "app_user" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: app_user; Type: DATABASE; Schema: -; Owner: app_user
--

CREATE DATABASE app_user WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE app_user OWNER TO app_user;

\connect app_user

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: restaurante; Type: SCHEMA; Schema: -; Owner: app_user
--

CREATE SCHEMA restaurante;


ALTER SCHEMA restaurante OWNER TO app_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: proveedores; Type: TABLE; Schema: restaurante; Owner: app_user
--

CREATE TABLE restaurante.proveedores (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE restaurante.proveedores OWNER TO app_user;

--
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: restaurante; Owner: app_user
--

CREATE SEQUENCE restaurante.proveedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restaurante.proveedores_id_seq OWNER TO app_user;

--
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: restaurante; Owner: app_user
--

ALTER SEQUENCE restaurante.proveedores_id_seq OWNED BY restaurante.proveedores.id;


--
-- Name: vehiculos; Type: TABLE; Schema: restaurante; Owner: app_user
--

CREATE TABLE restaurante.vehiculos (
    id integer NOT NULL,
    modelo character varying(50) NOT NULL,
    placas character varying(10) NOT NULL
);


ALTER TABLE restaurante.vehiculos OWNER TO app_user;

--
-- Name: vehiculos_id_seq; Type: SEQUENCE; Schema: restaurante; Owner: app_user
--

CREATE SEQUENCE restaurante.vehiculos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restaurante.vehiculos_id_seq OWNER TO app_user;

--
-- Name: vehiculos_id_seq; Type: SEQUENCE OWNED BY; Schema: restaurante; Owner: app_user
--

ALTER SEQUENCE restaurante.vehiculos_id_seq OWNED BY restaurante.vehiculos.id;


--
-- Name: proveedores id; Type: DEFAULT; Schema: restaurante; Owner: app_user
--

ALTER TABLE ONLY restaurante.proveedores ALTER COLUMN id SET DEFAULT nextval('restaurante.proveedores_id_seq'::regclass);


--
-- Name: vehiculos id; Type: DEFAULT; Schema: restaurante; Owner: app_user
--

ALTER TABLE ONLY restaurante.vehiculos ALTER COLUMN id SET DEFAULT nextval('restaurante.vehiculos_id_seq'::regclass);


--
-- Data for Name: proveedores; Type: TABLE DATA; Schema: restaurante; Owner: app_user
--

COPY restaurante.proveedores (id, name) FROM stdin;
\.


--
-- Data for Name: vehiculos; Type: TABLE DATA; Schema: restaurante; Owner: app_user
--

COPY restaurante.vehiculos (id, modelo, placas) FROM stdin;
\.


--
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: restaurante; Owner: app_user
--

SELECT pg_catalog.setval('restaurante.proveedores_id_seq', 1, false);


--
-- Name: vehiculos_id_seq; Type: SEQUENCE SET; Schema: restaurante; Owner: app_user
--

SELECT pg_catalog.setval('restaurante.vehiculos_id_seq', 1, false);


--
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: restaurante; Owner: app_user
--

ALTER TABLE ONLY restaurante.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- Name: vehiculos vehiculos_pkey; Type: CONSTRAINT; Schema: restaurante; Owner: app_user
--

ALTER TABLE ONLY restaurante.vehiculos
    ADD CONSTRAINT vehiculos_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

