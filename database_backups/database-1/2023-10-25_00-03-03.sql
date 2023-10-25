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
ALTER ROLE alejandro_perez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:cSXXkbWtWxw48dhPIaNyFg==$TW4jBkh7uYaOm10tmO91NwToS721NHqK5cKSR27Wlqo=:CZZLRFdCQdnCAnkedoFLRpAQirWVYoDXThAhsaB0cbA=';
CREATE ROLE ana_lopez;
ALTER ROLE ana_lopez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:nq5bOdkZ7Uve42jTYr61cw==$pOu2h4QNdZM0Skmiqr3bXhciUqE2J9ygZqpy0Sggdp0=:RPXIVJViCwYcahHnFrxIVbxoWOvjxSc/2aM3WTB88G4=';
CREATE ROLE antonio_diaz;
ALTER ROLE antonio_diaz WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:eM4vgkycVAMZ2JWWK0W+Ag==$RbUnXK13+ynas44MosS0jcdyL93HY4v9AU9n74OIovE=:haRlY6zvbQ+imTqH0f5CXsgQTyNIirBRhIqbW0IuuvY=';
CREATE ROLE carlos_lopez;
ALTER ROLE carlos_lopez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:tuBPhXt3WSNpS+uxQ2MqIg==$SgT3iW9q7DZINeVtCSHD3ccgd6iYy/zYNyLHfpywneo=:nSY8eoR9Zu/MSc3SFBNx+tsXfXLDIybcmKY8A+PL7B4=';
CREATE ROLE carmen_sanchez;
ALTER ROLE carmen_sanchez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:DXf7Qce216lMsDZCAsNNvQ==$2Z+RBo2+61lkHmUPkhR8MB61cw1vOxfYwmz0LIWb+S0=:M5y6ILrJ1iEyb1XrTRsHsVp/ae7F17ixydZfS3+GE+U=';
CREATE ROLE elena_diaz;
ALTER ROLE elena_diaz WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:3kjSi7aLdH2KpklswO7OsA==$491LzhB9uIzhcLFV3s6DQFzSm1fK6Dmv5WCvXetbR3U=:K3CnVDLkAH71ZYP5CuPulpT/Z1wUd8D+B4/yOc5wQRs=';
CREATE ROLE fernando_gomez;
ALTER ROLE fernando_gomez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:KmFKFCTO2iyYN8PFK5OBjQ==$P43haoqEjhubcj7Lt+PaKJJtRTk8jtKfOuxc/97g2ws=:YOUYYfSAOB0DHqBfYaeD5fD+aPOfgmhiLn2alWRzQzY=';
CREATE ROLE jose_sanchez;
ALTER ROLE jose_sanchez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:iqAw5muTC1cAT2YKvBdR0w==$xRd+PBM8HAffeJ7Rfdn2+BeFnNArtkiMmcVtsbsW7Fs=:eBp4Hqb7Q+ibuHn4cMWAzv7pw2FD8FTeNBXHI/uGAVY=';
CREATE ROLE juan_gonzalez;
ALTER ROLE juan_gonzalez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:lykq254CjIfsYoJFuWbPOA==$+paVBqxtZatUahPG+jBvgkFUuxSeX3fJQ1JqoFz6Y9Q=:7rzAkymaqeY4wqmA6O83iY5WtE0cQrsPuXLietoGZKA=';
CREATE ROLE luis_rodriguez;
ALTER ROLE luis_rodriguez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:M0ZVkclxeIcnLJjOux6oIw==$PIGs+T41NoC9g4Wzr7PNTXkXlTHKURJOMO8jZ7eoY4A=:X3FgOBpi5AOXJXE48E8GOeIPGDErKNXgQ6MH+AbWGRU=';
CREATE ROLE luisa_perez;
ALTER ROLE luisa_perez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:R2H9tz7+BEVgwg16Wk3KVQ==$oYui0pXARzAeVznyoOv+qItkxOtuAHNOggapADlLp4E=:uLZIB6/rZpWHAIOVlIE0dkmStgiP7ID7MWhhVXMpu9A=';
CREATE ROLE manuel_torres;
ALTER ROLE manuel_torres WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:fxHbc8GXiymeNUUrOu8vAA==$GcRXSFTVSgsKR+FRlpaP9GNBzWBbG2GX8kYHYQuSa5A=:j4sb7X/CK5aEj3jPbY81n67p6eOx1H+BTGsSVd4Ej18=';
CREATE ROLE my_postgres_user;
ALTER ROLE my_postgres_user WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:TO3hx+irVuq8b8tjYujYGw==$qq+9BOdeo/Bmr3D4XSSJqzsboWeuV+3OFm6r4BI0nJE=:dFprEO7WNfewG0b5hSZv07Vh1Ssz1KVs4A01cnm++O0=';
CREATE ROLE sofia_rodriguez;
ALTER ROLE sofia_rodriguez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Gf1/Lm4t+jRCakzk7Fn2ng==$BTHYJuVo2m+NASCk5Y4H2xQV18svlvn7Na2LUYenKoQ=:GWqphjvMVFz7g6la+aTPgWd+8xsxwvOvoIRaARJ4HrE=';
CREATE ROLE teresa_torres;
ALTER ROLE teresa_torres WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:3Yh9tGhVnQp4MJ11AqtrXw==$ui8/kSeDllSDLPSSri8l3M31vm3Q55+ij+AmXty3LPk=:CqTfB/vPuieG/Y6zsjWQ7mgOBigQrADKYSYTHiYod/w=';
CREATE ROLE veronica_gomez;
ALTER ROLE veronica_gomez WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Bw0/wTq51Y2DG+G3n9GlJw==$rp6K/1UGuzgjEy8pSKjoIKAs0A5LQ+x7LGwolg4BvQE=:qUnDc3hlVxERUOMSSJ/24a7ZsI469t5DUOj6l/jG62w=';

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

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 15.4

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
-- Database "my_postgres_user" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 15.4

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
-- Name: my_postgres_user; Type: DATABASE; Schema: -; Owner: my_postgres_user
--

CREATE DATABASE my_postgres_user WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE my_postgres_user OWNER TO my_postgres_user;

\connect my_postgres_user

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
-- Name: banco; Type: SCHEMA; Schema: -; Owner: my_postgres_user
--

CREATE SCHEMA banco;


ALTER SCHEMA banco OWNER TO my_postgres_user;

--
-- Name: biblioteca; Type: SCHEMA; Schema: -; Owner: my_postgres_user
--

CREATE SCHEMA biblioteca;


ALTER SCHEMA biblioteca OWNER TO my_postgres_user;

--
-- Name: restaurante; Type: SCHEMA; Schema: -; Owner: my_postgres_user
--

CREATE SCHEMA restaurante;


ALTER SCHEMA restaurante OWNER TO my_postgres_user;

--
-- Name: teatro; Type: SCHEMA; Schema: -; Owner: my_postgres_user
--

CREATE SCHEMA teatro;


ALTER SCHEMA teatro OWNER TO my_postgres_user;

--
-- Name: universidad; Type: SCHEMA; Schema: -; Owner: my_postgres_user
--

CREATE SCHEMA universidad;


ALTER SCHEMA universidad OWNER TO my_postgres_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clientes; Type: TABLE; Schema: banco; Owner: my_postgres_user
--

CREATE TABLE banco.clientes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(100) NOT NULL,
    saldo numeric(10,2) NOT NULL
);


ALTER TABLE banco.clientes OWNER TO my_postgres_user;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: banco; Owner: my_postgres_user
--

CREATE SEQUENCE banco.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banco.clientes_id_seq OWNER TO my_postgres_user;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: banco; Owner: my_postgres_user
--

ALTER SEQUENCE banco.clientes_id_seq OWNED BY banco.clientes.id;


--
-- Name: transacciones; Type: TABLE; Schema: banco; Owner: my_postgres_user
--

CREATE TABLE banco.transacciones (
    id integer NOT NULL,
    fecha_hora timestamp without time zone NOT NULL,
    cliente_id integer NOT NULL,
    monto numeric(10,2) NOT NULL
);


ALTER TABLE banco.transacciones OWNER TO my_postgres_user;

--
-- Name: transacciones_id_seq; Type: SEQUENCE; Schema: banco; Owner: my_postgres_user
--

CREATE SEQUENCE banco.transacciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banco.transacciones_id_seq OWNER TO my_postgres_user;

--
-- Name: transacciones_id_seq; Type: SEQUENCE OWNED BY; Schema: banco; Owner: my_postgres_user
--

ALTER SEQUENCE banco.transacciones_id_seq OWNED BY banco.transacciones.id;


--
-- Name: lectores; Type: TABLE; Schema: biblioteca; Owner: my_postgres_user
--

CREATE TABLE biblioteca.lectores (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(100) NOT NULL
);


ALTER TABLE biblioteca.lectores OWNER TO my_postgres_user;

--
-- Name: lectores_id_seq; Type: SEQUENCE; Schema: biblioteca; Owner: my_postgres_user
--

CREATE SEQUENCE biblioteca.lectores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE biblioteca.lectores_id_seq OWNER TO my_postgres_user;

--
-- Name: lectores_id_seq; Type: SEQUENCE OWNED BY; Schema: biblioteca; Owner: my_postgres_user
--

ALTER SEQUENCE biblioteca.lectores_id_seq OWNED BY biblioteca.lectores.id;


--
-- Name: libros; Type: TABLE; Schema: biblioteca; Owner: my_postgres_user
--

CREATE TABLE biblioteca.libros (
    id integer NOT NULL,
    titulo character varying(100) NOT NULL,
    autor character varying(100) NOT NULL,
    editorial character varying(50) NOT NULL
);


ALTER TABLE biblioteca.libros OWNER TO my_postgres_user;

--
-- Name: libros_id_seq; Type: SEQUENCE; Schema: biblioteca; Owner: my_postgres_user
--

CREATE SEQUENCE biblioteca.libros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE biblioteca.libros_id_seq OWNER TO my_postgres_user;

--
-- Name: libros_id_seq; Type: SEQUENCE OWNED BY; Schema: biblioteca; Owner: my_postgres_user
--

ALTER SEQUENCE biblioteca.libros_id_seq OWNED BY biblioteca.libros.id;


--
-- Name: proveedores; Type: TABLE; Schema: restaurante; Owner: my_postgres_user
--

CREATE TABLE restaurante.proveedores (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE restaurante.proveedores OWNER TO my_postgres_user;

--
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: restaurante; Owner: my_postgres_user
--

CREATE SEQUENCE restaurante.proveedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE restaurante.proveedores_id_seq OWNER TO my_postgres_user;

--
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: restaurante; Owner: my_postgres_user
--

ALTER SEQUENCE restaurante.proveedores_id_seq OWNED BY restaurante.proveedores.id;


--
-- Name: vehiculos; Type: TABLE; Schema: restaurante; Owner: my_postgres_user
--

CREATE TABLE restaurante.vehiculos (
    id integer NOT NULL,
    modelo character varying(50) NOT NULL,
    placas character varying(10) NOT NULL
);


ALTER TABLE restaurante.vehiculos OWNER TO my_postgres_user;

--
-- Name: vehiculos_id_seq; Type: SEQUENCE; Schema: restaurante; Owner: my_postgres_user
--

CREATE SEQUENCE restaurante.vehiculos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE restaurante.vehiculos_id_seq OWNER TO my_postgres_user;

--
-- Name: vehiculos_id_seq; Type: SEQUENCE OWNED BY; Schema: restaurante; Owner: my_postgres_user
--

ALTER SEQUENCE restaurante.vehiculos_id_seq OWNED BY restaurante.vehiculos.id;


--
-- Name: actores; Type: TABLE; Schema: teatro; Owner: my_postgres_user
--

CREATE TABLE teatro.actores (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    edad integer NOT NULL
);


ALTER TABLE teatro.actores OWNER TO my_postgres_user;

--
-- Name: actores_id_seq; Type: SEQUENCE; Schema: teatro; Owner: my_postgres_user
--

CREATE SEQUENCE teatro.actores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teatro.actores_id_seq OWNER TO my_postgres_user;

--
-- Name: actores_id_seq; Type: SEQUENCE OWNED BY; Schema: teatro; Owner: my_postgres_user
--

ALTER SEQUENCE teatro.actores_id_seq OWNED BY teatro.actores.id;


--
-- Name: obras; Type: TABLE; Schema: teatro; Owner: my_postgres_user
--

CREATE TABLE teatro.obras (
    id integer NOT NULL,
    titulo character varying(100) NOT NULL,
    autor character varying(100) NOT NULL,
    fecha_estreno date NOT NULL
);


ALTER TABLE teatro.obras OWNER TO my_postgres_user;

--
-- Name: obras_id_seq; Type: SEQUENCE; Schema: teatro; Owner: my_postgres_user
--

CREATE SEQUENCE teatro.obras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teatro.obras_id_seq OWNER TO my_postgres_user;

--
-- Name: obras_id_seq; Type: SEQUENCE OWNED BY; Schema: teatro; Owner: my_postgres_user
--

ALTER SEQUENCE teatro.obras_id_seq OWNED BY teatro.obras.id;


--
-- Name: estudiantes; Type: TABLE; Schema: universidad; Owner: my_postgres_user
--

CREATE TABLE universidad.estudiantes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    carrera character varying(50) NOT NULL,
    fecha_ingreso date NOT NULL
);


ALTER TABLE universidad.estudiantes OWNER TO my_postgres_user;

--
-- Name: estudiantes_id_seq; Type: SEQUENCE; Schema: universidad; Owner: my_postgres_user
--

CREATE SEQUENCE universidad.estudiantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE universidad.estudiantes_id_seq OWNER TO my_postgres_user;

--
-- Name: estudiantes_id_seq; Type: SEQUENCE OWNED BY; Schema: universidad; Owner: my_postgres_user
--

ALTER SEQUENCE universidad.estudiantes_id_seq OWNED BY universidad.estudiantes.id;


--
-- Name: profesores; Type: TABLE; Schema: universidad; Owner: my_postgres_user
--

CREATE TABLE universidad.profesores (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    departamento character varying(50) NOT NULL
);


ALTER TABLE universidad.profesores OWNER TO my_postgres_user;

--
-- Name: profesores_id_seq; Type: SEQUENCE; Schema: universidad; Owner: my_postgres_user
--

CREATE SEQUENCE universidad.profesores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE universidad.profesores_id_seq OWNER TO my_postgres_user;

--
-- Name: profesores_id_seq; Type: SEQUENCE OWNED BY; Schema: universidad; Owner: my_postgres_user
--

ALTER SEQUENCE universidad.profesores_id_seq OWNED BY universidad.profesores.id;


--
-- Name: clientes id; Type: DEFAULT; Schema: banco; Owner: my_postgres_user
--

ALTER TABLE ONLY banco.clientes ALTER COLUMN id SET DEFAULT nextval('banco.clientes_id_seq'::regclass);


--
-- Name: transacciones id; Type: DEFAULT; Schema: banco; Owner: my_postgres_user
--

ALTER TABLE ONLY banco.transacciones ALTER COLUMN id SET DEFAULT nextval('banco.transacciones_id_seq'::regclass);


--
-- Name: lectores id; Type: DEFAULT; Schema: biblioteca; Owner: my_postgres_user
--

ALTER TABLE ONLY biblioteca.lectores ALTER COLUMN id SET DEFAULT nextval('biblioteca.lectores_id_seq'::regclass);


--
-- Name: libros id; Type: DEFAULT; Schema: biblioteca; Owner: my_postgres_user
--

ALTER TABLE ONLY biblioteca.libros ALTER COLUMN id SET DEFAULT nextval('biblioteca.libros_id_seq'::regclass);


--
-- Name: proveedores id; Type: DEFAULT; Schema: restaurante; Owner: my_postgres_user
--

ALTER TABLE ONLY restaurante.proveedores ALTER COLUMN id SET DEFAULT nextval('restaurante.proveedores_id_seq'::regclass);


--
-- Name: vehiculos id; Type: DEFAULT; Schema: restaurante; Owner: my_postgres_user
--

ALTER TABLE ONLY restaurante.vehiculos ALTER COLUMN id SET DEFAULT nextval('restaurante.vehiculos_id_seq'::regclass);


--
-- Name: actores id; Type: DEFAULT; Schema: teatro; Owner: my_postgres_user
--

ALTER TABLE ONLY teatro.actores ALTER COLUMN id SET DEFAULT nextval('teatro.actores_id_seq'::regclass);


--
-- Name: obras id; Type: DEFAULT; Schema: teatro; Owner: my_postgres_user
--

ALTER TABLE ONLY teatro.obras ALTER COLUMN id SET DEFAULT nextval('teatro.obras_id_seq'::regclass);


--
-- Name: estudiantes id; Type: DEFAULT; Schema: universidad; Owner: my_postgres_user
--

ALTER TABLE ONLY universidad.estudiantes ALTER COLUMN id SET DEFAULT nextval('universidad.estudiantes_id_seq'::regclass);


--
-- Name: profesores id; Type: DEFAULT; Schema: universidad; Owner: my_postgres_user
--

ALTER TABLE ONLY universidad.profesores ALTER COLUMN id SET DEFAULT nextval('universidad.profesores_id_seq'::regclass);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: banco; Owner: my_postgres_user
--

COPY banco.clientes (id, nombre, direccion, saldo) FROM stdin;
\.


--
-- Data for Name: transacciones; Type: TABLE DATA; Schema: banco; Owner: my_postgres_user
--

COPY banco.transacciones (id, fecha_hora, cliente_id, monto) FROM stdin;
\.


--
-- Data for Name: lectores; Type: TABLE DATA; Schema: biblioteca; Owner: my_postgres_user
--

COPY biblioteca.lectores (id, nombre, direccion) FROM stdin;
\.


--
-- Data for Name: libros; Type: TABLE DATA; Schema: biblioteca; Owner: my_postgres_user
--

COPY biblioteca.libros (id, titulo, autor, editorial) FROM stdin;
\.


--
-- Data for Name: proveedores; Type: TABLE DATA; Schema: restaurante; Owner: my_postgres_user
--

COPY restaurante.proveedores (id, name) FROM stdin;
\.


--
-- Data for Name: vehiculos; Type: TABLE DATA; Schema: restaurante; Owner: my_postgres_user
--

COPY restaurante.vehiculos (id, modelo, placas) FROM stdin;
\.


--
-- Data for Name: actores; Type: TABLE DATA; Schema: teatro; Owner: my_postgres_user
--

COPY teatro.actores (id, nombre, edad) FROM stdin;
\.


--
-- Data for Name: obras; Type: TABLE DATA; Schema: teatro; Owner: my_postgres_user
--

COPY teatro.obras (id, titulo, autor, fecha_estreno) FROM stdin;
\.


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: universidad; Owner: my_postgres_user
--

COPY universidad.estudiantes (id, nombre, carrera, fecha_ingreso) FROM stdin;
\.


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: universidad; Owner: my_postgres_user
--

COPY universidad.profesores (id, nombre, departamento) FROM stdin;
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: banco; Owner: my_postgres_user
--

SELECT pg_catalog.setval('banco.clientes_id_seq', 1, false);


--
-- Name: transacciones_id_seq; Type: SEQUENCE SET; Schema: banco; Owner: my_postgres_user
--

SELECT pg_catalog.setval('banco.transacciones_id_seq', 1, false);


--
-- Name: lectores_id_seq; Type: SEQUENCE SET; Schema: biblioteca; Owner: my_postgres_user
--

SELECT pg_catalog.setval('biblioteca.lectores_id_seq', 1, false);


--
-- Name: libros_id_seq; Type: SEQUENCE SET; Schema: biblioteca; Owner: my_postgres_user
--

SELECT pg_catalog.setval('biblioteca.libros_id_seq', 1, false);


--
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: restaurante; Owner: my_postgres_user
--

SELECT pg_catalog.setval('restaurante.proveedores_id_seq', 1, false);


--
-- Name: vehiculos_id_seq; Type: SEQUENCE SET; Schema: restaurante; Owner: my_postgres_user
--

SELECT pg_catalog.setval('restaurante.vehiculos_id_seq', 1, false);


--
-- Name: actores_id_seq; Type: SEQUENCE SET; Schema: teatro; Owner: my_postgres_user
--

SELECT pg_catalog.setval('teatro.actores_id_seq', 1, false);


--
-- Name: obras_id_seq; Type: SEQUENCE SET; Schema: teatro; Owner: my_postgres_user
--

SELECT pg_catalog.setval('teatro.obras_id_seq', 1, false);


--
-- Name: estudiantes_id_seq; Type: SEQUENCE SET; Schema: universidad; Owner: my_postgres_user
--

SELECT pg_catalog.setval('universidad.estudiantes_id_seq', 1, false);


--
-- Name: profesores_id_seq; Type: SEQUENCE SET; Schema: universidad; Owner: my_postgres_user
--

SELECT pg_catalog.setval('universidad.profesores_id_seq', 1, false);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: banco; Owner: my_postgres_user
--

ALTER TABLE ONLY banco.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: transacciones transacciones_pkey; Type: CONSTRAINT; Schema: banco; Owner: my_postgres_user
--

ALTER TABLE ONLY banco.transacciones
    ADD CONSTRAINT transacciones_pkey PRIMARY KEY (id);


--
-- Name: lectores lectores_pkey; Type: CONSTRAINT; Schema: biblioteca; Owner: my_postgres_user
--

ALTER TABLE ONLY biblioteca.lectores
    ADD CONSTRAINT lectores_pkey PRIMARY KEY (id);


--
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: biblioteca; Owner: my_postgres_user
--

ALTER TABLE ONLY biblioteca.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id);


--
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: restaurante; Owner: my_postgres_user
--

ALTER TABLE ONLY restaurante.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- Name: vehiculos vehiculos_pkey; Type: CONSTRAINT; Schema: restaurante; Owner: my_postgres_user
--

ALTER TABLE ONLY restaurante.vehiculos
    ADD CONSTRAINT vehiculos_pkey PRIMARY KEY (id);


--
-- Name: actores actores_pkey; Type: CONSTRAINT; Schema: teatro; Owner: my_postgres_user
--

ALTER TABLE ONLY teatro.actores
    ADD CONSTRAINT actores_pkey PRIMARY KEY (id);


--
-- Name: obras obras_pkey; Type: CONSTRAINT; Schema: teatro; Owner: my_postgres_user
--

ALTER TABLE ONLY teatro.obras
    ADD CONSTRAINT obras_pkey PRIMARY KEY (id);


--
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: universidad; Owner: my_postgres_user
--

ALTER TABLE ONLY universidad.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (id);


--
-- Name: profesores profesores_pkey; Type: CONSTRAINT; Schema: universidad; Owner: my_postgres_user
--

ALTER TABLE ONLY universidad.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (id);


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

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 15.4

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

