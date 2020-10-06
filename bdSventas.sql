--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bitacora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bitacora (
    id integer NOT NULL,
    tabla character varying(45) NOT NULL,
    id_registro integer NOT NULL,
    registro text NOT NULL,
    id_usuario integer NOT NULL,
    ip character varying(45) DEFAULT NULL::character varying,
    accion text NOT NULL,
    creates timestamp without time zone,
    updates timestamp without time zone
);


ALTER TABLE bitacora OWNER TO postgres;

--
-- Name: bitacora_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bitacora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bitacora_id_seq OWNER TO postgres;

--
-- Name: bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bitacora_id_seq OWNED BY bitacora.id;


--
-- Name: evento_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE evento_productos (
    id integer NOT NULL,
    id_evento integer NOT NULL,
    id_producto integer NOT NULL,
    precio double precision DEFAULT '0'::double precision,
    cantidad double precision DEFAULT '0'::double precision
);


ALTER TABLE evento_productos OWNER TO postgres;

--
-- Name: evento_productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE evento_productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evento_productos_id_seq OWNER TO postgres;

--
-- Name: evento_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE evento_productos_id_seq OWNED BY evento_productos.id;


--
-- Name: eventos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE eventos (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(250) NOT NULL,
    tipo_pago integer DEFAULT 0 NOT NULL,
    roles_usuario text,
    estatus integer DEFAULT 0 NOT NULL,
    fecha timestamp without time zone
);


ALTER TABLE eventos OWNER TO postgres;

--
-- Name: eventos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eventos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos_id_seq OWNER TO postgres;

--
-- Name: eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eventos_id_seq OWNED BY eventos.id;


--
-- Name: fos_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fos_user (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    username_canonical character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_canonical character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    salt character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    last_login timestamp without time zone,
    locked boolean NOT NULL,
    expired boolean NOT NULL,
    expires_at timestamp without time zone,
    confirmation_token character varying(255) DEFAULT NULL::character varying,
    password_requested_at timestamp without time zone,
    roles text NOT NULL,
    credentials_expired boolean NOT NULL,
    credentials_expire_at timestamp without time zone,
    user_father integer
);


ALTER TABLE fos_user OWNER TO postgres;

--
-- Name: fos_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fos_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fos_user_id_seq OWNER TO postgres;

--
-- Name: fos_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fos_user_id_seq OWNED BY fos_user.id;


--
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE personas (
    id integer NOT NULL,
    nacionalidad character(1) NOT NULL,
    cedula integer NOT NULL,
    primer_nombre character varying(45) NOT NULL,
    segundo_nombre character varying(45) DEFAULT NULL::character varying,
    primer_apellido character varying(45) NOT NULL,
    segundo_apellido character varying(45) DEFAULT NULL::character varying,
    tipo_personal integer DEFAULT 0,
    estatus integer NOT NULL,
    unidad_administrativa character varying(150),
    ubucacion_funcional character varying(255),
    descripcion_estatus_nomina character varying(255),
    codigo_nomina integer,
    nomina character varying(255),
    nomina_cestaticket integer
);


ALTER TABLE personas OWNER TO postgres;

--
-- Name: personas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas_id_seq OWNER TO postgres;

--
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personas_id_seq OWNED BY personas.id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE productos (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(250) NOT NULL,
    estatus integer DEFAULT 0 NOT NULL
);


ALTER TABLE productos OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos_id_seq OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE productos_id_seq OWNED BY productos.id;


--
-- Name: user_evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_evento (
    id integer NOT NULL,
    id_evento integer NOT NULL,
    id_user integer NOT NULL,
    roles character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE user_evento OWNER TO postgres;

--
-- Name: user_evento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_evento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_evento_id_seq OWNER TO postgres;

--
-- Name: user_evento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_evento_id_seq OWNED BY user_evento.id;


--
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ventas (
    id integer NOT NULL,
    id_personal integer NOT NULL,
    id_eventos integer NOT NULL,
    estatus integer DEFAULT 0 NOT NULL,
    fecha_modificacion timestamp without time zone,
    observacion text,
    monto1 double precision,
    monto2 double precision,
    monto3 double precision
);


ALTER TABLE ventas OWNER TO postgres;

--
-- Name: ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ventas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ventas_id_seq OWNER TO postgres;

--
-- Name: ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ventas_id_seq OWNED BY ventas.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora ALTER COLUMN id SET DEFAULT nextval('bitacora_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento_productos ALTER COLUMN id SET DEFAULT nextval('evento_productos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventos ALTER COLUMN id SET DEFAULT nextval('eventos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fos_user ALTER COLUMN id SET DEFAULT nextval('fos_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas ALTER COLUMN id SET DEFAULT nextval('personas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productos ALTER COLUMN id SET DEFAULT nextval('productos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_evento ALTER COLUMN id SET DEFAULT nextval('user_evento_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas ALTER COLUMN id SET DEFAULT nextval('ventas_id_seq'::regclass);


--
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bitacora (id, tabla, id_registro, registro, id_usuario, ip, accion, creates, updates) FROM stdin;
47	Productos	1	['id'=>'1','nombre'=>'harina de maiz','descripcion'=>'harina de maiz 1kg','estatus'=>'1']	1	127.0.0.1	EDITAR	2017-04-03 13:55:52	2017-04-03 13:55:52
48	Productos	1	['id'=>'1','nombre'=>'harina de maiz','descripcion'=>'harina de maiz 1kg','estatus'=>'1']	1	127.0.0.1	EDITAR	2017-04-04 15:38:26	2017-04-04 15:38:26
49	Personas	1	['id'=>'1','nacionalidad'=>'V','cedula'=>'19165397','primerNombre'=>'ysaias','segundoNombre'=>'alfonso','primerApellido'=>'perez','segundoApellido'=>'campos','tipoPersonal'=>'0','estatus'=>'1']	1	127.0.0.1	CREAR	2017-04-04 15:39:36	2017-04-04 15:39:36
50	Productos	2	['id'=>'2','nombre'=>'harina de maiz25','descripcion'=>'harina de maiz 1kg','estatus'=>'1']	2	127.0.0.1	EDITAR	2017-04-04 15:50:18	2017-04-04 15:50:18
51	Eventos	4	['id'=>'4','nombre'=>'venta de harina 2','descripcion'=>'venta de harina','tipoPago'=>'0','rolesUsuario'=>'ROLE_USER','estatus'=>'1','fecha'=>'2017-04-04 00:30:00.000000']	2	127.0.0.1	CREAR	2017-04-04 16:23:54	2017-04-04 16:23:54
52	Eventos	6	['id'=>'6','nombre'=>'venta de harina 4','descripcion'=>'venta de harina 4','tipoPago'=>'0','rolesUsuario'=>'ROLE_SUPER_ADMIN','estatus'=>'1','fecha'=>'2017-04-05 00:30:00.000000']	1	127.0.0.1	CREAR	2017-04-05 10:15:33	2017-04-05 10:15:33
53	EventoProductos	29	['id'=>'29','precio'=>'50','cantidad'=>'5','idEvento'=>'4','idProducto'=>'1']	1	127.0.0.1	CREAR	2017-04-05 10:15:38	2017-04-05 10:15:38
54	EventoProductos	30	['id'=>'30','precio'=>'250','cantidad'=>'1','idEvento'=>'5','idProducto'=>'1']	1	127.0.0.1	CREAR	2017-04-05 10:16:31	2017-04-05 10:16:31
55	Eventos	7	['id'=>'7','nombre'=>'venta de harina 5','descripcion'=>'venta de harina','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'1','fecha'=>'2017-04-07 00:30:00.000000']	5	127.0.0.1	CREAR	2017-04-07 09:12:06	2017-04-07 09:12:06
56	EventoProductos	31	['id'=>'31','precio'=>'200','cantidad'=>'52','idEvento'=>'7','idProducto'=>'1']	5	127.0.0.1	CREAR	2017-04-07 09:12:28	2017-04-07 09:12:28
57	Ventas	1	['id'=>'1','estatus'=>'0','fechaModificacion'=>'','idEventos'=>'7','idPersonal'=>'1']	5	127.0.0.1	EDITAR	2017-04-07 09:12:48	2017-04-07 09:12:48
58	UserEvento	1	['id'=>'1','roles'=>'ROLE_ADMIN','idEvento'=>'7','idUser'=>'5']	5	127.0.0.1	CREAR	2017-04-07 09:13:13	2017-04-07 09:13:13
59	UserEvento	2	['id'=>'2','roles'=>'ROLE_ADMIN','idEvento'=>'7','idUser'=>'6']	5	127.0.0.1	CREAR	2017-04-07 09:13:23	2017-04-07 09:13:23
61	Personas	527	['id'=>'527','nacionalidad'=>'V','cedula'=>'2026392','primerNombre'=>'LUIS','segundoNombre'=>'RAMON','primerApellido'=>'GONZALEZ','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'DEPARTAMENTO SERVICIOS GENERALES','ubucacionFuncional'=>'AREA DE SEGURIDAD','descripcionEstatusNomina'=>'activo','codigoNomina'=>'5006','nomina'=>'Bono de Alimentación del Personal Obrero Fijo de OPSU','nominaCestaticket'=>'1']	1	127.0.0.1	EDITAR	2017-04-20 10:41:56	2017-04-20 10:41:56
62	Personas	527	['id'=>'527','nacionalidad'=>'V','cedula'=>'2026392','primerNombre'=>'LUIS','segundoNombre'=>'RAMON','primerApellido'=>'GONZALEZ','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'DEPARTAMENTO SERVICIOS GENERALES','ubucacionFuncional'=>'AREA DE SEGURIDAD','descripcionEstatusNomina'=>'activo','codigoNomina'=>'5006','nomina'=>'Bono de Alimentación del Personal Obrero Fijo de OPSU','nominaCestaticket'=>'1']	1	127.0.0.1	EDITAR	2017-04-20 10:42:01	2017-04-20 10:42:01
63	UserEvento	3	['id'=>'3','roles'=>'ROLE_SUPER_ADMIN','idEvento'=>'6','idUser'=>'1']	1	127.0.0.1	CREAR	2017-04-20 11:18:32	2017-04-20 11:18:32
64	EventoProductos	32	['id'=>'32','precio'=>'1400','cantidad'=>'5','idEvento'=>'6','idProducto'=>'1']	1	127.0.0.1	CREAR	2017-04-20 11:19:55	2017-04-20 11:19:55
65	Eventos	8	['id'=>'8','nombre'=>'venta de harina 6','descripcion'=>'venta de harina','tipoPago'=>'0','rolesUsuario'=>'ROLE_SUPER_ADMIN','estatus'=>'1','fecha'=>'2017-04-21 00:30:00.000000']	1	127.0.0.1	CREAR	2017-04-21 08:53:52	2017-04-21 08:53:52
66	UserEvento	4	['id'=>'4','roles'=>'ROLE_SUPER_ADMIN','idEvento'=>'8','idUser'=>'1']	1	127.0.0.1	CREAR	2017-04-21 08:59:41	2017-04-21 08:59:41
67	Eventos	9	['id'=>'9','nombre'=>'SOL DE NAIGUATA','descripcion'=>'OPERATIVO DE PRUEBA','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'1','fecha'=>'2017-04-28 00:00:00.000000']	7	172.17.2.49	CREAR	2017-04-25 15:45:34	2017-04-25 15:45:34
68	UserEvento	5	['id'=>'5','roles'=>'ROLE_ADMIN','idEvento'=>'9','idUser'=>'9']	7	172.17.2.49	CREAR	2017-04-25 15:52:58	2017-04-25 15:52:58
69	UserEvento	6	['id'=>'6','roles'=>'ROLE_ADMIN','idEvento'=>'9','idUser'=>'8']	7	172.17.2.49	CREAR	2017-04-25 15:53:23	2017-04-25 15:53:23
70	Productos	3	['id'=>'3','nombre'=>'HARINA DE MAIZ SOL DE NAIGUATA','descripcion'=>'1 KILO','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-04-25 15:58:14	2017-04-25 15:58:14
71	Productos	3	['id'=>'3','nombre'=>'HARINA DE MAIZ SOL DE NAIGUATA','descripcion'=>'1 KILO','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-04-26 08:13:46	2017-04-26 08:13:46
72	Productos	4	['id'=>'4','nombre'=>'ARROZ AMARILLO SOL DE NAIGUATA','descripcion'=>'1 KILO','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-04-26 08:14:58	2017-04-26 08:14:58
73	Productos	5	['id'=>'5','nombre'=>'POLLO SOL DE NAIGUATA','descripcion'=>'1 KILO','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-04-26 08:15:39	2017-04-26 08:15:39
74	Productos	6	['id'=>'6','nombre'=>'CARNE SOL DE NAIGUATA','descripcion'=>'1 KILO','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-04-26 08:18:14	2017-04-26 08:18:14
75	Productos	7	['id'=>'7','nombre'=>'AZUCAR SOL DE NAIGUATA','descripcion'=>'BULTO','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-04-26 08:19:00	2017-04-26 08:19:00
76	Productos	8	['id'=>'8','nombre'=>'PASTA','descripcion'=>'500 GRAMOS','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-04-26 08:20:11	2017-04-26 08:20:11
77	EventoProductos	33	['id'=>'33','precio'=>'1200','cantidad'=>'5','idEvento'=>'9','idProducto'=>'3']	7	172.17.2.49	CREAR	2017-04-26 08:21:05	2017-04-26 08:21:05
78	EventoProductos	34	['id'=>'34','precio'=>'400','cantidad'=>'4','idEvento'=>'9','idProducto'=>'4']	7	172.17.2.49	CREAR	2017-04-26 08:21:41	2017-04-26 08:21:41
79	EventoProductos	35	['id'=>'35','precio'=>'600','cantidad'=>'4','idEvento'=>'9','idProducto'=>'5']	7	172.17.2.49	CREAR	2017-04-26 08:22:48	2017-04-26 08:22:48
80	EventoProductos	36	['id'=>'36','precio'=>'3000','cantidad'=>'5','idEvento'=>'9','idProducto'=>'6']	7	172.17.2.49	CREAR	2017-04-26 08:27:27	2017-04-26 08:27:27
81	EventoProductos	37	['id'=>'37','precio'=>'160','cantidad'=>'4','idEvento'=>'9','idProducto'=>'7']	7	172.17.2.49	CREAR	2017-04-26 08:28:05	2017-04-26 08:28:05
82	EventoProductos	38	['id'=>'38','precio'=>'200','cantidad'=>'3','idEvento'=>'9','idProducto'=>'8']	7	172.17.2.49	CREAR	2017-04-26 08:28:37	2017-04-26 08:28:37
83	Productos	6	['id'=>'6','nombre'=>'CARNE SOL DE NAIGUATA','descripcion'=>'1 KILO','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-05-09 10:26:19	2017-05-09 10:26:19
84	EventoProductos	40	['id'=>'40','precio'=>'5000','cantidad'=>'4','idEvento'=>'7','idProducto'=>'6']	7	172.17.2.49	CREAR	2017-05-09 10:27:25	2017-05-09 10:27:25
85	UserEvento	7	['id'=>'7','roles'=>'ROLE_ADMIN','idEvento'=>'9','idUser'=>'7']	7	172.17.19.77	CREAR	2017-07-07 14:38:48	2017-07-07 14:38:48
86	Eventos	10	['id'=>'10','nombre'=>'venta de harina 7','descripcion'=>'venta de harina 7','tipoPago'=>'0','rolesUsuario'=>'ROLE_SUPER_ADMIN','estatus'=>'1','fecha'=>'2017-07-10 00:30:00.000000']	1	127.0.0.1	CREAR	2017-07-10 09:45:14	2017-07-10 09:45:14
87	EventoProductos	41	['id'=>'41','precio'=>'150','cantidad'=>'4','idEvento'=>'10','idProducto'=>'1']	1	127.0.0.1	CREAR	2017-07-10 09:45:45	2017-07-10 09:45:45
88	UserEvento	8	['id'=>'8','roles'=>'ROLE_SUPER_ADMIN','idEvento'=>'10','idUser'=>'1']	1	127.0.0.1	CREAR	2017-07-10 09:46:37	2017-07-10 09:46:37
89	Eventos	11	['id'=>'11','nombre'=>'CAFE VENEZUELA','descripcion'=>'Operativo Café Venezuela','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'1','fecha'=>'2017-07-14 00:00:00.000000']	7	172.17.2.49	CREAR	2017-07-10 10:00:02	2017-07-10 10:00:02
90	UserEvento	9	['id'=>'9','roles'=>'ROLE_ADMIN','idEvento'=>'11','idUser'=>'7']	7	172.17.2.49	CREAR	2017-07-10 10:02:48	2017-07-10 10:02:48
91	Productos	9	['id'=>'9','nombre'=>'CAFE VENEZUELA','descripcion'=>'1 KILO','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-07-10 10:08:13	2017-07-10 10:08:13
92	Eventos	9	['id'=>'9','nombre'=>'SOL DE NAIGUATA','descripcion'=>'OPERATIVO DE PRUEBA','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'2','fecha'=>'2017-04-28 00:00:00.000000']	7	172.17.2.49	ELIMINAR	2017-07-10 16:01:26	2017-07-10 16:01:26
93	Personas	672	['id'=>'672','nacionalidad'=>'V','cedula'=>'4731864','primerNombre'=>'MIGUEL','segundoNombre'=>'','primerApellido'=>'SIRA','segundoApellido'=>'','tipoPersonal'=>'3','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-13 16:12:23	2017-07-13 16:12:23
94	Personas	672	['id'=>'672','nacionalidad'=>'V','cedula'=>'4731864','primerNombre'=>'MIGUEL','segundoNombre'=>'','primerApellido'=>'SIRA','segundoApellido'=>'','tipoPersonal'=>'3','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-13 16:14:16	2017-07-13 16:14:16
95	Ventas	4743	['id'=>'4743','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'672']	7	172.17.2.49	EDITAR	2017-07-13 16:16:26	2017-07-13 16:16:26
96	Personas	673	['id'=>'673','nacionalidad'=>'V','cedula'=>'6302890','primerNombre'=>'MARILU','segundoNombre'=>'','primerApellido'=>'BASTIDAS','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-13 16:18:17	2017-07-13 16:18:17
97	Ventas	4744	['id'=>'4744','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'673']	7	172.17.2.49	EDITAR	2017-07-13 16:20:11	2017-07-13 16:20:11
98	Personas	674	['id'=>'674','nacionalidad'=>'V','cedula'=>'6548995','primerNombre'=>'YANIRA','segundoNombre'=>'DEL CARMEN','primerApellido'=>'ESCALONA','segundoApellido'=>'GUEVARA','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-13 16:21:57	2017-07-13 16:21:57
99	Ventas	4745	['id'=>'4745','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'674']	7	172.17.2.49	EDITAR	2017-07-13 16:22:34	2017-07-13 16:22:34
100	Personas	675	['id'=>'675','nacionalidad'=>'V','cedula'=>'7595388','primerNombre'=>'ARGENIS','segundoNombre'=>'','primerApellido'=>'MONTAÑEZ','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-13 16:25:32	2017-07-13 16:25:32
101	Ventas	4746	['id'=>'4746','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'675']	7	172.17.2.49	EDITAR	2017-07-13 16:25:56	2017-07-13 16:25:56
102	Personas	676	['id'=>'676','nacionalidad'=>'V','cedula'=>'7953962','primerNombre'=>'JOSE','segundoNombre'=>'','primerApellido'=>'RAMIREZ','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-13 16:28:00	2017-07-13 16:28:00
103	Ventas	4747	['id'=>'4747','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'676']	7	172.17.2.49	EDITAR	2017-07-13 16:28:26	2017-07-13 16:28:26
104	Personas	677	['id'=>'677','nacionalidad'=>'V','cedula'=>'9062425','primerNombre'=>'ERICK','segundoNombre'=>'','primerApellido'=>'SERRANO','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-13 16:31:04	2017-07-13 16:31:04
105	Personas	678	['id'=>'678','nacionalidad'=>'V','cedula'=>'25235457','primerNombre'=>'CARLOS','segundoNombre'=>'','primerApellido'=>'PEREZ','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 08:48:06	2017-07-17 08:48:06
106	Ventas	4748	['id'=>'4748','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'678']	7	172.17.2.49	EDITAR	2017-07-17 08:52:01	2017-07-17 08:52:01
107	Personas	679	['id'=>'679','nacionalidad'=>'V','cedula'=>'18130527','primerNombre'=>'RAUL','segundoNombre'=>'','primerApellido'=>'GONZALEZ','segundoApellido'=>'','tipoPersonal'=>'3','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 08:54:57	2017-07-17 08:54:57
108	Personas	679	['id'=>'679','nacionalidad'=>'V','cedula'=>'18130527','primerNombre'=>'RAUL','segundoNombre'=>'','primerApellido'=>'GONZALEZ','segundoApellido'=>'','tipoPersonal'=>'3','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 09:01:13	2017-07-17 09:01:13
109	Personas	679	['id'=>'679','nacionalidad'=>'V','cedula'=>'18130527','primerNombre'=>'RAUL','segundoNombre'=>'','primerApellido'=>'GONZALEZ','segundoApellido'=>'','tipoPersonal'=>'3','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 09:12:55	2017-07-17 09:12:55
110	Personas	679	['id'=>'679','nacionalidad'=>'V','cedula'=>'18130527','primerNombre'=>'RAUL','segundoNombre'=>'','primerApellido'=>'GONZALEZ','segundoApellido'=>'','tipoPersonal'=>'3','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 09:27:35	2017-07-17 09:27:35
111	Personas	679	['id'=>'679','nacionalidad'=>'V','cedula'=>'18130527','primerNombre'=>'ADALBERTO','segundoNombre'=>'','primerApellido'=>'LAYA','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	EDITAR	2017-07-17 09:28:05	2017-07-17 09:28:05
112	Ventas	4749	['id'=>'4749','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'679']	7	172.17.2.49	EDITAR	2017-07-17 09:28:38	2017-07-17 09:28:38
113	Personas	468	['id'=>'468','nacionalidad'=>'V','cedula'=>'17964891','primerNombre'=>'JUNIOR','segundoNombre'=>'EDUARDO','primerApellido'=>'PEREZ','segundoApellido'=>'GONZALEZ','tipoPersonal'=>'3','estatus'=>'1','unidadAdministrativa'=>'DEPARTAMENTO SERVICIOS GENERALES','ubucacionFuncional'=>'AREA DE SEGURIDAD','descripcionEstatusNomina'=>'activo','codigoNomina'=>'6','nomina'=>'Obrero Fijo OPSU','nominaCestaticket'=>'0']	7	172.17.2.49	CREAR	2017-07-17 09:32:35	2017-07-17 09:32:35
114	Personas	111	['id'=>'111','nacionalidad'=>'V','cedula'=>'11413779','primerNombre'=>'GERSON','segundoNombre'=>'DAVID','primerApellido'=>'VIZQUEL','segundoApellido'=>'ALEMAN','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'UNIDAD DE PROCESAMIENTO DE DATOS','ubucacionFuncional'=>'DEPARTAMENTO DE PROYECTOS','descripcionEstatusNomina'=>'activo','codigoNomina'=>'1','nomina'=>'Fijo Administrativo y Profesional OPSU','nominaCestaticket'=>'0']	7	172.17.2.49	CREAR	2017-07-17 09:41:13	2017-07-17 09:41:13
115	Personas	680	['id'=>'680','nacionalidad'=>'V','cedula'=>'9062426','primerNombre'=>'ERICK','segundoNombre'=>'','primerApellido'=>'SERRANO','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 09:46:20	2017-07-17 09:46:20
116	Ventas	4760	['id'=>'4760','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'677']	7	172.17.2.49	EDITAR	2017-07-17 09:53:01	2017-07-17 09:53:01
117	Ventas	4761	['id'=>'4761','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'677']	7	172.17.2.49	EDITAR	2017-07-17 09:53:42	2017-07-17 09:53:42
118	Ventas	4762	['id'=>'4762','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'677']	7	172.17.2.49	EDITAR	2017-07-17 09:54:41	2017-07-17 09:54:41
119	Ventas	4763	['id'=>'4763','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'680']	7	172.17.2.49	EDITAR	2017-07-17 09:58:31	2017-07-17 09:58:31
120	Personas	681	['id'=>'681','nacionalidad'=>'V','cedula'=>'10140758','primerNombre'=>'JOSE','segundoNombre'=>'','primerApellido'=>'QUINTERO','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:03:18	2017-07-17 10:03:18
121	Ventas	4764	['id'=>'4764','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'681']	7	172.17.2.49	EDITAR	2017-07-17 10:03:50	2017-07-17 10:03:50
122	Personas	682	['id'=>'682','nacionalidad'=>'V','cedula'=>'10401183','primerNombre'=>'ANA MARIA','segundoNombre'=>'','primerApellido'=>'BRICEÑO','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:09:40	2017-07-17 10:09:40
123	Ventas	4765	['id'=>'4765','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'682']	7	172.17.2.49	EDITAR	2017-07-17 10:10:18	2017-07-17 10:10:18
124	Personas	683	['id'=>'683','nacionalidad'=>'V','cedula'=>'10799718','primerNombre'=>'ERIKA','segundoNombre'=>'','primerApellido'=>'BRICEÑO','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:14:25	2017-07-17 10:14:25
125	Ventas	4766	['id'=>'4766','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'683']	7	172.17.2.49	EDITAR	2017-07-17 10:15:01	2017-07-17 10:15:01
126	Personas	684	['id'=>'684','nacionalidad'=>'V','cedula'=>'11604037','primerNombre'=>'JOSE','segundoNombre'=>'','primerApellido'=>'LABRADOR','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:19:32	2017-07-17 10:19:32
127	Ventas	4767	['id'=>'4767','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'684']	7	172.17.2.49	EDITAR	2017-07-17 10:20:14	2017-07-17 10:20:14
128	Personas	685	['id'=>'685','nacionalidad'=>'V','cedula'=>'11644594','primerNombre'=>'DOUGLAS','segundoNombre'=>'','primerApellido'=>'GIL','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:25:07	2017-07-17 10:25:07
129	Ventas	4768	['id'=>'4768','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'685']	7	172.17.2.49	EDITAR	2017-07-17 10:25:44	2017-07-17 10:25:44
130	Personas	686	['id'=>'686','nacionalidad'=>'V','cedula'=>'11682477','primerNombre'=>'YAZNEL','segundoNombre'=>'','primerApellido'=>'MONTOYA','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:31:20	2017-07-17 10:31:20
131	Ventas	4769	['id'=>'4769','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'686']	7	172.17.2.49	EDITAR	2017-07-17 10:32:00	2017-07-17 10:32:00
132	Personas	687	['id'=>'687','nacionalidad'=>'V','cedula'=>'11820231','primerNombre'=>'YADIRA','segundoNombre'=>'','primerApellido'=>'VIÑA','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:34:43	2017-07-17 10:34:43
133	Ventas	4770	['id'=>'4770','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'687']	7	172.17.2.49	EDITAR	2017-07-17 10:35:16	2017-07-17 10:35:16
134	Personas	688	['id'=>'688','nacionalidad'=>'V','cedula'=>'12090450','primerNombre'=>'FRANCAR','segundoNombre'=>'','primerApellido'=>'MARTINEZ','segundoApellido'=>'','tipoPersonal'=>'9','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:41:18	2017-07-17 10:41:18
135	Ventas	4771	['id'=>'4771','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'688']	7	172.17.2.49	EDITAR	2017-07-17 10:41:46	2017-07-17 10:41:46
184	Ventas	4796	['id'=>'4796','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'712']	7	172.17.2.49	EDITAR	2017-07-17 13:59:48	2017-07-17 13:59:48
136	Personas	689	['id'=>'689','nacionalidad'=>'V','cedula'=>'12663011','primerNombre'=>'JESUS','segundoNombre'=>'','primerApellido'=>'RIVAS','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:48:37	2017-07-17 10:48:37
137	Ventas	4772	['id'=>'4772','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'689']	7	172.17.2.49	EDITAR	2017-07-17 10:49:09	2017-07-17 10:49:09
138	Personas	690	['id'=>'690','nacionalidad'=>'V','cedula'=>'12687863','primerNombre'=>'FRANKLIN','segundoNombre'=>'','primerApellido'=>'OLIVEROS','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:52:08	2017-07-17 10:52:08
139	Ventas	4773	['id'=>'4773','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'690']	7	172.17.2.49	EDITAR	2017-07-17 10:52:38	2017-07-17 10:52:38
140	Personas	691	['id'=>'691','nacionalidad'=>'V','cedula'=>'12828656','primerNombre'=>'YEN','segundoNombre'=>'','primerApellido'=>'MARTINEZ','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:55:14	2017-07-17 10:55:14
141	Ventas	4774	['id'=>'4774','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'691']	7	172.17.2.49	EDITAR	2017-07-17 10:55:41	2017-07-17 10:55:41
142	Personas	692	['id'=>'692','nacionalidad'=>'V','cedula'=>'13034387','primerNombre'=>'ROSIBEL','segundoNombre'=>'','primerApellido'=>'AZUAJE','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 10:58:49	2017-07-17 10:58:49
143	Ventas	4775	['id'=>'4775','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'692']	7	172.17.2.49	EDITAR	2017-07-17 10:59:20	2017-07-17 10:59:20
144	Personas	693	['id'=>'693','nacionalidad'=>'V','cedula'=>'13136823','primerNombre'=>'FELIX','segundoNombre'=>'','primerApellido'=>'RODRIGUEZ','segundoApellido'=>'','tipoPersonal'=>'8','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:02:11	2017-07-17 11:02:11
145	Ventas	4776	['id'=>'4776','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'693']	7	172.17.2.49	EDITAR	2017-07-17 11:02:45	2017-07-17 11:02:45
146	Personas	694	['id'=>'694','nacionalidad'=>'V','cedula'=>'13246076','primerNombre'=>'PATRICIA','segundoNombre'=>'','primerApellido'=>'FLORIS','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:05:51	2017-07-17 11:05:51
147	Ventas	4777	['id'=>'4777','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'694']	7	172.17.2.49	EDITAR	2017-07-17 11:06:21	2017-07-17 11:06:21
148	Personas	695	['id'=>'695','nacionalidad'=>'V','cedula'=>'13845684','primerNombre'=>'JUAN CARLOS','segundoNombre'=>'','primerApellido'=>'CARREÑO','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:10:47	2017-07-17 11:10:47
149	Ventas	4778	['id'=>'4778','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'695']	7	172.17.2.49	EDITAR	2017-07-17 11:11:55	2017-07-17 11:11:55
150	Personas	696	['id'=>'696','nacionalidad'=>'V','cedula'=>'14050077','primerNombre'=>'FELIX','segundoNombre'=>'','primerApellido'=>'BRACAMONTE','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:14:48	2017-07-17 11:14:48
151	Ventas	4779	['id'=>'4779','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'696']	7	172.17.2.49	EDITAR	2017-07-17 11:15:17	2017-07-17 11:15:17
152	Personas	697	['id'=>'697','nacionalidad'=>'V','cedula'=>'14287264','primerNombre'=>'EDWARD','segundoNombre'=>'','primerApellido'=>'BLANCO','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:17:29	2017-07-17 11:17:29
153	Ventas	4780	['id'=>'4780','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'697']	7	172.17.2.49	EDITAR	2017-07-17 11:17:53	2017-07-17 11:17:53
154	Personas	698	['id'=>'698','nacionalidad'=>'V','cedula'=>'14494559','primerNombre'=>'JHOVERLYN','segundoNombre'=>'','primerApellido'=>'CASTILLO','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:20:51	2017-07-17 11:20:51
155	Ventas	4781	['id'=>'4781','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'698']	7	172.17.2.49	EDITAR	2017-07-17 11:21:20	2017-07-17 11:21:20
156	Personas	699	['id'=>'699','nacionalidad'=>'V','cedula'=>'14680732','primerNombre'=>'LEIBER','segundoNombre'=>'','primerApellido'=>'GONZALEZ','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:23:51	2017-07-17 11:23:51
157	Ventas	4782	['id'=>'4782','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'699']	7	172.17.2.49	EDITAR	2017-07-17 11:24:13	2017-07-17 11:24:13
158	Personas	700	['id'=>'700','nacionalidad'=>'V','cedula'=>'15132410','primerNombre'=>'MEYBIS','segundoNombre'=>'','primerApellido'=>'RINCONES','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:26:20	2017-07-17 11:26:20
159	Ventas	4783	['id'=>'4783','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'700']	7	172.17.2.49	EDITAR	2017-07-17 11:26:45	2017-07-17 11:26:45
281	EventoProductos	42	['id'=>'42','precio'=>'10500','cantidad'=>'2','idEvento'=>'12','idProducto'=>'10']	7	172.17.2.49	CREAR	2017-07-31 15:15:56	2017-07-31 15:15:56
160	Personas	701	['id'=>'701','nacionalidad'=>'V','cedula'=>'15325927','primerNombre'=>'MOISES','segundoNombre'=>'','primerApellido'=>'DUPUY','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:29:09	2017-07-17 11:29:09
161	Ventas	4784	['id'=>'4784','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'701']	7	172.17.2.49	EDITAR	2017-07-17 11:29:39	2017-07-17 11:29:39
162	Personas	702	['id'=>'702','nacionalidad'=>'V','cedula'=>'15403493','primerNombre'=>'ALEXIS','segundoNombre'=>'','primerApellido'=>'GONZALEZ','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:31:57	2017-07-17 11:31:57
163	Ventas	4785	['id'=>'4785','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'702']	7	172.17.2.49	EDITAR	2017-07-17 11:32:20	2017-07-17 11:32:20
164	Personas	703	['id'=>'703','nacionalidad'=>'V','cedula'=>'15712796','primerNombre'=>'HECTOR','segundoNombre'=>'','primerApellido'=>'POLI','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:34:37	2017-07-17 11:34:37
165	Ventas	4786	['id'=>'4786','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'703']	7	172.17.2.49	EDITAR	2017-07-17 11:35:02	2017-07-17 11:35:02
166	Personas	704	['id'=>'704','nacionalidad'=>'V','cedula'=>'15713956','primerNombre'=>'JESUS','segundoNombre'=>'','primerApellido'=>'ROJAS','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:37:13	2017-07-17 11:37:13
167	Ventas	4787	['id'=>'4787','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'704']	7	172.17.2.49	EDITAR	2017-07-17 11:37:35	2017-07-17 11:37:35
168	Personas	705	['id'=>'705','nacionalidad'=>'V','cedula'=>'15827217','primerNombre'=>'EDUARDO','segundoNombre'=>'','primerApellido'=>'MENDOZA','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:39:56	2017-07-17 11:39:56
169	Ventas	4788	['id'=>'4788','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'705']	7	172.17.2.49	EDITAR	2017-07-17 11:40:32	2017-07-17 11:40:32
170	Personas	706	['id'=>'706','nacionalidad'=>'V','cedula'=>'16217295','primerNombre'=>'DANIEL','segundoNombre'=>'','primerApellido'=>'BORRERO','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:43:13	2017-07-17 11:43:13
171	Ventas	4789	['id'=>'4789','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'706']	7	172.17.2.49	EDITAR	2017-07-17 11:43:32	2017-07-17 11:43:32
172	Personas	707	['id'=>'707','nacionalidad'=>'V','cedula'=>'16472023','primerNombre'=>'GERMAN','segundoNombre'=>'','primerApellido'=>'QUINTERO','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:47:49	2017-07-17 11:47:49
173	Ventas	4790	['id'=>'4790','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'707']	7	172.17.2.49	EDITAR	2017-07-17 11:48:14	2017-07-17 11:48:14
174	Personas	708	['id'=>'708','nacionalidad'=>'V','cedula'=>'16356506','primerNombre'=>'AURIMAR','segundoNombre'=>'','primerApellido'=>'PALENCIA','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:51:13	2017-07-17 11:51:13
175	Ventas	4791	['id'=>'4791','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'708']	7	172.17.2.49	EDITAR	2017-07-17 11:51:36	2017-07-17 11:51:36
176	Personas	709	['id'=>'709','nacionalidad'=>'V','cedula'=>'16555331','primerNombre'=>'EDIXON','segundoNombre'=>'','primerApellido'=>'MORENO','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 11:57:36	2017-07-17 11:57:36
177	Ventas	4792	['id'=>'4792','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'709']	7	172.17.2.49	EDITAR	2017-07-17 11:58:28	2017-07-17 11:58:28
178	Personas	710	['id'=>'710','nacionalidad'=>'V','cedula'=>'16822284','primerNombre'=>'LINMAR','segundoNombre'=>'','primerApellido'=>'OVIEDO','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 13:44:23	2017-07-17 13:44:23
179	Ventas	4793	['id'=>'4793','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'710']	7	172.17.2.49	EDITAR	2017-07-17 13:44:46	2017-07-17 13:44:46
180	Personas	711	['id'=>'711','nacionalidad'=>'V','cedula'=>'16882473','primerNombre'=>'HECSOR','segundoNombre'=>'','primerApellido'=>'BARAZARTE','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 13:47:17	2017-07-17 13:47:17
181	Ventas	4794	['id'=>'4794','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'711']	7	172.17.2.49	EDITAR	2017-07-17 13:49:14	2017-07-17 13:49:14
182	Personas	380	['id'=>'380','nacionalidad'=>'V','cedula'=>'16904877','primerNombre'=>'ROSANA','segundoNombre'=>'MARIA','primerApellido'=>'BARRIOS','segundoApellido'=>'GOMEZ','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'DEPARTAMENTO DE FINANZAS','ubucacionFuncional'=>'TESORERIA','descripcionEstatusNomina'=>'activo','codigoNomina'=>'2','nomina'=>'Personal Contratado Administrativo OPSU','nominaCestaticket'=>'0']	7	172.17.2.49	CREAR	2017-07-17 13:52:47	2017-07-17 13:52:47
183	Personas	712	['id'=>'712','nacionalidad'=>'V','cedula'=>'17266578','primerNombre'=>'NELMAR','segundoNombre'=>'','primerApellido'=>'MEZA','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 13:59:21	2017-07-17 13:59:21
185	Personas	712	['id'=>'712','nacionalidad'=>'V','cedula'=>'17266678','primerNombre'=>'NELMAR','segundoNombre'=>'','primerApellido'=>'MEZA','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	EDITAR	2017-07-17 14:16:10	2017-07-17 14:16:10
186	Personas	713	['id'=>'713','nacionalidad'=>'V','cedula'=>'17957174','primerNombre'=>'FRANKLIN','segundoNombre'=>'','primerApellido'=>'ALCALA','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 14:33:05	2017-07-17 14:33:05
187	Ventas	4799	['id'=>'4799','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'713']	7	172.17.2.49	EDITAR	2017-07-17 14:33:31	2017-07-17 14:33:31
188	Personas	714	['id'=>'714','nacionalidad'=>'V','cedula'=>'18038561','primerNombre'=>'EDDISON','segundoNombre'=>'','primerApellido'=>'SERRANO','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 14:37:40	2017-07-17 14:37:40
189	Ventas	4800	['id'=>'4800','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'714']	7	172.17.2.49	EDITAR	2017-07-17 14:38:08	2017-07-17 14:38:08
190	Personas	715	['id'=>'715','nacionalidad'=>'V','cedula'=>'18446490','primerNombre'=>'ALYAN','segundoNombre'=>'','primerApellido'=>'GONZALEZ','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 14:41:26	2017-07-17 14:41:26
191	Ventas	4801	['id'=>'4801','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'715']	7	172.17.2.49	EDITAR	2017-07-17 14:41:50	2017-07-17 14:41:50
192	Personas	716	['id'=>'716','nacionalidad'=>'V','cedula'=>'18813109','primerNombre'=>'DAILY','segundoNombre'=>'','primerApellido'=>'MORFFE','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 14:45:12	2017-07-17 14:45:12
193	Ventas	4802	['id'=>'4802','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'716']	7	172.17.2.49	EDITAR	2017-07-17 14:45:40	2017-07-17 14:45:40
194	Personas	717	['id'=>'717','nacionalidad'=>'V','cedula'=>'19064753','primerNombre'=>'FRANKLIN','segundoNombre'=>'','primerApellido'=>'ZORRILLA','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 14:48:26	2017-07-17 14:48:26
195	Ventas	4803	['id'=>'4803','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'717']	7	172.17.2.49	EDITAR	2017-07-17 14:49:08	2017-07-17 14:49:08
196	Personas	718	['id'=>'718','nacionalidad'=>'V','cedula'=>'19672910','primerNombre'=>'JUAN','segundoNombre'=>'','primerApellido'=>'VARGAS','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 14:51:30	2017-07-17 14:51:30
197	Ventas	4804	['id'=>'4804','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'718']	7	172.17.2.49	EDITAR	2017-07-17 14:52:04	2017-07-17 14:52:04
198	Personas	719	['id'=>'719','nacionalidad'=>'V','cedula'=>'19711940','primerNombre'=>'ANYORFER','segundoNombre'=>'','primerApellido'=>'MUÑOZ','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 14:54:38	2017-07-17 14:54:38
199	Ventas	4805	['id'=>'4805','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'719']	7	172.17.2.49	EDITAR	2017-07-17 14:55:16	2017-07-17 14:55:16
200	Personas	719	['id'=>'719','nacionalidad'=>'V','cedula'=>'19711940','primerNombre'=>'ANYORFER','segundoNombre'=>'','primerApellido'=>'MUÑOZ','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	EDITAR	2017-07-17 15:02:30	2017-07-17 15:02:30
201	Personas	719	['id'=>'719','nacionalidad'=>'V','cedula'=>'19711940','primerNombre'=>'ANYOFER','segundoNombre'=>'','primerApellido'=>'MUÑOZ','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	EDITAR	2017-07-17 15:02:46	2017-07-17 15:02:46
202	Personas	720	['id'=>'720','nacionalidad'=>'V','cedula'=>'20391151','primerNombre'=>'JOSE','segundoNombre'=>'DAVID','primerApellido'=>'MILAN','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 15:05:15	2017-07-17 15:05:15
203	Ventas	4808	['id'=>'4808','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'720']	7	172.17.2.49	EDITAR	2017-07-17 15:05:52	2017-07-17 15:05:52
204	Personas	721	['id'=>'721','nacionalidad'=>'V','cedula'=>'20871664','primerNombre'=>'AQUILES','segundoNombre'=>'','primerApellido'=>'POLO','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 15:07:23	2017-07-17 15:07:23
205	Ventas	4809	['id'=>'4809','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'721']	7	172.17.2.49	EDITAR	2017-07-17 15:07:50	2017-07-17 15:07:50
206	Personas	722	['id'=>'722','nacionalidad'=>'V','cedula'=>'22666134','primerNombre'=>'BARBARA','segundoNombre'=>'','primerApellido'=>'MARIN','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 15:09:41	2017-07-17 15:09:41
207	Ventas	4810	['id'=>'4810','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'722']	7	172.17.2.49	EDITAR	2017-07-17 15:10:12	2017-07-17 15:10:12
282	EventoProductos	43	['id'=>'43','precio'=>'10500','cantidad'=>'2','idEvento'=>'12','idProducto'=>'11']	7	172.17.2.49	CREAR	2017-07-31 15:16:30	2017-07-31 15:16:30
208	Personas	723	['id'=>'723','nacionalidad'=>'V','cedula'=>'20171157','primerNombre'=>'FERKELIN','segundoNombre'=>'','primerApellido'=>'REYES','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 15:12:19	2017-07-17 15:12:19
209	Ventas	4811	['id'=>'4811','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'723']	7	172.17.2.49	EDITAR	2017-07-17 15:12:56	2017-07-17 15:12:56
210	Personas	724	['id'=>'724','nacionalidad'=>'V','cedula'=>'22785399','primerNombre'=>'JOSNEL','segundoNombre'=>'','primerApellido'=>'AQUINO','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 15:15:02	2017-07-17 15:15:02
211	Ventas	4812	['id'=>'4812','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'724']	7	172.17.2.49	EDITAR	2017-07-17 15:16:02	2017-07-17 15:16:02
212	Personas	725	['id'=>'725','nacionalidad'=>'V','cedula'=>'82024842','primerNombre'=>'RUI','segundoNombre'=>'','primerApellido'=>'JAQUES','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-17 15:19:14	2017-07-17 15:19:14
213	Ventas	4813	['id'=>'4813','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'725']	7	172.17.2.49	EDITAR	2017-07-17 15:20:13	2017-07-17 15:20:13
214	Personas	677	['id'=>'677','nacionalidad'=>'V','cedula'=>'9062425','primerNombre'=>'ERICK','segundoNombre'=>'','primerApellido'=>'SERRANO','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'2','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	ELIMINAR	2017-07-17 16:00:22	2017-07-17 16:00:22
215	Personas	450	['id'=>'450','nacionalidad'=>'V','cedula'=>'13176194','primerNombre'=>'DOUGLAS','segundoNombre'=>'LUIS','primerApellido'=>'HERRERA','segundoApellido'=>'GUANIPA','tipoPersonal'=>'3','estatus'=>'1','unidadAdministrativa'=>'DEPARTAMENTO SERVICIOS GENERALES','ubucacionFuncional'=>'AREA DE SEGURIDAD','descripcionEstatusNomina'=>'activo','codigoNomina'=>'6','nomina'=>'Obrero Fijo OPSU','nominaCestaticket'=>'0']	7	172.17.2.49	CREAR	2017-07-18 11:02:48	2017-07-18 11:02:48
216	Personas	726	['id'=>'726','nacionalidad'=>'V','cedula'=>'10663593','primerNombre'=>'ANGIE','segundoNombre'=>'','primerApellido'=>'RUMBOS','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 13:41:05	2017-07-18 13:41:05
217	Ventas	4815	['id'=>'4815','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'726']	7	172.17.2.49	EDITAR	2017-07-18 13:41:29	2017-07-18 13:41:29
218	Personas	727	['id'=>'727','nacionalidad'=>'V','cedula'=>'6121337','primerNombre'=>'JUAN','segundoNombre'=>'','primerApellido'=>'COLMENARES','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 15:50:09	2017-07-18 15:50:09
219	Ventas	4816	['id'=>'4816','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'727']	7	172.17.2.49	EDITAR	2017-07-18 15:50:46	2017-07-18 15:50:46
220	Personas	727	['id'=>'727','nacionalidad'=>'V','cedula'=>'6121337','primerNombre'=>'JUAN','segundoNombre'=>'','primerApellido'=>'BRICEÑO','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	EDITAR	2017-07-18 15:55:01	2017-07-18 15:55:01
221	Personas	728	['id'=>'728','nacionalidad'=>'V','cedula'=>'6309100','primerNombre'=>'JUAN','segundoNombre'=>'','primerApellido'=>'COLMENARES','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 15:58:05	2017-07-18 15:58:05
222	Ventas	4818	['id'=>'4818','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'728']	7	172.17.2.49	EDITAR	2017-07-18 15:58:32	2017-07-18 15:58:32
223	Personas	729	['id'=>'729','nacionalidad'=>'V','cedula'=>'6516050','primerNombre'=>'MORELLA','segundoNombre'=>'','primerApellido'=>'ROMERO','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:00:22	2017-07-18 16:00:22
224	Ventas	4819	['id'=>'4819','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'729']	7	172.17.2.49	EDITAR	2017-07-18 16:00:48	2017-07-18 16:00:48
225	Personas	730	['id'=>'730','nacionalidad'=>'V','cedula'=>'11350768','primerNombre'=>'RONALD','segundoNombre'=>'','primerApellido'=>'FARFAN','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:02:32	2017-07-18 16:02:32
226	Ventas	4820	['id'=>'4820','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'730']	7	172.17.2.49	EDITAR	2017-07-18 16:03:28	2017-07-18 16:03:28
227	Personas	731	['id'=>'731','nacionalidad'=>'V','cedula'=>'12094430','primerNombre'=>'JORGE','segundoNombre'=>'','primerApellido'=>'RAMIREZ','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:04:59	2017-07-18 16:04:59
228	Ventas	4821	['id'=>'4821','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'731']	7	172.17.2.49	EDITAR	2017-07-18 16:05:38	2017-07-18 16:05:38
229	Personas	732	['id'=>'732','nacionalidad'=>'V','cedula'=>'12834054','primerNombre'=>'ANGELICA','segundoNombre'=>'','primerApellido'=>'LOPEZ','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:07:03	2017-07-18 16:07:03
230	Ventas	4822	['id'=>'4822','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'732']	7	172.17.2.49	EDITAR	2017-07-18 16:07:29	2017-07-18 16:07:29
231	Personas	733	['id'=>'733','nacionalidad'=>'V','cedula'=>'12955831','primerNombre'=>'RODOLFO','segundoNombre'=>'','primerApellido'=>'URBINA','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:12:37	2017-07-18 16:12:37
232	Ventas	4823	['id'=>'4823','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'733']	7	172.17.2.49	EDITAR	2017-07-18 16:13:06	2017-07-18 16:13:06
233	Personas	734	['id'=>'734','nacionalidad'=>'V','cedula'=>'14322225','primerNombre'=>'JOSE','segundoNombre'=>'','primerApellido'=>'BERMUDEZ','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:16:42	2017-07-18 16:16:42
234	Ventas	4824	['id'=>'4824','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'734']	7	172.17.2.49	EDITAR	2017-07-18 16:17:18	2017-07-18 16:17:18
235	Personas	735	['id'=>'735','nacionalidad'=>'V','cedula'=>'14446659','primerNombre'=>'RONALD','segundoNombre'=>'','primerApellido'=>'ALVIAREZ','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:18:53	2017-07-18 16:18:53
236	Ventas	4825	['id'=>'4825','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'735']	7	172.17.2.49	EDITAR	2017-07-18 16:19:22	2017-07-18 16:19:22
237	Personas	736	['id'=>'736','nacionalidad'=>'V','cedula'=>'15389497','primerNombre'=>'ALEXI','segundoNombre'=>'','primerApellido'=>'REVERON','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:22:20	2017-07-18 16:22:20
238	Ventas	4826	['id'=>'4826','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'736']	7	172.17.2.49	EDITAR	2017-07-18 16:22:50	2017-07-18 16:22:50
239	Personas	737	['id'=>'737','nacionalidad'=>'V','cedula'=>'16562772','primerNombre'=>'LUZ','segundoNombre'=>'','primerApellido'=>'VILLALOBOS','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:24:24	2017-07-18 16:24:24
240	Personas	738	['id'=>'738','nacionalidad'=>'V','cedula'=>'16081512','primerNombre'=>'AMIRA','segundoNombre'=>'','primerApellido'=>'URUETA','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:26:54	2017-07-18 16:26:54
241	Ventas	4828	['id'=>'4828','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'738']	7	172.17.2.49	EDITAR	2017-07-18 16:27:19	2017-07-18 16:27:19
242	Personas	739	['id'=>'739','nacionalidad'=>'V','cedula'=>'16266748','primerNombre'=>'CARLOS','segundoNombre'=>'ROBERTO','primerApellido'=>'FEBRES','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:29:45	2017-07-18 16:29:45
243	Ventas	4829	['id'=>'4829','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'739']	7	172.17.2.49	EDITAR	2017-07-18 16:30:11	2017-07-18 16:30:11
244	Personas	740	['id'=>'740','nacionalidad'=>'V','cedula'=>'16670811','primerNombre'=>'JAN','segundoNombre'=>'','primerApellido'=>'GUDIÑO','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:32:15	2017-07-18 16:32:15
245	Ventas	4830	['id'=>'4830','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'740']	7	172.17.2.49	EDITAR	2017-07-18 16:32:35	2017-07-18 16:32:35
246	Personas	741	['id'=>'741','nacionalidad'=>'V','cedula'=>'16954618','primerNombre'=>'MIGUELANGEL','segundoNombre'=>'','primerApellido'=>'DIAZ','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-18 16:33:52	2017-07-18 16:33:52
247	Ventas	4831	['id'=>'4831','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'741']	7	172.17.2.49	EDITAR	2017-07-18 16:34:18	2017-07-18 16:34:18
248	Personas	741	['id'=>'741','nacionalidad'=>'V','cedula'=>'16964618','primerNombre'=>'MIGUELANGEL','segundoNombre'=>'','primerApellido'=>'DIAZ','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	EDITAR	2017-07-18 16:39:59	2017-07-18 16:39:59
249	Personas	742	['id'=>'742','nacionalidad'=>'V','cedula'=>'16994075','primerNombre'=>'CARLOS','segundoNombre'=>'','primerApellido'=>'GUERRA','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 08:53:11	2017-07-19 08:53:11
250	Ventas	4832	['id'=>'4832','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'742']	7	172.17.2.49	EDITAR	2017-07-19 08:53:45	2017-07-19 08:53:45
251	Personas	743	['id'=>'743','nacionalidad'=>'V','cedula'=>'17719633','primerNombre'=>'ILIANA','segundoNombre'=>'NORELYS','primerApellido'=>'BRACA','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 08:55:37	2017-07-19 08:55:37
252	Ventas	4833	['id'=>'4833','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'743']	7	172.17.2.49	EDITAR	2017-07-19 08:55:57	2017-07-19 08:55:57
253	Personas	744	['id'=>'744','nacionalidad'=>'V','cedula'=>'17961468','primerNombre'=>'GILBERT','segundoNombre'=>'','primerApellido'=>'TORRES','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 08:57:39	2017-07-19 08:57:39
254	Ventas	4834	['id'=>'4834','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'744']	7	172.17.2.49	EDITAR	2017-07-19 08:58:00	2017-07-19 08:58:00
255	Personas	745	['id'=>'745','nacionalidad'=>'V','cedula'=>'18269190','primerNombre'=>'EMILY','segundoNombre'=>'','primerApellido'=>'DELGADO','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 08:59:48	2017-07-19 08:59:48
256	Ventas	4835	['id'=>'4835','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'745']	7	172.17.2.49	EDITAR	2017-07-19 09:00:18	2017-07-19 09:00:18
257	Personas	746	['id'=>'746','nacionalidad'=>'V','cedula'=>'18816822','primerNombre'=>'NAYVIER','segundoNombre'=>'ALEXANDRA','primerApellido'=>'RIERA','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 09:02:12	2017-07-19 09:02:12
258	Ventas	4836	['id'=>'4836','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'746']	7	172.17.2.49	EDITAR	2017-07-19 09:02:33	2017-07-19 09:02:33
259	Personas	747	['id'=>'747','nacionalidad'=>'V','cedula'=>'20655977','primerNombre'=>'MACGYVER','segundoNombre'=>'','primerApellido'=>'GALVAN','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 09:04:21	2017-07-19 09:04:21
260	Ventas	4837	['id'=>'4837','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'747']	7	172.17.2.49	EDITAR	2017-07-19 09:04:41	2017-07-19 09:04:41
261	Personas	748	['id'=>'748','nacionalidad'=>'V','cedula'=>'20792675','primerNombre'=>'EDUARD','segundoNombre'=>'','primerApellido'=>'VALERO','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 09:07:48	2017-07-19 09:07:48
262	Ventas	4838	['id'=>'4838','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'748']	7	172.17.2.49	EDITAR	2017-07-19 09:08:24	2017-07-19 09:08:24
263	Personas	749	['id'=>'749','nacionalidad'=>'V','cedula'=>'20812287','primerNombre'=>'LUIS','segundoNombre'=>'ANTONIO','primerApellido'=>'DELGADO','segundoApellido'=>'DIAZ','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 09:09:56	2017-07-19 09:09:56
264	Ventas	4839	['id'=>'4839','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'749']	7	172.17.2.49	EDITAR	2017-07-19 09:10:26	2017-07-19 09:10:26
265	Personas	750	['id'=>'750','nacionalidad'=>'V','cedula'=>'22020690','primerNombre'=>'LEONARD','segundoNombre'=>'','primerApellido'=>'MONTES','segundoApellido'=>'DE OCA','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 09:12:28	2017-07-19 09:12:28
266	Ventas	4840	['id'=>'4840','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'750']	7	172.17.2.49	EDITAR	2017-07-19 09:12:59	2017-07-19 09:12:59
267	Personas	751	['id'=>'751','nacionalidad'=>'V','cedula'=>'24139700','primerNombre'=>'ASMARA','segundoNombre'=>'','primerApellido'=>'GALVAN','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 09:14:46	2017-07-19 09:14:46
268	Ventas	4841	['id'=>'4841','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'751']	7	172.17.2.49	EDITAR	2017-07-19 09:15:10	2017-07-19 09:15:10
269	Personas	752	['id'=>'752','nacionalidad'=>'V','cedula'=>'24204268','primerNombre'=>'ANDRES','segundoNombre'=>'','primerApellido'=>'GUTIERREZ','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 09:18:34	2017-07-19 09:18:34
270	Ventas	4842	['id'=>'4842','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'752']	7	172.17.2.49	EDITAR	2017-07-19 09:19:00	2017-07-19 09:19:00
271	Personas	753	['id'=>'753','nacionalidad'=>'V','cedula'=>'25006809','primerNombre'=>'ANA','segundoNombre'=>'JULIA','primerApellido'=>'LINAREZ','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 09:20:39	2017-07-19 09:20:39
272	Ventas	4843	['id'=>'4843','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'753']	7	172.17.2.49	EDITAR	2017-07-19 09:20:59	2017-07-19 09:20:59
273	Personas	754	['id'=>'754','nacionalidad'=>'V','cedula'=>'9482718','primerNombre'=>'JOSE','segundoNombre'=>'LORENZO','primerApellido'=>'RODRIGUEZ','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-19 10:58:22	2017-07-19 10:58:22
274	Ventas	4844	['id'=>'4844','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'754']	7	172.17.2.49	EDITAR	2017-07-19 10:58:47	2017-07-19 10:58:47
275	Personas	755	['id'=>'755','nacionalidad'=>'V','cedula'=>'20813957','primerNombre'=>'EDGAR','segundoNombre'=>'','primerApellido'=>'JIMENEZ','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-07-25 12:02:39	2017-07-25 12:02:39
276	Ventas	4845	['id'=>'4845','estatus'=>'0','fechaModificacion'=>'','observacion'=>'','monto1'=>'','monto2'=>'','monto3'=>'','idEventos'=>'11','idPersonal'=>'755']	7	172.17.2.49	EDITAR	2017-07-25 12:03:30	2017-07-25 12:03:30
277	Eventos	12	['id'=>'12','nombre'=>'PRUEBA DE JULIO','descripcion'=>'OPERATIVO DE PRUEBA','tipoPago'=>'1','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'1','fecha'=>'2017-08-01 00:00:00.000000']	7	172.17.2.49	CREAR	2017-07-31 15:13:52	2017-07-31 15:13:52
278	UserEvento	10	['id'=>'10','roles'=>'ROLE_ADMIN','idEvento'=>'12','idUser'=>'7']	7	172.17.2.49	CREAR	2017-07-31 15:14:11	2017-07-31 15:14:11
279	Productos	10	['id'=>'10','nombre'=>'PRUEBA ARROZ','descripcion'=>'1 KILO','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-07-31 15:15:02	2017-07-31 15:15:02
280	Productos	11	['id'=>'11','nombre'=>'PRUEBA DE HARINA','descripcion'=>'1 KILO','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-07-31 15:15:25	2017-07-31 15:15:25
283	Eventos	13	['id'=>'13','nombre'=>'ARROZ VENEZUELA','descripcion'=>'OPERATIVO DE ARROZ','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'1','fecha'=>'2017-10-03 00:00:00.000000']	7	172.17.2.49	CREAR	2017-10-02 09:43:47	2017-10-02 09:43:47
284	Productos	12	['id'=>'12','nombre'=>'ARROZ','descripcion'=>'ARROZ 4KILOS','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-02 09:50:30	2017-10-02 09:50:30
285	Productos	12	['id'=>'12','nombre'=>'ARROZ','descripcion'=>'ARROZ 4KILOS','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-02 09:51:16	2017-10-02 09:51:16
286	Productos	12	['id'=>'12','nombre'=>'ARROZ','descripcion'=>'ARROZ 4 KILOS','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-02 09:51:34	2017-10-02 09:51:34
287	EventoProductos	44	['id'=>'44','precio'=>'10','cantidad'=>'4','idEvento'=>'13','idProducto'=>'12']	7	172.17.2.49	CREAR	2017-10-02 09:53:34	2017-10-02 09:53:34
288	UserEvento	11	['id'=>'11','roles'=>'ROLE_ADMIN','idEvento'=>'13','idUser'=>'7']	7	172.17.2.49	CREAR	2017-10-02 09:57:35	2017-10-02 09:57:35
289	EventoProductos	44	['id'=>'44','precio'=>'10000','cantidad'=>'4','idEvento'=>'','idProducto'=>'']	7	172.17.2.49	EDITAR	2017-10-02 10:05:43	2017-10-02 10:05:43
290	Personas	883	['id'=>'883','nacionalidad'=>'V','cedula'=>'10699994','primerNombre'=>'REINERYS','segundoNombre'=>'','primerApellido'=>'GONZALEZ','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 10:49:13	2017-10-02 10:49:13
291	Personas	884	['id'=>'884','nacionalidad'=>'V','cedula'=>'15799144','primerNombre'=>'JOSUE','segundoNombre'=>'','primerApellido'=>'DIAZ','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 11:31:38	2017-10-02 11:31:38
292	Personas	885	['id'=>'885','nacionalidad'=>'V','cedula'=>'18840082','primerNombre'=>'MIGUEL','segundoNombre'=>'','primerApellido'=>'AQUINO','segundoApellido'=>'','tipoPersonal'=>'13','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 11:33:56	2017-10-02 11:33:56
293	Personas	886	['id'=>'886','nacionalidad'=>'V','cedula'=>'8899860','primerNombre'=>'PAUL','segundoNombre'=>'','primerApellido'=>'BRITO','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 11:36:59	2017-10-02 11:36:59
294	Personas	887	['id'=>'887','nacionalidad'=>'V','cedula'=>'6317211','primerNombre'=>'OSCAR','segundoNombre'=>'','primerApellido'=>'JACKSON','segundoApellido'=>'','tipoPersonal'=>'4','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 11:42:00	2017-10-02 11:42:00
295	Personas	888	['id'=>'888','nacionalidad'=>'V','cedula'=>'3809981','primerNombre'=>'FRANCISCO','segundoNombre'=>'','primerApellido'=>'MORENO','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 11:43:28	2017-10-02 11:43:28
296	Personas	889	['id'=>'889','nacionalidad'=>'V','cedula'=>'10812609','primerNombre'=>'RUBEN','segundoNombre'=>'','primerApellido'=>'PAEZ','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 11:44:37	2017-10-02 11:44:37
297	Personas	890	['id'=>'890','nacionalidad'=>'V','cedula'=>'13583334','primerNombre'=>'MAGDA','segundoNombre'=>'','primerApellido'=>'GARCIAZ','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 14:02:14	2017-10-02 14:02:14
298	Personas	891	['id'=>'891','nacionalidad'=>'V','cedula'=>'16672899','primerNombre'=>'DAVID','segundoNombre'=>'','primerApellido'=>'ARANGO','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 14:35:21	2017-10-02 14:35:21
299	Personas	892	['id'=>'892','nacionalidad'=>'V','cedula'=>'22668272','primerNombre'=>'ADRIAN','segundoNombre'=>'','primerApellido'=>'OROPEZA','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 14:39:23	2017-10-02 14:39:23
300	Personas	893	['id'=>'893','nacionalidad'=>'V','cedula'=>'25515497','primerNombre'=>'FRAN','segundoNombre'=>'','primerApellido'=>'SALAZAR','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 14:40:40	2017-10-02 14:40:40
301	Personas	894	['id'=>'894','nacionalidad'=>'V','cedula'=>'82023052','primerNombre'=>'IRMA','segundoNombre'=>'','primerApellido'=>'LEON','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 14:41:55	2017-10-02 14:41:55
302	Personas	895	['id'=>'895','nacionalidad'=>'V','cedula'=>'17168132','primerNombre'=>'ANA','segundoNombre'=>'','primerApellido'=>'BELLO','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 14:43:10	2017-10-02 14:43:10
303	Eventos	11	['id'=>'11','nombre'=>'CAFE VENEZUELA','descripcion'=>'Operativo Café Venezuela','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'0','fecha'=>'2017-07-14 00:00:00.000000']	7	172.17.2.49	EDITAR	2017-10-02 14:51:03	2017-10-02 14:51:03
304	Eventos	12	['id'=>'12','nombre'=>'PRUEBA DE JULIO','descripcion'=>'OPERATIVO DE PRUEBA','tipoPago'=>'1','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'0','fecha'=>'2017-08-01 00:00:00.000000']	7	172.17.2.49	EDITAR	2017-10-02 14:51:22	2017-10-02 14:51:22
305	Personas	896	['id'=>'896','nacionalidad'=>'V','cedula'=>'9889960','primerNombre'=>'PAUL','segundoNombre'=>'','primerApellido'=>'BRITO','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-02 14:59:32	2017-10-02 14:59:32
306	Personas	896	['id'=>'896','nacionalidad'=>'V','cedula'=>'9889860','primerNombre'=>'PAUL','segundoNombre'=>'','primerApellido'=>'BRITO','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	EDITAR	2017-10-02 16:11:49	2017-10-02 16:11:49
307	Personas	886	['id'=>'886','nacionalidad'=>'V','cedula'=>'8899860','primerNombre'=>'PAUL','segundoNombre'=>'','primerApellido'=>'BRITO','segundoApellido'=>'','tipoPersonal'=>'1','estatus'=>'2','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	ELIMINAR	2017-10-02 16:13:54	2017-10-02 16:13:54
308	Personas	898	['id'=>'898','nacionalidad'=>'V','cedula'=>'6344515','primerNombre'=>'ANIBAL','segundoNombre'=>'','primerApellido'=>'CAMPO','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-05 15:18:28	2017-10-05 15:18:28
309	Personas	899	['id'=>'899','nacionalidad'=>'V','cedula'=>'13113199','primerNombre'=>'ALICIA','segundoNombre'=>'','primerApellido'=>'GALARRAGA','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-05 15:20:25	2017-10-05 15:20:25
310	Personas	900	['id'=>'900','nacionalidad'=>'V','cedula'=>'12500358','primerNombre'=>'VICENZO','segundoNombre'=>'','primerApellido'=>'LIOY','segundoApellido'=>'','tipoPersonal'=>'2','estatus'=>'1','unidadAdministrativa'=>'','ubucacionFuncional'=>'','descripcionEstatusNomina'=>'','codigoNomina'=>'','nomina'=>'','nominaCestaticket'=>'']	7	172.17.2.49	CREAR	2017-10-05 15:27:23	2017-10-05 15:27:23
311	Eventos	14	['id'=>'14','nombre'=>'COMBO ESCOLAR','descripcion'=>'JORNADA ESCOLAR','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'1','fecha'=>'2017-10-10 00:00:00.000000']	7	172.17.2.49	CREAR	2017-10-09 09:50:40	2017-10-09 09:50:40
312	Productos	13	['id'=>'13','nombre'=>'CARPETA','descripcion'=>'2','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-09 10:24:59	2017-10-09 10:24:59
313	Productos	13	['id'=>'13','nombre'=>'CARPETA','descripcion'=>'2 UNIDADES','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-09 10:25:48	2017-10-09 10:25:48
314	Productos	14	['id'=>'14','nombre'=>'LAPICES','descripcion'=>'4 UNIDADES','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-09 10:27:21	2017-10-09 10:27:21
315	Productos	15	['id'=>'15','nombre'=>'JUEGO DE GEOMETRIA','descripcion'=>'1 UNIDAD','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-09 10:28:05	2017-10-09 10:28:05
316	Productos	16	['id'=>'16','nombre'=>'LIBRETA','descripcion'=>'1 UNIDAD','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-09 10:28:55	2017-10-09 10:28:55
317	Productos	17	['id'=>'17','nombre'=>'BORRADOR','descripcion'=>'1 UNIDAD','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-09 10:29:21	2017-10-09 10:29:21
318	Productos	18	['id'=>'18','nombre'=>'LAPICEROS','descripcion'=>'2 UNIDADES','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-09 10:29:57	2017-10-09 10:29:57
319	Productos	19	['id'=>'19','nombre'=>'RESALTADOR','descripcion'=>'1 UNIDAD','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-09 10:31:43	2017-10-09 10:31:43
320	Productos	20	['id'=>'20','nombre'=>'MARCADOR PUNTA FINA','descripcion'=>'1 UNIDAD','estatus'=>'1']	7	172.17.2.49	EDITAR	2017-10-09 10:32:39	2017-10-09 10:32:39
321	UserEvento	12	['id'=>'12','roles'=>'ROLE_ADMIN','idEvento'=>'14','idUser'=>'7']	7	172.17.2.49	CREAR	2017-10-09 10:38:25	2017-10-09 10:38:25
322	EventoProductos	45	['id'=>'45','precio'=>'0','cantidad'=>'2','idEvento'=>'14','idProducto'=>'13']	7	172.17.2.49	CREAR	2017-10-09 10:44:15	2017-10-09 10:44:15
323	EventoProductos	46	['id'=>'46','precio'=>'0','cantidad'=>'4','idEvento'=>'14','idProducto'=>'14']	7	172.17.2.49	CREAR	2017-10-09 11:08:56	2017-10-09 11:08:56
324	EventoProductos	47	['id'=>'47','precio'=>'0','cantidad'=>'1','idEvento'=>'14','idProducto'=>'15']	7	172.17.2.49	CREAR	2017-10-09 11:09:24	2017-10-09 11:09:24
325	EventoProductos	48	['id'=>'48','precio'=>'0','cantidad'=>'1','idEvento'=>'14','idProducto'=>'16']	7	172.17.2.49	CREAR	2017-10-09 11:09:54	2017-10-09 11:09:54
326	EventoProductos	49	['id'=>'49','precio'=>'0','cantidad'=>'1','idEvento'=>'14','idProducto'=>'17']	7	172.17.2.49	CREAR	2017-10-09 11:10:20	2017-10-09 11:10:20
327	EventoProductos	50	['id'=>'50','precio'=>'0','cantidad'=>'2','idEvento'=>'14','idProducto'=>'18']	7	172.17.2.49	CREAR	2017-10-09 11:10:51	2017-10-09 11:10:51
328	EventoProductos	51	['id'=>'51','precio'=>'0','cantidad'=>'1','idEvento'=>'14','idProducto'=>'19']	7	172.17.2.49	CREAR	2017-10-09 11:11:16	2017-10-09 11:11:16
329	EventoProductos	52	['id'=>'52','precio'=>'0','cantidad'=>'1','idEvento'=>'14','idProducto'=>'20']	7	172.17.2.49	CREAR	2017-10-09 11:11:50	2017-10-09 11:11:50
330	Eventos	13	['id'=>'13','nombre'=>'ARROZ VENEZUELA','descripcion'=>'OPERATIVO DE ARROZ','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'0','fecha'=>'2017-10-03 00:00:00.000000']	7	172.17.2.49	EDITAR	2017-10-09 13:24:33	2017-10-09 13:24:33
331	Eventos	13	['id'=>'13','nombre'=>'ARROZ VENEZUELA','descripcion'=>'OPERATIVO DE ARROZ','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'1','fecha'=>'2017-10-03 00:00:00.000000']	7	172.17.2.49	EDITAR	2017-10-09 13:25:47	2017-10-09 13:25:47
332	Eventos	13	['id'=>'13','nombre'=>'ARROZ VENEZUELA','descripcion'=>'OPERATIVO DE ARROZ','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'0','fecha'=>'2017-10-03 00:00:00.000000']	7	172.17.2.49	EDITAR	2017-10-09 13:28:26	2017-10-09 13:28:26
333	Eventos	13	['id'=>'13','nombre'=>'ARROZ VENEZUELA','descripcion'=>'OPERATIVO DE ARROZ','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'1','fecha'=>'2017-10-03 00:00:00.000000']	7	172.17.2.49	EDITAR	2017-10-09 13:39:26	2017-10-09 13:39:26
334	EventoProductos	52	['id'=>'52','precio'=>'','cantidad'=>'1','idEvento'=>'','idProducto'=>'']	7	172.17.2.49	EDITAR	2017-10-09 14:59:30	2017-10-09 14:59:30
335	EventoProductos	51	['id'=>'51','precio'=>'','cantidad'=>'1','idEvento'=>'','idProducto'=>'']	7	172.17.2.49	EDITAR	2017-10-09 14:59:57	2017-10-09 14:59:57
336	EventoProductos	50	['id'=>'50','precio'=>'','cantidad'=>'2','idEvento'=>'','idProducto'=>'']	7	172.17.2.49	EDITAR	2017-10-09 15:00:29	2017-10-09 15:00:29
337	EventoProductos	49	['id'=>'49','precio'=>'','cantidad'=>'1','idEvento'=>'','idProducto'=>'']	7	172.17.2.49	EDITAR	2017-10-09 15:00:52	2017-10-09 15:00:52
338	EventoProductos	48	['id'=>'48','precio'=>'','cantidad'=>'1','idEvento'=>'','idProducto'=>'']	7	172.17.2.49	EDITAR	2017-10-09 15:01:24	2017-10-09 15:01:24
339	EventoProductos	47	['id'=>'47','precio'=>'','cantidad'=>'1','idEvento'=>'','idProducto'=>'']	7	172.17.2.49	EDITAR	2017-10-09 15:02:12	2017-10-09 15:02:12
340	EventoProductos	46	['id'=>'46','precio'=>'','cantidad'=>'4','idEvento'=>'','idProducto'=>'']	7	172.17.2.49	EDITAR	2017-10-09 15:02:30	2017-10-09 15:02:30
341	EventoProductos	45	['id'=>'45','precio'=>'','cantidad'=>'2','idEvento'=>'','idProducto'=>'']	7	172.17.2.49	EDITAR	2017-10-09 15:03:00	2017-10-09 15:03:00
342	Productos	20	['id'=>'20','nombre'=>'MARCADOR PUNTA FINA','descripcion'=>'1 UNIDAD','estatus'=>'2']	7	172.17.2.49	ELIMINAR	2017-10-09 15:08:15	2017-10-09 15:08:15
343	Eventos	13	['id'=>'13','nombre'=>'ARROZ VENEZUELA','descripcion'=>'OPERATIVO DE ARROZ','tipoPago'=>'0','rolesUsuario'=>'ROLE_ADMIN','estatus'=>'0','fecha'=>'2017-10-03 00:00:00.000000']	7	172.17.2.49	EDITAR	2017-10-10 08:41:41	2017-10-10 08:41:41
\.


--
-- Name: bitacora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bitacora_id_seq', 343, true);


--
-- Data for Name: evento_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY evento_productos (id, id_evento, id_producto, precio, cantidad) FROM stdin;
6	1	1	50	5
29	4	1	50	5
30	5	1	250	1
31	7	1	200	52
32	6	1	1400	5
33	9	3	1200	5
34	9	4	400	4
35	9	5	600	4
36	9	6	3000	5
37	9	7	160	4
38	9	8	200	3
40	7	6	5000	4
41	10	1	150	4
42	12	10	10500	2
43	12	11	10500	2
44	13	12	10000	4
52	14	20	\N	1
51	14	19	\N	1
50	14	18	\N	2
49	14	17	\N	1
48	14	16	\N	1
47	14	15	\N	1
46	14	14	\N	4
45	14	13	\N	2
\.


--
-- Name: evento_productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('evento_productos_id_seq', 52, true);


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eventos (id, nombre, descripcion, tipo_pago, roles_usuario, estatus, fecha) FROM stdin;
1	venta de harina	venta de harina	0	ROLE_USER	1	2017-04-04 00:30:00
4	venta de harina 2	venta de harina	0	ROLE_USER	1	2017-04-04 00:30:00
5	venta de harina 3	venta de harina 3	0	ROLE_SUPER_ADMIN	1	2017-04-05 00:30:00
6	venta de harina 4	venta de harina 4	0	ROLE_SUPER_ADMIN	1	2017-04-05 00:30:00
7	venta de harina 5	venta de harina	0	ROLE_ADMIN	1	2017-04-07 00:30:00
8	venta de harina 6	venta de harina	0	ROLE_SUPER_ADMIN	1	2017-04-21 00:30:00
10	venta de harina 7	venta de harina 7	0	ROLE_SUPER_ADMIN	1	2017-07-10 00:30:00
9	SOL DE NAIGUATA	OPERATIVO DE PRUEBA	0	ROLE_ADMIN	2	2017-04-28 00:00:00
11	CAFE VENEZUELA	Operativo Café Venezuela	0	ROLE_ADMIN	0	2017-07-14 00:00:00
12	PRUEBA DE JULIO	OPERATIVO DE PRUEBA	1	ROLE_ADMIN	0	2017-08-01 00:00:00
14	COMBO ESCOLAR	JORNADA ESCOLAR	0	ROLE_ADMIN	1	2017-10-10 00:00:00
13	ARROZ VENEZUELA	OPERATIVO DE ARROZ	0	ROLE_ADMIN	0	2017-10-03 00:00:00
\.


--
-- Name: eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eventos_id_seq', 14, true);


--
-- Data for Name: fos_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fos_user (id, username, username_canonical, email, email_canonical, enabled, salt, password, last_login, locked, expired, expires_at, confirmation_token, password_requested_at, roles, credentials_expired, credentials_expire_at, user_father) FROM stdin;
5	rrhhadmin	rrhhadmin	rrhhadmin@opsu.gob.ve	rrhhadmin@opsu.gob.ve	t	9edak38yh9sswgswcc448o0cws4k4s	Cy9mimpsCxHZFyVOO7tO0P7aZ04LxnB814mt3vbOG8oeuahOKw+YzuDqtALHIrEC2EbKTLJ6jeQGdOn1wv9ChA==	2017-04-07 09:11:35	f	f	\N	\N	\N	a:1:{i:0;s:10:"ROLE_ADMIN";}	f	\N	1
8	Operador2	operador2	agarcia@opsu.gob.ve	agarcia@opsu.gob.ve	t	ml2v81xwhlc8oo0okswkk00wcgog4cs	JNkilV8kj5ked/sbf/eHOpEnHox2UB3vo2rraWrW04BkuJaYclcPOf8FUQrsE92LU0fbamybYUaSUKoNEE/2Eg==	2017-04-25 15:30:39	f	f	\N	\N	\N	a:1:{i:0;s:11:"ROLE_VENTAS";}	f	\N	7
2	rrhh	rrhh	rrhh@opsu.gob.ve	rrhh@opsu.gob.ve	t	47l7wssd05c008s80c4kc0s40gco804	vlvw6BiCcsxN47xFHSJjcPHxLP3tvwmlAkjdB0PqOEPEGKJNsYUdcZcBE4OpV1JxtHGvop2oceEKagQa0ULvfA==	2017-04-05 10:50:13	f	f	\N	\N	\N	a:1:{i:0;s:10:"ROLE_ADMIN";}	f	\N	\N
9	Operador	operador	bpaz@opsu.gob.ve	bpaz@opsu.gob.ve	t	jymbkd8hr5s4ks444kw0cso88woswks	Hvi+1vqKS+W1FNQXh3cPZSZGGq+R1v9cvnncq21AB+IYO1x7LgK+PXqW1xnwIUNjICD62MJmADbwaENuC4MU1A==	2017-04-25 15:55:39	f	f	\N	\N	\N	a:1:{i:0;s:11:"ROLE_VENTAS";}	f	\N	7
6	rrhh1	rrhh1	rrhh1@opsu.gob.ve	rrhh1@opsu.gob.ve	t	5chg4kme3j40cco0oko0go844cksscg	w09mk6Auog0NFZLuYsuGiGPAIqO10B8etc/JLum8Mp08uYb1UubDWLIEkrqHkutsbq8Bnt28Y2eE2qHDjOjfkw==	2017-04-05 14:57:42	f	f	\N	\N	\N	a:1:{i:0;s:11:"ROLE_VENTAS";}	f	\N	5
7	Gerardo	gerardo	gsuarez@opsu.gob.ve	gsuarez@opsu.gob.ve	t	sqmjkq3fny80kc8wc4ogkoogw4wo8ks	xH+5aintT0tJtHDmF7wGwWcJsVwBtTJFpH16KG0TBZFpc1+QFIjwo4Ugidz5AHfpf0EN0KRLL1PKC0Djs8IG9g==	2017-10-13 10:27:23	f	f	\N	\N	\N	a:1:{i:0;s:10:"ROLE_ADMIN";}	f	\N	1
1	admin	admin	admin@opsu.gob.ve	admin@opsu.gob.ve	t	a7z7rxmr20gs4w0ksg04kok8gk4kcsk	GuJ4Y6lp1bQLWSFDss5RJUNfAVfCn22EqTiy6fA/g66wTCUP8Oq12vV1ckpwNBG7bgH3l3jSl1E+GvF5rzBWrQ==	2017-10-16 11:06:33	f	f	\N	\N	\N	a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}	f	\N	\N
\.


--
-- Name: fos_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fos_user_id_seq', 9, true);


--
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personas (id, nacionalidad, cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, tipo_personal, estatus, unidad_administrativa, ubucacion_funcional, descripcion_estatus_nomina, codigo_nomina, nomina, nomina_cestaticket) FROM stdin;
10	V	6206515	JANETH	JOSEFINA	BERNAL	CASTILLO	1	1	UNIDAD DE APOYO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
29	V	4856988	NELLYS	TERESA	RAMOS	LOPEZ	7	1	JUBILADOS Y PENSIONADOS OPSU	SECRETARIADO PERMANENTE	activo	4	Jubilado Administrativo	0
1	V	13533643	LIDIUSKA	BEATRIZ	RODRIGUEZ	BORRERO	1	1	DIRECCION OPSU	DIRECCION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
19	V	6482787	MIGUEL	ANTONIO	ALFONZO	DIAZ	1	1	DIRECCION OPSU	UNIDAD DE APOYO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
808	V	3788238	MARIA	CONCEPCION	PACHECO	GOMEZ	12	1	JUBILADOS Y PENSIONADOS OPSU		activo	5	Pensionado Administrativo	0
5	V	6105555	WILMER	ENRIQUE	TORRES	CARRILLO	1	1	DEPARTAMENTO DE DOCUMENTACION E INFORMACION	UNIDAD DE APOYO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
16	V	6359114	ANDRES	ELOY	RUIZ	ADRIAN	1	1	DIRECCION OPSU	DIRECCION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
900	V	12500358	VICENZO	\N	LIOY	\N	2	1	\N	\N	\N	\N	\N	\N
32	V	5232805	MIRIAN	ALEXIS	ROJAS		1	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
27	V	6908014	MARIA	LINA	RIGONI	PIOVESAN	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE TERRITORIALIZACION Y VINCULACION SOCIOPRODUCTIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
15	V	6349813	MIGUELINA	ROSANTA	CAOLO	CASTRO	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE RELACIONES PUBLICAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
61	V	9297380	YULI	JOSEFINA	ARCIA	AGUILERA	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
26	V	6907398	GLORIA	BEATRIZ	ZAMBRANO	PINILLA	1	1	DEPARTAMENTO DE PERSONAL	AREA DE INGRESO Y DESARROLLO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
25	V	6897620	FRANCIS	MARIA	MARCHAN	ROSALES	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DEPARTAMENTO DE ESTADISTICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
23	V	6550853	JAIMAR	DE JESUS	ANDREU	ROBLES	1	1	UNIDAD ADMINISTRATIVA   	AREA DE TERRITORIALIZACION Y VINCULACION SOCIOPRODUCTIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
28	V	3881273	JOSE	LORENZO	RODRIGUEZ	AGUERREVERE	1	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
34	V	6962430	IRMA	LISBETH	ROMERO	ADRIAN	1	1	UNIDAD ADMINISTRATIVA   	TESORERIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
910	V	25833660	Fabiana	Rosimar	Ramos	Delgado	2	1	\N	\N	\N	\N	\N	\N
31	V	5117027	MARIBEL		ROSARIO	CONTRERAS	7	1	JUBILADOS Y PENSIONADOS OPSU	SECRETARIADO PERMANENTE	activo	4	Jubilado Administrativo	0
21	V	6545121	ADELAIZA		PEREZ	MUJICA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DIRECCION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
9	V	6204389	ELIO	RICARDO	RAMIREZ	FIGUEROA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ATENCION AL CIUDADANO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
8	V	6177934	JUAN	MARCOS	JIMENEZ	LEDEZMA	1	1	UNIDAD ADMINISTRATIVA   	AREA DE BIENES NACIONALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
755	V	20813957	EDGAR	JULIO	JIMENEZ	LEON	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
17	V	6369487	MARLENE		ACOSTA	MENDEZ	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	PROGRAMA ADMINISTRATIVO FINANCIERO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
885	V	18840082	MIGUEL	\N	AQUINO	\N	13	1	\N	\N	\N	\N	\N	\N
732	V	12834054	ANGELICA	MARIA	LOPEZ	GARCIA	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
20	V	6504883	ZILBEMAR	HELENA	PEREZ	NADAL	1	1	DEPARTAMENTO DE FINANZAS	AREA DE CONTROL PRESUPUESTARIO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
696	V	14050077	FELIX	OMAR	BRACAMONTE	ARTEAGA	1	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE TELECOMUNICACIONES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
172	V	13520965	ARELIS	COROMOTO	GONZALEZ	LOMBANO	1	1	CONSULTORIA JURIDICA	CONSULTORIA JURIDICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
22	V	6547848	ZULAIMA	CARMEN	OSUNA	MARIN	1	1	DEPARTAMENTO DE ESTADISTICA	DEPARTAMENTO DE ESTADISTICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
14	V	6326919	NESTOR	RUBEN	GUERRERO	MENESES	1	1	DEPARTAMENTO DE PERSONAL	AREA DE INGRESO Y DESARROLLO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
13	V	6326506	LISSET		NUÑEZ	MOLINA	1	1	CONSULTORIA JURIDICA	SECRETARIADO PERMANENTE	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
30	V	4940016	JOSE	DE JESUS	BERENGUER	COA	1	1	S.P - DIRECCION	UNIDAD DE EVALUACION, NUCLEOS Y PROYECTOS	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
12	V	6307266	CIRO	RAFAEL	SEQUEA	ROA	1	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
6	V	6121031	JAMILET	JOSEFINA	QUEVEDO	PEREZ	1	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
24	V	6854838	CARLOS	ALEJANDRO	TORRES	BASTIDAS	1	1	UNIDAD DE APOYO	UNIDAD DE APOYO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
60	V	9236440	CARMEN	SOFIA	PARRA	ESPITIA	1	1	DEPARTAMENTO DE FINANZAS	CONTABILIDAD	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
62	V	9338321	ELIZABETH	DEL SOCORRO	ROSALES		1	1	UNIDAD ADMINISTRATIVA   	AREA DE FORMULACION PRESUPUESTARIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
50	V	8571736	RICHAR	RAMON	ABREU		1	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
101	V	10957613	CESAR	ORLANDO	SALGADO	GIMENEZ	1	1	UNIDAD ADMINISTRATIVA   	TESORERIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
88	V	10522627	MARLENE	DEL CARMEN	MAGALDI	MENDOZA	1	1	DEPARTAMENTO DE PERSONAL	AREA DE INGRESO Y DESARROLLO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
44	V	7920324	DAICY	JULIETA	DEL GIUDICE	TOVAR	1	1	DEPARTAMENTO DE PERSONAL	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
56	V	9119001	GUSTAVO	ADOLFO	ANTILLANO	TORREMOCHA	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
756	V	980176	MARCOS		JIMENEZ		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	8	Obrero Jubilado	0
93	V	10573936	YASMILA	YAMILE	VIDAL	BOLIVAR	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
757	V	962035	MARIA	GRACIELA	FERNANDEZ	SANOJA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
40	V	7192007	ANA	ERMIGARDA	PALUMBO	PATUTO	1	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE BIENES NACIONALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
51	V	8729418	EVELIO	RAFAEL	ZAMBRANO	ALVIARES	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO	AREA DE TERRITORIALIZACION Y VINCULACION SOCIOPRODUCTIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
46	V	7929385	LUIS	AMBROSIO	CHACON	GARZON	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
42	V	7663533	LEYRIS	JOSEFINA	RODRIGUEZ	MOSQUEDA	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE TERRITORIALIZACION Y VINCULACION SOCIOPRODUCTIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
90	V	10543086	BLANCA	BRICEIDA	HERNANDEZ		1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ATENCION AL CIUDADANO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
41	V	7604600	MAGALY	DEL CARMEN	GONZALEZ	COLMENARES	1	1	DEPARTAMENTO DE ESTADISTICA	UNIDAD DE APOYO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
673	V	6302890	MARILU		BASTIDAS	RONDON	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
43	V	7684167	CATHERINE	MARGARITA	PACHECO	COLLAZO	1	1	DEPARTAMENTO DE PERSONAL	AREA DE INGRESO Y DESARROLLO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
89	V	10541318	ANA	FANELLY	DOMINGUEZ	CARUCI	1	1	DEPARTAMENTO DE FINANZAS	CONTABILIDAD	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
678	V	25235457	CARLOS	DANIEL	PEREZ	UGUETO	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
759	V	9226470	JUAN	BAUTISTA	AROCENA	GARCIA	12	1	JUBILADOS Y PENSIONADOS OPSU		activo	9	Obrero Pensionado	0
98	V	10820589	EVELIN	DEL CARMEN	MORALES	VILLASANA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	PROGRAMA ADMINISTRATIVO FINANCIERO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
758	V	958866	MARIA	EUSEBIA	DEL ROSARIO	DE MONTAÑA	12	1	JUBILADOS Y PENSIONADOS OPSU		activo	9	Obrero Pensionado	0
671	V	23691419	JESUS	ENRIQUE	BERMUDEZ	CORDOVA	2	1	PROGRAMA ADMINISTRATIVO FINANCIERO	PROGRAMA ADMINISTRATIVO FINANCIERO	activo	2	Personal Contratado Administrativo OPSU	0
92	V	10544929	ANA	MARIA	SILVA	RODRIGUEZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
91	V	10543921	LASTENIA	CARIDAD	GONZALEZ	CARRILLO	1	4	UNIDAD ADMINISTRATIVA   	OFICINA DE PLANIFICACION Y PRESUPUESTO	suspendido	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
53	V	8803475	LUIS	ALBERTO	MARTINEZ	GAMEZ	1	1	UNIDAD ADMINISTRATIVA   	CONTABILIDAD	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
52	V	8754297	GLORY	YUMALEY	BETANCOURT	RUIZ	1	1	DEPARTAMENTO DE PERSONAL	DEPARTAMENTO DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
697	V	14287264	EDWARD	JOSE	BLANCO	MERCHAN	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE TELECOMUNICACIONES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
48	V	8317682	ELIO	RAFAEL	SALAZAR	SANCHEZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
55	V	9062828	CARMELA		CRETARO	CAPOGNA	1	4	CONSULTORIA JURIDICA	CONSULTORIA JURIDICA	suspendido	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
45	V	7925979	ERNESTO	JOSE	PIRELA	CASTILLO	1	1	DEPARTAMENTO DE FINANZAS	ALMACEN	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
97	V	10806775	MARIFEL		MOLINA	VASQUEZ	1	1	UNIDAD ADMINISTRATIVA   	COMPRAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
94	V	10794075	JULIA	ROSA	HIDALGO	FUENTES	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
47	V	8217618	ELDA	MERCEDES	ACERO	PINO	1	1	UNIDAD ADMINISTRATIVA   	CONVENIO CUBA VENEZUELA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
36	V	10627869	MARIA	MARGARITA	GUZMAN	MACHADO	1	1	S.P - DIRECCION	AREA DE BIENESTAR SOCIAL	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
96	V	10797999	CARLOS	ANDRES	SUAREZ	ROJAS	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
86	V	10489895	NELLY	ELIZABETH	GOMEZ	TOVAR	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	OFICINA DE RELACIONES PUBLICAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
674	V	6548995	YANIRA	DEL CARMEN	ESCALONA	GUEVARA	2	1	\N	\N	\N	\N	\N	\N
82	V	10381490	IANOVSKA	JOSEFINA	LIMA	ROSALES	1	1	AUDITORIA INTERNA	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
72	V	10091754	KAREN	COROMOTO	ONAINDIA	AVENDAÑO	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	AREA DE TERRITORIALIZACION Y VINCULACION SOCIOPRODUCTIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
69	V	9959541	ROSA	DINORA	GONZALEZ	HERNANDEZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ATENCION AL CIUDADANO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
132	V	12292168	BEATRIZ	ELENA	PAZ	CALZADILLA	1	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
66	V	9513003	DINORA	DE LOS ANGELES	ARTEAGA	GERMAN	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
81	V	10377827	MASSIEL	CECILIA	SALAS	MEDINA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
717	V	19064753	FRANKLIN	JOSE	ZORRILLA		2	1	TECNOLOGIA Y SERVICIOS DE INFORMACION	DEPARTAMENTO DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
129	V	12057842	KARELIS	SIKIU	GUZMAN	MENDOZA	1	1	DEPARTAMENTO DE FINANZAS	UNIDAD ADMINISTRATIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
128	V	11994243	CARMEN	YERLY	BETANCOURT	BETANCOURT	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PLANIFICACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
121	V	11680578	REINALDO	JOSE	GUTIERREZ	RODRIGUEZ	1	1	UNIDAD ADMINISTRATIVA   	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
124	V	11934029	CAROLINA	DEL VALLE	LANDAETA	ROSALES	1	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
70	V	9961360	LILIBETH	CECILIA	SARMIENTO		1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE SOPORTE TECNICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
58	V	9156705	ERMELINDA	COROMOTO	VALLADARES	FERNANDEZ	1	1	DEPARTAMENTO DE PERSONAL	DEPARTAMENTO DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
134	V	12357029	SIALESKY	DE JESUS	CASANOVA		1	1	UNIDAD ADMINISTRATIVA   	UNIDAD ADMINISTRATIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
84	V	10481725	MARIA	ELENA	DA SILVA	DA CORTE	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
87	V	10505644	GLENYS	ZUNILDA	ROCCA	ORTIZ	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
79	V	10348088	LISETTE		BERTONCINI	MARCANO	1	1	UNIDAD ADMINISTRATIVA   	AREA DE BIENES NACIONALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
126	V	11960874	RICHARD	JOSE	LOBO	SIVOLI	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
85	V	10487043	NEYESKA	NORELYS	SILVA	CHURION	1	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
131	V	12138786	ADRIANA		BELISARIO		1	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE DESARROLLO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
83	V	10383969	ZAIDA	JOSEFINA	ESCALONA	DURAN	1	1	DIRECCION OPSU	OFICINA DE ATENCION AL CIUDADANO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
67	V	9645528	JANETH	MILAGRO	MELENDEZ	FERRER	1	1	UNIDAD ADMINISTRATIVA   	CONTABILIDAD	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
59	V	9177876	NABOR	ANTONIO	PAREDES	PAREDES	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ATENCION AL CIUDADANO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
68	V	9955348	FELIDA	JOSEFINA	BALLERA	ROJAS	1	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
734	V	14322225	JOSE	FRANCISCO	BERMUDEZ	SALAZAR	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
133	V	12299411	ERICA	DEL CARMEN	LUQUE		1	1	UNIDAD ADMINISTRATIVA   	AREA DE CONTROL Y SEGUIMIENTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
127	V	11992582	MARY		PEROZO	GARCIA	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	COMPRAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
125	V	11943235	KELLY	YASMIN	VELASQUEZ	SANOJA	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
78	V	10346506	SORELYS	DEL VALLE	FLAMEZ	HERNANDEZ	1	1	DEPARTAMENTO DE FINANZAS	UNIDAD ADMINISTRATIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
76	V	10318638	JOSE	ALI	MONTILLA	NUÑEZ	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
71	V	10010223	JOSE	ARGENIS	NUÑEZ		1	4	DEPARTAMENTO DE FINANZAS	DEPARTAMENTO DE FINANZAS	suspendido	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
73	V	10119905	CEILA	JOSEFINA	NARANJO	LORETO	1	1	UNIDAD ADMINISTRATIVA   	CONVENIO CUBA VENEZUELA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
75	V	10282852	JACINTA	BEATRIZ	VERA	NIEVES	1	1	DEPARTAMENTO DE PERSONAL	AREA DE ADMINISTRACION DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
114	V	11486126	NAYARI	EGRICELIA	GOMEZ	GRATEROL	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	AREA DE BIENES NACIONALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
102	V	11027079	ISMAEL	JOSE	CASARES	RAMOS	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE ORGANIZACION Y METODOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
680	V	9062426	ERICK	NELSON	SERRANO	ARAPE	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
159	V	13048115	MIGDALIA		VASQUEZ	NUÑEZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DEPARTAMENTO DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
115	V	11487065	ALBANELLY		VILLAFRANCA	MARQUEZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	PROGRAMA ADMINISTRATIVO FINANCIERO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
106	V	11128298	ELVIA	THAIZ	VILLACINDA	ALVAREZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
167	V	13375880	GISELA	ANAHILD	BRICEÑO	OROPEZA	1	1	AUDITORIA INTERNA	COMPRAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
136	V	12395762	PATRICIA	ABRAXAS	URBINA	RIOS	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
761	V	88094	EDECIA	ANGELINA	GARCIA	DE ABDALA	7	3	JUBILADOS Y PENSIONADOS OPSU		egresado	4	Jubilado Administrativo	0
104	V	11052545	JOSE	ELIAS	SILVA	ROJAS	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
168	V	13444882	YASMIN	DESIREE	VILLAMIZAR	MOGOLLON	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
138	V	12417161	MARIBEL	DEL CARMEN	VIELMA	RONDON	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	TESORERIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
120	V	11680062	ELOINA	MERCEDES	DE LA HOZ	GUARIN	1	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
160	V	13111101	DORKA	ANDREINA	PEÑA	GONZALEZ	1	1	DEPARTAMENTO SERVICIOS GENERALES	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
117	V	11552812	MARIA	ALEJANDRA	MACHADO	GARCIA	1	1	CONSULTORIA JURIDICA	CONSULTORIA JURIDICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
110	V	11197726	YRMA	LUCILA	VILLEGAS	GONZALEZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
170	V	13503059	LENIN	FRANCISCO	LINARES	TOVAR	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
118	V	11560509	JEANNETTE	MARIA	GARAVITO	FUENTES	1	1	DEPARTAMENTO DE FINANZAS	AREA DE CONTROL PRESUPUESTARIO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
169	V	13459798	PAULA	ALEJANDRA	GAMBIE	ECHARRY	1	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
139	V	12461318	KELLY	YAMIR	RAVELO	GARCIA	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
112	V	11481432	ROMINA	ISABEL	GARCIA	GALVIS	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
119	V	11604896	DENISE		MATTAR	PORTILLO	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
116	V	11550822	BRAULIO	ENRIQUE	GUERRERO	FIGUEROA	1	1	UNIDAD ADMINISTRATIVA   	CONTABILIDAD	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
886	V	8899860	PAUL	\N	BRITO	\N	1	2	\N	\N	\N	\N	\N	\N
111	V	11413779	GERSON	DAVID	VIZQUEL	ALEMAN	1	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
140	V	12483274	GUSTAVO		HERREROS	DE LA ROSA	1	1	DEPARTAMENTO DE ESTADISTICA	DEPARTAMENTO DE ESTADISTICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
699	V	14680732	LEIBER	RENNE	GONZALEZ	CHACON	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
754	V	9482718	JOSE	LORENZO	RODRIGUEZ	CARAPAICA	8	1	UNIDAD ADMINISTRATIVA   	UNIDAD ADMINISTRATIVA	activo	5003	Bono de Alimentación del Personal en Comisión de Servicios en OPSU	1
760	V	9135383	YLIA	MARLENE	PULIDO	MALDONADO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
109	V	11180007	MARLON	AUGUSTO	FELIBERT	GONZALEZ	1	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
108	V	11162863	LISSET	DEL CARMEN	LOPEZ	DE MENDOZA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE RELACIONES PUBLICAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
107	V	11160210	NATASCHA		GONZALEZ	PORRAS	1	1	DEPARTAMENTO DE ESTADISTICA	DEPARTAMENTO DE ESTADISTICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
166	V	13308041	MARIANNA		PARIS	BALLEZA	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
165	V	13253832	MICHELLE	ADRIANNA	SALAS	MEDINA	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
198	V	14363240	YULEIDY	EGLEE	CARMONA	HERNANDEZ	1	1	AUDITORIA INTERNA	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
676	V	7953962	JOSE	FRANCISCO	RAMIREZ	ALBA	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE TELECOMUNICACIONES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
208	V	14742615	JOSE	EDUARDO	ARREAZA	REBOLLEDO	1	1	DEPARTAMENTO DE PERSONAL	AREA DE ADMINISTRACION DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
203	V	14451003	ERIKA	PATRICIA	PACHECO	GARCIA	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
887	V	6317211	OSCAR	\N	JACKSON	\N	4	1	\N	\N	\N	\N	\N	\N
158	V	12961513	NARKY	THAIS	SALAS	DIAZ	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE CONTROL PRESUPUESTARIO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
49	V	8338355	CAROLINA	INDIRA	VILLEGAS	FEBRES	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
177	V	13617862	ADRIANA	MARISOL	MATA		1	3	DEPARTAMENTO DE PERSONAL	AREA DE ADMINISTRACION DE PERSONAL	egresado	1	Fijo Administrativo y Profesional OPSU	0
153	V	12912618	DONATTI	ESCAR	TOVAR	BETANCOURT	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
204	V	14494560	YHONS	TEOBALDO	CASTILLO	ISTURIZ	1	1	UNIDAD ADMINISTRATIVA   	AREA DE CONTROL Y SEGUIMIENTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
681	V	10140758	JOSE	ALFONSO	QUINTERO	ALEMAN	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS		activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
152	V	12899625	YARISMA	DEL VALLE	ESCORCHE	HERNANDEZ	1	1	DEPARTAMENTO DE PERSONAL	CONSULTORIA JURIDICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
200	V	14367336	MARIMIL	DE JESUS	SEGUIAS	ALI	1	4	UNIDAD ADMINISTRATIVA   	AREA DE CONTROL Y SEGUIMIENTO	suspendido	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
202	V	14445485	JOJHAANA	ANTONIA	CEDEÑO	PEREZ	1	1	DEPARTAMENTO DE PERSONAL	AREA DE INGRESO Y DESARROLLO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
156	V	12956945	EMELYS	TERESA	RUKOZ	GASCON	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	COORDINACION DE TECNOLOGIA Y SERVICIOS DE INFORMACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
196	V	14323690	IRMA	ECLARIZA	ANGARITA	IZAGUIRRE	1	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
199	V	14363250	CHRISTINE	LEIMAR	ECHENIQUE	HERMOSO	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
178	V	13627748	GLADYS	MARIA	RAMIREZ	VIÑAS	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE TERRITORIALIZACION Y VINCULACION SOCIOPRODUCTIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
175	V	13538397	ANA	YASMIRA	SILVA	VERGARA	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
143	V	12640869	ALI	REINALDO	ANGULO	PAGUA	1	1	DEPARTAMENTO DE ESTADISTICA	DEPARTAMENTO DE ESTADISTICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
174	V	13534137	NELSON	YSRAEL	RODRIGUEZ	GONZALEZ	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
207	V	14700298	PATRICIA		MORENO	VELAZCO	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
157	V	12960359	YURLEY	JOSEFINA	GONZALEZ	RODRIGUEZ	1	1	DEPARTAMENTO DE FINANZAS	AREA DE CONTROL Y SEGUIMIENTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
141	V	12561390	KARLA	YALUZ	PEREZ	AGUILAR	1	1	DEPARTAMENTO DE PERSONAL	DEPARTAMENTO DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
763	V	826660	EDGAR		GAMEZ	VALECILLO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
155	V	12955934	MAYRA	JANETH	VILLAMIZAR	MOGOLLON	1	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
151	V	12865851	HUGO	JESUS	FIGUEROA	SALAZAR	1	1	UNIDAD ADMINISTRATIVA   	AREA DE FORMULACION PRESUPUESTARIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
148	V	12748823	MIRTHA	LUCIA	TOVAR	RANGEL	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ATENCION AL CIUDADANO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
147	V	12731508	YOLGER	RODNEY	MENDOZA	PEÑA	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
700	V	15132410	MEYBIS	YULEIKA	RINCONES	LUGO	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DEPARTAMENTO DE TELECOMUNICACIONES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
146	V	12719121	FRANCGELAT	NAILET	GONZALEZ	HERNANDEZ	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
144	V	12679300	YSHAIRA	THAIDY	HERNANDEZ	BASTARDO	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PLANIFICACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
142	V	12589234	MARTIN	EMIRO	GONZALEZ	ROMERO	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE RELACIONES PUBLICAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
205	V	14583538	NELMARY	COROMOTO	MUJICA	DÍAZ	1	1	UNIDAD ADMINISTRATIVA   	AREA DE CONTROL Y SEGUIMIENTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
701	V	15325927	MOISES	ALEJANDRO	DUPUY	BANDRES	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
656	V	16863865	PATRICIA		ORTEGA	CONEO	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	2	Personal Contratado Administrativo OPSU	0
655	V	21718397	JOSE	ANTONIO	CHACON	MARTINEZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	2	Personal Contratado Administrativo OPSU	0
222	V	15160679	ALEXIS	MANUEL	BARRAGAN	CASSIANI	1	1	DEPARTAMENTO DE PERSONAL	AREA DE ADMINISTRACION DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
190	V	14153915	OSWALDO	ALEXANDER	ORTIZ	MURGA	1	1	UNIDAD ADMINISTRATIVA   	UNIDAD ADMINISTRATIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
193	V	14277146	YOLY	DEL VALLE	PAREDES	RAUSSEO	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DEPARTAMENTO DE ESTADISTICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
657	V	17967645	DAMELIS	NOEMI	PEREZ	HERNANDEZ	2	3	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	egresado	2	Personal Contratado Administrativo OPSU	0
231	V	15759752	ALEJANDRO	ANDRES	GARCIA		1	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
180	V	13673141	DAYANA	ANAID	ROMERO		1	1	DIRECCION OPSU	DIRECCION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
809	V	3750888	EDGAR	ROBERTO	ROJAS	GONZALEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
186	V	14073512	OSCAR	CIPRIANO	GONZALEZ	GARCIA	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE TELECOMUNICACIONES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
215	V	15020453	RICARDO	DE JESUS	DIAZ	MAZO	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
218	V	15040648	ALYANDRI	YAURIS	BARRETO	COLMENARES	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
230	V	15713570	LOREANA	ANILE	PEÑA	CABRERA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DIRECCION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
217	V	15025330	CAROLINA	ISABEL	ROMERO	GALINDEZ	1	1	UNIDAD DE APOYO	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
191	V	14176615	MARITZA	LUCIA	MENDOZA	ORTIZ	1	1	DEPARTAMENTO DE FINANZAS	AREA DE PLANIFICACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
659	V	6370144	MARIANELA		MARTINEZ	HERNANDEZ	2	4	DIRECCION OPSU	DIRECCION	suspendido	2	Personal Contratado Administrativo OPSU	0
188	V	14105250	JOSÉ	FRANCISCO	MATA		1	1	DEPARTAMENTO DE ESTADISTICA	DEPARTAMENTO DE ESTADISTICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
182	V	13736925	MARIA	DEL CARMEN	MARIN	FLORES	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
195	V	14299853	ALBA	ROSA	CASTILLO	RODRIGUEZ	1	1	UNIDAD ADMINISTRATIVA   	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
185	V	14032151	RIWARD	ALEXANDER	RIVAS	HERRERA	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
194	V	14277947	IRIS	MARBELY	RAMIREZ	BONILLA	1	1	DEPARTAMENTO DE FINANZAS	TESORERIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
214	V	14988355	EDITH	YOHANA	JIMENEZ	HERNANDEZ	1	1	UNIDAD ADMINISTRATIVA   	CONVENIO CUBA VENEZUELA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
229	V	15616436	EILYN	JOSEFINA	LICON	OVIEDO	1	3	CONSULTORIA JURIDICA	CONSULTORIA JURIDICA	egresado	1	Fijo Administrativo y Profesional OPSU	0
658	V	25964858	JUAN	CARLOS	SALAS	VALERA	2	3	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	egresado	2	Personal Contratado Administrativo OPSU	0
677	V	9062425	ERICK	\N	SERRANO	\N	4	2	\N	\N	\N	\N	\N	\N
179	V	13637643	SAHELY	COROMOTO	MARQUEZ	TOVAR	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
216	V	15021787	FREDDY	DANNY	ALVARADO	MORGADO	1	1	UNIDAD DE PROCESAMIENTO DE DATOS	COORDINACION DE TECNOLOGIA Y SERVICIOS DE INFORMACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
737	V	16562772	LUZ	\N	VILLALOBOS	\N	2	1	\N	\N	\N	\N	\N	\N
682	V	10401183	ANA	MARIA	BRICEÑO	GUTIERREZ	4	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
213	V	14934864	MONICA	MERCEDES	ROJAS	DURAN	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DIRECCION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
181	V	13736304	CAROL	DAYANA	AVILA	MONTERO	1	1	AUDITORIA INTERNA	AREA DE INGRESO Y DESARROLLO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
192	V	14201215	JUAN	ALEJANDRO	MOLINA	PEREZ	1	1	DEPARTAMENTO DE FINANZAS	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
184	V	13800727	EBERLIDES		GONZALEZ	ALVAREZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ATENCION AL CIUDADANO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
654	V	25847042	LUIS	ARTURO	PACHECO	VEGAS	2	3	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	egresado	2	Personal Contratado Administrativo OPSU	0
234	V	15805642	LEIDY	KATIUSKA	SILVA	VERGARA	1	1	UNIDAD ADMINISTRATIVA   	CONVENIO CUBA VENEZUELA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
183	V	13785882	LAUREN	CREISY	PEREZ	BARRAGAN	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
39	V	7104803	MARIANICER	CELINA	FIGUEROA	AGREDA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DIRECCION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
280	V	18190549	CARMEN	ELENA	VELASQUEZ	RODRIGUEZ	1	1	DEPARTAMENTO DE PERSONAL	AREA DE ADMINISTRACION DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
271	V	17643208	RAYMAR	TERESA	GARCIA	RODRIGUEZ	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
263	V	16971805	CESAR	AUGUSTO	DIAZ	JARAMILLO	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PLANIFICACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
244	V	16094036	ELVIO	ANGELO	BARCO	DE ABREU	1	1	UNIDAD ADMINISTRATIVA   	AREA DE CONTROL Y SEGUIMIENTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
219	V	15149316	GLORIA	ROSARIO	PEÑA	MARTINEZ	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
683	V	10799718	ERIKA	\N	BRICEÑO	\N	2	1	\N	\N	\N	\N	\N	\N
270	V	17342556	FELIX	GUSTAVO	INFANTE	DELGADO	1	1	UNIDAD ADMINISTRATIVA   	COMPRAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
267	V	17100907	FABIOLA	ANARELLYS	LOPEZ	PEREZ	1	1	AUDITORIA INTERNA	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
250	V	16358399	TAYRIN	BELEN	VILLEGAS	GONZALEZ	1	1	DEPARTAMENTO DE PERSONAL	AREA DE ADMINISTRACION DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
888	V	3809981	FRANCISCO	\N	MORENO	\N	2	1	\N	\N	\N	\N	\N	\N
256	V	16600807	JORGE	DANIEL	HERRERA	RANGEL	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
228	V	15615615	CARELY	JOANNA	PIÑA	CASTELLANOS	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
273	V	17652021	ANA	MARIA	DELGADO		1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	TESORERIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
248	V	16113564	DIANA	ROSA	MENDOZA	SANCHEZ	1	1	DEPARTAMENTO DE FINANZAS	TESORERIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
247	V	16113226	GEORGE	WINSTON	D ANGELO	GARCIA	1	1	CONSULTORIA JURIDICA	CONSULTORIA JURIDICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
272	V	17650717	KEMBERLY	YRENE	HERRERA	CHOURIO	1	1	UNIDAD ADMINISTRATIVA   	CONTABILIDAD	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
33	V	6909133	LIVIA		BARANDELA	DOMONTE	1	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
279	V	18154841	ROGER	JOSE	MONCADA	VARELA	1	1	UNIDAD ADMINISTRATIVA   	CONTABILIDAD	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
264	V	16972092	MAYERLING	JENIRE	CAMACHO	ZANELLA	1	3	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	egresado	1	Fijo Administrativo y Profesional OPSU	0
268	V	17167772	NOLIDES	YUQUENCIL	CASTRO	MORENO	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	TESORERIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
738	V	16081512	AMIRA	FLOR	URUETA	PEREZ	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	APOYO A LA COORDINACION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
266	V	17100067	EDELYS	YESENIA	OTERO	MARTINEZ	1	1	DEPARTAMENTO DE FINANZAS	TESORERIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
245	V	16094221	JOSMER	ALBERTO	SIBULO	GARCIA	1	1	DEPARTAMENTO DE FINANZAS	DEPARTAMENTO DE FINANZAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
356	V	12259796	INGRID	JOSEFINA	BRICEÑO	GONZALEZ	2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
254	V	16524658	BRIAXIS	EDMAR	MONSALVE	SOTO	1	1	UNIDAD ADMINISTRATIVA   	OFICINA DE PLANIFICACION Y PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
220	V	15152282	JAVIER	JESUS	GOITIA	ALFONZO	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE SOPORTE TECNICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
242	V	16033638	ALVARO	JOSE	GARCIA	GUZMAN	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE SOPORTE TECNICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
702	V	15403493	ALEXIS	DANIEL	GONZALEZ	HERNANDEZ	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
277	V	18042202	JOHAN	JOSE	RUJANO	VERDI	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	COORDINACION DE TECNOLOGIA Y SERVICIOS DE INFORMACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
258	V	16660118	BRIGITTE	DEL CARMEN	VELASCO	LEVI	1	3	DEPARTAMENTO DE FINANZAS	CAJA	egresado	1	Fijo Administrativo y Profesional OPSU	0
252	V	16433220	YESENIA	ELIZETH	MARTINEZ	RUIZ	1	1	DEPARTAMENTO DE ESTADISTICA	DEPARTAMENTO DE ESTADISTICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
241	V	16021312	ERICK	EDWARD	RAMIREZ	GUZMAN	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
274	V	17671640	ANGELA	NAYEILY	CARDOZA	APONTE	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
238	V	15843102	MONICA	YAMILET	FUENTES	BARRIOS	1	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
236	V	15842452	GLENNYS	MERCEDES	QUINTANA	APONTE	1	1	UNIDAD ADMINISTRATIVA   	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
257	V	16619437	JOHANA	CELESTE	COLEGIO	MORA	1	1	UNIDAD ADMINISTRATIVA   	DEPARTAMENTO DE FINANZAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
721	V	20871664	AQUILES	JOSE	POLO	UGARTE	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
703	V	15712796	HECTOR	MARTIN	POLI	LOPEZ	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE TELECOMUNICACIONES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
663	V	13968277	FREDDY	RENEE	MILANO	SANCHEZ	3	3	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	egresado	6	Obrero Fijo OPSU	0
307	V	3293645	ANA	ISABEL	ARANDA	MARQUEZ	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
664	V	12983813	NESTOR	DANIEL	ALVAREZ		3	3	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	egresado	6	Obrero Fijo OPSU	0
305	V	18493763	YEIMI	ADALI	GARCIA	GONZALEZ	1	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
285	V	18677911	KATHERINE	ARIANA	ROMERO	PEREZ	1	1	AUDITORIA INTERNA	CONVENIO CUBA VENEZUELA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
314	V	5148765	ISABEL		MEDINA	CUIÑAS	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
661	V	17078591	LIBERMAN	GREISSY	PEREZ	RODRIGUEZ	4	3	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	egresado	7	Obrero Contratado OPSU	0
284	V	18677815	OMAR	MANUEL	CRUZ	GUARAMATO	1	4	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE RELACIONES PUBLICAS	suspendido	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
306	V	4321366	ASALIA	RAMONA	VENEGAS	SIMANCAS	1	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
319	V	5565506	GUILLERMO	ANTONIO	LOPEZ	FIGUEREDO	1	1	UNIDAD ADMINISTRATIVA   	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
288	V	19064588	MADELEINE	ALEXANDRA	LAGARDERA	MARQUEZ	1	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE SOPORTE TECNICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
292	V	19685485	LUIS	GUILLERMO	GARCIA	MARTINEZ	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE CONTROL PRESUPUESTARIO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
317	V	5529917	FLOR	DE MARIA	MARTINEZ	GUERRA	1	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
289	V	19088363	FRANKLIN	SAMUEL	BOLIVAR	RODRIGUEZ	1	1	UNIDAD ADMINISTRATIVA   	AREA DE CONTROL Y SEGUIMIENTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
293	V	20033639	YOSEBETH	JUDITH	BLANCO	CLAVIJO	1	1	DEPARTAMENTO DE PERSONAL	AREA DE ADMINISTRACION DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
309	V	3967810	DELIA	MARINA	ROJAS	ROSAS	1	1	CONSULTORIA JURIDICA	CONSULTORIA JURIDICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
291	V	19493597	ALFREDO	MIGUEL	TOVAR	MARQUEZ	1	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
287	V	18751273	YOHENY	YETDELYS	FLAMEZ	HERNANDEZ	1	1	UNIDAD ADMINISTRATIVA   	TESORERIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
296	V	23689374	VIRGINIA	ORALYS	PEREZ	USECHE	1	4	CONSULTORIA JURIDICA	CONSULTORIA JURIDICA	suspendido	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
278	V	18088633	ERNESTO	JAVIER	FARFAN	HERNANDEZ	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	DEPARTAMENTO DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
297	V	6222439	ROSA	EMILIA	GONZALEZ	CAVANIER	1	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
283	V	18603828	CRISTOFER	YAEL	VARGAS	PEREIRA	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
316	V	5514102	MARTHA	ELENA	MUÑOZ	DE RAMIREZ	1	1	DEPARTAMENTO DE PERSONAL	DEPARTAMENTO DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
295	V	22990464	IVAN	MARAT	AGUILERA	GOMEZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
286	V	18708159	AMBAR		CARVALLO	MENONES	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE RELACIONES PUBLICAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
262	V	16954183	ZUDANY	DEL VALLE	SEVILLA	BANDEZ	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
660	V	11277441	JHON	JAME	RODRIGUEZ	VIEZ	2	4	DEPARTAMENTO SERVICIOS GENERALES	DIRECCION	suspendido	2	Personal Contratado Administrativo OPSU	0
255	V	16557799	RICHARD	JOSE	PARADA	SILVA	1	1	UNIDAD ADMINISTRATIVA   	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
662	V	15324758	MAIKEL	EDWARD	CASTILLO	ACASIO	3	3	DEPARTAMENTO SERVICIOS GENERALES	AREA DE REPRODUCCION	egresado	6	Obrero Fijo OPSU	0
251	V	16411405	LEOYMAR	ANACRIST	ROJAS	BORGES	1	1	UNIDAD ADMINISTRATIVA   	CONVENIO CUBA VENEZUELA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
739	V	16266748	CARLOS	ROBERTO	FEBRES	MARTOS	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	APOYO A LA COORDINACION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
766	V	6887572	CELIA	MARGARITA	PORTILLO	FONSECA	8	3	DIRECCION OPSU		egresado	3	Comisión de Servicios OPSU	0
298	V	6365024	ELBA	JOSEFINA	RUIZ	RAMIREZ	7	1	JUBILADOS Y PENSIONADOS OPSU	UNIDAD DE EVALUACION, NUCLEOS Y PROYECTOS	activo	4	Jubilado Administrativo	0
300	V	6439558	MARISOL	VIRGINIA	VIVAS	RUIZ	1	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
333	V	21323104	GABRIELA	ESTEFANIA	MUJICA	MUNDARAY	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
336	V	6020773	MORELLA	JOSEFINA	ROMERO	LAMEDA	2	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
355	V	12057238	THAMARA	JOSEFINA	LEON	GARCIA	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONVENIO CUBA VENEZUELA	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
302	V	12737125	MARIA	DE JESUS	TOVAR	ALVARADO	1	1	S.P - DIRECCION	OFICINA DE ASUNTOS LABORALES	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
321	V	6895998	YUBIRY	DEL VALLE	TOVAR	ROJAS	1	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
337	V	2958517	CARMEN		CHIRINOS	CABRERA	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE PLANIFICACION Y PRESUPUESTO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
299	V	6524757	ARELIS	DE LOS REYES	RIVERO	ABREU	1	1	S.P - DIRECCION	UNIDAD DE EVALUACION, NUCLEOS Y PROYECTOS	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
338	V	24656624	GUILLERMO		LENGEMANN	GARCES	2	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
330	V	6309107	ZULEYMA	ANGELICA	MILLAN	SALAZAR	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DEPARTAMENTO DE FINANZAS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
332	V	19498554	GABRIEL	DAVID	ROJAS	DIAZ	2	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5102	Bono de Alimentación del Personal Administrativo Contratado de SP	1
313	V	4883432	LIGIA	COROMOTO	GARCIA	FERRER	1	1	DEPARTAMENTO DE DOCUMENTACION E INFORMACION	CENTRO DE INFORMACION Y DOCUMENTACION EN EDUCACION SUPERIOR (CENIDES)	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
353	V	11941085	ANDRES	AGUSTIN	PEREZ	RODRIGUEZ	2	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
325	V	2970327	MARIA	AUXILIADORA	RIVAS	DE BOADA	2	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5102	Bono de Alimentación del Personal Administrativo Contratado de SP	1
740	V	16670811	JAN	PIERRE	GUDIÑO	CISNEROS	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE TELECOMUNICACIONES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
685	V	11644594	DOUGLAS	YOMAR	GIL	REGALADO	4	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
354	V	12043363	BETSY	GUIOMAR	BETANCOURT		2	1	DEPARTAMENTO DE PERSONAL	DEPARTAMENTO DE PERSONAL	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
352	V	11820188	EUNICE	RAQUEL	CARIDAD	TORRES	2	1	DIRECCION OPSU	AREA DE PLANIFICACION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
889	V	10812609	RUBEN	\N	PAEZ	\N	2	1	\N	\N	\N	\N	\N	\N
322	V	5824588	GLEDIS	LUCIA	RITO		1	1	UNIDAD ADMINISTRATIVA   	AREA DE CONTROL Y SEGUIMIENTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
329	V	6442288	NOREIDA	ISABEL	RODRIGUEZ	CONCEPCION	2	1	DEPARTAMENTO DE ESTADISTICA	DEPARTAMENTO DE ESTADISTICA	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
350	V	10110178	NELLY	DEL CARMEN	VEGA	PANZA	2	1	UNIDAD ADMINISTRATIVA   	COMPRAS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
351	V	10665577	VERONICA	JOSEFINA	ROLDAN	RAMIREZ	2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
18	V	6436745	OLGA	YOMAIRY	GONZALEZ	OBELMEJIAS	1	1	DEPARTAMENTO DE DOCUMENTACION E INFORMACION	CENTRO DE INFORMACION Y DOCUMENTACION EN EDUCACION SUPERIOR (CENIDES)	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
334	V	23000553	GENESIS	ELISA	IZARRA	TENIA	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	AREA DE BIENES NACIONALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
301	V	9459262	MARINEXI	JOSE	NORIEGA		1	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
328	V	25639340	KAREN	MILAGROS	JOTA	PERDOMO	2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
767	V	6523782	JUAN	EDUARDO	MALAVE		8	3	DEPARTAMENTO SERVICIOS GENERALES		egresado	3	Comisión de Servicios OPSU	0
343	V	19998404	CARLA	DANIELA	PEREZ	PORTILLO	2	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE SOPORTE TECNICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
344	V	6527842	NELIDA	MARIBEL	PRIETO	DE LINARES	2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
348	V	9416655	BELKIS	DEL CARMEN	HERNANDEZ	CARRILLO	2	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
347	V	8794549	TAHIDEE	MARGARITA	RUIZ		2	1	DIRECCION OPSU	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
346	V	7454285	LUIS	BELTRAN	ARANGU	LOBIG	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ATENCION AL CIUDADANO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
345	V	7265766	ELIS	ALBERTO	TORRES	PEREZ	2	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
359	V	12484277	RAQUEL	ARGELIA	GIL	LARA	2	1	UNIDAD ADMINISTRATIVA   	COMPRAS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
385	V	17116937	SAMUEL	ADOLFO	CASTILLO	YELAMO	2	1	TECNOLOGIA Y SERVICIOS DE INFORMACION	DEPARTAMENTO DE SOPORTE TECNICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
377	V	16738074	ALBERTO	JOSE	FORERO	MOLINA	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
366	V	13951619	ELMYS	DEL VALLE	MEDINA	APONTE	2	1	DEPARTAMENTO DE ESTADISTICA	UNIDAD DE APOYO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
375	V	16668300	EVELYN	CAROLINA	PALACIOS	CASTILLO	2	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
381	V	6324079	RUBEN	DARIO	GRATERON	RODRIGUEZ	2	1	UNIDAD ADMINISTRATIVA   	AREA DE CONTROL Y SEGUIMIENTO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
770	V	6201396	ABIEZER	JOSE	GUARECUCO	ALCALA	8	1	DEPARTAMENTO DE PERSONAL	DEPARTAMENTO DE PERSONAL	activo	3	Comisión de Servicios OPSU	0
340	V	3891017	MERCEDES	JUDY	ALCINA	PARRA	2	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
389	V	18304797	ALFREDO	LUIS	CONTRERAS	LOPEZ	2	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
364	V	13530077	OSWALDO	EMILIO	RODRIGUEZ	MORILLO	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
686	V	11682477	YAZNEL		MONTOYA	DURAN	1	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE TELECOMUNICACIONES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
890	V	13583334	MAGDA	\N	GARCIAZ	\N	2	1	\N	\N	\N	\N	\N	\N
379	V	17270094	MARCOS	RUBEN	GARCIA	DE LOS RIOS	2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
370	V	15505002	JEAN	CARLO	MEJIAS	SANCHEZ	2	1	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE ATENCION AL CIUDADANO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
384	V	17100261	KENNY	DAVIS	SENA	MOLINA	2	1	DEPARTAMENTO DE PERSONAL	AREA DE ADMINISTRACION DE PERSONAL	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
705	V	15827217	EDUARDO	JAVIER	MENDOZA	ARAUJO	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
386	V	17219864	JENNIFER	ZULAY	RIVERO	SANCHEZ	2	1	DEPARTAMENTO DE DOCUMENTACION E INFORMACION	UNIDAD DE APOYO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
390	V	17691344	KARINA	KORAYA	PRATO	APONTE	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
339	V	17483148	YULISBHET		PEREZ	NUÑEZ	2	3	SECRETARIADO PERMANENTE	SECRETARIADO PERMANENTE	egresado	1002	Personal Contratado Administrativo SP	0
365	V	13730155	MELVIS	ROSS	LOPEZ	MONTILLA	2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
388	V	18269945	ALI	CARLOS	ARGUINZONES	LUGO	2	1	DIRECCION OPSU	DEPARTAMENTO DE SOPORTE TECNICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
368	V	15161012	NAKARI	LORENA	MALAVE	RODRIGUEZ	2	1	UNIDAD ADMINISTRATIVA   	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
378	V	16900505	JUAN	JOSE	ESPINOZA	VIERA	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CENTRO DE INFORMACION Y DOCUMENTACION EN EDUCACION SUPERIOR (CENIDES)	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
741	V	16964618	MIGUELANGEL		DIAZ	GUEDEZ	2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
371	V	15562772	LUZ	MARINA	VILLALOBOS		2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
373	V	16084802	MAIKEL	RAFAEL	MORENO	YEPEZ	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ATENCION AL CIUDADANO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
722	V	22666134	BARBARA	DEL VALLE	MARIN	RIERA	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA		activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
382	V	17388993	YOFRE	ALI	GUTIERREZ	VELASCO	2	1	UNIDAD ADMINISTRATIVA   	OFICINA DE PLANIFICACION Y PRESUPUESTO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
768	V	6356378	MERCEDES	JOSEFINA	ECHARRY	SILVA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
11	V	6260515	MARYORIE		MOLINA	VASQUEZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
362	V	13245569	ARMANDO	JOSE	QUIJADA	VILLARROEL	2	1	UNIDAD ADMINISTRATIVA   	CAJA	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
361	V	12640540	DANIEL	ARMANDO	BARRIOS	RODRIGUEZ	2	1	DEPARTAMENTO DE FINANZAS	DEPARTAMENTO DE FINANZAS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
769	V	6205368	ERNESTO	JOSE	TRIAS	ORTIZ	8	3	DEPARTAMENTO DE PERSONAL		egresado	5003	Bono de Alimentación del Personal en Comisión de Servicios en OPSU	1
360	V	12623777	XORELIS	JESUS	GUZMAN	MENDOZA	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
7	V	6155020	NANCY	MARGARITA	ITRIAGO	BECERRA	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
323	V	5971817	ROSA	MILAGROS	GARCIA	AGUILERA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ATENCION AL CIUDADANO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
395	V	18165098	LUISANA	ROSELI	YANEZ	PIÑERO	2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
415	V	19453867	JHILMARY	ELENA	RAGA		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
771	V	6150000	GUILLERMO	ENRIQUE	SANCHEZ	GOLDING	8	3	CONSULTORIA JURIDICA		egresado	3	Comisión de Servicios OPSU	0
409	V	19711619	YURBY	CAROLINA	TORRES	BETANCOURT	2	1	UNIDAD ADMINISTRATIVA   	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
706	V	16217295	DANIEL	\N	BORRERO	\N	2	1	\N	\N	\N	\N	\N	\N
404	V	19388122	ANDREA	ESTEFANIA	TOVAR	TOVAR	2	1	TECNOLOGIA Y SERVICIOS DE INFORMACION	COORDINACION DE TECNOLOGIA Y SERVICIOS DE INFORMACION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
402	V	18809911	AIDELYS	ARKARANTAIR	REQUENA	MACHADO	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
406	V	19305766	DORIANA		FERNANDEZ	GARCIA	2	1	UNIDAD ADMINISTRATIVA   	COMPRAS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
777	V	5969519	ANDRES		ACOSTA	HERNANDEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
412	V	20175633	JOSELYN	NAILET	RODRIGUEZ	RODRIGUEZ	2	1	UNIDAD ADMINISTRATIVA   	COMPRAS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
416	V	19508714	JHONATAN	ALEXANDER	RORDAN	BORJAS	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
723	V	20171157	FERKELIN	\N	REYES	\N	2	1	\N	\N	\N	\N	\N	\N
401	V	18605300	JESMARY	JULIANDRY	MORA	ESTRADA	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
393	V	17968931	KRYSTELL	MERCEDES	MANOSALVA	RODRIGUEZ	2	1	DEPARTAMENTO SERVICIOS GENERALES	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
419	V	6095057	JOSE	GREGORIO	LONGA		3	1	SECRETARIADO PERMANENTE	SECRETARIADO PERMANENTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
400	V	18466890	DARRIN	JOSÉ	PAREDES	THIELEN	2	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
420	V	4420466	RAUL	ALFONSO	SANCHEZ	MARQUEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
775	V	6023176	ROBERT	GUSTAVO	GONZALEZ	SUAREZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	8	Obrero Jubilado	0
392	V	17908174	NILSON	ROBERTO	PEREZ	GUERRERO	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
2	V	18933355	JOHANA	ALEXANDRA	SOTILLO	MEDINA	2	1	DIRECCION OPSU	AREA DE BIENESTAR SOCIAL	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
422	V	6246991	JUAN	ISAER	ALFONZO	YANEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
399	V	18443825	ELIOMAR	ANTONIO	ARAUJO	CUMARIN	2	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
410	V	19739356	NELSY	YOHALIN	FERNANDEZ	SOTO	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
398	V	18405387	RUT	DANIELA	DIAZ	ALVAREZ	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
394	V	17981824	RAFAEL	ALBERTO	MARTINEZ	LUNA	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
397	V	21283170	MARIA	ALEJANDRA	CARRILLO	POLO	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
408	V	19472119	EDGAR	ALEXANDER	CARRERA	MEDRANO	2	1	DIRECCION OPSU	DEPARTAMENTO DE ESTADISTICA	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
413	V	20592214	MARIALBER		TERAN	RODRIGUEZ	2	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
407	V	19406897	NELSON	JOSE	GRATEROL	GAMEZ	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
742	V	16994075	CARLOS	LUIS	GUERRA	CASTRO	1	1	DIRECCION OPSU	COMPRAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
772	V	6116088	NANCY	MARINA	AZUAJE	ARTEAGA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
424	V	13069732	ALEXANDER	JOSE	TOLEDO		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
773	V	6092496	OMAIRA	BEATRIZ	FRIAS	SILVA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
774	V	6051129	EDNA	YADIRA	ALONZO	GONZALEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
687	V	11820231	YADIRA	JOSEFINA	VIÑA	VILLAVICENCIO	4	1	SECRETARIADO PERMANENTE	SECRETARIADO PERMANENTE	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
776	V	6004649	YONAYDE		MARTINEZ	REQUENA	8	1	CONSULTORIA JURIDICA	CONSULTORIA JURIDICA	activo	3	Comisión de Servicios OPSU	0
423	V	11671332	NORIS	MARIA	SALAVERRIA		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
707	V	16472023	GERMAN	JOSE	QUINTERO	JAIMES	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
449	V	13087900	IVAN	JESUS	LOYO	CABRERA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
462	V	15540261	CARLOS	MOISES	HERNANDEZ	MESSUTI	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
491	V	12097728	DANIEL	ALBERTO	DANIEL	JIMENEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
441	V	9641888	LISANDRO	ARGENIS	AMUNDARAIN	PEREZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
318	V	5543978	JAVIER	HILARIO	MADRID	RUJANO	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
437	V	9173181	LUIS	ALFONSO	MENDOZA	ARAUJO	3	3	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	egresado	6	Obrero Fijo OPSU	0
455	V	13642431	MARIA	MERCEDES	RUMBOS	BRICEÑO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
438	V	9462224	JESUS	ALFONSO	BOHADA		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
779	V	589597	JUAN	JOSE	MILLAN	VILLEGAS	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
460	V	14585931	MARLIN	MAYBE	MUJICA	FRIAS	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
461	V	15453626	FERNANDO	JOSE	DIAZ	MALPICA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
428	V	6114204	OSCAR	JOSE	BENITEZ	SOLANO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
464	V	15724330	ELVIS	JAVIER	MARQUEZ	LICETT	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
453	V	13564429	YOSELIN	YUSMEL	GUILLEN	CARRIZALES	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
432	V	6872370	WILLIAM	JOSE	SOSA	VELAQUEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
447	V	12975456	MITCHEL	ALEXANDER	RUIZ	GONZALEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
429	V	6149999	ALEJANDRO	NESTOR	SANCHEZ	GOLDING	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE REPRODUCCION	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
688	V	12090450	FRANCAR		MARTINEZ	RANGEL	1	1	DIRECCION OPSU	DIRECCION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
781	V	5565507	ENIO	ANTONIO	LOPEZ	FIGUEREDO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
724	V	22785399	JOSNEL	ARMANDO	AQUINO	CORREIA	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
444	V	11474096	YOVANNI	RAMÓN	LOYO	CABRERA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
504	V	10377898	CARLOS HERNAN		GARCIA	PERDOMO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
778	V	5960652	SANDRA	JOSEFINA	PIÑATE		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
430	V	6671395	BELKIS	JOSEFINA	RAUSEO	ESPINOZA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
451	V	13380296	PABLO	ALEJANDRO	GUTIERREZ	ACOSTA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
459	V	14546634	ALBERT	JOEL	MIRANDA	SANDOVAL	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
457	V	14198444	LEONARDO	JOSE	FERNANDEZ	FERNANDEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
443	V	10056021	YONI	ALBERTO	DURAN	MARIN	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
445	V	11602033	LUIS	ENRIQUE	URBINA	OSES	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
440	V	9482922	JOSÉ	GREGORIO	RONDON	SANCHEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
436	V	9098555	YTSVAN		BRICEÑO	MOLINA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
452	V	13537729	MITCHELL	ANTONIO	RODRIGUEZ	HERRERA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
450	V	13176194	DOUGLAS	LUIS	HERRERA	GUANIPA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
780	V	5594203	NANCY	DEL VALLE	MORENO	GONZALEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
434	V	7954059	JOSE	GREGORIO	BELLO	CHAVEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
433	V	7660701	NELSON	RAMON	CASTILLO	CAMACARO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
431	V	6792914	OMAR	ENRRIQUE	TORRES	MANRIQUE	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
472	V	18818668	DERVIS	ARMANDO	CANELON	MARQUEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
499	V	18368649	SIXTA	CAROLINA	GONZALEZ	RODRIGUEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
784	V	5221710	HUMBERTO	JOSE	GONZALEZ	SILVA	8	4	DIRECCION OPSU		suspendido	3	Comisión de Servicios OPSU	0
503	V	18235895	SABRINA	ISABEL	RIBAS		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
469	V	18110969	ROBINSON	DANIEL	COLEGIO	MORA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
477	V	21494853	ORFINELY		CASTAÑO	LOPEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
492	V	12358589	JOSE	ALEXANDER	VARGAS	HERNANDEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
538	V	10180539	GUSTAVO	JESUS	RICO	COLMENARES	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
498	V	17529292	PABLO	DANIEL	MAIQUETIA	MONTES	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
725	V	82024842	RUI	ROBERTO	JAQUES	DE NOBREGA	4	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
485	V	6347287	NIOSOTY	ELENA	BLANCO	DE VENEGAS	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
494	V	12616096	DENNYS 	ALBERTO	VELASCO	GODOY	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
483	V	6318918	ROSAICELA		PAREDES	DE MORENO	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
473	V	19314129	KENNY	RUBEN	GUERRERO	LOPEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
470	V	18446729	YORKY	YONEIRY	MORILLO	ANTIGUA	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
484	V	6342807	DAVID	ALEXANDER	COLMENARES	PINTO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
501	V	17975012	LEVIS	ALEXIS	BARRAGAN	CASSIANI	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
514	V	12500087	DAVIS	RAFAEL	ROJAS	BOHADA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
467	V	16276679	FRANKLIN	ANTONIO	ALVAREZ	FUENTES	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
482	V	6271840	CESAR	AUGUSTO	TOVAR	GARCIA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
744	V	17961468	GILBERTH	ALBERTO	TORRES	BRACHO	4	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
785	V	5216629	MARIA	TERESA	SALVATO	FERRARA	8	4	PROGRAMA ADMINISTRATIVO FINANCIERO		suspendido	3	Comisión de Servicios OPSU	0
489	V	11750148	YULMER	JOSE	GONZALEZ	MALDONADO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
426	V	5424492	TEOLINDA		JAIME		3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
476	V	21070408	WILL	EDISON	RONDON	LAREZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
496	V	16618819	RAINIER	ALEJANDRO	MOLINA		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
474	V	19734181	SORANGEL		ESPEJO	PIÑANGO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
486	V	6457007	JOSÉ	LUIS	MONTAÑA	BETANCOURT	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
505	V	10505438	CARLOS	ALEXIS	GARCIA	GIL	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
493	V	12377500	YILLMAN	DANIEL	ROSALES		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
782	V	5529905	CARMEN	ROSA	BUITRAGO	CASERES	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
512	V	12292680	JESUS	LEONARDO	WAGNER	ALBUJAS	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
783	V	5229751	MARLENE	ISABEL	GUANCHEZ		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
891	V	16672899	DAVID	\N	ARANGO	\N	2	1	\N	\N	\N	\N	\N	\N
487	V	8570544	ROSA	ARGELIA	CAUCHO	LINERO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
488	V	8636506	DORIS	MARGARITA	RODRIGUEZ	ARENAS	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
533	V	8935179	NELLYS	DEL JESUS	GUERRA	DE MATA	3	1	SECRETARIADO PERMANENTE	SECRETARIADO PERMANENTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
520	V	2719509	DOMINGO	ANTONIO	LIENDO	APONTE	7	1	JUBILADOS Y PENSIONADOS OPSU	AREA DE CORRESPONDENCIA	activo	8	Obrero Jubilado	0
546	V	12954651	NELSON	ALEXIS	MORENO	GONZALEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE BIENES NACIONALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
528	V	5105814	CARLOS	JOSE	VENEGAS	SIMANCAS	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
690	V	12687863	FRANKLIN	\N	OLIVEROS	\N	4	1	\N	\N	\N	\N	\N	\N
518	V	19254845	JOHAN	JOSE	RODRIGUEZ	CAMACHO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
509	V	11946152	RENZO	JAVIER	LANDAETA	RIVALDO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
531	V	6389984	NELSON	JESUS	OCHOA	MADRID	3	1	SECRETARIADO PERMANENTE	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
709	V	16555331	EDIXON	GREGORIO	MORENO		2	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5102	Bono de Alimentación del Personal Administrativo Contratado de SP	1
545	V	12890425	ALICIA	DEL SOCORRO	DURAN	DE NARVAEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
536	V	9961559	HENRY	RAFAEL	GAMBOA	CASTILLO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
787	V	5012641	ELBA	MARGARITA	MARTINEZ	ZAPATA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
559	V	19091802	RONALD	JOSE	GARCIA	RODRIGUEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
508	V	11031026	EMILIO	RAMON	MONCADA	CORRALES	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE REPRODUCCION	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
547	V	14407215	CARLOS	ISIDRO	SANTANA	GARCIA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
745	V	18269190	EMILY	SARAHY	DELGADO	GONZALEZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
511	V	12068596	SOLEDAD	MARGARITA	VILLARROEL	SULBARAN	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
788	V	4884180	JESUS	ALBERTO	MUNAR		12	1	JUBILADOS Y PENSIONADOS OPSU		activo	5	Pensionado Administrativo	0
510	V	11991059	NILMAR	MAUREGINE	GONZALEZ	CLEMENTE	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
562	V	16924610	VANESSA	CAROLI	ROJAS	LANZ	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
535	V	9525887	ELIO	FRANCISCO	CABRERA	LEAL	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
527	V	2026392	LUIS	RAMON	GONZALEZ		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
519	V	13489579	FILIBERTO	EDUARDO	SALAS	CABRERA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
537	V	9995985	WILLIANS	JOSE	ROMAN	MARTINEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
526	V	5417348	EGUI	EDUARDO	JAIMES	RAMIREZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
534	V	9457512	JOSE	LUIS	SALAMANCA	ALCANTARA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
517	V	18829906	MARYORIE	PENELOPEZ	MORA	ARTEAGA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
578	V	11938196	HERMARY		RIVERA	LUCENA	8	1	DIRECCION OPSU	DIRECCION ADJUNTA	activo	3	Comisión de Servicios OPSU	0
515	V	14411623	ERIKA		RIVAS	PIÑANGO	3	1	SECRETARIADO PERMANENTE	SECRETARIADO PERMANENTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
342	V	5216178	ADILIA	ANTONIETA	GUZMAN		2	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
543	V	11201905	JAIRO	YIMI	RODRIGUEZ	RUIZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
575	V	10659529	HERMINIA	MARGARITA	HIGUERA	COELLO	8	1	DIRECCION OPSU	DIRECCION	activo	5003	Bono de Alimentación del Personal en Comisión de Servicios en OPSU	1
548	V	13456067	JOHANA	ROSSALY	HURTADO		3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
542	V	10404722	RAFAEL	EDUARDO	GARCIA	PADRON	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
522	V	6446206	JOSE	ANTONIO	GARCIA	YANEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE REPRODUCCION	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
530	V	6233027	LOIDES	MARIA	GOMEZ	DE OCHOA	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
786	V	5113364	MARIA	DEL PILAR	THEOKTISTO	COSTA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
540	V	10314859	CARLOS	LUIS	VALERA	VALLES	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
539	V	10229734	PEDRO	RAFAEL	ORTEGA	DELGADO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
525	V	5136208	CARLOS	ALBERTO	RUIZ		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
727	V	6121337	JUAN	ALBERTO	BRICEÑO	MONCADA	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
746	V	18816822	NAYVIER	ALEXANDRA	RIERA	ROSARIO	2	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5102	Bono de Alimentación del Personal Administrativo Contratado de SP	1
556	V	22752558	DARWIN	GONZALO	CASTRO	LOPEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
573	V	16913881	YHONNY	ALEXANDER	OROPEZA	RODRIGUEZ	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
574	V	14642153	EULALIA		TABARES	ROLDAN	8	1	DIRECCION OPSU	DIRECCION	activo	3	Comisión de Servicios OPSU	0
568	V	9316591	NORMA	COROMOTO	ARAUJO	MALDONADO	4	1	SECRETARIADO PERMANENTE	SECRETARIADO PERMANENTE	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
524	V	4850677	LUIS	HERIBERTO	GORRIN		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
565	V	24222144	DIONIS	JESUS	QUIJADA	TERAN	4	1	SECRETARIADO PERMANENTE	SECRETARIADO PERMANENTE	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
315	V	5465248	DIANA	GRACIELA	SUAREZ		2	1	PROGRAMA ADMINISTRATIVO FINANCIERO	PROGRAMA ADMINISTRATIVO FINANCIERO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
567	V	20911814	RAYNIER	ALI	RUIZ		4	1	SECRETARIADO PERMANENTE	SECRETARIADO PERMANENTE	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
554	V	17117078	ALBERTO	JOSE	GUEVARA	SALAZAR	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
552	V	17142489	DEMIS	WUINDER	DURAN	JIMENEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
570	V	10489549	PABLO	JESUS	HERNANDEZ		4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
550	V	16147184	JAIRO	ALEXANDER	BAEZ	DELGADO	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
425	V	8982445	CARMEN	MAGDALENA	UBAN	MARCANO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
123	V	11895933	EDGAR	ALEXANDER	DELGADO	GONZALEZ	1	1	UNIDAD ADMINISTRATIVA   	AREA DE CONTROL Y SEGUIMIENTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
569	V	18913900	REINALDO		SANTANA	GARCIA	4	3	SECRETARIADO PERMANENTE	SECRETARIADO PERMANENTE	egresado	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
564	V	17742242	OSCAR	ENRIQUE	SILVA	GONZALEZ	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
710	V	16822284	LINMAR	JOSE	OVIEDO	GONZALEZ	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
549	V	13804304	MARIA	ELISA	ZERPA	RAMIREZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
571	V	15098766	GABRIEL	ALBERTO	PERDOMO	SOLANO	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
691	V	12828656	YEN	MARGARITA	MARTINEZ	MARTINEZ	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE TELECOMUNICACIONES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
555	V	19587297	JOHAN	JOSE	LION	DELGADO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
358	V	12342624	MARIA	ALEJANDRA	ALVAREZ	CADENAS	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
435	V	8499167	ARTURO	RAFAEL	TABARE	SALAZAR	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
495	V	12833259	JORGE	ELIAS	TEJADA	NAVA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
560	V	19462451	JEFFERSON	JOSE	ANGEL	ANDRADE	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
3	V	13260674	BELKIS	YASMIN	NUÑEZ		1	1	AUDITORIA INTERNA	AREA DE CONTROL Y SEGUIMIENTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
521	V	4813244	MANUEL	SALVADOR	PALENCIA	PEÑA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
576	V	10536032	GEORLEXANDRA	GABRIELA DEL VALLE	DIAZ		8	1	OFICINA DE PLANIFICACION Y PRESUPUESTO	OFICINA DE PLANIFICACION Y PRESUPUESTO	activo	3	Comisión de Servicios OPSU	0
789	V	4813874	AURA	LETICIA	SANCHEZ		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
672	V	4731864	MIGUEL	RAMON	SIRA		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
790	V	4678271	MARIA	ANGELICA	BORGES		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
791	V	4630048	EUDOXIA		ALMEIRA	TAPIAS	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	8	Obrero Jubilado	0
810	V	3716235	EVE	JULIAAP	MORA	APARICIO	12	1	JUBILADOS Y PENSIONADOS OPSU		activo	5	Pensionado Administrativo	0
811	V	3665133	ANA	LUISA	CAMPO	YALLONARDO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
35	V	6967566	MARIA	ANGELA	CARRABBIA	CASTELLANOS	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
369	V	15395270	VANESSA	ALEJANDRA	RIVERO	PEPE	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
310	V	4021965	HILDA		AYAACH	DE RAMIREZ	1	1	UNIDAD ADMINISTRATIVA   	OFICINA DE PLANIFICACION Y PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
728	V	6309100	JUAN	DE DIOS	COLMENARES	DIAZ	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
668	V	12917958	ERNESTO	ELIAS	GUEVARA	HIJUELO	8	3	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	egresado	3	Comisión de Servicios OPSU	0
249	V	16300748	JOSE	ANTONIO	BRICEÑO	BOADA	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
173	V	13533901	MELVIN	JOSE	TORRELLES	RUDA	1	1	UNIDAD ADMINISTRATIVA   	TESORERIA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
747	V	20655977	MACGYVER	JOSE	GALVAN	TORRADO	2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
666	V	26818835	DIEGO	ANDRES	SANCHEZ	GARCIA	4	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	7	Obrero Contratado OPSU	0
99	V	10825894	CAROL	FABIOLA	ARMAO	GALINDEZ	1	1	UNIDAD DE PROCESAMIENTO DE DATOS	COORDINACION DE TECNOLOGIA Y SERVICIOS DE INFORMACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
667	V	11034180	GREGORIO	DE JESUS	RIVERA	ANDRADE	4	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	7	Obrero Contratado OPSU	0
326	V	15293631	NISBETH	ANDREINA	PACHECO	TORRES	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
523	V	4474563	RAFAELA	COROMOTO	FIGUEREDO	SALAZAR	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
391	V	17692827	YORVIN	JOHAN	CARRERO	NOVOA	2	1	UNIDAD ADMINISTRATIVA   	AREA DE CONTROL Y SEGUIMIENTO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
38	V	7005459	CARMEN	ALICIA	RAMIREZ	BECERRA	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
54	V	9061788	MARISOL		VENEGAS	SIMANCAS	1	1	DEPARTAMENTO DE DOCUMENTACION E INFORMACION	UNIDAD DE EVALUACION, NUCLEOS Y PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
665	V	6550937	BARBARA	MERCEDES	LOPEZ	SALAZAR	4	3	SECRETARIADO PERMANENTE	SECRETARIADO PERMANENTE	egresado	7	Obrero Contratado OPSU	0
711	V	16882473	HECSOR	RENNE	BARAZARTE	NEGRON	2	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
224	V	15379638	MARIANGEL		MENDOZA	SANTIN	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
189	V	14127902	ERNESTO	JESUS	DIAZ	AZUAJE	1	3	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	egresado	1	Fijo Administrativo y Profesional OPSU	0
500	V	18403805	LUIS	GILBERTO	GONZALEZ	BOLET	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
260	V	16715155	CARMEN	CECILIA	OLMOS	PEREZ	1	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
414	V	14548483	FABIOLA	PATRICIA	MILANO	SANCHEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
197	V	14362494	BRYAN	ERMILO	PIMENTEL	VILLARROEL	1	1	DEPARTAMENTO SERVICIOS GENERALES	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
211	V	14757134	MARBELIN	ELOISA	RODRIGUEZ	MOSCO	1	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
692	V	13034387	ROSIBEL	CAROLINA	ASUAJE	BRICEÑO	1	1	AUDITORIA INTERNA		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
669	V	16605808	CESAR	EDUARDO	CARRERO	ARISTIZABAL	8	3	DIRECCION OPSU	DIRECCION ADJUNTA	egresado	3	Comisión de Servicios OPSU	0
557	V	25917312	MARIO	ENRIQUE	VELASQUEZ	MARTINEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
363	V	13406014	LENIN	EDUARDO	MARCANO	NAVAS	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE RELACIONES PUBLICAS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
77	V	10339906	ANA	MARIA	ALVES	SILVA	1	1	UNIDAD ADMINISTRATIVA   	AREA DE CONTROL PRESUPUESTARIO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
456	V	13676139	JESUS	ANDERSON	MALDONADO	RANGEL	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
792	V	4614772	BETSY	MAGDALENA	RAMIREZ	GONZALEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
387	V	17587669	DAVID	DANIEL	DUBS	URBINA	2	3	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	egresado	2	Personal Contratado Administrativo OPSU	0
239	V	15881665	LEYSLY	KAFRIRY	MIRANDA	TARAZONA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE RELACIONES PUBLICAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
269	V	17267836	GRISEL	MELISSA	DAVILA	LINARES	1	1	DEPARTAMENTO DE PERSONAL	AREA DE ADMINISTRACION DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
237	V	15842896	ORIZEL	YAIRI	HERNANDEZ	NAVAS	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
586	V	6219356	BELKIS	MORAIMA	CASTILLO	MARTINEZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
232	V	15795455	NACOR	MAURICIO	GUERRERO	PRIETO	1	4	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE SOPORTE TECNICO	suspendido	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
320	V	5567084	YANIXA	MARIA	MORANTE	TINEO	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	AREA DE BIENESTAR SOCIAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
162	V	13139226	WILMER	JOSE	GLAFFO	MIRANDA	1	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
582	V	24664482	OSWARD	HUMBERTO	PINTO	CASTILLO	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
597	V	24288850	JHON	MANUEL	VILLADIEGO	BLANCO	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
593	V	23616646	NORELIS	DEL VALLE	MARIN	SOTO	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
591	V	20087662	EFRAIN	JOSE	REBOLLEDO	PERALTA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
797	V	4299474	CARLOS	JOSÉ	RODRIGUEZ		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
584	V	24336756	DALIANA	BETANIA	BONILLA	BONILLA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
311	V	4251278	BAYSE		ALFONZO	RODRIGUEZ	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	PROGRAMA ADMINISTRATIVO FINANCIERO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
588	V	14729399	LUIS	ALEJANDRO	SISO	GIL	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
592	V	21516410	MARIANA	LEONOR	CONTRERAS	QUINTERO	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
590	V	19452505	JOSE	ANGEL	SOJO	ACOSTA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
324	V	6047666	SEGUNDO	RAFAEL	CARABALLO	SALAZAR	1	4	AUDITORIA INTERNA	AREA DE CONTROL Y SEGUIMIENTO	suspendido	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
712	V	17266678	NELMAR	ELENA	MEZA	PARRA	1	1	DEPARTAMENTO DE FINANZAS	DEPARTAMENTO DE FINANZAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
795	V	4436714	DYLIS	MARGARITA	ROMERO	RAMIREZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
693	V	13136823	FELIX	RICARDO	RODRIGUEZ	IZAGUIRRE	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
748	V	20792675	EDUARD	\N	VALERO	\N	2	1	\N	\N	\N	\N	\N	\N
598	V	16474198	ERIKA	MARIA	ALVARADO	DIAZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
154	V	12952635	YENNY	BETSABETH	GUEVARA	MERCHAN	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
796	V	4428791	CARMEN	MILAGRO	MATA	BLANCO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
580	V	27391453	RUBEN	DARIO	FONSECA	TOVAR	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
594	V	23660832	SARAHY	DEL ROSARIO	RAMOS	CAÑA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
583	V	21285403	DILIA	VANESSA	SINZZA	RODRIGUEZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
729	V	6516050	MORELLA	ELENA	ROMERO	MORENO	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
589	V	17868995	JEAN	CARLOS	ZERPA	RANGEL	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
210	V	14755060	GEILIN	MARIONT	DE SOUSA	MONROY	2	1	PROGRAMA ADMINISTRATIVO FINANCIERO	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
246	V	16097385	DAYANA	COROMOTO	YANEZ	PEREIRA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ATENCION AL CIUDADANO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
793	V	4585284	MARINA	JOSEFINA	LAGARDERA		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
595	V	24309222	KARINA	DEL CARMEN	CONTRERAS	DIAZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
794	V	4564191	MAITE		MONASTERIOS	HEYDRA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
145	V	12685780	ROSSANA		DELGADO	SILVA	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
581	V	24663266	JOHALIS	JOSE	NIETO	MORILLO	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
80	V	10352702	ELSY	ERNESTINA	LUIS	MONTOYA	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
749	V	20812287	LUIS	ANTONIO ALEJANDRO	DELGADO	DIAZ	2	1	CONSULTORIA JURIDICA	CONSULTORIA JURIDICA	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
610	V	18009102	MIGUEL	ANGEL	ROCCA	DIAZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
892	V	22668272	ADRIAN	\N	OROPEZA	\N	2	1	\N	\N	\N	\N	\N	\N
801	V	4171372	HILDRED	EVANGELISTA	BONILLA		12	1	JUBILADOS Y PENSIONADOS OPSU		activo	5	Pensionado Administrativo	0
624	V	25032806	FRANCHESKA	KATHERINE	VELASCO	REDONDO	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
600	V	25807887	DAVID	JOSE	REBANALES	MANRIQUE	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
617	V	24636352	STEPHANNYE	ALEXANDRA	LOTUFFO	LAMAS	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
607	V	15504316	JUZ	MERCEDES	ROMERO	BAEZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
532	V	6426990	CESAR	ENRIQUE	VELASQUEZ	FIGUEROA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
621	V	28280310	JOSE	GREGORIO	ALCALA	RODRIGUEZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
599	V	25037833	JUAN	CARLOS	PEREZ	JIMENEZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
615	V	20978766	JARVIS	ANTONIO	ESCRIBANO	LINARES	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
611	V	18933036	ANGEL	OSWALDO	MEJIAS	CARDOZO	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
694	V	13246076	PATRICIA		FLORIS	FLORES	2	1	UNIDAD ADMINISTRATIVA   	UNIDAD ADMINISTRATIVA	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
620	V	26530539	ANNY	ANGELY	LOPEZ	TOVAR	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
427	V	5639532	FRANCISCO	ANTONIO	ALVIAREZ	LAGOS	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
618	V	26466300	YHANIELA	VENEZIA	BARRIOS	RAMIREZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
616	V	23068226	JHEIRUSKA	ALDELJHEI	VALLENILLA	GONZALEZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
605	V	24314040	YULEISY	CAROLINA	VARGAS	BAUTISTA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
614	V	20630795	JIMBERSON	JOSE	BENITEZ	SANTAMARIA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
730	V	11350768	RONALD	JOSE	FARFAN	TORRES	1	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE TELECOMUNICACIONES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
613	V	20605415	JEFFERSON	PAUL	ARAQUE	MANCILLA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
799	V	4275057	SONIA		MORALES	DE MERECUANA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	8	Obrero Jubilado	0
622	V	25872539	DANIELA		QUIJADA	MORALES	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
603	V	24511311	ELOMAIRYS	JAHIZER	ALCALA	FARIAS	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
670	V	17928389	FRANCIA	DESIREE	ROJAS	ALVIS	8	3	PROGRAMA ADMINISTRATIVO FINANCIERO	PROGRAMA ADMINISTRATIVO FINANCIERO	egresado	3	Comisión de Servicios OPSU	0
604	V	23944953	JOSE	RAFAEL	MARTINEZ	CAÑA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
606	V	15167820	FRANCINA	DEL PILAR	HELID	GONZALEZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
421	V	6229812	CRUZ	RAFAEL	RUIZ	CALZADILLA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
798	V	4281837	OMAR	EDUARDO	ASCANIO	ESCALONA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	8	Obrero Jubilado	0
800	V	4271001	NARCISA	JOSEFINA	ECHEVERRIA	CASTILLO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
802	V	4119645	ZAIDA	DEL VALLE	MARCANO	DE ECHEVERRIA	12	1	JUBILADOS Y PENSIONADOS OPSU		activo	9	Obrero Pensionado	0
601	V	25969108	EDERLITH	YUGERMIS	PULIDO	PACHECO	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
713	V	17957174	FRANKLIN	JOSE	ALCALA	MILLAN	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
609	V	16379443	JUNILETSY	JANETH	ESPINOZA	TORREALBA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
608	V	16274235	DANIEL	ALEJANDRO	VILLEGAS		2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
465	V	16146111	NELSON	ALEXANDER	GIL	MORA	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
649	V	21150267	YESMAHIRY	YESENIA	AVILEZ	HERNANDEZ	2	3	DIRECCION OPSU	DIRECCION	egresado	2	Personal Contratado Administrativo OPSU	0
630	V	17653252	EMELINA	NATALIE	GUERRA	JIMENEZ	1	3	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	egresado	1	Fijo Administrativo y Profesional OPSU	0
627	V	15665147	OMAIRA	IDALY	GOMES	ROJAS	1	3	DEPARTAMENTO DE COMPRAS	COMPRAS	egresado	1	Fijo Administrativo y Profesional OPSU	0
651	V	19498770	SORIEL	ZADAY	BORGES	ZAPATA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	2	Personal Contratado Administrativo OPSU	0
641	V	12785030	JAMILETH	COROMOTO	ALCALA	ZURITA	1	3	CONSULTORIA JURIDICA	SECRETARIADO PERMANENTE	egresado	1	Fijo Administrativo y Profesional OPSU	0
639	V	10802438	LISSETT	MARIA	ALFARO	GONZALEZ	1	3	PROGRAMA ADMINISTRATIVO FINANCIERO	PROGRAMA ADMINISTRATIVO FINANCIERO	egresado	1	Fijo Administrativo y Profesional OPSU	0
633	V	7925976	JULIA	ESTHER	MONTOYA	JIMENEZ	1	4	PROGRAMA PRUEBA DE APTITUD ACADEMICA	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	suspendido	1	Fijo Administrativo y Profesional OPSU	0
642	V	13308042	MARIA	ANGELICA	PARIS	BALLEZA	1	3	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE RELACIONES PUBLICAS	egresado	1	Fijo Administrativo y Profesional OPSU	0
634	V	12093860	EDAYZE	DEL CARMEN	ROAS	MARQUEZ	1	4	DEPARTAMENTO DE PERSONAL	DEPARTAMENTO DE PERSONAL	suspendido	1	Fijo Administrativo y Profesional OPSU	0
653	V	11540256	JOSE	AGUSTIN	CARVAJAL	LEON	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	PROGRAMA NACIONAL DE INGRESO	activo	2	Personal Contratado Administrativo OPSU	0
805	V	3823448	FRANCYS	TERESA	RODRIGUEZ	DE LOBO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
652	V	26345614	ARIATHNNA	BETZABETH	ZAPATA	GOMEZ	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	2	Personal Contratado Administrativo OPSU	0
632	V	19556041	ANGEL	FABIAN	LOPEZ	PEREZ	1	3	S.P - DIRECCION	SECRETARIADO PERMANENTE	egresado	1001	Fijo Administrativo y Profesional SP	0
631	V	15910628	HAGNEVARY	SUGHEI	ACEVEDO	QUINTERO	1	3	PROFE	OFICINA DE RELACIONES PUBLICAS	egresado	1	Fijo Administrativo y Profesional OPSU	0
636	V	12761870	JOSE	JAVIER	MATHEUS	HERNANDEZ	1	3	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE PROYECTOS	egresado	1	Fijo Administrativo y Profesional OPSU	0
650	V	19224440	HIRONEAY	ANDREINA	GARCIAS	POVEDA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	2	Personal Contratado Administrativo OPSU	0
647	V	17275705	BEATRIZ	DESIREE	HERNANDEZ	CARMONA	2	4	DIRECCION OPSU	DIRECCION	suspendido	2	Personal Contratado Administrativo OPSU	0
635	V	14984543	TONNY	LOGAN	PULIDO	MENDOZA	1	3	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	egresado	1	Fijo Administrativo y Profesional OPSU	0
648	V	20301734	GENESSIS	ANDREINA	CASANOVA	MENDEZ	2	4	DEPARTAMENTO DE COMPRAS	COMPRAS	suspendido	2	Personal Contratado Administrativo OPSU	0
625	V	13115104	ROBERT	CRUZ	SILVA	HERRERA	1	3	PROGRAMA PRUEBA DE APTITUD ACADEMICA	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	egresado	1	Fijo Administrativo y Profesional OPSU	0
645	V	24884667	ZULEIKA	ELIMAR	ACOSTA	TORREALBA	2	3	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	egresado	2	Personal Contratado Administrativo OPSU	0
637	V	12165799	JENNY	YAMEL	RIVAS	GONZALEZ	1	3	UNIDAD ADMINISTRATIVA   	UNIDAD ADMINISTRATIVA	egresado	1	Fijo Administrativo y Profesional OPSU	0
646	V	11850968	HECTOR	ANTONIO	ESCALONA	OROPEZA	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	PROGRAMA NACIONAL DE INGRESO	activo	2	Personal Contratado Administrativo OPSU	0
893	V	25515497	FRAN	\N	SALAZAR	\N	2	1	\N	\N	\N	\N	\N	\N
626	V	17730732	MERCEDES	ELENA	BAQUERO	GARCIA	2	3	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	egresado	2	Personal Contratado Administrativo OPSU	0
804	V	3886320	ILIA	TERESA	QUINTERO	SANCHEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
638	V	15843746	RICHARD	STEWARD	SERRANO	CORREA	1	3	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE PROYECTOS	egresado	1	Fijo Administrativo y Profesional OPSU	0
628	V	11228027	NUBIA	NAIROBY	CIAVATO	DE RAMIREZ	1	3	S.P - DIRECCION	SECRETARIADO PERMANENTE	egresado	1001	Fijo Administrativo y Profesional SP	0
629	V	6309595	BANNY	MIOZZOTTY	SUTHERLAND		1	3	UNIDAD DE PROCESAMIENTO DE DATOS	COORDINACION DE TECNOLOGIA Y SERVICIOS DE INFORMACION	egresado	1	Fijo Administrativo y Profesional OPSU	0
643	V	21759193	DERLYS	KARINA	RINCON	SAMPAYO	1	3	DEPARTAMENTO DE PERSONAL	AREA DE ADMINISTRACION DE PERSONAL	egresado	1	Fijo Administrativo y Profesional OPSU	0
640	V	19206004	VANESSA	CAROLINA	GUILLEN	LEDEZMA	1	3	DEPARTAMENTO DE FINANZAS	DEPARTAMENTO DE FINANZAS	egresado	1	Fijo Administrativo y Profesional OPSU	0
4	V	6076042	MILAGROS	DELFINA	AVILA	URBINA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
644	V	12783494	MARIA	GAUDELIA	UZCATEGUI	GUTIERREZ	1	3	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	DIRECCION	egresado	1	Fijo Administrativo y Profesional OPSU	0
803	V	4061950	ELIZABETH	COROMOTO	MEJIAS	DE RAMIREZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
806	V	3818324	MARY	RONELIA	MARTINEZ	KLE	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
807	V	3810827	EMELIA		GONZALEZ	CARBALLO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
308	V	3803956	IRMA	JOSEFINA	MUÑOZ	MEJIAS	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
750	V	22020690	LEONARD	ALEJANDRO	MONTES DE OCA	AMBROSIONI	2	1	CONSULTORIA JURIDICA	CONSULTORIA JURIDICA	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
695	V	13845684	JUAN	CARLOS	CARREÑO	NOVOA	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
731	V	12094430	JORGE	ALEXIS	RAMIREZ	ROSALES	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
480	V	3401190	MANUEL	ENRIQUE	LONGA		3	1	SECRETARIADO PERMANENTE	SECRETARIADO PERMANENTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
824	V	3048277	NELIS	CAMILA	MARQUEZ	SOTILLO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
836	V	2632161	RICARDO	JOSE	ACOSTA		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
478	V	2961768	LUIS	ALFREDO	FIGUEROA	ANDARCIA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
828	V	2951027	ZAHIDE	JOSEFINA	MONASCAL	DE CARMONA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
829	V	2950774	MARIA	AUXILIADORA	FLORES		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
830	V	2902613	BEATRIZ	DE JESUS	CHACIN	GONZALEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
831	V	2777177	SILVESTRE		MARCHAN		12	1	JUBILADOS Y PENSIONADOS OPSU		activo	5	Pensionado Administrativo	0
832	V	2773838	OLGA	RAFAELA	MUJICA		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
833	V	2727012	JOSÉ	IVAN	BRICEÑO	GARCIA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
602	V	26962444	MILEIDY	ARIANNY	CALDERA	VILLEGAS	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
834	V	2688586	AURA	TERESA	RUZZA	DE OBLITAS	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
835	V	266041	JOSÉ	FRANCISCO	HERNANDEZ	DELGADO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
619	V	26483267	NELSON	DAVID	GALBAN	BRICEÑO	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
837	V	2533985	EGLEE	FILADELFA	SAAVEDRA	BENITEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
838	V	2515903	YONEL	ROSALIO	HERNANDEZ	ALMEDA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
839	V	2509331	GLADYS		MEDINA	MARTINEZ	12	1	JUBILADOS Y PENSIONADOS OPSU		activo	5	Pensionado Administrativo	0
753	V	25006809	ANA	JULIA	LINAREZ	MONTILLA	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	APOYO A LA COORDINACION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
623	V	24933380	LEYIBETH	VIRGINIA	FRONTADO	SALAYA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
585	V	24901583	YOVERSON	JOSE	ZERPA		2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
572	V	24461712	ELVA	GENETH	GOROZABEL	MOLINA	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
596	V	24217648	YUDITSAY	YILARY	VENERE	ROCCA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
752	V	24204268	ANDRES	ENRIQUE	GUTIERREZ	ARMAS	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
751	V	24139700	ASMARA	MARIA	GALVAN	SANGUINO	2	1	TECNOLOGIA Y SERVICIOS DE INFORMACION	DEPARTAMENTO DE SOPORTE TECNICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
417	V	22782450	YARLIN	YUDISSA	GIRALDO	BASANTA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
840	V	2158429	LILIA		PRIETO	OLIVEIRA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
841	V	21174806	IDOL	LEROY	GALLARDO	CARTAYA	2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
566	V	17488355	JOEL	ALEXANDER	ROA		4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
481	V	3660236	OSWALDO	JOSE	RAVELLO		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE REPRODUCCION	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
813	V	3550560	LILIAM	MARGARITA	PAREDES		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
814	V	3548151	HERNA	JOSEFINA	HENRIQUEZ	CABALLERO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
815	V	3478287	MARIA	CRISTINA	RAMIREZ	RAMIREZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
816	V	3400469	CARMEN	JOSEFINA	BOUSQUET	HERNANDEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
817	V	3346490	CARMEN	EMERITA	RUIZ	GUZMAN	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
818	V	331767	MANLIO	DOMINGO	SARDI	MUÑOZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
819	V	3280362	AMALIO	RAFAEL	SARCO LIRA	BARRETO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
820	V	3237431	GUILLERMO	ENRIQUE	FIGUERAS		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
821	V	3189385	MARIA	JOSEFINA	GARCIA	GONZALEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
822	V	3189228	GLADYS	TERESA	FARIAS	FIGUEROA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
561	V	23347129	VIVEL	NAZAGER	MORALES		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
823	V	3183185	NAIRDA	DEL CARMEN	ITRIAGO		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
825	V	2994688	JUDITH		MORALES		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
826	V	2978519	JORGE	VICENTE	BERMUDEZ		7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
827	V	2961968	ELOINA		PEREZ	MEZA	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
718	V	19672910	JUAN	ALBERT	VARGAS	GARCIA	2	1	TECNOLOGIA Y SERVICIOS DE INFORMACION	DEPARTAMENTO DE DESARROLLO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
558	V	18913579	GILBERTO	JESUS	FLORES	MORALES	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
714	V	18038561	EDDISON	JOSE	SERRANO	GUEVARA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
468	V	17964891	JUNIOR	EDUARDO	PEREZ	GONZALEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
275	V	17962774	MARIA	ALEJANDRA	ARANCETA	MADRID	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	AREA DE PLANIFICACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
612	V	20191969	MAXIMA	ESTHER	RAMIREZ	LABARCES	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
852	V	17830229	FOSION	ATILIO	MACHADO	PARALES	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	APOYO A LA COORDINACION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
743	V	17719633	ILIANA	NORELYS	BRACA		2	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5102	Bono de Alimentación del Personal Administrativo Contratado de SP	1
853	V	17600229	JOHNNY	ANTONIO	QUINTERO	BOLIVAR	3	1	DEPARTAMENTO SERVICIOS GENERALES		activo	5008	Bono de Alimentación del Personal Apoyo Institucional OPSU	1
553	V	17514725	CHARLIE	RAFAEL	PERALTA	CONTRERAS	3	1	SECRETARIADO PERMANENTE	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
894	V	82023052	IRMA	\N	LEON	\N	2	1	\N	\N	\N	\N	\N	\N
842	V	2097298	OLGA	MARIA	OBELMEJIAS		12	1	JUBILADOS Y PENSIONADOS OPSU		activo	9	Obrero Pensionado	0
843	V	2080449	JESUS	PASCUAL	MACHADO	FLORES	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
844	V	2078203	BERTA	ELIZABETH	GARCIA	GONZALEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
845	V	2068566	AURA	HERMINIA	COLMENARES	DE GONZALEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	8	Obrero Jubilado	0
846	V	2064400	MORELLA	DEL CARMEN	AGUIAR	DE VAZQUEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
720	V	20391151	JOSE	DAVID	MILAN		2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
294	V	20301366	GERARDINE	ALEXANDRA	SAYAGO	VALECILLO	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DEPARTAMENTO DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
847	V	20175157	FERKELIN	YISELA	REYES	CASARES	2	1	DEPARTAMENTO SERVICIOS GENERALES	OFICINA DE PLANIFICACION Y PRESUPUESTO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
411	V	19933554	YOBER	ANTONIO	LEAL		2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
475	V	19820301	MOISES	EMILIO	VELASCO	LEVI	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
719	V	19711940	ANYOFER	JESUS	MUÑOZ	GUILARTE	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
471	V	18750623	HECTOR	MANUEL	ISTURDE	GARCIA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
848	V	19609630	JOSE	LEONARDO	MARIN	ALMAO	2	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
405	V	19292197	DENIS	ISABEL	OLIVEROS	SARA	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
290	V	19201191	KAREN	ELENA	BERNAL	ECHETO	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE RELACIONES PUBLICAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
357	V	19194069	LUIS	ALEJANDRO	AVILA	VIZCAINO	2	1	DIRECCION OPSU	DEPARTAMENTO DE ESTADISTICA	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
403	V	19165397	YSAIAS	ALFONSO	PEREZ	CAMPOS	2	1	UNIDAD DE PROCESAMIENTO DE DATOS	DEPARTAMENTO DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
849	V	18872327	RAFAEL	CESARIO	MONTIEL	ARANGUREN	4	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
716	V	18813109	DAILY	MALBELY	MORFFE	BLANCO	2	1	TECNOLOGIA Y SERVICIOS DE INFORMACION	DEPARTAMENTO DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
850	V	18752366	KEIBER	BEATRIZ	ROMERO	FAJARDO	2	1	PROGRAMA ADMINISTRATIVO FINANCIERO	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
851	V	18677085	JOSE	MANUEL	LABRADOR	CARRILLO	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
282	V	18466669	CARLA	MARIELA	GONZALEZ	AZUAJE	1	1	PROGRAMA DE EVALUACION INSTITUCIONAL	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
715	V	18446490	ALYAN	ANTONIO	GONZALEZ	MENDEZ	2	1	DIRECCION OPSU	OFICINA DE RELACIONES PUBLICAS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
281	V	18404147	GERARDO	ANDRES	SUAREZ	BORGES	1	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
679	V	18130527	ADALBERTO	JOSE	LAYA	LARA	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
383	V	17503358	LUZ	LORENA	GALVIS	FLORES	2	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
551	V	16312290	HECTOR	ALFONZO	SALAVERRIA	BRICEÑO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
859	V	16146697	GABRIELA		GRANADO 	NAZAR	8	4	DIRECCION OPSU		suspendido	5003	Bono de Alimentación del Personal en Comisión de Servicios en OPSU	1
235	V	15806471	ELEUSIS	ALY	BORREGO	TOVAR	1	1	CONSULTORIA JURIDICA	CONSULTORIA JURIDICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
418	V	15314491	ONESIMO		MOLINA	VENEGAS	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5008	Bono de Alimentación del Personal Apoyo Institucional OPSU	1
863	V	1531160	BLANCA	MARGARITA	PACHECO	DE FARIAS	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
864	V	15039229	ALEXIS	ANTONIO	BELLO	GUEVARA	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
212	V	14874432	MARILUZ		HERRERA	HERNANDEZ	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PLANIFICACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
209	V	14744362	GLORIA	ALJADIS	MOLINA	CAMPO	1	1	UNIDAD ADMINISTRATIVA   	AREA DE PLANIFICACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
895	V	17168132	ANA	\N	BELLO	\N	2	1	\N	\N	\N	\N	\N	\N
901	V	12262690	Frank	Robert	Mendez	Cardozo	2	1	\N	\N	\N	\N	\N	\N
856	V	1721483	DOMINGA	GRACIELA	HERNANDEZ	DE SOLIS	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
497	V	17166204	WILLIAM	ENRIQUE	MOLINA	ROMERO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
857	V	17129344	JONALTHA	ALI	RONDON	GUZMAN	3	3	DEPARTAMENTO SERVICIOS GENERALES		egresado	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
898	V	6344515	ANIBAL	\N	CAMPO	\N	2	1	\N	\N	\N	\N	\N	\N
858	V	16952497	ZARET	CECILIA	ROJAS	ROMERO	8	4	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO		suspendido	3	Comisión de Servicios OPSU	0
380	V	16904877	ROSANA	MARIA	BARRIOS	GOMEZ	2	1	DEPARTAMENTO DE FINANZAS	TESORERIA	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
259	V	16661353	ANA	MARIA	BASTARDO	MONTOYA	1	1	DEPARTAMENTO DE DOCUMENTACION E INFORMACION	CENTRO DE INFORMACION Y DOCUMENTACION EN EDUCACION SUPERIOR (CENIDES)	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
374	V	16534183	ELSA	NARAYI	TORRES	ARAUJO	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
253	V	16444827	NELSON	LEANDRO	ALVAREZ	LEON	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
304	V	15892445	JOSÉ	LEONARDO	CARABALLO	JIMENEZ	1	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
563	V	16223811	JUAN	CARLOS	ESPARRAGOZA	ALVARADO	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
466	V	16147183	HAROLD	JOSE	DIAZ	DELGADO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE CORRESPONDENCIA	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
860	V	16097143	CARLOS	EDUARDO	VARGAS	CONOPOY	8	1	OFICINA DE PLANIFICACION Y PRESUPUESTO	OFICINA DE PLANIFICACION Y PRESUPUESTO	activo	3	Comisión de Servicios OPSU	0
883	V	10699994	REINERYS	\N	GONZALEZ	\N	2	1	\N	\N	\N	\N	\N	\N
243	V	16085246	CARLOS	EDUARDO	BRICEÑO	DEVIA	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
861	V	16075189	CARLOS	ALFREDO	PIÑANGO	MUÑOZ	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
862	V	16065955	MARYNER	CATERINA	TREMATERRA	TINEO	8	4	DIRECCION OPSU		suspendido	3	Comisión de Servicios OPSU	0
372	V	15974752	EGLYS	DEL VALLE	RODRIGUEZ	GARCIA	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
240	V	15892649	JOMAIRA	JENITZA	MIJARES		1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE SOPORTE TECNICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
233	V	15795893	RONALD	JOSE	GARCIA	COTTRELL	1	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
704	V	15713956	JESUS	NICOLAS	ROJAS	GUZMAN	2	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5102	Bono de Alimentación del Personal Administrativo Contratado de SP	1
463	V	15683262	SOLEIDA	ESTHER	PEREZ	MAZENETH	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
227	V	15508090	MAYGLET	NAIRIN	MENA	RAMIREZ	1	1	DEPARTAMENTO DE PERSONAL	AREA DE BIENESTAR SOCIAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
577	V	15179508	MARIA	CONSUELO	RADDATZ	GATICA	8	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE TERRITORIALIZACION Y VINCULACION SOCIOPRODUCTIVA	activo	5003	Bono de Alimentación del Personal en Comisión de Servicios en OPSU	1
736	V	15389497	ALEXI	JOSE	REVERON	ASUAJE	1	1	DEPARTAMENTO SERVICIOS GENERALES		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
223	V	15320495	JANETH	BELTRAN	SEQUERA	FERNÁNDEZ	1	1	PROGRAMA ADMINISTRATIVO FINANCIERO	AREA DE PRESUPUESTO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
265	V	17058465	ROSAURA	ELENA	MIRELES	ELIAS	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
902	V	13895401	Angel	Gabriel	Villaroel	Saavedra	2	1	\N	\N	\N	\N	\N	\N
903	V	14334280	Carlos	Luis	Anzola	Escalona	2	1	\N	\N	\N	\N	\N	\N
904	V	16072899	David	Julian	Arango	Beltran	2	1	\N	\N	\N	\N	\N	\N
867	V	14202151	MARCEL	JOSE	KOSMA	MARTINEZ	8	3	DIRECCION OPSU		egresado	3	Comisión de Servicios OPSU	0
868	V	14198213	KAREN	YANUBA	NIEVES	ANTA	8	1	DEPARTAMENTO DE PERSONAL	HCM DE LAS UNIVERSIDADES	activo	5003	Bono de Alimentación del Personal en Comisión de Servicios en OPSU	1
869	V	14073917	ANDERSON		CAPRILES	DE ARMAS	8	3	TECNOLOGIA Y SERVICIOS DE INFORMACION		egresado	5003	Bono de Alimentación del Personal en Comisión de Servicios en OPSU	1
872	V	13528927	JUAN	CARLOS	COLMENARES	VARELA	8	3	OFICINA DE PLANIFICACION Y PRESUPUESTO		egresado	5003	Bono de Alimentación del Personal en Comisión de Servicios en OPSU	1
149	V	12784175	MARLIN	COROMOTO	HERRERA	FERNANDEZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	AREA DE TERRITORIALIZACION Y VINCULACION SOCIOPRODUCTIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
874	V	13067442	JUDFREID	ALFONSO	ALBARRAN	JAUREGUI	8	3	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO		egresado	5003	Bono de Alimentación del Personal en Comisión de Servicios en OPSU	1
735	V	14446659	RONALD	ANTONIO	ALVIAREZ	ANGULO	4	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5007	Bono de Alimentación del Personal Obrero Contratado de OPSU	1
865	V	14417482	CIRILO	ALFONSO	GOMEZ	BENAVIDES	8	1	DIRECCION OPSU		activo	3	Comisión de Servicios OPSU	0
866	V	14215691	JOSE	DAVID	MONTAÑA	COLMENARES	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
187	V	14073979	DAFNE	CORINA	MAZUTIEL	ESCOBAR	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
870	V	13998458	JOSE	GREGORIO	ROJAS		8	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	3	Comisión de Servicios OPSU	0
871	V	13886877	LEONARDO	DAVID	RAMIREZ	GONZALEZ	8	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	3	Comisión de Servicios OPSU	0
176	V	13610782	HERLY	GREGORIA	PEREZ	GALEA	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
458	V	14198822	ALEJANDRO		NEGRETE	BRAVO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
171	V	13517855	RAUL	OSWALDO	ESPINOZA	GUEVARA	1	1	UNIDAD ADMINISTRATIVA   	AREA DE BIENES NACIONALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
163	V	13159838	YORK	YICSON	HERNANDEZ	MUJICA	1	1	UNIDAD ADMINISTRATIVA   	AREA DE BIENES NACIONALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
873	V	13158091	ALBERTO		LEMUS	MORENO	2	4	SECRETARIADO PERMANENTE		suspendido	5102	Bono de Alimentación del Personal Administrativo Contratado de SP	1
454	V	13623106	LUIS ENRIQUE		GONZALEZ		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
161	V	13134133	KAROL	LILIANA	ABAD	CHACON	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	DEPARTAMENTO DE PERSONAL	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
579	V	13533497	MAURY	DE JESUS	SIFONTES	PATIÑO	8	1	DIRECCION OPSU	DIRECCION	activo	5003	Bono de Alimentación del Personal en Comisión de Servicios en OPSU	1
587	V	13069073	YENNI	GREICY	ZERPA	RANGEL	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
448	V	13014924	WILMER	ALEXANDER	MIRANDA	PEÑA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
150	V	12834830	JHAEL	ANTONIO	BUSTAMANTE	BOLIVAR	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	COORDINACION DE TECNOLOGIA Y SERVICIOS DE INFORMACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
544	V	12614408	ANA	YELITZE	MERCADO	RAMIREZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
135	V	12389992	JHON	LUI	JIMENEZ	PICO	1	1	UNIDAD ADMINISTRATIVA   	COMPRAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
513	V	12383830	MAYKEL	ANTONIO	CASTRO	COVA	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
130	V	12073126	ROSMIRA	DEL VALLE	SEGURA	ARMAO	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
689	V	12663011	JESUS	RAFAEL	RIVAS	NORIEGA	8	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	PROGRAMA NACIONAL DE INGRESO	activo	3	Comisión de Servicios OPSU	0
490	V	11929543	GREGORY	ALEXANDER	BOYER		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
875	V	11955223	JUAN	CARLOS	PEREZ	LACRUZ	2	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
876	V	11894245	VALMORE	JUNIOR	GONZALEZ	VALERA	2	1	DIRECCION OPSU	HCM DE LAS UNIVERSIDADES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
877	V	11851993	EDGAR	LORENZO	PADRON	CASTILLO	8	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE RELACIONES PUBLICAS	activo	3	Comisión de Servicios OPSU	0
122	V	11685447	VERUSKA	DEL VALLE	QUIROZ	MELO	1	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
367	V	14519818	YEISA	DEL CARMEN	RODRIGUEZ	ESTEVEZ	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
698	V	14494559	JHOVERLYN	TIBISAY	CASTILLO	ISTURIZ	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
303	V	14452420	MAYRA	CAROLINA	HERNANDEZ	ZAMBRANO	1	1	S.P - DIRECCION	UNIDAD DE EVALUACION, NUCLEOS Y PROYECTOS	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
879	V	11180786	MEBIL	ERNESTO	ROSALES	SUMOZA	8	3	TECNOLOGIA Y SERVICIOS DE INFORMACION		egresado	3	Comisión de Servicios OPSU	0
880	V	11128506	HILDAMAR	ELENA	AZUAJE	ROBLES	8	4	CONSULTORIA JURIDICA		suspendido	3	Comisión de Servicios OPSU	0
762	V	8352706	MERQUIADES	SATURNINA	CALZADILLA	DE GONZALEZ	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
812	V	3664265	JAVIER	DE LA SANTISIMA TRINIDAD	D` AUBETERRE	BUZNEGO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
396	V	18192643	ANA	CECILIA	ECHETO	TORREALBA	2	1	DEPARTAMENTO DE DOCUMENTACION E INFORMACION	CENTRO DE INFORMACION Y DOCUMENTACION EN EDUCACION SUPERIOR (CENIDES)	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
884	V	15799144	JOSUE	\N	DIAZ	\N	2	1	\N	\N	\N	\N	\N	\N
221	V	15152730	MARISELA		ZARAGOZA	RODRIGUEZ	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE SOPORTE TECNICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
206	V	14695042	MONICA	GABRIELA	CASTILLO	PEREZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	COORDINACION DE TECNOLOGIA Y SERVICIOS DE INFORMACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
733	V	12955831	RODOLFO	ALEJANDRO	URBINA	BUENAÑO	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE TELECOMUNICACIONES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
37	V	11642516	CARMEN	MARIA	DELGADO	VELASQUEZ	1	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5101	Bono de Alimentación del Personal Administrativo Fijo de SP	1
446	V	11612049	CARLOS	JESUS	NIÑO		3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE TRANSPORTE	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
878	V	11510416	ZULY	CONCEPCION	INCERRY	MORENO	12	1	JUBILADOS Y PENSIONADOS OPSU		activo	5	Pensionado Administrativo	0
113	V	11481919	FABIOLA	MARGARITA	LUNAR	MIRABAL	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
335	V	11165640	EDMARY	KATIUSKA	ABREU	ROMERO	2	1	S.P - DIRECCION	SECRETARIADO PERMANENTE	activo	5102	Bono de Alimentación del Personal Administrativo Contratado de SP	1
103	V	11027890	LONGOBARDO		SEPULVEDA	IBARRA	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
507	V	10805775	JOSE	GREGORIO	DEPABLOS	QUINTERO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
95	V	10796270	JUAN	JOSE	MILLAN	HERRERA	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
506	V	10690389	FREDDY	MANUEL	COLINA	DELGADO	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE ASEO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
881	V	10354790	KARINA	NUBIA	GARCIA	GUILLEN	8	3	DIRECCION OPSU		egresado	3	Comisión de Servicios OPSU	0
541	V	10348279	JOSE	LUIS	COLINA	ALEMAN	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
74	V	10155605	MARIANNE	YSABEL	ABRAMS	SALCEDO	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
442	V	10010893	JESUS	ALBERTO	BRICEÑO	SULBARAN	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
905	V	16226874	Jaime	Jose	Perez	Silva	2	1	\N	\N	\N	\N	\N	\N
64	V	9482100	IRMA	ROSA	CARRABBIA	CASTELLANOS	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
439	V	9463102	MARIA	RITA	BOHADA		3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
899	V	13113199	ALICIA	\N	GALARRAGA	\N	2	1	\N	\N	\N	\N	\N	\N
57	V	9156256	FRANCELIA	DEL  CARMEN	PALMA	GUDIÑO	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
764	V	773700	MARIA	ELENA.	NIETO	DE NEGRETE	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
675	V	7595388	ARGENIS	ARNALDO	MONTAÑEZ	VILCHEZ	2	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
341	V	4804183	NANCY	JOSEFINA	GOMES		2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
312	V	4283046	MAIGUALIDA	ANTONIETA	MACHADO	MORALES	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
896	V	9889860	PAUL	\N	BRITO	\N	1	1	\N	\N	\N	\N	\N	\N
327	V	21073840	LINLLYS	HELENA	SOLORZANO	BASTARDO	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ASUNTOS LABORALES	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
855	V	17301676	GERALDINE	ANDREINA	GONZALEZ	ZAMBRANO	2	1	DIRECCION OPSU	DIRECCION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
726	V	10663593	ANGIE	CAROLINA	RUMBOS	GUAPE	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
479	V	3244052	RAFAEL		HERNANDEZ	LOPEZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
906	V	17168312	Ana	Karina	Bello	Serrano	2	1	\N	\N	\N	\N	\N	\N
907	V	18422186	Luis	Oswaldo	Rodriguez	Ugarte	2	1	\N	\N	\N	\N	\N	\N
908	V	19396388	Jesus	Alberto	Garcia	Corro	2	1	\N	\N	\N	\N	\N	\N
909	V	20158595	Nathaly	Del Carmen	Sanchez	Navarro	2	1	\N	\N	\N	\N	\N	\N
349	V	9951754	MARNI	COROMOTO	VASQUEZ	ROJAS	2	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	COORDINACION DE TECNOLOGIA Y SERVICIOS DE INFORMACION	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
65	V	9486838	CINTHYA	MARIA	PAIVA	GUEVARA	1	1	DEPARTAMENTO DE DOCUMENTACION E INFORMACION	CENTRO DE INFORMACION Y DOCUMENTACION EN EDUCACION SUPERIOR (CENIDES)	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
63	V	9347886	MARIA	YANETH	MURILLO	RAMIREZ	1	1	UNIDAD DE PROCESAMIENTO DE DATOS	COORDINACION DE TECNOLOGIA Y SERVICIOS DE INFORMACION	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
261	V	16890901	PATRICIA	NATALY	OSIO	MORA	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE ATENCION AL CIUDADANO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
376	V	16816879	LUIS	FELIPE	DIMAS	ROMERO	2	1	PROGRAMA PRUEBA DE APTITUD ACADEMICA	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
708	V	16356506	AURIMAR	DEL CARMEN	PALENCIA	GONZALEZ	2	1	DEPARTAMENTO DE FINANZAS	DEPARTAMENTO DE FINANZAS	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
226	V	15494611	JAIME	ALBERTO	GUZMAN	PEREIRA	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO	AREA DE EVALUACION, SEGUIMIENTO Y GESTION DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
105	V	11113922	NESTOR	ENRIQUE	NIETO	JIMENEZ	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE SOPORTE TECNICO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
100	V	10828232	ZULAY	ENCARNACION	SOLORZANO	RIVERO	1	1	DEPARTAMENTO DE DOCUMENTACION E INFORMACION	CENTRO DE INFORMACION Y DOCUMENTACION EN EDUCACION SUPERIOR (CENIDES)	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
225	V	15488340	RANDALL	STIVENSON	HERNANDEZ	DIAZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	OFICINA DE RELACIONES PUBLICAS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
516	V	14444827	TIBISAY	YNES	SIERRA	MARCANO	3	1	DEPARTAMENTO SERVICIOS GENERALES	DEPARTAMENTO DE SERVICIOS GENERALES	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
765	V	7661662	ZAIDEE	TIBISAY	CAYAMA	MEJIAS	8	1	PROGRAMA ADMINISTRATIVO FINANCIERO	PROGRAMA ADMINISTRATIVO FINANCIERO	activo	3	Comisión de Servicios OPSU	0
882	V	6347309	JOSE	MANUEL	GUZMAN	CAGUANA	8	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO		activo	3	Comisión de Servicios OPSU	0
201	V	14438363	BERENICE	DEL CARMEN	OLMOS	PEREZ	1	1	DEPARTAMENTO DE INFORMACION Y ATENCION AL PUBLICO	AREA DE VINCULACION Y PERTINENCIA DE LA OFERTA ACADEMICA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
529	V	5116440	JOSE	ANGEL	AVILA	DIAZ	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE AUXILIARES DE MANTENIMIENTO	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
331	V	22445164	YULEXIS	MARIA	PADILLA	JULIO	2	1	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	PROGRAMA DE DESARROLLO ESPACIAL Y FISICO	activo	5002	Bono de Alimentación del Personal Administrativo Contratado de OPSU	1
164	V	13253659	YUSMEY	LISBETH	VASQUEZ	RODRIGUEZ	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	AREA DE TERRITORIALIZACION Y VINCULACION SOCIOPRODUCTIVA	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
897	V	12762472	NGUYEN	THIBHIN	RODRIGUEZ	ALVAREZ	8	1	CONSULTORIA JURIDICA		activo	3	Comisión de Servicios OPSU	0
137	V	12398999	NAUDELIS	ELENA	ROMERO	CARRILLO	1	1	OFICINA DE INFORMACION Y RELACIONES PUBLICAS	CONSEJO CONSULTIVO NACIONAL DE POSTGRADO	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
502	V	18130936	RAUL	ALBERTO	GONZALEZ	PALACIOS	3	1	DEPARTAMENTO SERVICIOS GENERALES	AREA DE SEGURIDAD	activo	5006	Bono de Alimentación del Personal Obrero Fijo de OPSU	1
684	V	11604037	JOSÉ	ANTONIO	LABRADOR	SALAS	1	1	DEPARTAMENTO DE DISTRIBUCION E INGRESO		activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
276	V	18004487	IVAN	ALEXANDER	ROMAN	MARCANO	1	1	DEPARTAMENTO DE DASARROLLO DE SISTEMAS	DEPARTAMENTO DE PROYECTOS	activo	5001	Bono de Alimentación del Personal Administrativo Fijo de OPSU	1
854	V	1741788	LUZ	MARIA	DESIDERIO	DE OSIO	7	1	JUBILADOS Y PENSIONADOS OPSU		activo	4	Jubilado Administrativo	0
\.


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personas_id_seq', 910, true);


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY productos (id, nombre, descripcion, estatus) FROM stdin;
1	harina de maiz	harina de maiz 1kg	1
2	harina de maiz25	harina de maiz 1kg	1
3	HARINA DE MAIZ SOL DE NAIGUATA	1 KILO	1
4	ARROZ AMARILLO SOL DE NAIGUATA	1 KILO	1
5	POLLO SOL DE NAIGUATA	1 KILO	1
7	AZUCAR SOL DE NAIGUATA	BULTO	1
8	PASTA	500 GRAMOS	1
6	CARNE SOL DE NAIGUATA	1 KILO	1
9	CAFE VENEZUELA	1 KILO	1
10	PRUEBA ARROZ	1 KILO	1
11	PRUEBA DE HARINA	1 KILO	1
12	ARROZ	ARROZ 4 KILOS	1
13	CARPETA	2 UNIDADES	1
14	LAPICES	4 UNIDADES	1
15	JUEGO DE GEOMETRIA	1 UNIDAD	1
16	LIBRETA	1 UNIDAD	1
17	BORRADOR	1 UNIDAD	1
18	LAPICEROS	2 UNIDADES	1
19	RESALTADOR	1 UNIDAD	1
20	MARCADOR PUNTA FINA	1 UNIDAD	2
\.


--
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('productos_id_seq', 20, true);


--
-- Data for Name: user_evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_evento (id, id_evento, id_user, roles) FROM stdin;
1	7	5	ROLE_ADMIN
2	7	6	ROLE_ADMIN
3	6	1	ROLE_SUPER_ADMIN
4	8	1	ROLE_SUPER_ADMIN
5	9	9	ROLE_ADMIN
6	9	8	ROLE_ADMIN
7	9	7	ROLE_ADMIN
8	10	1	ROLE_SUPER_ADMIN
9	11	7	ROLE_ADMIN
10	12	7	ROLE_ADMIN
11	13	7	ROLE_ADMIN
12	14	7	ROLE_ADMIN
\.


--
-- Name: user_evento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_evento_id_seq', 12, true);


--
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ventas (id, id_personal, id_eventos, estatus, fecha_modificacion, observacion, monto1, monto2, monto3) FROM stdin;
1	1	7	0	\N	\N	\N	\N	\N
2	28	7	0	\N	\N	\N	\N	\N
3	29	7	0	\N	\N	\N	\N	\N
4	30	7	0	\N	\N	\N	\N	\N
5	31	7	0	\N	\N	\N	\N	\N
6	32	7	0	\N	\N	\N	\N	\N
7	33	7	0	\N	\N	\N	\N	\N
8	34	7	0	\N	\N	\N	\N	\N
9	172	7	0	\N	\N	\N	\N	\N
10	4	7	0	\N	\N	\N	\N	\N
11	5	7	0	\N	\N	\N	\N	\N
12	6	7	0	\N	\N	\N	\N	\N
13	7	7	0	\N	\N	\N	\N	\N
14	8	7	0	\N	\N	\N	\N	\N
15	9	7	0	\N	\N	\N	\N	\N
16	10	7	0	\N	\N	\N	\N	\N
17	11	7	0	\N	\N	\N	\N	\N
18	12	7	0	\N	\N	\N	\N	\N
19	13	7	0	\N	\N	\N	\N	\N
20	14	7	0	\N	\N	\N	\N	\N
21	15	7	0	\N	\N	\N	\N	\N
22	16	7	0	\N	\N	\N	\N	\N
23	17	7	0	\N	\N	\N	\N	\N
24	19	7	0	\N	\N	\N	\N	\N
25	20	7	0	\N	\N	\N	\N	\N
26	21	7	0	\N	\N	\N	\N	\N
27	22	7	0	\N	\N	\N	\N	\N
28	23	7	0	\N	\N	\N	\N	\N
29	24	7	0	\N	\N	\N	\N	\N
30	25	7	0	\N	\N	\N	\N	\N
31	26	7	0	\N	\N	\N	\N	\N
32	27	7	0	\N	\N	\N	\N	\N
33	59	7	0	\N	\N	\N	\N	\N
34	58	7	0	\N	\N	\N	\N	\N
35	60	7	0	\N	\N	\N	\N	\N
36	61	7	0	\N	\N	\N	\N	\N
37	62	7	0	\N	\N	\N	\N	\N
38	63	7	0	\N	\N	\N	\N	\N
39	64	7	0	\N	\N	\N	\N	\N
40	36	7	0	\N	\N	\N	\N	\N
41	37	7	0	\N	\N	\N	\N	\N
42	38	7	0	\N	\N	\N	\N	\N
43	39	7	0	\N	\N	\N	\N	\N
44	40	7	0	\N	\N	\N	\N	\N
45	41	7	0	\N	\N	\N	\N	\N
46	42	7	0	\N	\N	\N	\N	\N
47	43	7	0	\N	\N	\N	\N	\N
48	44	7	0	\N	\N	\N	\N	\N
49	45	7	0	\N	\N	\N	\N	\N
50	46	7	0	\N	\N	\N	\N	\N
51	47	7	0	\N	\N	\N	\N	\N
52	48	7	0	\N	\N	\N	\N	\N
53	49	7	0	\N	\N	\N	\N	\N
54	50	7	0	\N	\N	\N	\N	\N
55	51	7	0	\N	\N	\N	\N	\N
56	52	7	0	\N	\N	\N	\N	\N
57	53	7	0	\N	\N	\N	\N	\N
58	54	7	0	\N	\N	\N	\N	\N
59	56	7	0	\N	\N	\N	\N	\N
60	57	7	0	\N	\N	\N	\N	\N
61	88	7	0	\N	\N	\N	\N	\N
62	89	7	0	\N	\N	\N	\N	\N
63	90	7	0	\N	\N	\N	\N	\N
64	92	7	0	\N	\N	\N	\N	\N
65	93	7	0	\N	\N	\N	\N	\N
66	94	7	0	\N	\N	\N	\N	\N
67	95	7	0	\N	\N	\N	\N	\N
68	96	7	0	\N	\N	\N	\N	\N
69	97	7	0	\N	\N	\N	\N	\N
70	66	7	0	\N	\N	\N	\N	\N
71	67	7	0	\N	\N	\N	\N	\N
72	68	7	0	\N	\N	\N	\N	\N
73	69	7	0	\N	\N	\N	\N	\N
74	70	7	0	\N	\N	\N	\N	\N
75	72	7	0	\N	\N	\N	\N	\N
76	73	7	0	\N	\N	\N	\N	\N
77	74	7	0	\N	\N	\N	\N	\N
78	75	7	0	\N	\N	\N	\N	\N
79	76	7	0	\N	\N	\N	\N	\N
80	77	7	0	\N	\N	\N	\N	\N
81	78	7	0	\N	\N	\N	\N	\N
82	79	7	0	\N	\N	\N	\N	\N
83	80	7	0	\N	\N	\N	\N	\N
84	81	7	0	\N	\N	\N	\N	\N
85	82	7	0	\N	\N	\N	\N	\N
86	83	7	0	\N	\N	\N	\N	\N
87	84	7	0	\N	\N	\N	\N	\N
88	85	7	0	\N	\N	\N	\N	\N
89	86	7	0	\N	\N	\N	\N	\N
90	87	7	0	\N	\N	\N	\N	\N
91	124	7	0	\N	\N	\N	\N	\N
92	125	7	0	\N	\N	\N	\N	\N
93	126	7	0	\N	\N	\N	\N	\N
94	127	7	0	\N	\N	\N	\N	\N
95	128	7	0	\N	\N	\N	\N	\N
96	129	7	0	\N	\N	\N	\N	\N
97	130	7	0	\N	\N	\N	\N	\N
98	131	7	0	\N	\N	\N	\N	\N
99	132	7	0	\N	\N	\N	\N	\N
100	133	7	0	\N	\N	\N	\N	\N
101	134	7	0	\N	\N	\N	\N	\N
102	135	7	0	\N	\N	\N	\N	\N
103	101	7	0	\N	\N	\N	\N	\N
104	102	7	0	\N	\N	\N	\N	\N
105	103	7	0	\N	\N	\N	\N	\N
106	104	7	0	\N	\N	\N	\N	\N
107	105	7	0	\N	\N	\N	\N	\N
108	106	7	0	\N	\N	\N	\N	\N
109	107	7	0	\N	\N	\N	\N	\N
110	108	7	0	\N	\N	\N	\N	\N
111	109	7	0	\N	\N	\N	\N	\N
112	110	7	0	\N	\N	\N	\N	\N
113	111	7	0	\N	\N	\N	\N	\N
114	112	7	0	\N	\N	\N	\N	\N
115	113	7	0	\N	\N	\N	\N	\N
116	114	7	0	\N	\N	\N	\N	\N
117	115	7	0	\N	\N	\N	\N	\N
118	116	7	0	\N	\N	\N	\N	\N
119	117	7	0	\N	\N	\N	\N	\N
120	118	7	0	\N	\N	\N	\N	\N
121	119	7	0	\N	\N	\N	\N	\N
122	120	7	0	\N	\N	\N	\N	\N
123	121	7	0	\N	\N	\N	\N	\N
124	122	7	0	\N	\N	\N	\N	\N
125	160	7	0	\N	\N	\N	\N	\N
126	162	7	0	\N	\N	\N	\N	\N
127	163	7	0	\N	\N	\N	\N	\N
128	165	7	0	\N	\N	\N	\N	\N
129	166	7	0	\N	\N	\N	\N	\N
130	167	7	0	\N	\N	\N	\N	\N
131	168	7	0	\N	\N	\N	\N	\N
132	169	7	0	\N	\N	\N	\N	\N
133	170	7	0	\N	\N	\N	\N	\N
134	171	7	0	\N	\N	\N	\N	\N
135	136	7	0	\N	\N	\N	\N	\N
136	137	7	0	\N	\N	\N	\N	\N
137	138	7	0	\N	\N	\N	\N	\N
138	139	7	0	\N	\N	\N	\N	\N
139	140	7	0	\N	\N	\N	\N	\N
140	141	7	0	\N	\N	\N	\N	\N
141	142	7	0	\N	\N	\N	\N	\N
142	143	7	0	\N	\N	\N	\N	\N
143	144	7	0	\N	\N	\N	\N	\N
144	145	7	0	\N	\N	\N	\N	\N
145	146	7	0	\N	\N	\N	\N	\N
146	147	7	0	\N	\N	\N	\N	\N
147	148	7	0	\N	\N	\N	\N	\N
148	150	7	0	\N	\N	\N	\N	\N
149	151	7	0	\N	\N	\N	\N	\N
150	152	7	0	\N	\N	\N	\N	\N
151	153	7	0	\N	\N	\N	\N	\N
152	154	7	0	\N	\N	\N	\N	\N
153	155	7	0	\N	\N	\N	\N	\N
154	156	7	0	\N	\N	\N	\N	\N
155	157	7	0	\N	\N	\N	\N	\N
156	158	7	0	\N	\N	\N	\N	\N
157	159	7	0	\N	\N	\N	\N	\N
158	199	7	0	\N	\N	\N	\N	\N
159	201	7	0	\N	\N	\N	\N	\N
160	202	7	0	\N	\N	\N	\N	\N
161	203	7	0	\N	\N	\N	\N	\N
162	204	7	0	\N	\N	\N	\N	\N
163	205	7	0	\N	\N	\N	\N	\N
164	206	7	0	\N	\N	\N	\N	\N
165	207	7	0	\N	\N	\N	\N	\N
166	208	7	0	\N	\N	\N	\N	\N
167	209	7	0	\N	\N	\N	\N	\N
168	174	7	0	\N	\N	\N	\N	\N
169	175	7	0	\N	\N	\N	\N	\N
170	176	7	0	\N	\N	\N	\N	\N
171	178	7	0	\N	\N	\N	\N	\N
172	179	7	0	\N	\N	\N	\N	\N
173	180	7	0	\N	\N	\N	\N	\N
174	181	7	0	\N	\N	\N	\N	\N
175	182	7	0	\N	\N	\N	\N	\N
176	183	7	0	\N	\N	\N	\N	\N
177	184	7	0	\N	\N	\N	\N	\N
178	185	7	0	\N	\N	\N	\N	\N
179	186	7	0	\N	\N	\N	\N	\N
180	187	7	0	\N	\N	\N	\N	\N
181	188	7	0	\N	\N	\N	\N	\N
182	190	7	0	\N	\N	\N	\N	\N
183	191	7	0	\N	\N	\N	\N	\N
184	192	7	0	\N	\N	\N	\N	\N
185	193	7	0	\N	\N	\N	\N	\N
186	194	7	0	\N	\N	\N	\N	\N
187	195	7	0	\N	\N	\N	\N	\N
188	196	7	0	\N	\N	\N	\N	\N
189	198	7	0	\N	\N	\N	\N	\N
190	212	7	0	\N	\N	\N	\N	\N
191	213	7	0	\N	\N	\N	\N	\N
192	214	7	0	\N	\N	\N	\N	\N
193	215	7	0	\N	\N	\N	\N	\N
194	216	7	0	\N	\N	\N	\N	\N
195	217	7	0	\N	\N	\N	\N	\N
196	218	7	0	\N	\N	\N	\N	\N
197	219	7	0	\N	\N	\N	\N	\N
198	220	7	0	\N	\N	\N	\N	\N
199	221	7	0	\N	\N	\N	\N	\N
200	222	7	0	\N	\N	\N	\N	\N
201	223	7	0	\N	\N	\N	\N	\N
202	225	7	0	\N	\N	\N	\N	\N
203	226	7	0	\N	\N	\N	\N	\N
204	227	7	0	\N	\N	\N	\N	\N
205	228	7	0	\N	\N	\N	\N	\N
206	230	7	0	\N	\N	\N	\N	\N
207	231	7	0	\N	\N	\N	\N	\N
208	244	7	0	\N	\N	\N	\N	\N
209	233	7	0	\N	\N	\N	\N	\N
210	234	7	0	\N	\N	\N	\N	\N
211	236	7	0	\N	\N	\N	\N	\N
212	237	7	0	\N	\N	\N	\N	\N
213	238	7	0	\N	\N	\N	\N	\N
214	240	7	0	\N	\N	\N	\N	\N
215	241	7	0	\N	\N	\N	\N	\N
216	242	7	0	\N	\N	\N	\N	\N
217	243	7	0	\N	\N	\N	\N	\N
218	245	7	0	\N	\N	\N	\N	\N
219	356	7	0	\N	\N	\N	\N	\N
220	274	7	0	\N	\N	\N	\N	\N
221	276	7	0	\N	\N	\N	\N	\N
222	280	7	0	\N	\N	\N	\N	\N
223	248	7	0	\N	\N	\N	\N	\N
224	251	7	0	\N	\N	\N	\N	\N
225	253	7	0	\N	\N	\N	\N	\N
226	255	7	0	\N	\N	\N	\N	\N
227	257	7	0	\N	\N	\N	\N	\N
228	262	7	0	\N	\N	\N	\N	\N
229	264	7	0	\N	\N	\N	\N	\N
230	266	7	0	\N	\N	\N	\N	\N
231	267	7	0	\N	\N	\N	\N	\N
232	268	7	0	\N	\N	\N	\N	\N
233	269	7	0	\N	\N	\N	\N	\N
234	270	7	0	\N	\N	\N	\N	\N
235	271	7	0	\N	\N	\N	\N	\N
236	272	7	0	\N	\N	\N	\N	\N
237	273	7	0	\N	\N	\N	\N	\N
238	275	7	0	\N	\N	\N	\N	\N
239	277	7	0	\N	\N	\N	\N	\N
240	278	7	0	\N	\N	\N	\N	\N
241	247	7	0	\N	\N	\N	\N	\N
242	250	7	0	\N	\N	\N	\N	\N
243	252	7	0	\N	\N	\N	\N	\N
244	254	7	0	\N	\N	\N	\N	\N
245	256	7	0	\N	\N	\N	\N	\N
246	258	7	0	\N	\N	\N	\N	\N
247	263	7	0	\N	\N	\N	\N	\N
248	265	7	0	\N	\N	\N	\N	\N
249	279	7	0	\N	\N	\N	\N	\N
250	281	7	0	\N	\N	\N	\N	\N
251	306	7	0	\N	\N	\N	\N	\N
252	307	7	0	\N	\N	\N	\N	\N
253	309	7	0	\N	\N	\N	\N	\N
254	311	7	0	\N	\N	\N	\N	\N
255	312	7	0	\N	\N	\N	\N	\N
256	313	7	0	\N	\N	\N	\N	\N
257	314	7	0	\N	\N	\N	\N	\N
258	316	7	0	\N	\N	\N	\N	\N
259	317	7	0	\N	\N	\N	\N	\N
260	318	7	0	\N	\N	\N	\N	\N
261	319	7	0	\N	\N	\N	\N	\N
262	283	7	0	\N	\N	\N	\N	\N
263	285	7	0	\N	\N	\N	\N	\N
264	286	7	0	\N	\N	\N	\N	\N
265	287	7	0	\N	\N	\N	\N	\N
266	288	7	0	\N	\N	\N	\N	\N
267	289	7	0	\N	\N	\N	\N	\N
268	290	7	0	\N	\N	\N	\N	\N
269	291	7	0	\N	\N	\N	\N	\N
270	292	7	0	\N	\N	\N	\N	\N
271	293	7	0	\N	\N	\N	\N	\N
272	294	7	0	\N	\N	\N	\N	\N
273	295	7	0	\N	\N	\N	\N	\N
274	296	7	0	\N	\N	\N	\N	\N
275	297	7	0	\N	\N	\N	\N	\N
276	298	7	0	\N	\N	\N	\N	\N
277	299	7	0	\N	\N	\N	\N	\N
278	300	7	0	\N	\N	\N	\N	\N
279	301	7	0	\N	\N	\N	\N	\N
280	302	7	0	\N	\N	\N	\N	\N
281	303	7	0	\N	\N	\N	\N	\N
282	304	7	0	\N	\N	\N	\N	\N
283	305	7	0	\N	\N	\N	\N	\N
284	345	7	0	\N	\N	\N	\N	\N
285	336	7	0	\N	\N	\N	\N	\N
286	346	7	0	\N	\N	\N	\N	\N
287	348	7	0	\N	\N	\N	\N	\N
288	349	7	0	\N	\N	\N	\N	\N
289	350	7	0	\N	\N	\N	\N	\N
290	351	7	0	\N	\N	\N	\N	\N
291	352	7	0	\N	\N	\N	\N	\N
292	353	7	0	\N	\N	\N	\N	\N
293	354	7	0	\N	\N	\N	\N	\N
294	355	7	0	\N	\N	\N	\N	\N
295	321	7	0	\N	\N	\N	\N	\N
296	322	7	0	\N	\N	\N	\N	\N
297	323	7	0	\N	\N	\N	\N	\N
298	324	7	0	\N	\N	\N	\N	\N
299	325	7	0	\N	\N	\N	\N	\N
300	327	7	0	\N	\N	\N	\N	\N
301	328	7	0	\N	\N	\N	\N	\N
302	329	7	0	\N	\N	\N	\N	\N
303	330	7	0	\N	\N	\N	\N	\N
304	331	7	0	\N	\N	\N	\N	\N
305	332	7	0	\N	\N	\N	\N	\N
306	333	7	0	\N	\N	\N	\N	\N
307	334	7	0	\N	\N	\N	\N	\N
308	335	7	0	\N	\N	\N	\N	\N
309	337	7	0	\N	\N	\N	\N	\N
310	338	7	0	\N	\N	\N	\N	\N
311	339	7	0	\N	\N	\N	\N	\N
312	340	7	0	\N	\N	\N	\N	\N
313	341	7	0	\N	\N	\N	\N	\N
314	342	7	0	\N	\N	\N	\N	\N
315	343	7	0	\N	\N	\N	\N	\N
316	344	7	0	\N	\N	\N	\N	\N
317	507	7	0	\N	\N	\N	\N	\N
318	361	7	0	\N	\N	\N	\N	\N
319	362	7	0	\N	\N	\N	\N	\N
320	364	7	0	\N	\N	\N	\N	\N
321	365	7	0	\N	\N	\N	\N	\N
322	366	7	0	\N	\N	\N	\N	\N
323	367	7	0	\N	\N	\N	\N	\N
324	210	7	0	\N	\N	\N	\N	\N
325	357	7	0	\N	\N	\N	\N	\N
326	359	7	0	\N	\N	\N	\N	\N
327	360	7	0	\N	\N	\N	\N	\N
328	368	7	0	\N	\N	\N	\N	\N
329	370	7	0	\N	\N	\N	\N	\N
330	371	7	0	\N	\N	\N	\N	\N
331	372	7	0	\N	\N	\N	\N	\N
332	373	7	0	\N	\N	\N	\N	\N
333	374	7	0	\N	\N	\N	\N	\N
334	375	7	0	\N	\N	\N	\N	\N
335	376	7	0	\N	\N	\N	\N	\N
336	377	7	0	\N	\N	\N	\N	\N
337	378	7	0	\N	\N	\N	\N	\N
338	379	7	0	\N	\N	\N	\N	\N
339	380	7	0	\N	\N	\N	\N	\N
340	381	7	0	\N	\N	\N	\N	\N
341	382	7	0	\N	\N	\N	\N	\N
342	383	7	0	\N	\N	\N	\N	\N
343	384	7	0	\N	\N	\N	\N	\N
344	385	7	0	\N	\N	\N	\N	\N
345	386	7	0	\N	\N	\N	\N	\N
346	387	7	0	\N	\N	\N	\N	\N
347	388	7	0	\N	\N	\N	\N	\N
348	389	7	0	\N	\N	\N	\N	\N
349	390	7	0	\N	\N	\N	\N	\N
350	417	7	0	\N	\N	\N	\N	\N
351	413	7	0	\N	\N	\N	\N	\N
352	392	7	0	\N	\N	\N	\N	\N
353	393	7	0	\N	\N	\N	\N	\N
354	394	7	0	\N	\N	\N	\N	\N
355	395	7	0	\N	\N	\N	\N	\N
356	396	7	0	\N	\N	\N	\N	\N
357	397	7	0	\N	\N	\N	\N	\N
358	398	7	0	\N	\N	\N	\N	\N
359	399	7	0	\N	\N	\N	\N	\N
360	400	7	0	\N	\N	\N	\N	\N
361	401	7	0	\N	\N	\N	\N	\N
362	402	7	0	\N	\N	\N	\N	\N
363	2	7	0	\N	\N	\N	\N	\N
364	403	7	0	\N	\N	\N	\N	\N
365	404	7	0	\N	\N	\N	\N	\N
366	405	7	0	\N	\N	\N	\N	\N
367	406	7	0	\N	\N	\N	\N	\N
368	407	7	0	\N	\N	\N	\N	\N
369	408	7	0	\N	\N	\N	\N	\N
370	409	7	0	\N	\N	\N	\N	\N
371	410	7	0	\N	\N	\N	\N	\N
372	411	7	0	\N	\N	\N	\N	\N
373	412	7	0	\N	\N	\N	\N	\N
374	416	7	0	\N	\N	\N	\N	\N
375	418	7	0	\N	\N	\N	\N	\N
376	419	7	0	\N	\N	\N	\N	\N
377	420	7	0	\N	\N	\N	\N	\N
378	421	7	0	\N	\N	\N	\N	\N
379	422	7	0	\N	\N	\N	\N	\N
380	423	7	0	\N	\N	\N	\N	\N
381	424	7	0	\N	\N	\N	\N	\N
382	426	7	0	\N	\N	\N	\N	\N
383	444	7	0	\N	\N	\N	\N	\N
384	445	7	0	\N	\N	\N	\N	\N
385	437	7	0	\N	\N	\N	\N	\N
386	449	7	0	\N	\N	\N	\N	\N
387	439	7	0	\N	\N	\N	\N	\N
388	459	7	0	\N	\N	\N	\N	\N
389	463	7	0	\N	\N	\N	\N	\N
390	464	7	0	\N	\N	\N	\N	\N
391	465	7	0	\N	\N	\N	\N	\N
392	466	7	0	\N	\N	\N	\N	\N
393	452	7	0	\N	\N	\N	\N	\N
394	453	7	0	\N	\N	\N	\N	\N
395	455	7	0	\N	\N	\N	\N	\N
396	457	7	0	\N	\N	\N	\N	\N
397	461	7	0	\N	\N	\N	\N	\N
398	427	7	0	\N	\N	\N	\N	\N
399	428	7	0	\N	\N	\N	\N	\N
400	429	7	0	\N	\N	\N	\N	\N
401	430	7	0	\N	\N	\N	\N	\N
402	431	7	0	\N	\N	\N	\N	\N
403	432	7	0	\N	\N	\N	\N	\N
404	433	7	0	\N	\N	\N	\N	\N
405	434	7	0	\N	\N	\N	\N	\N
406	436	7	0	\N	\N	\N	\N	\N
407	446	7	0	\N	\N	\N	\N	\N
408	447	7	0	\N	\N	\N	\N	\N
409	438	7	0	\N	\N	\N	\N	\N
410	448	7	0	\N	\N	\N	\N	\N
411	440	7	0	\N	\N	\N	\N	\N
412	450	7	0	\N	\N	\N	\N	\N
413	441	7	0	\N	\N	\N	\N	\N
414	442	7	0	\N	\N	\N	\N	\N
415	443	7	0	\N	\N	\N	\N	\N
416	494	7	0	\N	\N	\N	\N	\N
417	499	7	0	\N	\N	\N	\N	\N
418	480	7	0	\N	\N	\N	\N	\N
419	468	7	0	\N	\N	\N	\N	\N
420	506	7	0	\N	\N	\N	\N	\N
421	470	7	0	\N	\N	\N	\N	\N
422	501	7	0	\N	\N	\N	\N	\N
423	467	7	0	\N	\N	\N	\N	\N
424	481	7	0	\N	\N	\N	\N	\N
425	482	7	0	\N	\N	\N	\N	\N
426	483	7	0	\N	\N	\N	\N	\N
427	484	7	0	\N	\N	\N	\N	\N
428	485	7	0	\N	\N	\N	\N	\N
429	486	7	0	\N	\N	\N	\N	\N
430	487	7	0	\N	\N	\N	\N	\N
431	488	7	0	\N	\N	\N	\N	\N
432	489	7	0	\N	\N	\N	\N	\N
433	473	7	0	\N	\N	\N	\N	\N
434	474	7	0	\N	\N	\N	\N	\N
435	475	7	0	\N	\N	\N	\N	\N
436	476	7	0	\N	\N	\N	\N	\N
437	477	7	0	\N	\N	\N	\N	\N
438	479	7	0	\N	\N	\N	\N	\N
439	496	7	0	\N	\N	\N	\N	\N
440	497	7	0	\N	\N	\N	\N	\N
441	498	7	0	\N	\N	\N	\N	\N
442	505	7	0	\N	\N	\N	\N	\N
443	503	7	0	\N	\N	\N	\N	\N
444	504	7	0	\N	\N	\N	\N	\N
445	469	7	0	\N	\N	\N	\N	\N
446	493	7	0	\N	\N	\N	\N	\N
447	491	7	0	\N	\N	\N	\N	\N
448	492	7	0	\N	\N	\N	\N	\N
449	548	7	0	\N	\N	\N	\N	\N
450	518	7	0	\N	\N	\N	\N	\N
451	519	7	0	\N	\N	\N	\N	\N
452	528	7	0	\N	\N	\N	\N	\N
453	530	7	0	\N	\N	\N	\N	\N
454	510	7	0	\N	\N	\N	\N	\N
455	511	7	0	\N	\N	\N	\N	\N
456	512	7	0	\N	\N	\N	\N	\N
457	513	7	0	\N	\N	\N	\N	\N
458	514	7	0	\N	\N	\N	\N	\N
459	515	7	0	\N	\N	\N	\N	\N
460	516	7	0	\N	\N	\N	\N	\N
461	517	7	0	\N	\N	\N	\N	\N
462	520	7	0	\N	\N	\N	\N	\N
463	522	7	0	\N	\N	\N	\N	\N
464	526	7	0	\N	\N	\N	\N	\N
465	527	7	0	\N	\N	\N	\N	\N
466	508	7	0	\N	\N	\N	\N	\N
467	509	7	0	\N	\N	\N	\N	\N
468	531	7	0	\N	\N	\N	\N	\N
469	532	7	0	\N	\N	\N	\N	\N
470	533	7	0	\N	\N	\N	\N	\N
471	534	7	0	\N	\N	\N	\N	\N
472	535	7	0	\N	\N	\N	\N	\N
473	536	7	0	\N	\N	\N	\N	\N
474	537	7	0	\N	\N	\N	\N	\N
475	538	7	0	\N	\N	\N	\N	\N
476	539	7	0	\N	\N	\N	\N	\N
477	540	7	0	\N	\N	\N	\N	\N
478	541	7	0	\N	\N	\N	\N	\N
479	542	7	0	\N	\N	\N	\N	\N
480	543	7	0	\N	\N	\N	\N	\N
481	544	7	0	\N	\N	\N	\N	\N
482	545	7	0	\N	\N	\N	\N	\N
483	546	7	0	\N	\N	\N	\N	\N
484	547	7	0	\N	\N	\N	\N	\N
485	566	7	0	\N	\N	\N	\N	\N
486	553	7	0	\N	\N	\N	\N	\N
487	563	7	0	\N	\N	\N	\N	\N
488	568	7	0	\N	\N	\N	\N	\N
489	575	7	0	\N	\N	\N	\N	\N
490	3	7	0	\N	\N	\N	\N	\N
491	574	7	0	\N	\N	\N	\N	\N
492	549	7	0	\N	\N	\N	\N	\N
493	550	7	0	\N	\N	\N	\N	\N
494	562	7	0	\N	\N	\N	\N	\N
495	554	7	0	\N	\N	\N	\N	\N
496	555	7	0	\N	\N	\N	\N	\N
497	556	7	0	\N	\N	\N	\N	\N
498	572	7	0	\N	\N	\N	\N	\N
499	564	7	0	\N	\N	\N	\N	\N
500	565	7	0	\N	\N	\N	\N	\N
501	570	7	0	\N	\N	\N	\N	\N
502	571	7	0	\N	\N	\N	\N	\N
503	559	7	0	\N	\N	\N	\N	\N
504	579	7	0	\N	\N	\N	\N	\N
505	567	7	0	\N	\N	\N	\N	\N
506	573	7	0	\N	\N	\N	\N	\N
507	576	7	0	\N	\N	\N	\N	\N
508	578	7	0	\N	\N	\N	\N	\N
509	557	7	0	\N	\N	\N	\N	\N
510	224	7	0	\N	\N	\N	\N	\N
511	249	7	0	\N	\N	\N	\N	\N
512	308	7	0	\N	\N	\N	\N	\N
513	391	7	0	\N	\N	\N	\N	\N
514	369	7	0	\N	\N	\N	\N	\N
515	320	7	0	\N	\N	\N	\N	\N
516	363	7	0	\N	\N	\N	\N	\N
517	149	7	0	\N	\N	\N	\N	\N
518	65	7	0	\N	\N	\N	\N	\N
519	173	7	0	\N	\N	\N	\N	\N
520	211	7	0	\N	\N	\N	\N	\N
521	18	7	0	\N	\N	\N	\N	\N
522	35	7	0	\N	\N	\N	\N	\N
523	521	7	0	\N	\N	\N	\N	\N
524	524	7	0	\N	\N	\N	\N	\N
525	525	7	0	\N	\N	\N	\N	\N
526	100	7	0	\N	\N	\N	\N	\N
527	164	7	0	\N	\N	\N	\N	\N
528	189	7	0	\N	\N	\N	\N	\N
529	246	7	0	\N	\N	\N	\N	\N
530	310	7	0	\N	\N	\N	\N	\N
531	425	7	0	\N	\N	\N	\N	\N
532	456	7	0	\N	\N	\N	\N	\N
533	523	7	0	\N	\N	\N	\N	\N
534	99	7	0	\N	\N	\N	\N	\N
535	197	7	0	\N	\N	\N	\N	\N
536	261	7	0	\N	\N	\N	\N	\N
537	282	7	0	\N	\N	\N	\N	\N
538	326	7	0	\N	\N	\N	\N	\N
539	239	7	0	\N	\N	\N	\N	\N
540	259	7	0	\N	\N	\N	\N	\N
541	260	7	0	\N	\N	\N	\N	\N
542	30	6	0	\N	\N	\N	\N	\N
543	31	6	0	\N	\N	\N	\N	\N
544	32	6	0	\N	\N	\N	\N	\N
545	33	6	0	\N	\N	\N	\N	\N
546	34	6	0	\N	\N	\N	\N	\N
547	172	6	0	\N	\N	\N	\N	\N
548	4	6	0	\N	\N	\N	\N	\N
549	5	6	0	\N	\N	\N	\N	\N
550	6	6	0	\N	\N	\N	\N	\N
551	7	6	0	\N	\N	\N	\N	\N
552	8	6	0	\N	\N	\N	\N	\N
553	9	6	0	\N	\N	\N	\N	\N
554	10	6	0	\N	\N	\N	\N	\N
555	11	6	0	\N	\N	\N	\N	\N
556	12	6	0	\N	\N	\N	\N	\N
557	13	6	0	\N	\N	\N	\N	\N
558	14	6	0	\N	\N	\N	\N	\N
559	15	6	0	\N	\N	\N	\N	\N
560	16	6	0	\N	\N	\N	\N	\N
561	17	6	0	\N	\N	\N	\N	\N
562	19	6	0	\N	\N	\N	\N	\N
563	20	6	0	\N	\N	\N	\N	\N
564	21	6	0	\N	\N	\N	\N	\N
565	22	6	0	\N	\N	\N	\N	\N
566	23	6	0	\N	\N	\N	\N	\N
567	24	6	0	\N	\N	\N	\N	\N
568	25	6	0	\N	\N	\N	\N	\N
569	26	6	0	\N	\N	\N	\N	\N
570	27	6	0	\N	\N	\N	\N	\N
571	28	6	0	\N	\N	\N	\N	\N
572	29	6	0	\N	\N	\N	\N	\N
573	61	6	0	\N	\N	\N	\N	\N
574	60	6	0	\N	\N	\N	\N	\N
575	62	6	0	\N	\N	\N	\N	\N
576	63	6	0	\N	\N	\N	\N	\N
577	64	6	0	\N	\N	\N	\N	\N
578	36	6	0	\N	\N	\N	\N	\N
579	37	6	0	\N	\N	\N	\N	\N
580	38	6	0	\N	\N	\N	\N	\N
581	39	6	0	\N	\N	\N	\N	\N
582	40	6	0	\N	\N	\N	\N	\N
583	41	6	0	\N	\N	\N	\N	\N
584	42	6	0	\N	\N	\N	\N	\N
585	43	6	0	\N	\N	\N	\N	\N
586	44	6	0	\N	\N	\N	\N	\N
587	45	6	0	\N	\N	\N	\N	\N
588	46	6	0	\N	\N	\N	\N	\N
589	47	6	0	\N	\N	\N	\N	\N
590	48	6	0	\N	\N	\N	\N	\N
591	49	6	0	\N	\N	\N	\N	\N
592	50	6	0	\N	\N	\N	\N	\N
593	51	6	0	\N	\N	\N	\N	\N
594	52	6	0	\N	\N	\N	\N	\N
595	53	6	0	\N	\N	\N	\N	\N
596	54	6	0	\N	\N	\N	\N	\N
597	56	6	0	\N	\N	\N	\N	\N
598	57	6	0	\N	\N	\N	\N	\N
599	58	6	0	\N	\N	\N	\N	\N
600	59	6	0	\N	\N	\N	\N	\N
601	90	6	0	\N	\N	\N	\N	\N
602	92	6	0	\N	\N	\N	\N	\N
603	93	6	0	\N	\N	\N	\N	\N
604	94	6	0	\N	\N	\N	\N	\N
605	95	6	0	\N	\N	\N	\N	\N
606	96	6	0	\N	\N	\N	\N	\N
607	97	6	0	\N	\N	\N	\N	\N
608	66	6	0	\N	\N	\N	\N	\N
609	67	6	0	\N	\N	\N	\N	\N
610	68	6	0	\N	\N	\N	\N	\N
611	69	6	0	\N	\N	\N	\N	\N
612	70	6	0	\N	\N	\N	\N	\N
613	72	6	0	\N	\N	\N	\N	\N
614	73	6	0	\N	\N	\N	\N	\N
615	74	6	0	\N	\N	\N	\N	\N
616	75	6	0	\N	\N	\N	\N	\N
617	76	6	0	\N	\N	\N	\N	\N
618	77	6	0	\N	\N	\N	\N	\N
619	78	6	0	\N	\N	\N	\N	\N
620	79	6	0	\N	\N	\N	\N	\N
621	80	6	0	\N	\N	\N	\N	\N
622	81	6	0	\N	\N	\N	\N	\N
623	82	6	0	\N	\N	\N	\N	\N
624	83	6	0	\N	\N	\N	\N	\N
625	84	6	0	\N	\N	\N	\N	\N
626	85	6	0	\N	\N	\N	\N	\N
627	86	6	0	\N	\N	\N	\N	\N
628	87	6	0	\N	\N	\N	\N	\N
629	88	6	0	\N	\N	\N	\N	\N
630	89	6	0	\N	\N	\N	\N	\N
631	126	6	0	\N	\N	\N	\N	\N
632	127	6	0	\N	\N	\N	\N	\N
633	128	6	0	\N	\N	\N	\N	\N
634	129	6	0	\N	\N	\N	\N	\N
635	130	6	0	\N	\N	\N	\N	\N
636	131	6	0	\N	\N	\N	\N	\N
637	132	6	0	\N	\N	\N	\N	\N
638	133	6	0	\N	\N	\N	\N	\N
639	134	6	0	\N	\N	\N	\N	\N
640	135	6	0	\N	\N	\N	\N	\N
641	101	6	0	\N	\N	\N	\N	\N
642	102	6	0	\N	\N	\N	\N	\N
643	103	6	0	\N	\N	\N	\N	\N
644	104	6	0	\N	\N	\N	\N	\N
645	105	6	0	\N	\N	\N	\N	\N
646	106	6	0	\N	\N	\N	\N	\N
647	107	6	0	\N	\N	\N	\N	\N
648	108	6	0	\N	\N	\N	\N	\N
649	109	6	0	\N	\N	\N	\N	\N
650	110	6	0	\N	\N	\N	\N	\N
651	111	6	0	\N	\N	\N	\N	\N
652	112	6	0	\N	\N	\N	\N	\N
653	113	6	0	\N	\N	\N	\N	\N
654	114	6	0	\N	\N	\N	\N	\N
655	115	6	0	\N	\N	\N	\N	\N
656	116	6	0	\N	\N	\N	\N	\N
657	117	6	0	\N	\N	\N	\N	\N
658	118	6	0	\N	\N	\N	\N	\N
659	119	6	0	\N	\N	\N	\N	\N
660	120	6	0	\N	\N	\N	\N	\N
661	121	6	0	\N	\N	\N	\N	\N
662	122	6	0	\N	\N	\N	\N	\N
663	124	6	0	\N	\N	\N	\N	\N
664	125	6	0	\N	\N	\N	\N	\N
665	163	6	0	\N	\N	\N	\N	\N
666	165	6	0	\N	\N	\N	\N	\N
667	166	6	0	\N	\N	\N	\N	\N
668	167	6	0	\N	\N	\N	\N	\N
669	168	6	0	\N	\N	\N	\N	\N
670	169	6	0	\N	\N	\N	\N	\N
671	170	6	0	\N	\N	\N	\N	\N
672	171	6	0	\N	\N	\N	\N	\N
673	136	6	0	\N	\N	\N	\N	\N
674	137	6	0	\N	\N	\N	\N	\N
675	138	6	0	\N	\N	\N	\N	\N
676	139	6	0	\N	\N	\N	\N	\N
677	140	6	0	\N	\N	\N	\N	\N
678	141	6	0	\N	\N	\N	\N	\N
679	142	6	0	\N	\N	\N	\N	\N
680	143	6	0	\N	\N	\N	\N	\N
681	144	6	0	\N	\N	\N	\N	\N
682	145	6	0	\N	\N	\N	\N	\N
683	146	6	0	\N	\N	\N	\N	\N
684	147	6	0	\N	\N	\N	\N	\N
685	148	6	0	\N	\N	\N	\N	\N
686	150	6	0	\N	\N	\N	\N	\N
687	151	6	0	\N	\N	\N	\N	\N
688	152	6	0	\N	\N	\N	\N	\N
689	153	6	0	\N	\N	\N	\N	\N
690	154	6	0	\N	\N	\N	\N	\N
691	155	6	0	\N	\N	\N	\N	\N
692	156	6	0	\N	\N	\N	\N	\N
693	157	6	0	\N	\N	\N	\N	\N
694	158	6	0	\N	\N	\N	\N	\N
695	159	6	0	\N	\N	\N	\N	\N
696	160	6	0	\N	\N	\N	\N	\N
697	162	6	0	\N	\N	\N	\N	\N
698	201	6	0	\N	\N	\N	\N	\N
699	202	6	0	\N	\N	\N	\N	\N
700	203	6	0	\N	\N	\N	\N	\N
701	204	6	0	\N	\N	\N	\N	\N
702	205	6	0	\N	\N	\N	\N	\N
703	206	6	0	\N	\N	\N	\N	\N
704	207	6	0	\N	\N	\N	\N	\N
705	208	6	0	\N	\N	\N	\N	\N
706	209	6	0	\N	\N	\N	\N	\N
707	174	6	0	\N	\N	\N	\N	\N
708	175	6	0	\N	\N	\N	\N	\N
709	176	6	0	\N	\N	\N	\N	\N
710	178	6	0	\N	\N	\N	\N	\N
711	179	6	0	\N	\N	\N	\N	\N
712	180	6	0	\N	\N	\N	\N	\N
713	181	6	0	\N	\N	\N	\N	\N
714	182	6	0	\N	\N	\N	\N	\N
715	183	6	0	\N	\N	\N	\N	\N
716	184	6	0	\N	\N	\N	\N	\N
717	185	6	0	\N	\N	\N	\N	\N
718	186	6	0	\N	\N	\N	\N	\N
719	187	6	0	\N	\N	\N	\N	\N
720	188	6	0	\N	\N	\N	\N	\N
721	190	6	0	\N	\N	\N	\N	\N
722	191	6	0	\N	\N	\N	\N	\N
723	192	6	0	\N	\N	\N	\N	\N
724	193	6	0	\N	\N	\N	\N	\N
725	194	6	0	\N	\N	\N	\N	\N
726	195	6	0	\N	\N	\N	\N	\N
727	196	6	0	\N	\N	\N	\N	\N
728	198	6	0	\N	\N	\N	\N	\N
729	199	6	0	\N	\N	\N	\N	\N
730	237	6	0	\N	\N	\N	\N	\N
731	214	6	0	\N	\N	\N	\N	\N
732	215	6	0	\N	\N	\N	\N	\N
733	216	6	0	\N	\N	\N	\N	\N
734	217	6	0	\N	\N	\N	\N	\N
735	218	6	0	\N	\N	\N	\N	\N
736	219	6	0	\N	\N	\N	\N	\N
737	220	6	0	\N	\N	\N	\N	\N
738	221	6	0	\N	\N	\N	\N	\N
739	222	6	0	\N	\N	\N	\N	\N
740	223	6	0	\N	\N	\N	\N	\N
741	225	6	0	\N	\N	\N	\N	\N
742	226	6	0	\N	\N	\N	\N	\N
743	227	6	0	\N	\N	\N	\N	\N
744	228	6	0	\N	\N	\N	\N	\N
745	230	6	0	\N	\N	\N	\N	\N
746	231	6	0	\N	\N	\N	\N	\N
747	233	6	0	\N	\N	\N	\N	\N
748	234	6	0	\N	\N	\N	\N	\N
749	356	6	0	\N	\N	\N	\N	\N
750	212	6	0	\N	\N	\N	\N	\N
751	213	6	0	\N	\N	\N	\N	\N
752	238	6	0	\N	\N	\N	\N	\N
753	240	6	0	\N	\N	\N	\N	\N
754	241	6	0	\N	\N	\N	\N	\N
755	242	6	0	\N	\N	\N	\N	\N
756	243	6	0	\N	\N	\N	\N	\N
757	244	6	0	\N	\N	\N	\N	\N
758	245	6	0	\N	\N	\N	\N	\N
759	236	6	0	\N	\N	\N	\N	\N
760	276	6	0	\N	\N	\N	\N	\N
761	278	6	0	\N	\N	\N	\N	\N
762	248	6	0	\N	\N	\N	\N	\N
763	251	6	0	\N	\N	\N	\N	\N
764	252	6	0	\N	\N	\N	\N	\N
765	253	6	0	\N	\N	\N	\N	\N
766	255	6	0	\N	\N	\N	\N	\N
767	257	6	0	\N	\N	\N	\N	\N
768	262	6	0	\N	\N	\N	\N	\N
769	264	6	0	\N	\N	\N	\N	\N
770	266	6	0	\N	\N	\N	\N	\N
771	268	6	0	\N	\N	\N	\N	\N
772	270	6	0	\N	\N	\N	\N	\N
773	272	6	0	\N	\N	\N	\N	\N
774	273	6	0	\N	\N	\N	\N	\N
775	274	6	0	\N	\N	\N	\N	\N
776	275	6	0	\N	\N	\N	\N	\N
777	277	6	0	\N	\N	\N	\N	\N
778	279	6	0	\N	\N	\N	\N	\N
779	280	6	0	\N	\N	\N	\N	\N
781	254	6	0	\N	\N	\N	\N	\N
782	256	6	0	\N	\N	\N	\N	\N
783	258	6	0	\N	\N	\N	\N	\N
784	263	6	0	\N	\N	\N	\N	\N
785	265	6	0	\N	\N	\N	\N	\N
786	267	6	0	\N	\N	\N	\N	\N
787	269	6	0	\N	\N	\N	\N	\N
788	271	6	0	\N	\N	\N	\N	\N
789	247	6	0	\N	\N	\N	\N	\N
790	250	6	0	\N	\N	\N	\N	\N
791	309	6	0	\N	\N	\N	\N	\N
792	311	6	0	\N	\N	\N	\N	\N
793	312	6	0	\N	\N	\N	\N	\N
794	313	6	0	\N	\N	\N	\N	\N
795	314	6	0	\N	\N	\N	\N	\N
796	316	6	0	\N	\N	\N	\N	\N
797	317	6	0	\N	\N	\N	\N	\N
798	318	6	0	\N	\N	\N	\N	\N
799	319	6	0	\N	\N	\N	\N	\N
800	283	6	0	\N	\N	\N	\N	\N
801	285	6	0	\N	\N	\N	\N	\N
802	286	6	0	\N	\N	\N	\N	\N
803	287	6	0	\N	\N	\N	\N	\N
804	288	6	0	\N	\N	\N	\N	\N
805	289	6	0	\N	\N	\N	\N	\N
806	290	6	0	\N	\N	\N	\N	\N
807	291	6	0	\N	\N	\N	\N	\N
808	292	6	0	\N	\N	\N	\N	\N
809	293	6	0	\N	\N	\N	\N	\N
810	294	6	0	\N	\N	\N	\N	\N
811	295	6	0	\N	\N	\N	\N	\N
812	296	6	0	\N	\N	\N	\N	\N
813	297	6	0	\N	\N	\N	\N	\N
814	298	6	0	\N	\N	\N	\N	\N
815	299	6	0	\N	\N	\N	\N	\N
816	300	6	0	\N	\N	\N	\N	\N
817	301	6	0	\N	\N	\N	\N	\N
818	302	6	0	\N	\N	\N	\N	\N
819	303	6	0	\N	\N	\N	\N	\N
820	304	6	0	\N	\N	\N	\N	\N
821	305	6	0	\N	\N	\N	\N	\N
822	306	6	0	\N	\N	\N	\N	\N
823	307	6	0	\N	\N	\N	\N	\N
824	338	6	0	\N	\N	\N	\N	\N
825	348	6	0	\N	\N	\N	\N	\N
826	349	6	0	\N	\N	\N	\N	\N
827	350	6	0	\N	\N	\N	\N	\N
828	351	6	0	\N	\N	\N	\N	\N
829	352	6	0	\N	\N	\N	\N	\N
830	353	6	0	\N	\N	\N	\N	\N
831	354	6	0	\N	\N	\N	\N	\N
832	355	6	0	\N	\N	\N	\N	\N
833	321	6	0	\N	\N	\N	\N	\N
834	322	6	0	\N	\N	\N	\N	\N
835	323	6	0	\N	\N	\N	\N	\N
836	324	6	0	\N	\N	\N	\N	\N
837	325	6	0	\N	\N	\N	\N	\N
838	327	6	0	\N	\N	\N	\N	\N
839	328	6	0	\N	\N	\N	\N	\N
840	329	6	0	\N	\N	\N	\N	\N
841	330	6	0	\N	\N	\N	\N	\N
842	331	6	0	\N	\N	\N	\N	\N
843	332	6	0	\N	\N	\N	\N	\N
844	333	6	0	\N	\N	\N	\N	\N
845	334	6	0	\N	\N	\N	\N	\N
846	335	6	0	\N	\N	\N	\N	\N
847	336	6	0	\N	\N	\N	\N	\N
848	337	6	0	\N	\N	\N	\N	\N
849	339	6	0	\N	\N	\N	\N	\N
850	340	6	0	\N	\N	\N	\N	\N
851	341	6	0	\N	\N	\N	\N	\N
852	342	6	0	\N	\N	\N	\N	\N
853	343	6	0	\N	\N	\N	\N	\N
854	344	6	0	\N	\N	\N	\N	\N
855	345	6	0	\N	\N	\N	\N	\N
856	346	6	0	\N	\N	\N	\N	\N
857	368	6	0	\N	\N	\N	\N	\N
858	364	6	0	\N	\N	\N	\N	\N
859	365	6	0	\N	\N	\N	\N	\N
860	366	6	0	\N	\N	\N	\N	\N
861	367	6	0	\N	\N	\N	\N	\N
862	210	6	0	\N	\N	\N	\N	\N
863	357	6	0	\N	\N	\N	\N	\N
864	359	6	0	\N	\N	\N	\N	\N
865	360	6	0	\N	\N	\N	\N	\N
866	361	6	0	\N	\N	\N	\N	\N
867	362	6	0	\N	\N	\N	\N	\N
868	370	6	0	\N	\N	\N	\N	\N
869	371	6	0	\N	\N	\N	\N	\N
870	372	6	0	\N	\N	\N	\N	\N
871	373	6	0	\N	\N	\N	\N	\N
872	374	6	0	\N	\N	\N	\N	\N
873	375	6	0	\N	\N	\N	\N	\N
874	376	6	0	\N	\N	\N	\N	\N
875	377	6	0	\N	\N	\N	\N	\N
876	378	6	0	\N	\N	\N	\N	\N
877	379	6	0	\N	\N	\N	\N	\N
878	380	6	0	\N	\N	\N	\N	\N
879	381	6	0	\N	\N	\N	\N	\N
880	382	6	0	\N	\N	\N	\N	\N
881	383	6	0	\N	\N	\N	\N	\N
882	384	6	0	\N	\N	\N	\N	\N
883	385	6	0	\N	\N	\N	\N	\N
884	386	6	0	\N	\N	\N	\N	\N
885	387	6	0	\N	\N	\N	\N	\N
886	388	6	0	\N	\N	\N	\N	\N
887	389	6	0	\N	\N	\N	\N	\N
888	390	6	0	\N	\N	\N	\N	\N
889	507	6	0	\N	\N	\N	\N	\N
890	419	6	0	\N	\N	\N	\N	\N
891	392	6	0	\N	\N	\N	\N	\N
892	393	6	0	\N	\N	\N	\N	\N
893	394	6	0	\N	\N	\N	\N	\N
894	395	6	0	\N	\N	\N	\N	\N
895	396	6	0	\N	\N	\N	\N	\N
896	397	6	0	\N	\N	\N	\N	\N
897	398	6	0	\N	\N	\N	\N	\N
898	399	6	0	\N	\N	\N	\N	\N
899	400	6	0	\N	\N	\N	\N	\N
900	401	6	0	\N	\N	\N	\N	\N
901	402	6	0	\N	\N	\N	\N	\N
902	2	6	0	\N	\N	\N	\N	\N
904	404	6	0	\N	\N	\N	\N	\N
905	405	6	0	\N	\N	\N	\N	\N
906	406	6	0	\N	\N	\N	\N	\N
907	407	6	0	\N	\N	\N	\N	\N
908	408	6	0	\N	\N	\N	\N	\N
909	409	6	0	\N	\N	\N	\N	\N
910	410	6	0	\N	\N	\N	\N	\N
911	411	6	0	\N	\N	\N	\N	\N
912	412	6	0	\N	\N	\N	\N	\N
913	413	6	0	\N	\N	\N	\N	\N
914	418	6	0	\N	\N	\N	\N	\N
915	420	6	0	\N	\N	\N	\N	\N
916	421	6	0	\N	\N	\N	\N	\N
917	422	6	0	\N	\N	\N	\N	\N
918	423	6	0	\N	\N	\N	\N	\N
919	424	6	0	\N	\N	\N	\N	\N
920	426	6	0	\N	\N	\N	\N	\N
921	416	6	0	\N	\N	\N	\N	\N
922	417	6	0	\N	\N	\N	\N	\N
923	446	6	0	\N	\N	\N	\N	\N
924	447	6	0	\N	\N	\N	\N	\N
925	439	6	0	\N	\N	\N	\N	\N
926	441	6	0	\N	\N	\N	\N	\N
927	463	6	0	\N	\N	\N	\N	\N
928	464	6	0	\N	\N	\N	\N	\N
929	465	6	0	\N	\N	\N	\N	\N
930	466	6	0	\N	\N	\N	\N	\N
931	452	6	0	\N	\N	\N	\N	\N
932	453	6	0	\N	\N	\N	\N	\N
933	455	6	0	\N	\N	\N	\N	\N
934	457	6	0	\N	\N	\N	\N	\N
935	461	6	0	\N	\N	\N	\N	\N
936	427	6	0	\N	\N	\N	\N	\N
937	428	6	0	\N	\N	\N	\N	\N
938	429	6	0	\N	\N	\N	\N	\N
939	430	6	0	\N	\N	\N	\N	\N
940	431	6	0	\N	\N	\N	\N	\N
941	432	6	0	\N	\N	\N	\N	\N
942	433	6	0	\N	\N	\N	\N	\N
943	434	6	0	\N	\N	\N	\N	\N
944	436	6	0	\N	\N	\N	\N	\N
945	437	6	0	\N	\N	\N	\N	\N
946	438	6	0	\N	\N	\N	\N	\N
947	448	6	0	\N	\N	\N	\N	\N
948	449	6	0	\N	\N	\N	\N	\N
949	440	6	0	\N	\N	\N	\N	\N
950	450	6	0	\N	\N	\N	\N	\N
951	442	6	0	\N	\N	\N	\N	\N
952	459	6	0	\N	\N	\N	\N	\N
953	443	6	0	\N	\N	\N	\N	\N
954	444	6	0	\N	\N	\N	\N	\N
955	445	6	0	\N	\N	\N	\N	\N
956	497	6	0	\N	\N	\N	\N	\N
957	482	6	0	\N	\N	\N	\N	\N
958	470	6	0	\N	\N	\N	\N	\N
959	491	6	0	\N	\N	\N	\N	\N
960	503	6	0	\N	\N	\N	\N	\N
961	504	6	0	\N	\N	\N	\N	\N
962	467	6	0	\N	\N	\N	\N	\N
963	468	6	0	\N	\N	\N	\N	\N
964	469	6	0	\N	\N	\N	\N	\N
965	483	6	0	\N	\N	\N	\N	\N
966	484	6	0	\N	\N	\N	\N	\N
967	485	6	0	\N	\N	\N	\N	\N
968	486	6	0	\N	\N	\N	\N	\N
969	487	6	0	\N	\N	\N	\N	\N
970	488	6	0	\N	\N	\N	\N	\N
971	489	6	0	\N	\N	\N	\N	\N
972	473	6	0	\N	\N	\N	\N	\N
973	474	6	0	\N	\N	\N	\N	\N
974	475	6	0	\N	\N	\N	\N	\N
975	476	6	0	\N	\N	\N	\N	\N
976	477	6	0	\N	\N	\N	\N	\N
977	479	6	0	\N	\N	\N	\N	\N
978	480	6	0	\N	\N	\N	\N	\N
979	481	6	0	\N	\N	\N	\N	\N
980	498	6	0	\N	\N	\N	\N	\N
981	499	6	0	\N	\N	\N	\N	\N
982	501	6	0	\N	\N	\N	\N	\N
983	505	6	0	\N	\N	\N	\N	\N
984	506	6	0	\N	\N	\N	\N	\N
985	492	6	0	\N	\N	\N	\N	\N
986	496	6	0	\N	\N	\N	\N	\N
987	493	6	0	\N	\N	\N	\N	\N
988	494	6	0	\N	\N	\N	\N	\N
989	522	6	0	\N	\N	\N	\N	\N
990	508	6	0	\N	\N	\N	\N	\N
991	509	6	0	\N	\N	\N	\N	\N
992	531	6	0	\N	\N	\N	\N	\N
993	532	6	0	\N	\N	\N	\N	\N
994	512	6	0	\N	\N	\N	\N	\N
995	513	6	0	\N	\N	\N	\N	\N
996	514	6	0	\N	\N	\N	\N	\N
997	515	6	0	\N	\N	\N	\N	\N
998	516	6	0	\N	\N	\N	\N	\N
999	517	6	0	\N	\N	\N	\N	\N
1000	518	6	0	\N	\N	\N	\N	\N
1001	519	6	0	\N	\N	\N	\N	\N
1002	526	6	0	\N	\N	\N	\N	\N
1003	527	6	0	\N	\N	\N	\N	\N
1004	528	6	0	\N	\N	\N	\N	\N
1005	530	6	0	\N	\N	\N	\N	\N
1006	510	6	0	\N	\N	\N	\N	\N
1007	511	6	0	\N	\N	\N	\N	\N
1008	533	6	0	\N	\N	\N	\N	\N
1009	534	6	0	\N	\N	\N	\N	\N
1010	535	6	0	\N	\N	\N	\N	\N
1011	536	6	0	\N	\N	\N	\N	\N
1012	537	6	0	\N	\N	\N	\N	\N
1013	538	6	0	\N	\N	\N	\N	\N
1014	539	6	0	\N	\N	\N	\N	\N
1015	540	6	0	\N	\N	\N	\N	\N
1016	541	6	0	\N	\N	\N	\N	\N
1017	542	6	0	\N	\N	\N	\N	\N
1018	543	6	0	\N	\N	\N	\N	\N
1019	544	6	0	\N	\N	\N	\N	\N
1020	545	6	0	\N	\N	\N	\N	\N
1021	546	6	0	\N	\N	\N	\N	\N
1022	547	6	0	\N	\N	\N	\N	\N
1023	548	6	0	\N	\N	\N	\N	\N
1024	520	6	0	\N	\N	\N	\N	\N
1025	563	6	0	\N	\N	\N	\N	\N
1026	553	6	0	\N	\N	\N	\N	\N
1027	555	6	0	\N	\N	\N	\N	\N
1028	565	6	0	\N	\N	\N	\N	\N
1029	570	6	0	\N	\N	\N	\N	\N
1030	576	6	0	\N	\N	\N	\N	\N
1031	566	6	0	\N	\N	\N	\N	\N
1032	578	6	0	\N	\N	\N	\N	\N
1033	554	6	0	\N	\N	\N	\N	\N
1034	562	6	0	\N	\N	\N	\N	\N
1035	556	6	0	\N	\N	\N	\N	\N
1036	567	6	0	\N	\N	\N	\N	\N
1037	572	6	0	\N	\N	\N	\N	\N
1038	573	6	0	\N	\N	\N	\N	\N
1039	571	6	0	\N	\N	\N	\N	\N
1040	549	6	0	\N	\N	\N	\N	\N
1041	550	6	0	\N	\N	\N	\N	\N
1042	564	6	0	\N	\N	\N	\N	\N
1043	559	6	0	\N	\N	\N	\N	\N
1044	568	6	0	\N	\N	\N	\N	\N
1045	574	6	0	\N	\N	\N	\N	\N
1046	579	6	0	\N	\N	\N	\N	\N
1047	575	6	0	\N	\N	\N	\N	\N
1048	3	6	0	\N	\N	\N	\N	\N
1049	249	6	0	\N	\N	\N	\N	\N
1050	310	6	0	\N	\N	\N	\N	\N
1051	320	6	0	\N	\N	\N	\N	\N
1052	521	6	0	\N	\N	\N	\N	\N
1053	164	6	0	\N	\N	\N	\N	\N
1054	369	6	0	\N	\N	\N	\N	\N
1055	391	6	0	\N	\N	\N	\N	\N
1056	173	6	0	\N	\N	\N	\N	\N
1057	100	6	0	\N	\N	\N	\N	\N
1058	35	6	0	\N	\N	\N	\N	\N
1059	197	6	0	\N	\N	\N	\N	\N
1060	246	6	0	\N	\N	\N	\N	\N
1061	523	6	0	\N	\N	\N	\N	\N
1062	65	6	0	\N	\N	\N	\N	\N
1063	99	6	0	\N	\N	\N	\N	\N
1064	524	6	0	\N	\N	\N	\N	\N
1065	557	6	0	\N	\N	\N	\N	\N
1066	18	6	0	\N	\N	\N	\N	\N
1067	149	6	0	\N	\N	\N	\N	\N
1068	189	6	0	\N	\N	\N	\N	\N
1069	211	6	0	\N	\N	\N	\N	\N
1070	308	6	0	\N	\N	\N	\N	\N
1071	363	6	0	\N	\N	\N	\N	\N
1072	425	6	0	\N	\N	\N	\N	\N
1073	456	6	0	\N	\N	\N	\N	\N
1074	525	6	0	\N	\N	\N	\N	\N
1075	224	6	0	\N	\N	\N	\N	\N
1076	239	6	0	\N	\N	\N	\N	\N
1077	259	6	0	\N	\N	\N	\N	\N
1078	260	6	0	\N	\N	\N	\N	\N
1079	261	6	0	\N	\N	\N	\N	\N
1080	282	6	0	\N	\N	\N	\N	\N
1081	326	6	0	\N	\N	\N	\N	\N
1082	31	8	0	\N	\N	\N	\N	\N
1083	32	8	0	\N	\N	\N	\N	\N
1084	33	8	0	\N	\N	\N	\N	\N
1085	34	8	0	\N	\N	\N	\N	\N
1086	172	8	0	\N	\N	\N	\N	\N
1087	4	8	0	\N	\N	\N	\N	\N
1088	5	8	0	\N	\N	\N	\N	\N
1089	6	8	0	\N	\N	\N	\N	\N
1090	7	8	0	\N	\N	\N	\N	\N
1091	8	8	0	\N	\N	\N	\N	\N
1092	9	8	0	\N	\N	\N	\N	\N
1093	10	8	0	\N	\N	\N	\N	\N
1094	11	8	0	\N	\N	\N	\N	\N
1095	12	8	0	\N	\N	\N	\N	\N
1096	13	8	0	\N	\N	\N	\N	\N
1097	14	8	0	\N	\N	\N	\N	\N
1098	15	8	0	\N	\N	\N	\N	\N
1099	16	8	0	\N	\N	\N	\N	\N
1100	17	8	0	\N	\N	\N	\N	\N
1101	19	8	0	\N	\N	\N	\N	\N
1102	20	8	0	\N	\N	\N	\N	\N
1103	21	8	0	\N	\N	\N	\N	\N
1104	22	8	0	\N	\N	\N	\N	\N
1105	23	8	0	\N	\N	\N	\N	\N
1106	24	8	0	\N	\N	\N	\N	\N
1107	25	8	0	\N	\N	\N	\N	\N
1108	26	8	0	\N	\N	\N	\N	\N
1109	27	8	0	\N	\N	\N	\N	\N
1110	28	8	0	\N	\N	\N	\N	\N
1111	29	8	0	\N	\N	\N	\N	\N
1112	30	8	0	\N	\N	\N	\N	\N
1113	62	8	0	\N	\N	\N	\N	\N
1114	61	8	0	\N	\N	\N	\N	\N
1115	63	8	0	\N	\N	\N	\N	\N
1116	64	8	0	\N	\N	\N	\N	\N
1117	36	8	0	\N	\N	\N	\N	\N
1118	37	8	0	\N	\N	\N	\N	\N
1119	38	8	0	\N	\N	\N	\N	\N
1120	39	8	0	\N	\N	\N	\N	\N
1121	40	8	0	\N	\N	\N	\N	\N
1122	41	8	0	\N	\N	\N	\N	\N
1123	42	8	0	\N	\N	\N	\N	\N
1124	43	8	0	\N	\N	\N	\N	\N
1125	44	8	0	\N	\N	\N	\N	\N
1126	45	8	0	\N	\N	\N	\N	\N
1127	46	8	0	\N	\N	\N	\N	\N
1128	47	8	0	\N	\N	\N	\N	\N
1129	48	8	0	\N	\N	\N	\N	\N
1130	49	8	0	\N	\N	\N	\N	\N
1131	50	8	0	\N	\N	\N	\N	\N
1132	51	8	0	\N	\N	\N	\N	\N
1133	52	8	0	\N	\N	\N	\N	\N
1134	53	8	0	\N	\N	\N	\N	\N
1135	54	8	0	\N	\N	\N	\N	\N
1136	56	8	0	\N	\N	\N	\N	\N
1137	57	8	0	\N	\N	\N	\N	\N
1138	58	8	0	\N	\N	\N	\N	\N
1139	59	8	0	\N	\N	\N	\N	\N
1140	60	8	0	\N	\N	\N	\N	\N
1141	92	8	0	\N	\N	\N	\N	\N
1142	93	8	0	\N	\N	\N	\N	\N
1143	94	8	0	\N	\N	\N	\N	\N
1144	95	8	0	\N	\N	\N	\N	\N
1145	96	8	0	\N	\N	\N	\N	\N
1146	97	8	0	\N	\N	\N	\N	\N
1147	66	8	0	\N	\N	\N	\N	\N
1148	67	8	0	\N	\N	\N	\N	\N
1149	68	8	0	\N	\N	\N	\N	\N
1150	69	8	0	\N	\N	\N	\N	\N
1151	70	8	0	\N	\N	\N	\N	\N
1152	72	8	0	\N	\N	\N	\N	\N
1153	73	8	0	\N	\N	\N	\N	\N
1154	74	8	0	\N	\N	\N	\N	\N
1155	75	8	0	\N	\N	\N	\N	\N
1156	76	8	0	\N	\N	\N	\N	\N
1157	77	8	0	\N	\N	\N	\N	\N
1158	78	8	0	\N	\N	\N	\N	\N
1159	79	8	0	\N	\N	\N	\N	\N
1160	80	8	0	\N	\N	\N	\N	\N
1161	81	8	0	\N	\N	\N	\N	\N
1162	82	8	0	\N	\N	\N	\N	\N
1163	83	8	0	\N	\N	\N	\N	\N
1164	84	8	0	\N	\N	\N	\N	\N
1165	85	8	0	\N	\N	\N	\N	\N
1166	86	8	0	\N	\N	\N	\N	\N
1167	87	8	0	\N	\N	\N	\N	\N
1168	88	8	0	\N	\N	\N	\N	\N
1169	89	8	0	\N	\N	\N	\N	\N
1170	90	8	0	\N	\N	\N	\N	\N
1171	127	8	0	\N	\N	\N	\N	\N
1172	128	8	0	\N	\N	\N	\N	\N
1173	129	8	0	\N	\N	\N	\N	\N
1174	130	8	0	\N	\N	\N	\N	\N
1175	131	8	0	\N	\N	\N	\N	\N
1176	132	8	0	\N	\N	\N	\N	\N
1177	133	8	0	\N	\N	\N	\N	\N
1178	134	8	0	\N	\N	\N	\N	\N
1179	135	8	0	\N	\N	\N	\N	\N
1180	101	8	0	\N	\N	\N	\N	\N
1181	102	8	0	\N	\N	\N	\N	\N
1182	103	8	0	\N	\N	\N	\N	\N
1183	104	8	0	\N	\N	\N	\N	\N
1184	105	8	0	\N	\N	\N	\N	\N
1185	106	8	0	\N	\N	\N	\N	\N
1186	107	8	0	\N	\N	\N	\N	\N
1187	108	8	0	\N	\N	\N	\N	\N
1188	109	8	0	\N	\N	\N	\N	\N
1189	110	8	0	\N	\N	\N	\N	\N
1190	111	8	0	\N	\N	\N	\N	\N
1191	112	8	0	\N	\N	\N	\N	\N
1192	113	8	0	\N	\N	\N	\N	\N
1193	114	8	0	\N	\N	\N	\N	\N
1194	115	8	0	\N	\N	\N	\N	\N
1195	116	8	0	\N	\N	\N	\N	\N
1196	117	8	0	\N	\N	\N	\N	\N
1197	118	8	0	\N	\N	\N	\N	\N
1198	119	8	0	\N	\N	\N	\N	\N
1199	120	8	0	\N	\N	\N	\N	\N
1200	121	8	0	\N	\N	\N	\N	\N
1201	122	8	0	\N	\N	\N	\N	\N
1202	124	8	0	\N	\N	\N	\N	\N
1203	125	8	0	\N	\N	\N	\N	\N
1204	126	8	0	\N	\N	\N	\N	\N
1205	165	8	0	\N	\N	\N	\N	\N
1206	166	8	0	\N	\N	\N	\N	\N
1207	167	8	0	\N	\N	\N	\N	\N
1208	168	8	0	\N	\N	\N	\N	\N
1209	169	8	0	\N	\N	\N	\N	\N
1210	170	8	0	\N	\N	\N	\N	\N
1211	171	8	0	\N	\N	\N	\N	\N
1212	136	8	0	\N	\N	\N	\N	\N
1213	137	8	0	\N	\N	\N	\N	\N
1214	138	8	0	\N	\N	\N	\N	\N
1215	139	8	0	\N	\N	\N	\N	\N
1216	140	8	0	\N	\N	\N	\N	\N
1217	141	8	0	\N	\N	\N	\N	\N
1218	142	8	0	\N	\N	\N	\N	\N
1219	143	8	0	\N	\N	\N	\N	\N
1220	144	8	0	\N	\N	\N	\N	\N
1221	145	8	0	\N	\N	\N	\N	\N
1222	146	8	0	\N	\N	\N	\N	\N
1223	147	8	0	\N	\N	\N	\N	\N
1224	148	8	0	\N	\N	\N	\N	\N
1225	150	8	0	\N	\N	\N	\N	\N
1226	151	8	0	\N	\N	\N	\N	\N
1227	152	8	0	\N	\N	\N	\N	\N
1228	153	8	0	\N	\N	\N	\N	\N
1229	154	8	0	\N	\N	\N	\N	\N
1230	155	8	0	\N	\N	\N	\N	\N
1231	156	8	0	\N	\N	\N	\N	\N
1232	157	8	0	\N	\N	\N	\N	\N
1233	158	8	0	\N	\N	\N	\N	\N
1234	159	8	0	\N	\N	\N	\N	\N
1235	160	8	0	\N	\N	\N	\N	\N
1236	162	8	0	\N	\N	\N	\N	\N
1237	163	8	0	\N	\N	\N	\N	\N
1238	202	8	0	\N	\N	\N	\N	\N
1239	203	8	0	\N	\N	\N	\N	\N
1240	204	8	0	\N	\N	\N	\N	\N
1241	205	8	0	\N	\N	\N	\N	\N
1242	206	8	0	\N	\N	\N	\N	\N
1243	207	8	0	\N	\N	\N	\N	\N
1244	208	8	0	\N	\N	\N	\N	\N
1245	209	8	0	\N	\N	\N	\N	\N
1246	174	8	0	\N	\N	\N	\N	\N
1247	175	8	0	\N	\N	\N	\N	\N
1248	176	8	0	\N	\N	\N	\N	\N
1249	178	8	0	\N	\N	\N	\N	\N
1250	179	8	0	\N	\N	\N	\N	\N
1251	180	8	0	\N	\N	\N	\N	\N
1252	181	8	0	\N	\N	\N	\N	\N
1253	182	8	0	\N	\N	\N	\N	\N
1254	183	8	0	\N	\N	\N	\N	\N
1255	184	8	0	\N	\N	\N	\N	\N
1256	185	8	0	\N	\N	\N	\N	\N
1257	186	8	0	\N	\N	\N	\N	\N
1258	187	8	0	\N	\N	\N	\N	\N
1259	188	8	0	\N	\N	\N	\N	\N
1260	190	8	0	\N	\N	\N	\N	\N
1261	191	8	0	\N	\N	\N	\N	\N
1262	192	8	0	\N	\N	\N	\N	\N
1263	193	8	0	\N	\N	\N	\N	\N
1264	194	8	0	\N	\N	\N	\N	\N
1265	195	8	0	\N	\N	\N	\N	\N
1266	196	8	0	\N	\N	\N	\N	\N
1267	198	8	0	\N	\N	\N	\N	\N
1268	199	8	0	\N	\N	\N	\N	\N
1269	201	8	0	\N	\N	\N	\N	\N
1270	238	8	0	\N	\N	\N	\N	\N
1271	215	8	0	\N	\N	\N	\N	\N
1272	216	8	0	\N	\N	\N	\N	\N
1273	217	8	0	\N	\N	\N	\N	\N
1274	218	8	0	\N	\N	\N	\N	\N
1275	219	8	0	\N	\N	\N	\N	\N
1276	220	8	0	\N	\N	\N	\N	\N
1277	221	8	0	\N	\N	\N	\N	\N
1278	222	8	0	\N	\N	\N	\N	\N
1279	223	8	0	\N	\N	\N	\N	\N
1280	225	8	0	\N	\N	\N	\N	\N
1281	226	8	0	\N	\N	\N	\N	\N
1282	227	8	0	\N	\N	\N	\N	\N
1283	228	8	0	\N	\N	\N	\N	\N
1284	230	8	0	\N	\N	\N	\N	\N
1285	231	8	0	\N	\N	\N	\N	\N
1286	233	8	0	\N	\N	\N	\N	\N
1287	234	8	0	\N	\N	\N	\N	\N
1288	212	8	0	\N	\N	\N	\N	\N
1289	213	8	0	\N	\N	\N	\N	\N
1290	214	8	0	\N	\N	\N	\N	\N
1291	240	8	0	\N	\N	\N	\N	\N
1292	241	8	0	\N	\N	\N	\N	\N
1293	242	8	0	\N	\N	\N	\N	\N
1294	243	8	0	\N	\N	\N	\N	\N
1295	244	8	0	\N	\N	\N	\N	\N
1296	245	8	0	\N	\N	\N	\N	\N
1297	356	8	0	\N	\N	\N	\N	\N
1298	236	8	0	\N	\N	\N	\N	\N
1299	237	8	0	\N	\N	\N	\N	\N
1300	277	8	0	\N	\N	\N	\N	\N
1301	279	8	0	\N	\N	\N	\N	\N
1302	247	8	0	\N	\N	\N	\N	\N
1303	250	8	0	\N	\N	\N	\N	\N
1304	252	8	0	\N	\N	\N	\N	\N
1305	254	8	0	\N	\N	\N	\N	\N
1306	255	8	0	\N	\N	\N	\N	\N
1307	256	8	0	\N	\N	\N	\N	\N
1308	258	8	0	\N	\N	\N	\N	\N
1309	263	8	0	\N	\N	\N	\N	\N
1310	265	8	0	\N	\N	\N	\N	\N
1311	267	8	0	\N	\N	\N	\N	\N
1312	269	8	0	\N	\N	\N	\N	\N
1313	271	8	0	\N	\N	\N	\N	\N
1314	273	8	0	\N	\N	\N	\N	\N
1315	275	8	0	\N	\N	\N	\N	\N
1316	276	8	0	\N	\N	\N	\N	\N
1317	278	8	0	\N	\N	\N	\N	\N
1318	280	8	0	\N	\N	\N	\N	\N
1319	281	8	0	\N	\N	\N	\N	\N
1320	248	8	0	\N	\N	\N	\N	\N
1321	257	8	0	\N	\N	\N	\N	\N
1322	262	8	0	\N	\N	\N	\N	\N
1323	264	8	0	\N	\N	\N	\N	\N
1324	266	8	0	\N	\N	\N	\N	\N
1325	268	8	0	\N	\N	\N	\N	\N
1326	270	8	0	\N	\N	\N	\N	\N
1327	272	8	0	\N	\N	\N	\N	\N
1328	274	8	0	\N	\N	\N	\N	\N
1329	251	8	0	\N	\N	\N	\N	\N
1330	253	8	0	\N	\N	\N	\N	\N
1331	311	8	0	\N	\N	\N	\N	\N
1332	312	8	0	\N	\N	\N	\N	\N
1333	313	8	0	\N	\N	\N	\N	\N
1334	314	8	0	\N	\N	\N	\N	\N
1335	316	8	0	\N	\N	\N	\N	\N
1336	317	8	0	\N	\N	\N	\N	\N
1337	318	8	0	\N	\N	\N	\N	\N
1338	319	8	0	\N	\N	\N	\N	\N
1339	283	8	0	\N	\N	\N	\N	\N
1340	285	8	0	\N	\N	\N	\N	\N
1341	286	8	0	\N	\N	\N	\N	\N
1342	287	8	0	\N	\N	\N	\N	\N
1343	288	8	0	\N	\N	\N	\N	\N
1344	289	8	0	\N	\N	\N	\N	\N
1345	290	8	0	\N	\N	\N	\N	\N
1346	291	8	0	\N	\N	\N	\N	\N
1347	292	8	0	\N	\N	\N	\N	\N
1348	293	8	0	\N	\N	\N	\N	\N
1349	294	8	0	\N	\N	\N	\N	\N
1350	295	8	0	\N	\N	\N	\N	\N
1351	296	8	0	\N	\N	\N	\N	\N
1352	297	8	0	\N	\N	\N	\N	\N
1353	298	8	0	\N	\N	\N	\N	\N
1354	299	8	0	\N	\N	\N	\N	\N
1355	300	8	0	\N	\N	\N	\N	\N
1356	301	8	0	\N	\N	\N	\N	\N
1357	302	8	0	\N	\N	\N	\N	\N
1358	303	8	0	\N	\N	\N	\N	\N
1359	304	8	0	\N	\N	\N	\N	\N
1360	305	8	0	\N	\N	\N	\N	\N
1361	306	8	0	\N	\N	\N	\N	\N
1362	307	8	0	\N	\N	\N	\N	\N
1363	309	8	0	\N	\N	\N	\N	\N
1364	348	8	0	\N	\N	\N	\N	\N
1365	339	8	0	\N	\N	\N	\N	\N
1366	349	8	0	\N	\N	\N	\N	\N
1367	350	8	0	\N	\N	\N	\N	\N
1368	351	8	0	\N	\N	\N	\N	\N
1369	352	8	0	\N	\N	\N	\N	\N
1370	353	8	0	\N	\N	\N	\N	\N
1371	354	8	0	\N	\N	\N	\N	\N
1372	355	8	0	\N	\N	\N	\N	\N
1373	321	8	0	\N	\N	\N	\N	\N
1374	322	8	0	\N	\N	\N	\N	\N
1375	323	8	0	\N	\N	\N	\N	\N
1376	324	8	0	\N	\N	\N	\N	\N
1377	325	8	0	\N	\N	\N	\N	\N
1378	327	8	0	\N	\N	\N	\N	\N
1379	328	8	0	\N	\N	\N	\N	\N
1380	329	8	0	\N	\N	\N	\N	\N
1381	330	8	0	\N	\N	\N	\N	\N
1382	331	8	0	\N	\N	\N	\N	\N
1383	332	8	0	\N	\N	\N	\N	\N
1384	333	8	0	\N	\N	\N	\N	\N
1385	334	8	0	\N	\N	\N	\N	\N
1386	335	8	0	\N	\N	\N	\N	\N
1387	336	8	0	\N	\N	\N	\N	\N
1388	337	8	0	\N	\N	\N	\N	\N
1389	338	8	0	\N	\N	\N	\N	\N
1390	340	8	0	\N	\N	\N	\N	\N
1391	341	8	0	\N	\N	\N	\N	\N
1392	342	8	0	\N	\N	\N	\N	\N
1393	343	8	0	\N	\N	\N	\N	\N
1394	344	8	0	\N	\N	\N	\N	\N
1395	345	8	0	\N	\N	\N	\N	\N
1396	346	8	0	\N	\N	\N	\N	\N
1397	370	8	0	\N	\N	\N	\N	\N
1398	365	8	0	\N	\N	\N	\N	\N
1399	366	8	0	\N	\N	\N	\N	\N
1400	367	8	0	\N	\N	\N	\N	\N
1401	210	8	0	\N	\N	\N	\N	\N
1402	357	8	0	\N	\N	\N	\N	\N
1403	359	8	0	\N	\N	\N	\N	\N
1404	360	8	0	\N	\N	\N	\N	\N
1405	361	8	0	\N	\N	\N	\N	\N
1406	362	8	0	\N	\N	\N	\N	\N
1407	364	8	0	\N	\N	\N	\N	\N
1408	371	8	0	\N	\N	\N	\N	\N
1409	372	8	0	\N	\N	\N	\N	\N
1410	373	8	0	\N	\N	\N	\N	\N
1411	374	8	0	\N	\N	\N	\N	\N
1412	375	8	0	\N	\N	\N	\N	\N
1413	376	8	0	\N	\N	\N	\N	\N
1414	377	8	0	\N	\N	\N	\N	\N
1415	378	8	0	\N	\N	\N	\N	\N
1416	379	8	0	\N	\N	\N	\N	\N
1417	380	8	0	\N	\N	\N	\N	\N
1418	381	8	0	\N	\N	\N	\N	\N
1419	382	8	0	\N	\N	\N	\N	\N
1420	383	8	0	\N	\N	\N	\N	\N
1421	384	8	0	\N	\N	\N	\N	\N
1422	385	8	0	\N	\N	\N	\N	\N
1423	386	8	0	\N	\N	\N	\N	\N
1424	387	8	0	\N	\N	\N	\N	\N
1425	388	8	0	\N	\N	\N	\N	\N
1426	389	8	0	\N	\N	\N	\N	\N
1427	390	8	0	\N	\N	\N	\N	\N
1428	507	8	0	\N	\N	\N	\N	\N
1429	368	8	0	\N	\N	\N	\N	\N
1430	420	8	0	\N	\N	\N	\N	\N
1431	393	8	0	\N	\N	\N	\N	\N
1432	394	8	0	\N	\N	\N	\N	\N
1433	395	8	0	\N	\N	\N	\N	\N
1434	396	8	0	\N	\N	\N	\N	\N
1435	397	8	0	\N	\N	\N	\N	\N
1436	398	8	0	\N	\N	\N	\N	\N
1437	399	8	0	\N	\N	\N	\N	\N
1438	400	8	0	\N	\N	\N	\N	\N
1439	401	8	0	\N	\N	\N	\N	\N
1440	402	8	0	\N	\N	\N	\N	\N
1441	2	8	0	\N	\N	\N	\N	\N
1443	404	8	0	\N	\N	\N	\N	\N
1444	405	8	0	\N	\N	\N	\N	\N
1445	406	8	0	\N	\N	\N	\N	\N
1446	407	8	0	\N	\N	\N	\N	\N
1447	408	8	0	\N	\N	\N	\N	\N
1448	409	8	0	\N	\N	\N	\N	\N
1449	410	8	0	\N	\N	\N	\N	\N
1450	411	8	0	\N	\N	\N	\N	\N
1451	412	8	0	\N	\N	\N	\N	\N
1452	413	8	0	\N	\N	\N	\N	\N
1453	392	8	0	\N	\N	\N	\N	\N
1454	419	8	0	\N	\N	\N	\N	\N
1455	421	8	0	\N	\N	\N	\N	\N
1456	422	8	0	\N	\N	\N	\N	\N
1457	423	8	0	\N	\N	\N	\N	\N
1458	424	8	0	\N	\N	\N	\N	\N
1459	426	8	0	\N	\N	\N	\N	\N
1460	416	8	0	\N	\N	\N	\N	\N
1461	417	8	0	\N	\N	\N	\N	\N
1462	418	8	0	\N	\N	\N	\N	\N
1463	447	8	0	\N	\N	\N	\N	\N
1464	448	8	0	\N	\N	\N	\N	\N
1465	440	8	0	\N	\N	\N	\N	\N
1466	459	8	0	\N	\N	\N	\N	\N
1467	442	8	0	\N	\N	\N	\N	\N
1468	463	8	0	\N	\N	\N	\N	\N
1469	464	8	0	\N	\N	\N	\N	\N
1470	465	8	0	\N	\N	\N	\N	\N
1471	466	8	0	\N	\N	\N	\N	\N
1472	452	8	0	\N	\N	\N	\N	\N
1473	453	8	0	\N	\N	\N	\N	\N
1474	455	8	0	\N	\N	\N	\N	\N
1475	457	8	0	\N	\N	\N	\N	\N
1476	461	8	0	\N	\N	\N	\N	\N
1477	427	8	0	\N	\N	\N	\N	\N
1478	428	8	0	\N	\N	\N	\N	\N
1479	429	8	0	\N	\N	\N	\N	\N
1480	430	8	0	\N	\N	\N	\N	\N
1481	431	8	0	\N	\N	\N	\N	\N
1482	432	8	0	\N	\N	\N	\N	\N
1483	433	8	0	\N	\N	\N	\N	\N
1484	434	8	0	\N	\N	\N	\N	\N
1485	436	8	0	\N	\N	\N	\N	\N
1486	437	8	0	\N	\N	\N	\N	\N
1487	438	8	0	\N	\N	\N	\N	\N
1488	439	8	0	\N	\N	\N	\N	\N
1489	449	8	0	\N	\N	\N	\N	\N
1490	450	8	0	\N	\N	\N	\N	\N
1491	441	8	0	\N	\N	\N	\N	\N
1492	443	8	0	\N	\N	\N	\N	\N
1493	444	8	0	\N	\N	\N	\N	\N
1494	445	8	0	\N	\N	\N	\N	\N
1495	446	8	0	\N	\N	\N	\N	\N
1496	498	8	0	\N	\N	\N	\N	\N
1497	467	8	0	\N	\N	\N	\N	\N
1498	483	8	0	\N	\N	\N	\N	\N
1499	492	8	0	\N	\N	\N	\N	\N
1500	504	8	0	\N	\N	\N	\N	\N
1501	505	8	0	\N	\N	\N	\N	\N
1502	468	8	0	\N	\N	\N	\N	\N
1503	469	8	0	\N	\N	\N	\N	\N
1504	470	8	0	\N	\N	\N	\N	\N
1505	484	8	0	\N	\N	\N	\N	\N
1506	485	8	0	\N	\N	\N	\N	\N
1507	486	8	0	\N	\N	\N	\N	\N
1508	487	8	0	\N	\N	\N	\N	\N
1509	488	8	0	\N	\N	\N	\N	\N
1510	489	8	0	\N	\N	\N	\N	\N
1511	473	8	0	\N	\N	\N	\N	\N
1512	474	8	0	\N	\N	\N	\N	\N
1513	475	8	0	\N	\N	\N	\N	\N
1514	476	8	0	\N	\N	\N	\N	\N
1515	477	8	0	\N	\N	\N	\N	\N
1516	479	8	0	\N	\N	\N	\N	\N
1517	480	8	0	\N	\N	\N	\N	\N
1518	481	8	0	\N	\N	\N	\N	\N
1519	482	8	0	\N	\N	\N	\N	\N
1520	499	8	0	\N	\N	\N	\N	\N
1521	501	8	0	\N	\N	\N	\N	\N
1522	491	8	0	\N	\N	\N	\N	\N
1523	506	8	0	\N	\N	\N	\N	\N
1524	493	8	0	\N	\N	\N	\N	\N
1525	503	8	0	\N	\N	\N	\N	\N
1526	497	8	0	\N	\N	\N	\N	\N
1527	494	8	0	\N	\N	\N	\N	\N
1528	496	8	0	\N	\N	\N	\N	\N
1529	526	8	0	\N	\N	\N	\N	\N
1530	508	8	0	\N	\N	\N	\N	\N
1531	509	8	0	\N	\N	\N	\N	\N
1532	510	8	0	\N	\N	\N	\N	\N
1533	532	8	0	\N	\N	\N	\N	\N
1534	533	8	0	\N	\N	\N	\N	\N
1535	513	8	0	\N	\N	\N	\N	\N
1536	514	8	0	\N	\N	\N	\N	\N
1537	515	8	0	\N	\N	\N	\N	\N
1538	516	8	0	\N	\N	\N	\N	\N
1539	517	8	0	\N	\N	\N	\N	\N
1540	518	8	0	\N	\N	\N	\N	\N
1541	519	8	0	\N	\N	\N	\N	\N
1542	527	8	0	\N	\N	\N	\N	\N
1543	528	8	0	\N	\N	\N	\N	\N
1544	530	8	0	\N	\N	\N	\N	\N
1545	531	8	0	\N	\N	\N	\N	\N
1546	511	8	0	\N	\N	\N	\N	\N
1547	512	8	0	\N	\N	\N	\N	\N
1548	534	8	0	\N	\N	\N	\N	\N
1549	535	8	0	\N	\N	\N	\N	\N
1550	536	8	0	\N	\N	\N	\N	\N
1551	537	8	0	\N	\N	\N	\N	\N
1552	538	8	0	\N	\N	\N	\N	\N
1553	539	8	0	\N	\N	\N	\N	\N
1554	540	8	0	\N	\N	\N	\N	\N
1555	541	8	0	\N	\N	\N	\N	\N
1556	542	8	0	\N	\N	\N	\N	\N
1557	543	8	0	\N	\N	\N	\N	\N
1558	544	8	0	\N	\N	\N	\N	\N
1559	545	8	0	\N	\N	\N	\N	\N
1560	546	8	0	\N	\N	\N	\N	\N
1561	547	8	0	\N	\N	\N	\N	\N
1562	548	8	0	\N	\N	\N	\N	\N
1563	520	8	0	\N	\N	\N	\N	\N
1564	522	8	0	\N	\N	\N	\N	\N
1565	564	8	0	\N	\N	\N	\N	\N
1566	554	8	0	\N	\N	\N	\N	\N
1567	556	8	0	\N	\N	\N	\N	\N
1568	571	8	0	\N	\N	\N	\N	\N
1569	3	8	0	\N	\N	\N	\N	\N
1570	575	8	0	\N	\N	\N	\N	\N
1571	563	8	0	\N	\N	\N	\N	\N
1572	555	8	0	\N	\N	\N	\N	\N
1573	572	8	0	\N	\N	\N	\N	\N
1574	568	8	0	\N	\N	\N	\N	\N
1575	573	8	0	\N	\N	\N	\N	\N
1576	574	8	0	\N	\N	\N	\N	\N
1577	553	8	0	\N	\N	\N	\N	\N
1578	549	8	0	\N	\N	\N	\N	\N
1579	550	8	0	\N	\N	\N	\N	\N
1580	562	8	0	\N	\N	\N	\N	\N
1581	565	8	0	\N	\N	\N	\N	\N
1582	559	8	0	\N	\N	\N	\N	\N
1583	567	8	0	\N	\N	\N	\N	\N
1584	566	8	0	\N	\N	\N	\N	\N
1585	570	8	0	\N	\N	\N	\N	\N
1586	579	8	0	\N	\N	\N	\N	\N
1587	576	8	0	\N	\N	\N	\N	\N
1588	578	8	0	\N	\N	\N	\N	\N
1589	149	8	0	\N	\N	\N	\N	\N
1590	308	8	0	\N	\N	\N	\N	\N
1591	320	8	0	\N	\N	\N	\N	\N
1592	363	8	0	\N	\N	\N	\N	\N
1593	523	8	0	\N	\N	\N	\N	\N
1594	521	8	0	\N	\N	\N	\N	\N
1595	425	8	0	\N	\N	\N	\N	\N
1596	173	8	0	\N	\N	\N	\N	\N
1597	391	8	0	\N	\N	\N	\N	\N
1598	189	8	0	\N	\N	\N	\N	\N
1599	65	8	0	\N	\N	\N	\N	\N
1600	211	8	0	\N	\N	\N	\N	\N
1601	249	8	0	\N	\N	\N	\N	\N
1602	456	8	0	\N	\N	\N	\N	\N
1603	524	8	0	\N	\N	\N	\N	\N
1604	99	8	0	\N	\N	\N	\N	\N
1605	100	8	0	\N	\N	\N	\N	\N
1606	525	8	0	\N	\N	\N	\N	\N
1607	35	8	0	\N	\N	\N	\N	\N
1608	164	8	0	\N	\N	\N	\N	\N
1609	197	8	0	\N	\N	\N	\N	\N
1610	224	8	0	\N	\N	\N	\N	\N
1611	310	8	0	\N	\N	\N	\N	\N
1612	369	8	0	\N	\N	\N	\N	\N
1613	557	8	0	\N	\N	\N	\N	\N
1614	18	8	0	\N	\N	\N	\N	\N
1615	246	8	0	\N	\N	\N	\N	\N
1616	239	8	0	\N	\N	\N	\N	\N
1617	259	8	0	\N	\N	\N	\N	\N
1618	260	8	0	\N	\N	\N	\N	\N
1619	261	8	0	\N	\N	\N	\N	\N
1620	282	8	0	\N	\N	\N	\N	\N
1621	326	8	0	\N	\N	\N	\N	\N
1442	403	8	1	2017-04-21 11:03:51	ffff	545454.540000000037	656565.949999999953	\N
1684	43	5	0	\N	\N	\N	\N	\N
1685	44	5	0	\N	\N	\N	\N	\N
1686	45	5	0	\N	\N	\N	\N	\N
1687	46	5	0	\N	\N	\N	\N	\N
1688	47	5	0	\N	\N	\N	\N	\N
1689	48	5	0	\N	\N	\N	\N	\N
1690	49	5	0	\N	\N	\N	\N	\N
1691	50	5	0	\N	\N	\N	\N	\N
1692	51	5	0	\N	\N	\N	\N	\N
1693	52	5	0	\N	\N	\N	\N	\N
1694	53	5	0	\N	\N	\N	\N	\N
1695	54	5	0	\N	\N	\N	\N	\N
1696	56	5	0	\N	\N	\N	\N	\N
1697	57	5	0	\N	\N	\N	\N	\N
903	403	6	1	2017-04-24 10:43:25	\N	8784484.48000000045	656565.949999999953	\N
1622	98	8	0	\N	\N	\N	\N	\N
1623	123	8	0	\N	\N	\N	\N	\N
1624	161	8	0	\N	\N	\N	\N	\N
1625	1	8	0	\N	\N	\N	\N	\N
1626	235	8	0	\N	\N	\N	\N	\N
1627	315	8	0	\N	\N	\N	\N	\N
1628	347	8	0	\N	\N	\N	\N	\N
1629	358	8	0	\N	\N	\N	\N	\N
1630	478	8	0	\N	\N	\N	\N	\N
1631	529	8	0	\N	\N	\N	\N	\N
1632	435	8	0	\N	\N	\N	\N	\N
1633	490	8	0	\N	\N	\N	\N	\N
1634	495	8	0	\N	\N	\N	\N	\N
1635	451	8	0	\N	\N	\N	\N	\N
1636	454	8	0	\N	\N	\N	\N	\N
1637	458	8	0	\N	\N	\N	\N	\N
1638	414	8	0	\N	\N	\N	\N	\N
1639	460	8	0	\N	\N	\N	\N	\N
1640	462	8	0	\N	\N	\N	\N	\N
1641	551	8	0	\N	\N	\N	\N	\N
1642	552	8	0	\N	\N	\N	\N	\N
1643	502	8	0	\N	\N	\N	\N	\N
1644	500	8	0	\N	\N	\N	\N	\N
1645	471	8	0	\N	\N	\N	\N	\N
1646	472	8	0	\N	\N	\N	\N	\N
1647	558	8	0	\N	\N	\N	\N	\N
1648	415	8	0	\N	\N	\N	\N	\N
1649	560	8	0	\N	\N	\N	\N	\N
1650	561	8	0	\N	\N	\N	\N	\N
780	281	6	1	2017-04-25 14:26:40	1,2	1545	1	1
1651	9	5	0	\N	\N	\N	\N	\N
1652	10	5	0	\N	\N	\N	\N	\N
1653	11	5	0	\N	\N	\N	\N	\N
1654	12	5	0	\N	\N	\N	\N	\N
1655	13	5	0	\N	\N	\N	\N	\N
1656	14	5	0	\N	\N	\N	\N	\N
1657	15	5	0	\N	\N	\N	\N	\N
1658	16	5	0	\N	\N	\N	\N	\N
1659	17	5	0	\N	\N	\N	\N	\N
1660	19	5	0	\N	\N	\N	\N	\N
1661	20	5	0	\N	\N	\N	\N	\N
1662	21	5	0	\N	\N	\N	\N	\N
1663	22	5	0	\N	\N	\N	\N	\N
1664	23	5	0	\N	\N	\N	\N	\N
1665	24	5	0	\N	\N	\N	\N	\N
1666	25	5	0	\N	\N	\N	\N	\N
1667	26	5	0	\N	\N	\N	\N	\N
1668	27	5	0	\N	\N	\N	\N	\N
1669	28	5	0	\N	\N	\N	\N	\N
1670	29	5	0	\N	\N	\N	\N	\N
1671	30	5	0	\N	\N	\N	\N	\N
1672	31	5	0	\N	\N	\N	\N	\N
1673	32	5	0	\N	\N	\N	\N	\N
1674	33	5	0	\N	\N	\N	\N	\N
1675	34	5	0	\N	\N	\N	\N	\N
1676	172	5	0	\N	\N	\N	\N	\N
1677	4	5	0	\N	\N	\N	\N	\N
1678	5	5	0	\N	\N	\N	\N	\N
1679	6	5	0	\N	\N	\N	\N	\N
1680	7	5	0	\N	\N	\N	\N	\N
1681	8	5	0	\N	\N	\N	\N	\N
1682	42	5	0	\N	\N	\N	\N	\N
1683	41	5	0	\N	\N	\N	\N	\N
1698	58	5	0	\N	\N	\N	\N	\N
1699	59	5	0	\N	\N	\N	\N	\N
1700	60	5	0	\N	\N	\N	\N	\N
1701	61	5	0	\N	\N	\N	\N	\N
1702	62	5	0	\N	\N	\N	\N	\N
1703	63	5	0	\N	\N	\N	\N	\N
1704	64	5	0	\N	\N	\N	\N	\N
1705	36	5	0	\N	\N	\N	\N	\N
1706	37	5	0	\N	\N	\N	\N	\N
1707	38	5	0	\N	\N	\N	\N	\N
1708	39	5	0	\N	\N	\N	\N	\N
1709	40	5	0	\N	\N	\N	\N	\N
1710	69	5	0	\N	\N	\N	\N	\N
1711	70	5	0	\N	\N	\N	\N	\N
1712	72	5	0	\N	\N	\N	\N	\N
1713	73	5	0	\N	\N	\N	\N	\N
1714	74	5	0	\N	\N	\N	\N	\N
1715	75	5	0	\N	\N	\N	\N	\N
1716	76	5	0	\N	\N	\N	\N	\N
1717	77	5	0	\N	\N	\N	\N	\N
1718	78	5	0	\N	\N	\N	\N	\N
1719	79	5	0	\N	\N	\N	\N	\N
1720	80	5	0	\N	\N	\N	\N	\N
1721	81	5	0	\N	\N	\N	\N	\N
1722	82	5	0	\N	\N	\N	\N	\N
1723	83	5	0	\N	\N	\N	\N	\N
1724	84	5	0	\N	\N	\N	\N	\N
1725	85	5	0	\N	\N	\N	\N	\N
1726	86	5	0	\N	\N	\N	\N	\N
1727	87	5	0	\N	\N	\N	\N	\N
1728	88	5	0	\N	\N	\N	\N	\N
1729	89	5	0	\N	\N	\N	\N	\N
1730	90	5	0	\N	\N	\N	\N	\N
1731	92	5	0	\N	\N	\N	\N	\N
1732	93	5	0	\N	\N	\N	\N	\N
1733	94	5	0	\N	\N	\N	\N	\N
1734	95	5	0	\N	\N	\N	\N	\N
1735	96	5	0	\N	\N	\N	\N	\N
1736	97	5	0	\N	\N	\N	\N	\N
1737	66	5	0	\N	\N	\N	\N	\N
1738	67	5	0	\N	\N	\N	\N	\N
1739	68	5	0	\N	\N	\N	\N	\N
1740	102	5	0	\N	\N	\N	\N	\N
1741	103	5	0	\N	\N	\N	\N	\N
1742	104	5	0	\N	\N	\N	\N	\N
1743	105	5	0	\N	\N	\N	\N	\N
1744	106	5	0	\N	\N	\N	\N	\N
1745	107	5	0	\N	\N	\N	\N	\N
1746	108	5	0	\N	\N	\N	\N	\N
1747	109	5	0	\N	\N	\N	\N	\N
1748	110	5	0	\N	\N	\N	\N	\N
1749	111	5	0	\N	\N	\N	\N	\N
1750	112	5	0	\N	\N	\N	\N	\N
1751	113	5	0	\N	\N	\N	\N	\N
1752	114	5	0	\N	\N	\N	\N	\N
1753	115	5	0	\N	\N	\N	\N	\N
1754	116	5	0	\N	\N	\N	\N	\N
1755	117	5	0	\N	\N	\N	\N	\N
1756	118	5	0	\N	\N	\N	\N	\N
1757	119	5	0	\N	\N	\N	\N	\N
1758	120	5	0	\N	\N	\N	\N	\N
1759	121	5	0	\N	\N	\N	\N	\N
1760	122	5	0	\N	\N	\N	\N	\N
1761	124	5	0	\N	\N	\N	\N	\N
1762	125	5	0	\N	\N	\N	\N	\N
1763	126	5	0	\N	\N	\N	\N	\N
1764	127	5	0	\N	\N	\N	\N	\N
1765	128	5	0	\N	\N	\N	\N	\N
1766	129	5	0	\N	\N	\N	\N	\N
1767	130	5	0	\N	\N	\N	\N	\N
1768	131	5	0	\N	\N	\N	\N	\N
1769	132	5	0	\N	\N	\N	\N	\N
1770	133	5	0	\N	\N	\N	\N	\N
1771	134	5	0	\N	\N	\N	\N	\N
1772	135	5	0	\N	\N	\N	\N	\N
1773	101	5	0	\N	\N	\N	\N	\N
1774	139	5	0	\N	\N	\N	\N	\N
1775	140	5	0	\N	\N	\N	\N	\N
1776	141	5	0	\N	\N	\N	\N	\N
1777	142	5	0	\N	\N	\N	\N	\N
1778	143	5	0	\N	\N	\N	\N	\N
1779	144	5	0	\N	\N	\N	\N	\N
1780	145	5	0	\N	\N	\N	\N	\N
1781	146	5	0	\N	\N	\N	\N	\N
1782	147	5	0	\N	\N	\N	\N	\N
1783	148	5	0	\N	\N	\N	\N	\N
1784	150	5	0	\N	\N	\N	\N	\N
1785	151	5	0	\N	\N	\N	\N	\N
1786	152	5	0	\N	\N	\N	\N	\N
1787	153	5	0	\N	\N	\N	\N	\N
1788	154	5	0	\N	\N	\N	\N	\N
1789	155	5	0	\N	\N	\N	\N	\N
1790	156	5	0	\N	\N	\N	\N	\N
1791	157	5	0	\N	\N	\N	\N	\N
1792	158	5	0	\N	\N	\N	\N	\N
1793	159	5	0	\N	\N	\N	\N	\N
1794	160	5	0	\N	\N	\N	\N	\N
1795	162	5	0	\N	\N	\N	\N	\N
1796	163	5	0	\N	\N	\N	\N	\N
1797	165	5	0	\N	\N	\N	\N	\N
1798	166	5	0	\N	\N	\N	\N	\N
1799	167	5	0	\N	\N	\N	\N	\N
1800	168	5	0	\N	\N	\N	\N	\N
1801	169	5	0	\N	\N	\N	\N	\N
1802	170	5	0	\N	\N	\N	\N	\N
1803	171	5	0	\N	\N	\N	\N	\N
1804	136	5	0	\N	\N	\N	\N	\N
1805	137	5	0	\N	\N	\N	\N	\N
1806	138	5	0	\N	\N	\N	\N	\N
1807	176	5	0	\N	\N	\N	\N	\N
1808	178	5	0	\N	\N	\N	\N	\N
1809	179	5	0	\N	\N	\N	\N	\N
1810	180	5	0	\N	\N	\N	\N	\N
1811	181	5	0	\N	\N	\N	\N	\N
1812	182	5	0	\N	\N	\N	\N	\N
1813	183	5	0	\N	\N	\N	\N	\N
1814	184	5	0	\N	\N	\N	\N	\N
1815	185	5	0	\N	\N	\N	\N	\N
1816	186	5	0	\N	\N	\N	\N	\N
1817	187	5	0	\N	\N	\N	\N	\N
1818	188	5	0	\N	\N	\N	\N	\N
1819	190	5	0	\N	\N	\N	\N	\N
1820	191	5	0	\N	\N	\N	\N	\N
1821	192	5	0	\N	\N	\N	\N	\N
1822	193	5	0	\N	\N	\N	\N	\N
1823	194	5	0	\N	\N	\N	\N	\N
1824	195	5	0	\N	\N	\N	\N	\N
1825	196	5	0	\N	\N	\N	\N	\N
1826	198	5	0	\N	\N	\N	\N	\N
1827	199	5	0	\N	\N	\N	\N	\N
1828	201	5	0	\N	\N	\N	\N	\N
1829	202	5	0	\N	\N	\N	\N	\N
1830	203	5	0	\N	\N	\N	\N	\N
1831	204	5	0	\N	\N	\N	\N	\N
1832	205	5	0	\N	\N	\N	\N	\N
1833	206	5	0	\N	\N	\N	\N	\N
1834	207	5	0	\N	\N	\N	\N	\N
1835	208	5	0	\N	\N	\N	\N	\N
1836	209	5	0	\N	\N	\N	\N	\N
1837	174	5	0	\N	\N	\N	\N	\N
1838	175	5	0	\N	\N	\N	\N	\N
1839	238	5	0	\N	\N	\N	\N	\N
1840	227	5	0	\N	\N	\N	\N	\N
1841	228	5	0	\N	\N	\N	\N	\N
1842	230	5	0	\N	\N	\N	\N	\N
1843	231	5	0	\N	\N	\N	\N	\N
1844	233	5	0	\N	\N	\N	\N	\N
1845	234	5	0	\N	\N	\N	\N	\N
1846	212	5	0	\N	\N	\N	\N	\N
1847	213	5	0	\N	\N	\N	\N	\N
1848	214	5	0	\N	\N	\N	\N	\N
1849	215	5	0	\N	\N	\N	\N	\N
1850	216	5	0	\N	\N	\N	\N	\N
1851	217	5	0	\N	\N	\N	\N	\N
1852	218	5	0	\N	\N	\N	\N	\N
1853	219	5	0	\N	\N	\N	\N	\N
1854	220	5	0	\N	\N	\N	\N	\N
1855	221	5	0	\N	\N	\N	\N	\N
1856	222	5	0	\N	\N	\N	\N	\N
1857	223	5	0	\N	\N	\N	\N	\N
1858	225	5	0	\N	\N	\N	\N	\N
1859	226	5	0	\N	\N	\N	\N	\N
1860	240	5	0	\N	\N	\N	\N	\N
1861	241	5	0	\N	\N	\N	\N	\N
1862	242	5	0	\N	\N	\N	\N	\N
1863	243	5	0	\N	\N	\N	\N	\N
1864	244	5	0	\N	\N	\N	\N	\N
1865	245	5	0	\N	\N	\N	\N	\N
1866	356	5	0	\N	\N	\N	\N	\N
1867	236	5	0	\N	\N	\N	\N	\N
1868	237	5	0	\N	\N	\N	\N	\N
1869	253	5	0	\N	\N	\N	\N	\N
1870	255	5	0	\N	\N	\N	\N	\N
1871	262	5	0	\N	\N	\N	\N	\N
1872	264	5	0	\N	\N	\N	\N	\N
1873	266	5	0	\N	\N	\N	\N	\N
1874	268	5	0	\N	\N	\N	\N	\N
1875	270	5	0	\N	\N	\N	\N	\N
1876	272	5	0	\N	\N	\N	\N	\N
1877	274	5	0	\N	\N	\N	\N	\N
1878	276	5	0	\N	\N	\N	\N	\N
1879	278	5	0	\N	\N	\N	\N	\N
1880	280	5	0	\N	\N	\N	\N	\N
1881	248	5	0	\N	\N	\N	\N	\N
1882	251	5	0	\N	\N	\N	\N	\N
1883	254	5	0	\N	\N	\N	\N	\N
1884	257	5	0	\N	\N	\N	\N	\N
1885	275	5	0	\N	\N	\N	\N	\N
1886	277	5	0	\N	\N	\N	\N	\N
1887	279	5	0	\N	\N	\N	\N	\N
1888	281	5	0	\N	\N	\N	\N	\N
1889	247	5	0	\N	\N	\N	\N	\N
1890	256	5	0	\N	\N	\N	\N	\N
1891	258	5	0	\N	\N	\N	\N	\N
1892	263	5	0	\N	\N	\N	\N	\N
1893	265	5	0	\N	\N	\N	\N	\N
1894	267	5	0	\N	\N	\N	\N	\N
1895	269	5	0	\N	\N	\N	\N	\N
1896	271	5	0	\N	\N	\N	\N	\N
1897	273	5	0	\N	\N	\N	\N	\N
1898	250	5	0	\N	\N	\N	\N	\N
1899	252	5	0	\N	\N	\N	\N	\N
1900	285	5	0	\N	\N	\N	\N	\N
1901	286	5	0	\N	\N	\N	\N	\N
1902	287	5	0	\N	\N	\N	\N	\N
1903	288	5	0	\N	\N	\N	\N	\N
1904	289	5	0	\N	\N	\N	\N	\N
1905	290	5	0	\N	\N	\N	\N	\N
1906	291	5	0	\N	\N	\N	\N	\N
1907	292	5	0	\N	\N	\N	\N	\N
1908	293	5	0	\N	\N	\N	\N	\N
1909	294	5	0	\N	\N	\N	\N	\N
1910	295	5	0	\N	\N	\N	\N	\N
1911	296	5	0	\N	\N	\N	\N	\N
1912	297	5	0	\N	\N	\N	\N	\N
1913	298	5	0	\N	\N	\N	\N	\N
1914	299	5	0	\N	\N	\N	\N	\N
1915	300	5	0	\N	\N	\N	\N	\N
1916	301	5	0	\N	\N	\N	\N	\N
1917	302	5	0	\N	\N	\N	\N	\N
1918	303	5	0	\N	\N	\N	\N	\N
1919	304	5	0	\N	\N	\N	\N	\N
1920	305	5	0	\N	\N	\N	\N	\N
1921	306	5	0	\N	\N	\N	\N	\N
1922	307	5	0	\N	\N	\N	\N	\N
1923	309	5	0	\N	\N	\N	\N	\N
1924	311	5	0	\N	\N	\N	\N	\N
1925	312	5	0	\N	\N	\N	\N	\N
1926	313	5	0	\N	\N	\N	\N	\N
1927	314	5	0	\N	\N	\N	\N	\N
1928	316	5	0	\N	\N	\N	\N	\N
1929	317	5	0	\N	\N	\N	\N	\N
1930	318	5	0	\N	\N	\N	\N	\N
1931	319	5	0	\N	\N	\N	\N	\N
1932	283	5	0	\N	\N	\N	\N	\N
1933	323	5	0	\N	\N	\N	\N	\N
1934	350	5	0	\N	\N	\N	\N	\N
1935	324	5	0	\N	\N	\N	\N	\N
1936	325	5	0	\N	\N	\N	\N	\N
1937	327	5	0	\N	\N	\N	\N	\N
1938	328	5	0	\N	\N	\N	\N	\N
1939	329	5	0	\N	\N	\N	\N	\N
1940	330	5	0	\N	\N	\N	\N	\N
1941	331	5	0	\N	\N	\N	\N	\N
1942	332	5	0	\N	\N	\N	\N	\N
1943	333	5	0	\N	\N	\N	\N	\N
1944	334	5	0	\N	\N	\N	\N	\N
1945	335	5	0	\N	\N	\N	\N	\N
1946	336	5	0	\N	\N	\N	\N	\N
1947	337	5	0	\N	\N	\N	\N	\N
1948	338	5	0	\N	\N	\N	\N	\N
1949	339	5	0	\N	\N	\N	\N	\N
1950	340	5	0	\N	\N	\N	\N	\N
1951	341	5	0	\N	\N	\N	\N	\N
1952	342	5	0	\N	\N	\N	\N	\N
1953	343	5	0	\N	\N	\N	\N	\N
1954	344	5	0	\N	\N	\N	\N	\N
1955	345	5	0	\N	\N	\N	\N	\N
1956	346	5	0	\N	\N	\N	\N	\N
1957	348	5	0	\N	\N	\N	\N	\N
1958	349	5	0	\N	\N	\N	\N	\N
1959	351	5	0	\N	\N	\N	\N	\N
1960	352	5	0	\N	\N	\N	\N	\N
1961	353	5	0	\N	\N	\N	\N	\N
1962	354	5	0	\N	\N	\N	\N	\N
1963	355	5	0	\N	\N	\N	\N	\N
1964	321	5	0	\N	\N	\N	\N	\N
1965	322	5	0	\N	\N	\N	\N	\N
1966	381	5	0	\N	\N	\N	\N	\N
1967	366	5	0	\N	\N	\N	\N	\N
1968	367	5	0	\N	\N	\N	\N	\N
1969	210	5	0	\N	\N	\N	\N	\N
1970	357	5	0	\N	\N	\N	\N	\N
1971	359	5	0	\N	\N	\N	\N	\N
1972	360	5	0	\N	\N	\N	\N	\N
1973	361	5	0	\N	\N	\N	\N	\N
1974	362	5	0	\N	\N	\N	\N	\N
1975	364	5	0	\N	\N	\N	\N	\N
1976	365	5	0	\N	\N	\N	\N	\N
1977	382	5	0	\N	\N	\N	\N	\N
1978	383	5	0	\N	\N	\N	\N	\N
1979	384	5	0	\N	\N	\N	\N	\N
1980	385	5	0	\N	\N	\N	\N	\N
1981	386	5	0	\N	\N	\N	\N	\N
1982	388	5	0	\N	\N	\N	\N	\N
1983	389	5	0	\N	\N	\N	\N	\N
1984	390	5	0	\N	\N	\N	\N	\N
1985	507	5	0	\N	\N	\N	\N	\N
1986	368	5	0	\N	\N	\N	\N	\N
1987	370	5	0	\N	\N	\N	\N	\N
1988	371	5	0	\N	\N	\N	\N	\N
1989	372	5	0	\N	\N	\N	\N	\N
1990	373	5	0	\N	\N	\N	\N	\N
1991	374	5	0	\N	\N	\N	\N	\N
1992	375	5	0	\N	\N	\N	\N	\N
1993	376	5	0	\N	\N	\N	\N	\N
1994	377	5	0	\N	\N	\N	\N	\N
1995	378	5	0	\N	\N	\N	\N	\N
1996	379	5	0	\N	\N	\N	\N	\N
1997	380	5	0	\N	\N	\N	\N	\N
1998	420	5	0	\N	\N	\N	\N	\N
1999	403	5	0	\N	\N	\N	\N	\N
2000	404	5	0	\N	\N	\N	\N	\N
2001	405	5	0	\N	\N	\N	\N	\N
2002	406	5	0	\N	\N	\N	\N	\N
2003	407	5	0	\N	\N	\N	\N	\N
2004	408	5	0	\N	\N	\N	\N	\N
2005	409	5	0	\N	\N	\N	\N	\N
2006	410	5	0	\N	\N	\N	\N	\N
2007	411	5	0	\N	\N	\N	\N	\N
2008	412	5	0	\N	\N	\N	\N	\N
2009	413	5	0	\N	\N	\N	\N	\N
2010	392	5	0	\N	\N	\N	\N	\N
2011	393	5	0	\N	\N	\N	\N	\N
2012	394	5	0	\N	\N	\N	\N	\N
2013	395	5	0	\N	\N	\N	\N	\N
2014	396	5	0	\N	\N	\N	\N	\N
2015	397	5	0	\N	\N	\N	\N	\N
2016	398	5	0	\N	\N	\N	\N	\N
2017	399	5	0	\N	\N	\N	\N	\N
2018	400	5	0	\N	\N	\N	\N	\N
2019	401	5	0	\N	\N	\N	\N	\N
2020	402	5	0	\N	\N	\N	\N	\N
2021	2	5	0	\N	\N	\N	\N	\N
2022	419	5	0	\N	\N	\N	\N	\N
2023	421	5	0	\N	\N	\N	\N	\N
2024	422	5	0	\N	\N	\N	\N	\N
2025	423	5	0	\N	\N	\N	\N	\N
2026	424	5	0	\N	\N	\N	\N	\N
2027	426	5	0	\N	\N	\N	\N	\N
2028	416	5	0	\N	\N	\N	\N	\N
2029	417	5	0	\N	\N	\N	\N	\N
2030	418	5	0	\N	\N	\N	\N	\N
2031	452	5	0	\N	\N	\N	\N	\N
2032	427	5	0	\N	\N	\N	\N	\N
2033	428	5	0	\N	\N	\N	\N	\N
2034	429	5	0	\N	\N	\N	\N	\N
2035	430	5	0	\N	\N	\N	\N	\N
2036	431	5	0	\N	\N	\N	\N	\N
2037	432	5	0	\N	\N	\N	\N	\N
2038	433	5	0	\N	\N	\N	\N	\N
2039	434	5	0	\N	\N	\N	\N	\N
2040	436	5	0	\N	\N	\N	\N	\N
2041	437	5	0	\N	\N	\N	\N	\N
2042	438	5	0	\N	\N	\N	\N	\N
2043	439	5	0	\N	\N	\N	\N	\N
2044	440	5	0	\N	\N	\N	\N	\N
2045	441	5	0	\N	\N	\N	\N	\N
2046	442	5	0	\N	\N	\N	\N	\N
2047	443	5	0	\N	\N	\N	\N	\N
2048	444	5	0	\N	\N	\N	\N	\N
2049	445	5	0	\N	\N	\N	\N	\N
2050	446	5	0	\N	\N	\N	\N	\N
2051	447	5	0	\N	\N	\N	\N	\N
2052	448	5	0	\N	\N	\N	\N	\N
2053	449	5	0	\N	\N	\N	\N	\N
2054	450	5	0	\N	\N	\N	\N	\N
2055	453	5	0	\N	\N	\N	\N	\N
2056	455	5	0	\N	\N	\N	\N	\N
2057	459	5	0	\N	\N	\N	\N	\N
2058	457	5	0	\N	\N	\N	\N	\N
2059	463	5	0	\N	\N	\N	\N	\N
2060	461	5	0	\N	\N	\N	\N	\N
2061	464	5	0	\N	\N	\N	\N	\N
2062	465	5	0	\N	\N	\N	\N	\N
2063	466	5	0	\N	\N	\N	\N	\N
2064	505	5	0	\N	\N	\N	\N	\N
2065	492	5	0	\N	\N	\N	\N	\N
2066	476	5	0	\N	\N	\N	\N	\N
2067	497	5	0	\N	\N	\N	\N	\N
2068	469	5	0	\N	\N	\N	\N	\N
2069	499	5	0	\N	\N	\N	\N	\N
2070	501	5	0	\N	\N	\N	\N	\N
2071	493	5	0	\N	\N	\N	\N	\N
2072	494	5	0	\N	\N	\N	\N	\N
2073	496	5	0	\N	\N	\N	\N	\N
2074	477	5	0	\N	\N	\N	\N	\N
2075	479	5	0	\N	\N	\N	\N	\N
2076	480	5	0	\N	\N	\N	\N	\N
2077	481	5	0	\N	\N	\N	\N	\N
2078	482	5	0	\N	\N	\N	\N	\N
2079	483	5	0	\N	\N	\N	\N	\N
2080	484	5	0	\N	\N	\N	\N	\N
2081	485	5	0	\N	\N	\N	\N	\N
2082	486	5	0	\N	\N	\N	\N	\N
2083	487	5	0	\N	\N	\N	\N	\N
2084	488	5	0	\N	\N	\N	\N	\N
2085	489	5	0	\N	\N	\N	\N	\N
2086	473	5	0	\N	\N	\N	\N	\N
2087	474	5	0	\N	\N	\N	\N	\N
2088	475	5	0	\N	\N	\N	\N	\N
2089	506	5	0	\N	\N	\N	\N	\N
2090	491	5	0	\N	\N	\N	\N	\N
2091	468	5	0	\N	\N	\N	\N	\N
2092	467	5	0	\N	\N	\N	\N	\N
2093	470	5	0	\N	\N	\N	\N	\N
2094	498	5	0	\N	\N	\N	\N	\N
2095	504	5	0	\N	\N	\N	\N	\N
2096	503	5	0	\N	\N	\N	\N	\N
2097	538	5	0	\N	\N	\N	\N	\N
2098	519	5	0	\N	\N	\N	\N	\N
2099	508	5	0	\N	\N	\N	\N	\N
2100	543	5	0	\N	\N	\N	\N	\N
2101	544	5	0	\N	\N	\N	\N	\N
2102	511	5	0	\N	\N	\N	\N	\N
2103	512	5	0	\N	\N	\N	\N	\N
2104	513	5	0	\N	\N	\N	\N	\N
2105	514	5	0	\N	\N	\N	\N	\N
2106	515	5	0	\N	\N	\N	\N	\N
2107	516	5	0	\N	\N	\N	\N	\N
2108	517	5	0	\N	\N	\N	\N	\N
2109	518	5	0	\N	\N	\N	\N	\N
2110	539	5	0	\N	\N	\N	\N	\N
2111	540	5	0	\N	\N	\N	\N	\N
2112	541	5	0	\N	\N	\N	\N	\N
2113	542	5	0	\N	\N	\N	\N	\N
2114	509	5	0	\N	\N	\N	\N	\N
2115	510	5	0	\N	\N	\N	\N	\N
2116	545	5	0	\N	\N	\N	\N	\N
2117	546	5	0	\N	\N	\N	\N	\N
2118	547	5	0	\N	\N	\N	\N	\N
2119	548	5	0	\N	\N	\N	\N	\N
2120	520	5	0	\N	\N	\N	\N	\N
2121	522	5	0	\N	\N	\N	\N	\N
2122	526	5	0	\N	\N	\N	\N	\N
2123	527	5	0	\N	\N	\N	\N	\N
2124	528	5	0	\N	\N	\N	\N	\N
2125	530	5	0	\N	\N	\N	\N	\N
2126	531	5	0	\N	\N	\N	\N	\N
2127	532	5	0	\N	\N	\N	\N	\N
2128	533	5	0	\N	\N	\N	\N	\N
2129	534	5	0	\N	\N	\N	\N	\N
2130	535	5	0	\N	\N	\N	\N	\N
2131	536	5	0	\N	\N	\N	\N	\N
2132	537	5	0	\N	\N	\N	\N	\N
2133	555	5	0	\N	\N	\N	\N	\N
2134	564	5	0	\N	\N	\N	\N	\N
2135	572	5	0	\N	\N	\N	\N	\N
2136	568	5	0	\N	\N	\N	\N	\N
2137	576	5	0	\N	\N	\N	\N	\N
2138	553	5	0	\N	\N	\N	\N	\N
2139	578	5	0	\N	\N	\N	\N	\N
2140	554	5	0	\N	\N	\N	\N	\N
2141	563	5	0	\N	\N	\N	\N	\N
2142	579	5	0	\N	\N	\N	\N	\N
2143	565	5	0	\N	\N	\N	\N	\N
2144	549	5	0	\N	\N	\N	\N	\N
2145	550	5	0	\N	\N	\N	\N	\N
2146	566	5	0	\N	\N	\N	\N	\N
2147	573	5	0	\N	\N	\N	\N	\N
2148	574	5	0	\N	\N	\N	\N	\N
2149	556	5	0	\N	\N	\N	\N	\N
2150	570	5	0	\N	\N	\N	\N	\N
2151	571	5	0	\N	\N	\N	\N	\N
2152	559	5	0	\N	\N	\N	\N	\N
2153	567	5	0	\N	\N	\N	\N	\N
2154	562	5	0	\N	\N	\N	\N	\N
2155	575	5	0	\N	\N	\N	\N	\N
2156	3	5	0	\N	\N	\N	\N	\N
2157	320	5	0	\N	\N	\N	\N	\N
2158	557	5	0	\N	\N	\N	\N	\N
2159	149	5	0	\N	\N	\N	\N	\N
2160	211	5	0	\N	\N	\N	\N	\N
2161	197	5	0	\N	\N	\N	\N	\N
2162	369	5	0	\N	\N	\N	\N	\N
2163	173	5	0	\N	\N	\N	\N	\N
2164	189	5	0	\N	\N	\N	\N	\N
2165	391	5	0	\N	\N	\N	\N	\N
2166	100	5	0	\N	\N	\N	\N	\N
2167	35	5	0	\N	\N	\N	\N	\N
2168	521	5	0	\N	\N	\N	\N	\N
2169	525	5	0	\N	\N	\N	\N	\N
2170	224	5	0	\N	\N	\N	\N	\N
2171	65	5	0	\N	\N	\N	\N	\N
2172	99	5	0	\N	\N	\N	\N	\N
2173	246	5	0	\N	\N	\N	\N	\N
2174	308	5	0	\N	\N	\N	\N	\N
2175	310	5	0	\N	\N	\N	\N	\N
2176	18	5	0	\N	\N	\N	\N	\N
2177	363	5	0	\N	\N	\N	\N	\N
2178	523	5	0	\N	\N	\N	\N	\N
2179	164	5	0	\N	\N	\N	\N	\N
2180	425	5	0	\N	\N	\N	\N	\N
2181	456	5	0	\N	\N	\N	\N	\N
2182	249	5	0	\N	\N	\N	\N	\N
2183	524	5	0	\N	\N	\N	\N	\N
2184	239	5	0	\N	\N	\N	\N	\N
2185	259	5	0	\N	\N	\N	\N	\N
2186	260	5	0	\N	\N	\N	\N	\N
2187	261	5	0	\N	\N	\N	\N	\N
2188	282	5	0	\N	\N	\N	\N	\N
2189	326	5	0	\N	\N	\N	\N	\N
2190	387	5	0	\N	\N	\N	\N	\N
2191	12	1	0	\N	\N	\N	\N	\N
2192	13	1	0	\N	\N	\N	\N	\N
2193	14	1	0	\N	\N	\N	\N	\N
2194	15	1	0	\N	\N	\N	\N	\N
2195	16	1	0	\N	\N	\N	\N	\N
2196	17	1	0	\N	\N	\N	\N	\N
2197	19	1	0	\N	\N	\N	\N	\N
2198	20	1	0	\N	\N	\N	\N	\N
2199	21	1	0	\N	\N	\N	\N	\N
2200	22	1	0	\N	\N	\N	\N	\N
2201	23	1	0	\N	\N	\N	\N	\N
2202	24	1	0	\N	\N	\N	\N	\N
2203	25	1	0	\N	\N	\N	\N	\N
2204	26	1	0	\N	\N	\N	\N	\N
2205	27	1	0	\N	\N	\N	\N	\N
2206	28	1	0	\N	\N	\N	\N	\N
2207	29	1	0	\N	\N	\N	\N	\N
2208	30	1	0	\N	\N	\N	\N	\N
2209	31	1	0	\N	\N	\N	\N	\N
2210	32	1	0	\N	\N	\N	\N	\N
2211	33	1	0	\N	\N	\N	\N	\N
2212	34	1	0	\N	\N	\N	\N	\N
2213	172	1	0	\N	\N	\N	\N	\N
2214	4	1	0	\N	\N	\N	\N	\N
2215	5	1	0	\N	\N	\N	\N	\N
2216	6	1	0	\N	\N	\N	\N	\N
2217	7	1	0	\N	\N	\N	\N	\N
2218	8	1	0	\N	\N	\N	\N	\N
2219	9	1	0	\N	\N	\N	\N	\N
2220	10	1	0	\N	\N	\N	\N	\N
2221	11	1	0	\N	\N	\N	\N	\N
2222	45	1	0	\N	\N	\N	\N	\N
2223	44	1	0	\N	\N	\N	\N	\N
2224	46	1	0	\N	\N	\N	\N	\N
2225	47	1	0	\N	\N	\N	\N	\N
2226	48	1	0	\N	\N	\N	\N	\N
2227	49	1	0	\N	\N	\N	\N	\N
2228	50	1	0	\N	\N	\N	\N	\N
2229	51	1	0	\N	\N	\N	\N	\N
2230	52	1	0	\N	\N	\N	\N	\N
2231	53	1	0	\N	\N	\N	\N	\N
2232	54	1	0	\N	\N	\N	\N	\N
2233	56	1	0	\N	\N	\N	\N	\N
2234	57	1	0	\N	\N	\N	\N	\N
2235	58	1	0	\N	\N	\N	\N	\N
2236	59	1	0	\N	\N	\N	\N	\N
2237	60	1	0	\N	\N	\N	\N	\N
2238	61	1	0	\N	\N	\N	\N	\N
2239	62	1	0	\N	\N	\N	\N	\N
2240	63	1	0	\N	\N	\N	\N	\N
2241	64	1	0	\N	\N	\N	\N	\N
2242	36	1	0	\N	\N	\N	\N	\N
2243	37	1	0	\N	\N	\N	\N	\N
2244	38	1	0	\N	\N	\N	\N	\N
2245	39	1	0	\N	\N	\N	\N	\N
2246	40	1	0	\N	\N	\N	\N	\N
2247	41	1	0	\N	\N	\N	\N	\N
2248	42	1	0	\N	\N	\N	\N	\N
2249	43	1	0	\N	\N	\N	\N	\N
2250	72	1	0	\N	\N	\N	\N	\N
2251	73	1	0	\N	\N	\N	\N	\N
2252	74	1	0	\N	\N	\N	\N	\N
2253	75	1	0	\N	\N	\N	\N	\N
2254	76	1	0	\N	\N	\N	\N	\N
2255	77	1	0	\N	\N	\N	\N	\N
2256	78	1	0	\N	\N	\N	\N	\N
2257	79	1	0	\N	\N	\N	\N	\N
2258	80	1	0	\N	\N	\N	\N	\N
2259	81	1	0	\N	\N	\N	\N	\N
2260	82	1	0	\N	\N	\N	\N	\N
2261	83	1	0	\N	\N	\N	\N	\N
2262	84	1	0	\N	\N	\N	\N	\N
2263	85	1	0	\N	\N	\N	\N	\N
2264	86	1	0	\N	\N	\N	\N	\N
2265	87	1	0	\N	\N	\N	\N	\N
2266	88	1	0	\N	\N	\N	\N	\N
2267	89	1	0	\N	\N	\N	\N	\N
2268	90	1	0	\N	\N	\N	\N	\N
2269	92	1	0	\N	\N	\N	\N	\N
2270	93	1	0	\N	\N	\N	\N	\N
2271	94	1	0	\N	\N	\N	\N	\N
2272	95	1	0	\N	\N	\N	\N	\N
2273	96	1	0	\N	\N	\N	\N	\N
2274	97	1	0	\N	\N	\N	\N	\N
2275	66	1	0	\N	\N	\N	\N	\N
2276	67	1	0	\N	\N	\N	\N	\N
2277	68	1	0	\N	\N	\N	\N	\N
2278	69	1	0	\N	\N	\N	\N	\N
2279	70	1	0	\N	\N	\N	\N	\N
2280	105	1	0	\N	\N	\N	\N	\N
2281	106	1	0	\N	\N	\N	\N	\N
2282	107	1	0	\N	\N	\N	\N	\N
2283	108	1	0	\N	\N	\N	\N	\N
2284	109	1	0	\N	\N	\N	\N	\N
2285	110	1	0	\N	\N	\N	\N	\N
2286	111	1	0	\N	\N	\N	\N	\N
2287	112	1	0	\N	\N	\N	\N	\N
2288	113	1	0	\N	\N	\N	\N	\N
2289	114	1	0	\N	\N	\N	\N	\N
2290	115	1	0	\N	\N	\N	\N	\N
2291	116	1	0	\N	\N	\N	\N	\N
2292	117	1	0	\N	\N	\N	\N	\N
2293	118	1	0	\N	\N	\N	\N	\N
2294	119	1	0	\N	\N	\N	\N	\N
2295	120	1	0	\N	\N	\N	\N	\N
2296	121	1	0	\N	\N	\N	\N	\N
2297	122	1	0	\N	\N	\N	\N	\N
2298	124	1	0	\N	\N	\N	\N	\N
2299	125	1	0	\N	\N	\N	\N	\N
2300	126	1	0	\N	\N	\N	\N	\N
2301	127	1	0	\N	\N	\N	\N	\N
2302	128	1	0	\N	\N	\N	\N	\N
2303	129	1	0	\N	\N	\N	\N	\N
2304	130	1	0	\N	\N	\N	\N	\N
2305	131	1	0	\N	\N	\N	\N	\N
2306	132	1	0	\N	\N	\N	\N	\N
2307	133	1	0	\N	\N	\N	\N	\N
2308	134	1	0	\N	\N	\N	\N	\N
2309	135	1	0	\N	\N	\N	\N	\N
2310	101	1	0	\N	\N	\N	\N	\N
2311	102	1	0	\N	\N	\N	\N	\N
2312	103	1	0	\N	\N	\N	\N	\N
2313	104	1	0	\N	\N	\N	\N	\N
2314	142	1	0	\N	\N	\N	\N	\N
2315	143	1	0	\N	\N	\N	\N	\N
2316	144	1	0	\N	\N	\N	\N	\N
2317	145	1	0	\N	\N	\N	\N	\N
2318	146	1	0	\N	\N	\N	\N	\N
2319	147	1	0	\N	\N	\N	\N	\N
2320	148	1	0	\N	\N	\N	\N	\N
2321	150	1	0	\N	\N	\N	\N	\N
2322	151	1	0	\N	\N	\N	\N	\N
2323	152	1	0	\N	\N	\N	\N	\N
2324	153	1	0	\N	\N	\N	\N	\N
2325	154	1	0	\N	\N	\N	\N	\N
2326	155	1	0	\N	\N	\N	\N	\N
2327	156	1	0	\N	\N	\N	\N	\N
2328	157	1	0	\N	\N	\N	\N	\N
2329	158	1	0	\N	\N	\N	\N	\N
2330	159	1	0	\N	\N	\N	\N	\N
2331	160	1	0	\N	\N	\N	\N	\N
2332	162	1	0	\N	\N	\N	\N	\N
2333	163	1	0	\N	\N	\N	\N	\N
2334	165	1	0	\N	\N	\N	\N	\N
2335	166	1	0	\N	\N	\N	\N	\N
2336	167	1	0	\N	\N	\N	\N	\N
2337	168	1	0	\N	\N	\N	\N	\N
2338	169	1	0	\N	\N	\N	\N	\N
2339	170	1	0	\N	\N	\N	\N	\N
2340	171	1	0	\N	\N	\N	\N	\N
2341	136	1	0	\N	\N	\N	\N	\N
2342	137	1	0	\N	\N	\N	\N	\N
2343	138	1	0	\N	\N	\N	\N	\N
2344	139	1	0	\N	\N	\N	\N	\N
2345	140	1	0	\N	\N	\N	\N	\N
2346	141	1	0	\N	\N	\N	\N	\N
2347	179	1	0	\N	\N	\N	\N	\N
2348	180	1	0	\N	\N	\N	\N	\N
2349	181	1	0	\N	\N	\N	\N	\N
2350	182	1	0	\N	\N	\N	\N	\N
2351	183	1	0	\N	\N	\N	\N	\N
2352	184	1	0	\N	\N	\N	\N	\N
2353	185	1	0	\N	\N	\N	\N	\N
2354	186	1	0	\N	\N	\N	\N	\N
2355	187	1	0	\N	\N	\N	\N	\N
2356	188	1	0	\N	\N	\N	\N	\N
2357	190	1	0	\N	\N	\N	\N	\N
2358	191	1	0	\N	\N	\N	\N	\N
2359	192	1	0	\N	\N	\N	\N	\N
2360	193	1	0	\N	\N	\N	\N	\N
2361	194	1	0	\N	\N	\N	\N	\N
2362	195	1	0	\N	\N	\N	\N	\N
2363	196	1	0	\N	\N	\N	\N	\N
2364	198	1	0	\N	\N	\N	\N	\N
2365	199	1	0	\N	\N	\N	\N	\N
2366	201	1	0	\N	\N	\N	\N	\N
2367	202	1	0	\N	\N	\N	\N	\N
2368	203	1	0	\N	\N	\N	\N	\N
2369	204	1	0	\N	\N	\N	\N	\N
2370	205	1	0	\N	\N	\N	\N	\N
2371	206	1	0	\N	\N	\N	\N	\N
2372	207	1	0	\N	\N	\N	\N	\N
2373	208	1	0	\N	\N	\N	\N	\N
2374	209	1	0	\N	\N	\N	\N	\N
2375	174	1	0	\N	\N	\N	\N	\N
2376	175	1	0	\N	\N	\N	\N	\N
2377	176	1	0	\N	\N	\N	\N	\N
2378	178	1	0	\N	\N	\N	\N	\N
2379	242	1	0	\N	\N	\N	\N	\N
2380	230	1	0	\N	\N	\N	\N	\N
2381	231	1	0	\N	\N	\N	\N	\N
2382	233	1	0	\N	\N	\N	\N	\N
2383	234	1	0	\N	\N	\N	\N	\N
2384	212	1	0	\N	\N	\N	\N	\N
2385	213	1	0	\N	\N	\N	\N	\N
2386	214	1	0	\N	\N	\N	\N	\N
2387	215	1	0	\N	\N	\N	\N	\N
2388	216	1	0	\N	\N	\N	\N	\N
2389	217	1	0	\N	\N	\N	\N	\N
2390	218	1	0	\N	\N	\N	\N	\N
2391	219	1	0	\N	\N	\N	\N	\N
2392	220	1	0	\N	\N	\N	\N	\N
2393	221	1	0	\N	\N	\N	\N	\N
2394	222	1	0	\N	\N	\N	\N	\N
2395	223	1	0	\N	\N	\N	\N	\N
2396	225	1	0	\N	\N	\N	\N	\N
2397	226	1	0	\N	\N	\N	\N	\N
2398	238	1	0	\N	\N	\N	\N	\N
2399	227	1	0	\N	\N	\N	\N	\N
2400	228	1	0	\N	\N	\N	\N	\N
2401	243	1	0	\N	\N	\N	\N	\N
2402	244	1	0	\N	\N	\N	\N	\N
2403	245	1	0	\N	\N	\N	\N	\N
2404	356	1	0	\N	\N	\N	\N	\N
2405	236	1	0	\N	\N	\N	\N	\N
2406	237	1	0	\N	\N	\N	\N	\N
2407	240	1	0	\N	\N	\N	\N	\N
2408	241	1	0	\N	\N	\N	\N	\N
2409	256	1	0	\N	\N	\N	\N	\N
2410	258	1	0	\N	\N	\N	\N	\N
2411	265	1	0	\N	\N	\N	\N	\N
2412	267	1	0	\N	\N	\N	\N	\N
2413	269	1	0	\N	\N	\N	\N	\N
2414	271	1	0	\N	\N	\N	\N	\N
2415	273	1	0	\N	\N	\N	\N	\N
2416	275	1	0	\N	\N	\N	\N	\N
2417	277	1	0	\N	\N	\N	\N	\N
2418	279	1	0	\N	\N	\N	\N	\N
2419	281	1	0	\N	\N	\N	\N	\N
2420	247	1	0	\N	\N	\N	\N	\N
2421	250	1	0	\N	\N	\N	\N	\N
2422	252	1	0	\N	\N	\N	\N	\N
2423	254	1	0	\N	\N	\N	\N	\N
2424	263	1	0	\N	\N	\N	\N	\N
2425	266	1	0	\N	\N	\N	\N	\N
2426	248	1	0	\N	\N	\N	\N	\N
2427	251	1	0	\N	\N	\N	\N	\N
2428	253	1	0	\N	\N	\N	\N	\N
2429	255	1	0	\N	\N	\N	\N	\N
2430	257	1	0	\N	\N	\N	\N	\N
2431	268	1	0	\N	\N	\N	\N	\N
2432	270	1	0	\N	\N	\N	\N	\N
2433	272	1	0	\N	\N	\N	\N	\N
2434	274	1	0	\N	\N	\N	\N	\N
2435	276	1	0	\N	\N	\N	\N	\N
2436	278	1	0	\N	\N	\N	\N	\N
2437	280	1	0	\N	\N	\N	\N	\N
2438	262	1	0	\N	\N	\N	\N	\N
2439	264	1	0	\N	\N	\N	\N	\N
2440	288	1	0	\N	\N	\N	\N	\N
2441	289	1	0	\N	\N	\N	\N	\N
2442	290	1	0	\N	\N	\N	\N	\N
2443	291	1	0	\N	\N	\N	\N	\N
2444	292	1	0	\N	\N	\N	\N	\N
2445	293	1	0	\N	\N	\N	\N	\N
2446	294	1	0	\N	\N	\N	\N	\N
2447	295	1	0	\N	\N	\N	\N	\N
2448	296	1	0	\N	\N	\N	\N	\N
2449	297	1	0	\N	\N	\N	\N	\N
2450	298	1	0	\N	\N	\N	\N	\N
2451	299	1	0	\N	\N	\N	\N	\N
2452	300	1	0	\N	\N	\N	\N	\N
2453	301	1	0	\N	\N	\N	\N	\N
2454	302	1	0	\N	\N	\N	\N	\N
2455	303	1	0	\N	\N	\N	\N	\N
2456	304	1	0	\N	\N	\N	\N	\N
2457	305	1	0	\N	\N	\N	\N	\N
2458	306	1	0	\N	\N	\N	\N	\N
2459	307	1	0	\N	\N	\N	\N	\N
2460	309	1	0	\N	\N	\N	\N	\N
2461	311	1	0	\N	\N	\N	\N	\N
2462	312	1	0	\N	\N	\N	\N	\N
2463	313	1	0	\N	\N	\N	\N	\N
2464	314	1	0	\N	\N	\N	\N	\N
2465	316	1	0	\N	\N	\N	\N	\N
2466	317	1	0	\N	\N	\N	\N	\N
2467	318	1	0	\N	\N	\N	\N	\N
2468	319	1	0	\N	\N	\N	\N	\N
2469	283	1	0	\N	\N	\N	\N	\N
2470	285	1	0	\N	\N	\N	\N	\N
2471	286	1	0	\N	\N	\N	\N	\N
2472	287	1	0	\N	\N	\N	\N	\N
2473	327	1	0	\N	\N	\N	\N	\N
2474	353	1	0	\N	\N	\N	\N	\N
2475	328	1	0	\N	\N	\N	\N	\N
2476	329	1	0	\N	\N	\N	\N	\N
2477	330	1	0	\N	\N	\N	\N	\N
2478	331	1	0	\N	\N	\N	\N	\N
2479	332	1	0	\N	\N	\N	\N	\N
2480	333	1	0	\N	\N	\N	\N	\N
2481	334	1	0	\N	\N	\N	\N	\N
2482	335	1	0	\N	\N	\N	\N	\N
2483	336	1	0	\N	\N	\N	\N	\N
2484	337	1	0	\N	\N	\N	\N	\N
2485	338	1	0	\N	\N	\N	\N	\N
2486	339	1	0	\N	\N	\N	\N	\N
2487	340	1	0	\N	\N	\N	\N	\N
2488	341	1	0	\N	\N	\N	\N	\N
2489	342	1	0	\N	\N	\N	\N	\N
2490	343	1	0	\N	\N	\N	\N	\N
2491	344	1	0	\N	\N	\N	\N	\N
2492	345	1	0	\N	\N	\N	\N	\N
2493	346	1	0	\N	\N	\N	\N	\N
2494	348	1	0	\N	\N	\N	\N	\N
2495	349	1	0	\N	\N	\N	\N	\N
2496	350	1	0	\N	\N	\N	\N	\N
2497	351	1	0	\N	\N	\N	\N	\N
2498	352	1	0	\N	\N	\N	\N	\N
2499	354	1	0	\N	\N	\N	\N	\N
2500	355	1	0	\N	\N	\N	\N	\N
2501	321	1	0	\N	\N	\N	\N	\N
2502	322	1	0	\N	\N	\N	\N	\N
2503	323	1	0	\N	\N	\N	\N	\N
2504	324	1	0	\N	\N	\N	\N	\N
2505	325	1	0	\N	\N	\N	\N	\N
2506	384	1	0	\N	\N	\N	\N	\N
2507	357	1	0	\N	\N	\N	\N	\N
2508	359	1	0	\N	\N	\N	\N	\N
2509	360	1	0	\N	\N	\N	\N	\N
2510	361	1	0	\N	\N	\N	\N	\N
2511	362	1	0	\N	\N	\N	\N	\N
2512	364	1	0	\N	\N	\N	\N	\N
2513	365	1	0	\N	\N	\N	\N	\N
2514	366	1	0	\N	\N	\N	\N	\N
2515	367	1	0	\N	\N	\N	\N	\N
2516	210	1	0	\N	\N	\N	\N	\N
2517	385	1	0	\N	\N	\N	\N	\N
2518	386	1	0	\N	\N	\N	\N	\N
2519	388	1	0	\N	\N	\N	\N	\N
2520	389	1	0	\N	\N	\N	\N	\N
2521	390	1	0	\N	\N	\N	\N	\N
2522	507	1	0	\N	\N	\N	\N	\N
2523	368	1	0	\N	\N	\N	\N	\N
2524	370	1	0	\N	\N	\N	\N	\N
2525	371	1	0	\N	\N	\N	\N	\N
2526	372	1	0	\N	\N	\N	\N	\N
2527	373	1	0	\N	\N	\N	\N	\N
2528	374	1	0	\N	\N	\N	\N	\N
2529	375	1	0	\N	\N	\N	\N	\N
2530	376	1	0	\N	\N	\N	\N	\N
2531	377	1	0	\N	\N	\N	\N	\N
2532	378	1	0	\N	\N	\N	\N	\N
2533	379	1	0	\N	\N	\N	\N	\N
2534	380	1	0	\N	\N	\N	\N	\N
2535	381	1	0	\N	\N	\N	\N	\N
2536	382	1	0	\N	\N	\N	\N	\N
2537	383	1	0	\N	\N	\N	\N	\N
2538	423	1	0	\N	\N	\N	\N	\N
2539	406	1	0	\N	\N	\N	\N	\N
2540	407	1	0	\N	\N	\N	\N	\N
2541	408	1	0	\N	\N	\N	\N	\N
2542	409	1	0	\N	\N	\N	\N	\N
2543	410	1	0	\N	\N	\N	\N	\N
2544	411	1	0	\N	\N	\N	\N	\N
2545	412	1	0	\N	\N	\N	\N	\N
2546	413	1	0	\N	\N	\N	\N	\N
2547	392	1	0	\N	\N	\N	\N	\N
2548	393	1	0	\N	\N	\N	\N	\N
2549	394	1	0	\N	\N	\N	\N	\N
2550	395	1	0	\N	\N	\N	\N	\N
2551	396	1	0	\N	\N	\N	\N	\N
2552	397	1	0	\N	\N	\N	\N	\N
2553	398	1	0	\N	\N	\N	\N	\N
2554	399	1	0	\N	\N	\N	\N	\N
2555	400	1	0	\N	\N	\N	\N	\N
2556	401	1	0	\N	\N	\N	\N	\N
2557	402	1	0	\N	\N	\N	\N	\N
2558	2	1	0	\N	\N	\N	\N	\N
2559	403	1	0	\N	\N	\N	\N	\N
2560	404	1	0	\N	\N	\N	\N	\N
2561	405	1	0	\N	\N	\N	\N	\N
2562	422	1	0	\N	\N	\N	\N	\N
2563	424	1	0	\N	\N	\N	\N	\N
2564	426	1	0	\N	\N	\N	\N	\N
2565	416	1	0	\N	\N	\N	\N	\N
2566	417	1	0	\N	\N	\N	\N	\N
2567	418	1	0	\N	\N	\N	\N	\N
2568	419	1	0	\N	\N	\N	\N	\N
2569	420	1	0	\N	\N	\N	\N	\N
2570	421	1	0	\N	\N	\N	\N	\N
2571	455	1	0	\N	\N	\N	\N	\N
2572	457	1	0	\N	\N	\N	\N	\N
2573	463	1	0	\N	\N	\N	\N	\N
2574	427	1	0	\N	\N	\N	\N	\N
2575	465	1	0	\N	\N	\N	\N	\N
2576	429	1	0	\N	\N	\N	\N	\N
2577	430	1	0	\N	\N	\N	\N	\N
2578	431	1	0	\N	\N	\N	\N	\N
2579	432	1	0	\N	\N	\N	\N	\N
2580	433	1	0	\N	\N	\N	\N	\N
2581	434	1	0	\N	\N	\N	\N	\N
2582	436	1	0	\N	\N	\N	\N	\N
2583	437	1	0	\N	\N	\N	\N	\N
2584	438	1	0	\N	\N	\N	\N	\N
2585	439	1	0	\N	\N	\N	\N	\N
2586	440	1	0	\N	\N	\N	\N	\N
2587	441	1	0	\N	\N	\N	\N	\N
2588	442	1	0	\N	\N	\N	\N	\N
2589	443	1	0	\N	\N	\N	\N	\N
2590	444	1	0	\N	\N	\N	\N	\N
2591	445	1	0	\N	\N	\N	\N	\N
2592	446	1	0	\N	\N	\N	\N	\N
2593	447	1	0	\N	\N	\N	\N	\N
2594	448	1	0	\N	\N	\N	\N	\N
2595	449	1	0	\N	\N	\N	\N	\N
2596	450	1	0	\N	\N	\N	\N	\N
2597	459	1	0	\N	\N	\N	\N	\N
2598	461	1	0	\N	\N	\N	\N	\N
2599	464	1	0	\N	\N	\N	\N	\N
2600	466	1	0	\N	\N	\N	\N	\N
2601	428	1	0	\N	\N	\N	\N	\N
2602	452	1	0	\N	\N	\N	\N	\N
2603	453	1	0	\N	\N	\N	\N	\N
2604	491	1	0	\N	\N	\N	\N	\N
2605	496	1	0	\N	\N	\N	\N	\N
2606	480	1	0	\N	\N	\N	\N	\N
2607	501	1	0	\N	\N	\N	\N	\N
2608	503	1	0	\N	\N	\N	\N	\N
2609	467	1	0	\N	\N	\N	\N	\N
2610	468	1	0	\N	\N	\N	\N	\N
2611	497	1	0	\N	\N	\N	\N	\N
2612	498	1	0	\N	\N	\N	\N	\N
2613	499	1	0	\N	\N	\N	\N	\N
2614	481	1	0	\N	\N	\N	\N	\N
2615	482	1	0	\N	\N	\N	\N	\N
2616	483	1	0	\N	\N	\N	\N	\N
2617	484	1	0	\N	\N	\N	\N	\N
2618	485	1	0	\N	\N	\N	\N	\N
2619	486	1	0	\N	\N	\N	\N	\N
2620	487	1	0	\N	\N	\N	\N	\N
2621	488	1	0	\N	\N	\N	\N	\N
2622	489	1	0	\N	\N	\N	\N	\N
2623	473	1	0	\N	\N	\N	\N	\N
2624	474	1	0	\N	\N	\N	\N	\N
2625	475	1	0	\N	\N	\N	\N	\N
2626	476	1	0	\N	\N	\N	\N	\N
2627	477	1	0	\N	\N	\N	\N	\N
2628	479	1	0	\N	\N	\N	\N	\N
2629	492	1	0	\N	\N	\N	\N	\N
2630	493	1	0	\N	\N	\N	\N	\N
2631	494	1	0	\N	\N	\N	\N	\N
2632	469	1	0	\N	\N	\N	\N	\N
2633	470	1	0	\N	\N	\N	\N	\N
2634	504	1	0	\N	\N	\N	\N	\N
2635	505	1	0	\N	\N	\N	\N	\N
2636	506	1	0	\N	\N	\N	\N	\N
2637	541	1	0	\N	\N	\N	\N	\N
2638	509	1	0	\N	\N	\N	\N	\N
2639	510	1	0	\N	\N	\N	\N	\N
2640	511	1	0	\N	\N	\N	\N	\N
2641	546	1	0	\N	\N	\N	\N	\N
2642	547	1	0	\N	\N	\N	\N	\N
2643	514	1	0	\N	\N	\N	\N	\N
2644	515	1	0	\N	\N	\N	\N	\N
2645	516	1	0	\N	\N	\N	\N	\N
2646	517	1	0	\N	\N	\N	\N	\N
2647	518	1	0	\N	\N	\N	\N	\N
2648	519	1	0	\N	\N	\N	\N	\N
2649	508	1	0	\N	\N	\N	\N	\N
2650	542	1	0	\N	\N	\N	\N	\N
2651	543	1	0	\N	\N	\N	\N	\N
2652	544	1	0	\N	\N	\N	\N	\N
2653	545	1	0	\N	\N	\N	\N	\N
2654	512	1	0	\N	\N	\N	\N	\N
2655	513	1	0	\N	\N	\N	\N	\N
2656	548	1	0	\N	\N	\N	\N	\N
2657	520	1	0	\N	\N	\N	\N	\N
2658	522	1	0	\N	\N	\N	\N	\N
2659	526	1	0	\N	\N	\N	\N	\N
2660	527	1	0	\N	\N	\N	\N	\N
2661	528	1	0	\N	\N	\N	\N	\N
2662	530	1	0	\N	\N	\N	\N	\N
2663	531	1	0	\N	\N	\N	\N	\N
2664	532	1	0	\N	\N	\N	\N	\N
2665	533	1	0	\N	\N	\N	\N	\N
2666	534	1	0	\N	\N	\N	\N	\N
2667	535	1	0	\N	\N	\N	\N	\N
2668	536	1	0	\N	\N	\N	\N	\N
2669	537	1	0	\N	\N	\N	\N	\N
2670	538	1	0	\N	\N	\N	\N	\N
2671	539	1	0	\N	\N	\N	\N	\N
2672	540	1	0	\N	\N	\N	\N	\N
2673	573	1	0	\N	\N	\N	\N	\N
2674	565	1	0	\N	\N	\N	\N	\N
2675	549	1	0	\N	\N	\N	\N	\N
2676	574	1	0	\N	\N	\N	\N	\N
2677	571	1	0	\N	\N	\N	\N	\N
2678	578	1	0	\N	\N	\N	\N	\N
2679	576	1	0	\N	\N	\N	\N	\N
2680	556	1	0	\N	\N	\N	\N	\N
2681	554	1	0	\N	\N	\N	\N	\N
2682	572	1	0	\N	\N	\N	\N	\N
2683	566	1	0	\N	\N	\N	\N	\N
2684	563	1	0	\N	\N	\N	\N	\N
2685	550	1	0	\N	\N	\N	\N	\N
2686	568	1	0	\N	\N	\N	\N	\N
2687	562	1	0	\N	\N	\N	\N	\N
2688	564	1	0	\N	\N	\N	\N	\N
2689	579	1	0	\N	\N	\N	\N	\N
2690	559	1	0	\N	\N	\N	\N	\N
2691	567	1	0	\N	\N	\N	\N	\N
2692	555	1	0	\N	\N	\N	\N	\N
2693	570	1	0	\N	\N	\N	\N	\N
2694	553	1	0	\N	\N	\N	\N	\N
2695	575	1	0	\N	\N	\N	\N	\N
2696	3	1	0	\N	\N	\N	\N	\N
2697	391	1	0	\N	\N	\N	\N	\N
2698	149	1	0	\N	\N	\N	\N	\N
2699	173	1	0	\N	\N	\N	\N	\N
2700	189	1	0	\N	\N	\N	\N	\N
2701	249	1	0	\N	\N	\N	\N	\N
2702	246	1	0	\N	\N	\N	\N	\N
2703	425	1	0	\N	\N	\N	\N	\N
2704	521	1	0	\N	\N	\N	\N	\N
2705	211	1	0	\N	\N	\N	\N	\N
2706	224	1	0	\N	\N	\N	\N	\N
2707	523	1	0	\N	\N	\N	\N	\N
2708	35	1	0	\N	\N	\N	\N	\N
2709	100	1	0	\N	\N	\N	\N	\N
2710	525	1	0	\N	\N	\N	\N	\N
2711	456	1	0	\N	\N	\N	\N	\N
2712	308	1	0	\N	\N	\N	\N	\N
2713	18	1	0	\N	\N	\N	\N	\N
2714	310	1	0	\N	\N	\N	\N	\N
2715	363	1	0	\N	\N	\N	\N	\N
2716	369	1	0	\N	\N	\N	\N	\N
2717	99	1	0	\N	\N	\N	\N	\N
2718	524	1	0	\N	\N	\N	\N	\N
2719	557	1	0	\N	\N	\N	\N	\N
2720	164	1	0	\N	\N	\N	\N	\N
2721	197	1	0	\N	\N	\N	\N	\N
2722	320	1	0	\N	\N	\N	\N	\N
2723	65	1	0	\N	\N	\N	\N	\N
2724	239	1	0	\N	\N	\N	\N	\N
2725	259	1	0	\N	\N	\N	\N	\N
2726	260	1	0	\N	\N	\N	\N	\N
2727	261	1	0	\N	\N	\N	\N	\N
2728	282	1	0	\N	\N	\N	\N	\N
2729	326	1	0	\N	\N	\N	\N	\N
2730	387	1	0	\N	\N	\N	\N	\N
2731	577	6	0	\N	\N	\N	\N	\N
2732	580	6	0	\N	\N	\N	\N	\N
2733	589	6	0	\N	\N	\N	\N	\N
2734	581	6	0	\N	\N	\N	\N	\N
2735	582	6	0	\N	\N	\N	\N	\N
2736	583	6	0	\N	\N	\N	\N	\N
2737	584	6	0	\N	\N	\N	\N	\N
2738	585	6	0	\N	\N	\N	\N	\N
2739	586	6	0	\N	\N	\N	\N	\N
2740	587	6	0	\N	\N	\N	\N	\N
2741	588	6	0	\N	\N	\N	\N	\N
2742	590	6	0	\N	\N	\N	\N	\N
2743	591	6	0	\N	\N	\N	\N	\N
2744	592	6	0	\N	\N	\N	\N	\N
2745	593	6	0	\N	\N	\N	\N	\N
2746	594	6	0	\N	\N	\N	\N	\N
2747	595	6	0	\N	\N	\N	\N	\N
2748	596	6	0	\N	\N	\N	\N	\N
2749	597	6	0	\N	\N	\N	\N	\N
2750	598	6	0	\N	\N	\N	\N	\N
2751	600	6	0	\N	\N	\N	\N	\N
2752	601	6	0	\N	\N	\N	\N	\N
2753	603	6	0	\N	\N	\N	\N	\N
2754	604	6	0	\N	\N	\N	\N	\N
2755	605	6	0	\N	\N	\N	\N	\N
2756	606	6	0	\N	\N	\N	\N	\N
2757	607	6	0	\N	\N	\N	\N	\N
2758	608	6	0	\N	\N	\N	\N	\N
2759	609	6	0	\N	\N	\N	\N	\N
2760	610	6	0	\N	\N	\N	\N	\N
2761	611	6	0	\N	\N	\N	\N	\N
2762	612	6	0	\N	\N	\N	\N	\N
2763	613	6	0	\N	\N	\N	\N	\N
2764	614	6	0	\N	\N	\N	\N	\N
2765	615	6	0	\N	\N	\N	\N	\N
2766	616	6	0	\N	\N	\N	\N	\N
2767	617	6	0	\N	\N	\N	\N	\N
2768	618	6	0	\N	\N	\N	\N	\N
2769	619	6	0	\N	\N	\N	\N	\N
2770	620	6	0	\N	\N	\N	\N	\N
2771	621	6	0	\N	\N	\N	\N	\N
2772	622	6	0	\N	\N	\N	\N	\N
2773	623	6	0	\N	\N	\N	\N	\N
2774	624	6	0	\N	\N	\N	\N	\N
2775	599	6	0	\N	\N	\N	\N	\N
2776	602	6	0	\N	\N	\N	\N	\N
2777	21	9	0	\N	\N	\N	\N	\N
2778	8	9	0	\N	\N	\N	\N	\N
2779	61	9	0	\N	\N	\N	\N	\N
2780	7	9	0	\N	\N	\N	\N	\N
2781	13	9	0	\N	\N	\N	\N	\N
2782	17	9	0	\N	\N	\N	\N	\N
2783	60	9	0	\N	\N	\N	\N	\N
2784	34	9	0	\N	\N	\N	\N	\N
2785	33	9	0	\N	\N	\N	\N	\N
2786	26	9	0	\N	\N	\N	\N	\N
2787	25	9	0	\N	\N	\N	\N	\N
2788	27	9	0	\N	\N	\N	\N	\N
2789	24	9	0	\N	\N	\N	\N	\N
2790	9	9	0	\N	\N	\N	\N	\N
2791	10	9	0	\N	\N	\N	\N	\N
2792	63	9	0	\N	\N	\N	\N	\N
2793	64	9	0	\N	\N	\N	\N	\N
2794	16	9	0	\N	\N	\N	\N	\N
2795	32	9	0	\N	\N	\N	\N	\N
2796	31	9	0	\N	\N	\N	\N	\N
2797	15	9	0	\N	\N	\N	\N	\N
2798	14	9	0	\N	\N	\N	\N	\N
2799	19	9	0	\N	\N	\N	\N	\N
2800	6	9	0	\N	\N	\N	\N	\N
2801	30	9	0	\N	\N	\N	\N	\N
2802	29	9	0	\N	\N	\N	\N	\N
2803	172	9	0	\N	\N	\N	\N	\N
2804	62	9	0	\N	\N	\N	\N	\N
2805	12	9	0	\N	\N	\N	\N	\N
2806	28	9	0	\N	\N	\N	\N	\N
2807	5	9	0	\N	\N	\N	\N	\N
2808	23	9	0	\N	\N	\N	\N	\N
2809	22	9	0	\N	\N	\N	\N	\N
2810	20	9	0	\N	\N	\N	\N	\N
2811	96	9	0	\N	\N	\N	\N	\N
2812	95	9	0	\N	\N	\N	\N	\N
2813	94	9	0	\N	\N	\N	\N	\N
2814	46	9	0	\N	\N	\N	\N	\N
2815	44	9	0	\N	\N	\N	\N	\N
2816	47	9	0	\N	\N	\N	\N	\N
2817	40	9	0	\N	\N	\N	\N	\N
2818	42	9	0	\N	\N	\N	\N	\N
2819	50	9	0	\N	\N	\N	\N	\N
2820	48	9	0	\N	\N	\N	\N	\N
2821	49	9	0	\N	\N	\N	\N	\N
2822	56	9	0	\N	\N	\N	\N	\N
2823	57	9	0	\N	\N	\N	\N	\N
2824	37	9	0	\N	\N	\N	\N	\N
2825	36	9	0	\N	\N	\N	\N	\N
2826	45	9	0	\N	\N	\N	\N	\N
2827	53	9	0	\N	\N	\N	\N	\N
2828	43	9	0	\N	\N	\N	\N	\N
2829	41	9	0	\N	\N	\N	\N	\N
2830	93	9	0	\N	\N	\N	\N	\N
2831	39	9	0	\N	\N	\N	\N	\N
2832	52	9	0	\N	\N	\N	\N	\N
2833	58	9	0	\N	\N	\N	\N	\N
2834	51	9	0	\N	\N	\N	\N	\N
2835	90	9	0	\N	\N	\N	\N	\N
2836	89	9	0	\N	\N	\N	\N	\N
2837	88	9	0	\N	\N	\N	\N	\N
2838	97	9	0	\N	\N	\N	\N	\N
2839	101	9	0	\N	\N	\N	\N	\N
2840	59	9	0	\N	\N	\N	\N	\N
2841	92	9	0	\N	\N	\N	\N	\N
2842	76	9	0	\N	\N	\N	\N	\N
2843	128	9	0	\N	\N	\N	\N	\N
2844	122	9	0	\N	\N	\N	\N	\N
2845	67	9	0	\N	\N	\N	\N	\N
2846	127	9	0	\N	\N	\N	\N	\N
2847	126	9	0	\N	\N	\N	\N	\N
2848	134	9	0	\N	\N	\N	\N	\N
2849	83	9	0	\N	\N	\N	\N	\N
2850	86	9	0	\N	\N	\N	\N	\N
2851	82	9	0	\N	\N	\N	\N	\N
2852	84	9	0	\N	\N	\N	\N	\N
2853	135	9	0	\N	\N	\N	\N	\N
2854	85	9	0	\N	\N	\N	\N	\N
2855	75	9	0	\N	\N	\N	\N	\N
2856	70	9	0	\N	\N	\N	\N	\N
2857	69	9	0	\N	\N	\N	\N	\N
2858	133	9	0	\N	\N	\N	\N	\N
2859	73	9	0	\N	\N	\N	\N	\N
2860	72	9	0	\N	\N	\N	\N	\N
2861	66	9	0	\N	\N	\N	\N	\N
2862	124	9	0	\N	\N	\N	\N	\N
2863	125	9	0	\N	\N	\N	\N	\N
2864	129	9	0	\N	\N	\N	\N	\N
2865	131	9	0	\N	\N	\N	\N	\N
2866	130	9	0	\N	\N	\N	\N	\N
2867	87	9	0	\N	\N	\N	\N	\N
2868	81	9	0	\N	\N	\N	\N	\N
2869	79	9	0	\N	\N	\N	\N	\N
2870	78	9	0	\N	\N	\N	\N	\N
2871	121	9	0	\N	\N	\N	\N	\N
2872	132	9	0	\N	\N	\N	\N	\N
2873	68	9	0	\N	\N	\N	\N	\N
2874	74	9	0	\N	\N	\N	\N	\N
2875	117	9	0	\N	\N	\N	\N	\N
2876	105	9	0	\N	\N	\N	\N	\N
2877	119	9	0	\N	\N	\N	\N	\N
2878	159	9	0	\N	\N	\N	\N	\N
2879	112	9	0	\N	\N	\N	\N	\N
2880	137	9	0	\N	\N	\N	\N	\N
2881	140	9	0	\N	\N	\N	\N	\N
2882	116	9	0	\N	\N	\N	\N	\N
2883	167	9	0	\N	\N	\N	\N	\N
2884	168	9	0	\N	\N	\N	\N	\N
2885	106	9	0	\N	\N	\N	\N	\N
2886	102	9	0	\N	\N	\N	\N	\N
2887	171	9	0	\N	\N	\N	\N	\N
2888	107	9	0	\N	\N	\N	\N	\N
2889	104	9	0	\N	\N	\N	\N	\N
2890	118	9	0	\N	\N	\N	\N	\N
2891	138	9	0	\N	\N	\N	\N	\N
2892	111	9	0	\N	\N	\N	\N	\N
2893	169	9	0	\N	\N	\N	\N	\N
2894	139	9	0	\N	\N	\N	\N	\N
2895	115	9	0	\N	\N	\N	\N	\N
2896	109	9	0	\N	\N	\N	\N	\N
2897	110	9	0	\N	\N	\N	\N	\N
2898	166	9	0	\N	\N	\N	\N	\N
2899	163	9	0	\N	\N	\N	\N	\N
2900	114	9	0	\N	\N	\N	\N	\N
2901	113	9	0	\N	\N	\N	\N	\N
2902	108	9	0	\N	\N	\N	\N	\N
2903	165	9	0	\N	\N	\N	\N	\N
2904	120	9	0	\N	\N	\N	\N	\N
2905	170	9	0	\N	\N	\N	\N	\N
2906	160	9	0	\N	\N	\N	\N	\N
2907	136	9	0	\N	\N	\N	\N	\N
2908	198	9	0	\N	\N	\N	\N	\N
2909	142	9	0	\N	\N	\N	\N	\N
2910	208	9	0	\N	\N	\N	\N	\N
2911	174	9	0	\N	\N	\N	\N	\N
2912	156	9	0	\N	\N	\N	\N	\N
2913	155	9	0	\N	\N	\N	\N	\N
2914	146	9	0	\N	\N	\N	\N	\N
2915	209	9	0	\N	\N	\N	\N	\N
2916	178	9	0	\N	\N	\N	\N	\N
2917	176	9	0	\N	\N	\N	\N	\N
2918	201	9	0	\N	\N	\N	\N	\N
2919	153	9	0	\N	\N	\N	\N	\N
2920	157	9	0	\N	\N	\N	\N	\N
2921	144	9	0	\N	\N	\N	\N	\N
2922	158	9	0	\N	\N	\N	\N	\N
2923	196	9	0	\N	\N	\N	\N	\N
2924	147	9	0	\N	\N	\N	\N	\N
2925	143	9	0	\N	\N	\N	\N	\N
2926	148	9	0	\N	\N	\N	\N	\N
2927	151	9	0	\N	\N	\N	\N	\N
2928	206	9	0	\N	\N	\N	\N	\N
2929	204	9	0	\N	\N	\N	\N	\N
2930	199	9	0	\N	\N	\N	\N	\N
2931	207	9	0	\N	\N	\N	\N	\N
2932	205	9	0	\N	\N	\N	\N	\N
2933	203	9	0	\N	\N	\N	\N	\N
2934	202	9	0	\N	\N	\N	\N	\N
2935	150	9	0	\N	\N	\N	\N	\N
2936	152	9	0	\N	\N	\N	\N	\N
2937	175	9	0	\N	\N	\N	\N	\N
2938	141	9	0	\N	\N	\N	\N	\N
2939	234	9	0	\N	\N	\N	\N	\N
2940	227	9	0	\N	\N	\N	\N	\N
2941	179	9	0	\N	\N	\N	\N	\N
2942	223	9	0	\N	\N	\N	\N	\N
2943	182	9	0	\N	\N	\N	\N	\N
2944	180	9	0	\N	\N	\N	\N	\N
2945	193	9	0	\N	\N	\N	\N	\N
2946	218	9	0	\N	\N	\N	\N	\N
2947	194	9	0	\N	\N	\N	\N	\N
2948	213	9	0	\N	\N	\N	\N	\N
2949	190	9	0	\N	\N	\N	\N	\N
2950	195	9	0	\N	\N	\N	\N	\N
2951	183	9	0	\N	\N	\N	\N	\N
2952	184	9	0	\N	\N	\N	\N	\N
2953	185	9	0	\N	\N	\N	\N	\N
2954	216	9	0	\N	\N	\N	\N	\N
2955	225	9	0	\N	\N	\N	\N	\N
2956	187	9	0	\N	\N	\N	\N	\N
2957	228	9	0	\N	\N	\N	\N	\N
2958	188	9	0	\N	\N	\N	\N	\N
2959	181	9	0	\N	\N	\N	\N	\N
2960	212	9	0	\N	\N	\N	\N	\N
2961	217	9	0	\N	\N	\N	\N	\N
2962	233	9	0	\N	\N	\N	\N	\N
2963	230	9	0	\N	\N	\N	\N	\N
2964	222	9	0	\N	\N	\N	\N	\N
2965	192	9	0	\N	\N	\N	\N	\N
2966	191	9	0	\N	\N	\N	\N	\N
2967	231	9	0	\N	\N	\N	\N	\N
2968	214	9	0	\N	\N	\N	\N	\N
2969	215	9	0	\N	\N	\N	\N	\N
2970	186	9	0	\N	\N	\N	\N	\N
2971	258	9	0	\N	\N	\N	\N	\N
2972	264	9	0	\N	\N	\N	\N	\N
2973	274	9	0	\N	\N	\N	\N	\N
2974	248	9	0	\N	\N	\N	\N	\N
2975	265	9	0	\N	\N	\N	\N	\N
2976	275	9	0	\N	\N	\N	\N	\N
2977	238	9	0	\N	\N	\N	\N	\N
2978	245	9	0	\N	\N	\N	\N	\N
2979	267	9	0	\N	\N	\N	\N	\N
2980	268	9	0	\N	\N	\N	\N	\N
2981	271	9	0	\N	\N	\N	\N	\N
2982	250	9	0	\N	\N	\N	\N	\N
2983	252	9	0	\N	\N	\N	\N	\N
2984	280	9	0	\N	\N	\N	\N	\N
2985	279	9	0	\N	\N	\N	\N	\N
2986	266	9	0	\N	\N	\N	\N	\N
2987	263	9	0	\N	\N	\N	\N	\N
2988	270	9	0	\N	\N	\N	\N	\N
2989	236	9	0	\N	\N	\N	\N	\N
2990	272	9	0	\N	\N	\N	\N	\N
2991	243	9	0	\N	\N	\N	\N	\N
2992	244	9	0	\N	\N	\N	\N	\N
2993	240	9	0	\N	\N	\N	\N	\N
2994	241	9	0	\N	\N	\N	\N	\N
2995	242	9	0	\N	\N	\N	\N	\N
2996	256	9	0	\N	\N	\N	\N	\N
2997	247	9	0	\N	\N	\N	\N	\N
2998	221	9	0	\N	\N	\N	\N	\N
2999	220	9	0	\N	\N	\N	\N	\N
3000	219	9	0	\N	\N	\N	\N	\N
3001	356	9	0	\N	\N	\N	\N	\N
3002	281	9	0	\N	\N	\N	\N	\N
3003	277	9	0	\N	\N	\N	\N	\N
3004	254	9	0	\N	\N	\N	\N	\N
3005	273	9	0	\N	\N	\N	\N	\N
3006	306	9	0	\N	\N	\N	\N	\N
3007	291	9	0	\N	\N	\N	\N	\N
3008	292	9	0	\N	\N	\N	\N	\N
3009	293	9	0	\N	\N	\N	\N	\N
3010	294	9	0	\N	\N	\N	\N	\N
3011	295	9	0	\N	\N	\N	\N	\N
3012	305	9	0	\N	\N	\N	\N	\N
3013	316	9	0	\N	\N	\N	\N	\N
3014	317	9	0	\N	\N	\N	\N	\N
3015	257	9	0	\N	\N	\N	\N	\N
3016	251	9	0	\N	\N	\N	\N	\N
3017	312	9	0	\N	\N	\N	\N	\N
3018	278	9	0	\N	\N	\N	\N	\N
3019	286	9	0	\N	\N	\N	\N	\N
3020	319	9	0	\N	\N	\N	\N	\N
3021	318	9	0	\N	\N	\N	\N	\N
3022	313	9	0	\N	\N	\N	\N	\N
3023	314	9	0	\N	\N	\N	\N	\N
3024	309	9	0	\N	\N	\N	\N	\N
3025	290	9	0	\N	\N	\N	\N	\N
3026	289	9	0	\N	\N	\N	\N	\N
3027	304	9	0	\N	\N	\N	\N	\N
3028	297	9	0	\N	\N	\N	\N	\N
3029	285	9	0	\N	\N	\N	\N	\N
3030	307	9	0	\N	\N	\N	\N	\N
3031	253	9	0	\N	\N	\N	\N	\N
3032	262	9	0	\N	\N	\N	\N	\N
3033	288	9	0	\N	\N	\N	\N	\N
3034	283	9	0	\N	\N	\N	\N	\N
3035	255	9	0	\N	\N	\N	\N	\N
3036	287	9	0	\N	\N	\N	\N	\N
3037	276	9	0	\N	\N	\N	\N	\N
3038	299	9	0	\N	\N	\N	\N	\N
3039	321	9	0	\N	\N	\N	\N	\N
3040	323	9	0	\N	\N	\N	\N	\N
3041	322	9	0	\N	\N	\N	\N	\N
3042	300	9	0	\N	\N	\N	\N	\N
3043	346	9	0	\N	\N	\N	\N	\N
3044	348	9	0	\N	\N	\N	\N	\N
3045	349	9	0	\N	\N	\N	\N	\N
3046	350	9	0	\N	\N	\N	\N	\N
3047	351	9	0	\N	\N	\N	\N	\N
3048	353	9	0	\N	\N	\N	\N	\N
3049	338	9	0	\N	\N	\N	\N	\N
3050	335	9	0	\N	\N	\N	\N	\N
3051	332	9	0	\N	\N	\N	\N	\N
3052	331	9	0	\N	\N	\N	\N	\N
3053	344	9	0	\N	\N	\N	\N	\N
3054	325	9	0	\N	\N	\N	\N	\N
3055	337	9	0	\N	\N	\N	\N	\N
3056	336	9	0	\N	\N	\N	\N	\N
3057	330	9	0	\N	\N	\N	\N	\N
3058	345	9	0	\N	\N	\N	\N	\N
3059	352	9	0	\N	\N	\N	\N	\N
3060	354	9	0	\N	\N	\N	\N	\N
3061	355	9	0	\N	\N	\N	\N	\N
3062	343	9	0	\N	\N	\N	\N	\N
3063	333	9	0	\N	\N	\N	\N	\N
3064	334	9	0	\N	\N	\N	\N	\N
3065	328	9	0	\N	\N	\N	\N	\N
3066	329	9	0	\N	\N	\N	\N	\N
3067	298	9	0	\N	\N	\N	\N	\N
3068	301	9	0	\N	\N	\N	\N	\N
3069	303	9	0	\N	\N	\N	\N	\N
3070	302	9	0	\N	\N	\N	\N	\N
3071	339	9	0	\N	\N	\N	\N	\N
3072	365	9	0	\N	\N	\N	\N	\N
3073	368	9	0	\N	\N	\N	\N	\N
3074	372	9	0	\N	\N	\N	\N	\N
3075	371	9	0	\N	\N	\N	\N	\N
3076	379	9	0	\N	\N	\N	\N	\N
3077	389	9	0	\N	\N	\N	\N	\N
3078	360	9	0	\N	\N	\N	\N	\N
3079	362	9	0	\N	\N	\N	\N	\N
3080	367	9	0	\N	\N	\N	\N	\N
3081	373	9	0	\N	\N	\N	\N	\N
3082	385	9	0	\N	\N	\N	\N	\N
3083	386	9	0	\N	\N	\N	\N	\N
3084	390	9	0	\N	\N	\N	\N	\N
3085	388	9	0	\N	\N	\N	\N	\N
3086	340	9	0	\N	\N	\N	\N	\N
3087	341	9	0	\N	\N	\N	\N	\N
3088	342	9	0	\N	\N	\N	\N	\N
3089	364	9	0	\N	\N	\N	\N	\N
3090	366	9	0	\N	\N	\N	\N	\N
3091	370	9	0	\N	\N	\N	\N	\N
3092	375	9	0	\N	\N	\N	\N	\N
3093	377	9	0	\N	\N	\N	\N	\N
3094	378	9	0	\N	\N	\N	\N	\N
3095	380	9	0	\N	\N	\N	\N	\N
3096	382	9	0	\N	\N	\N	\N	\N
3097	383	9	0	\N	\N	\N	\N	\N
3098	384	9	0	\N	\N	\N	\N	\N
3099	507	9	0	\N	\N	\N	\N	\N
3100	381	9	0	\N	\N	\N	\N	\N
3101	359	9	0	\N	\N	\N	\N	\N
3102	361	9	0	\N	\N	\N	\N	\N
3103	357	9	0	\N	\N	\N	\N	\N
3104	397	9	0	\N	\N	\N	\N	\N
3105	398	9	0	\N	\N	\N	\N	\N
3106	408	9	0	\N	\N	\N	\N	\N
3107	392	9	0	\N	\N	\N	\N	\N
3108	399	9	0	\N	\N	\N	\N	\N
3109	404	9	0	\N	\N	\N	\N	\N
3110	407	9	0	\N	\N	\N	\N	\N
3111	409	9	0	\N	\N	\N	\N	\N
3112	410	9	0	\N	\N	\N	\N	\N
3113	411	9	0	\N	\N	\N	\N	\N
3114	413	9	0	\N	\N	\N	\N	\N
3115	395	9	0	\N	\N	\N	\N	\N
3116	396	9	0	\N	\N	\N	\N	\N
3117	400	9	0	\N	\N	\N	\N	\N
3118	401	9	0	\N	\N	\N	\N	\N
3119	2	9	0	\N	\N	\N	\N	\N
3120	412	9	0	\N	\N	\N	\N	\N
3121	393	9	0	\N	\N	\N	\N	\N
3122	426	9	0	\N	\N	\N	\N	\N
3123	423	9	0	\N	\N	\N	\N	\N
3124	418	9	0	\N	\N	\N	\N	\N
3125	439	9	0	\N	\N	\N	\N	\N
3126	424	9	0	\N	\N	\N	\N	\N
3127	422	9	0	\N	\N	\N	\N	\N
3128	419	9	0	\N	\N	\N	\N	\N
3129	406	9	0	\N	\N	\N	\N	\N
3130	394	9	0	\N	\N	\N	\N	\N
3131	402	9	0	\N	\N	\N	\N	\N
3132	405	9	0	\N	\N	\N	\N	\N
3133	416	9	0	\N	\N	\N	\N	\N
3134	417	9	0	\N	\N	\N	\N	\N
3135	420	9	0	\N	\N	\N	\N	\N
3136	437	9	0	\N	\N	\N	\N	\N
3137	459	9	0	\N	\N	\N	\N	\N
3138	449	9	0	\N	\N	\N	\N	\N
3139	452	9	0	\N	\N	\N	\N	\N
3140	446	9	0	\N	\N	\N	\N	\N
3141	442	9	0	\N	\N	\N	\N	\N
3142	441	9	0	\N	\N	\N	\N	\N
3143	479	9	0	\N	\N	\N	\N	\N
3144	463	9	0	\N	\N	\N	\N	\N
3145	466	9	0	\N	\N	\N	\N	\N
3146	434	9	0	\N	\N	\N	\N	\N
3147	433	9	0	\N	\N	\N	\N	\N
3148	432	9	0	\N	\N	\N	\N	\N
3149	431	9	0	\N	\N	\N	\N	\N
3150	430	9	0	\N	\N	\N	\N	\N
3151	429	9	0	\N	\N	\N	\N	\N
3152	428	9	0	\N	\N	\N	\N	\N
3153	448	9	0	\N	\N	\N	\N	\N
3154	440	9	0	\N	\N	\N	\N	\N
3155	438	9	0	\N	\N	\N	\N	\N
3156	491	9	0	\N	\N	\N	\N	\N
3157	504	9	0	\N	\N	\N	\N	\N
3158	450	9	0	\N	\N	\N	\N	\N
3159	445	9	0	\N	\N	\N	\N	\N
3160	436	9	0	\N	\N	\N	\N	\N
3161	444	9	0	\N	\N	\N	\N	\N
3162	453	9	0	\N	\N	\N	\N	\N
3163	455	9	0	\N	\N	\N	\N	\N
3164	464	9	0	\N	\N	\N	\N	\N
3165	443	9	0	\N	\N	\N	\N	\N
3166	461	9	0	\N	\N	\N	\N	\N
3167	457	9	0	\N	\N	\N	\N	\N
3168	447	9	0	\N	\N	\N	\N	\N
3169	470	9	0	\N	\N	\N	\N	\N
3170	469	9	0	\N	\N	\N	\N	\N
3171	468	9	0	\N	\N	\N	\N	\N
3172	467	9	0	\N	\N	\N	\N	\N
3173	486	9	0	\N	\N	\N	\N	\N
3174	482	9	0	\N	\N	\N	\N	\N
3175	483	9	0	\N	\N	\N	\N	\N
3176	484	9	0	\N	\N	\N	\N	\N
3177	501	9	0	\N	\N	\N	\N	\N
3178	503	9	0	\N	\N	\N	\N	\N
3179	505	9	0	\N	\N	\N	\N	\N
3180	512	9	0	\N	\N	\N	\N	\N
3181	485	9	0	\N	\N	\N	\N	\N
3182	487	9	0	\N	\N	\N	\N	\N
3183	488	9	0	\N	\N	\N	\N	\N
3184	489	9	0	\N	\N	\N	\N	\N
3185	480	9	0	\N	\N	\N	\N	\N
3186	477	9	0	\N	\N	\N	\N	\N
3187	476	9	0	\N	\N	\N	\N	\N
3188	475	9	0	\N	\N	\N	\N	\N
3189	496	9	0	\N	\N	\N	\N	\N
3190	497	9	0	\N	\N	\N	\N	\N
3191	498	9	0	\N	\N	\N	\N	\N
3192	492	9	0	\N	\N	\N	\N	\N
3193	493	9	0	\N	\N	\N	\N	\N
3194	494	9	0	\N	\N	\N	\N	\N
3195	499	9	0	\N	\N	\N	\N	\N
3196	513	9	0	\N	\N	\N	\N	\N
3197	514	9	0	\N	\N	\N	\N	\N
3198	538	9	0	\N	\N	\N	\N	\N
3199	533	9	0	\N	\N	\N	\N	\N
3200	474	9	0	\N	\N	\N	\N	\N
3201	473	9	0	\N	\N	\N	\N	\N
3202	510	9	0	\N	\N	\N	\N	\N
3203	547	9	0	\N	\N	\N	\N	\N
3204	519	9	0	\N	\N	\N	\N	\N
3205	545	9	0	\N	\N	\N	\N	\N
3206	544	9	0	\N	\N	\N	\N	\N
3207	542	9	0	\N	\N	\N	\N	\N
3208	541	9	0	\N	\N	\N	\N	\N
3209	537	9	0	\N	\N	\N	\N	\N
3210	536	9	0	\N	\N	\N	\N	\N
3211	535	9	0	\N	\N	\N	\N	\N
3212	543	9	0	\N	\N	\N	\N	\N
3213	522	9	0	\N	\N	\N	\N	\N
3214	531	9	0	\N	\N	\N	\N	\N
3215	530	9	0	\N	\N	\N	\N	\N
3216	528	9	0	\N	\N	\N	\N	\N
3217	559	9	0	\N	\N	\N	\N	\N
3218	548	9	0	\N	\N	\N	\N	\N
3219	527	9	0	\N	\N	\N	\N	\N
3220	534	9	0	\N	\N	\N	\N	\N
3221	562	9	0	\N	\N	\N	\N	\N
3222	520	9	0	\N	\N	\N	\N	\N
3223	508	9	0	\N	\N	\N	\N	\N
3224	509	9	0	\N	\N	\N	\N	\N
3225	515	9	0	\N	\N	\N	\N	\N
3226	516	9	0	\N	\N	\N	\N	\N
3227	526	9	0	\N	\N	\N	\N	\N
3228	518	9	0	\N	\N	\N	\N	\N
3229	517	9	0	\N	\N	\N	\N	\N
3230	553	9	0	\N	\N	\N	\N	\N
3231	546	9	0	\N	\N	\N	\N	\N
3232	540	9	0	\N	\N	\N	\N	\N
3233	539	9	0	\N	\N	\N	\N	\N
3234	511	9	0	\N	\N	\N	\N	\N
3235	579	9	0	\N	\N	\N	\N	\N
3236	578	9	0	\N	\N	\N	\N	\N
3237	575	9	0	\N	\N	\N	\N	\N
3238	3	9	0	\N	\N	\N	\N	\N
3239	164	9	0	\N	\N	\N	\N	\N
3240	574	9	0	\N	\N	\N	\N	\N
3241	308	9	0	\N	\N	\N	\N	\N
3242	149	9	0	\N	\N	\N	\N	\N
3243	549	9	0	\N	\N	\N	\N	\N
3244	425	9	0	\N	\N	\N	\N	\N
3245	566	9	0	\N	\N	\N	\N	\N
3246	564	9	0	\N	\N	\N	\N	\N
3247	567	9	0	\N	\N	\N	\N	\N
3248	571	9	0	\N	\N	\N	\N	\N
3249	568	9	0	\N	\N	\N	\N	\N
3250	521	9	0	\N	\N	\N	\N	\N
3251	572	9	0	\N	\N	\N	\N	\N
3252	573	9	0	\N	\N	\N	\N	\N
3253	554	9	0	\N	\N	\N	\N	\N
3254	550	9	0	\N	\N	\N	\N	\N
3255	563	9	0	\N	\N	\N	\N	\N
3256	570	9	0	\N	\N	\N	\N	\N
3257	555	9	0	\N	\N	\N	\N	\N
3258	565	9	0	\N	\N	\N	\N	\N
3259	524	9	0	\N	\N	\N	\N	\N
3260	525	9	0	\N	\N	\N	\N	\N
3261	556	9	0	\N	\N	\N	\N	\N
3262	576	9	0	\N	\N	\N	\N	\N
3263	577	9	0	\N	\N	\N	\N	\N
3264	189	9	0	\N	\N	\N	\N	\N
3265	387	9	0	\N	\N	\N	\N	\N
3266	249	9	0	\N	\N	\N	\N	\N
3267	224	9	0	\N	\N	\N	\N	\N
3268	35	9	0	\N	\N	\N	\N	\N
3269	18	9	0	\N	\N	\N	\N	\N
3270	197	9	0	\N	\N	\N	\N	\N
3271	259	9	0	\N	\N	\N	\N	\N
3272	100	9	0	\N	\N	\N	\N	\N
3273	65	9	0	\N	\N	\N	\N	\N
3274	260	9	0	\N	\N	\N	\N	\N
3275	261	9	0	\N	\N	\N	\N	\N
3276	310	9	0	\N	\N	\N	\N	\N
3277	173	9	0	\N	\N	\N	\N	\N
3278	369	9	0	\N	\N	\N	\N	\N
3279	391	9	0	\N	\N	\N	\N	\N
3280	363	9	0	\N	\N	\N	\N	\N
3281	326	9	0	\N	\N	\N	\N	\N
3282	456	9	0	\N	\N	\N	\N	\N
3283	523	9	0	\N	\N	\N	\N	\N
3284	557	9	0	\N	\N	\N	\N	\N
3285	77	9	0	\N	\N	\N	\N	\N
3286	54	9	0	\N	\N	\N	\N	\N
3287	11	9	0	\N	\N	\N	\N	\N
3288	38	9	0	\N	\N	\N	\N	\N
3289	282	9	0	\N	\N	\N	\N	\N
3290	99	9	0	\N	\N	\N	\N	\N
3292	239	9	0	\N	\N	\N	\N	\N
3293	211	9	0	\N	\N	\N	\N	\N
3294	582	9	0	\N	\N	\N	\N	\N
3295	320	9	0	\N	\N	\N	\N	\N
3296	311	9	0	\N	\N	\N	\N	\N
3297	246	9	0	\N	\N	\N	\N	\N
3298	237	9	0	\N	\N	\N	\N	\N
3299	80	9	0	\N	\N	\N	\N	\N
3300	103	9	0	\N	\N	\N	\N	\N
3301	154	9	0	\N	\N	\N	\N	\N
3302	374	9	0	\N	\N	\N	\N	\N
3303	589	9	0	\N	\N	\N	\N	\N
3304	590	9	0	\N	\N	\N	\N	\N
3305	581	9	0	\N	\N	\N	\N	\N
3306	591	9	0	\N	\N	\N	\N	\N
3307	583	9	0	\N	\N	\N	\N	\N
3308	584	9	0	\N	\N	\N	\N	\N
3309	585	9	0	\N	\N	\N	\N	\N
3310	586	9	0	\N	\N	\N	\N	\N
3311	587	9	0	\N	\N	\N	\N	\N
3312	588	9	0	\N	\N	\N	\N	\N
3313	210	9	0	\N	\N	\N	\N	\N
3314	580	9	0	\N	\N	\N	\N	\N
3315	403	9	0	\N	\N	\N	\N	\N
3316	592	9	0	\N	\N	\N	\N	\N
3317	593	9	0	\N	\N	\N	\N	\N
3318	594	9	0	\N	\N	\N	\N	\N
3319	595	9	0	\N	\N	\N	\N	\N
3320	596	9	0	\N	\N	\N	\N	\N
3321	597	9	0	\N	\N	\N	\N	\N
3322	598	9	0	\N	\N	\N	\N	\N
3323	269	9	0	\N	\N	\N	\N	\N
3324	162	9	0	\N	\N	\N	\N	\N
3325	145	9	0	\N	\N	\N	\N	\N
3326	465	9	0	\N	\N	\N	\N	\N
3327	603	9	0	\N	\N	\N	\N	\N
3328	600	9	0	\N	\N	\N	\N	\N
3329	604	9	0	\N	\N	\N	\N	\N
3330	605	9	0	\N	\N	\N	\N	\N
3331	327	9	0	\N	\N	\N	\N	\N
3332	606	9	0	\N	\N	\N	\N	\N
3333	607	9	0	\N	\N	\N	\N	\N
3334	608	9	0	\N	\N	\N	\N	\N
3335	609	9	0	\N	\N	\N	\N	\N
3336	376	9	0	\N	\N	\N	\N	\N
3337	610	9	0	\N	\N	\N	\N	\N
3338	611	9	0	\N	\N	\N	\N	\N
3339	612	9	0	\N	\N	\N	\N	\N
3340	613	9	0	\N	\N	\N	\N	\N
3341	614	9	0	\N	\N	\N	\N	\N
3342	615	9	0	\N	\N	\N	\N	\N
3343	616	9	0	\N	\N	\N	\N	\N
3344	617	9	0	\N	\N	\N	\N	\N
3345	618	9	0	\N	\N	\N	\N	\N
3346	619	9	0	\N	\N	\N	\N	\N
3347	620	9	0	\N	\N	\N	\N	\N
3348	621	9	0	\N	\N	\N	\N	\N
3349	622	9	0	\N	\N	\N	\N	\N
3350	623	9	0	\N	\N	\N	\N	\N
3351	624	9	0	\N	\N	\N	\N	\N
3352	427	9	0	\N	\N	\N	\N	\N
3353	481	9	0	\N	\N	\N	\N	\N
3354	226	9	0	\N	\N	\N	\N	\N
3355	599	9	0	\N	\N	\N	\N	\N
3356	532	9	0	\N	\N	\N	\N	\N
3357	421	9	0	\N	\N	\N	\N	\N
3358	506	9	0	\N	\N	\N	\N	\N
3359	601	9	0	\N	\N	\N	\N	\N
3360	4	9	0	\N	\N	\N	\N	\N
3361	602	9	0	\N	\N	\N	\N	\N
3362	577	5	0	\N	\N	\N	\N	\N
3363	582	5	0	\N	\N	\N	\N	\N
3364	589	5	0	\N	\N	\N	\N	\N
3365	590	5	0	\N	\N	\N	\N	\N
3366	581	5	0	\N	\N	\N	\N	\N
3367	591	5	0	\N	\N	\N	\N	\N
3368	583	5	0	\N	\N	\N	\N	\N
3369	584	5	0	\N	\N	\N	\N	\N
3370	585	5	0	\N	\N	\N	\N	\N
3371	586	5	0	\N	\N	\N	\N	\N
3372	587	5	0	\N	\N	\N	\N	\N
3373	588	5	0	\N	\N	\N	\N	\N
3374	580	5	0	\N	\N	\N	\N	\N
3375	592	5	0	\N	\N	\N	\N	\N
3376	593	5	0	\N	\N	\N	\N	\N
3377	594	5	0	\N	\N	\N	\N	\N
3378	595	5	0	\N	\N	\N	\N	\N
3379	596	5	0	\N	\N	\N	\N	\N
3380	597	5	0	\N	\N	\N	\N	\N
3381	598	5	0	\N	\N	\N	\N	\N
3382	603	5	0	\N	\N	\N	\N	\N
3383	600	5	0	\N	\N	\N	\N	\N
3384	604	5	0	\N	\N	\N	\N	\N
3385	605	5	0	\N	\N	\N	\N	\N
3386	606	5	0	\N	\N	\N	\N	\N
3387	607	5	0	\N	\N	\N	\N	\N
3388	608	5	0	\N	\N	\N	\N	\N
3389	609	5	0	\N	\N	\N	\N	\N
3390	610	5	0	\N	\N	\N	\N	\N
3391	611	5	0	\N	\N	\N	\N	\N
3392	612	5	0	\N	\N	\N	\N	\N
3393	613	5	0	\N	\N	\N	\N	\N
3394	614	5	0	\N	\N	\N	\N	\N
3395	615	5	0	\N	\N	\N	\N	\N
3396	616	5	0	\N	\N	\N	\N	\N
3397	617	5	0	\N	\N	\N	\N	\N
3398	618	5	0	\N	\N	\N	\N	\N
3399	619	5	0	\N	\N	\N	\N	\N
3400	620	5	0	\N	\N	\N	\N	\N
3401	621	5	0	\N	\N	\N	\N	\N
3402	622	5	0	\N	\N	\N	\N	\N
3403	623	5	0	\N	\N	\N	\N	\N
3404	624	5	0	\N	\N	\N	\N	\N
3405	599	5	0	\N	\N	\N	\N	\N
3406	601	5	0	\N	\N	\N	\N	\N
3407	602	5	0	\N	\N	\N	\N	\N
3408	655	6	0	\N	\N	\N	\N	\N
3409	656	6	0	\N	\N	\N	\N	\N
3410	667	6	0	\N	\N	\N	\N	\N
3411	666	6	0	\N	\N	\N	\N	\N
3412	651	6	0	\N	\N	\N	\N	\N
3413	646	6	0	\N	\N	\N	\N	\N
3414	650	6	0	\N	\N	\N	\N	\N
3415	652	6	0	\N	\N	\N	\N	\N
3416	653	6	0	\N	\N	\N	\N	\N
3417	655	8	0	\N	\N	\N	\N	\N
3418	656	8	0	\N	\N	\N	\N	\N
3419	577	8	0	\N	\N	\N	\N	\N
3420	667	8	0	\N	\N	\N	\N	\N
3421	666	8	0	\N	\N	\N	\N	\N
3422	596	8	0	\N	\N	\N	\N	\N
3423	581	8	0	\N	\N	\N	\N	\N
3424	595	8	0	\N	\N	\N	\N	\N
3425	586	8	0	\N	\N	\N	\N	\N
3426	598	8	0	\N	\N	\N	\N	\N
3427	590	8	0	\N	\N	\N	\N	\N
3428	589	8	0	\N	\N	\N	\N	\N
3429	594	8	0	\N	\N	\N	\N	\N
3430	584	8	0	\N	\N	\N	\N	\N
3431	588	8	0	\N	\N	\N	\N	\N
3432	585	8	0	\N	\N	\N	\N	\N
3433	587	8	0	\N	\N	\N	\N	\N
3434	591	8	0	\N	\N	\N	\N	\N
3435	592	8	0	\N	\N	\N	\N	\N
3436	580	8	0	\N	\N	\N	\N	\N
3437	593	8	0	\N	\N	\N	\N	\N
3438	582	8	0	\N	\N	\N	\N	\N
3439	597	8	0	\N	\N	\N	\N	\N
3440	583	8	0	\N	\N	\N	\N	\N
3441	614	8	0	\N	\N	\N	\N	\N
3442	621	8	0	\N	\N	\N	\N	\N
3443	599	8	0	\N	\N	\N	\N	\N
3444	607	8	0	\N	\N	\N	\N	\N
3445	612	8	0	\N	\N	\N	\N	\N
3446	620	8	0	\N	\N	\N	\N	\N
3447	613	8	0	\N	\N	\N	\N	\N
3448	618	8	0	\N	\N	\N	\N	\N
3449	623	8	0	\N	\N	\N	\N	\N
3450	617	8	0	\N	\N	\N	\N	\N
3451	605	8	0	\N	\N	\N	\N	\N
3452	616	8	0	\N	\N	\N	\N	\N
3453	619	8	0	\N	\N	\N	\N	\N
3454	604	8	0	\N	\N	\N	\N	\N
3455	611	8	0	\N	\N	\N	\N	\N
3456	606	8	0	\N	\N	\N	\N	\N
3457	609	8	0	\N	\N	\N	\N	\N
3458	610	8	0	\N	\N	\N	\N	\N
3459	615	8	0	\N	\N	\N	\N	\N
3460	624	8	0	\N	\N	\N	\N	\N
3461	608	8	0	\N	\N	\N	\N	\N
3462	600	8	0	\N	\N	\N	\N	\N
3463	622	8	0	\N	\N	\N	\N	\N
3464	603	8	0	\N	\N	\N	\N	\N
3465	601	8	0	\N	\N	\N	\N	\N
3466	651	8	0	\N	\N	\N	\N	\N
3467	646	8	0	\N	\N	\N	\N	\N
3468	650	8	0	\N	\N	\N	\N	\N
3469	652	8	0	\N	\N	\N	\N	\N
3470	653	8	0	\N	\N	\N	\N	\N
3471	602	8	0	\N	\N	\N	\N	\N
3472	1	6	0	\N	\N	\N	\N	\N
3473	98	6	0	\N	\N	\N	\N	\N
3474	235	6	0	\N	\N	\N	\N	\N
3475	347	6	0	\N	\N	\N	\N	\N
3476	415	6	0	\N	\N	\N	\N	\N
3477	458	6	0	\N	\N	\N	\N	\N
3478	451	6	0	\N	\N	\N	\N	\N
3479	460	6	0	\N	\N	\N	\N	\N
3480	462	6	0	\N	\N	\N	\N	\N
3481	490	6	0	\N	\N	\N	\N	\N
3482	472	6	0	\N	\N	\N	\N	\N
3483	502	6	0	\N	\N	\N	\N	\N
3484	471	6	0	\N	\N	\N	\N	\N
3485	551	6	0	\N	\N	\N	\N	\N
3486	478	6	0	\N	\N	\N	\N	\N
3487	123	6	0	\N	\N	\N	\N	\N
3488	358	6	0	\N	\N	\N	\N	\N
3489	495	6	0	\N	\N	\N	\N	\N
3490	552	6	0	\N	\N	\N	\N	\N
3491	558	6	0	\N	\N	\N	\N	\N
3492	560	6	0	\N	\N	\N	\N	\N
3493	561	6	0	\N	\N	\N	\N	\N
3494	315	6	0	\N	\N	\N	\N	\N
3495	435	6	0	\N	\N	\N	\N	\N
3496	454	6	0	\N	\N	\N	\N	\N
3497	414	6	0	\N	\N	\N	\N	\N
3498	500	6	0	\N	\N	\N	\N	\N
3499	161	6	0	\N	\N	\N	\N	\N
3500	529	6	0	\N	\N	\N	\N	\N
3501	32	10	0	\N	\N	\N	\N	\N
3502	30	10	0	\N	\N	\N	\N	\N
3503	1	10	0	\N	\N	\N	\N	\N
3504	29	10	0	\N	\N	\N	\N	\N
3505	7	10	0	\N	\N	\N	\N	\N
3506	31	10	0	\N	\N	\N	\N	\N
3507	6	10	0	\N	\N	\N	\N	\N
3508	5	10	0	\N	\N	\N	\N	\N
3509	10	10	0	\N	\N	\N	\N	\N
3510	9	10	0	\N	\N	\N	\N	\N
3511	8	10	0	\N	\N	\N	\N	\N
3512	14	10	0	\N	\N	\N	\N	\N
3513	13	10	0	\N	\N	\N	\N	\N
3514	12	10	0	\N	\N	\N	\N	\N
3515	17	10	0	\N	\N	\N	\N	\N
3516	16	10	0	\N	\N	\N	\N	\N
3517	15	10	0	\N	\N	\N	\N	\N
3518	21	10	0	\N	\N	\N	\N	\N
3519	20	10	0	\N	\N	\N	\N	\N
3520	19	10	0	\N	\N	\N	\N	\N
3521	24	10	0	\N	\N	\N	\N	\N
3522	23	10	0	\N	\N	\N	\N	\N
3523	22	10	0	\N	\N	\N	\N	\N
3524	27	10	0	\N	\N	\N	\N	\N
3525	26	10	0	\N	\N	\N	\N	\N
3526	25	10	0	\N	\N	\N	\N	\N
3527	60	10	0	\N	\N	\N	\N	\N
3528	34	10	0	\N	\N	\N	\N	\N
3529	33	10	0	\N	\N	\N	\N	\N
3530	63	10	0	\N	\N	\N	\N	\N
3531	64	10	0	\N	\N	\N	\N	\N
3532	62	10	0	\N	\N	\N	\N	\N
3533	61	10	0	\N	\N	\N	\N	\N
3534	28	10	0	\N	\N	\N	\N	\N
3535	172	10	0	\N	\N	\N	\N	\N
3536	98	10	0	\N	\N	\N	\N	\N
3537	88	10	0	\N	\N	\N	\N	\N
3538	90	10	0	\N	\N	\N	\N	\N
3539	89	10	0	\N	\N	\N	\N	\N
3540	36	10	0	\N	\N	\N	\N	\N
3541	93	10	0	\N	\N	\N	\N	\N
3542	95	10	0	\N	\N	\N	\N	\N
3543	94	10	0	\N	\N	\N	\N	\N
3544	97	10	0	\N	\N	\N	\N	\N
3545	96	10	0	\N	\N	\N	\N	\N
3546	37	10	0	\N	\N	\N	\N	\N
3547	101	10	0	\N	\N	\N	\N	\N
3548	92	10	0	\N	\N	\N	\N	\N
3549	41	10	0	\N	\N	\N	\N	\N
3550	40	10	0	\N	\N	\N	\N	\N
3551	39	10	0	\N	\N	\N	\N	\N
3552	44	10	0	\N	\N	\N	\N	\N
3553	43	10	0	\N	\N	\N	\N	\N
3554	42	10	0	\N	\N	\N	\N	\N
3555	47	10	0	\N	\N	\N	\N	\N
3556	46	10	0	\N	\N	\N	\N	\N
3557	45	10	0	\N	\N	\N	\N	\N
3558	50	10	0	\N	\N	\N	\N	\N
3559	49	10	0	\N	\N	\N	\N	\N
3560	48	10	0	\N	\N	\N	\N	\N
3561	53	10	0	\N	\N	\N	\N	\N
3562	52	10	0	\N	\N	\N	\N	\N
3563	51	10	0	\N	\N	\N	\N	\N
3564	57	10	0	\N	\N	\N	\N	\N
3565	56	10	0	\N	\N	\N	\N	\N
3566	59	10	0	\N	\N	\N	\N	\N
3567	58	10	0	\N	\N	\N	\N	\N
3568	75	10	0	\N	\N	\N	\N	\N
3569	74	10	0	\N	\N	\N	\N	\N
3570	72	10	0	\N	\N	\N	\N	\N
3571	73	10	0	\N	\N	\N	\N	\N
3572	79	10	0	\N	\N	\N	\N	\N
3573	78	10	0	\N	\N	\N	\N	\N
3574	76	10	0	\N	\N	\N	\N	\N
3575	83	10	0	\N	\N	\N	\N	\N
3576	82	10	0	\N	\N	\N	\N	\N
3577	81	10	0	\N	\N	\N	\N	\N
3578	86	10	0	\N	\N	\N	\N	\N
3579	85	10	0	\N	\N	\N	\N	\N
3580	84	10	0	\N	\N	\N	\N	\N
3581	122	10	0	\N	\N	\N	\N	\N
3582	121	10	0	\N	\N	\N	\N	\N
3583	87	10	0	\N	\N	\N	\N	\N
3584	126	10	0	\N	\N	\N	\N	\N
3585	125	10	0	\N	\N	\N	\N	\N
3586	124	10	0	\N	\N	\N	\N	\N
3587	129	10	0	\N	\N	\N	\N	\N
3588	128	10	0	\N	\N	\N	\N	\N
3589	127	10	0	\N	\N	\N	\N	\N
3590	132	10	0	\N	\N	\N	\N	\N
3591	131	10	0	\N	\N	\N	\N	\N
3592	130	10	0	\N	\N	\N	\N	\N
3593	135	10	0	\N	\N	\N	\N	\N
3594	134	10	0	\N	\N	\N	\N	\N
3595	133	10	0	\N	\N	\N	\N	\N
3596	70	10	0	\N	\N	\N	\N	\N
3597	68	10	0	\N	\N	\N	\N	\N
3598	67	10	0	\N	\N	\N	\N	\N
3599	66	10	0	\N	\N	\N	\N	\N
3600	69	10	0	\N	\N	\N	\N	\N
3601	163	10	0	\N	\N	\N	\N	\N
3602	171	10	0	\N	\N	\N	\N	\N
3603	110	10	0	\N	\N	\N	\N	\N
3604	107	10	0	\N	\N	\N	\N	\N
3605	105	10	0	\N	\N	\N	\N	\N
3606	104	10	0	\N	\N	\N	\N	\N
3607	109	10	0	\N	\N	\N	\N	\N
3608	102	10	0	\N	\N	\N	\N	\N
3609	106	10	0	\N	\N	\N	\N	\N
3610	108	10	0	\N	\N	\N	\N	\N
3611	113	10	0	\N	\N	\N	\N	\N
3612	112	10	0	\N	\N	\N	\N	\N
3613	111	10	0	\N	\N	\N	\N	\N
3614	116	10	0	\N	\N	\N	\N	\N
3615	115	10	0	\N	\N	\N	\N	\N
3616	114	10	0	\N	\N	\N	\N	\N
3617	119	10	0	\N	\N	\N	\N	\N
3618	118	10	0	\N	\N	\N	\N	\N
3619	117	10	0	\N	\N	\N	\N	\N
3620	137	10	0	\N	\N	\N	\N	\N
3621	136	10	0	\N	\N	\N	\N	\N
3622	120	10	0	\N	\N	\N	\N	\N
3623	140	10	0	\N	\N	\N	\N	\N
3624	139	10	0	\N	\N	\N	\N	\N
3625	138	10	0	\N	\N	\N	\N	\N
3626	160	10	0	\N	\N	\N	\N	\N
3627	166	10	0	\N	\N	\N	\N	\N
3628	159	10	0	\N	\N	\N	\N	\N
3629	168	10	0	\N	\N	\N	\N	\N
3630	170	10	0	\N	\N	\N	\N	\N
3631	165	10	0	\N	\N	\N	\N	\N
3632	167	10	0	\N	\N	\N	\N	\N
3633	169	10	0	\N	\N	\N	\N	\N
3634	155	10	0	\N	\N	\N	\N	\N
3635	141	10	0	\N	\N	\N	\N	\N
3636	144	10	0	\N	\N	\N	\N	\N
3637	143	10	0	\N	\N	\N	\N	\N
3638	147	10	0	\N	\N	\N	\N	\N
3639	146	10	0	\N	\N	\N	\N	\N
3640	150	10	0	\N	\N	\N	\N	\N
3641	148	10	0	\N	\N	\N	\N	\N
3642	152	10	0	\N	\N	\N	\N	\N
3643	151	10	0	\N	\N	\N	\N	\N
3644	156	10	0	\N	\N	\N	\N	\N
3645	153	10	0	\N	\N	\N	\N	\N
3646	158	10	0	\N	\N	\N	\N	\N
3647	157	10	0	\N	\N	\N	\N	\N
3648	175	10	0	\N	\N	\N	\N	\N
3649	174	10	0	\N	\N	\N	\N	\N
3650	176	10	0	\N	\N	\N	\N	\N
3651	196	10	0	\N	\N	\N	\N	\N
3652	178	10	0	\N	\N	\N	\N	\N
3653	199	10	0	\N	\N	\N	\N	\N
3654	198	10	0	\N	\N	\N	\N	\N
3655	201	10	0	\N	\N	\N	\N	\N
3656	203	10	0	\N	\N	\N	\N	\N
3657	202	10	0	\N	\N	\N	\N	\N
3658	205	10	0	\N	\N	\N	\N	\N
3659	204	10	0	\N	\N	\N	\N	\N
3660	207	10	0	\N	\N	\N	\N	\N
3661	206	10	0	\N	\N	\N	\N	\N
3662	209	10	0	\N	\N	\N	\N	\N
3663	208	10	0	\N	\N	\N	\N	\N
3664	142	10	0	\N	\N	\N	\N	\N
3665	180	10	0	\N	\N	\N	\N	\N
3666	213	10	0	\N	\N	\N	\N	\N
3667	179	10	0	\N	\N	\N	\N	\N
3668	181	10	0	\N	\N	\N	\N	\N
3669	182	10	0	\N	\N	\N	\N	\N
3670	183	10	0	\N	\N	\N	\N	\N
3671	225	10	0	\N	\N	\N	\N	\N
3672	184	10	0	\N	\N	\N	\N	\N
3673	185	10	0	\N	\N	\N	\N	\N
3674	186	10	0	\N	\N	\N	\N	\N
3675	187	10	0	\N	\N	\N	\N	\N
3676	188	10	0	\N	\N	\N	\N	\N
3677	190	10	0	\N	\N	\N	\N	\N
3678	191	10	0	\N	\N	\N	\N	\N
3679	192	10	0	\N	\N	\N	\N	\N
3680	193	10	0	\N	\N	\N	\N	\N
3681	194	10	0	\N	\N	\N	\N	\N
3682	233	10	0	\N	\N	\N	\N	\N
3683	195	10	0	\N	\N	\N	\N	\N
3684	212	10	0	\N	\N	\N	\N	\N
3685	214	10	0	\N	\N	\N	\N	\N
3686	215	10	0	\N	\N	\N	\N	\N
3687	216	10	0	\N	\N	\N	\N	\N
3688	234	10	0	\N	\N	\N	\N	\N
3689	217	10	0	\N	\N	\N	\N	\N
3690	218	10	0	\N	\N	\N	\N	\N
3691	222	10	0	\N	\N	\N	\N	\N
3692	223	10	0	\N	\N	\N	\N	\N
3693	227	10	0	\N	\N	\N	\N	\N
3694	228	10	0	\N	\N	\N	\N	\N
3695	230	10	0	\N	\N	\N	\N	\N
3696	231	10	0	\N	\N	\N	\N	\N
3697	656	10	0	\N	\N	\N	\N	\N
3698	235	10	0	\N	\N	\N	\N	\N
3699	655	10	0	\N	\N	\N	\N	\N
3700	272	10	0	\N	\N	\N	\N	\N
3701	279	10	0	\N	\N	\N	\N	\N
3702	219	10	0	\N	\N	\N	\N	\N
3703	356	10	0	\N	\N	\N	\N	\N
3704	221	10	0	\N	\N	\N	\N	\N
3705	277	10	0	\N	\N	\N	\N	\N
3706	220	10	0	\N	\N	\N	\N	\N
3707	238	10	0	\N	\N	\N	\N	\N
3708	236	10	0	\N	\N	\N	\N	\N
3709	241	10	0	\N	\N	\N	\N	\N
3710	240	10	0	\N	\N	\N	\N	\N
3711	243	10	0	\N	\N	\N	\N	\N
3712	242	10	0	\N	\N	\N	\N	\N
3713	245	10	0	\N	\N	\N	\N	\N
3714	244	10	0	\N	\N	\N	\N	\N
3715	248	10	0	\N	\N	\N	\N	\N
3716	247	10	0	\N	\N	\N	\N	\N
3717	252	10	0	\N	\N	\N	\N	\N
3718	250	10	0	\N	\N	\N	\N	\N
3719	256	10	0	\N	\N	\N	\N	\N
3720	254	10	0	\N	\N	\N	\N	\N
3721	263	10	0	\N	\N	\N	\N	\N
3722	265	10	0	\N	\N	\N	\N	\N
3723	267	10	0	\N	\N	\N	\N	\N
3724	266	10	0	\N	\N	\N	\N	\N
3725	270	10	0	\N	\N	\N	\N	\N
3726	273	10	0	\N	\N	\N	\N	\N
3727	271	10	0	\N	\N	\N	\N	\N
3728	275	10	0	\N	\N	\N	\N	\N
3729	268	10	0	\N	\N	\N	\N	\N
3730	274	10	0	\N	\N	\N	\N	\N
3731	281	10	0	\N	\N	\N	\N	\N
3732	280	10	0	\N	\N	\N	\N	\N
3733	304	10	0	\N	\N	\N	\N	\N
3734	251	10	0	\N	\N	\N	\N	\N
3735	255	10	0	\N	\N	\N	\N	\N
3736	305	10	0	\N	\N	\N	\N	\N
3737	257	10	0	\N	\N	\N	\N	\N
3738	262	10	0	\N	\N	\N	\N	\N
3739	276	10	0	\N	\N	\N	\N	\N
3740	278	10	0	\N	\N	\N	\N	\N
3741	283	10	0	\N	\N	\N	\N	\N
3742	287	10	0	\N	\N	\N	\N	\N
3743	289	10	0	\N	\N	\N	\N	\N
3744	285	10	0	\N	\N	\N	\N	\N
3745	286	10	0	\N	\N	\N	\N	\N
3746	288	10	0	\N	\N	\N	\N	\N
3747	290	10	0	\N	\N	\N	\N	\N
3748	292	10	0	\N	\N	\N	\N	\N
3749	291	10	0	\N	\N	\N	\N	\N
3750	294	10	0	\N	\N	\N	\N	\N
3751	293	10	0	\N	\N	\N	\N	\N
3752	295	10	0	\N	\N	\N	\N	\N
3753	307	10	0	\N	\N	\N	\N	\N
3754	312	10	0	\N	\N	\N	\N	\N
3755	309	10	0	\N	\N	\N	\N	\N
3756	306	10	0	\N	\N	\N	\N	\N
3757	313	10	0	\N	\N	\N	\N	\N
3758	314	10	0	\N	\N	\N	\N	\N
3759	316	10	0	\N	\N	\N	\N	\N
3760	317	10	0	\N	\N	\N	\N	\N
3761	318	10	0	\N	\N	\N	\N	\N
3762	319	10	0	\N	\N	\N	\N	\N
3763	297	10	0	\N	\N	\N	\N	\N
3764	321	10	0	\N	\N	\N	\N	\N
3765	352	10	0	\N	\N	\N	\N	\N
3766	335	10	0	\N	\N	\N	\N	\N
3767	302	10	0	\N	\N	\N	\N	\N
3768	355	10	0	\N	\N	\N	\N	\N
3769	354	10	0	\N	\N	\N	\N	\N
3770	353	10	0	\N	\N	\N	\N	\N
3771	333	10	0	\N	\N	\N	\N	\N
3772	343	10	0	\N	\N	\N	\N	\N
3773	332	10	0	\N	\N	\N	\N	\N
3774	303	10	0	\N	\N	\N	\N	\N
3775	328	10	0	\N	\N	\N	\N	\N
3776	338	10	0	\N	\N	\N	\N	\N
3777	334	10	0	\N	\N	\N	\N	\N
3778	331	10	0	\N	\N	\N	\N	\N
3779	323	10	0	\N	\N	\N	\N	\N
3780	322	10	0	\N	\N	\N	\N	\N
3781	325	10	0	\N	\N	\N	\N	\N
3782	337	10	0	\N	\N	\N	\N	\N
3783	300	10	0	\N	\N	\N	\N	\N
3784	298	10	0	\N	\N	\N	\N	\N
3785	330	10	0	\N	\N	\N	\N	\N
3786	336	10	0	\N	\N	\N	\N	\N
3787	344	10	0	\N	\N	\N	\N	\N
3788	299	10	0	\N	\N	\N	\N	\N
3789	349	10	0	\N	\N	\N	\N	\N
3790	329	10	0	\N	\N	\N	\N	\N
3791	347	10	0	\N	\N	\N	\N	\N
3792	346	10	0	\N	\N	\N	\N	\N
3793	345	10	0	\N	\N	\N	\N	\N
3794	301	10	0	\N	\N	\N	\N	\N
3795	348	10	0	\N	\N	\N	\N	\N
3796	351	10	0	\N	\N	\N	\N	\N
3797	350	10	0	\N	\N	\N	\N	\N
3798	507	10	0	\N	\N	\N	\N	\N
3799	362	10	0	\N	\N	\N	\N	\N
3800	361	10	0	\N	\N	\N	\N	\N
3801	360	10	0	\N	\N	\N	\N	\N
3802	367	10	0	\N	\N	\N	\N	\N
3803	366	10	0	\N	\N	\N	\N	\N
3804	365	10	0	\N	\N	\N	\N	\N
3805	371	10	0	\N	\N	\N	\N	\N
3806	370	10	0	\N	\N	\N	\N	\N
3807	368	10	0	\N	\N	\N	\N	\N
3808	375	10	0	\N	\N	\N	\N	\N
3809	373	10	0	\N	\N	\N	\N	\N
3810	372	10	0	\N	\N	\N	\N	\N
3811	364	10	0	\N	\N	\N	\N	\N
3812	384	10	0	\N	\N	\N	\N	\N
3813	380	10	0	\N	\N	\N	\N	\N
3814	378	10	0	\N	\N	\N	\N	\N
3815	377	10	0	\N	\N	\N	\N	\N
3816	382	10	0	\N	\N	\N	\N	\N
3817	379	10	0	\N	\N	\N	\N	\N
3818	386	10	0	\N	\N	\N	\N	\N
3819	385	10	0	\N	\N	\N	\N	\N
3820	388	10	0	\N	\N	\N	\N	\N
3821	390	10	0	\N	\N	\N	\N	\N
3822	383	10	0	\N	\N	\N	\N	\N
3823	341	10	0	\N	\N	\N	\N	\N
3824	340	10	0	\N	\N	\N	\N	\N
3825	357	10	0	\N	\N	\N	\N	\N
3826	389	10	0	\N	\N	\N	\N	\N
3827	381	10	0	\N	\N	\N	\N	\N
3828	359	10	0	\N	\N	\N	\N	\N
3829	342	10	0	\N	\N	\N	\N	\N
3830	394	10	0	\N	\N	\N	\N	\N
3831	393	10	0	\N	\N	\N	\N	\N
3832	392	10	0	\N	\N	\N	\N	\N
3833	424	10	0	\N	\N	\N	\N	\N
3834	423	10	0	\N	\N	\N	\N	\N
3835	400	10	0	\N	\N	\N	\N	\N
3836	399	10	0	\N	\N	\N	\N	\N
3837	398	10	0	\N	\N	\N	\N	\N
3838	396	10	0	\N	\N	\N	\N	\N
3839	395	10	0	\N	\N	\N	\N	\N
3840	406	10	0	\N	\N	\N	\N	\N
3841	405	10	0	\N	\N	\N	\N	\N
3842	411	10	0	\N	\N	\N	\N	\N
3843	2	10	0	\N	\N	\N	\N	\N
3844	402	10	0	\N	\N	\N	\N	\N
3845	408	10	0	\N	\N	\N	\N	\N
3846	401	10	0	\N	\N	\N	\N	\N
3847	410	10	0	\N	\N	\N	\N	\N
3848	415	10	0	\N	\N	\N	\N	\N
3849	407	10	0	\N	\N	\N	\N	\N
3850	409	10	0	\N	\N	\N	\N	\N
3851	404	10	0	\N	\N	\N	\N	\N
3852	416	10	0	\N	\N	\N	\N	\N
3853	426	10	0	\N	\N	\N	\N	\N
3854	420	10	0	\N	\N	\N	\N	\N
3855	417	10	0	\N	\N	\N	\N	\N
3856	439	10	0	\N	\N	\N	\N	\N
3857	422	10	0	\N	\N	\N	\N	\N
3858	418	10	0	\N	\N	\N	\N	\N
3859	419	10	0	\N	\N	\N	\N	\N
3860	397	10	0	\N	\N	\N	\N	\N
3861	413	10	0	\N	\N	\N	\N	\N
3862	412	10	0	\N	\N	\N	\N	\N
3863	442	10	0	\N	\N	\N	\N	\N
3864	449	10	0	\N	\N	\N	\N	\N
3865	446	10	0	\N	\N	\N	\N	\N
3866	445	10	0	\N	\N	\N	\N	\N
3867	444	10	0	\N	\N	\N	\N	\N
3868	448	10	0	\N	\N	\N	\N	\N
3869	452	10	0	\N	\N	\N	\N	\N
3870	447	10	0	\N	\N	\N	\N	\N
3871	491	10	0	\N	\N	\N	\N	\N
3872	464	10	0	\N	\N	\N	\N	\N
3873	458	10	0	\N	\N	\N	\N	\N
3874	461	10	0	\N	\N	\N	\N	\N
3875	457	10	0	\N	\N	\N	\N	\N
3876	451	10	0	\N	\N	\N	\N	\N
3877	455	10	0	\N	\N	\N	\N	\N
3878	453	10	0	\N	\N	\N	\N	\N
3879	460	10	0	\N	\N	\N	\N	\N
3880	459	10	0	\N	\N	\N	\N	\N
3881	463	10	0	\N	\N	\N	\N	\N
3882	450	10	0	\N	\N	\N	\N	\N
3883	462	10	0	\N	\N	\N	\N	\N
3884	429	10	0	\N	\N	\N	\N	\N
3885	433	10	0	\N	\N	\N	\N	\N
3886	428	10	0	\N	\N	\N	\N	\N
3887	432	10	0	\N	\N	\N	\N	\N
3888	479	10	0	\N	\N	\N	\N	\N
3889	466	10	0	\N	\N	\N	\N	\N
3890	431	10	0	\N	\N	\N	\N	\N
3891	430	10	0	\N	\N	\N	\N	\N
3892	440	10	0	\N	\N	\N	\N	\N
3893	441	10	0	\N	\N	\N	\N	\N
3894	438	10	0	\N	\N	\N	\N	\N
3895	436	10	0	\N	\N	\N	\N	\N
3896	434	10	0	\N	\N	\N	\N	\N
3897	504	10	0	\N	\N	\N	\N	\N
3898	443	10	0	\N	\N	\N	\N	\N
3899	496	10	0	\N	\N	\N	\N	\N
3900	490	10	0	\N	\N	\N	\N	\N
3901	467	10	0	\N	\N	\N	\N	\N
3902	489	10	0	\N	\N	\N	\N	\N
3903	513	10	0	\N	\N	\N	\N	\N
3904	493	10	0	\N	\N	\N	\N	\N
3905	492	10	0	\N	\N	\N	\N	\N
3906	501	10	0	\N	\N	\N	\N	\N
3907	494	10	0	\N	\N	\N	\N	\N
3908	505	10	0	\N	\N	\N	\N	\N
3909	514	10	0	\N	\N	\N	\N	\N
3910	499	10	0	\N	\N	\N	\N	\N
3911	503	10	0	\N	\N	\N	\N	\N
3912	468	10	0	\N	\N	\N	\N	\N
3913	498	10	0	\N	\N	\N	\N	\N
3914	497	10	0	\N	\N	\N	\N	\N
3915	472	10	0	\N	\N	\N	\N	\N
3916	512	10	0	\N	\N	\N	\N	\N
3917	502	10	0	\N	\N	\N	\N	\N
3918	469	10	0	\N	\N	\N	\N	\N
3919	471	10	0	\N	\N	\N	\N	\N
3920	476	10	0	\N	\N	\N	\N	\N
3921	475	10	0	\N	\N	\N	\N	\N
3922	470	10	0	\N	\N	\N	\N	\N
3923	474	10	0	\N	\N	\N	\N	\N
3924	484	10	0	\N	\N	\N	\N	\N
3925	473	10	0	\N	\N	\N	\N	\N
3926	483	10	0	\N	\N	\N	\N	\N
3927	482	10	0	\N	\N	\N	\N	\N
3928	480	10	0	\N	\N	\N	\N	\N
3929	477	10	0	\N	\N	\N	\N	\N
3930	533	10	0	\N	\N	\N	\N	\N
3931	488	10	0	\N	\N	\N	\N	\N
3932	487	10	0	\N	\N	\N	\N	\N
3933	486	10	0	\N	\N	\N	\N	\N
3934	485	10	0	\N	\N	\N	\N	\N
3935	538	10	0	\N	\N	\N	\N	\N
3936	541	10	0	\N	\N	\N	\N	\N
3937	543	10	0	\N	\N	\N	\N	\N
3938	511	10	0	\N	\N	\N	\N	\N
3939	508	10	0	\N	\N	\N	\N	\N
3940	575	10	0	\N	\N	\N	\N	\N
3941	542	10	0	\N	\N	\N	\N	\N
3942	510	10	0	\N	\N	\N	\N	\N
3943	509	10	0	\N	\N	\N	\N	\N
3944	578	10	0	\N	\N	\N	\N	\N
3945	548	10	0	\N	\N	\N	\N	\N
3946	546	10	0	\N	\N	\N	\N	\N
3947	545	10	0	\N	\N	\N	\N	\N
3948	544	10	0	\N	\N	\N	\N	\N
3949	562	10	0	\N	\N	\N	\N	\N
3950	516	10	0	\N	\N	\N	\N	\N
3951	515	10	0	\N	\N	\N	\N	\N
3952	547	10	0	\N	\N	\N	\N	\N
3953	551	10	0	\N	\N	\N	\N	\N
3954	579	10	0	\N	\N	\N	\N	\N
3955	527	10	0	\N	\N	\N	\N	\N
3956	540	10	0	\N	\N	\N	\N	\N
3957	518	10	0	\N	\N	\N	\N	\N
3958	478	10	0	\N	\N	\N	\N	\N
3959	559	10	0	\N	\N	\N	\N	\N
3960	517	10	0	\N	\N	\N	\N	\N
3961	531	10	0	\N	\N	\N	\N	\N
3962	520	10	0	\N	\N	\N	\N	\N
3963	535	10	0	\N	\N	\N	\N	\N
3964	530	10	0	\N	\N	\N	\N	\N
3965	526	10	0	\N	\N	\N	\N	\N
3966	528	10	0	\N	\N	\N	\N	\N
3967	537	10	0	\N	\N	\N	\N	\N
3968	534	10	0	\N	\N	\N	\N	\N
3969	536	10	0	\N	\N	\N	\N	\N
3970	522	10	0	\N	\N	\N	\N	\N
3971	553	10	0	\N	\N	\N	\N	\N
3972	539	10	0	\N	\N	\N	\N	\N
3973	519	10	0	\N	\N	\N	\N	\N
3974	149	10	0	\N	\N	\N	\N	\N
3975	123	10	0	\N	\N	\N	\N	\N
3976	576	10	0	\N	\N	\N	\N	\N
3977	570	10	0	\N	\N	\N	\N	\N
3978	358	10	0	\N	\N	\N	\N	\N
3979	164	10	0	\N	\N	\N	\N	\N
3980	571	10	0	\N	\N	\N	\N	\N
3981	574	10	0	\N	\N	\N	\N	\N
3982	549	10	0	\N	\N	\N	\N	\N
3983	563	10	0	\N	\N	\N	\N	\N
3984	550	10	0	\N	\N	\N	\N	\N
3985	577	10	0	\N	\N	\N	\N	\N
3986	495	10	0	\N	\N	\N	\N	\N
3987	552	10	0	\N	\N	\N	\N	\N
3988	565	10	0	\N	\N	\N	\N	\N
3989	554	10	0	\N	\N	\N	\N	\N
3990	573	10	0	\N	\N	\N	\N	\N
3991	558	10	0	\N	\N	\N	\N	\N
3992	564	10	0	\N	\N	\N	\N	\N
3993	555	10	0	\N	\N	\N	\N	\N
3994	566	10	0	\N	\N	\N	\N	\N
3995	560	10	0	\N	\N	\N	\N	\N
3996	561	10	0	\N	\N	\N	\N	\N
3997	556	10	0	\N	\N	\N	\N	\N
3998	521	10	0	\N	\N	\N	\N	\N
3999	308	10	0	\N	\N	\N	\N	\N
4000	315	10	0	\N	\N	\N	\N	\N
4001	525	10	0	\N	\N	\N	\N	\N
4002	425	10	0	\N	\N	\N	\N	\N
4003	524	10	0	\N	\N	\N	\N	\N
4004	568	10	0	\N	\N	\N	\N	\N
4005	435	10	0	\N	\N	\N	\N	\N
4006	572	10	0	\N	\N	\N	\N	\N
4007	567	10	0	\N	\N	\N	\N	\N
4008	3	10	0	\N	\N	\N	\N	\N
4009	77	10	0	\N	\N	\N	\N	\N
4010	99	10	0	\N	\N	\N	\N	\N
4011	100	10	0	\N	\N	\N	\N	\N
4012	667	10	0	\N	\N	\N	\N	\N
4013	363	10	0	\N	\N	\N	\N	\N
4014	173	10	0	\N	\N	\N	\N	\N
4015	456	10	0	\N	\N	\N	\N	\N
4016	454	10	0	\N	\N	\N	\N	\N
4017	211	10	0	\N	\N	\N	\N	\N
4018	197	10	0	\N	\N	\N	\N	\N
4019	414	10	0	\N	\N	\N	\N	\N
4020	326	10	0	\N	\N	\N	\N	\N
4021	224	10	0	\N	\N	\N	\N	\N
4022	369	10	0	\N	\N	\N	\N	\N
4023	239	10	0	\N	\N	\N	\N	\N
4024	249	10	0	\N	\N	\N	\N	\N
4025	259	10	0	\N	\N	\N	\N	\N
4026	260	10	0	\N	\N	\N	\N	\N
4027	261	10	0	\N	\N	\N	\N	\N
4028	391	10	0	\N	\N	\N	\N	\N
4029	282	10	0	\N	\N	\N	\N	\N
4030	500	10	0	\N	\N	\N	\N	\N
4031	557	10	0	\N	\N	\N	\N	\N
4032	666	10	0	\N	\N	\N	\N	\N
4033	310	10	0	\N	\N	\N	\N	\N
4034	523	10	0	\N	\N	\N	\N	\N
4035	11	10	0	\N	\N	\N	\N	\N
4036	18	10	0	\N	\N	\N	\N	\N
4037	35	10	0	\N	\N	\N	\N	\N
4038	38	10	0	\N	\N	\N	\N	\N
4039	54	10	0	\N	\N	\N	\N	\N
4040	598	10	0	\N	\N	\N	\N	\N
4041	80	10	0	\N	\N	\N	\N	\N
4042	587	10	0	\N	\N	\N	\N	\N
4043	154	10	0	\N	\N	\N	\N	\N
4044	145	10	0	\N	\N	\N	\N	\N
4045	103	10	0	\N	\N	\N	\N	\N
4046	210	10	0	\N	\N	\N	\N	\N
4047	588	10	0	\N	\N	\N	\N	\N
4048	246	10	0	\N	\N	\N	\N	\N
4049	162	10	0	\N	\N	\N	\N	\N
4050	237	10	0	\N	\N	\N	\N	\N
4051	403	10	0	\N	\N	\N	\N	\N
4052	589	10	0	\N	\N	\N	\N	\N
4053	269	10	0	\N	\N	\N	\N	\N
4054	374	10	0	\N	\N	\N	\N	\N
4055	592	10	0	\N	\N	\N	\N	\N
4056	583	10	0	\N	\N	\N	\N	\N
4057	591	10	0	\N	\N	\N	\N	\N
4058	590	10	0	\N	\N	\N	\N	\N
4059	597	10	0	\N	\N	\N	\N	\N
4060	596	10	0	\N	\N	\N	\N	\N
4061	594	10	0	\N	\N	\N	\N	\N
4062	593	10	0	\N	\N	\N	\N	\N
4063	582	10	0	\N	\N	\N	\N	\N
4064	581	10	0	\N	\N	\N	\N	\N
4065	584	10	0	\N	\N	\N	\N	\N
4066	595	10	0	\N	\N	\N	\N	\N
4067	320	10	0	\N	\N	\N	\N	\N
4068	311	10	0	\N	\N	\N	\N	\N
4069	586	10	0	\N	\N	\N	\N	\N
4070	580	10	0	\N	\N	\N	\N	\N
4071	585	10	0	\N	\N	\N	\N	\N
4072	161	10	0	\N	\N	\N	\N	\N
4073	607	10	0	\N	\N	\N	\N	\N
4074	226	10	0	\N	\N	\N	\N	\N
4075	621	10	0	\N	\N	\N	\N	\N
4076	609	10	0	\N	\N	\N	\N	\N
4077	608	10	0	\N	\N	\N	\N	\N
4078	465	10	0	\N	\N	\N	\N	\N
4079	610	10	0	\N	\N	\N	\N	\N
4080	376	10	0	\N	\N	\N	\N	\N
4081	613	10	0	\N	\N	\N	\N	\N
4082	612	10	0	\N	\N	\N	\N	\N
4083	611	10	0	\N	\N	\N	\N	\N
4084	327	10	0	\N	\N	\N	\N	\N
4085	615	10	0	\N	\N	\N	\N	\N
4086	614	10	0	\N	\N	\N	\N	\N
4087	605	10	0	\N	\N	\N	\N	\N
4088	604	10	0	\N	\N	\N	\N	\N
4089	616	10	0	\N	\N	\N	\N	\N
4090	623	10	0	\N	\N	\N	\N	\N
4091	617	10	0	\N	\N	\N	\N	\N
4092	603	10	0	\N	\N	\N	\N	\N
4093	600	10	0	\N	\N	\N	\N	\N
4094	599	10	0	\N	\N	\N	\N	\N
4095	624	10	0	\N	\N	\N	\N	\N
4096	618	10	0	\N	\N	\N	\N	\N
4097	601	10	0	\N	\N	\N	\N	\N
4098	622	10	0	\N	\N	\N	\N	\N
4099	620	10	0	\N	\N	\N	\N	\N
4100	529	10	0	\N	\N	\N	\N	\N
4101	619	10	0	\N	\N	\N	\N	\N
4102	481	10	0	\N	\N	\N	\N	\N
4103	421	10	0	\N	\N	\N	\N	\N
4104	427	10	0	\N	\N	\N	\N	\N
4105	532	10	0	\N	\N	\N	\N	\N
4106	606	10	0	\N	\N	\N	\N	\N
4107	506	10	0	\N	\N	\N	\N	\N
4108	646	10	0	\N	\N	\N	\N	\N
4109	653	10	0	\N	\N	\N	\N	\N
4110	651	10	0	\N	\N	\N	\N	\N
4111	253	10	0	\N	\N	\N	\N	\N
4112	652	10	0	\N	\N	\N	\N	\N
4113	650	10	0	\N	\N	\N	\N	\N
4114	65	10	0	\N	\N	\N	\N	\N
4115	4	10	0	\N	\N	\N	\N	\N
4116	602	10	0	\N	\N	\N	\N	\N
4117	655	9	0	\N	\N	\N	\N	\N
4118	656	9	0	\N	\N	\N	\N	\N
4119	667	9	0	\N	\N	\N	\N	\N
4120	666	9	0	\N	\N	\N	\N	\N
4121	650	9	0	\N	\N	\N	\N	\N
4122	652	9	0	\N	\N	\N	\N	\N
4123	653	9	0	\N	\N	\N	\N	\N
4124	651	9	0	\N	\N	\N	\N	\N
4125	646	9	0	\N	\N	\N	\N	\N
4135	27	11	0	\N	\N	\N	\N	\N
4169	49	11	0	\N	\N	\N	\N	\N
4186	39	11	0	\N	\N	\N	\N	\N
4195	126	11	0	\N	\N	\N	\N	\N
4199	84	11	0	\N	\N	\N	\N	\N
4140	7	11	1	2017-07-11 11:05:26	\N	\N	\N	\N
4216	85	11	1	2017-07-11 11:06:04	\N	\N	\N	\N
4130	64	11	1	2017-07-11 11:18:30	\N	\N	\N	\N
4189	44	11	1	2017-07-11 11:24:30	\N	\N	\N	\N
4133	63	11	1	2017-07-11 11:38:59	\N	\N	\N	\N
4159	90	11	1	2017-07-11 11:40:47	\N	\N	\N	\N
4180	89	11	1	2017-07-11 11:40:55	\N	\N	\N	\N
4187	101	11	1	2017-07-11 11:41:23	\N	\N	\N	\N
4184	58	11	1	2017-07-11 11:44:26	\N	\N	\N	\N
4212	75	11	1	2017-07-11 11:50:02	\N	\N	\N	\N
4202	133	11	1	2017-07-11 11:53:41	\N	\N	\N	\N
4154	14	11	1	2017-07-11 11:55:58	\N	\N	\N	\N
4161	43	11	1	2017-07-11 11:56:21	\N	\N	\N	\N
4188	88	11	1	2017-07-11 11:56:40	\N	\N	\N	\N
4163	96	11	1	2017-07-11 11:58:24	\N	\N	\N	\N
4197	68	11	1	2017-07-11 11:58:08	\N	\N	\N	\N
4134	13	11	1	2017-07-11 13:29:02	\N	\N	\N	\N
4139	32	11	1	2017-07-11 13:30:51	\N	\N	\N	\N
4207	128	11	1	2017-07-11 13:33:42	\N	\N	\N	\N
4235	119	11	1	2017-07-11 13:34:58	\N	\N	\N	\N
4222	137	11	1	2017-07-11 13:36:10	\N	\N	\N	\N
4172	57	11	1	2017-07-11 13:36:32	\N	\N	\N	\N
4179	94	11	1	2017-07-11 13:37:08	\N	\N	\N	\N
4174	48	11	1	2017-07-11 13:38:50	\N	\N	\N	\N
4177	56	11	1	2017-07-11 13:48:00	\N	\N	\N	\N
4185	37	11	1	2017-07-11 13:50:03	\N	\N	\N	\N
4238	139	11	1	2017-07-11 13:51:37	\N	\N	\N	\N
4182	95	11	1	2017-07-11 13:52:25	\N	\N	\N	\N
4234	113	11	1	2017-07-11 13:58:27	\N	\N	\N	\N
4170	46	11	1	2017-07-11 13:57:24	\N	\N	\N	\N
4206	78	11	1	2017-07-11 14:01:01	\N	\N	\N	\N
4152	172	11	1	2017-07-11 14:04:20	\N	\N	\N	\N
4142	23	11	1	2017-07-11 14:09:18	\N	\N	\N	\N
4237	102	11	1	2017-07-11 14:10:38	\N	\N	\N	\N
4136	25	11	1	2017-07-11 14:13:44	\N	\N	\N	\N
4151	26	11	1	2017-07-11 14:16:18	\N	\N	\N	\N
4148	61	11	1	2017-07-11 14:23:53	\N	\N	\N	\N
4215	66	11	1	2017-07-11 14:23:17	\N	\N	\N	\N
4204	127	11	1	2017-07-11 14:24:22	\N	\N	\N	\N
4173	97	11	1	2017-07-11 14:25:23	\N	\N	\N	\N
4165	45	11	1	2017-07-11 14:26:49	\N	\N	\N	\N
4143	20	11	1	2017-07-11 14:27:07	\N	\N	\N	\N
4213	67	11	1	2017-07-11 14:27:34	\N	\N	\N	\N
4162	40	11	1	2017-07-11 14:28:28	\N	\N	\N	\N
4226	160	11	1	2017-07-11 14:29:26	\N	\N	\N	\N
4219	79	11	1	2017-07-11 14:32:41	\N	\N	\N	\N
4228	171	11	1	2017-07-11 14:32:52	\N	\N	\N	\N
4127	5	11	1	2017-07-11 14:33:12	\N	\N	\N	\N
4191	122	11	1	2017-07-11 14:33:34	\N	\N	\N	\N
4164	41	11	1	2017-07-11 14:34:55	\N	\N	\N	\N
4144	22	11	1	2017-07-11 14:36:27	\N	\N	\N	\N
4201	73	11	1	2017-07-11 14:35:27	\N	\N	\N	\N
4194	121	11	1	2017-07-11 14:38:11	\N	\N	\N	\N
4178	51	11	1	2017-07-11 14:39:02	\N	\N	\N	\N
4149	60	11	1	2017-07-11 14:40:01	\N	\N	\N	\N
4200	83	11	1	2017-07-11 14:40:14	\N	\N	\N	\N
4229	107	11	1	2017-07-11 14:44:20	\N	\N	\N	\N
4155	10	11	1	2017-07-11 14:44:34	\N	\N	\N	\N
4232	110	11	1	2017-07-11 14:47:03	\N	\N	\N	\N
4193	134	11	1	2017-07-11 14:51:59	\N	\N	\N	\N
4156	21	11	1	2017-07-11 14:53:49	\N	\N	\N	\N
4233	167	11	1	2017-07-11 14:54:21	\N	\N	\N	\N
4160	47	11	1	2017-07-11 14:55:37	\N	\N	\N	\N
4225	169	11	1	2017-07-11 14:56:59	\N	\N	\N	\N
4168	42	11	1	2017-07-11 15:03:48	\N	\N	\N	\N
4137	17	11	1	2017-07-11 15:04:47	\N	\N	\N	\N
4126	24	11	1	2017-07-11 15:09:19	\N	\N	\N	\N
4138	30	11	1	2017-07-11 15:14:33	\N	\N	\N	\N
4166	36	11	1	2017-07-11 15:36:43	\N	\N	\N	\N
4227	118	11	1	2017-07-11 15:27:23	\N	\N	\N	\N
4198	124	11	1	2017-07-11 15:37:42	\N	\N	\N	\N
4145	6	11	1	2017-07-12 09:27:53	\N	\N	\N	\N
4181	50	11	1	2017-07-12 09:37:02	\N	\N	\N	\N
4218	81	11	1	2017-07-12 09:54:39	\N	\N	\N	\N
4203	131	11	1	2017-07-12 10:09:44	\N	\N	\N	\N
4167	93	11	1	2017-07-12 10:57:55	\N	\N	\N	\N
4146	15	11	1	2017-07-13 15:27:21	\N	\N	\N	\N
4171	92	11	1	2017-07-12 11:16:06	\N	\N	\N	\N
4209	132	11	1	2017-07-12 11:59:50	\N	\N	\N	\N
4176	52	11	1	2017-07-12 12:03:04	\N	\N	\N	\N
4157	9	11	1	2017-07-13 08:42:55	\N	\N	\N	\N
4150	8	11	1	2017-07-13 08:43:46	\N	\N	\N	\N
4221	109	11	1	2017-07-13 08:47:20	\N	\N	\N	\N
4223	105	11	1	2017-07-13 08:50:38	\N	\N	\N	\N
4131	28	11	1	2017-07-18 14:50:20	\N	\N	\N	\N
4301	195	11	0	\N	\N	\N	\N	\N
4302	215	11	0	\N	\N	\N	\N	\N
4308	186	11	0	\N	\N	\N	\N	\N
4334	240	11	0	\N	\N	\N	\N	\N
4341	304	11	0	\N	\N	\N	\N	\N
4348	290	11	0	\N	\N	\N	\N	\N
4377	302	11	0	\N	\N	\N	\N	\N
4388	328	11	0	\N	\N	\N	\N	\N
4395	334	11	0	\N	\N	\N	\N	\N
4282	192	11	1	2017-07-11 11:14:16	\N	\N	\N	\N
4342	262	11	1	2017-07-11 11:16:30	\N	\N	\N	\N
4330	271	11	1	2017-07-11 11:25:37	\N	\N	\N	\N
4383	345	11	1	2017-07-11 11:27:28	\N	\N	\N	\N
4323	220	11	1	2017-07-11 11:34:16	\N	\N	\N	\N
4290	216	11	1	2017-07-11 11:37:52	\N	\N	\N	\N
4380	343	11	1	2017-07-11 11:38:12	\N	\N	\N	\N
4269	150	11	1	2017-07-11 11:38:21	\N	\N	\N	\N
4349	316	11	1	2017-07-11 11:43:51	\N	\N	\N	\N
4250	159	11	1	2017-07-11 11:45:02	\N	\N	\N	\N
4264	202	11	1	2017-07-11 11:46:49	\N	\N	\N	\N
4258	148	11	1	2017-07-11 11:45:29	\N	\N	\N	\N
4251	208	11	1	2017-07-11 11:49:40	\N	\N	\N	\N
4352	295	11	1	2017-07-11 11:51:28	\N	\N	\N	\N
4356	288	11	1	2017-07-11 11:52:51	\N	\N	\N	\N
4303	193	11	1	2017-07-11 11:54:18	\N	\N	\N	\N
4385	354	11	1	2017-07-11 11:56:55	\N	\N	\N	\N
4315	241	11	1	2017-07-11 11:59:50	\N	\N	\N	\N
4268	174	11	1	2017-07-11 12:00:54	\N	\N	\N	\N
4305	214	11	1	2017-07-11 12:01:21	\N	\N	\N	\N
4239	120	11	1	2017-07-11 13:26:45	\N	\N	\N	\N
4367	325	11	1	2017-07-11 13:30:10	\N	\N	\N	\N
4357	306	11	1	2017-07-11 13:31:35	\N	\N	\N	\N
4372	299	11	1	2017-07-11 13:32:26	\N	\N	\N	\N
4273	176	11	1	2017-07-11 13:40:11	\N	\N	\N	\N
4364	300	11	1	2017-07-11 13:42:13	\N	\N	\N	\N
4393	301	11	1	2017-07-11 13:43:00	\N	\N	\N	\N
4387	321	11	1	2017-07-11 13:43:19	\N	\N	\N	\N
4292	183	11	1	2017-07-11 13:44:19	\N	\N	\N	\N
4391	298	11	1	2017-07-11 13:46:53	\N	\N	\N	\N
4389	303	11	1	2017-07-11 13:45:46	\N	\N	\N	\N
4363	314	11	1	2017-07-11 13:47:41	\N	\N	\N	\N
4373	337	11	1	2017-07-11 13:48:46	\N	\N	\N	\N
4294	182	11	1	2017-07-11 13:49:05	\N	\N	\N	\N
4381	335	11	1	2017-07-11 13:49:49	\N	\N	\N	\N
4353	312	11	1	2017-07-11 13:51:21	\N	\N	\N	\N
4307	217	11	1	2017-07-11 13:59:52	\N	\N	\N	\N
4272	151	11	1	2017-07-11 14:01:21	\N	\N	\N	\N
4325	279	11	1	2017-07-11 14:02:10	\N	\N	\N	\N
4338	244	11	1	2017-07-11 14:02:28	\N	\N	\N	\N
4336	247	11	1	2017-07-11 14:04:31	\N	\N	\N	\N
4243	117	11	1	2017-07-11 14:04:43	\N	\N	\N	\N
4343	313	11	1	2017-07-11 14:06:50	\N	\N	\N	\N
4386	338	11	1	2017-07-11 14:07:17	\N	\N	\N	\N
4241	114	11	1	2017-07-11 14:08:09	\N	\N	\N	\N
4283	218	11	1	2017-07-11 14:10:23	\N	\N	\N	\N
4253	203	11	1	2017-07-11 14:10:50	\N	\N	\N	\N
4368	344	11	1	2017-07-11 14:18:57	\N	\N	\N	\N
4279	158	11	1	2017-07-11 14:20:28	\N	\N	\N	\N
4369	350	11	1	2017-07-11 14:26:18	\N	\N	\N	\N
4244	112	11	1	2017-07-11 14:29:38	\N	\N	\N	\N
4328	245	11	1	2017-07-11 14:29:53	\N	\N	\N	\N
4249	140	11	1	2017-07-11 14:31:52	\N	\N	\N	\N
4248	116	11	1	2017-07-11 14:32:28	\N	\N	\N	\N
4322	268	11	1	2017-07-11 14:36:00	\N	\N	\N	\N
4298	228	11	1	2017-07-11 14:34:17	\N	\N	\N	\N
4392	323	11	1	2017-07-11 14:40:34	\N	\N	\N	\N
4299	184	11	1	2017-07-11 14:41:00	\N	\N	\N	\N
4384	329	11	1	2017-07-11 14:43:44	\N	\N	\N	\N
4376	333	11	1	2017-07-11 14:45:18	\N	\N	\N	\N
4245	165	11	1	2017-07-11 14:48:03	\N	\N	\N	\N
4276	205	11	1	2017-07-11 14:48:15	\N	\N	\N	\N
4261	142	11	1	2017-07-11 14:48:34	\N	\N	\N	\N
4260	206	11	1	2017-07-11 14:50:08	\N	\N	\N	\N
4296	212	11	1	2017-07-11 14:52:33	\N	\N	\N	\N
4259	144	11	1	2017-07-11 14:52:59	\N	\N	\N	\N
4358	251	11	1	2017-07-11 14:55:18	\N	\N	\N	\N
4332	236	11	1	2017-07-11 14:55:52	\N	\N	\N	\N
4337	265	11	1	2017-07-19 14:46:36	\N	\N	\N	\N
4314	242	11	1	2017-07-11 14:58:27	\N	\N	\N	\N
4266	199	11	1	2017-07-11 14:59:27	\N	\N	\N	\N
4360	255	11	1	2017-07-11 15:01:27	\N	\N	\N	\N
4277	198	11	1	2017-07-11 15:03:34	\N	\N	\N	\N
4354	294	11	1	2017-07-11 15:03:04	\N	\N	\N	\N
4306	223	11	1	2017-07-11 15:07:51	\N	\N	\N	\N
4288	188	11	1	2017-07-11 15:07:05	\N	\N	\N	\N
4379	352	11	1	2017-07-11 15:11:09	\N	\N	\N	\N
4240	115	11	1	2017-07-11 15:11:27	\N	\N	\N	\N
4371	348	11	1	2017-07-11 15:11:40	\N	\N	\N	\N
4335	356	11	1	2017-07-11 15:14:57	\N	\N	\N	\N
4289	227	11	1	2017-07-11 15:19:43	\N	\N	\N	\N
4319	243	11	1	2017-07-11 15:21:54	\N	\N	\N	\N
4327	277	11	1	2017-07-11 15:30:23	\N	\N	\N	\N
4278	196	11	1	2017-07-11 15:28:21	\N	\N	\N	\N
4247	138	11	1	2017-07-11 15:33:54	\N	\N	\N	\N
4375	346	11	1	2017-07-11 15:34:36	\N	\N	\N	\N
4286	655	11	1	2017-07-11 15:35:12	\N	\N	\N	\N
4254	155	11	1	2017-07-11 15:37:03	\N	\N	\N	\N
4320	263	11	1	2017-07-11 15:44:48	\N	\N	\N	\N
4326	266	11	1	2017-07-11 15:47:53	\N	\N	\N	\N
4284	231	11	1	2017-07-11 16:05:31	\N	\N	\N	\N
4362	319	11	1	2017-07-11 16:18:54	\N	\N	\N	\N
4370	331	11	1	2017-07-12 09:27:16	\N	\N	\N	\N
4293	187	11	1	2017-07-12 09:31:03	\N	\N	\N	\N
4274	146	11	1	2017-07-12 09:35:10	\N	\N	\N	\N
4333	238	11	1	2017-07-12 09:36:14	\N	\N	\N	\N
4311	273	11	1	2017-07-12 10:00:12	\N	\N	\N	\N
4324	252	11	1	2017-07-12 10:05:01	\N	\N	\N	\N
4378	351	11	1	2017-07-12 10:06:03	\N	\N	\N	\N
4355	285	11	1	2017-07-13 09:54:46	\N	\N	\N	\N
4275	153	11	1	2017-07-12 10:36:11	\N	\N	\N	\N
4312	254	11	1	2017-07-13 09:35:34	\N	\N	\N	\N
4287	222	11	1	2017-07-12 10:56:20	\N	\N	\N	\N
4350	257	11	1	2017-07-12 11:01:58	\N	\N	\N	\N
4295	656	11	1	2017-07-12 11:17:12	\N	\N	\N	\N
4270	204	11	1	2017-07-12 11:38:38	\N	\N	\N	\N
4262	175	11	1	2017-07-12 11:26:58	\N	\N	\N	\N
4285	181	11	1	2017-07-12 11:40:43	\N	\N	\N	\N
4242	136	11	1	2017-07-12 11:48:37	\N	\N	\N	\N
4313	267	11	1	2017-07-12 11:53:39	\N	\N	\N	\N
4318	221	11	1	2017-07-13 09:27:35	\N	\N	\N	\N
4382	336	11	1	2017-07-12 14:28:46	\N	\N	\N	\N
4300	194	11	1	2017-07-13 08:52:18	\N	\N	\N	\N
4351	307	11	1	2017-07-13 08:57:43	\N	\N	\N	\N
4256	207	11	1	2017-07-13 14:26:28	\N	\N	\N	\N
4361	276	11	1	2017-07-18 15:33:55	\N	\N	\N	\N
4316	256	11	1	2017-07-19 09:23:03	\N	\N	\N	\N
4400	379	11	0	\N	\N	\N	\N	\N
4410	365	11	0	\N	\N	\N	\N	\N
4423	384	11	0	\N	\N	\N	\N	\N
4436	407	11	0	\N	\N	\N	\N	\N
4456	404	11	0	\N	\N	\N	\N	\N
4462	491	11	0	\N	\N	\N	\N	\N
4486	533	11	0	\N	\N	\N	\N	\N
4491	467	11	0	\N	\N	\N	\N	\N
4522	578	11	0	\N	\N	\N	\N	\N
4538	520	11	0	\N	\N	\N	\N	\N
4552	576	11	0	\N	\N	\N	\N	\N
4540	553	11	1	2017-07-11 10:46:29	\N	\N	\N	\N
4546	565	11	1	2017-07-11 10:47:59	\N	\N	\N	\N
4489	475	11	1	2017-07-11 10:48:56	\N	\N	\N	\N
4543	536	11	1	2017-07-11 10:49:07	\N	\N	\N	\N
4497	486	11	1	2017-07-11 10:51:11	\N	\N	\N	\N
4492	513	11	1	2017-07-11 10:50:56	\N	\N	\N	\N
4443	409	11	1	2017-07-11 10:53:12	\N	\N	\N	\N
4535	522	11	1	2017-07-11 10:52:10	\N	\N	\N	\N
4517	546	11	1	2017-07-11 10:54:03	\N	\N	\N	\N
4521	531	11	1	2017-07-11 10:54:22	\N	\N	\N	\N
4499	492	11	1	2017-07-11 10:54:34	\N	\N	\N	\N
4434	419	11	1	2017-07-11 10:55:21	\N	\N	\N	\N
4494	493	11	1	2017-07-11 10:56:23	\N	\N	\N	\N
4508	487	11	1	2017-07-11 10:56:37	\N	\N	\N	\N
4474	430	11	1	2017-07-11 10:56:51	\N	\N	\N	\N
4550	425	11	1	2017-07-11 10:57:18	\N	\N	\N	\N
4542	530	11	1	2017-07-11 10:59:04	\N	\N	\N	\N
4433	426	11	1	2017-07-11 10:59:42	\N	\N	\N	\N
4513	485	11	1	2017-07-11 10:59:58	\N	\N	\N	\N
4527	539	11	1	2017-07-11 11:00:28	\N	\N	\N	\N
4485	428	11	1	2017-07-11 11:02:50	\N	\N	\N	\N
4441	423	11	1	2017-07-11 11:03:21	\N	\N	\N	\N
4440	417	11	1	2017-07-11 11:05:02	\N	\N	\N	\N
4467	459	11	1	2017-07-11 11:05:40	\N	\N	\N	\N
4487	480	11	1	2017-07-11 11:08:16	\N	\N	\N	\N
4514	477	11	1	2017-07-11 11:10:01	\N	\N	\N	\N
4529	535	11	1	2017-07-11 11:10:24	\N	\N	\N	\N
4477	443	11	1	2017-07-11 11:10:58	\N	\N	\N	\N
4458	439	11	1	2017-07-11 11:12:01	\N	\N	\N	\N
4537	545	11	1	2017-07-11 11:12:23	\N	\N	\N	\N
4472	457	11	1	2017-07-11 11:13:04	\N	\N	\N	\N
4507	497	11	1	2017-07-11 11:13:23	\N	\N	\N	\N
4454	393	11	1	2017-07-11 11:14:38	\N	\N	\N	\N
4442	400	11	1	2017-07-11 11:14:58	\N	\N	\N	\N
4490	483	11	1	2017-07-11 11:15:54	\N	\N	\N	\N
4478	434	11	1	2017-07-11 11:17:00	\N	\N	\N	\N
4445	396	11	1	2017-07-11 11:18:02	\N	\N	\N	\N
4502	505	11	1	2017-07-11 11:18:53	\N	\N	\N	\N
4439	420	11	1	2017-07-11 11:20:05	\N	\N	\N	\N
4544	559	11	1	2017-07-11 11:20:55	\N	\N	\N	\N
4548	570	11	1	2017-07-11 11:23:44	\N	\N	\N	\N
4509	494	11	1	2017-07-11 11:23:32	\N	\N	\N	\N
4475	504	11	1	2017-07-11 11:24:22	\N	\N	\N	\N
4483	441	11	1	2017-07-11 11:25:59	\N	\N	\N	\N
4516	526	11	1	2017-07-11 11:28:01	\N	\N	\N	\N
4503	489	11	1	2017-07-11 11:28:28	\N	\N	\N	\N
4504	501	11	1	2017-07-11 11:28:50	\N	\N	\N	\N
4533	528	11	1	2017-07-11 11:29:15	\N	\N	\N	\N
4493	474	11	1	2017-07-11 11:30:28	\N	\N	\N	\N
4519	510	11	1	2017-07-11 11:31:44	\N	\N	\N	\N
4510	469	11	1	2017-07-11 11:31:56	\N	\N	\N	\N
4498	482	11	1	2017-07-11 11:32:23	\N	\N	\N	\N
4530	547	11	1	2017-07-11 11:33:43	\N	\N	\N	\N
4470	466	11	1	2017-07-11 11:38:38	\N	\N	\N	\N
4399	368	11	1	2017-07-11 11:42:08	\N	\N	\N	\N
4531	575	11	1	2017-07-11 11:43:31	\N	\N	\N	\N
4466	436	11	1	2017-07-11 11:50:43	\N	\N	\N	\N
4418	388	11	1	2017-07-11 11:53:07	\N	\N	\N	\N
4539	544	11	1	2017-07-11 11:53:17	\N	\N	\N	\N
4453	399	11	1	2017-07-11 12:00:25	\N	\N	\N	\N
4547	3	11	1	2017-07-11 13:38:18	\N	\N	\N	\N
4425	340	11	1	2017-07-11 13:39:06	\N	\N	\N	\N
4515	515	11	1	2017-07-11 13:43:33	\N	\N	\N	\N
4411	367	11	1	2017-07-11 13:50:48	\N	\N	\N	\N
4480	444	11	1	2017-07-11 14:00:05	\N	\N	\N	\N
4452	418	11	1	2017-07-11 14:15:50	\N	\N	\N	\N
4405	357	11	1	2017-07-11 14:19:29	\N	\N	\N	\N
4449	402	11	1	2017-07-11 14:25:42	\N	\N	\N	\N
4424	382	11	1	2017-07-11 14:26:08	\N	\N	\N	\N
4401	373	11	1	2017-07-11 14:27:47	\N	\N	\N	\N
4419	370	11	1	2017-07-11 14:28:03	\N	\N	\N	\N
4455	394	11	1	2017-07-17 14:38:54	\N	\N	\N	\N
4444	411	11	1	2017-07-11 14:31:31	\N	\N	\N	\N
4446	408	11	1	2017-07-11 14:36:52	\N	\N	\N	\N
4525	509	11	1	2017-07-11 14:37:20	\N	\N	\N	\N
4421	364	11	1	2017-07-11 14:38:44	\N	\N	\N	\N
4451	410	11	1	2017-07-11 14:39:29	\N	\N	\N	\N
4407	386	11	1	2017-07-11 14:39:47	\N	\N	\N	\N
4404	366	11	1	2017-07-11 14:43:14	\N	\N	\N	\N
4448	405	11	1	2017-07-11 14:45:28	\N	\N	\N	\N
4428	362	11	1	2017-07-11 14:57:33	\N	\N	\N	\N
4422	360	11	1	2017-07-11 15:01:09	\N	\N	\N	\N
4473	464	11	1	2017-07-11 15:05:25	\N	\N	\N	\N
4524	579	11	1	2017-07-11 15:05:40	\N	\N	\N	\N
4459	413	11	1	2017-07-11 15:08:04	\N	\N	\N	\N
4505	468	11	1	2017-07-17 16:03:58	\N	\N	\N	\N
4398	375	11	1	2017-07-11 15:10:06	\N	\N	\N	\N
4501	488	11	1	2017-07-11 15:18:24	\N	\N	\N	\N
4551	577	11	1	2017-07-11 15:38:49	\N	\N	\N	\N
4397	342	11	1	2017-07-11 15:55:02	\N	\N	\N	\N
4435	397	11	1	2017-07-12 09:30:31	\N	\N	\N	\N
4481	479	11	1	2017-07-12 09:31:26	\N	\N	\N	\N
4415	383	11	1	2017-07-12 09:41:20	\N	\N	\N	\N
4414	378	11	1	2017-07-12 09:45:06	\N	\N	\N	\N
4512	484	11	1	2017-07-12 09:53:05	\N	\N	\N	\N
4471	445	11	1	2017-07-12 09:55:02	\N	\N	\N	\N
4447	395	11	1	2017-07-12 10:03:05	\N	\N	\N	\N
4460	447	11	1	2017-07-12 10:30:43	\N	\N	\N	\N
4409	390	11	1	2017-07-12 10:46:23	\N	\N	\N	\N
4511	503	11	1	2017-07-12 11:02:43	\N	\N	\N	\N
4406	372	11	1	2017-07-12 11:07:12	\N	\N	\N	\N
4432	401	11	1	2017-07-12 11:07:43	\N	\N	\N	\N
4408	377	11	1	2017-07-12 11:08:35	\N	\N	\N	\N
4431	2	11	1	2017-07-12 11:27:21	\N	\N	\N	\N
4476	433	11	1	2017-07-12 13:44:00	\N	\N	\N	\N
4528	527	11	1	2017-07-12 13:49:05	\N	\N	\N	\N
4438	412	11	1	2017-07-13 09:56:26	\N	\N	\N	\N
4520	519	11	1	2017-07-13 15:22:14	\N	\N	\N	\N
4484	432	11	1	2017-07-18 14:18:19	\N	\N	\N	\N
4403	389	11	1	2017-07-17 16:06:10	\N	\N	\N	\N
4457	422	11	1	2017-07-17 16:05:15	\N	\N	\N	\N
4426	380	11	1	2017-07-17 13:54:11	\N	\N	\N	\N
4506	498	11	1	2017-07-19 14:10:16	\N	\N	\N	\N
4482	440	11	1	2017-07-19 08:46:38	\N	\N	\N	\N
4420	371	11	1	2017-07-19 09:22:46	\N	\N	\N	\N
4496	499	11	1	2017-07-19 14:10:55	\N	\N	\N	\N
4555	572	11	0	\N	\N	\N	\N	\N
4563	574	11	0	\N	\N	\N	\N	\N
4572	261	11	0	\N	\N	\N	\N	\N
4575	211	11	0	\N	\N	\N	\N	\N
4577	667	11	0	\N	\N	\N	\N	\N
4582	456	11	0	\N	\N	\N	\N	\N
4588	260	11	0	\N	\N	\N	\N	\N
4613	311	11	0	\N	\N	\N	\N	\N
4626	210	11	0	\N	\N	\N	\N	\N
4632	617	11	0	\N	\N	\N	\N	\N
4646	600	11	0	\N	\N	\N	\N	\N
4660	603	11	0	\N	\N	\N	\N	\N
4662	646	11	0	\N	\N	\N	\N	\N
4663	4	11	0	\N	\N	\N	\N	\N
4670	653	11	0	\N	\N	\N	\N	\N
4683	233	11	0	\N	\N	\N	\N	\N
4684	180	11	0	\N	\N	\N	\N	\N
4694	309	11	0	\N	\N	\N	\N	\N
4558	571	11	1	2017-07-11 10:48:16	\N	\N	\N	\N
4697	416	11	1	2017-07-11 10:49:52	\N	\N	\N	\N
4656	427	11	1	2017-07-11 10:50:32	\N	\N	\N	\N
4703	463	11	1	2017-07-11 10:52:40	\N	\N	\N	\N
4698	415	11	1	2017-07-11 10:53:26	\N	\N	\N	\N
4578	557	11	1	2017-07-11 10:54:45	\N	\N	\N	\N
4559	524	11	1	2017-07-11 10:55:01	\N	\N	\N	\N
4699	458	11	1	2017-07-11 10:58:32	\N	\N	\N	\N
4597	162	11	1	2017-07-11 11:04:29	\N	\N	\N	\N
4705	455	11	1	2017-07-11 11:04:16	\N	\N	\N	\N
4709	514	11	1	2017-07-11 11:04:47	\N	\N	\N	\N
4700	452	11	1	2017-07-11 11:07:01	\N	\N	\N	\N
4583	259	11	1	2017-07-11 11:17:45	\N	\N	\N	\N
4702	448	11	1	2017-07-11 11:21:39	\N	\N	\N	\N
4685	234	11	1	2017-07-11 11:25:22	\N	\N	\N	\N
4596	99	11	1	2017-07-11 11:39:35	\N	\N	\N	\N
4692	293	11	1	2017-07-11 11:47:16	\N	\N	\N	\N
4620	269	11	1	2017-07-11 11:50:18	\N	\N	\N	\N
4667	253	11	1	2017-07-11 11:51:14	\N	\N	\N	\N
4598	403	11	1	2017-07-11 12:00:12	\N	\N	\N	\N
4586	54	11	1	2017-07-11 13:28:44	\N	\N	\N	\N
4603	593	11	1	2017-07-11 13:31:58	\N	\N	\N	\N
4561	567	11	1	2017-07-11 13:33:23	\N	\N	\N	\N
4614	154	11	1	2017-07-11 13:35:17	\N	\N	\N	\N
4611	145	11	1	2017-07-11 13:44:49	\N	\N	\N	\N
4674	72	11	1	2017-07-11 13:48:25	\N	\N	\N	\N
4594	310	11	1	2017-07-11 13:55:25	\N	\N	\N	\N
4571	369	11	1	2017-07-11 13:49:35	\N	\N	\N	\N
4688	272	11	1	2017-07-11 13:57:41	\N	\N	\N	\N
4590	249	11	1	2017-07-11 13:57:57	\N	\N	\N	\N
4574	224	11	1	2017-07-11 13:58:13	\N	\N	\N	\N
4562	568	11	1	2017-07-11 13:58:51	\N	\N	\N	\N
4629	327	11	1	2017-07-11 14:07:45	\N	\N	\N	\N
4691	291	11	1	2017-07-11 14:08:38	\N	\N	\N	\N
4573	38	11	1	2017-07-11 14:09:29	\N	\N	\N	\N
4585	666	11	1	2017-07-11 14:14:15	\N	\N	\N	\N
4593	282	11	1	2017-07-11 14:24:05	\N	\N	\N	\N
4581	77	11	1	2017-07-11 14:25:07	\N	\N	\N	\N
4695	287	11	1	2017-07-11 14:28:14	\N	\N	\N	\N
4566	149	11	1	2017-07-11 14:28:39	\N	\N	\N	\N
4682	213	11	1	2017-07-11 14:34:37	\N	\N	\N	\N
4579	391	11	1	2017-07-11 14:35:51	\N	\N	\N	\N
4618	80	11	1	2017-07-11 14:36:13	\N	\N	\N	\N
4678	106	11	1	2017-07-11 14:38:26	\N	\N	\N	\N
4676	168	11	1	2017-07-11 14:45:48	\N	\N	\N	\N
4704	460	11	1	2017-07-11 14:46:19	\N	\N	\N	\N
4580	18	11	1	2017-07-11 14:46:37	\N	\N	\N	\N
4679	156	11	1	2017-07-11 14:49:28	\N	\N	\N	\N
4706	431	11	1	2017-07-11 14:53:17	\N	\N	\N	\N
4707	451	11	1	2017-07-11 14:54:01	\N	\N	\N	\N
4645	607	11	1	2017-07-11 14:54:42	\N	\N	\N	\N
4650	605	11	1	2017-07-11 14:54:57	\N	\N	\N	\N
4607	596	11	1	2017-07-18 16:08:30	\N	\N	\N	\N
4631	601	11	1	2017-07-13 09:58:24	\N	\N	\N	\N
4591	100	11	1	2017-07-11 15:08:31	\N	\N	\N	\N
4658	226	11	1	2017-07-11 15:23:14	\N	\N	\N	\N
4619	237	11	1	2017-07-11 15:30:41	\N	\N	\N	\N
4672	31	11	1	2017-07-11 15:41:56	\N	\N	\N	\N
4690	289	11	1	2017-07-11 15:42:36	\N	\N	\N	\N
4637	465	11	1	2017-07-11 15:49:16	\N	\N	\N	\N
4693	278	11	1	2017-07-11 16:05:16	\N	\N	\N	\N
4673	98	11	1	2017-07-11 16:07:54	\N	\N	\N	\N
4671	1	11	1	2017-07-11 16:17:16	\N	\N	\N	\N
4616	588	11	1	2017-07-11 16:20:33	\N	\N	\N	\N
4654	604	11	1	2017-07-12 09:26:12	\N	\N	\N	\N
4606	587	11	1	2017-07-12 09:26:28	\N	\N	\N	\N
4612	584	11	1	2017-07-12 09:26:48	\N	\N	\N	\N
4595	11	11	1	2017-07-12 09:27:29	\N	\N	\N	\N
4576	35	11	1	2017-07-12 09:34:44	\N	\N	\N	\N
4655	481	11	1	2017-07-12 09:37:30	\N	\N	\N	\N
4600	583	11	1	2017-07-12 09:44:36	\N	\N	\N	\N
4657	620	11	1	2017-07-12 09:44:49	\N	\N	\N	\N
4651	616	11	1	2017-07-12 09:52:34	\N	\N	\N	\N
4642	622	11	1	2017-07-12 09:58:45	\N	\N	\N	\N
4647	532	11	1	2017-07-12 09:58:10	\N	\N	\N	\N
4627	581	11	1	2017-07-12 09:58:52	\N	\N	\N	\N
4636	610	11	1	2017-07-12 10:02:05	\N	\N	\N	\N
4610	594	11	1	2017-07-12 10:02:38	\N	\N	\N	\N
4635	599	11	1	2017-07-12 10:02:13	\N	\N	\N	\N
4641	615	11	1	2017-07-12 10:05:50	\N	\N	\N	\N
4677	166	11	1	2017-07-12 10:10:01	\N	\N	\N	\N
4659	611	11	1	2017-07-12 10:12:15	\N	\N	\N	\N
4665	602	11	1	2017-07-12 10:13:49	\N	\N	\N	\N
4652	376	11	1	2017-07-12 10:18:19	\N	\N	\N	\N
4609	597	11	1	2017-07-12 10:26:44	\N	\N	\N	\N
4589	326	11	1	2017-07-13 14:26:53	\N	\N	\N	\N
4554	308	11	1	2017-07-12 10:59:13	\N	\N	\N	\N
4622	374	11	1	2017-07-12 11:07:29	\N	\N	\N	\N
4553	556	11	1	2017-07-12 11:28:11	\N	\N	\N	\N
4648	506	11	1	2017-07-12 11:28:29	\N	\N	\N	\N
4621	591	11	1	2017-07-12 11:32:49	\N	\N	\N	\N
4708	462	11	1	2017-07-12 11:34:33	\N	\N	\N	\N
4599	590	11	1	2017-07-12 11:49:16	\N	\N	\N	\N
4623	103	11	1	2017-07-12 13:53:52	\N	\N	\N	\N
4653	619	11	1	2017-07-12 14:38:13	\N	\N	\N	\N
4669	651	11	1	2017-07-12 16:31:34	\N	\N	\N	\N
4675	69	11	1	2017-07-13 08:29:08	\N	\N	\N	\N
4556	555	11	1	2017-07-13 09:55:34	\N	\N	\N	\N
4625	582	11	1	2017-07-13 09:58:05	\N	\N	\N	\N
4633	621	11	1	2017-07-25 14:56:05	\N	\N	\N	\N
4565	564	11	1	2017-07-18 15:18:46	\N	\N	\N	\N
4568	525	11	1	2017-07-19 09:24:01	\N	\N	\N	\N
4630	613	11	1	2017-07-18 16:20:15	\N	\N	\N	\N
4584	239	11	1	2017-07-19 09:29:04	\N	\N	\N	\N
4628	585	11	1	2017-07-21 09:15:32	\N	\N	\N	\N
4638	612	11	1	2017-07-25 11:09:55	\N	\N	\N	\N
4643	614	11	1	2017-07-25 11:53:29	\N	\N	\N	\N
4639	608	11	1	2017-07-25 12:10:34	\N	\N	\N	\N
4615	592	11	1	2017-07-25 12:08:05	\N	\N	\N	\N
4617	589	11	1	2017-07-25 13:37:03	\N	\N	\N	\N
4717	543	11	0	\N	\N	\N	\N	\N
4592	523	11	1	2017-07-11 10:44:20	\N	\N	\N	\N
4545	511	11	1	2017-07-11 10:45:07	\N	\N	\N	\N
4526	518	11	1	2017-07-11 10:45:46	\N	\N	\N	\N
4733	435	11	1	2017-07-11 10:46:14	\N	\N	\N	\N
4564	573	11	1	2017-07-11 10:46:44	\N	\N	\N	\N
4488	538	11	1	2017-07-11 10:49:40	\N	\N	\N	\N
4128	12	11	1	2017-07-11 10:51:26	\N	\N	\N	\N
4735	454	11	1	2017-07-11 10:52:31	\N	\N	\N	\N
4557	550	11	1	2017-07-11 10:52:54	\N	\N	\N	\N
4541	517	11	1	2017-07-11 10:53:45	\N	\N	\N	\N
4518	542	11	1	2017-07-11 10:56:14	\N	\N	\N	\N
4713	472	11	1	2017-07-11 10:57:04	\N	\N	\N	\N
4192	87	11	1	2017-07-11 14:59:50	\N	\N	\N	\N
4722	551	11	1	2017-07-11 10:58:09	\N	\N	\N	\N
4534	508	11	1	2017-07-11 10:58:23	\N	\N	\N	\N
4147	33	11	1	2017-07-11 10:58:42	\N	\N	\N	\N
4701	429	11	1	2017-07-11 10:58:50	\N	\N	\N	\N
4430	424	11	1	2017-07-11 11:01:46	\N	\N	\N	\N
4346	317	11	1	2017-07-11 11:03:41	\N	\N	\N	\N
4469	453	11	1	2017-07-11 11:06:22	\N	\N	\N	\N
4738	414	11	1	2017-07-11 11:06:41	\N	\N	\N	\N
4567	554	11	1	2017-07-11 11:07:27	\N	\N	\N	\N
4725	521	11	1	2017-07-11 11:08:43	\N	\N	\N	\N
4726	552	11	1	2017-07-11 11:09:02	\N	\N	\N	\N
4737	500	11	1	2017-07-13 10:33:00	\N	\N	\N	\N
4464	449	11	1	2017-07-11 11:11:35	\N	\N	\N	\N
4721	540	11	1	2017-07-11 11:12:37	\N	\N	\N	\N
4396	353	11	1	2017-07-11 11:13:51	\N	\N	\N	\N
4741	529	11	1	2017-07-11 11:15:29	\N	\N	\N	\N
4723	534	11	1	2017-07-11 11:16:40	\N	\N	\N	\N
4500	473	11	1	2017-07-11 11:17:18	\N	\N	\N	\N
4711	476	11	1	2017-07-11 11:20:28	\N	\N	\N	\N
4468	446	11	1	2017-07-11 11:22:12	\N	\N	\N	\N
4461	438	11	1	2017-07-11 11:26:45	\N	\N	\N	\N
4712	496	11	1	2017-07-11 11:27:08	\N	\N	\N	\N
4495	470	11	1	2017-07-11 11:30:00	\N	\N	\N	\N
4479	442	11	1	2017-07-11 11:32:59	\N	\N	\N	\N
4339	270	11	1	2017-07-11 11:34:07	\N	\N	\N	\N
4220	70	11	1	2017-07-11 11:38:49	\N	\N	\N	\N
4602	246	11	1	2017-07-11 11:39:54	\N	\N	\N	\N
4236	170	11	1	2017-07-11 11:41:38	\N	\N	\N	\N
4390	322	11	1	2017-07-11 11:42:52	\N	\N	\N	\N
4329	250	11	1	2017-07-11 11:48:52	\N	\N	\N	\N
4549	563	11	1	2017-07-11 11:49:08	\N	\N	\N	\N
4175	53	11	1	2017-07-11 11:54:06	\N	\N	\N	\N
4257	157	11	1	2017-07-11 11:55:24	\N	\N	\N	\N
4214	76	11	1	2017-07-11 11:59:13	\N	\N	\N	\N
4310	280	11	1	2017-07-11 12:05:50	\N	\N	\N	\N
4664	650	11	1	2017-07-11 13:28:32	\N	\N	\N	\N
4416	341	11	1	2017-07-11 13:34:48	\N	\N	\N	\N
4211	130	11	1	2017-07-11 13:35:44	\N	\N	\N	\N
4687	274	11	1	2017-07-11 13:36:18	\N	\N	\N	\N
4317	248	11	1	2017-07-11 13:37:59	\N	\N	\N	\N
4153	29	11	1	2017-07-11 13:41:41	\N	\N	\N	\N
4374	332	11	1	2017-07-11 13:43:55	\N	\N	\N	\N
4347	318	11	1	2017-07-11 13:47:49	\N	\N	\N	\N
4729	164	11	1	2017-07-11 13:50:22	\N	\N	\N	\N
4340	283	11	1	2017-07-11 13:51:57	\N	\N	\N	\N
4427	359	11	1	2017-07-11 13:53:54	\N	\N	\N	\N
4208	74	11	1	2017-07-11 13:54:23	\N	\N	\N	\N
4689	305	11	1	2017-07-11 13:56:31	\N	\N	\N	\N
4739	421	11	1	2017-07-11 13:59:32	\N	\N	\N	\N
4734	560	11	1	2017-07-11 14:00:48	\N	\N	\N	\N
4728	123	11	1	2017-07-11 14:01:33	\N	\N	\N	\N
4267	152	11	1	2017-07-11 14:03:14	\N	\N	\N	\N
4681	235	11	1	2017-07-11 14:05:57	\N	\N	\N	\N
4280	178	11	1	2017-07-11 14:07:32	\N	\N	\N	\N
4230	163	11	1	2017-07-11 14:08:53	\N	\N	\N	\N
4714	502	11	1	2017-07-11 14:16:02	\N	\N	\N	\N
4321	219	11	1	2017-07-11 14:19:42	\N	\N	\N	\N
4587	173	11	1	2017-07-11 14:20:41	\N	\N	\N	\N
4141	62	11	1	2017-07-11 14:21:24	\N	\N	\N	\N
4429	406	11	1	2017-07-11 14:25:52	\N	\N	\N	\N
4196	135	11	1	2017-07-11 14:26:30	\N	\N	\N	\N
4129	34	11	1	2017-07-11 14:29:03	\N	\N	\N	\N
4413	361	11	1	2017-07-11 14:30:47	\N	\N	\N	\N
4394	330	11	1	2017-07-11 14:31:06	\N	\N	\N	\N
4560	566	11	1	2017-07-11 14:31:41	\N	\N	\N	\N
4183	59	11	1	2017-07-11 14:33:20	\N	\N	\N	\N
4158	19	11	1	2017-07-11 14:36:43	\N	\N	\N	\N
4263	201	11	1	2017-07-11 14:37:08	\N	\N	\N	\N
4450	392	11	1	2017-07-11 14:39:12	\N	\N	\N	\N
4680	225	11	1	2017-07-11 14:42:23	\N	\N	\N	\N
4231	108	11	1	2017-07-11 14:42:45	\N	\N	\N	\N
4731	358	11	1	2017-07-11 14:46:01	\N	\N	\N	\N
4412	385	11	1	2017-07-11 14:47:24	\N	\N	\N	\N
4291	179	11	1	2017-07-11 14:47:45	\N	\N	\N	\N
4366	349	11	1	2017-07-11 14:49:07	\N	\N	\N	\N
4570	363	11	1	2017-07-11 14:51:19	\N	\N	\N	\N
4190	129	11	1	2017-07-11 14:52:10	\N	\N	\N	\N
4265	209	11	1	2017-07-11 14:56:12	\N	\N	\N	\N
4345	286	11	1	2017-07-11 15:02:37	\N	\N	\N	\N
4696	347	11	1	2017-07-11 15:03:25	\N	\N	\N	\N
4437	398	11	1	2017-07-11 15:06:13	\N	\N	\N	\N
4252	143	11	1	2017-07-11 15:08:18	\N	\N	\N	\N
4304	185	11	1	2017-07-11 15:16:53	\N	\N	\N	\N
4217	125	11	1	2017-07-11 15:22:13	\N	\N	\N	\N
4601	320	11	1	2017-07-11 15:28:32	\N	\N	\N	\N
4402	381	11	1	2017-07-11 15:30:07	\N	\N	\N	\N
4359	292	11	1	2017-07-11 15:32:58	\N	\N	\N	\N
4309	191	11	1	2017-07-11 15:39:24	\N	\N	\N	\N
4624	580	11	1	2017-07-11 15:49:32	\N	\N	\N	\N
4710	512	11	1	2017-07-11 15:50:58	\N	\N	\N	\N
4281	190	11	1	2017-07-11 16:35:23	\N	\N	\N	\N
4649	623	11	1	2017-07-12 09:25:54	\N	\N	\N	\N
4224	104	11	1	2017-07-12 09:28:42	\N	\N	\N	\N
4668	65	11	1	2017-07-12 09:34:26	\N	\N	\N	\N
4523	537	11	1	2017-07-12 09:37:47	\N	\N	\N	\N
4724	495	11	1	2017-07-12 09:40:30	\N	\N	\N	\N
4736	197	11	1	2017-07-12 09:41:07	\N	\N	\N	\N
4718	541	11	1	2017-07-12 09:51:09	\N	\N	\N	\N
4640	618	11	1	2017-07-12 09:52:22	\N	\N	\N	\N
4271	141	11	1	2017-07-12 09:53:32	\N	\N	\N	\N
4417	507	11	1	2017-07-12 09:57:39	\N	\N	\N	\N
4608	586	11	1	2017-07-12 10:00:28	\N	\N	\N	\N
4644	606	11	1	2017-07-12 10:09:04	\N	\N	\N	\N
4255	147	11	1	2017-07-12 10:18:02	\N	\N	\N	\N
4661	624	11	1	2017-07-12 10:20:20	\N	\N	\N	\N
4732	558	11	1	2017-07-12 10:41:27	\N	\N	\N	\N
4205	86	11	1	2017-07-12 11:00:29	\N	\N	\N	\N
4532	562	11	1	2017-07-12 11:03:40	\N	\N	\N	\N
4297	230	11	1	2017-07-12 11:04:29	\N	\N	\N	\N
4605	595	11	1	2017-07-12 11:11:36	\N	\N	\N	\N
4634	609	11	1	2017-07-12 11:37:58	\N	\N	\N	\N
4742	671	11	1	2017-07-12 11:43:42	\N	\N	\N	\N
4536	548	11	1	2017-07-12 11:45:41	\N	\N	\N	\N
4715	490	11	1	2017-07-13 08:27:31	\N	\N	\N	\N
4727	315	11	1	2017-07-13 08:56:46	\N	\N	\N	\N
4730	561	11	1	2017-07-13 09:57:41	\N	\N	\N	\N
4331	281	11	1	2017-07-25 15:07:15	\N	\N	\N	\N
4740	161	11	1	2017-07-25 15:11:42	\N	\N	\N	\N
4365	355	11	1	2017-07-12 11:47:28	\N	\N	\N	\N
4720	516	11	1	2017-07-12 11:56:15	\N	\N	\N	\N
4719	478	11	1	2017-07-12 14:04:33	\N	\N	\N	\N
4344	297	11	1	2017-07-12 14:46:21	\N	\N	\N	\N
4666	652	11	1	2017-07-12 16:32:02	\N	\N	\N	\N
4132	16	11	1	2017-07-13 08:41:19	\N	\N	\N	\N
4210	82	11	1	2017-07-13 09:06:01	\N	\N	\N	\N
4743	672	11	1	2017-07-13 16:16:42	\N	\N	\N	\N
4744	673	11	1	2017-07-13 16:20:35	\N	\N	\N	\N
4745	674	11	1	2017-07-13 16:22:54	\N	\N	\N	\N
4746	675	11	1	2017-07-13 16:26:25	\N	\N	\N	\N
4747	676	11	1	2017-07-13 16:28:41	\N	\N	\N	\N
4840	750	11	1	2017-07-19 09:13:18	\N	\N	\N	\N
4841	751	11	1	2017-07-19 09:15:31	\N	\N	\N	\N
4764	681	11	1	2017-07-17 10:04:11	\N	\N	\N	\N
4765	682	11	1	2017-07-17 10:10:40	\N	\N	\N	\N
4766	683	11	1	2017-07-17 10:16:40	\N	\N	\N	\N
4767	684	11	1	2017-07-17 10:20:36	\N	\N	\N	\N
4768	685	11	1	2017-07-17 10:26:03	\N	\N	\N	\N
4769	686	11	1	2017-07-17 10:32:21	\N	\N	\N	\N
4770	687	11	1	2017-07-17 10:37:29	\N	\N	\N	\N
4771	688	11	1	2017-07-17 10:42:08	\N	\N	\N	\N
4772	689	11	1	2017-07-17 10:49:44	\N	\N	\N	\N
4773	690	11	1	2017-07-17 10:53:06	\N	\N	\N	\N
4774	691	11	1	2017-07-17 10:56:03	\N	\N	\N	\N
4775	692	11	1	2017-07-17 10:59:47	\N	\N	\N	\N
4776	693	11	1	2017-07-17 11:03:06	\N	\N	\N	\N
4777	694	11	1	2017-07-17 11:06:45	\N	\N	\N	\N
4778	695	11	1	2017-07-17 11:12:24	\N	\N	\N	\N
4779	696	11	1	2017-07-17 11:15:40	\N	\N	\N	\N
4780	697	11	1	2017-07-17 11:18:56	\N	\N	\N	\N
4781	698	11	1	2017-07-17 11:21:56	\N	\N	\N	\N
4782	699	11	1	2017-07-17 11:24:33	\N	\N	\N	\N
4783	700	11	1	2017-07-17 11:27:09	\N	\N	\N	\N
4784	701	11	1	2017-07-17 11:30:10	\N	\N	\N	\N
4785	702	11	1	2017-07-17 11:32:42	\N	\N	\N	\N
4786	703	11	1	2017-07-17 11:35:24	\N	\N	\N	\N
4787	704	11	1	2017-07-17 11:38:00	\N	\N	\N	\N
4788	705	11	1	2017-07-17 11:41:08	\N	\N	\N	\N
4789	706	11	1	2017-07-17 11:43:53	\N	\N	\N	\N
4790	707	11	1	2017-07-17 11:48:33	\N	\N	\N	\N
4791	708	11	1	2017-07-17 11:52:26	\N	\N	\N	\N
4792	709	11	1	2017-07-17 11:58:50	\N	\N	\N	\N
4793	710	11	1	2017-07-17 13:45:09	\N	\N	\N	\N
4794	711	11	1	2017-07-17 13:49:42	\N	\N	\N	\N
4813	725	11	1	2017-07-17 15:20:36	\N	\N	\N	\N
4796	712	11	1	2017-07-17 14:30:11	\N	\N	\N	\N
4799	713	11	1	2017-07-17 14:33:52	\N	\N	\N	\N
4800	714	11	1	2017-07-17 14:38:29	\N	\N	\N	\N
4801	715	11	1	2017-07-17 14:42:23	\N	\N	\N	\N
4802	716	11	1	2017-07-17 14:46:01	\N	\N	\N	\N
4803	717	11	1	2017-07-17 14:49:30	\N	\N	\N	\N
4804	718	11	1	2017-07-17 14:52:24	\N	\N	\N	\N
4805	719	11	1	2017-07-17 15:03:45	\N	\N	\N	\N
4808	720	11	1	2017-07-17 15:06:19	\N	\N	\N	\N
4809	721	11	1	2017-07-17 15:08:23	\N	\N	\N	\N
4810	722	11	1	2017-07-17 15:10:32	\N	\N	\N	\N
4811	723	11	1	2017-07-17 15:13:24	\N	\N	\N	\N
4812	724	11	1	2017-07-17 15:16:29	\N	\N	\N	\N
4763	680	11	1	2017-07-17 16:03:21	\N	\N	\N	\N
4465	461	11	1	2017-07-17 16:04:21	\N	\N	\N	\N
4748	678	11	1	2017-07-17 16:04:37	\N	\N	\N	\N
4749	679	11	1	2017-07-17 16:04:57	\N	\N	\N	\N
4716	471	11	1	2017-07-17 16:05:27	\N	\N	\N	\N
4246	111	11	1	2017-07-17 16:05:42	\N	\N	\N	\N
4463	450	11	1	2017-07-18 11:03:47	\N	\N	\N	\N
4815	726	11	1	2017-07-18 13:41:50	\N	\N	\N	\N
4686	275	11	1	2017-07-18 13:43:11	\N	\N	\N	\N
4816	727	11	1	2017-07-18 15:55:49	\N	\N	\N	\N
4818	728	11	1	2017-07-18 15:58:54	\N	\N	\N	\N
4819	729	11	1	2017-07-18 16:01:04	\N	\N	\N	\N
4820	730	11	1	2017-07-18 16:03:46	\N	\N	\N	\N
4821	731	11	1	2017-07-18 16:05:58	\N	\N	\N	\N
4822	732	11	1	2017-07-18 16:07:54	\N	\N	\N	\N
4823	733	11	1	2017-07-18 16:13:30	\N	\N	\N	\N
4824	734	11	1	2017-07-18 16:17:37	\N	\N	\N	\N
4825	735	11	1	2017-07-18 16:20:40	\N	\N	\N	\N
4826	736	11	1	2017-07-18 16:23:10	\N	\N	\N	\N
4828	738	11	1	2017-07-18 16:27:53	\N	\N	\N	\N
4829	739	11	1	2017-07-18 16:30:50	\N	\N	\N	\N
4860	32	12	0	\N	\N	\N	\N	\N
4831	741	11	1	2017-07-18 16:40:23	\N	\N	\N	\N
4832	742	11	1	2017-07-19 08:54:10	\N	\N	\N	\N
4833	743	11	1	2017-07-19 08:56:31	\N	\N	\N	\N
4834	744	11	1	2017-07-19 08:58:20	\N	\N	\N	\N
4835	745	11	1	2017-07-19 09:00:39	\N	\N	\N	\N
4836	746	11	1	2017-07-19 09:02:50	\N	\N	\N	\N
4837	747	11	1	2017-07-19 09:05:01	\N	\N	\N	\N
4838	748	11	1	2017-07-19 09:08:41	\N	\N	\N	\N
4839	749	11	1	2017-07-19 09:10:44	\N	\N	\N	\N
4842	752	11	1	2017-07-19 09:19:28	\N	\N	\N	\N
4843	753	11	1	2017-07-19 09:21:20	\N	\N	\N	\N
4830	740	11	1	2017-07-19 09:21:58	\N	\N	\N	\N
4569	549	11	1	2017-07-19 09:22:27	\N	\N	\N	\N
4844	754	11	1	2017-07-19 10:59:17	\N	\N	\N	\N
4604	598	11	1	2017-07-25 11:55:40	\N	\N	\N	\N
4861	23	12	0	\N	\N	\N	\N	\N
4845	755	11	1	2017-07-25 12:08:37	\N	\N	\N	\N
4846	61	12	0	\N	\N	\N	\N	\N
4847	29	12	0	\N	\N	\N	\N	\N
4848	19	12	0	\N	\N	\N	\N	\N
4849	755	12	0	\N	\N	\N	\N	\N
4850	22	12	0	\N	\N	\N	\N	\N
4851	26	12	0	\N	\N	\N	\N	\N
4852	1	12	0	\N	\N	\N	\N	\N
4853	12	12	0	\N	\N	\N	\N	\N
4854	25	12	0	\N	\N	\N	\N	\N
4855	9	12	0	\N	\N	\N	\N	\N
4856	172	12	0	\N	\N	\N	\N	\N
4857	13	12	0	\N	\N	\N	\N	\N
4858	8	12	0	\N	\N	\N	\N	\N
4859	6	12	0	\N	\N	\N	\N	\N
4862	10	12	0	\N	\N	\N	\N	\N
4863	14	12	0	\N	\N	\N	\N	\N
4864	31	12	0	\N	\N	\N	\N	\N
4865	28	12	0	\N	\N	\N	\N	\N
4866	60	12	0	\N	\N	\N	\N	\N
4867	34	12	0	\N	\N	\N	\N	\N
4868	21	12	0	\N	\N	\N	\N	\N
4869	696	12	0	\N	\N	\N	\N	\N
4870	5	12	0	\N	\N	\N	\N	\N
4871	16	12	0	\N	\N	\N	\N	\N
4872	808	12	0	\N	\N	\N	\N	\N
4873	20	12	0	\N	\N	\N	\N	\N
4874	17	12	0	\N	\N	\N	\N	\N
4875	30	12	0	\N	\N	\N	\N	\N
4876	15	12	0	\N	\N	\N	\N	\N
4877	63	12	0	\N	\N	\N	\N	\N
4878	24	12	0	\N	\N	\N	\N	\N
4879	62	12	0	\N	\N	\N	\N	\N
4880	27	12	0	\N	\N	\N	\N	\N
4881	732	12	0	\N	\N	\N	\N	\N
4882	96	12	0	\N	\N	\N	\N	\N
4883	759	12	0	\N	\N	\N	\N	\N
4884	45	12	0	\N	\N	\N	\N	\N
4885	673	12	0	\N	\N	\N	\N	\N
4886	43	12	0	\N	\N	\N	\N	\N
4887	51	12	0	\N	\N	\N	\N	\N
4888	42	12	0	\N	\N	\N	\N	\N
4889	97	12	0	\N	\N	\N	\N	\N
4890	93	12	0	\N	\N	\N	\N	\N
4891	89	12	0	\N	\N	\N	\N	\N
4892	47	12	0	\N	\N	\N	\N	\N
4893	88	12	0	\N	\N	\N	\N	\N
4894	756	12	0	\N	\N	\N	\N	\N
4895	90	12	0	\N	\N	\N	\N	\N
4896	44	12	0	\N	\N	\N	\N	\N
4897	46	12	0	\N	\N	\N	\N	\N
4898	757	12	0	\N	\N	\N	\N	\N
4899	40	12	0	\N	\N	\N	\N	\N
4900	98	12	0	\N	\N	\N	\N	\N
4901	41	12	0	\N	\N	\N	\N	\N
4902	671	12	0	\N	\N	\N	\N	\N
4903	50	12	0	\N	\N	\N	\N	\N
4904	48	12	0	\N	\N	\N	\N	\N
4905	697	12	0	\N	\N	\N	\N	\N
4906	101	12	0	\N	\N	\N	\N	\N
4907	758	12	0	\N	\N	\N	\N	\N
4908	94	12	0	\N	\N	\N	\N	\N
4909	678	12	0	\N	\N	\N	\N	\N
4910	92	12	0	\N	\N	\N	\N	\N
4911	56	12	0	\N	\N	\N	\N	\N
4912	36	12	0	\N	\N	\N	\N	\N
4913	53	12	0	\N	\N	\N	\N	\N
4914	52	12	0	\N	\N	\N	\N	\N
4915	67	12	0	\N	\N	\N	\N	\N
4916	674	12	0	\N	\N	\N	\N	\N
4917	717	12	0	\N	\N	\N	\N	\N
4918	128	12	0	\N	\N	\N	\N	\N
4919	124	12	0	\N	\N	\N	\N	\N
4920	78	12	0	\N	\N	\N	\N	\N
4921	86	12	0	\N	\N	\N	\N	\N
4922	734	12	0	\N	\N	\N	\N	\N
4923	83	12	0	\N	\N	\N	\N	\N
4924	75	12	0	\N	\N	\N	\N	\N
4925	73	12	0	\N	\N	\N	\N	\N
4926	69	12	0	\N	\N	\N	\N	\N
4927	70	12	0	\N	\N	\N	\N	\N
4928	126	12	0	\N	\N	\N	\N	\N
4929	125	12	0	\N	\N	\N	\N	\N
4930	84	12	0	\N	\N	\N	\N	\N
4931	81	12	0	\N	\N	\N	\N	\N
4932	59	12	0	\N	\N	\N	\N	\N
4933	68	12	0	\N	\N	\N	\N	\N
4934	134	12	0	\N	\N	\N	\N	\N
4935	66	12	0	\N	\N	\N	\N	\N
4936	76	12	0	\N	\N	\N	\N	\N
4937	58	12	0	\N	\N	\N	\N	\N
4938	87	12	0	\N	\N	\N	\N	\N
4939	85	12	0	\N	\N	\N	\N	\N
4940	121	12	0	\N	\N	\N	\N	\N
4941	82	12	0	\N	\N	\N	\N	\N
4942	79	12	0	\N	\N	\N	\N	\N
4943	72	12	0	\N	\N	\N	\N	\N
4944	133	12	0	\N	\N	\N	\N	\N
4945	132	12	0	\N	\N	\N	\N	\N
4946	127	12	0	\N	\N	\N	\N	\N
4947	129	12	0	\N	\N	\N	\N	\N
4948	131	12	0	\N	\N	\N	\N	\N
4949	140	12	0	\N	\N	\N	\N	\N
4950	138	12	0	\N	\N	\N	\N	\N
4951	111	12	0	\N	\N	\N	\N	\N
4952	680	12	0	\N	\N	\N	\N	\N
4953	165	12	0	\N	\N	\N	\N	\N
4954	116	12	0	\N	\N	\N	\N	\N
4955	107	12	0	\N	\N	\N	\N	\N
4956	136	12	0	\N	\N	\N	\N	\N
4957	159	12	0	\N	\N	\N	\N	\N
4958	117	12	0	\N	\N	\N	\N	\N
4959	108	12	0	\N	\N	\N	\N	\N
4960	106	12	0	\N	\N	\N	\N	\N
4961	112	12	0	\N	\N	\N	\N	\N
4962	102	12	0	\N	\N	\N	\N	\N
4963	169	12	0	\N	\N	\N	\N	\N
4964	160	12	0	\N	\N	\N	\N	\N
4965	119	12	0	\N	\N	\N	\N	\N
4966	104	12	0	\N	\N	\N	\N	\N
4967	118	12	0	\N	\N	\N	\N	\N
4968	109	12	0	\N	\N	\N	\N	\N
4969	115	12	0	\N	\N	\N	\N	\N
4970	699	12	0	\N	\N	\N	\N	\N
4971	139	12	0	\N	\N	\N	\N	\N
4972	105	12	0	\N	\N	\N	\N	\N
4973	114	12	0	\N	\N	\N	\N	\N
4974	170	12	0	\N	\N	\N	\N	\N
4975	110	12	0	\N	\N	\N	\N	\N
4976	120	12	0	\N	\N	\N	\N	\N
4977	754	12	0	\N	\N	\N	\N	\N
4978	760	12	0	\N	\N	\N	\N	\N
4979	168	12	0	\N	\N	\N	\N	\N
4980	167	12	0	\N	\N	\N	\N	\N
4981	166	12	0	\N	\N	\N	\N	\N
4982	147	12	0	\N	\N	\N	\N	\N
4983	175	12	0	\N	\N	\N	\N	\N
4984	158	12	0	\N	\N	\N	\N	\N
4985	153	12	0	\N	\N	\N	\N	\N
4986	156	12	0	\N	\N	\N	\N	\N
4987	681	12	0	\N	\N	\N	\N	\N
4988	196	12	0	\N	\N	\N	\N	\N
4989	676	12	0	\N	\N	\N	\N	\N
4990	155	12	0	\N	\N	\N	\N	\N
4991	199	12	0	\N	\N	\N	\N	\N
4992	700	12	0	\N	\N	\N	\N	\N
4993	151	12	0	\N	\N	\N	\N	\N
4994	152	12	0	\N	\N	\N	\N	\N
4995	49	12	0	\N	\N	\N	\N	\N
4996	146	12	0	\N	\N	\N	\N	\N
4997	148	12	0	\N	\N	\N	\N	\N
4998	144	12	0	\N	\N	\N	\N	\N
4999	143	12	0	\N	\N	\N	\N	\N
5000	202	12	0	\N	\N	\N	\N	\N
5001	142	12	0	\N	\N	\N	\N	\N
5002	157	12	0	\N	\N	\N	\N	\N
5003	141	12	0	\N	\N	\N	\N	\N
5004	198	12	0	\N	\N	\N	\N	\N
5005	178	12	0	\N	\N	\N	\N	\N
5006	763	12	0	\N	\N	\N	\N	\N
5007	208	12	0	\N	\N	\N	\N	\N
5008	207	12	0	\N	\N	\N	\N	\N
5009	174	12	0	\N	\N	\N	\N	\N
5010	205	12	0	\N	\N	\N	\N	\N
5011	203	12	0	\N	\N	\N	\N	\N
5012	201	12	0	\N	\N	\N	\N	\N
5013	204	12	0	\N	\N	\N	\N	\N
5014	215	12	0	\N	\N	\N	\N	\N
5015	656	12	0	\N	\N	\N	\N	\N
5016	655	12	0	\N	\N	\N	\N	\N
5017	214	12	0	\N	\N	\N	\N	\N
5018	183	12	0	\N	\N	\N	\N	\N
5019	186	12	0	\N	\N	\N	\N	\N
5020	217	12	0	\N	\N	\N	\N	\N
5021	234	12	0	\N	\N	\N	\N	\N
5022	222	12	0	\N	\N	\N	\N	\N
5023	181	12	0	\N	\N	\N	\N	\N
5024	193	12	0	\N	\N	\N	\N	\N
5025	213	12	0	\N	\N	\N	\N	\N
5026	216	12	0	\N	\N	\N	\N	\N
5027	195	12	0	\N	\N	\N	\N	\N
5028	184	12	0	\N	\N	\N	\N	\N
5029	182	12	0	\N	\N	\N	\N	\N
5030	190	12	0	\N	\N	\N	\N	\N
5031	180	12	0	\N	\N	\N	\N	\N
5032	188	12	0	\N	\N	\N	\N	\N
5033	192	12	0	\N	\N	\N	\N	\N
5034	230	12	0	\N	\N	\N	\N	\N
5035	194	12	0	\N	\N	\N	\N	\N
5036	737	12	0	\N	\N	\N	\N	\N
5037	231	12	0	\N	\N	\N	\N	\N
5038	191	12	0	\N	\N	\N	\N	\N
5039	809	12	0	\N	\N	\N	\N	\N
5040	185	12	0	\N	\N	\N	\N	\N
5041	179	12	0	\N	\N	\N	\N	\N
5042	218	12	0	\N	\N	\N	\N	\N
5043	682	12	0	\N	\N	\N	\N	\N
5044	225	12	0	\N	\N	\N	\N	\N
5045	701	12	0	\N	\N	\N	\N	\N
5046	263	12	0	\N	\N	\N	\N	\N
5047	254	12	0	\N	\N	\N	\N	\N
5048	244	12	0	\N	\N	\N	\N	\N
5049	236	12	0	\N	\N	\N	\N	\N
5050	33	12	0	\N	\N	\N	\N	\N
5051	268	12	0	\N	\N	\N	\N	\N
5052	683	12	0	\N	\N	\N	\N	\N
5053	738	12	0	\N	\N	\N	\N	\N
5054	241	12	0	\N	\N	\N	\N	\N
5055	219	12	0	\N	\N	\N	\N	\N
5056	248	12	0	\N	\N	\N	\N	\N
5057	228	12	0	\N	\N	\N	\N	\N
5058	272	12	0	\N	\N	\N	\N	\N
5059	247	12	0	\N	\N	\N	\N	\N
5060	356	12	0	\N	\N	\N	\N	\N
5061	245	12	0	\N	\N	\N	\N	\N
5062	256	12	0	\N	\N	\N	\N	\N
5063	252	12	0	\N	\N	\N	\N	\N
5064	242	12	0	\N	\N	\N	\N	\N
5065	280	12	0	\N	\N	\N	\N	\N
5066	238	12	0	\N	\N	\N	\N	\N
5067	39	12	0	\N	\N	\N	\N	\N
5068	267	12	0	\N	\N	\N	\N	\N
5069	702	12	0	\N	\N	\N	\N	\N
5070	270	12	0	\N	\N	\N	\N	\N
5071	266	12	0	\N	\N	\N	\N	\N
5072	279	12	0	\N	\N	\N	\N	\N
5073	271	12	0	\N	\N	\N	\N	\N
5074	250	12	0	\N	\N	\N	\N	\N
5075	220	12	0	\N	\N	\N	\N	\N
5076	277	12	0	\N	\N	\N	\N	\N
5077	765	12	0	\N	\N	\N	\N	\N
5078	274	12	0	\N	\N	\N	\N	\N
5079	273	12	0	\N	\N	\N	\N	\N
5080	317	12	0	\N	\N	\N	\N	\N
5081	309	12	0	\N	\N	\N	\N	\N
5082	287	12	0	\N	\N	\N	\N	\N
5083	739	12	0	\N	\N	\N	\N	\N
5084	291	12	0	\N	\N	\N	\N	\N
5085	703	12	0	\N	\N	\N	\N	\N
5086	289	12	0	\N	\N	\N	\N	\N
5087	721	12	0	\N	\N	\N	\N	\N
5088	257	12	0	\N	\N	\N	\N	\N
5089	305	12	0	\N	\N	\N	\N	\N
5090	293	12	0	\N	\N	\N	\N	\N
5091	262	12	0	\N	\N	\N	\N	\N
5092	283	12	0	\N	\N	\N	\N	\N
5093	288	12	0	\N	\N	\N	\N	\N
5094	307	12	0	\N	\N	\N	\N	\N
5095	278	12	0	\N	\N	\N	\N	\N
5096	255	12	0	\N	\N	\N	\N	\N
5097	286	12	0	\N	\N	\N	\N	\N
5098	297	12	0	\N	\N	\N	\N	\N
5099	295	12	0	\N	\N	\N	\N	\N
5100	292	12	0	\N	\N	\N	\N	\N
5101	285	12	0	\N	\N	\N	\N	\N
5102	251	12	0	\N	\N	\N	\N	\N
5103	319	12	0	\N	\N	\N	\N	\N
5104	316	12	0	\N	\N	\N	\N	\N
5105	314	12	0	\N	\N	\N	\N	\N
5106	306	12	0	\N	\N	\N	\N	\N
5107	298	12	0	\N	\N	\N	\N	\N
5108	332	12	0	\N	\N	\N	\N	\N
5109	301	12	0	\N	\N	\N	\N	\N
5110	355	12	0	\N	\N	\N	\N	\N
5111	321	12	0	\N	\N	\N	\N	\N
5112	345	12	0	\N	\N	\N	\N	\N
5113	338	12	0	\N	\N	\N	\N	\N
5114	685	12	0	\N	\N	\N	\N	\N
5115	333	12	0	\N	\N	\N	\N	\N
5116	350	12	0	\N	\N	\N	\N	\N
5117	302	12	0	\N	\N	\N	\N	\N
5118	347	12	0	\N	\N	\N	\N	\N
5119	353	12	0	\N	\N	\N	\N	\N
5120	299	12	0	\N	\N	\N	\N	\N
5121	352	12	0	\N	\N	\N	\N	\N
5122	346	12	0	\N	\N	\N	\N	\N
5123	300	12	0	\N	\N	\N	\N	\N
5124	344	12	0	\N	\N	\N	\N	\N
5125	329	12	0	\N	\N	\N	\N	\N
5126	328	12	0	\N	\N	\N	\N	\N
5127	354	12	0	\N	\N	\N	\N	\N
5128	343	12	0	\N	\N	\N	\N	\N
5129	330	12	0	\N	\N	\N	\N	\N
5130	18	12	0	\N	\N	\N	\N	\N
5131	740	12	0	\N	\N	\N	\N	\N
5132	322	12	0	\N	\N	\N	\N	\N
5133	351	12	0	\N	\N	\N	\N	\N
5134	336	12	0	\N	\N	\N	\N	\N
5135	348	12	0	\N	\N	\N	\N	\N
5136	334	12	0	\N	\N	\N	\N	\N
5137	313	12	0	\N	\N	\N	\N	\N
5138	325	12	0	\N	\N	\N	\N	\N
5139	337	12	0	\N	\N	\N	\N	\N
5140	390	12	0	\N	\N	\N	\N	\N
5141	366	12	0	\N	\N	\N	\N	\N
5142	361	12	0	\N	\N	\N	\N	\N
5143	770	12	0	\N	\N	\N	\N	\N
5144	360	12	0	\N	\N	\N	\N	\N
5145	386	12	0	\N	\N	\N	\N	\N
5146	384	12	0	\N	\N	\N	\N	\N
5147	378	12	0	\N	\N	\N	\N	\N
5148	375	12	0	\N	\N	\N	\N	\N
5149	340	12	0	\N	\N	\N	\N	\N
5150	382	12	0	\N	\N	\N	\N	\N
5151	741	12	0	\N	\N	\N	\N	\N
5152	370	12	0	\N	\N	\N	\N	\N
5153	381	12	0	\N	\N	\N	\N	\N
5154	365	12	0	\N	\N	\N	\N	\N
5155	686	12	0	\N	\N	\N	\N	\N
5156	368	12	0	\N	\N	\N	\N	\N
5157	705	12	0	\N	\N	\N	\N	\N
5158	7	12	0	\N	\N	\N	\N	\N
5159	379	12	0	\N	\N	\N	\N	\N
5160	373	12	0	\N	\N	\N	\N	\N
5161	11	12	0	\N	\N	\N	\N	\N
5162	362	12	0	\N	\N	\N	\N	\N
5163	364	12	0	\N	\N	\N	\N	\N
5164	359	12	0	\N	\N	\N	\N	\N
5165	377	12	0	\N	\N	\N	\N	\N
5166	371	12	0	\N	\N	\N	\N	\N
5167	768	12	0	\N	\N	\N	\N	\N
5168	385	12	0	\N	\N	\N	\N	\N
5169	722	12	0	\N	\N	\N	\N	\N
5170	389	12	0	\N	\N	\N	\N	\N
5171	388	12	0	\N	\N	\N	\N	\N
5172	404	12	0	\N	\N	\N	\N	\N
5173	419	12	0	\N	\N	\N	\N	\N
5174	415	12	0	\N	\N	\N	\N	\N
5175	416	12	0	\N	\N	\N	\N	\N
5176	398	12	0	\N	\N	\N	\N	\N
5177	706	12	0	\N	\N	\N	\N	\N
5178	392	12	0	\N	\N	\N	\N	\N
5179	687	12	0	\N	\N	\N	\N	\N
5180	742	12	0	\N	\N	\N	\N	\N
5181	406	12	0	\N	\N	\N	\N	\N
5182	400	12	0	\N	\N	\N	\N	\N
5183	395	12	0	\N	\N	\N	\N	\N
5184	723	12	0	\N	\N	\N	\N	\N
5185	423	12	0	\N	\N	\N	\N	\N
5186	323	12	0	\N	\N	\N	\N	\N
5187	408	12	0	\N	\N	\N	\N	\N
5188	2	12	0	\N	\N	\N	\N	\N
5189	407	12	0	\N	\N	\N	\N	\N
5190	777	12	0	\N	\N	\N	\N	\N
5191	424	12	0	\N	\N	\N	\N	\N
5192	409	12	0	\N	\N	\N	\N	\N
5193	422	12	0	\N	\N	\N	\N	\N
5194	399	12	0	\N	\N	\N	\N	\N
5195	775	12	0	\N	\N	\N	\N	\N
5196	402	12	0	\N	\N	\N	\N	\N
5197	394	12	0	\N	\N	\N	\N	\N
5198	401	12	0	\N	\N	\N	\N	\N
5199	393	12	0	\N	\N	\N	\N	\N
5200	420	12	0	\N	\N	\N	\N	\N
5201	772	12	0	\N	\N	\N	\N	\N
5202	397	12	0	\N	\N	\N	\N	\N
5203	773	12	0	\N	\N	\N	\N	\N
5204	774	12	0	\N	\N	\N	\N	\N
5205	413	12	0	\N	\N	\N	\N	\N
5206	776	12	0	\N	\N	\N	\N	\N
5207	412	12	0	\N	\N	\N	\N	\N
5208	410	12	0	\N	\N	\N	\N	\N
5209	445	12	0	\N	\N	\N	\N	\N
5210	434	12	0	\N	\N	\N	\N	\N
5211	462	12	0	\N	\N	\N	\N	\N
5212	432	12	0	\N	\N	\N	\N	\N
5213	318	12	0	\N	\N	\N	\N	\N
5214	491	12	0	\N	\N	\N	\N	\N
5215	441	12	0	\N	\N	\N	\N	\N
5216	707	12	0	\N	\N	\N	\N	\N
5217	449	12	0	\N	\N	\N	\N	\N
5218	460	12	0	\N	\N	\N	\N	\N
5219	504	12	0	\N	\N	\N	\N	\N
5220	450	12	0	\N	\N	\N	\N	\N
5221	444	12	0	\N	\N	\N	\N	\N
5222	440	12	0	\N	\N	\N	\N	\N
5223	457	12	0	\N	\N	\N	\N	\N
5224	433	12	0	\N	\N	\N	\N	\N
5225	452	12	0	\N	\N	\N	\N	\N
5226	431	12	0	\N	\N	\N	\N	\N
5227	447	12	0	\N	\N	\N	\N	\N
5228	688	12	0	\N	\N	\N	\N	\N
5229	429	12	0	\N	\N	\N	\N	\N
5230	428	12	0	\N	\N	\N	\N	\N
5231	778	12	0	\N	\N	\N	\N	\N
5232	453	12	0	\N	\N	\N	\N	\N
5233	451	12	0	\N	\N	\N	\N	\N
5234	443	12	0	\N	\N	\N	\N	\N
5235	779	12	0	\N	\N	\N	\N	\N
5236	430	12	0	\N	\N	\N	\N	\N
5237	781	12	0	\N	\N	\N	\N	\N
5238	724	12	0	\N	\N	\N	\N	\N
5239	464	12	0	\N	\N	\N	\N	\N
5240	438	12	0	\N	\N	\N	\N	\N
5241	436	12	0	\N	\N	\N	\N	\N
5242	780	12	0	\N	\N	\N	\N	\N
5243	461	12	0	\N	\N	\N	\N	\N
5244	459	12	0	\N	\N	\N	\N	\N
5245	455	12	0	\N	\N	\N	\N	\N
5246	472	12	0	\N	\N	\N	\N	\N
5247	538	12	0	\N	\N	\N	\N	\N
5248	494	12	0	\N	\N	\N	\N	\N
5249	533	12	0	\N	\N	\N	\N	\N
5250	493	12	0	\N	\N	\N	\N	\N
5251	426	12	0	\N	\N	\N	\N	\N
5252	476	12	0	\N	\N	\N	\N	\N
5253	725	12	0	\N	\N	\N	\N	\N
5254	503	12	0	\N	\N	\N	\N	\N
5255	501	12	0	\N	\N	\N	\N	\N
5256	484	12	0	\N	\N	\N	\N	\N
5257	498	12	0	\N	\N	\N	\N	\N
5258	489	12	0	\N	\N	\N	\N	\N
5259	505	12	0	\N	\N	\N	\N	\N
5260	744	12	0	\N	\N	\N	\N	\N
5261	488	12	0	\N	\N	\N	\N	\N
5262	483	12	0	\N	\N	\N	\N	\N
5263	502	12	0	\N	\N	\N	\N	\N
5264	496	12	0	\N	\N	\N	\N	\N
5265	487	12	0	\N	\N	\N	\N	\N
5266	514	12	0	\N	\N	\N	\N	\N
5267	708	12	0	\N	\N	\N	\N	\N
5268	492	12	0	\N	\N	\N	\N	\N
5269	486	12	0	\N	\N	\N	\N	\N
5270	512	12	0	\N	\N	\N	\N	\N
5271	469	12	0	\N	\N	\N	\N	\N
5272	477	12	0	\N	\N	\N	\N	\N
5273	485	12	0	\N	\N	\N	\N	\N
5274	467	12	0	\N	\N	\N	\N	\N
5275	482	12	0	\N	\N	\N	\N	\N
5276	782	12	0	\N	\N	\N	\N	\N
5277	474	12	0	\N	\N	\N	\N	\N
5278	499	12	0	\N	\N	\N	\N	\N
5279	783	12	0	\N	\N	\N	\N	\N
5280	473	12	0	\N	\N	\N	\N	\N
5281	470	12	0	\N	\N	\N	\N	\N
5282	520	12	0	\N	\N	\N	\N	\N
5283	531	12	0	\N	\N	\N	\N	\N
5284	510	12	0	\N	\N	\N	\N	\N
5285	690	12	0	\N	\N	\N	\N	\N
5286	508	12	0	\N	\N	\N	\N	\N
5287	528	12	0	\N	\N	\N	\N	\N
5288	548	12	0	\N	\N	\N	\N	\N
5289	537	12	0	\N	\N	\N	\N	\N
5290	530	12	0	\N	\N	\N	\N	\N
5291	709	12	0	\N	\N	\N	\N	\N
5292	509	12	0	\N	\N	\N	\N	\N
5293	542	12	0	\N	\N	\N	\N	\N
5294	527	12	0	\N	\N	\N	\N	\N
5295	535	12	0	\N	\N	\N	\N	\N
5296	539	12	0	\N	\N	\N	\N	\N
5297	526	12	0	\N	\N	\N	\N	\N
5298	578	12	0	\N	\N	\N	\N	\N
5299	342	12	0	\N	\N	\N	\N	\N
5300	515	12	0	\N	\N	\N	\N	\N
5301	543	12	0	\N	\N	\N	\N	\N
5302	534	12	0	\N	\N	\N	\N	\N
5303	562	12	0	\N	\N	\N	\N	\N
5304	545	12	0	\N	\N	\N	\N	\N
5305	547	12	0	\N	\N	\N	\N	\N
5306	540	12	0	\N	\N	\N	\N	\N
5307	787	12	0	\N	\N	\N	\N	\N
5308	536	12	0	\N	\N	\N	\N	\N
5309	511	12	0	\N	\N	\N	\N	\N
5310	788	12	0	\N	\N	\N	\N	\N
5311	575	12	0	\N	\N	\N	\N	\N
5312	522	12	0	\N	\N	\N	\N	\N
5313	518	12	0	\N	\N	\N	\N	\N
5314	519	12	0	\N	\N	\N	\N	\N
5315	516	12	0	\N	\N	\N	\N	\N
5316	546	12	0	\N	\N	\N	\N	\N
5317	786	12	0	\N	\N	\N	\N	\N
5318	559	12	0	\N	\N	\N	\N	\N
5319	517	12	0	\N	\N	\N	\N	\N
5320	745	12	0	\N	\N	\N	\N	\N
5321	811	12	0	\N	\N	\N	\N	\N
5322	791	12	0	\N	\N	\N	\N	\N
5323	550	12	0	\N	\N	\N	\N	\N
5325	564	12	0	\N	\N	\N	\N	\N
5326	549	12	0	\N	\N	\N	\N	\N
5327	570	12	0	\N	\N	\N	\N	\N
5328	524	12	0	\N	\N	\N	\N	\N
5329	565	12	0	\N	\N	\N	\N	\N
5330	746	12	0	\N	\N	\N	\N	\N
5331	810	12	0	\N	\N	\N	\N	\N
5332	554	12	0	\N	\N	\N	\N	\N
5333	574	12	0	\N	\N	\N	\N	\N
5334	552	12	0	\N	\N	\N	\N	\N
5335	315	12	0	\N	\N	\N	\N	\N
5336	691	12	0	\N	\N	\N	\N	\N
5337	521	12	0	\N	\N	\N	\N	\N
5338	123	12	0	\N	\N	\N	\N	\N
5339	525	12	0	\N	\N	\N	\N	\N
5340	710	12	0	\N	\N	\N	\N	\N
5341	571	12	0	\N	\N	\N	\N	\N
5342	3	12	0	\N	\N	\N	\N	\N
5343	576	12	0	\N	\N	\N	\N	\N
5344	425	12	0	\N	\N	\N	\N	\N
5345	573	12	0	\N	\N	\N	\N	\N
5346	358	12	0	\N	\N	\N	\N	\N
5347	435	12	0	\N	\N	\N	\N	\N
5348	495	12	0	\N	\N	\N	\N	\N
5349	560	12	0	\N	\N	\N	\N	\N
5350	568	12	0	\N	\N	\N	\N	\N
5351	556	12	0	\N	\N	\N	\N	\N
5352	164	12	0	\N	\N	\N	\N	\N
5353	727	12	0	\N	\N	\N	\N	\N
5354	789	12	0	\N	\N	\N	\N	\N
5355	672	12	0	\N	\N	\N	\N	\N
5356	790	12	0	\N	\N	\N	\N	\N
5357	567	12	0	\N	\N	\N	\N	\N
5358	555	12	0	\N	\N	\N	\N	\N
5359	260	12	0	\N	\N	\N	\N	\N
5360	35	12	0	\N	\N	\N	\N	\N
5361	54	12	0	\N	\N	\N	\N	\N
5362	391	12	0	\N	\N	\N	\N	\N
5363	211	12	0	\N	\N	\N	\N	\N
5364	523	12	0	\N	\N	\N	\N	\N
5365	666	12	0	\N	\N	\N	\N	\N
5366	692	12	0	\N	\N	\N	\N	\N
5367	173	12	0	\N	\N	\N	\N	\N
5368	667	12	0	\N	\N	\N	\N	\N
5369	239	12	0	\N	\N	\N	\N	\N
5370	38	12	0	\N	\N	\N	\N	\N
5371	310	12	0	\N	\N	\N	\N	\N
5372	77	12	0	\N	\N	\N	\N	\N
5373	99	12	0	\N	\N	\N	\N	\N
5374	557	12	0	\N	\N	\N	\N	\N
5375	249	12	0	\N	\N	\N	\N	\N
5376	500	12	0	\N	\N	\N	\N	\N
5377	747	12	0	\N	\N	\N	\N	\N
5378	414	12	0	\N	\N	\N	\N	\N
5379	224	12	0	\N	\N	\N	\N	\N
5380	369	12	0	\N	\N	\N	\N	\N
5381	456	12	0	\N	\N	\N	\N	\N
5382	728	12	0	\N	\N	\N	\N	\N
5383	197	12	0	\N	\N	\N	\N	\N
5384	363	12	0	\N	\N	\N	\N	\N
5385	326	12	0	\N	\N	\N	\N	\N
5386	792	12	0	\N	\N	\N	\N	\N
5387	711	12	0	\N	\N	\N	\N	\N
5388	80	12	0	\N	\N	\N	\N	\N
5389	594	12	0	\N	\N	\N	\N	\N
5390	320	12	0	\N	\N	\N	\N	\N
5391	592	12	0	\N	\N	\N	\N	\N
5392	796	12	0	\N	\N	\N	\N	\N
5393	269	12	0	\N	\N	\N	\N	\N
5394	246	12	0	\N	\N	\N	\N	\N
5395	693	12	0	\N	\N	\N	\N	\N
5396	590	12	0	\N	\N	\N	\N	\N
5397	712	12	0	\N	\N	\N	\N	\N
5398	311	12	0	\N	\N	\N	\N	\N
5399	795	12	0	\N	\N	\N	\N	\N
5400	588	12	0	\N	\N	\N	\N	\N
5401	154	12	0	\N	\N	\N	\N	\N
5402	593	12	0	\N	\N	\N	\N	\N
5403	583	12	0	\N	\N	\N	\N	\N
5404	797	12	0	\N	\N	\N	\N	\N
5405	748	12	0	\N	\N	\N	\N	\N
5406	729	12	0	\N	\N	\N	\N	\N
5407	580	12	0	\N	\N	\N	\N	\N
5408	591	12	0	\N	\N	\N	\N	\N
5409	589	12	0	\N	\N	\N	\N	\N
5410	237	12	0	\N	\N	\N	\N	\N
5411	162	12	0	\N	\N	\N	\N	\N
5412	597	12	0	\N	\N	\N	\N	\N
5413	145	12	0	\N	\N	\N	\N	\N
5414	210	12	0	\N	\N	\N	\N	\N
5415	586	12	0	\N	\N	\N	\N	\N
5416	793	12	0	\N	\N	\N	\N	\N
5417	598	12	0	\N	\N	\N	\N	\N
5418	794	12	0	\N	\N	\N	\N	\N
5419	582	12	0	\N	\N	\N	\N	\N
5420	581	12	0	\N	\N	\N	\N	\N
5421	584	12	0	\N	\N	\N	\N	\N
5422	595	12	0	\N	\N	\N	\N	\N
5423	799	12	0	\N	\N	\N	\N	\N
5424	621	12	0	\N	\N	\N	\N	\N
5425	617	12	0	\N	\N	\N	\N	\N
5426	614	12	0	\N	\N	\N	\N	\N
5427	606	12	0	\N	\N	\N	\N	\N
5428	465	12	0	\N	\N	\N	\N	\N
5429	694	12	0	\N	\N	\N	\N	\N
5430	600	12	0	\N	\N	\N	\N	\N
5431	605	12	0	\N	\N	\N	\N	\N
5432	611	12	0	\N	\N	\N	\N	\N
5433	607	12	0	\N	\N	\N	\N	\N
5434	427	12	0	\N	\N	\N	\N	\N
5435	802	12	0	\N	\N	\N	\N	\N
5436	624	12	0	\N	\N	\N	\N	\N
5437	610	12	0	\N	\N	\N	\N	\N
5438	616	12	0	\N	\N	\N	\N	\N
5439	713	12	0	\N	\N	\N	\N	\N
5440	421	12	0	\N	\N	\N	\N	\N
5441	800	12	0	\N	\N	\N	\N	\N
5442	529	12	0	\N	\N	\N	\N	\N
5443	801	12	0	\N	\N	\N	\N	\N
5444	615	12	0	\N	\N	\N	\N	\N
5445	608	12	0	\N	\N	\N	\N	\N
5446	226	12	0	\N	\N	\N	\N	\N
5447	532	12	0	\N	\N	\N	\N	\N
5448	603	12	0	\N	\N	\N	\N	\N
5449	599	12	0	\N	\N	\N	\N	\N
5450	604	12	0	\N	\N	\N	\N	\N
5451	730	12	0	\N	\N	\N	\N	\N
5452	749	12	0	\N	\N	\N	\N	\N
5453	613	12	0	\N	\N	\N	\N	\N
5454	609	12	0	\N	\N	\N	\N	\N
5455	798	12	0	\N	\N	\N	\N	\N
5456	620	12	0	\N	\N	\N	\N	\N
5457	618	12	0	\N	\N	\N	\N	\N
5458	601	12	0	\N	\N	\N	\N	\N
5459	622	12	0	\N	\N	\N	\N	\N
5460	651	12	0	\N	\N	\N	\N	\N
5461	653	12	0	\N	\N	\N	\N	\N
5462	807	12	0	\N	\N	\N	\N	\N
5463	652	12	0	\N	\N	\N	\N	\N
5464	650	12	0	\N	\N	\N	\N	\N
5465	646	12	0	\N	\N	\N	\N	\N
5466	803	12	0	\N	\N	\N	\N	\N
5467	806	12	0	\N	\N	\N	\N	\N
5468	804	12	0	\N	\N	\N	\N	\N
5469	805	12	0	\N	\N	\N	\N	\N
5470	308	12	0	\N	\N	\N	\N	\N
5471	750	12	0	\N	\N	\N	\N	\N
5472	695	12	0	\N	\N	\N	\N	\N
5473	731	12	0	\N	\N	\N	\N	\N
5474	4	12	0	\N	\N	\N	\N	\N
5475	480	12	0	\N	\N	\N	\N	\N
5476	824	12	0	\N	\N	\N	\N	\N
5477	478	12	0	\N	\N	\N	\N	\N
5478	816	12	0	\N	\N	\N	\N	\N
5479	817	12	0	\N	\N	\N	\N	\N
5480	818	12	0	\N	\N	\N	\N	\N
5481	819	12	0	\N	\N	\N	\N	\N
5482	820	12	0	\N	\N	\N	\N	\N
5483	821	12	0	\N	\N	\N	\N	\N
5484	822	12	0	\N	\N	\N	\N	\N
5485	823	12	0	\N	\N	\N	\N	\N
5486	825	12	0	\N	\N	\N	\N	\N
5487	826	12	0	\N	\N	\N	\N	\N
5488	827	12	0	\N	\N	\N	\N	\N
5489	828	12	0	\N	\N	\N	\N	\N
5490	829	12	0	\N	\N	\N	\N	\N
5491	830	12	0	\N	\N	\N	\N	\N
5492	831	12	0	\N	\N	\N	\N	\N
5493	832	12	0	\N	\N	\N	\N	\N
5494	833	12	0	\N	\N	\N	\N	\N
5495	602	12	0	\N	\N	\N	\N	\N
5496	834	12	0	\N	\N	\N	\N	\N
5497	835	12	0	\N	\N	\N	\N	\N
5498	619	12	0	\N	\N	\N	\N	\N
5499	836	12	0	\N	\N	\N	\N	\N
5500	837	12	0	\N	\N	\N	\N	\N
5501	838	12	0	\N	\N	\N	\N	\N
5502	839	12	0	\N	\N	\N	\N	\N
5503	753	12	0	\N	\N	\N	\N	\N
5504	623	12	0	\N	\N	\N	\N	\N
5505	585	12	0	\N	\N	\N	\N	\N
5506	572	12	0	\N	\N	\N	\N	\N
5507	596	12	0	\N	\N	\N	\N	\N
5508	752	12	0	\N	\N	\N	\N	\N
5509	751	12	0	\N	\N	\N	\N	\N
5510	417	12	0	\N	\N	\N	\N	\N
5511	840	12	0	\N	\N	\N	\N	\N
5512	841	12	0	\N	\N	\N	\N	\N
5513	566	12	0	\N	\N	\N	\N	\N
5514	561	12	0	\N	\N	\N	\N	\N
5515	481	12	0	\N	\N	\N	\N	\N
5516	813	12	0	\N	\N	\N	\N	\N
5517	814	12	0	\N	\N	\N	\N	\N
5518	815	12	0	\N	\N	\N	\N	\N
5519	718	12	0	\N	\N	\N	\N	\N
5520	558	12	0	\N	\N	\N	\N	\N
5521	846	12	0	\N	\N	\N	\N	\N
5522	720	12	0	\N	\N	\N	\N	\N
5523	294	12	0	\N	\N	\N	\N	\N
5524	612	12	0	\N	\N	\N	\N	\N
5525	847	12	0	\N	\N	\N	\N	\N
5526	411	12	0	\N	\N	\N	\N	\N
5527	475	12	0	\N	\N	\N	\N	\N
5528	719	12	0	\N	\N	\N	\N	\N
5529	848	12	0	\N	\N	\N	\N	\N
5530	405	12	0	\N	\N	\N	\N	\N
5531	290	12	0	\N	\N	\N	\N	\N
5532	357	12	0	\N	\N	\N	\N	\N
5533	403	12	0	\N	\N	\N	\N	\N
5534	849	12	0	\N	\N	\N	\N	\N
5535	716	12	0	\N	\N	\N	\N	\N
5536	850	12	0	\N	\N	\N	\N	\N
5537	851	12	0	\N	\N	\N	\N	\N
5538	282	12	0	\N	\N	\N	\N	\N
5539	715	12	0	\N	\N	\N	\N	\N
5540	281	12	0	\N	\N	\N	\N	\N
5541	679	12	0	\N	\N	\N	\N	\N
5542	471	12	0	\N	\N	\N	\N	\N
5543	714	12	0	\N	\N	\N	\N	\N
5544	276	12	0	\N	\N	\N	\N	\N
5545	468	12	0	\N	\N	\N	\N	\N
5546	275	12	0	\N	\N	\N	\N	\N
5547	852	12	0	\N	\N	\N	\N	\N
5548	743	12	0	\N	\N	\N	\N	\N
5549	853	12	0	\N	\N	\N	\N	\N
5550	553	12	0	\N	\N	\N	\N	\N
5551	383	12	0	\N	\N	\N	\N	\N
5552	842	12	0	\N	\N	\N	\N	\N
5553	843	12	0	\N	\N	\N	\N	\N
5554	844	12	0	\N	\N	\N	\N	\N
5555	845	12	0	\N	\N	\N	\N	\N
5556	551	12	0	\N	\N	\N	\N	\N
5557	235	12	0	\N	\N	\N	\N	\N
5558	265	12	0	\N	\N	\N	\N	\N
5559	380	12	0	\N	\N	\N	\N	\N
5560	261	12	0	\N	\N	\N	\N	\N
5561	376	12	0	\N	\N	\N	\N	\N
5562	259	12	0	\N	\N	\N	\N	\N
5563	374	12	0	\N	\N	\N	\N	\N
5564	253	12	0	\N	\N	\N	\N	\N
5565	563	12	0	\N	\N	\N	\N	\N
5566	466	12	0	\N	\N	\N	\N	\N
5567	860	12	0	\N	\N	\N	\N	\N
5568	243	12	0	\N	\N	\N	\N	\N
5569	861	12	0	\N	\N	\N	\N	\N
5570	372	12	0	\N	\N	\N	\N	\N
5571	240	12	0	\N	\N	\N	\N	\N
5572	304	12	0	\N	\N	\N	\N	\N
5573	233	12	0	\N	\N	\N	\N	\N
5574	704	12	0	\N	\N	\N	\N	\N
5575	463	12	0	\N	\N	\N	\N	\N
5576	227	12	0	\N	\N	\N	\N	\N
5577	736	12	0	\N	\N	\N	\N	\N
5578	223	12	0	\N	\N	\N	\N	\N
5579	418	12	0	\N	\N	\N	\N	\N
5580	863	12	0	\N	\N	\N	\N	\N
5581	864	12	0	\N	\N	\N	\N	\N
5582	212	12	0	\N	\N	\N	\N	\N
5583	209	12	0	\N	\N	\N	\N	\N
5584	854	12	0	\N	\N	\N	\N	\N
5585	577	12	0	\N	\N	\N	\N	\N
5586	856	12	0	\N	\N	\N	\N	\N
5587	497	12	0	\N	\N	\N	\N	\N
5588	868	12	0	\N	\N	\N	\N	\N
5589	544	12	0	\N	\N	\N	\N	\N
5590	865	12	0	\N	\N	\N	\N	\N
5591	866	12	0	\N	\N	\N	\N	\N
5592	187	12	0	\N	\N	\N	\N	\N
5593	870	12	0	\N	\N	\N	\N	\N
5594	871	12	0	\N	\N	\N	\N	\N
5595	176	12	0	\N	\N	\N	\N	\N
5596	171	12	0	\N	\N	\N	\N	\N
5597	458	12	0	\N	\N	\N	\N	\N
5598	163	12	0	\N	\N	\N	\N	\N
5599	161	12	0	\N	\N	\N	\N	\N
5600	454	12	0	\N	\N	\N	\N	\N
5601	587	12	0	\N	\N	\N	\N	\N
5602	579	12	0	\N	\N	\N	\N	\N
5603	448	12	0	\N	\N	\N	\N	\N
5604	150	12	0	\N	\N	\N	\N	\N
5605	149	12	0	\N	\N	\N	\N	\N
5606	137	12	0	\N	\N	\N	\N	\N
5607	135	12	0	\N	\N	\N	\N	\N
5608	513	12	0	\N	\N	\N	\N	\N
5609	130	12	0	\N	\N	\N	\N	\N
5610	689	12	0	\N	\N	\N	\N	\N
5611	875	12	0	\N	\N	\N	\N	\N
5612	876	12	0	\N	\N	\N	\N	\N
5613	877	12	0	\N	\N	\N	\N	\N
5614	122	12	0	\N	\N	\N	\N	\N
5615	367	12	0	\N	\N	\N	\N	\N
5616	490	12	0	\N	\N	\N	\N	\N
5617	698	12	0	\N	\N	\N	\N	\N
5618	303	12	0	\N	\N	\N	\N	\N
5619	735	12	0	\N	\N	\N	\N	\N
5620	762	12	0	\N	\N	\N	\N	\N
5621	812	12	0	\N	\N	\N	\N	\N
5622	335	12	0	\N	\N	\N	\N	\N
5623	103	12	0	\N	\N	\N	\N	\N
5624	507	12	0	\N	\N	\N	\N	\N
5625	95	12	0	\N	\N	\N	\N	\N
5626	506	12	0	\N	\N	\N	\N	\N
5627	726	12	0	\N	\N	\N	\N	\N
5628	541	12	0	\N	\N	\N	\N	\N
5629	74	12	0	\N	\N	\N	\N	\N
5630	442	12	0	\N	\N	\N	\N	\N
5631	349	12	0	\N	\N	\N	\N	\N
5632	65	12	0	\N	\N	\N	\N	\N
5633	64	12	0	\N	\N	\N	\N	\N
5634	439	12	0	\N	\N	\N	\N	\N
5635	57	12	0	\N	\N	\N	\N	\N
5636	764	12	0	\N	\N	\N	\N	\N
5637	675	12	0	\N	\N	\N	\N	\N
5638	341	12	0	\N	\N	\N	\N	\N
5639	312	12	0	\N	\N	\N	\N	\N
5640	479	12	0	\N	\N	\N	\N	\N
5641	327	12	0	\N	\N	\N	\N	\N
5642	396	12	0	\N	\N	\N	\N	\N
5643	855	12	0	\N	\N	\N	\N	\N
5644	221	12	0	\N	\N	\N	\N	\N
5645	206	12	0	\N	\N	\N	\N	\N
5646	733	12	0	\N	\N	\N	\N	\N
5647	37	12	0	\N	\N	\N	\N	\N
5648	446	12	0	\N	\N	\N	\N	\N
5649	878	12	0	\N	\N	\N	\N	\N
5650	113	12	0	\N	\N	\N	\N	\N
5651	331	12	0	\N	\N	\N	\N	\N
5652	684	12	0	\N	\N	\N	\N	\N
5653	100	12	0	\N	\N	\N	\N	\N
5655	29	13	0	\N	\N	\N	\N	\N
5660	63	13	1	2017-10-03 14:12:31	\N	\N	\N	\N
5657	732	13	1	2017-10-03 14:13:23	\N	\N	\N	\N
5658	17	13	1	2017-10-03 14:28:52	\N	\N	\N	\N
5669	19	13	1	2017-10-03 14:34:06	\N	\N	\N	\N
5661	6	13	1	2017-10-03 14:49:06	\N	\N	\N	\N
5659	22	13	1	2017-10-03 15:00:16	\N	\N	\N	\N
5663	32	13	1	2017-10-03 15:06:03	\N	\N	\N	\N
5665	8	13	1	2017-10-03 15:18:34	\N	\N	\N	\N
5662	21	13	1	2017-10-04 09:26:04	\N	\N	\N	\N
5667	28	13	1	2017-10-04 11:19:15	\N	\N	\N	\N
5668	755	13	1	2017-10-06 13:50:20	\N	\N	\N	\N
5672	31	13	0	\N	\N	\N	\N	\N
5677	808	13	0	\N	\N	\N	\N	\N
5680	15	13	0	\N	\N	\N	\N	\N
5697	759	13	0	\N	\N	\N	\N	\N
5700	757	13	0	\N	\N	\N	\N	\N
5702	758	13	0	\N	\N	\N	\N	\N
5704	756	13	0	\N	\N	\N	\N	\N
5724	674	13	0	\N	\N	\N	\N	\N
5739	134	13	0	\N	\N	\N	\N	\N
5751	67	13	0	\N	\N	\N	\N	\N
5756	126	13	0	\N	\N	\N	\N	\N
5760	107	13	0	\N	\N	\N	\N	\N
5765	117	13	0	\N	\N	\N	\N	\N
5782	166	13	0	\N	\N	\N	\N	\N
5786	760	13	0	\N	\N	\N	\N	\N
5787	160	13	0	\N	\N	\N	\N	\N
5810	763	13	0	\N	\N	\N	\N	\N
5812	174	13	0	\N	\N	\N	\N	\N
5822	194	13	0	\N	\N	\N	\N	\N
5695	46	13	1	2017-10-03 13:48:28	\N	\N	\N	\N
5681	13	13	1	2017-10-03 13:50:36	\N	\N	\N	\N
5721	48	13	1	2017-10-03 13:51:05	\N	\N	\N	\N
5698	93	13	1	2017-10-03 13:51:12	\N	\N	\N	\N
5703	56	13	1	2017-10-03 13:57:11	\N	\N	\N	\N
5713	94	13	1	2017-10-03 13:58:09	\N	-4	\N	\N
5732	70	13	1	2017-10-03 14:00:59	\N	\N	\N	\N
5776	110	13	1	2017-10-03 14:01:14	\N	\N	\N	\N
5794	151	13	1	2017-10-03 14:01:50	\N	\N	\N	\N
5759	118	13	1	2017-10-03 14:02:11	\N	\N	\N	\N
5734	66	13	1	2017-10-03 14:02:46	\N	\N	\N	\N
5727	85	13	1	2017-10-03 14:05:07	\N	\N	\N	\N
5688	23	13	1	2017-10-03 14:06:35	\N	\N	\N	\N
5706	42	13	1	2017-10-03 14:06:43	\N	\N	\N	\N
5742	68	13	1	2017-10-03 14:12:52	\N	\N	\N	\N
5687	27	13	1	2017-10-03 14:19:30	\N	\N	\N	\N
5718	51	13	1	2017-10-03 14:19:45	\N	\N	\N	\N
5745	83	13	1	2017-10-03 14:20:43	\N	\N	\N	\N
5715	53	13	1	2017-10-03 14:21:18	\N	\N	\N	\N
5741	129	13	1	2017-10-03 14:21:58	\N	\N	\N	\N
5779	680	13	1	2017-10-03 14:23:23	\N	\N	\N	\N
5806	681	13	1	2017-10-03 14:23:35	\N	\N	\N	\N
5678	12	13	1	2017-10-03 14:24:28	\N	\N	\N	\N
5728	72	13	1	2017-10-03 14:26:48	\N	\N	\N	\N
5743	734	13	1	2017-10-03 14:28:08	\N	\N	\N	\N
5773	115	13	1	2017-10-03 14:28:31	\N	\N	\N	\N
5716	96	13	1	2017-10-03 14:29:41	\N	\N	\N	\N
5766	136	13	1	2017-10-03 14:31:03	\N	\N	\N	\N
5710	671	13	1	2017-10-03 14:31:09	\N	\N	\N	\N
5711	45	13	1	2017-10-03 14:31:29	\N	\N	\N	\N
5825	193	13	1	2017-10-03 14:32:16	\N	\N	\N	\N
5780	170	13	1	2017-10-03 14:36:24	\N	\N	\N	\N
5757	168	13	1	2017-10-03 14:36:42	\N	\N	\N	\N
5818	155	13	1	2017-10-03 14:36:53	\N	\N	\N	\N
5792	153	13	1	2017-10-03 14:38:30	\N	\N	\N	\N
5723	717	13	1	2017-10-03 14:38:44	\N	\N	\N	\N
5720	90	13	1	2017-10-03 14:39:17	\N	\N	\N	\N
5775	105	13	1	2017-10-03 14:39:59	\N	\N	\N	\N
5767	112	13	1	2017-10-03 14:40:24	\N	\N	\N	\N
5764	102	13	1	2017-10-03 14:41:15	\N	\N	\N	\N
5676	16	13	1	2017-10-04 14:51:12	\N	\N	\N	\N
5686	20	13	1	2017-10-03 14:43:52	\N	\N	\N	\N
5733	59	13	1	2017-10-03 14:44:49	\N	\N	\N	\N
5689	61	13	1	2017-10-03 14:46:02	\N	\N	\N	\N
5807	198	13	1	2017-10-03 14:46:08	\N	\N	\N	\N
5729	82	13	1	2017-10-03 14:46:14	\N	\N	\N	\N
5783	106	13	1	2017-10-03 14:48:04	\N	\N	\N	\N
5753	127	13	1	2017-10-03 14:49:38	\N	\N	\N	\N
5693	97	13	1	2017-10-03 14:50:08	\N	\N	\N	\N
5722	47	13	1	2017-10-03 14:53:35	\N	\N	\N	\N
5749	73	13	1	2017-10-03 14:53:42	\N	\N	\N	\N
5772	138	13	1	2017-10-03 14:54:44	\N	\N	\N	\N
5707	101	13	1	2017-10-03 14:54:59	\N	\N	\N	\N
5709	697	13	1	2017-10-03 14:55:53	\N	\N	\N	\N
5674	25	13	1	2017-10-03 14:57:47	\N	\N	\N	\N
5746	81	13	1	2017-10-03 14:58:25	\N	\N	\N	\N
5771	165	13	1	2017-10-03 14:58:32	\N	\N	\N	\N
5820	199	13	1	2017-10-03 14:58:57	\N	\N	\N	\N
5801	144	13	1	2017-10-03 14:59:04	\N	\N	\N	\N
5805	143	13	1	2017-10-03 15:00:22	\N	\N	\N	\N
5769	108	13	1	2017-10-03 15:00:39	\N	\N	\N	\N
5762	139	13	1	2017-10-03 15:01:09	\N	\N	\N	\N
5712	44	13	1	2017-10-03 15:02:35	\N	\N	\N	\N
5777	167	13	1	2017-10-03 15:07:06	\N	\N	\N	\N
5797	205	13	1	2017-10-03 15:07:14	\N	\N	\N	\N
5735	87	13	1	2017-10-03 15:07:36	\N	\N	\N	\N
5755	125	13	1	2017-10-03 15:07:52	\N	\N	\N	\N
5808	49	13	1	2017-10-03 15:08:49	\N	\N	\N	\N
5736	86	13	1	2017-10-03 15:12:51	\N	\N	\N	\N
5790	142	13	1	2017-10-03 15:13:00	\N	\N	\N	\N
5679	172	13	1	2017-10-03 15:13:10	\N	\N	\N	\N
5691	52	13	1	2017-10-03 15:14:38	\N	\N	\N	\N
5754	121	13	1	2017-10-03 15:17:26	\N	\N	\N	\N
5819	201	13	1	2017-10-03 15:16:10	\N	\N	\N	\N
5671	9	13	1	2017-10-03 15:18:08	\N	\N	\N	\N
5740	58	13	1	2017-10-03 15:23:25	\N	\N	\N	\N
5788	159	13	1	2017-10-03 15:23:32	\N	\N	\N	\N
5804	141	13	1	2017-10-03 15:29:59	\N	\N	\N	\N
5761	169	13	1	2017-10-03 15:30:17	\N	\N	\N	\N
5699	89	13	1	2017-10-03 15:32:10	\N	\N	\N	\N
5714	36	13	1	2017-10-03 15:32:19	\N	\N	\N	\N
5738	75	13	1	2017-10-03 15:32:33	\N	\N	\N	\N
5803	208	13	1	2017-10-03 15:33:51	\N	\N	\N	\N
5798	148	13	1	2017-10-03 15:35:26	\N	\N	\N	\N
5673	1	13	1	2017-10-03 15:37:09	\N	\N	\N	\N
5821	196	13	1	2017-10-03 15:38:30	\N	\N	\N	\N
5717	88	13	1	2017-10-03 15:42:16	\N	\N	\N	\N
5800	204	13	1	2017-10-03 15:47:17	\N	\N	\N	\N
5685	34	13	1	2017-10-03 15:47:32	\N	\N	\N	\N
5785	754	13	1	2017-10-03 15:48:33	\N	\N	\N	\N
5763	111	13	1	2017-10-03 15:50:41	\N	\N	\N	\N
5784	116	13	1	2017-10-03 16:15:18	\N	\N	\N	\N
5781	109	13	1	2017-10-04 08:31:58	\N	\N	\N	\N
5744	133	13	1	2017-10-04 08:58:35	\N	\N	\N	\N
5774	114	13	1	2017-10-04 09:12:22	\N	\N	\N	\N
5816	203	13	1	2017-10-04 09:14:04	\N	\N	\N	\N
5670	5	13	1	2017-10-04 09:24:57	\N	\N	\N	\N
5675	24	13	1	2017-10-04 09:25:05	\N	\N	\N	\N
5799	175	13	1	2017-10-04 09:28:48	\N	\N	\N	\N
5737	79	13	1	2017-10-04 09:50:51	\N	\N	\N	\N
5778	119	13	1	2017-10-04 10:14:15	\N	\N	\N	\N
5791	156	13	1	2017-10-04 10:16:30	\N	\N	\N	\N
5824	655	13	1	2017-10-04 11:01:24	\N	\N	\N	\N
5815	207	13	1	2017-10-04 11:24:26	\N	\N	\N	\N
5708	98	13	1	2017-10-04 11:25:10	\N	\N	\N	\N
5692	41	13	1	2017-10-04 13:17:54	\N	\N	\N	\N
5750	69	13	1	2017-10-04 13:19:08	\N	\N	\N	\N
5796	158	13	1	2017-10-04 13:34:40	\N	\N	\N	\N
5823	656	13	1	2017-10-06 13:50:53	\N	\N	\N	\N
5832	192	13	0	\N	\N	\N	\N	\N
5839	809	13	0	\N	\N	\N	\N	\N
5844	737	13	0	\N	\N	\N	\N	\N
5858	256	13	0	\N	\N	\N	\N	\N
5859	683	13	0	\N	\N	\N	\N	\N
5878	252	13	0	\N	\N	\N	\N	\N
5882	39	13	0	\N	\N	\N	\N	\N
5884	765	13	0	\N	\N	\N	\N	\N
5890	283	13	0	\N	\N	\N	\N	\N
5896	289	13	0	\N	\N	\N	\N	\N
5900	739	13	0	\N	\N	\N	\N	\N
5904	305	13	0	\N	\N	\N	\N	\N
5914	298	13	0	\N	\N	\N	\N	\N
5933	351	13	0	\N	\N	\N	\N	\N
5939	328	13	0	\N	\N	\N	\N	\N
5944	338	13	0	\N	\N	\N	\N	\N
5945	334	13	0	\N	\N	\N	\N	\N
5946	333	13	0	\N	\N	\N	\N	\N
5951	378	13	0	\N	\N	\N	\N	\N
5961	770	13	0	\N	\N	\N	\N	\N
5967	722	13	0	\N	\N	\N	\N	\N
5972	371	13	0	\N	\N	\N	\N	\N
5973	365	13	0	\N	\N	\N	\N	\N
5974	768	13	0	\N	\N	\N	\N	\N
5975	377	13	0	\N	\N	\N	\N	\N
5977	379	13	0	\N	\N	\N	\N	\N
5979	401	13	0	\N	\N	\N	\N	\N
5889	721	13	1	2017-10-03 13:53:35	\N	\N	\N	\N
5856	219	13	1	2017-10-03 13:53:41	\N	\N	\N	\N
5861	702	13	1	2017-10-03 13:54:08	\N	\N	\N	\N
5863	738	13	1	2017-10-03 13:54:32	\N	\N	\N	\N
5888	262	13	1	2017-10-03 14:04:53	\N	\N	\N	\N
5970	7	13	1	2017-10-03 14:05:14	\N	\N	\N	\N
5830	215	13	1	2017-10-03 14:05:25	\N	\N	\N	\N
5981	415	13	1	2017-10-03 14:05:58	\N	\N	\N	\N
5959	340	13	1	2017-10-03 14:08:02	\N	\N	\N	\N
5928	299	13	1	2017-10-03 14:09:05	\N	\N	\N	\N
5942	321	13	1	2017-10-03 14:09:12	\N	\N	\N	\N
5935	325	13	1	2017-10-03 14:09:42	\N	\N	\N	\N
5860	236	13	1	2017-10-03 14:11:17	\N	\N	\N	\N
5887	309	13	1	2017-10-03 14:11:25	\N	\N	\N	\N
5847	701	13	1	2017-10-03 14:13:40	\N	\N	\N	\N
5941	337	13	1	2017-10-03 14:15:14	\N	\N	\N	\N
5836	682	13	1	2017-10-03 14:20:28	\N	\N	\N	\N
5862	33	13	1	2017-10-03 14:20:35	\N	\N	\N	\N
5881	244	13	1	2017-10-03 14:20:59	\N	\N	\N	\N
5868	279	13	1	2017-10-03 14:22:13	\N	\N	\N	\N
5907	317	13	1	2017-10-03 14:24:11	\N	\N	\N	\N
5903	251	13	1	2017-10-03 14:24:47	\N	\N	\N	\N
5957	373	13	1	2017-10-03 14:24:55	\N	\N	\N	\N
5929	322	13	1	2017-10-03 14:25:36	\N	\N	\N	\N
5827	182	13	1	2017-10-03 14:26:23	\N	\N	\N	\N
5949	389	13	1	2017-10-03 14:26:56	\N	\N	\N	\N
5917	685	13	1	2017-10-03 14:28:20	\N	\N	\N	\N
5940	348	13	1	2017-10-03 14:28:39	\N	\N	\N	\N
5880	266	13	1	2017-10-03 14:31:44	\N	\N	\N	\N
5873	273	13	1	2017-10-03 14:32:08	\N	\N	\N	\N
5931	336	13	1	2017-10-03 14:32:50	\N	\N	\N	\N
5932	343	13	1	2017-10-03 14:33:11	\N	\N	\N	\N
5899	288	13	1	2017-10-03 14:33:46	\N	\N	\N	\N
5852	216	13	1	2017-10-03 14:34:55	\N	\N	\N	\N
5983	392	13	1	2017-10-03 14:36:00	\N	\N	\N	\N
5913	292	13	1	2017-10-03 14:37:36	\N	\N	\N	\N
5906	291	13	1	2017-10-03 14:39:06	\N	\N	\N	\N
5912	295	13	1	2017-10-03 14:39:50	\N	\N	\N	\N
5838	184	13	1	2017-10-03 14:40:05	\N	\N	\N	\N
5842	218	13	1	2017-10-03 14:40:43	\N	\N	\N	\N
5865	267	13	1	2017-10-03 14:41:28	\N	\N	\N	\N
5963	366	13	1	2017-10-03 14:41:41	\N	\N	\N	\N
5840	183	13	1	2017-10-03 14:41:49	\N	\N	\N	\N
5921	301	13	1	2017-10-03 14:41:56	\N	\N	\N	\N
5876	254	13	1	2017-10-03 14:44:03	\N	\N	\N	\N
5976	382	13	1	2017-10-03 14:44:40	\N	\N	\N	\N
5925	344	13	1	2017-10-03 14:45:05	\N	\N	\N	\N
5937	353	13	1	2017-10-03 14:45:14	\N	\N	\N	\N
5833	195	13	1	2017-10-03 14:46:25	\N	\N	\N	\N
5955	390	13	1	2017-10-03 14:46:37	\N	\N	\N	\N
5958	364	13	1	2017-10-03 14:46:59	\N	\N	\N	\N
5871	245	13	1	2017-10-03 14:47:10	\N	\N	\N	\N
5923	347	13	1	2017-10-03 14:47:30	\N	\N	\N	\N
5922	302	13	1	2017-10-03 14:48:11	\N	\N	\N	\N
5846	185	13	1	2017-10-03 14:48:19	\N	\N	\N	\N
5872	228	13	1	2017-10-04 15:59:39	\N	\N	\N	\N
5926	350	13	1	2017-10-03 14:50:26	\N	\N	\N	\N
5828	213	13	1	2017-10-03 14:51:12	\N	\N	\N	\N
5934	355	13	1	2017-10-03 14:53:22	\N	\N	\N	\N
5869	241	13	1	2017-10-03 14:53:59	\N	\N	\N	\N
5886	268	13	1	2017-10-03 14:54:34	\N	\N	\N	\N
5978	386	13	1	2017-10-03 14:55:05	\N	\N	\N	\N
5930	18	13	1	2017-10-03 14:55:14	\N	\N	\N	\N
5911	307	13	1	2017-10-03 14:57:26	\N	\N	\N	\N
5919	329	13	1	2017-10-03 14:59:32	\N	\N	\N	\N
5952	375	13	1	2017-10-03 14:59:49	\N	\N	\N	\N
5954	370	13	1	2017-10-03 15:00:29	\N	\N	\N	\N
5898	255	13	1	2017-10-03 15:02:25	\N	\N	\N	\N
5874	220	13	1	2017-10-03 15:03:44	\N	\N	\N	\N
5841	186	13	1	2017-10-03 15:04:09	\N	\N	\N	\N
5910	306	13	1	2017-10-03 15:06:25	\N	\N	\N	\N
5950	381	13	1	2017-10-03 15:07:22	\N	\N	\N	\N
5971	11	13	1	2017-10-03 15:08:57	\N	\N	\N	\N
5962	362	13	1	2017-10-03 15:12:17	\N	\N	\N	\N
5893	286	13	1	2017-10-03 15:12:42	\N	\N	\N	\N
5960	360	13	1	2017-10-03 15:13:29	\N	\N	\N	\N
5895	285	13	1	2017-10-03 15:14:44	\N	\N	\N	\N
5854	247	13	1	2017-10-03 15:16:33	\N	\N	\N	\N
5916	345	13	1	2017-10-03 15:17:01	\N	\N	\N	\N
5902	293	13	1	2017-10-03 15:17:47	\N	\N	\N	\N
5829	222	13	1	2017-10-03 15:32:42	\N	\N	\N	\N
5956	384	13	1	2017-10-03 15:32:57	\N	\N	\N	\N
5915	354	13	1	2017-10-03 15:33:05	\N	\N	\N	\N
5848	181	13	1	2017-10-03 15:33:16	\N	\N	\N	\N
5834	191	13	1	2017-10-03 15:38:41	\N	\N	\N	\N
5870	248	13	1	2017-10-03 15:45:29	\N	\N	\N	\N
5908	287	13	1	2017-10-03 15:45:42	\N	\N	\N	\N
5850	214	13	1	2017-10-03 15:46:31	\N	\N	\N	\N
5901	257	13	1	2017-10-03 15:47:06	\N	\N	\N	\N
5866	242	13	1	2017-10-03 16:02:33	\N	\N	\N	\N
5875	277	13	1	2017-10-03 16:02:48	\N	\N	\N	\N
5943	740	13	1	2017-10-03 16:03:15	\N	\N	\N	\N
5924	352	13	1	2017-10-04 08:35:36	\N	\N	\N	\N
5885	270	13	1	2017-10-04 08:38:51	\N	\N	\N	\N
5835	180	13	1	2017-10-04 08:53:15	\N	\N	\N	\N
5982	406	13	1	2017-10-04 09:09:07	\N	\N	\N	\N
5883	271	13	1	2017-10-04 09:29:21	\N	\N	\N	\N
5938	346	13	1	2017-10-04 10:31:10	\N	\N	\N	\N
5966	368	13	1	2017-10-04 10:53:46	\N	\N	\N	\N
5837	230	13	1	2017-10-04 11:59:20	\N	\N	\N	\N
5843	190	13	1	2017-10-06 13:53:54	\N	\N	\N	\N
5909	278	13	1	2017-10-09 14:02:27	\N	\N	\N	\N
5965	741	13	1	2017-10-09 14:03:02	\N	\N	\N	\N
5987	394	13	0	\N	\N	\N	\N	\N
5988	742	13	0	\N	\N	\N	\N	\N
5989	723	13	0	\N	\N	\N	\N	\N
5991	413	13	0	\N	\N	\N	\N	\N
5993	775	13	0	\N	\N	\N	\N	\N
5998	404	13	0	\N	\N	\N	\N	\N
6001	777	13	0	\N	\N	\N	\N	\N
6008	772	13	0	\N	\N	\N	\N	\N
6010	773	13	0	\N	\N	\N	\N	\N
6011	774	13	0	\N	\N	\N	\N	\N
6013	776	13	0	\N	\N	\N	\N	\N
6014	408	13	0	\N	\N	\N	\N	\N
6015	407	13	0	\N	\N	\N	\N	\N
6032	779	13	0	\N	\N	\N	\N	\N
6037	778	13	0	\N	\N	\N	\N	\N
6038	447	13	0	\N	\N	\N	\N	\N
6043	781	13	0	\N	\N	\N	\N	\N
6049	780	13	0	\N	\N	\N	\N	\N
6080	782	13	0	\N	\N	\N	\N	\N
6083	783	13	0	\N	\N	\N	\N	\N
6088	520	13	0	\N	\N	\N	\N	\N
6095	787	13	0	\N	\N	\N	\N	\N
6102	788	13	0	\N	\N	\N	\N	\N
6115	543	13	0	\N	\N	\N	\N	\N
6122	511	13	0	\N	\N	\N	\N	\N
6123	709	13	0	\N	\N	\N	\N	\N
6124	786	13	0	\N	\N	\N	\N	\N
6134	555	13	0	\N	\N	\N	\N	\N
6135	574	13	0	\N	\N	\N	\N	\N
6138	810	13	0	\N	\N	\N	\N	\N
6052	449	13	1	2017-10-03 13:44:25	\N	\N	\N	\N
6053	472	13	1	2017-10-03 13:45:45	\N	\N	\N	\N
6086	469	13	1	2017-10-03 13:46:09	\N	\N	\N	\N
6103	540	13	1	2017-10-03 13:46:18	\N	\N	\N	\N
6027	441	13	1	2017-10-03 13:48:04	\N	\N	\N	\N
6064	514	13	1	2017-10-03 13:49:08	\N	\N	\N	\N
6028	433	13	1	2017-10-03 13:49:18	\N	\N	\N	\N
6137	552	13	1	2017-10-03 13:49:40	\N	\N	\N	\N
6104	527	13	1	2017-10-03 13:50:24	\N	\N	\N	\N
6065	533	13	1	2017-10-03 13:51:21	\N	\N	\N	\N
6057	486	13	1	2017-10-03 13:51:51	\N	\N	\N	\N
6100	530	13	1	2017-10-03 13:52:36	\N	\N	\N	\N
6046	455	13	1	2017-10-03 13:53:10	\N	\N	\N	\N
5985	423	13	1	2017-10-03 13:53:19	\N	\N	\N	\N
6050	453	13	1	2017-10-03 13:53:28	\N	\N	\N	\N
6054	487	13	1	2017-10-03 13:54:49	\N	\N	\N	\N
6074	492	13	1	2017-10-03 13:55:05	\N	\N	\N	\N
6070	493	13	1	2017-10-03 13:55:14	\N	\N	\N	\N
6009	409	13	1	2017-10-03 13:55:23	\N	\N	\N	\N
6090	508	13	1	2017-10-03 13:55:51	\N	\N	\N	\N
6035	318	13	1	2017-10-03 13:56:01	\N	\N	\N	\N
6068	485	13	1	2017-10-03 13:57:04	\N	\N	\N	\N
6133	550	13	1	2017-10-03 13:57:26	\N	\N	\N	\N
6029	450	13	1	2017-10-03 13:57:34	\N	\N	\N	\N
6096	548	13	1	2017-10-03 14:01:23	\N	\N	\N	\N
6084	503	13	1	2017-10-03 14:02:19	\N	\N	\N	\N
6119	562	13	1	2017-10-03 14:05:40	\N	\N	-3	\N
6097	542	13	1	2017-10-03 14:08:36	\N	\N	\N	\N
6034	443	13	1	2017-10-03 14:08:45	\N	\N	\N	\N
6072	489	13	1	2017-10-03 14:08:52	\N	\N	\N	\N
6125	515	13	1	2017-10-03 14:08:58	\N	\N	\N	\N
6113	559	13	1	2017-10-03 14:12:04	\N	\N	\N	\N
6094	522	13	1	2017-10-03 14:14:35	\N	\N	\N	\N
6042	707	13	1	2017-10-03 14:15:03	\N	\N	\N	\N
6039	451	13	1	2017-10-03 14:15:31	\N	\N	\N	\N
6085	744	13	1	2017-10-03 14:15:57	\N	\N	\N	\N
6111	545	13	1	2017-10-03 14:17:05	\N	\N	\N	\N
6003	398	13	1	2017-10-03 14:18:20	\N	\N	\N	\N
6066	488	13	1	2017-10-03 14:20:51	\N	\N	\N	\N
6077	496	13	1	2017-10-03 14:22:05	\N	\N	\N	\N
6075	538	13	1	2017-10-03 14:22:20	\N	\N	\N	\N
6040	438	13	1	2017-10-03 14:24:20	\N	\N	\N	\N
6021	434	13	1	2017-10-03 14:27:03	\N	\N	\N	\N
6089	528	13	1	2017-10-03 14:29:27	\N	\N	\N	\N
6128	691	13	1	2017-10-03 14:30:01	\N	\N	\N	\N
6127	567	13	1	2017-10-03 14:30:25	\N	\N	\N	\N
6024	460	13	1	2017-10-03 14:32:00	\N	\N	\N	\N
6036	724	13	1	2017-10-03 14:32:35	\N	\N	\N	\N
6007	410	13	1	2017-10-03 14:32:44	\N	\N	\N	\N
6092	518	13	1	2017-10-03 14:34:45	\N	\N	\N	\N
6116	517	13	1	2017-10-03 14:35:11	\N	\N	\N	\N
6056	725	13	1	2017-10-03 14:37:54	\N	\N	\N	\N
5999	323	13	1	2017-10-03 14:39:24	\N	\N	\N	\N
6063	467	13	1	2017-10-03 14:39:30	\N	\N	\N	\N
6105	534	13	1	2017-10-03 14:43:05	\N	\N	\N	\N
6136	570	13	1	2017-10-03 14:45:26	\N	\N	\N	\N
6130	315	13	1	2017-10-03 14:47:56	\N	\N	\N	\N
6041	436	13	1	2017-10-03 14:50:00	\N	\N	\N	\N
6110	578	13	1	2017-10-03 14:50:38	\N	\N	\N	\N
5984	706	13	1	2017-10-03 14:56:52	\N	\N	\N	\N
5995	402	13	1	2017-10-03 14:57:01	\N	\N	\N	\N
6099	745	13	1	2017-10-03 14:59:18	\N	\N	\N	\N
6006	687	13	1	2017-10-03 15:06:39	\N	\N	\N	\N
6126	547	13	1	2017-10-03 15:14:22	\N	\N	\N	\N
6055	512	13	1	2017-10-03 15:17:56	\N	\N	\N	\N
6112	536	13	1	2017-10-03 15:19:29	\N	\N	\N	\N
5990	419	13	1	2017-10-03 15:20:34	\N	\N	\N	\N
5986	400	13	1	2017-10-03 15:51:38	\N	\N	\N	\N
6117	575	13	1	2017-10-03 15:55:58	\N	\N	\N	\N
6139	425	13	1	2017-10-03 15:59:36	\N	\N	\N	\N
6017	462	13	1	2017-10-03 16:00:14	\N	\N	\N	\N
6073	473	13	1	2017-10-03 16:00:58	\N	\N	\N	\N
5992	2	13	1	2017-10-03 16:09:46	\N	\N	\N	\N
6004	424	13	1	2017-10-03 16:35:30	\N	\N	\N	\N
6012	416	13	1	2017-10-03 16:35:41	\N	\N	\N	\N
6000	393	13	1	2017-10-04 14:19:20	\N	\N	\N	\N
6016	430	13	1	2017-10-04 08:36:16	\N	\N	\N	\N
6082	474	13	1	2017-10-04 08:40:07	\N	\N	\N	\N
6079	426	13	1	2017-10-04 08:45:37	\N	\N	\N	\N
6081	477	13	1	2017-10-04 09:20:51	\N	\N	\N	\N
6078	470	13	1	2017-10-04 09:32:45	\N	\N	\N	\N
6069	502	13	1	2017-10-04 09:46:06	\N	\N	\N	\N
6019	461	13	1	2017-10-04 09:46:14	\N	\N	\N	\N
6045	459	13	1	2017-10-04 10:17:58	\N	\N	\N	\N
6071	484	13	1	2017-10-04 10:18:40	\N	\N	\N	\N
6058	505	13	1	2017-10-04 10:19:23	\N	\N	\N	\N
6002	397	13	1	2017-10-04 10:36:21	\N	\N	\N	\N
6109	519	13	1	2017-10-04 11:12:47	\N	\N	\N	\N
6025	440	13	1	2017-10-04 11:13:32	\N	\N	\N	\N
5997	422	13	1	2017-10-04 11:13:45	\N	\N	\N	\N
6018	428	13	1	2017-10-04 11:13:58	\N	\N	\N	\N
6121	509	13	1	2017-10-04 11:16:00	\N	\N	\N	\N
6108	526	13	1	2017-10-04 11:16:16	\N	\N	\N	\N
6048	431	13	1	2017-10-04 11:16:28	\N	\N	\N	\N
6093	510	13	1	2017-10-04 13:40:59	\N	\N	\N	\N
6140	556	13	1	2017-10-04 15:28:31	\N	\N	\N	\N
6132	746	13	1	2017-10-05 10:02:12	\N	\N	\N	\N
6062	498	13	1	2017-10-05 10:12:11	\N	\N	\N	\N
6031	491	13	1	2017-10-06 08:44:05	\N	\N	\N	\N
6026	688	13	1	2017-10-09 14:08:25	\N	\N	\N	\N
6142	811	13	0	\N	\N	\N	\N	\N
6144	576	13	0	\N	\N	\N	\N	\N
6156	791	13	0	\N	\N	\N	\N	\N
6157	789	13	0	\N	\N	\N	\N	\N
6159	790	13	0	\N	\N	\N	\N	\N
6164	326	13	0	\N	\N	\N	\N	\N
6170	666	13	0	\N	\N	\N	\N	\N
6190	792	13	0	\N	\N	\N	\N	\N
6196	269	13	0	\N	\N	\N	\N	\N
6203	311	13	0	\N	\N	\N	\N	\N
6208	795	13	0	\N	\N	\N	\N	\N
6212	796	13	0	\N	\N	\N	\N	\N
6215	237	13	0	\N	\N	\N	\N	\N
6218	210	13	0	\N	\N	\N	\N	\N
6219	797	13	0	\N	\N	\N	\N	\N
6220	793	13	0	\N	\N	\N	\N	\N
6222	794	13	0	\N	\N	\N	\N	\N
6224	581	13	0	\N	\N	\N	\N	\N
6243	802	13	0	\N	\N	\N	\N	\N
6244	800	13	0	\N	\N	\N	\N	\N
6245	618	13	0	\N	\N	\N	\N	\N
6250	799	13	0	\N	\N	\N	\N	\N
6251	801	13	0	\N	\N	\N	\N	\N
6255	798	13	0	\N	\N	\N	\N	\N
6264	653	13	0	\N	\N	\N	\N	\N
6267	646	13	0	\N	\N	\N	\N	\N
6273	803	13	0	\N	\N	\N	\N	\N
6274	804	13	0	\N	\N	\N	\N	\N
6275	805	13	0	\N	\N	\N	\N	\N
6276	806	13	0	\N	\N	\N	\N	\N
6277	807	13	0	\N	\N	\N	\N	\N
6278	480	13	0	\N	\N	\N	\N	\N
6279	824	13	0	\N	\N	\N	\N	\N
6280	832	13	0	\N	\N	\N	\N	\N
6281	821	13	0	\N	\N	\N	\N	\N
6282	822	13	0	\N	\N	\N	\N	\N
6283	823	13	0	\N	\N	\N	\N	\N
6284	825	13	0	\N	\N	\N	\N	\N
6285	826	13	0	\N	\N	\N	\N	\N
6286	827	13	0	\N	\N	\N	\N	\N
6287	478	13	0	\N	\N	\N	\N	\N
6288	828	13	0	\N	\N	\N	\N	\N
6289	829	13	0	\N	\N	\N	\N	\N
6290	830	13	0	\N	\N	\N	\N	\N
6291	831	13	0	\N	\N	\N	\N	\N
6292	833	13	0	\N	\N	\N	\N	\N
6294	834	13	0	\N	\N	\N	\N	\N
6295	835	13	0	\N	\N	\N	\N	\N
6297	836	13	0	\N	\N	\N	\N	\N
6298	837	13	0	\N	\N	\N	\N	\N
6166	310	13	1	2017-10-03 13:49:25	\N	\N	\N	\N
6271	695	13	1	2017-10-03 13:49:32	\N	\N	\N	\N
6188	54	13	1	2017-10-03 13:50:44	\N	\N	\N	\N
6145	568	13	1	2017-10-03 13:50:55	\N	\N	\N	\N
6163	523	13	1	2017-10-03 13:56:33	\N	\N	-4	\N
6151	435	13	1	2017-10-03 14:01:43	\N	\N	\N	\N
6199	145	13	1	2017-10-03 14:02:34	\N	\N	\N	\N
6182	414	13	1	2017-10-03 14:03:40	\N	\N	\N	\N
6148	521	13	1	2017-10-03 14:04:30	\N	\N	\N	\N
6187	99	13	1	2017-10-03 14:12:23	\N	\N	\N	\N
6200	729	13	1	2017-10-03 14:13:33	\N	\N	\N	\N
6147	727	13	1	2017-10-03 14:23:01	\N	\N	\N	\N
6176	728	13	1	2017-10-03 14:23:11	\N	\N	\N	\N
6193	580	13	1	2017-10-03 14:23:43	\N	\N	\N	\N
6296	619	13	1	2017-10-03 14:23:51	\N	\N	\N	\N
6168	692	13	1	2017-10-03 14:27:09	\N	\N	\N	\N
6249	730	13	1	2017-10-03 14:29:47	\N	\N	\N	\N
6260	624	13	1	2017-10-03 14:30:44	\N	\N	\N	\N
6266	650	13	1	2017-10-03 14:30:54	\N	\N	\N	\N
6201	246	13	1	2017-10-03 14:39:40	\N	\N	\N	\N
6211	748	13	1	2017-10-03 14:42:47	\N	\N	\N	\N
6183	173	13	1	2017-10-03 14:43:26	\N	\N	\N	\N
6179	211	13	1	2017-10-03 14:44:56	\N	\N	\N	\N
6198	693	13	1	2017-10-03 14:47:48	\N	\N	\N	\N
6161	573	13	1	2017-10-03 14:48:41	\N	\N	\N	\N
6173	197	13	1	2017-10-03 14:48:58	\N	\N	\N	\N
6242	606	13	1	2017-10-03 14:52:34	\N	\N	\N	\N
6226	583	13	1	2017-10-03 14:52:59	\N	\N	\N	\N
6231	421	13	1	2017-10-03 14:53:09	\N	\N	\N	\N
6189	363	13	1	2017-10-03 15:00:46	\N	\N	\N	\N
6240	607	13	1	2017-10-03 15:01:28	\N	\N	\N	\N
6238	622	13	1	2017-10-03 15:01:49	\N	\N	\N	\N
6197	595	13	1	2017-10-03 15:01:55	\N	\N	\N	\N
6254	613	13	1	2017-10-04 15:22:50	\N	\N	\N	\N
6191	224	13	1	2017-10-03 15:02:58	\N	\N	\N	\N
6227	620	13	1	2017-10-03 15:04:34	\N	\N	\N	\N
6233	605	13	1	2017-10-03 15:05:55	\N	\N	\N	\N
6239	616	13	1	2017-10-03 15:06:49	\N	\N	\N	\N
6143	3	13	1	2017-10-03 15:06:57	\N	\N	\N	\N
6205	80	13	1	2017-10-03 15:12:04	\N	\N	\N	\N
6153	560	13	1	2017-10-03 15:13:46	\N	\N	\N	\N
6246	529	13	1	2017-10-03 15:14:07	\N	\N	\N	\N
6171	38	13	1	2017-10-03 15:15:09	\N	\N	\N	\N
6175	260	13	1	2017-10-03 15:16:03	\N	\N	\N	\N
6270	750	13	1	2017-10-03 15:16:49	\N	\N	\N	\N
6150	358	13	1	2017-10-03 15:17:17	\N	\N	\N	\N
6169	711	13	1	2017-10-03 15:17:38	\N	\N	\N	\N
6192	320	13	1	2017-10-03 15:20:43	\N	\N	\N	\N
6204	584	13	1	2017-10-03 15:22:01	\N	\N	\N	\N
6236	532	13	1	2017-10-03 15:23:13	\N	\N	\N	\N
6235	465	13	1	2017-10-03 15:23:55	\N	\N	\N	\N
6162	710	13	1	2017-10-03 15:27:56	\N	\N	\N	\N
6247	601	13	1	2017-10-03 15:34:33	\N	\N	\N	\N
6207	589	13	1	2017-10-03 15:41:41	\N	\N	\N	\N
6258	694	13	1	2017-10-03 15:44:04	\N	\N	\N	\N
6221	162	13	1	2017-10-03 16:16:53	\N	\N	\N	\N
6184	456	13	1	2017-10-04 08:24:30	\N	\N	\N	\N
6158	672	13	1	2017-10-04 08:30:52	\N	\N	\N	\N
6248	610	13	1	2017-10-04 09:06:11	\N	\N	\N	\N
6225	592	13	1	2017-10-04 09:08:36	\N	\N	\N	\N
6252	749	13	1	2017-10-04 09:11:27	\N	\N	\N	\N
6165	747	13	1	2017-10-04 09:11:42	\N	\N	\N	\N
6214	598	13	1	2017-10-04 09:13:51	\N	\N	\N	\N
6263	651	13	1	2017-10-04 09:16:21	\N	\N	\N	\N
6256	713	13	1	2017-10-04 09:17:10	\N	\N	\N	\N
6259	599	13	1	2017-10-04 09:18:13	\N	\N	\N	\N
6149	549	13	1	2017-10-04 09:35:34	\N	\N	\N	\N
6253	604	13	1	2017-10-04 09:45:20	\N	\N	\N	\N
6180	500	13	1	2017-10-04 10:54:02	\N	\N	\N	\N
6152	495	13	1	2017-10-04 11:13:00	\N	\N	\N	\N
6146	525	13	1	2017-10-04 11:13:16	\N	\N	\N	\N
6178	249	13	1	2017-10-04 13:34:56	\N	\N	\N	\N
6217	591	13	1	2017-10-04 15:32:15	\N	\N	\N	\N
6206	586	13	1	2017-10-04 15:42:02	\N	\N	\N	\N
6213	594	13	1	2017-10-05 08:04:26	\N	\N	\N	\N
6234	614	13	1	2017-10-05 08:17:36	\N	\N	\N	\N
6185	77	13	1	2017-10-05 10:26:01	\N	\N	\N	\N
6181	239	13	1	2017-10-05 10:40:55	\N	\N	\N	\N
6194	590	13	1	2017-10-06 08:22:59	\N	\N	\N	\N
6261	617	13	1	2017-10-06 10:17:32	\N	\N	\N	\N
6237	621	13	1	2017-10-06 10:17:46	\N	\N	\N	\N
6262	603	13	1	2017-10-06 10:18:16	\N	\N	\N	\N
6230	609	13	1	2017-10-06 10:18:28	\N	\N	\N	\N
6257	608	13	1	2017-10-06 15:51:39	\N	\N	\N	\N
6299	838	13	0	\N	\N	\N	\N	\N
6300	839	13	0	\N	\N	\N	\N	\N
6301	753	13	0	\N	\N	\N	\N	\N
6304	572	13	0	\N	\N	\N	\N	\N
6309	840	13	0	\N	\N	\N	\N	\N
6310	841	13	0	\N	\N	\N	\N	\N
6313	813	13	0	\N	\N	\N	\N	\N
6314	814	13	0	\N	\N	\N	\N	\N
6315	815	13	0	\N	\N	\N	\N	\N
6316	816	13	0	\N	\N	\N	\N	\N
6318	817	13	0	\N	\N	\N	\N	\N
6319	818	13	0	\N	\N	\N	\N	\N
6320	819	13	0	\N	\N	\N	\N	\N
6321	820	13	0	\N	\N	\N	\N	\N
6327	612	13	0	\N	\N	\N	\N	\N
6329	290	13	0	\N	\N	\N	\N	\N
6332	849	13	0	\N	\N	\N	\N	\N
6334	850	13	0	\N	\N	\N	\N	\N
6342	275	13	0	\N	\N	\N	\N	\N
6343	852	13	0	\N	\N	\N	\N	\N
6346	853	13	0	\N	\N	\N	\N	\N
6349	842	13	0	\N	\N	\N	\N	\N
6350	843	13	0	\N	\N	\N	\N	\N
6351	844	13	0	\N	\N	\N	\N	\N
6352	845	13	0	\N	\N	\N	\N	\N
6353	846	13	0	\N	\N	\N	\N	\N
6356	847	13	0	\N	\N	\N	\N	\N
6359	235	13	0	\N	\N	\N	\N	\N
6361	374	13	0	\N	\N	\N	\N	\N
6362	253	13	0	\N	\N	\N	\N	\N
6364	466	13	0	\N	\N	\N	\N	\N
6365	860	13	0	\N	\N	\N	\N	\N
6368	372	13	0	\N	\N	\N	\N	\N
6370	233	13	0	\N	\N	\N	\N	\N
6375	304	13	0	\N	\N	\N	\N	\N
6378	863	13	0	\N	\N	\N	\N	\N
6379	864	13	0	\N	\N	\N	\N	\N
6382	854	13	0	\N	\N	\N	\N	\N
6383	856	13	0	\N	\N	\N	\N	\N
6388	261	13	0	\N	\N	\N	\N	\N
6389	376	13	0	\N	\N	\N	\N	\N
6390	868	13	0	\N	\N	\N	\N	\N
6391	876	13	0	\N	\N	\N	\N	\N
6408	877	13	0	\N	\N	\N	\N	\N
6414	303	13	0	\N	\N	\N	\N	\N
6415	735	13	0	\N	\N	\N	\N	\N
6416	865	13	0	\N	\N	\N	\N	\N
6419	870	13	0	\N	\N	\N	\N	\N
6420	871	13	0	\N	\N	\N	\N	\N
6421	762	13	0	\N	\N	\N	\N	\N
6422	812	13	0	\N	\N	\N	\N	\N
6432	764	13	0	\N	\N	\N	\N	\N
6439	855	13	0	\N	\N	\N	\N	\N
6445	878	13	0	\N	\N	\N	\N	\N
6425	74	13	1	2017-10-03 13:48:17	\N	\N	\N	\N
6302	623	13	1	2017-10-04 14:20:39	\N	\N	\N	\N
6424	541	13	1	2017-10-03 13:50:09	\N	\N	\N	\N
6371	704	13	1	2017-10-03 13:52:56	\N	\N	\N	\N
6448	103	13	1	2017-10-03 13:53:58	\N	\N	\N	\N
6392	176	13	1	2017-10-03 13:54:19	\N	\N	\N	\N
6323	558	13	1	2017-10-03 13:56:11	\N	\N	\N	\N
6412	490	13	1	2017-10-03 13:56:45	\N	\N	\N	\N
6374	736	13	1	2017-10-03 13:57:52	\N	\N	\N	\N
6406	130	13	1	2017-10-03 13:58:01	\N	\N	\N	\N
6396	587	13	1	2017-10-03 14:00:05	\N	\N	\N	\N
6303	585	13	1	2017-10-03 14:00:12	\N	\N	\N	\N
6397	448	13	1	2017-10-03 14:02:03	\N	\N	\N	\N
6401	544	13	1	2017-10-03 14:03:14	\N	\N	\N	\N
6308	417	13	1	2017-10-03 14:05:00	\N	\N	\N	\N
6355	294	13	1	2017-10-03 14:06:07	\N	\N	\N	\N
6344	743	13	1	2017-10-03 14:09:33	\N	\N	\N	\N
6442	733	13	1	2017-10-03 14:11:52	\N	\N	\N	\N
6399	150	13	1	2017-10-03 14:13:00	\N	\N	\N	\N
6398	458	13	1	2017-10-03 14:14:05	\N	\N	\N	\N
6428	65	13	1	2017-10-03 14:14:49	\N	\N	\N	\N
6430	439	13	1	2017-10-03 14:16:49	\N	\N	\N	\N
6423	726	13	1	2017-10-03 14:22:31	\N	\N	\N	\N
6413	698	13	1	2017-10-03 14:22:47	\N	\N	\N	\N
6410	367	13	1	2017-10-03 14:26:29	\N	\N	\N	\N
6307	751	13	1	2017-10-03 14:33:35	\N	\N	\N	\N
6341	468	13	1	2017-10-03 14:35:17	\N	\N	\N	\N
6418	187	13	1	2017-10-03 14:35:42	\N	\N	\N	\N
6328	405	13	1	2017-10-03 14:36:31	\N	\N	\N	\N
6427	349	13	1	2017-10-03 14:37:02	\N	\N	\N	\N
6441	206	13	1	2017-10-03 14:37:15	\N	\N	\N	\N
6333	716	13	1	2017-10-03 14:38:07	\N	\N	\N	\N
6336	282	13	1	2017-10-03 14:40:16	\N	\N	\N	\N
6447	335	13	1	2017-10-03 14:42:03	\N	\N	\N	\N
6444	446	13	1	2017-10-03 14:42:58	\N	\N	\N	\N
6385	265	13	1	2017-10-03 14:43:40	\N	\N	\N	\N
6348	383	13	1	2017-10-03 14:48:50	\N	\N	\N	\N
6403	135	13	1	2017-10-03 14:49:16	\N	\N	\N	\N
6330	357	13	1	2017-10-03 14:58:09	\N	\N	\N	\N
6380	212	13	1	2017-10-03 14:59:11	\N	\N	\N	\N
6376	223	13	1	2017-10-03 15:00:09	\N	\N	\N	\N
6450	95	13	1	2017-10-03 15:01:19	\N	\N	\N	\N
6446	113	13	1	2017-10-03 15:03:05	\N	\N	\N	\N
6454	276	13	1	2017-10-03 15:03:37	\N	\N	\N	\N
6366	243	13	1	2017-10-03 15:08:00	\N	\N	\N	\N
6417	866	13	1	2017-10-03 15:08:17	\N	\N	\N	\N
6386	577	13	1	2017-10-03 15:08:40	\N	\N	\N	\N
6453	331	13	1	2017-10-03 15:09:08	\N	\N	\N	\N
6409	122	13	1	2017-10-03 15:14:51	\N	\N	\N	\N
6373	227	13	1	2017-10-03 15:21:01	\N	\N	\N	\N
6338	281	13	1	2017-10-03 15:21:15	\N	\N	\N	\N
6367	861	13	1	2017-10-03 15:28:12	\N	\N	\N	\N
6404	579	13	1	2017-10-03 15:36:50	\N	\N	\N	\N
6381	209	13	1	2017-10-03 15:39:05	\N	\N	\N	\N
6433	675	13	1	2017-10-03 15:39:21	\N	\N	\N	\N
6326	848	13	1	2017-10-03 15:43:08	\N	\N	\N	\N
6455	708	13	1	2017-10-03 15:46:04	\N	\N	\N	\N
6435	312	13	1	2017-10-03 15:58:17	\N	\N	\N	\N
6357	411	13	1	2017-10-03 15:58:36	\N	\N	\N	\N
6405	513	13	1	2017-10-04 08:25:18	\N	\N	\N	\N
6449	507	13	1	2017-10-04 08:27:03	\N	\N	\N	\N
6411	689	13	1	2017-10-04 08:33:34	\N	\N	\N	\N
6339	679	13	1	2017-10-04 08:35:15	\N	\N	\N	\N
6452	882	13	1	2017-10-04 08:36:32	\N	\N	\N	\N
6347	553	13	1	2017-10-04 09:14:18	\N	\N	\N	\N
6363	563	13	1	2017-10-04 09:14:46	\N	\N	\N	\N
6393	171	13	1	2017-10-04 09:51:01	\N	\N	\N	\N
6440	221	13	1	2017-10-04 09:53:00	\N	\N	\N	\N
6377	418	13	1	2017-10-04 10:58:05	\N	\N	\N	\N
6312	481	13	1	2017-10-04 11:00:15	\N	\N	\N	\N
6311	566	13	1	2017-10-04 11:08:56	\N	\N	\N	\N
6437	327	13	1	2017-10-04 11:11:17	\N	\N	\N	\N
6436	479	13	1	2017-10-04 11:16:39	\N	\N	\N	\N
6322	718	13	1	2017-10-04 11:17:15	\N	\N	\N	\N
6317	561	13	1	2017-10-04 11:18:51	\N	\N	\N	\N
6325	719	13	1	2017-10-04 11:21:13	\N	\N	\N	\N
6305	596	13	1	2017-10-04 15:22:35	\N	\N	\N	\N
6360	259	13	1	2017-10-05 09:25:47	\N	\N	\N	\N
6438	396	13	1	2017-10-05 09:26:15	\N	\N	\N	\N
6337	715	13	1	2017-10-06 15:16:53	\N	\N	\N	\N
6354	720	13	1	2017-10-09 14:10:03	\N	\N	\N	\N
6464	885	13	0	\N	\N	\N	\N	\N
6465	886	13	0	\N	\N	\N	\N	\N
6466	887	13	0	\N	\N	\N	\N	\N
6470	891	13	0	\N	\N	\N	\N	\N
6474	895	13	0	\N	\N	\N	\N	\N
6476	884	13	0	\N	\N	\N	\N	\N
5851	231	13	1	2017-10-03 11:58:11	\N	\N	\N	\N
6060	499	13	1	2017-10-03 13:43:23	\N	\N	\N	\N
6044	464	13	1	2017-10-03 13:43:32	\N	\N	\N	\N
6402	454	13	1	2017-10-03 13:44:40	\N	\N	\N	\N
5770	699	13	1	2017-10-03 13:45:59	\N	\N	\N	\N
5845	217	13	1	2017-10-03 13:46:28	\N	\N	\N	\N
5811	178	13	1	2017-10-03 13:46:36	\N	\N	\N	\N
6091	690	13	1	2017-10-03 13:47:22	\N	\N	\N	\N
6426	442	13	1	2017-10-03 13:47:33	\N	\N	\N	\N
6272	4	13	1	2017-10-03 13:48:51	\N	\N	\N	\N
6174	557	13	1	2017-10-03 13:48:59	\N	\N	\N	\N
6067	494	13	1	2017-10-03 13:49:53	\N	\N	\N	\N
5752	128	13	1	2017-10-03 13:51:41	\N	\N	\N	\N
6114	531	13	1	2017-10-03 13:52:49	\N	\N	\N	\N
6154	524	13	1	2017-10-03 13:53:03	\N	\N	\N	\N
6400	149	13	1	2017-10-03 13:53:47	\N	\N	\N	\N
6456	226	13	1	2017-10-03 13:54:41	\N	\N	\N	\N
6023	445	13	1	2017-10-03 13:54:58	\N	\N	\N	\N
6030	429	13	1	2017-10-03 13:55:44	\N	-3	\N	\N
5654	26	13	1	2017-10-03 13:56:24	\N	\N	\N	\N
6345	471	13	1	2017-10-03 13:56:54	\N	\N	\N	\N
6061	483	13	1	2017-10-03 13:57:45	\N	\N	\N	\N
5980	420	13	1	2017-10-03 13:58:29	\N	\N	\N	\N
6468	889	13	1	2017-10-03 13:59:57	\N	\N	\N	\N
6461	137	13	1	2017-10-03 14:00:32	\N	\N	\N	\N
6431	57	13	1	2017-10-03 14:00:42	\N	\N	\N	\N
5690	92	13	1	2017-10-03 14:01:07	\N	\N	\N	\N
5768	104	13	1	2017-10-03 14:02:53	\N	\N	\N	\N
6232	427	13	1	2017-10-03 14:03:00	\N	\N	\N	\N
6459	516	13	1	2017-10-03 14:05:32	\N	\N	\N	\N
6129	571	13	1	2017-10-03 14:05:49	\N	\N	\N	\N
5905	314	13	1	2017-10-03 14:07:39	\N	\N	\N	\N
6372	463	13	1	2017-10-03 14:08:26	\N	\N	\N	\N
5666	30	13	1	2017-10-03 14:09:26	\N	\N	\N	\N
5892	297	13	1	2017-10-03 14:09:53	\N	\N	\N	\N
6106	546	13	1	2017-10-03 14:11:41	\N	\N	\N	\N
5694	673	13	1	2017-10-03 14:13:15	\N	\N	\N	\N
6324	475	13	1	2017-10-03 14:14:27	\N	\N	\N	\N
6462	684	13	1	2017-10-03 14:15:39	\N	\N	\N	\N
6051	452	13	1	2017-10-03 14:15:49	\N	\N	\N	\N
5864	356	13	1	2017-10-03 14:18:31	\N	\N	\N	\N
6469	890	13	1	2017-10-03 14:19:14	\N	\N	\N	\N
6141	123	13	1	2017-10-03 14:21:27	\N	\N	\N	\N
5731	78	13	1	2017-10-03 14:21:35	\N	\N	\N	\N
6269	731	13	1	2017-10-03 14:22:55	\N	\N	\N	\N
5918	300	13	1	2017-10-03 14:24:00	\N	\N	\N	\N
6384	497	13	1	2017-10-03 14:24:35	\N	\N	\N	\N
5758	120	13	1	2017-10-03 14:25:47	\N	\N	\N	\N
5953	705	13	1	2017-10-03 14:26:00	\N	\N	\N	\N
6167	369	13	1	2017-10-03 14:26:09	\N	\N	\N	\N
6460	164	13	1	2017-10-03 14:26:42	\N	\N	\N	\N
6076	482	13	1	2017-10-03 14:29:18	\N	\N	\N	\N
5814	700	13	1	2017-10-03 14:30:11	\N	\N	\N	\N
5947	385	13	1	2017-10-03 14:30:17	\N	\N	\N	\N
6101	535	13	1	2017-10-03 14:32:23	\N	\N	\N	\N
5968	686	13	1	2017-10-03 14:33:21	\N	\N	\N	\N
5747	84	13	1	2017-10-03 14:34:17	\N	\N	\N	\N
6186	391	13	1	2017-10-03 14:35:02	\N	\N	\N	\N
6118	342	13	1	2017-10-03 14:35:32	\N	\N	\N	\N
6429	64	13	1	2017-10-03 14:36:11	\N	\N	\N	\N
5936	313	13	1	2017-10-03 14:38:24	\N	\N	\N	\N
5748	76	13	1	2017-10-03 14:38:36	\N	\N	\N	\N
6331	403	13	1	2017-10-03 14:38:57	\N	\N	\N	\N
5877	263	13	1	2017-10-03 14:40:55	\N	\N	\N	\N
5826	179	13	1	2017-10-03 14:41:03	\N	\N	\N	\N
5920	332	13	1	2017-10-03 14:42:14	\N	\N	\N	\N
6005	395	13	1	2017-10-03 14:44:10	\N	\N	\N	\N
5664	62	13	1	2017-10-03 14:44:24	\N	\N	\N	\N
5857	274	13	1	2017-10-03 14:45:40	\N	\N	\N	\N
5793	147	13	1	2017-10-03 14:45:50	\N	\N	\N	\N
6210	597	13	1	2017-10-03 14:46:47	\N	\N	\N	\N
5927	330	13	1	2017-10-03 14:47:19	\N	\N	\N	\N
6434	341	13	1	2017-10-03 14:48:29	\N	\N	\N	\N
5795	676	13	1	2017-10-03 14:49:30	\N	\N	\N	\N
5969	359	13	1	2017-10-03 14:50:18	\N	\N	\N	\N
6473	894	13	1	2017-10-03 14:52:28	\N	\N	\N	\N
6223	593	13	1	2017-10-03 14:52:52	\N	\N	\N	\N
5730	131	13	1	2017-10-03 14:54:09	\N	\N	\N	\N
5891	316	13	1	2017-10-03 14:54:28	\N	\N	\N	\N
6463	100	13	1	2017-10-03 14:55:46	\N	\N	\N	\N
6131	565	13	1	2017-10-03 14:56:06	\N	\N	\N	\N
5831	188	13	1	2017-10-03 14:57:39	\N	\N	\N	\N
5684	10	13	1	2017-10-03 14:58:02	\N	\N	\N	\N
6306	752	13	1	2017-10-03 14:59:26	\N	\N	\N	\N
5789	140	13	1	2017-10-03 14:59:40	\N	\N	\N	\N
6457	225	13	1	2017-10-03 15:00:58	\N	\N	\N	\N
6195	582	13	1	2017-10-03 15:01:37	\N	\N	\N	\N
5964	388	13	1	2017-10-03 15:03:26	\N	\N	\N	\N
6177	35	13	1	2017-10-03 15:03:50	\N	\N	\N	\N
5705	40	13	1	2017-10-03 15:04:22	\N	\N	\N	\N
6443	37	13	1	2017-10-03 15:06:14	\N	\N	\N	\N
6020	504	13	1	2017-10-03 15:07:29	\N	\N	\N	\N
5855	238	13	1	2017-10-03 15:08:25	\N	\N	\N	\N
5719	50	13	1	2017-10-03 15:08:33	\N	\N	\N	\N
6172	667	13	1	2017-10-03 15:10:07	\N	\N	\N	\N
6394	163	13	1	2017-10-03 15:12:32	\N	\N	\N	\N
5894	319	13	1	2017-10-03 15:13:38	\N	\N	\N	\N
5809	152	13	1	2017-10-03 15:14:29	\N	\N	\N	\N
6216	154	13	1	2017-10-03 15:15:17	\N	\N	\N	\N
6241	611	13	1	2017-10-03 15:18:20	\N	\N	\N	\N
6475	883	13	1	2017-10-03 15:19:04	\N	\N	\N	\N
5725	132	13	1	2017-10-03 15:20:54	\N	\N	\N	\N
6160	554	13	1	2017-10-03 15:25:31	\N	\N	\N	\N
6022	457	13	1	2017-10-03 15:27:43	\N	\N	\N	\N
6340	714	13	1	2017-10-03 15:29:11	\N	\N	\N	\N
5879	272	13	1	2017-10-03 15:31:35	\N	\N	\N	\N
5683	60	13	1	2017-10-03 15:31:48	\N	\N	\N	\N
5853	250	13	1	2017-10-03 15:33:30	\N	\N	\N	\N
5813	157	13	1	2017-10-03 15:34:16	\N	\N	\N	\N
5656	14	13	1	2017-10-03 15:42:25	\N	\N	\N	\N
5701	43	13	1	2017-10-03 15:42:39	\N	\N	\N	\N
6387	380	13	1	2017-10-03 15:44:39	\N	\N	\N	\N
5948	361	13	1	2017-10-03 15:46:42	\N	\N	\N	\N
6472	893	13	1	2017-10-03 15:48:16	\N	\N	\N	\N
6209	712	13	1	2017-10-03 15:58:59	\N	\N	\N	\N
6087	501	13	1	2017-10-03 16:00:30	\N	\N	\N	\N
5682	696	13	1	2017-10-03 16:03:02	\N	\N	\N	\N
5867	280	13	1	2017-10-04 08:24:49	\N	\N	\N	\N
6033	444	13	1	2017-10-04 08:25:32	\N	\N	\N	\N
6358	551	13	1	2017-10-04 08:26:48	\N	\N	\N	0
5996	412	13	1	2017-10-04 09:07:01	\N	\N	\N	\N
6229	615	13	1	2017-10-04 09:08:19	\N	\N	\N	\N
6467	888	13	1	2017-10-04 09:11:01	\N	\N	\N	\N
6451	506	13	1	2017-10-04 09:13:09	\N	\N	\N	\N
5802	146	13	1	2017-10-04 09:13:33	\N	\N	\N	\N
6268	308	13	1	2017-10-04 09:14:35	\N	\N	\N	\N
5849	234	13	1	2017-10-04 09:28:03	\N	\N	\N	\N
5817	202	13	1	2017-10-04 09:30:58	\N	\N	\N	\N
6471	892	13	1	2017-10-04 09:35:04	\N	\N	\N	\N
6202	588	13	1	2017-10-04 09:44:53	\N	\N	\N	\N
6369	240	13	1	2017-10-04 09:53:25	\N	\N	\N	\N
5994	399	13	1	2017-10-04 10:17:22	\N	\N	\N	\N
6059	476	13	1	2017-10-04 11:14:10	\N	\N	\N	\N
6335	851	13	1	2017-10-04 11:14:25	\N	\N	\N	\N
5696	678	13	1	2017-10-04 11:14:39	\N	\N	\N	\N
6155	564	13	1	2017-10-04 11:16:57	\N	\N	\N	\N
6098	537	13	1	2017-10-04 11:19:49	\N	\N	\N	\N
5726	124	13	1	2017-10-04 13:24:05	\N	\N	\N	\N
5897	703	13	1	2017-10-04 13:35:43	\N	\N	\N	\N
6477	896	13	1	2017-10-04 13:41:38	\N	\N	\N	\N
6047	432	13	1	2017-10-04 14:40:40	\N	\N	\N	\N
6407	875	13	1	2017-10-04 15:08:33	\N	\N	\N	\N
6228	600	13	1	2017-10-05 08:06:12	\N	\N	\N	\N
6482	897	13	0	\N	\N	\N	\N	\N
6481	899	13	1	2017-10-05 15:29:02	\N	\N	\N	\N
6479	900	13	1	2017-10-05 15:29:22	\N	\N	\N	\N
6480	898	13	1	2017-10-05 15:30:15	\N	\N	\N	\N
6293	602	13	1	2017-10-06 09:42:02	\N	\N	\N	\N
6265	652	13	1	2017-10-06 10:36:04	\N	\N	\N	\N
6107	539	13	1	2017-10-09 10:10:51	\N	\N	\N	\N
6484	29	14	0	\N	\N	\N	\N	\N
6487	28	14	0	\N	\N	\N	\N	\N
6493	16	14	0	\N	\N	\N	\N	\N
6503	9	14	0	\N	\N	\N	\N	\N
6504	808	14	0	\N	\N	\N	\N	\N
6505	19	14	0	\N	\N	\N	\N	\N
6506	885	14	0	\N	\N	\N	\N	\N
6509	755	14	0	\N	\N	\N	\N	\N
6510	1	14	0	\N	\N	\N	\N	\N
6512	15	14	0	\N	\N	\N	\N	\N
6524	759	14	0	\N	\N	\N	\N	\N
6526	756	14	0	\N	\N	\N	\N	\N
6527	41	14	0	\N	\N	\N	\N	\N
6537	758	14	0	\N	\N	\N	\N	\N
6539	757	14	0	\N	\N	\N	\N	\N
6543	53	14	0	\N	\N	\N	\N	\N
6544	678	14	0	\N	\N	\N	\N	\N
6549	96	14	0	\N	\N	\N	\N	\N
6554	674	14	0	\N	\N	\N	\N	\N
6566	59	14	0	\N	\N	\N	\N	\N
6572	86	14	0	\N	\N	\N	\N	\N
6577	69	14	0	\N	\N	\N	\N	\N
6581	126	14	0	\N	\N	\N	\N	\N
6589	160	14	0	\N	\N	\N	\N	\N
6591	107	14	0	\N	\N	\N	\N	\N
6610	117	14	0	\N	\N	\N	\N	\N
6613	754	14	0	\N	\N	\N	\N	\N
6523	45	14	1	2017-10-10 09:02:49	\N	\N	\N	\N
6602	106	14	1	2017-10-10 09:11:03	\N	\N	\N	\N
6608	102	14	1	2017-10-10 09:12:36	\N	\N	\N	\N
6552	97	14	1	2017-10-10 09:14:40	\N	\N	\N	\N
6488	6	14	1	2017-10-10 09:14:52	\N	\N	\N	\N
6494	62	14	1	2017-10-10 09:16:45	\N	\N	\N	\N
6569	121	14	1	2017-10-10 09:19:32	\N	\N	\N	\N
6563	129	14	1	2017-10-10 09:23:40	\N	\N	\N	\N
6592	168	14	1	2017-10-10 09:24:41	\N	\N	\N	\N
6605	170	14	1	2017-10-10 09:25:16	\N	\N	\N	\N
6522	89	14	1	2017-10-10 09:27:43	\N	\N	\N	\N
6548	101	14	1	2017-10-10 09:28:12	\N	\N	\N	\N
6514	14	14	1	2017-10-10 09:28:26	\N	\N	\N	\N
6570	81	14	1	2017-10-10 09:30:56	\N	\N	\N	\N
6568	85	14	1	2017-10-10 09:34:36	\N	\N	\N	\N
6579	134	14	1	2017-10-10 09:35:51	\N	\N	\N	\N
6490	900	14	1	2017-10-10 09:36:49	\N	\N	\N	\N
6583	78	14	1	2017-10-10 09:38:42	\N	\N	\N	\N
6561	58	14	1	2017-10-10 09:40:29	\N	\N	\N	\N
6496	26	14	1	2017-10-10 09:44:11	\N	\N	\N	\N
6560	82	14	1	2017-10-10 09:47:25	\N	\N	\N	\N
6545	50	14	1	2017-10-10 09:51:10	\N	\N	\N	\N
6604	119	14	1	2017-10-10 09:57:08	\N	\N	\N	\N
6529	47	14	1	2017-10-10 10:02:50	\N	\N	\N	\N
6612	159	14	1	2017-10-10 10:03:11	\N	\N	\N	\N
6556	73	14	1	2017-10-10 10:03:30	\N	\N	\N	\N
6518	25	14	1	2017-10-10 10:04:00	\N	\N	\N	\N
6606	140	14	1	2017-10-10 10:04:10	\N	\N	\N	\N
6525	36	14	1	2017-10-10 10:05:02	\N	\N	\N	\N
6547	46	14	1	2017-10-10 10:05:09	\N	\N	\N	\N
6593	138	14	1	2017-10-10 10:06:44	\N	\N	\N	\N
6551	94	14	1	2017-10-10 10:07:47	\N	\N	\N	\N
6550	48	14	1	2017-10-10 10:08:16	\N	\N	\N	\N
6541	93	14	1	2017-10-10 10:08:24	\N	\N	\N	\N
6590	116	14	1	2017-10-10 10:08:43	\N	\N	\N	\N
6513	732	14	1	2017-10-10 10:09:59	\N	\N	\N	\N
6495	27	14	1	2017-10-10 10:11:54	\N	\N	\N	\N
6611	112	14	1	2017-10-10 10:12:46	\N	\N	\N	\N
6483	12	14	1	2017-10-10 10:14:22	\N	\N	\N	\N
6491	5	14	1	2017-10-10 10:16:00	\N	\N	\N	\N
6497	24	14	1	2017-10-10 10:16:13	\N	\N	\N	\N
6498	30	14	1	2017-10-10 10:17:43	\N	\N	\N	\N
6516	13	14	1	2017-10-10 10:19:35	\N	\N	\N	\N
6553	87	14	1	2017-10-10 10:20:49	\N	\N	\N	\N
6599	165	14	1	2017-10-10 10:21:41	\N	\N	\N	\N
6565	125	14	1	2017-10-10 10:22:29	\N	\N	\N	\N
6598	136	14	1	2017-10-10 10:23:01	\N	\N	\N	\N
6517	8	14	1	2017-10-10 10:24:11	\N	\N	\N	\N
6536	673	14	1	2017-10-10 10:24:29	\N	\N	\N	\N
6538	98	14	1	2017-10-10 10:24:42	\N	\N	\N	\N
6576	66	14	1	2017-10-10 10:26:19	\N	\N	\N	\N
6609	120	14	1	2017-10-10 10:27:22	\N	\N	\N	\N
6521	697	14	1	2017-10-10 10:28:06	\N	\N	\N	\N
6607	114	14	1	2017-10-10 10:28:35	\N	\N	\N	\N
6540	671	14	1	2017-10-10 10:34:41	\N	\N	\N	\N
6489	17	14	1	2017-10-10 10:34:34	\N	\N	\N	\N
6600	118	14	1	2017-10-10 10:42:24	\N	\N	\N	\N
6559	67	14	1	2017-10-10 10:48:04	\N	\N	\N	\N
6532	40	14	1	2017-10-10 10:53:26	\N	\N	\N	\N
6585	75	14	1	2017-10-10 10:54:20	\N	\N	\N	\N
6533	44	14	1	2017-10-10 10:59:33	\N	\N	\N	\N
6528	52	14	1	2017-10-10 11:08:50	\N	\N	\N	\N
6555	83	14	1	2017-10-10 11:13:25	\N	\N	\N	\N
6511	23	14	1	2017-10-10 11:15:05	\N	\N	\N	\N
6595	105	14	1	2017-10-10 11:18:44	\N	\N	\N	\N
6535	90	14	1	2017-10-10 11:19:43	\N	\N	\N	\N
6584	72	14	1	2017-10-10 11:24:06	\N	\N	\N	\N
6507	172	14	1	2017-10-10 11:26:46	\N	\N	\N	\N
6573	132	14	1	2017-10-10 11:32:12	\N	\N	\N	\N
6520	51	14	1	2017-10-10 11:34:50	\N	\N	\N	\N
6564	124	14	1	2017-10-10 11:38:16	\N	\N	\N	\N
6562	131	14	1	2017-10-10 13:34:45	\N	\N	\N	\N
6578	717	14	1	2017-10-10 13:35:02	\N	\N	\N	\N
6596	169	14	1	2017-10-10 13:36:12	\N	\N	\N	\N
6574	84	14	1	2017-10-10 13:59:31	\N	\N	\N	\N
6508	21	14	1	2017-10-10 14:07:40	\N	\N	\N	\N
6601	111	14	1	2017-10-10 14:13:26	\N	\N	\N	\N
6586	76	14	1	2017-10-10 14:13:51	\N	\N	\N	\N
6501	22	14	1	2017-10-10 15:13:08	\N	\N	\N	\N
6594	680	14	1	2017-10-10 15:17:05	\N	\N	\N	\N
6575	68	14	1	2017-10-10 15:51:17	\N	\N	\N	\N
6530	43	14	1	2017-10-10 16:13:52	\N	\N	\N	\N
6614	760	14	0	\N	\N	\N	\N	\N
6616	109	14	0	\N	\N	\N	\N	\N
6617	108	14	0	\N	\N	\N	\N	\N
6619	166	14	0	\N	\N	\N	\N	\N
6621	763	14	0	\N	\N	\N	\N	\N
6625	174	14	0	\N	\N	\N	\N	\N
6640	142	14	0	\N	\N	\N	\N	\N
6643	156	14	0	\N	\N	\N	\N	\N
6644	152	14	0	\N	\N	\N	\N	\N
6651	207	14	0	\N	\N	\N	\N	\N
6653	656	14	0	\N	\N	\N	\N	\N
6654	655	14	0	\N	\N	\N	\N	\N
6657	194	14	0	\N	\N	\N	\N	\N
6665	192	14	0	\N	\N	\N	\N	\N
6666	190	14	0	\N	\N	\N	\N	\N
6669	186	14	0	\N	\N	\N	\N	\N
6672	180	14	0	\N	\N	\N	\N	\N
6674	737	14	0	\N	\N	\N	\N	\N
6680	809	14	0	\N	\N	\N	\N	\N
6688	683	14	0	\N	\N	\N	\N	\N
6691	252	14	0	\N	\N	\N	\N	\N
6698	273	14	0	\N	\N	\N	\N	\N
6699	39	14	0	\N	\N	\N	\N	\N
6703	267	14	0	\N	\N	\N	\N	\N
6706	256	14	0	\N	\N	\N	\N	\N
6715	241	14	0	\N	\N	\N	\N	\N
6719	739	14	0	\N	\N	\N	\N	\N
6720	309	14	0	\N	\N	\N	\N	\N
6721	283	14	0	\N	\N	\N	\N	\N
6722	286	14	0	\N	\N	\N	\N	\N
6724	285	14	0	\N	\N	\N	\N	\N
6737	305	14	0	\N	\N	\N	\N	\N
6739	287	14	0	\N	\N	\N	\N	\N
6740	278	14	0	\N	\N	\N	\N	\N
6744	298	14	0	\N	\N	\N	\N	\N
6746	334	14	0	\N	\N	\N	\N	\N
6750	345	14	0	\N	\N	\N	\N	\N
6753	328	14	0	\N	\N	\N	\N	\N
6763	889	14	0	\N	\N	\N	\N	\N
6766	351	14	0	\N	\N	\N	\N	\N
6769	338	14	0	\N	\N	\N	\N	\N
6635	178	14	1	2017-10-10 09:06:20	\N	\N	\N	\N
6748	302	14	1	2017-10-10 09:07:28	\N	\N	\N	\N
6734	292	14	1	2017-10-10 09:12:12	\N	\N	\N	\N
6762	353	14	1	2017-10-10 09:13:01	\N	\N	\N	\N
6633	198	14	1	2017-10-10 09:13:51	\N	\N	\N	\N
6756	322	14	1	2017-10-10 09:15:07	\N	\N	\N	\N
6639	158	14	1	2017-10-10 09:16:01	\N	\N	\N	\N
6770	337	14	1	2017-10-10 09:16:53	\N	\N	\N	\N
6733	703	14	1	2017-10-10 09:17:21	\N	\N	\N	\N
6647	676	14	1	2017-10-10 09:17:28	\N	\N	\N	\N
6686	245	14	1	2017-10-10 09:17:53	\N	\N	\N	\N
6683	33	14	1	2017-10-10 09:22:05	\N	\N	\N	\N
6690	268	14	1	2017-10-10 09:24:01	\N	\N	\N	\N
6626	155	14	1	2017-10-10 09:24:52	\N	\N	\N	\N
6632	157	14	1	2017-10-10 09:26:53	\N	\N	\N	\N
6685	266	14	1	2017-10-10 09:27:56	\N	\N	\N	\N
6723	316	14	1	2017-10-10 09:28:35	\N	\N	\N	\N
6684	272	14	1	2017-10-10 09:31:46	\N	\N	\N	\N
6747	330	14	1	2017-10-10 09:32:14	\N	\N	\N	\N
6717	262	14	1	2017-10-10 09:34:20	\N	\N	\N	\N
6711	279	14	1	2017-10-10 09:36:14	\N	\N	\N	\N
6710	228	14	1	2017-10-10 09:37:27	\N	\N	\N	\N
6630	202	14	1	2017-10-10 09:40:39	\N	\N	\N	\N
6752	344	14	1	2017-10-10 09:40:46	\N	\N	\N	\N
6652	230	14	1	2017-10-10 09:41:20	\N	\N	\N	\N
6668	213	14	1	2017-10-10 09:41:32	\N	\N	\N	\N
6692	888	14	1	2017-10-10 09:47:32	\N	\N	\N	\N
6716	238	14	1	2017-10-10 09:47:40	\N	\N	\N	\N
6649	146	14	1	2017-10-10 09:50:19	\N	\N	\N	\N
6749	740	14	1	2017-10-10 09:52:18	\N	\N	\N	\N
6676	214	14	1	2017-10-10 09:53:18	\N	\N	\N	\N
6718	295	14	1	2017-10-10 09:56:20	\N	\N	\N	\N
6700	280	14	1	2017-10-10 09:58:17	\N	\N	\N	\N
6743	251	14	1	2017-10-10 10:02:18	\N	\N	\N	\N
6761	355	14	1	2017-10-10 10:03:01	\N	\N	\N	\N
6620	199	14	1	2017-10-10 10:05:30	\N	\N	\N	\N
6707	702	14	1	2017-10-10 10:06:59	\N	\N	\N	\N
6758	313	14	1	2017-10-10 10:09:17	\N	\N	\N	\N
6641	681	14	1	2017-10-10 10:09:48	\N	\N	\N	\N
6655	701	14	1	2017-10-10 10:10:29	\N	\N	\N	\N
6673	217	14	1	2017-10-10 10:11:46	\N	\N	\N	\N
6648	147	14	1	2017-10-10 10:12:56	\N	\N	\N	\N
6671	215	14	1	2017-10-10 10:13:09	\N	\N	\N	\N
6754	18	14	1	2017-10-10 10:14:38	\N	\N	\N	\N
6615	110	14	1	2017-10-10 10:19:45	\N	\N	\N	\N
6705	219	14	1	2017-10-10 10:20:28	\N	\N	\N	\N
6709	738	14	1	2017-10-10 10:20:39	\N	\N	\N	\N
6693	263	14	1	2017-10-10 10:21:05	\N	\N	\N	\N
6636	144	14	1	2017-10-10 10:22:15	\N	\N	\N	\N
6725	314	14	1	2017-10-10 10:23:14	\N	\N	\N	\N
6745	329	14	1	2017-10-10 10:23:28	\N	\N	\N	\N
6660	188	14	1	2017-10-10 10:23:38	\N	\N	\N	\N
6667	183	14	1	2017-10-10 10:26:07	\N	\N	\N	\N
6726	297	14	1	2017-10-10 10:26:27	\N	\N	\N	\N
6650	143	14	1	2017-10-10 10:27:34	\N	\N	\N	\N
6634	196	14	1	2017-10-10 10:27:58	\N	\N	\N	\N
6768	300	14	1	2017-10-10 10:29:02	\N	\N	\N	\N
6751	325	14	1	2017-10-10 10:29:27	\N	\N	\N	\N
6638	208	14	1	2017-10-10 10:29:57	\N	\N	\N	\N
6662	222	14	1	2017-10-10 10:30:32	\N	\N	\N	\N
6735	288	14	1	2017-10-10 10:33:04	\N	\N	\N	\N
6679	185	14	1	2017-10-10 10:34:52	\N	\N	\N	\N
6731	721	14	1	2017-10-10 10:36:01	\N	\N	\N	\N
6687	220	14	1	2017-10-10 10:36:59	\N	\N	\N	\N
6760	352	14	1	2017-10-10 10:42:55	\N	\N	\N	\N
6658	234	14	1	2017-10-10 10:44:04	\N	\N	\N	\N
6637	175	14	1	2017-10-10 10:44:14	\N	\N	\N	\N
6664	218	14	1	2017-10-10 10:45:56	\N	\N	\N	\N
6695	274	14	1	2017-10-10 10:53:37	\N	\N	\N	\N
6696	250	14	1	2017-10-10 10:54:36	\N	\N	\N	\N
6708	356	14	1	2017-10-10 11:00:04	\N	\N	\N	\N
6767	685	14	1	2017-10-10 11:00:18	\N	\N	\N	\N
6714	277	14	1	2017-10-10 11:08:09	\N	\N	\N	\N
6628	141	14	1	2017-10-10 11:08:38	\N	\N	\N	\N
6681	184	14	1	2017-10-10 11:13:35	\N	\N	\N	\N
6645	151	14	1	2017-10-10 11:17:20	\N	\N	\N	\N
6741	257	14	1	2017-10-10 11:32:22	\N	\N	\N	\N
6623	204	14	1	2017-10-10 11:32:40	\N	\N	\N	\N
6736	307	14	1	2017-10-10 14:01:06	\N	\N	\N	\N
6631	203	14	1	2017-10-10 14:03:24	\N	\N	\N	\N
6755	343	14	1	2017-10-10 14:05:31	\N	\N	\N	\N
6704	247	14	1	2017-10-10 14:13:13	\N	\N	\N	\N
6701	270	14	1	2017-10-10 14:16:32	\N	\N	\N	\N
6661	216	14	1	2017-10-10 14:16:55	\N	\N	\N	\N
6729	319	14	1	2017-10-10 14:24:30	\N	\N	\N	\N
6629	153	14	1	2017-10-10 14:25:50	\N	\N	\N	\N
6742	255	14	1	2017-10-10 14:51:26	\N	\N	\N	\N
6697	248	14	1	2017-10-10 15:05:53	\N	\N	\N	\N
6728	293	14	1	2017-10-10 16:13:41	\N	\N	\N	\N
6659	181	14	1	2017-10-10 16:14:15	\N	\N	\N	\N
6757	354	14	1	2017-10-10 16:14:25	\N	\N	\N	\N
6727	289	14	1	2017-10-10 16:14:36	\N	\N	\N	\N
6772	333	14	0	\N	\N	\N	\N	\N
6777	346	14	0	\N	\N	\N	\N	\N
6780	378	14	0	\N	\N	\N	\N	\N
6782	377	14	0	\N	\N	\N	\N	\N
6785	722	14	0	\N	\N	\N	\N	\N
6786	365	14	0	\N	\N	\N	\N	\N
6788	890	14	0	\N	\N	\N	\N	\N
6790	371	14	0	\N	\N	\N	\N	\N
6793	379	14	0	\N	\N	\N	\N	\N
6799	741	14	0	\N	\N	\N	\N	\N
6810	770	14	0	\N	\N	\N	\N	\N
6811	775	14	0	\N	\N	\N	\N	\N
6814	422	14	0	\N	\N	\N	\N	\N
6817	407	14	0	\N	\N	\N	\N	\N
6821	413	14	0	\N	\N	\N	\N	\N
6823	723	14	0	\N	\N	\N	\N	\N
6825	394	14	0	\N	\N	\N	\N	\N
6826	401	14	0	\N	\N	\N	\N	\N
6827	777	14	0	\N	\N	\N	\N	\N
6835	420	14	0	\N	\N	\N	\N	\N
6837	397	14	0	\N	\N	\N	\N	\N
6838	408	14	0	\N	\N	\N	\N	\N
6840	772	14	0	\N	\N	\N	\N	\N
6841	742	14	0	\N	\N	\N	\N	\N
6843	774	14	0	\N	\N	\N	\N	\N
6845	776	14	0	\N	\N	\N	\N	\N
6847	423	14	0	\N	\N	\N	\N	\N
6848	724	14	0	\N	\N	\N	\N	\N
6851	447	14	0	\N	\N	\N	\N	\N
6853	457	14	0	\N	\N	\N	\N	\N
6854	440	14	0	\N	\N	\N	\N	\N
6865	779	14	0	\N	\N	\N	\N	\N
6869	778	14	0	\N	\N	\N	\N	\N
6870	431	14	0	\N	\N	\N	\N	\N
6871	451	14	0	\N	\N	\N	\N	\N
6872	461	14	0	\N	\N	\N	\N	\N
6873	459	14	0	\N	\N	\N	\N	\N
6875	688	14	0	\N	\N	\N	\N	\N
6881	780	14	0	\N	\N	\N	\N	\N
6884	432	14	0	\N	\N	\N	\N	\N
6891	505	14	0	\N	\N	\N	\N	\N
6896	484	14	0	\N	\N	\N	\N	\N
6907	477	14	0	\N	\N	\N	\N	\N
6909	476	14	0	\N	\N	\N	\N	\N
6911	489	14	0	\N	\N	\N	\N	\N
6914	782	14	0	\N	\N	\N	\N	\N
6917	783	14	0	\N	\N	\N	\N	\N
6918	891	14	0	\N	\N	\N	\N	\N
6921	520	14	0	\N	\N	\N	\N	\N
6925	527	14	0	\N	\N	\N	\N	\N
6927	522	14	0	\N	\N	\N	\N	\N
6893	487	14	1	2017-10-10 08:56:49	\N	\N	\N	\N
6868	444	14	1	2017-10-10 08:57:01	\N	\N	\N	\N
6862	449	14	1	2017-10-10 08:57:09	\N	\N	\N	\N
6877	441	14	1	2017-10-10 08:58:14	\N	\N	\N	\N
6878	438	14	1	2017-10-10 09:00:22	\N	\N	\N	\N
6867	445	14	1	2017-10-10 09:02:07	\N	\N	\N	\N
6924	690	14	1	2017-10-10 09:03:45	\N	\N	\N	\N
6922	548	14	1	2017-10-10 09:04:49	\N	\N	\N	\N
6804	390	14	1	2017-10-10 09:08:05	\N	\N	\N	\N
6812	398	14	1	2017-10-10 09:09:06	\N	\N	\N	\N
6892	744	14	1	2017-10-10 09:09:19	\N	\N	\N	\N
6876	443	14	1	2017-10-10 09:11:28	\N	\N	\N	\N
6815	410	14	1	2017-10-10 09:13:33	\N	\N	\N	\N
6882	436	14	1	2017-10-10 09:14:32	\N	\N	\N	\N
6832	412	14	1	2017-10-10 09:15:15	\N	\N	\N	\N
6771	350	14	1	2017-10-10 09:15:28	\N	\N	\N	\N
6916	538	14	1	2017-10-10 09:18:19	\N	\N	\N	\N
6813	415	14	1	2017-10-10 09:19:49	\N	\N	\N	\N
6905	512	14	1	2017-10-10 09:20:18	\N	\N	\N	\N
6807	364	14	1	2017-10-10 09:20:58	\N	\N	\N	\N
6783	11	14	1	2017-10-10 09:22:21	\N	\N	\N	\N
6903	483	14	1	2017-10-10 09:23:25	\N	\N	\N	\N
6781	368	14	1	2017-10-10 09:24:14	\N	\N	\N	\N
6856	460	14	1	2017-10-10 09:24:28	\N	\N	\N	\N
6908	498	14	1	2017-10-10 09:26:41	\N	\N	\N	\N
6842	773	14	1	2017-10-10 09:27:05	\N	\N	\N	\N
6910	725	14	1	2017-10-10 09:29:20	\N	\N	\N	\N
6928	562	14	1	2017-10-10 09:31:07	\N	\N	\N	\N
6900	469	14	1	2017-10-10 09:33:54	\N	\N	\N	\N
6880	452	14	1	2017-10-10 09:34:06	\N	\N	\N	\N
6822	409	14	1	2017-10-10 09:35:16	\N	\N	\N	\N
6806	381	14	1	2017-10-10 09:37:13	\N	\N	\N	\N
6906	482	14	1	2017-10-10 09:38:17	\N	\N	\N	\N
6801	705	14	1	2017-10-10 09:39:16	\N	\N	\N	\N
6886	470	14	1	2017-10-10 09:40:09	\N	\N	\N	\N
6895	467	14	1	2017-10-10 09:41:54	\N	\N	\N	\N
6919	488	14	1	2017-10-10 09:43:39	\N	\N	\N	\N
6866	318	14	1	2017-10-10 09:43:57	\N	\N	\N	\N
6828	419	14	1	2017-10-10 09:46:37	\N	\N	\N	\N
6839	392	14	1	2017-10-10 09:46:48	\N	\N	\N	\N
6904	501	14	1	2017-10-10 09:49:11	\N	\N	\N	\N
6850	462	14	1	2017-10-10 09:49:29	\N	\N	\N	\N
6784	7	14	1	2017-10-10 09:49:38	\N	\N	\N	\N
6899	485	14	1	2017-10-10 09:50:46	\N	\N	\N	\N
6809	361	14	1	2017-10-10 09:52:59	\N	\N	\N	\N
6888	499	14	1	2017-10-10 10:01:57	\N	\N	\N	\N
6857	464	14	1	2017-10-10 10:04:26	\N	\N	\N	\N
6864	491	14	1	2017-10-10 10:04:51	\N	\N	\N	\N
6859	707	14	1	2017-10-10 10:10:05	\N	\N	\N	\N
6775	348	14	1	2017-10-10 10:13:23	\N	\N	\N	\N
6829	393	14	1	2017-10-10 10:14:10	\N	\N	\N	\N
6887	426	14	1	2017-10-10 10:14:51	\N	\N	\N	\N
6773	321	14	1	2017-10-10 10:17:28	\N	\N	\N	\N
6846	687	14	1	2017-10-10 10:19:57	\N	\N	\N	\N
6816	706	14	1	2017-10-10 10:20:07	\N	\N	\N	\N
6774	301	14	1	2017-10-10 10:29:43	\N	\N	\N	\N
6802	375	14	1	2017-10-10 10:34:59	\N	\N	\N	\N
6776	347	14	1	2017-10-10 10:47:50	\N	\N	\N	\N
6831	400	14	1	2017-10-10 10:48:37	\N	\N	\N	\N
6834	395	14	1	2017-10-10 10:48:53	\N	\N	\N	\N
6836	416	14	1	2017-10-10 10:55:11	\N	\N	\N	\N
6883	434	14	1	2017-10-10 10:56:17	\N	\N	\N	\N
6849	450	14	1	2017-10-10 11:06:58	\N	\N	\N	\N
6791	385	14	1	2017-10-10 11:12:17	\N	\N	\N	\N
6798	370	14	1	2017-10-10 11:13:53	\N	\N	\N	\N
6796	686	14	1	2017-10-10 11:18:29	\N	\N	\N	\N
6794	388	14	1	2017-10-10 11:19:52	\N	\N	\N	\N
6885	472	14	1	2017-10-10 11:36:25	\N	\N	\N	\N
6901	494	14	1	2017-10-10 11:53:06	\N	\N	\N	\N
6800	384	14	1	2017-10-10 13:32:47	\N	\N	\N	\N
6797	389	14	1	2017-10-10 13:35:31	\N	\N	\N	\N
6923	342	14	1	2017-10-10 13:36:04	\N	\N	\N	\N
6902	496	14	1	2017-10-10 13:37:10	\N	\N	\N	\N
6805	768	14	1	2017-10-10 13:37:30	\N	\N	\N	\N
6820	323	14	1	2017-10-10 13:53:29	\N	\N	\N	\N
6824	402	14	1	2017-10-10 13:58:59	\N	\N	\N	\N
6795	366	14	1	2017-10-10 14:02:11	\N	\N	\N	\N
6778	360	14	1	2017-10-10 14:14:16	\N	\N	\N	\N
6852	781	14	1	2017-10-10 14:24:40	\N	\N	\N	\N
6855	428	14	1	2017-10-10 14:26:29	\N	\N	\N	\N
6779	386	14	1	2017-10-10 14:53:00	\N	\N	\N	\N
6926	510	14	1	2017-10-10 14:53:41	\N	\N	\N	\N
6833	399	14	1	2017-10-10 15:03:30	\N	\N	\N	\N
6818	2	14	1	2017-10-10 15:27:42	\N	\N	\N	\N
6929	546	14	0	\N	\N	\N	\N	\N
6930	537	14	0	\N	\N	\N	\N	\N
6933	543	14	0	\N	\N	\N	\N	\N
6935	517	14	0	\N	\N	\N	\N	\N
6937	787	14	0	\N	\N	\N	\N	\N
6938	511	14	0	\N	\N	\N	\N	\N
6947	709	14	0	\N	\N	\N	\N	\N
6951	519	14	0	\N	\N	\N	\N	\N
6953	534	14	0	\N	\N	\N	\N	\N
6955	786	14	0	\N	\N	\N	\N	\N
6964	525	14	0	\N	\N	\N	\N	\N
6967	556	14	0	\N	\N	\N	\N	\N
6968	564	14	0	\N	\N	\N	\N	\N
6970	576	14	0	\N	\N	\N	\N	\N
6975	555	14	0	\N	\N	\N	\N	\N
6978	574	14	0	\N	\N	\N	\N	\N
6982	358	14	0	\N	\N	\N	\N	\N
6983	435	14	0	\N	\N	\N	\N	\N
6984	495	14	0	\N	\N	\N	\N	\N
6985	560	14	0	\N	\N	\N	\N	\N
6986	549	14	0	\N	\N	\N	\N	\N
6990	672	14	0	\N	\N	\N	\N	\N
6991	790	14	0	\N	\N	\N	\N	\N
6993	791	14	0	\N	\N	\N	\N	\N
6994	810	14	0	\N	\N	\N	\N	\N
6996	239	14	0	\N	\N	\N	\N	\N
7002	666	14	0	\N	\N	\N	\N	\N
7008	747	14	0	\N	\N	\N	\N	\N
7012	500	14	0	\N	\N	\N	\N	\N
7013	711	14	0	\N	\N	\N	\N	\N
7015	211	14	0	\N	\N	\N	\N	\N
7016	326	14	0	\N	\N	\N	\N	\N
7021	197	14	0	\N	\N	\N	\N	\N
7028	588	14	0	\N	\N	\N	\N	\N
7029	580	14	0	\N	\N	\N	\N	\N
7031	594	14	0	\N	\N	\N	\N	\N
7032	583	14	0	\N	\N	\N	\N	\N
7033	796	14	0	\N	\N	\N	\N	\N
7035	311	14	0	\N	\N	\N	\N	\N
7038	586	14	0	\N	\N	\N	\N	\N
7039	269	14	0	\N	\N	\N	\N	\N
7040	320	14	0	\N	\N	\N	\N	\N
7043	712	14	0	\N	\N	\N	\N	\N
7044	693	14	0	\N	\N	\N	\N	\N
7045	795	14	0	\N	\N	\N	\N	\N
7046	797	14	0	\N	\N	\N	\N	\N
7047	597	14	0	\N	\N	\N	\N	\N
7048	592	14	0	\N	\N	\N	\N	\N
7049	590	14	0	\N	\N	\N	\N	\N
7050	210	14	0	\N	\N	\N	\N	\N
7051	598	14	0	\N	\N	\N	\N	\N
7052	793	14	0	\N	\N	\N	\N	\N
7056	581	14	0	\N	\N	\N	\N	\N
7059	615	14	0	\N	\N	\N	\N	\N
7060	611	14	0	\N	\N	\N	\N	\N
7061	892	14	0	\N	\N	\N	\N	\N
7062	800	14	0	\N	\N	\N	\N	\N
7063	599	14	0	\N	\N	\N	\N	\N
7067	802	14	0	\N	\N	\N	\N	\N
7068	600	14	0	\N	\N	\N	\N	\N
7072	621	14	0	\N	\N	\N	\N	\N
7073	421	14	0	\N	\N	\N	\N	\N
7075	604	14	0	\N	\N	\N	\N	\N
7076	603	14	0	\N	\N	\N	\N	\N
7077	749	14	0	\N	\N	\N	\N	\N
7079	614	14	0	\N	\N	\N	\N	\N
7081	601	14	0	\N	\N	\N	\N	\N
7082	617	14	0	\N	\N	\N	\N	\N
6931	528	14	1	2017-10-10 08:57:31	\N	\N	\N	\N
6987	524	14	1	2017-10-10 08:59:05	\N	\N	\N	\N
6957	540	14	1	2017-10-10 09:00:08	\N	\N	\N	\N
6944	535	14	1	2017-10-10 09:06:50	\N	\N	\N	\N
6969	552	14	1	2017-10-10 09:07:42	\N	\N	\N	\N
6943	530	14	1	2017-10-10 09:08:42	\N	\N	\N	\N
7018	310	14	1	2017-10-10 09:11:52	\N	\N	\N	\N
7019	173	14	1	2017-10-10 09:15:44	\N	\N	\N	\N
6977	573	14	1	2017-10-10 09:16:34	\N	\N	\N	\N
6992	521	14	1	2017-10-10 09:18:08	\N	\N	\N	\N
7041	162	14	1	2017-10-10 09:18:39	\N	\N	\N	\N
6945	559	14	1	2017-10-10 09:20:02	\N	\N	\N	\N
7010	391	14	1	2017-10-10 09:23:33	\N	\N	\N	\N
6932	518	14	1	2017-10-10 09:25:55	\N	\N	\N	\N
6956	542	14	1	2017-10-10 09:27:13	\N	\N	\N	\N
7074	620	14	1	2017-10-10 09:32:40	\N	\N	\N	\N
7053	584	14	1	2017-10-10 09:33:00	\N	\N	\N	\N
7064	622	14	1	2017-10-10 09:33:15	\N	\N	\N	\N
7083	605	14	1	2017-10-10 09:33:27	\N	\N	\N	\N
6942	547	14	1	2017-10-10 09:33:43	\N	\N	\N	\N
6973	123	14	1	2017-10-10 09:36:03	\N	\N	\N	\N
6950	575	14	1	2017-10-10 09:38:05	\N	\N	\N	\N
6949	578	14	1	2017-10-10 09:38:31	\N	\N	\N	\N
6954	531	14	1	2017-10-10 09:39:07	\N	\N	\N	\N
6962	554	14	1	2017-10-10 09:48:38	\N	\N	\N	\N
6960	425	14	1	2017-10-10 09:48:51	\N	\N	\N	\N
6995	38	14	1	2017-10-10 09:49:58	\N	\N	\N	\N
7027	237	14	1	2017-10-10 09:52:31	\N	\N	\N	\N
6972	568	14	1	2017-10-10 10:02:05	\N	\N	\N	\N
6966	727	14	1	2017-10-10 10:03:50	\N	\N	\N	\N
7000	456	14	1	2017-10-10 10:04:41	\N	\N	\N	\N
7007	728	14	1	2017-10-10 10:08:51	\N	\N	\N	\N
6952	508	14	1	2017-10-10 10:13:34	\N	\N	\N	\N
6959	315	14	1	2017-10-10 10:13:40	\N	\N	\N	\N
7004	692	14	1	2017-10-10 10:16:58	\N	\N	\N	\N
7009	54	14	1	2017-10-10 10:19:13	\N	\N	\N	\N
7057	145	14	1	2017-10-10 10:25:59	\N	\N	\N	\N
6979	550	14	1	2017-10-10 10:27:13	\N	\N	\N	\N
6934	515	14	1	2017-10-10 10:29:18	\N	\N	\N	\N
7042	748	14	1	2017-10-10 10:32:05	\N	\N	\N	\N
6981	567	14	1	2017-10-10 10:32:57	\N	\N	\N	\N
6980	3	14	1	2017-10-10 10:40:47	\N	\N	\N	\N
7058	80	14	1	2017-10-10 10:41:11	\N	\N	\N	\N
6999	260	14	1	2017-10-10 10:41:58	\N	\N	\N	\N
7006	224	14	1	2017-10-10 10:43:31	\N	\N	\N	\N
6936	545	14	1	2017-10-10 10:44:45	\N	\N	\N	\N
6998	35	14	1	2017-10-10 10:50:00	\N	\N	\N	\N
7065	624	14	1	2017-10-10 10:52:27	\N	\N	\N	\N
7055	154	14	1	2017-10-10 10:54:58	\N	\N	\N	\N
6974	570	14	1	2017-10-10 11:01:58	\N	\N	\N	\N
6988	691	14	1	2017-10-10 11:11:42	\N	\N	\N	\N
7084	730	14	1	2017-10-10 11:11:57	\N	\N	\N	\N
7030	595	14	1	2017-10-10 13:37:38	\N	\N	\N	\N
6971	710	14	1	2017-10-10 13:44:17	\N	\N	\N	\N
6976	746	14	1	2017-10-10 13:58:03	\N	\N	\N	\N
6989	789	14	1	2017-10-10 13:59:48	\N	\N	\N	\N
7003	77	14	1	2017-10-10 14:05:50	\N	\N	\N	\N
7054	794	14	1	2017-10-10 14:06:07	\N	\N	\N	\N
6965	811	14	1	2017-10-10 14:06:16	\N	\N	\N	\N
7022	792	14	1	2017-10-10 14:06:38	\N	\N	\N	\N
7024	589	14	1	2017-10-10 14:18:55	\N	\N	\N	\N
6958	539	14	1	2017-10-10 14:21:29	\N	\N	\N	\N
6939	745	14	1	2017-10-10 14:39:42	\N	\N	\N	\N
6940	536	14	1	2017-10-10 14:44:53	\N	\N	\N	\N
7037	591	14	1	2017-10-10 15:09:59	\N	\N	\N	\N
7070	613	14	1	2017-10-10 15:10:19	\N	\N	\N	\N
6946	509	14	1	2017-10-10 15:11:51	\N	\N	\N	\N
7036	593	14	1	2017-10-10 15:12:33	\N	\N	\N	\N
7020	99	14	1	2017-10-10 15:51:26	\N	\N	\N	\N
7017	363	14	1	2017-10-11 10:31:25	\N	\N	\N	\N
7086	532	14	0	\N	\N	\N	\N	\N
7088	799	14	0	\N	\N	\N	\N	\N
7089	801	14	0	\N	\N	\N	\N	\N
7090	618	14	0	\N	\N	\N	\N	\N
7091	610	14	0	\N	\N	\N	\N	\N
7092	713	14	0	\N	\N	\N	\N	\N
7093	609	14	0	\N	\N	\N	\N	\N
7094	608	14	0	\N	\N	\N	\N	\N
7096	653	14	0	\N	\N	\N	\N	\N
7097	804	14	0	\N	\N	\N	\N	\N
7098	652	14	0	\N	\N	\N	\N	\N
7100	646	14	0	\N	\N	\N	\N	\N
7101	893	14	0	\N	\N	\N	\N	\N
7102	803	14	0	\N	\N	\N	\N	\N
7104	805	14	0	\N	\N	\N	\N	\N
7105	806	14	0	\N	\N	\N	\N	\N
7106	807	14	0	\N	\N	\N	\N	\N
7108	750	14	0	\N	\N	\N	\N	\N
7109	695	14	0	\N	\N	\N	\N	\N
7114	827	14	0	\N	\N	\N	\N	\N
7115	478	14	0	\N	\N	\N	\N	\N
7116	828	14	0	\N	\N	\N	\N	\N
7117	829	14	0	\N	\N	\N	\N	\N
7118	830	14	0	\N	\N	\N	\N	\N
7119	831	14	0	\N	\N	\N	\N	\N
7120	832	14	0	\N	\N	\N	\N	\N
7121	833	14	0	\N	\N	\N	\N	\N
7123	834	14	0	\N	\N	\N	\N	\N
7124	835	14	0	\N	\N	\N	\N	\N
7125	836	14	0	\N	\N	\N	\N	\N
7126	837	14	0	\N	\N	\N	\N	\N
7127	838	14	0	\N	\N	\N	\N	\N
7128	839	14	0	\N	\N	\N	\N	\N
7129	753	14	0	\N	\N	\N	\N	\N
7130	623	14	0	\N	\N	\N	\N	\N
7131	585	14	0	\N	\N	\N	\N	\N
7132	572	14	0	\N	\N	\N	\N	\N
7137	840	14	0	\N	\N	\N	\N	\N
7138	841	14	0	\N	\N	\N	\N	\N
7141	813	14	0	\N	\N	\N	\N	\N
7142	814	14	0	\N	\N	\N	\N	\N
7143	815	14	0	\N	\N	\N	\N	\N
7144	816	14	0	\N	\N	\N	\N	\N
7146	818	14	0	\N	\N	\N	\N	\N
7148	820	14	0	\N	\N	\N	\N	\N
7149	821	14	0	\N	\N	\N	\N	\N
7152	823	14	0	\N	\N	\N	\N	\N
7153	825	14	0	\N	\N	\N	\N	\N
7154	826	14	0	\N	\N	\N	\N	\N
7156	558	14	0	\N	\N	\N	\N	\N
7157	679	14	0	\N	\N	\N	\N	\N
7159	468	14	0	\N	\N	\N	\N	\N
7160	612	14	0	\N	\N	\N	\N	\N
7161	275	14	0	\N	\N	\N	\N	\N
7162	852	14	0	\N	\N	\N	\N	\N
7164	853	14	0	\N	\N	\N	\N	\N
7165	894	14	0	\N	\N	\N	\N	\N
7166	383	14	0	\N	\N	\N	\N	\N
7167	842	14	0	\N	\N	\N	\N	\N
7168	843	14	0	\N	\N	\N	\N	\N
7169	844	14	0	\N	\N	\N	\N	\N
7170	845	14	0	\N	\N	\N	\N	\N
7171	846	14	0	\N	\N	\N	\N	\N
7172	720	14	0	\N	\N	\N	\N	\N
7173	294	14	0	\N	\N	\N	\N	\N
7174	847	14	0	\N	\N	\N	\N	\N
7177	471	14	0	\N	\N	\N	\N	\N
7181	290	14	0	\N	\N	\N	\N	\N
7184	849	14	0	\N	\N	\N	\N	\N
7186	850	14	0	\N	\N	\N	\N	\N
7187	851	14	0	\N	\N	\N	\N	\N
7189	715	14	0	\N	\N	\N	\N	\N
7190	281	14	0	\N	\N	\N	\N	\N
7197	864	14	0	\N	\N	\N	\N	\N
7199	895	14	0	\N	\N	\N	\N	\N
7200	854	14	0	\N	\N	\N	\N	\N
7201	856	14	0	\N	\N	\N	\N	\N
7204	265	14	0	\N	\N	\N	\N	\N
7205	380	14	0	\N	\N	\N	\N	\N
7206	261	14	0	\N	\N	\N	\N	\N
7208	304	14	0	\N	\N	\N	\N	\N
7209	374	14	0	\N	\N	\N	\N	\N
7210	253	14	0	\N	\N	\N	\N	\N
7213	466	14	0	\N	\N	\N	\N	\N
7214	860	14	0	\N	\N	\N	\N	\N
7219	233	14	0	\N	\N	\N	\N	\N
7226	868	14	0	\N	\N	\N	\N	\N
7228	303	14	0	\N	\N	\N	\N	\N
7229	735	14	0	\N	\N	\N	\N	\N
7230	865	14	0	\N	\N	\N	\N	\N
7233	870	14	0	\N	\N	\N	\N	\N
7234	871	14	0	\N	\N	\N	\N	\N
7241	161	14	0	\N	\N	\N	\N	\N
7235	458	14	1	2017-10-10 09:01:00	\N	\N	\N	\N
7191	553	14	1	2017-10-10 09:03:34	\N	\N	\N	\N
7176	475	14	1	2017-10-10 09:10:22	\N	\N	\N	\N
7150	561	14	1	2017-10-10 09:10:37	\N	\N	\N	\N
7122	602	14	1	2017-10-10 09:23:13	\N	\N	\N	\N
7155	718	14	1	2017-10-10 09:29:35	\N	\N	\N	\N
7218	240	14	1	2017-10-10 09:30:02	\N	\N	\N	\N
7211	563	14	1	2017-10-10 09:31:21	\N	\N	\N	\N
7139	566	14	1	2017-10-10 09:38:56	\N	\N	\N	\N
7232	187	14	1	2017-10-10 09:40:17	\N	\N	\N	\N
7231	866	14	1	2017-10-10 09:41:45	\N	\N	\N	\N
7095	651	14	1	2017-10-10 09:44:28	\N	\N	\N	\N
7158	714	14	1	2017-10-10 09:49:01	\N	\N	\N	\N
7207	259	14	1	2017-10-10 09:50:38	\N	\N	\N	\N
7223	227	14	1	2017-10-10 09:58:07	\N	\N	\N	\N
7225	209	14	1	2017-10-10 10:06:34	\N	\N	\N	\N
7103	4	14	1	2017-10-10 10:07:58	\N	\N	\N	\N
7224	736	14	1	2017-10-10 10:08:59	\N	\N	\N	\N
7110	731	14	1	2017-10-10 10:10:49	\N	\N	\N	\N
7188	282	14	1	2017-10-10 10:12:36	\N	\N	\N	\N
7238	163	14	1	2017-10-10 10:16:43	\N	\N	\N	\N
7212	883	14	1	2017-10-10 10:19:24	\N	\N	\N	\N
7198	212	14	1	2017-10-10 10:22:38	\N	\N	\N	\N
7216	861	14	1	2017-10-10 10:24:03	\N	\N	\N	\N
7202	497	14	1	2017-10-10 10:27:41	\N	\N	\N	\N
7163	743	14	1	2017-10-10 10:29:35	\N	\N	\N	\N
7135	751	14	1	2017-10-10 10:33:27	\N	\N	\N	\N
7194	223	14	1	2017-10-10 10:34:12	\N	\N	\N	\N
7111	480	14	1	2017-10-10 10:36:36	\N	\N	\N	\N
7240	579	14	1	2017-10-10 10:44:55	\N	\N	\N	\N
7193	235	14	1	2017-10-10 10:45:36	\N	\N	\N	\N
7221	577	14	1	2017-10-10 10:47:02	\N	\N	\N	\N
7175	411	14	1	2017-10-10 11:02:16	\N	\N	\N	\N
7183	403	14	1	2017-10-10 13:35:17	\N	\N	\N	0
7222	463	14	1	2017-10-10 13:36:39	\N	\N	\N	\N
7215	243	14	1	2017-10-10 14:02:56	\N	\N	\N	\N
7145	817	14	1	2017-10-10 14:03:14	\N	\N	\N	\N
7227	150	14	1	2017-10-10 14:03:56	\N	\N	\N	\N
7203	898	14	1	2017-10-10 14:10:11	\N	\N	\N	\N
7185	716	14	1	2017-10-10 14:26:01	\N	\N	\N	\N
7113	619	14	1	2017-10-10 14:29:26	\N	\N	\N	\N
7182	357	14	1	2017-10-10 14:34:16	\N	\N	\N	\N
7134	752	14	1	2017-10-10 14:39:50	\N	\N	\N	\N
7179	848	14	1	2017-10-10 14:57:19	\N	\N	\N	\N
7195	418	14	1	2017-10-10 15:03:15	\N	\N	\N	\N
7180	405	14	1	2017-10-10 15:01:24	\N	\N	\N	\N
7133	596	14	1	2017-10-10 15:10:38	\N	\N	\N	\N
7147	819	14	1	2017-10-10 15:37:35	\N	\N	\N	\N
7140	481	14	1	2017-10-10 15:46:46	\N	\N	\N	\N
7087	798	14	1	2017-10-10 15:50:35	\N	\N	\N	\N
7244	149	14	0	\N	\N	\N	\N	\N
7245	544	14	0	\N	\N	\N	\N	\N
7247	513	14	0	\N	\N	\N	\N	\N
7249	490	14	0	\N	\N	\N	\N	\N
7252	875	14	0	\N	\N	\N	\N	\N
7253	876	14	0	\N	\N	\N	\N	\N
7254	877	14	0	\N	\N	\N	\N	\N
7258	762	14	0	\N	\N	\N	\N	\N
7259	812	14	0	\N	\N	\N	\N	\N
7260	327	14	0	\N	\N	\N	\N	\N
7261	884	14	0	\N	\N	\N	\N	\N
7262	855	14	0	\N	\N	\N	\N	\N
7271	507	14	0	\N	\N	\N	\N	\N
7273	726	14	0	\N	\N	\N	\N	\N
7274	541	14	0	\N	\N	\N	\N	\N
7282	764	14	0	\N	\N	\N	\N	\N
7289	312	14	0	\N	\N	\N	\N	\N
7301	897	14	0	\N	\N	\N	\N	\N
7303	765	14	0	\N	\N	\N	\N	\N
7307	529	14	0	\N	\N	\N	\N	\N
6395	161	13	1	2017-10-09 13:41:01	\N	\N	\N	\N
7309	857	14	0	\N	\N	\N	\N	\N
7310	901	14	0	\N	\N	\N	\N	\N
7312	903	14	0	\N	\N	\N	\N	\N
7313	904	14	0	\N	\N	\N	\N	\N
7316	907	14	0	\N	\N	\N	\N	\N
7317	908	14	0	\N	\N	\N	\N	\N
7319	910	14	0	\N	\N	\N	\N	\N
7320	878	14	0	\N	\N	\N	\N	\N
6941	788	14	1	2017-10-10 08:54:46	\N	\N	\N	\N
6890	493	14	1	2017-10-10 08:55:27	\N	\N	\N	\N
7001	557	14	1	2017-10-10 08:55:52	\N	\N	\N	\N
6861	433	14	1	2017-10-10 08:56:23	\N	\N	\N	\N
6624	887	14	1	2017-10-10 08:57:47	\N	\N	\N	\N
7192	551	14	1	2017-10-10 08:58:26	\N	\N	\N	\N
6858	429	14	1	2017-10-10 08:58:53	\N	\N	\N	\N
7239	454	14	1	2017-10-10 08:59:40	\N	\N	\N	\N
6603	699	14	1	2017-10-10 09:01:23	\N	\N	\N	\N
6738	317	14	1	2017-10-10 09:01:43	\N	\N	\N	\N
7267	446	14	1	2017-10-10 09:02:25	\N	\N	\N	\N
6894	486	14	1	2017-10-10 09:06:35	\N	\N	\N	\N
6948	526	14	1	2017-10-10 09:07:06	\N	\N	\N	\N
6486	20	14	1	2017-10-10 09:11:41	\N	\N	\N	\N
6789	382	14	1	2017-10-10 09:13:13	\N	\N	\N	\N
6712	254	14	1	2017-10-10 09:13:24	\N	\N	\N	\N
7246	135	14	1	2017-10-10 09:13:43	\N	\N	\N	\N
6787	359	14	1	2017-10-10 09:16:13	\N	\N	\N	\N
6963	571	14	1	2017-10-10 09:16:23	\N	\N	\N	\N
6730	291	14	1	2017-10-10 09:17:07	\N	\N	\N	\N
6571	127	14	1	2017-10-10 09:17:43	\N	\N	\N	\N
7298	516	14	1	2017-10-10 09:18:30	\N	\N	\N	\N
7085	607	14	1	2017-10-10 09:20:46	\N	\N	\N	\N
6897	474	14	1	2017-10-10 09:21:53	\N	\N	\N	\N
7308	331	14	1	2017-10-10 09:22:14	\N	\N	\N	\N
7285	896	14	1	2017-10-10 09:22:30	\N	\N	\N	\N
7099	650	14	1	2017-10-10 09:22:50	\N	\N	\N	\N
6702	244	14	1	2017-10-10 09:23:53	\N	\N	\N	\N
7278	64	14	1	2017-10-10 09:25:07	\N	\N	\N	\N
7288	506	14	1	2017-10-10 09:25:28	\N	\N	\N	\N
7276	442	14	1	2017-10-10 09:25:48	\N	\N	\N	\N
6874	504	14	1	2017-10-10 09:26:17	\N	\N	\N	\N
6492	34	14	1	2017-10-10 09:27:27	\N	\N	\N	\N
7294	708	14	1	2017-10-10 09:27:34	\N	\N	\N	\N
6678	193	14	1	2017-10-10 09:28:04	\N	\N	\N	\N
6863	430	14	1	2017-10-10 09:32:01	\N	\N	\N	\N
6499	60	14	1	2017-10-10 09:32:26	\N	\N	\N	\N
7069	616	14	1	2017-10-10 09:32:47	\N	\N	\N	\N
7078	694	14	1	2017-10-10 09:35:29	\N	\N	\N	\N
6618	167	14	1	2017-10-10 09:35:36	\N	\N	\N	\N
7178	719	14	1	2017-10-10 09:36:24	\N	\N	\N	\N
7279	899	14	1	2017-10-10 09:36:38	\N	\N	\N	\N
6915	492	14	1	2017-10-10 09:37:39	\N	\N	\N	\N
6558	133	14	1	2017-10-10 09:38:48	\N	\N	\N	\N
6997	523	14	1	2017-10-10 09:39:22	\N	\N	\N	\N
7315	906	14	1	2017-10-10 09:40:58	\N	\N	\N	\N
6670	195	14	1	2017-10-10 09:41:10	\N	\N	\N	\N
6898	473	14	1	2017-10-10 09:42:50	\N	\N	\N	\N
7255	122	14	1	2017-10-10 09:45:04	\N	\N	\N	\N
6912	514	14	1	2017-10-10 09:47:10	\N	\N	\N	\N
6694	236	14	1	2017-10-10 09:47:52	\N	\N	\N	\N
7136	417	14	1	2017-10-10 09:48:19	\N	\N	\N	\N
6860	455	14	1	2017-10-10 09:51:01	\N	\N	\N	\N
7287	396	14	1	2017-10-10 09:53:33	\N	\N	\N	\N
7034	582	14	1	2017-10-10 09:56:06	\N	\N	\N	\N
6597	139	14	1	2017-10-10 09:56:37	\N	\N	\N	\N
7272	95	14	1	2017-10-10 09:56:46	\N	\N	\N	\N
6689	271	14	1	2017-10-10 09:57:18	\N	\N	\N	\N
6557	70	14	1	2017-10-10 10:03:39	\N	\N	\N	\N
6588	104	14	1	2017-10-10 10:05:17	\N	\N	\N	\N
6656	191	14	1	2017-10-10 10:05:59	\N	\N	\N	\N
7236	176	14	1	2017-10-10 10:07:13	\N	\N	\N	\N
7275	74	14	1	2017-10-10 10:08:08	\N	\N	\N	\N
6542	92	14	1	2017-10-10 10:08:34	\N	\N	\N	\N
7306	100	14	1	2017-10-10 10:09:06	\N	\N	\N	\N
6889	503	14	1	2017-10-10 10:09:26	\N	\N	\N	\N
7026	729	14	1	2017-10-10 10:09:39	\N	\N	\N	\N
7257	698	14	1	2017-10-10 10:10:41	\N	\N	\N	\N
7304	684	14	1	2017-10-10 10:10:58	\N	\N	\N	\N
6622	700	14	1	2017-10-10 10:11:18	\N	\N	\N	\N
7265	733	14	1	2017-10-10 10:11:38	\N	\N	\N	\N
7318	909	14	1	2017-10-10 10:12:04	\N	\N	\N	\N
6582	79	14	1	2017-10-10 10:13:52	\N	\N	\N	\N
7237	171	14	1	2017-10-10 10:14:00	\N	\N	\N	\N
7311	902	14	1	2017-10-10 10:15:47	\N	\N	\N	\N
6808	362	14	1	2017-10-10 10:16:27	\N	\N	\N	\N
7277	65	14	1	2017-10-10 10:17:52	\N	\N	\N	\N
6765	299	14	1	2017-10-10 10:18:18	\N	\N	\N	\N
6567	734	14	1	2017-10-10 10:18:41	\N	\N	\N	\N
7296	226	14	1	2017-10-10 10:20:19	\N	\N	\N	\N
6675	179	14	1	2017-10-10 10:21:21	\N	\N	\N	\N
6546	56	14	1	2017-10-10 10:22:46	\N	\N	\N	\N
7011	369	14	1	2017-10-10 10:23:51	\N	\N	\N	\N
6677	182	14	1	2017-10-10 10:25:16	\N	\N	\N	\N
6519	61	14	1	2017-10-10 10:25:39	\N	\N	\N	\N
7220	704	14	1	2017-10-10 10:27:00	\N	\N	\N	\N
7269	335	14	1	2017-10-10 10:30:09	\N	\N	\N	\N
7266	37	14	1	2017-10-10 10:32:33	\N	\N	\N	\N
7302	137	14	1	2017-10-10 10:33:49	\N	\N	\N	\N
7299	201	14	1	2017-10-10 10:41:04	\N	\N	\N	\N
7270	103	14	1	2017-10-10 10:41:25	\N	\N	\N	\N
7243	448	14	1	2017-10-10 10:42:41	\N	\N	\N	\N
7284	341	14	1	2017-10-10 10:43:44	\N	\N	\N	\N
7314	905	14	1	2017-10-10 10:46:18	\N	\N	\N	\N
7248	689	14	1	2017-10-10 10:49:10	\N	\N	\N	\N
7293	376	14	1	2017-10-10 10:49:50	\N	\N	\N	\N
7297	225	14	1	2017-10-10 10:52:46	\N	\N	\N	\N
7268	113	14	1	2017-10-10 11:16:01	\N	\N	\N	\N
7291	276	14	1	2017-10-10 11:19:03	\N	\N	\N	\N
7251	130	14	1	2017-10-10 11:17:06	\N	\N	\N	\N
7256	367	14	1	2017-10-10 11:24:24	\N	\N	\N	\N
7263	221	14	1	2017-10-10 11:41:48	\N	\N	\N	\N
7290	502	14	1	2017-10-10 13:57:12	\N	\N	\N	\N
7292	349	14	1	2017-10-10 14:07:20	\N	\N	\N	\N
7283	675	14	1	2017-10-10 14:28:02	\N	\N	\N	\N
7281	57	14	1	2017-10-10 14:42:55	\N	\N	\N	\N
7286	479	14	1	2017-10-10 10:28:26	\N	\N	\N	\N
6732	306	14	1	2017-10-10 10:28:54	\N	\N	\N	\N
6920	533	14	1	2017-10-10 10:30:43	\N	\N	\N	\N
6759	332	14	1	2017-10-10 10:31:11	\N	\N	\N	\N
6515	32	14	1	2017-10-10 10:32:13	\N	\N	\N	\N
6961	565	14	1	2017-10-10 10:32:44	\N	\N	\N	\N
7112	824	14	1	2017-10-10 10:34:24	\N	\N	\N	\N
7295	63	14	1	2017-10-10 10:37:42	\N	\N	\N	\N
6627	205	14	1	2017-10-10 10:38:09	\N	\N	\N	\N
7023	249	14	1	2017-10-10 10:43:21	\N	\N	\N	\N
7280	439	14	1	2017-10-10 10:45:26	\N	\N	\N	\N
6642	49	14	1	2017-10-10 10:46:45	\N	\N	\N	\N
7217	372	14	1	2017-10-10 10:49:39	\N	\N	\N	\N
6580	128	14	1	2017-10-10 10:51:59	\N	\N	\N	\N
7005	667	14	1	2017-10-10 10:52:57	\N	\N	\N	\N
6830	406	14	1	2017-10-10 10:53:59	\N	\N	\N	\N
7305	882	14	1	2017-10-10 11:00:50	\N	\N	\N	\N
6713	242	14	1	2017-10-10 11:01:15	\N	\N	\N	\N
6587	115	14	1	2017-10-10 11:10:01	\N	\N	\N	\N
6819	404	14	1	2017-10-10 11:13:10	\N	\N	\N	\N
7025	246	14	1	2017-10-10 11:14:26	\N	\N	\N	\N
6646	148	14	1	2017-10-10 11:19:19	\N	\N	\N	\N
6485	696	14	1	2017-10-10 11:20:42	\N	\N	\N	\N
7300	164	14	1	2017-10-10 11:24:41	\N	\N	\N	\N
6531	42	14	1	2017-10-10 11:35:01	\N	\N	\N	\N
6844	424	14	1	2017-10-10 11:42:17	\N	\N	\N	\N
6803	340	14	1	2017-10-10 13:36:25	\N	\N	\N	\N
7196	863	14	1	2017-10-10 13:50:46	\N	\N	\N	\N
6500	31	14	1	2017-10-10 13:57:39	\N	\N	\N	\N
6879	453	14	1	2017-10-10 14:00:06	\N	\N	\N	\N
7014	414	14	1	2017-10-10 14:00:25	\N	\N	\N	\N
6764	336	14	1	2017-10-10 14:04:04	\N	\N	\N	\N
7066	465	14	1	2017-10-10 14:16:21	\N	\N	\N	\N
6682	682	14	1	2017-10-10 14:17:21	\N	\N	\N	\N
7242	587	14	1	2017-10-10 14:19:11	\N	\N	\N	\N
7264	206	14	1	2017-10-10 14:31:49	\N	\N	\N	\N
6502	10	14	1	2017-10-10 14:34:02	\N	\N	\N	\N
7107	308	14	1	2017-10-10 14:42:46	\N	\N	\N	\N
6792	373	14	1	2017-10-10 14:52:39	\N	\N	\N	\N
6663	231	14	1	2017-10-10 15:07:07	\N	\N	\N	\N
7080	427	14	1	2017-10-10 15:09:25	\N	\N	\N	\N
7071	606	14	1	2017-10-10 15:13:56	\N	\N	\N	\N
7151	822	14	1	2017-10-10 15:37:25	\N	\N	\N	\N
6534	88	14	1	2017-10-10 16:14:03	\N	\N	\N	\N
\.


--
-- Name: ventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ventas_id_seq', 7320, true);


--
-- Name: bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (id);


--
-- Name: evento_productos_id_evento_id_producto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento_productos
    ADD CONSTRAINT evento_productos_id_evento_id_producto_key UNIQUE (id_evento, id_producto);


--
-- Name: evento_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento_productos
    ADD CONSTRAINT evento_productos_pkey PRIMARY KEY (id);


--
-- Name: eventos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventos
    ADD CONSTRAINT eventos_nombre_key UNIQUE (nombre);


--
-- Name: eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventos
    ADD CONSTRAINT eventos_pkey PRIMARY KEY (id);


--
-- Name: fos_user_email_canonical_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fos_user
    ADD CONSTRAINT fos_user_email_canonical_key UNIQUE (email_canonical);


--
-- Name: fos_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fos_user
    ADD CONSTRAINT fos_user_pkey PRIMARY KEY (id);


--
-- Name: fos_user_username_canonical_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fos_user
    ADD CONSTRAINT fos_user_username_canonical_key UNIQUE (username_canonical);


--
-- Name: personas_nacionalidad_cedula_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_nacionalidad_cedula_key UNIQUE (nacionalidad, cedula);


--
-- Name: personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- Name: productos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT productos_nombre_key UNIQUE (nombre);


--
-- Name: productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: user_evento_id_user_id_evento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_evento
    ADD CONSTRAINT user_evento_id_user_id_evento_key UNIQUE (id_user, id_evento);


--
-- Name: user_evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_evento
    ADD CONSTRAINT user_evento_pkey PRIMARY KEY (id);


--
-- Name: ventas_id_personal_id_eventos_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas
    ADD CONSTRAINT ventas_id_personal_id_eventos_key UNIQUE (id_personal, id_eventos);


--
-- Name: ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);


--
-- Name: bitacora_id_usuario_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bitacora_id_usuario_idx ON bitacora USING btree (id_usuario);


--
-- Name: evento_productos_id_producto_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX evento_productos_id_producto_idx ON evento_productos USING btree (id_producto);


--
-- Name: user_evento_id_evento_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_evento_id_evento_idx ON user_evento USING btree (id_evento);


--
-- Name: user_evento_id_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_evento_id_user_idx ON user_evento USING btree (id_user);


--
-- Name: ventas_id_eventos_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ventas_id_eventos_idx ON ventas USING btree (id_eventos);


--
-- Name: id_usuario_bitacora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT id_usuario_bitacora FOREIGN KEY (id_usuario) REFERENCES fos_user(id);


--
-- Name: u_evento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento_productos
    ADD CONSTRAINT u_evento FOREIGN KEY (id_evento) REFERENCES eventos(id);


--
-- Name: u_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento_productos
    ADD CONSTRAINT u_producto FOREIGN KEY (id_producto) REFERENCES productos(id);


--
-- Name: user_evento_id_evento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_evento
    ADD CONSTRAINT user_evento_id_evento_fkey FOREIGN KEY (id_evento) REFERENCES eventos(id);


--
-- Name: user_evento_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_evento
    ADD CONSTRAINT user_evento_id_user_fkey FOREIGN KEY (id_user) REFERENCES fos_user(id);


--
-- Name: ventas_id_eventos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas
    ADD CONSTRAINT ventas_id_eventos_fkey FOREIGN KEY (id_eventos) REFERENCES eventos(id);


--
-- Name: ventas_id_personal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas
    ADD CONSTRAINT ventas_id_personal_fkey FOREIGN KEY (id_personal) REFERENCES personas(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

