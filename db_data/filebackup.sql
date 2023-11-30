--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17
-- Dumped by pg_dump version 12.17

-- Started on 2023-11-30 22:39:04 UTC

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
-- TOC entry 3063 (class 1262 OID 16384)
-- Name: booking; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE booking WITH TEMPLATE = template0 ENCODING = 'UTF8';-- LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE booking OWNER TO postgres;

\connect booking

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16456)
-- Name: balconies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.balconies (
    id bigint NOT NULL,
    "row" integer,
    col integer,
    email character varying(255),
    price double precision,
    active boolean,
    uuid character varying(255),
    qr text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.balconies OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16454)
-- Name: balconies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.balconies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.balconies_id_seq OWNER TO postgres;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 202
-- Name: balconies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.balconies_id_seq OWNED BY public.balconies.id;


--
-- TOC entry 215 (class 1259 OID 17015)
-- Name: balcons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.balcons (
    id bigint NOT NULL,
    "row" integer,
    col integer,
    email character varying(255),
    price double precision,
    active boolean,
    uuid character varying(255),
    qr text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "eventId" bigint,
    "sectorId" integer,
    "statusId" integer
);


ALTER TABLE public.balcons OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17013)
-- Name: balcons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.balcons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.balcons_id_seq OWNER TO postgres;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 214
-- Name: balcons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.balcons_id_seq OWNED BY public.balcons.id;


--
-- TOC entry 207 (class 1259 OID 16959)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    name text,
    date date,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16957)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 206
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 213 (class 1259 OID 16989)
-- Name: seats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seats (
    id bigint NOT NULL,
    "row" integer,
    col integer,
    email character varying(255),
    price double precision,
    active boolean,
    uuid character varying(255),
    qr text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "eventId" bigint,
    "sectorId" integer,
    "statusId" integer
);


ALTER TABLE public.seats OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16987)
-- Name: seats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seats_id_seq OWNER TO postgres;

--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 212
-- Name: seats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seats_id_seq OWNED BY public.seats.id;


--
-- TOC entry 209 (class 1259 OID 16970)
-- Name: sectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sectors (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.sectors OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16968)
-- Name: sectors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sectors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sectors_id_seq OWNER TO postgres;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 208
-- Name: sectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sectors_id_seq OWNED BY public.sectors.id;


--
-- TOC entry 211 (class 1259 OID 16981)
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statuses (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.statuses OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16979)
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statuses_id_seq OWNER TO postgres;

--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 210
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;


--
-- TOC entry 205 (class 1259 OID 16946)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16944)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2889 (class 2604 OID 16459)
-- Name: balconies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balconies ALTER COLUMN id SET DEFAULT nextval('public.balconies_id_seq'::regclass);


--
-- TOC entry 2895 (class 2604 OID 17018)
-- Name: balcons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balcons ALTER COLUMN id SET DEFAULT nextval('public.balcons_id_seq'::regclass);


--
-- TOC entry 2891 (class 2604 OID 16962)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 2894 (class 2604 OID 16992)
-- Name: seats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats ALTER COLUMN id SET DEFAULT nextval('public.seats_id_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 16973)
-- Name: sectors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors ALTER COLUMN id SET DEFAULT nextval('public.sectors_id_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 16984)
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 16949)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3045 (class 0 OID 16456)
-- Dependencies: 203
-- Data for Name: balconies; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3057 (class 0 OID 17015)
-- Dependencies: 215
-- Data for Name: balcons; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (1, 1, 1, NULL, 1344, true, '8899909693710', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (2, 2, 1, NULL, 1344, true, '5651443839337', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (3, 1, 2, NULL, 1344, true, '8973710046868', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (4, 2, 2, NULL, 1344, true, '79303342223', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (5, 1, 3, NULL, 1344, true, '3820138603741', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (6, 2, 3, NULL, 1344, true, '9211081899732', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (7, 1, 4, NULL, 1344, true, '2578093763324', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (8, 2, 4, NULL, 1344, true, '8469350872958', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (9, 1, 5, NULL, 1344, true, '1310289765900', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (10, 2, 5, NULL, 1344, true, '4459844285007', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (11, 1, 6, NULL, 1344, true, '2589438045053', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (12, 2, 6, NULL, 1344, true, '9724918345801', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (13, 1, 7, NULL, 1344, true, '6260646707278', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (14, 2, 7, NULL, 1344, true, '4542896957073', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (15, 1, 8, NULL, 1344, true, '6362485247242', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (16, 2, 8, NULL, 1344, true, '812620829683', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (17, 1, 9, NULL, 1344, true, '8218287696649', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (18, 2, 9, NULL, 1344, true, '6936407644477', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (19, 1, 10, NULL, 1344, true, '9227072670029', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (20, 2, 10, NULL, 1344, true, '3909728795735', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (21, 1, 11, NULL, 1344, true, '5125893406094', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (22, 2, 11, NULL, 1344, true, '6695700046971', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (23, 1, 12, NULL, 1344, true, '9116990273850', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (24, 2, 12, NULL, 1344, true, '18663715884', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (25, 1, 13, NULL, 1344, true, '8243100913728', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (26, 2, 13, NULL, 1344, true, '4733465510998', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (27, 1, 14, NULL, 1344, true, '2420542155741', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (28, 2, 14, NULL, 1344, true, '6308148733976', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (29, 1, 15, NULL, 1344, true, '9798382997336', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (30, 2, 15, NULL, 1344, true, '8681449320086', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (31, 1, 16, NULL, 1344, true, '2446657541630', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (32, 2, 16, NULL, 1344, true, '2962717615388', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (33, 1, 17, NULL, 1344, true, '5854054543433', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (34, 2, 17, NULL, 1344, true, '536674054894', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (35, 1, 18, NULL, 1344, true, '2966673167287', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (36, 2, 18, NULL, 1344, true, '7167217662580', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (37, 1, 19, NULL, 1344, true, '7679745219956', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (38, 2, 19, NULL, 1344, true, '9713473968602', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (39, 1, 20, NULL, 1344, true, '6843771426948', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (40, 2, 20, NULL, 1344, true, '6256252488560', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (41, 1, 21, NULL, 1344, true, '6244370419311', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (42, 2, 21, NULL, 1344, true, '1328823705978', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (43, 1, 22, NULL, 1344, true, '749992946747', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (44, 2, 22, NULL, 1344, true, '3450001968999', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (45, 1, 23, NULL, 1344, true, '4728112455500', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (46, 2, 23, NULL, 1344, true, '6289035685549', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (47, 1, 24, NULL, 1344, true, '2341195205714', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (48, 2, 24, NULL, 1344, true, '6301262650507', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (49, 1, 25, NULL, 1344, true, '593648653347', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (50, 2, 25, NULL, 1344, true, '2446551997501', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (51, 1, 26, NULL, 1344, true, '62951073335', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (52, 2, 26, NULL, 1344, true, '6711575486366', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (53, 1, 27, NULL, 1344, true, '2003037450108', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (54, 2, 27, NULL, 1344, true, '8604879699985', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (55, 1, 28, NULL, 1344, true, '3655075666583', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (56, 2, 28, NULL, 1344, true, '2813344941766', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (57, 1, 29, NULL, 1344, true, '7204167460902', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (58, 2, 29, NULL, 1344, true, '5730224116001', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (59, 1, 30, NULL, 1344, true, '9194258160492', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (60, 2, 30, NULL, 1344, true, '6465920044171', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (61, 1, 31, NULL, 1344, true, '2964586043906', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (62, 2, 31, NULL, 1344, true, '3247382330042', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (63, 1, 32, NULL, 1344, true, '5565580831537', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (64, 2, 32, NULL, 1344, true, '1272349347318', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (65, 1, 33, NULL, 1344, true, '8225813491663', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (66, 2, 33, NULL, 1344, true, '3040375410707', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (67, 1, 34, NULL, 1344, true, '3856530180123', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (68, 2, 34, NULL, 1344, true, '9289626789962', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (69, 1, 35, NULL, 1344, true, '1308705429158', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (70, 2, 35, NULL, 1344, true, '900807210112', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (71, 1, 36, NULL, 1344, true, '3110120860244', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (72, 2, 36, NULL, 1344, true, '8787976170009', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (73, 1, 37, NULL, 1344, true, '778728409381', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (74, 2, 37, NULL, 1344, true, '9428125630580', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (75, 1, 38, NULL, 1344, true, '2498680191428', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (76, 2, 38, NULL, 1344, true, '7280992813459', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (77, 1, 39, NULL, 1344, true, '4284677394382', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (78, 2, 39, NULL, 1344, true, '3824253930696', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (79, 1, 40, NULL, 1344, true, '3615273613752', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (80, 2, 40, NULL, 1344, true, '2536525118720', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (81, 1, 41, NULL, 1344, true, '3985082481067', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (82, 2, 41, NULL, 1344, true, '2638350005170', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (83, 1, 42, NULL, 1344, true, '9508790778396', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (84, 2, 42, NULL, 1344, true, '6914274701398', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (85, 1, 43, NULL, 1344, true, '9931873959359', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (86, 2, 43, NULL, 1344, true, '7091867899535', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (87, 1, 44, NULL, 1344, true, '3885051201686', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (88, 2, 44, NULL, 1344, true, '5851533725884', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (89, 1, 45, NULL, 1344, true, '5744147774333', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (90, 2, 45, NULL, 1344, true, '6374486265405', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (91, 1, 46, NULL, 1344, true, '8071256362549', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (92, 2, 46, NULL, 1344, true, '6509273841463', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (93, 1, 47, NULL, 1344, true, '9009285637286', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (94, 2, 47, NULL, 1344, true, '4841797631005', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (95, 1, 48, NULL, 1344, true, '1182443513925', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (96, 2, 48, NULL, 1344, true, '2549442224886', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (97, 1, 49, NULL, 1344, true, '1798958112718', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (98, 2, 49, NULL, 1344, true, '9740017159233', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (99, 1, 50, NULL, 1344, true, '4436381639818', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (100, 2, 50, NULL, 1344, true, '3297651841445', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (101, 1, 51, NULL, 1344, true, '148462235044', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (102, 2, 51, NULL, 1344, true, '994946131829', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (103, 1, 52, NULL, 1344, true, '7250773474409', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (104, 2, 52, NULL, 1344, true, '2124179110533', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (105, 1, 53, NULL, 1344, true, '288124720676', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (106, 2, 53, NULL, 1344, true, '7796454385816', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (107, 1, 54, NULL, 1344, true, '8458043450670', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (108, 2, 54, NULL, 1344, true, '6115823404412', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (109, 1, 55, NULL, 1344, true, '8238180386607', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (110, 2, 55, NULL, 1344, true, '2478644181996', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (111, 1, 56, NULL, 1344, true, '1435460789046', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (112, 2, 56, NULL, 1344, true, '6024697432005', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (113, 1, 57, NULL, 1344, true, '2062133002584', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (114, 2, 57, NULL, 1344, true, '6726177943672', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (115, 1, 58, NULL, 1344, true, '9471442003315', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (116, 2, 58, NULL, 1344, true, '3986566328800', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (117, 1, 59, NULL, 1344, true, '8948162130049', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (118, 2, 59, NULL, 1344, true, '6017576572785', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (119, 1, 60, NULL, 1344, true, '9415028756921', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (120, 2, 60, NULL, 1344, true, '1593429165661', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (121, 1, 61, NULL, 1344, true, '5323765657474', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (122, 2, 61, NULL, 1344, true, '7946411873830', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (123, 1, 62, NULL, 1344, true, '1294075707059', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (124, 2, 62, NULL, 1344, true, '7194209482528', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (125, 1, 63, NULL, 1344, true, '3639352042841', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (126, 2, 63, NULL, 1344, true, '5033090588868', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (127, 1, 64, NULL, 1344, true, '6077220767652', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (128, 2, 64, NULL, 1344, true, '5301275984330', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (129, 1, 65, NULL, 1344, true, '9958184821446', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (130, 2, 65, NULL, 1344, true, '5492167425160', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (131, 1, 66, NULL, 1344, true, '6002799178810', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (132, 2, 66, NULL, 1344, true, '5999807774403', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (133, 1, 67, NULL, 1344, true, '6231880931789', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (134, 2, 67, NULL, 1344, true, '5718271231495', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (135, 1, 68, NULL, 1344, true, '4173648837939', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (136, 2, 68, NULL, 1344, true, '7637563027653', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (137, 1, 69, NULL, 1344, true, '895726381341', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (138, 2, 69, NULL, 1344, true, '8157901790627', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (139, 1, 70, NULL, 1344, true, '296655602902', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (140, 2, 70, NULL, 1344, true, '6687625034172', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (141, 1, 71, NULL, 1344, true, '497406274511', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (142, 2, 71, NULL, 1344, true, '5083835300373', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (143, 1, 72, NULL, 1344, true, '8142749513112', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (144, 2, 72, NULL, 1344, true, '7239745757677', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (145, 1, 73, NULL, 1344, true, '2396924889153', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (146, 2, 73, NULL, 1344, true, '7730067083205', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (147, 1, 74, NULL, 1344, true, '3805893183772', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (148, 2, 74, NULL, 1344, true, '966071766868', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (149, 1, 75, NULL, 1344, true, '7706020756511', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (150, 2, 75, NULL, 1344, true, '1162727774234', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (151, 1, 76, NULL, 1344, true, '9655790551086', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (152, 2, 76, NULL, 1344, true, '4216101770779', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (153, 1, 77, NULL, 1344, true, '9889500597292', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (154, 2, 77, NULL, 1344, true, '1758273522250', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (155, 1, 78, NULL, 1344, true, '5726609621228', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (156, 2, 78, NULL, 1344, true, '4939827359933', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (157, 1, 79, NULL, 1344, true, '7156469057528', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (158, 2, 79, NULL, 1344, true, '7879834179623', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (159, 1, 80, NULL, 1344, true, '3820418264961', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (160, 2, 80, NULL, 1344, true, '5278897505916', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (161, 1, 81, NULL, 1344, true, '9654417120799', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 4, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (162, 3, 1, NULL, 123, true, '6663957660133', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (163, 4, 1, NULL, 123, true, '4708928043029', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (164, 5, 1, NULL, 123, true, '3018937852976', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (165, 6, 1, NULL, 123, true, '6353682984552', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (166, 3, 2, NULL, 123, true, '6292281518598', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (167, 4, 2, NULL, 123, true, '1218041314803', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (168, 5, 2, NULL, 123, true, '7906097715580', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (169, 6, 2, NULL, 123, true, '8344950680238', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (170, 3, 3, NULL, 123, true, '2870428966120', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (171, 4, 3, NULL, 123, true, '1340197020136', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (172, 5, 3, NULL, 123, true, '8257449531529', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (173, 6, 3, NULL, 123, true, '1342896014897', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (174, 3, 4, NULL, 123, true, '5310990172195', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (175, 4, 4, NULL, 123, true, '2488847496577', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (176, 5, 4, NULL, 123, true, '67983539723', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (177, 6, 4, NULL, 123, true, '3027203620666', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (178, 3, 5, NULL, 123, true, '5137089263895', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (179, 4, 5, NULL, 123, true, '1650681368718', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (180, 5, 5, NULL, 123, true, '8146955339693', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (181, 6, 5, NULL, 123, true, '1831071172753', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (182, 3, 6, NULL, 123, true, '4027406691848', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (183, 4, 6, NULL, 123, true, '7596171552076', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (184, 5, 6, NULL, 123, true, '8426671562867', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (185, 6, 6, NULL, 123, true, '5149771674092', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (186, 3, 7, NULL, 123, true, '7967414407095', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (187, 4, 7, NULL, 123, true, '7618389777588', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (188, 5, 7, NULL, 123, true, '9380851950673', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (189, 6, 7, NULL, 123, true, '2079778938198', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (190, 3, 8, NULL, 123, true, '1588444624543', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (191, 4, 8, NULL, 123, true, '9601457008831', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (192, 5, 8, NULL, 123, true, '6301574093368', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (193, 6, 8, NULL, 123, true, '5494990163537', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (194, 3, 9, NULL, 123, true, '971212634593', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (195, 4, 9, NULL, 123, true, '867040763940', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (196, 5, 9, NULL, 123, true, '8547109161165', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (197, 6, 9, NULL, 123, true, '7501536668098', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (198, 3, 10, NULL, 123, true, '6220695404258', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (199, 4, 10, NULL, 123, true, '3304480368641', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (200, 5, 10, NULL, 123, true, '6412592453675', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (201, 6, 10, NULL, 123, true, '7961885013552', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (202, 3, 11, NULL, 123, true, '3175764375884', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (203, 4, 11, NULL, 123, true, '8743169630411', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (204, 5, 11, NULL, 123, true, '1155868261281', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (205, 6, 11, NULL, 123, true, '5801136897754', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (206, 3, 12, NULL, 123, true, '5633854983298', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (207, 4, 12, NULL, 123, true, '5744051447625', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (208, 5, 12, NULL, 123, true, '726656996048', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (209, 6, 12, NULL, 123, true, '1908239951873', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (210, 3, 13, NULL, 123, true, '9528313659525', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (211, 4, 13, NULL, 123, true, '1788111845742', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (212, 5, 13, NULL, 123, true, '8278873031273', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (213, 6, 13, NULL, 123, true, '5868034847340', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (214, 3, 14, NULL, 123, true, '6272548313050', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (215, 4, 14, NULL, 123, true, '2701448740029', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (216, 5, 14, NULL, 123, true, '9862306237957', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (217, 6, 14, NULL, 123, true, '6187038604158', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (218, 3, 15, NULL, 123, true, '7549094722406', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (219, 4, 15, NULL, 123, true, '4672413013521', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (220, 5, 15, NULL, 123, true, '8584815368823', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (221, 6, 15, NULL, 123, true, '7720423238289', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (222, 3, 16, NULL, 123, true, '8954434373193', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (223, 4, 16, NULL, 123, true, '9164746748307', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (224, 5, 16, NULL, 123, true, '6709984114338', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (225, 6, 16, NULL, 123, true, '9652818098039', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (226, 3, 17, NULL, 123, true, '3531804115921', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (227, 4, 17, NULL, 123, true, '9249655314422', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (228, 5, 17, NULL, 123, true, '8737687361710', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (229, 6, 17, NULL, 123, true, '5165552754645', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (230, 3, 18, NULL, 123, true, '2989140856483', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (231, 4, 18, NULL, 123, true, '9119964995218', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (232, 5, 18, NULL, 123, true, '9008492545169', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (233, 6, 18, NULL, 123, true, '1435450517343', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (234, 3, 19, NULL, 123, true, '2525978696274', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (235, 4, 19, NULL, 123, true, '2227675156071', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (236, 5, 19, NULL, 123, true, '118113135306', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (237, 6, 19, NULL, 123, true, '2501501413218', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (238, 3, 20, NULL, 123, true, '1447762726455', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (239, 4, 20, NULL, 123, true, '786779454171', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (240, 5, 20, NULL, 123, true, '548743303953', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (241, 6, 20, NULL, 123, true, '59723982984', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (242, 3, 21, NULL, 123, true, '4357746094569', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (243, 4, 21, NULL, 123, true, '1401223306724', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (244, 5, 21, NULL, 123, true, '9447362113496', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (245, 6, 21, NULL, 123, true, '9979695293581', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (246, 3, 22, NULL, 123, true, '7729006761146', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (247, 4, 22, NULL, 123, true, '889302698815', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (248, 5, 22, NULL, 123, true, '7282760634131', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (249, 6, 22, NULL, 123, true, '9909911532988', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (250, 3, 23, NULL, 123, true, '5905128498164', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (251, 4, 23, NULL, 123, true, '5387093887887', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (252, 5, 23, NULL, 123, true, '4720248459299', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (253, 6, 23, NULL, 123, true, '5243444996982', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (254, 3, 24, NULL, 123, true, '6279485664211', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (255, 4, 24, NULL, 123, true, '8181282242485', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (256, 5, 24, NULL, 123, true, '3744470097192', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (257, 6, 24, NULL, 123, true, '3950844907942', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (258, 3, 25, NULL, 123, true, '6033124479239', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (259, 4, 25, NULL, 123, true, '7257107825112', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (260, 5, 25, NULL, 123, true, '1644794985800', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (261, 6, 25, NULL, 123, true, '1142233083638', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (262, 3, 26, NULL, 123, true, '8468118831194', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (263, 4, 26, NULL, 123, true, '1121896325148', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (264, 5, 26, NULL, 123, true, '5468938688018', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (265, 6, 26, NULL, 123, true, '9651594644777', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (266, 3, 27, NULL, 123, true, '2470425684798', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (267, 4, 27, NULL, 123, true, '7520717422835', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (268, 5, 27, NULL, 123, true, '574504067417', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (269, 6, 27, NULL, 123, true, '9982577793987', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (270, 3, 28, NULL, 123, true, '775936706442', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (271, 4, 28, NULL, 123, true, '5124317926787', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (272, 5, 28, NULL, 123, true, '294378509186', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (273, 6, 28, NULL, 123, true, '3531167352377', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (274, 3, 29, NULL, 123, true, '5930454480642', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (275, 4, 29, NULL, 123, true, '6423666969754', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (276, 5, 29, NULL, 123, true, '2015469075331', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (277, 6, 29, NULL, 123, true, '3263294419169', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (278, 3, 30, NULL, 123, true, '2234389004911', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (279, 4, 30, NULL, 123, true, '2355696367874', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (280, 5, 30, NULL, 123, true, '8056637995231', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (281, 6, 30, NULL, 123, true, '6778052300022', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (282, 3, 31, NULL, 123, true, '4184050600305', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (283, 4, 31, NULL, 123, true, '5508217838783', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (284, 5, 31, NULL, 123, true, '5313952514705', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (285, 6, 31, NULL, 123, true, '3336357252592', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (286, 3, 32, NULL, 123, true, '9249944918205', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (287, 4, 32, NULL, 123, true, '8545910582823', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (288, 5, 32, NULL, 123, true, '6470140906324', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (289, 6, 32, NULL, 123, true, '3060367336668', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (290, 3, 33, NULL, 123, true, '3194914731150', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (291, 4, 33, NULL, 123, true, '9011750189260', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (292, 5, 33, NULL, 123, true, '3583495527378', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (293, 6, 33, NULL, 123, true, '9678987612856', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (294, 3, 34, NULL, 123, true, '4311750838930', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (295, 4, 34, NULL, 123, true, '358093457831', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (296, 5, 34, NULL, 123, true, '4724277405667', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (297, 6, 34, NULL, 123, true, '6998161985481', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (298, 3, 35, NULL, 123, true, '5434369150478', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (299, 4, 35, NULL, 123, true, '2965002599501', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (300, 5, 35, NULL, 123, true, '3565805683345', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (301, 6, 35, NULL, 123, true, '2561090370872', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (302, 3, 36, NULL, 123, true, '5231651809129', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (303, 4, 36, NULL, 123, true, '2829389032280', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (304, 5, 36, NULL, 123, true, '3926484179764', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (305, 6, 36, NULL, 123, true, '8428723789626', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (306, 3, 37, NULL, 123, true, '6905339972662', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (307, 4, 37, NULL, 123, true, '9995711561704', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (308, 5, 37, NULL, 123, true, '467888437548', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (309, 6, 37, NULL, 123, true, '9541295768432', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (310, 3, 38, NULL, 123, true, '7725686107241', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (311, 4, 38, NULL, 123, true, '431469951534', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (312, 5, 38, NULL, 123, true, '7670550395587', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (313, 6, 38, NULL, 123, true, '1890970465007', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (314, 3, 39, NULL, 123, true, '5673355334612', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (315, 4, 39, NULL, 123, true, '8005252395435', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (316, 5, 39, NULL, 123, true, '9148835800119', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (317, 6, 39, NULL, 123, true, '6708334150632', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (318, 3, 40, NULL, 123, true, '9203742342432', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (319, 4, 40, NULL, 123, true, '8735234289070', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (320, 5, 40, NULL, 123, true, '3644676698882', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (321, 6, 40, NULL, 123, true, '3197880774079', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (322, 3, 41, NULL, 123, true, '2786068077014', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (323, 4, 41, NULL, 123, true, '9625830505478', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (324, 5, 41, NULL, 123, true, '8296406741030', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (325, 3, 42, NULL, 123, true, '4838610113779', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (326, 4, 42, NULL, 123, true, '5428643400163', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (327, 5, 42, NULL, 123, true, '9366234684740', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (328, 3, 43, NULL, 123, true, '2590944950562', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (329, 4, 43, NULL, 123, true, '5853677058047', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (330, 5, 43, NULL, 123, true, '901375713829', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (331, 3, 44, NULL, 123, true, '5249494335926', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (332, 4, 44, NULL, 123, true, '1425400623368', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (333, 5, 44, NULL, 123, true, '3179025591758', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (334, 3, 45, NULL, 123, true, '5656762001155', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (335, 4, 45, NULL, 123, true, '9548360359666', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (336, 5, 45, NULL, 123, true, '7053752915004', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (337, 3, 46, NULL, 123, true, '5838521521439', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (338, 4, 46, NULL, 123, true, '7360153931945', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (339, 5, 46, NULL, 123, true, '8986921082476', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (340, 3, 47, NULL, 123, true, '4666125984093', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (341, 4, 47, NULL, 123, true, '7529399775151', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (342, 5, 47, NULL, 123, true, '9398004147912', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (343, 3, 48, NULL, 123, true, '4264239508127', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (344, 4, 48, NULL, 123, true, '7187173563312', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (345, 5, 48, NULL, 123, true, '8243308113032', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (346, 3, 49, NULL, 123, true, '7296242556514', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (347, 4, 49, NULL, 123, true, '2770438637190', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (348, 5, 49, NULL, 123, true, '2379211454250', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (349, 3, 50, NULL, 123, true, '4641907274803', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (350, 4, 50, NULL, 123, true, '8599577649061', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (351, 5, 50, NULL, 123, true, '1762195266490', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (352, 3, 51, NULL, 123, true, '996307026281', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (353, 4, 51, NULL, 123, true, '9366447754913', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (354, 5, 51, NULL, 123, true, '7190044291023', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (355, 3, 52, NULL, 123, true, '4868763887581', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (356, 4, 52, NULL, 123, true, '3332808697064', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (357, 5, 52, NULL, 123, true, '729843654499', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (358, 3, 53, NULL, 123, true, '2536709341480', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (359, 4, 53, NULL, 123, true, '9982400749923', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (360, 5, 53, NULL, 123, true, '5773775785699', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (361, 3, 54, NULL, 123, true, '1134082606509', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (362, 4, 54, NULL, 123, true, '1101762740646', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (363, 5, 54, NULL, 123, true, '8167389408501', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (364, 3, 55, NULL, 123, true, '1614394059674', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (365, 4, 55, NULL, 123, true, '4139532529396', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (366, 5, 55, NULL, 123, true, '8434847105572', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (367, 3, 56, NULL, 123, true, '8816875664639', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (368, 4, 56, NULL, 123, true, '6438450303608', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (369, 3, 57, NULL, 123, true, '6088385427023', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (370, 4, 57, NULL, 123, true, '4719949103226', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (371, 3, 58, NULL, 123, true, '6416379545306', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (372, 4, 58, NULL, 123, true, '3809926198412', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (373, 3, 59, NULL, 123, true, '3587129852351', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (374, 4, 59, NULL, 123, true, '1154335922641', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (375, 3, 60, NULL, 123, true, '328495866586', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (376, 4, 60, NULL, 123, true, '8180668077129', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (377, 3, 61, NULL, 123, true, '8942374279301', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (378, 4, 61, NULL, 123, true, '890457794517', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (379, 3, 62, NULL, 123, true, '21911797392', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (380, 4, 62, NULL, 123, true, '2170541444010', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (381, 3, 63, NULL, 123, true, '4423387377214', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (382, 4, 63, NULL, 123, true, '8277984360601', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (383, 3, 64, NULL, 123, true, '4543801352948', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (384, 4, 64, NULL, 123, true, '2230489992675', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (385, 3, 65, NULL, 123, true, '4083824333503', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (386, 4, 65, NULL, 123, true, '2323365709312', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (387, 3, 66, NULL, 123, true, '8886061536799', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (388, 3, 67, NULL, 123, true, '1751545615686', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (389, 3, 68, NULL, 123, true, '1874520631133', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (390, 3, 69, NULL, 123, true, '8809925181022', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (391, 3, 70, NULL, 123, true, '3228109613259', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (392, 3, 71, NULL, 123, true, '2715265707404', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (393, 3, 72, NULL, 123, true, '4410189873450', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (394, 3, 73, NULL, 123, true, '83886642269', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (395, 3, 74, NULL, 123, true, '5573618395358', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (396, 3, 75, NULL, 123, true, '7049322393663', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (397, 3, 76, NULL, 123, true, '5631486973501', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (398, 3, 77, NULL, 123, true, '2681217645281', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (399, 3, 78, NULL, 123, true, '2013760688790', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);
INSERT INTO public.balcons (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (400, 3, 79, NULL, 123, true, '3628174270550', NULL, '2023-11-30 22:35:59.647+00', '2023-11-30 22:35:59.647+00', 1, 1, 1);


--
-- TOC entry 3049 (class 0 OID 16959)
-- Dependencies: 207
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.events (id, name, date, "createdAt", "updatedAt") VALUES (1, 'aaa', '2023-10-09', '2023-11-30 22:35:59.335+00', '2023-11-30 22:35:59.335+00');


--
-- TOC entry 3055 (class 0 OID 16989)
-- Dependencies: 213
-- Data for Name: seats; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (1, 1, 1, NULL, 43345, true, '7416127583312', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (2, 2, 1, NULL, 43345, true, '7238778055165', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (3, 3, 1, NULL, 43345, true, '8437331707477', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (4, 4, 1, NULL, 43345, true, '9698513256861', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (5, 1, 2, NULL, 43345, true, '1439521365915', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (6, 2, 2, NULL, 43345, true, '6805412111093', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (7, 3, 2, NULL, 43345, true, '8471947098377', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (8, 4, 2, NULL, 43345, true, '2070989924586', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (9, 1, 3, NULL, 43345, true, '2532766671856', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (10, 2, 3, NULL, 43345, true, '6774318035438', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (11, 3, 3, NULL, 43345, true, '4686396840300', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (12, 4, 3, NULL, 43345, true, '9613088576822', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (13, 1, 4, NULL, 43345, true, '4198151727211', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (14, 2, 4, NULL, 43345, true, '1371302299593', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (15, 3, 4, NULL, 43345, true, '4894955405839', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (16, 4, 4, NULL, 43345, true, '1956652906998', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (17, 1, 5, NULL, 43345, true, '4162157950153', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (18, 3, 5, NULL, 43345, true, '6095599851509', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (19, 4, 5, NULL, 43345, true, '9440431628275', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (20, 1, 6, NULL, 43345, true, '2794361310840', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (21, 3, 6, NULL, 43345, true, '9461657125834', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (22, 4, 6, NULL, 43345, true, '5143352998819', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (23, 1, 7, NULL, 43345, true, '2713345535640', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (24, 3, 7, NULL, 43345, true, '7587738059850', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (25, 4, 7, NULL, 43345, true, '4395447931300', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (26, 5, 7, NULL, 43345, true, '5698648855831', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (27, 1, 8, NULL, 43345, true, '2538394488497', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (28, 3, 8, NULL, 43345, true, '5185546081750', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (29, 4, 8, NULL, 43345, true, '929852517035', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (30, 5, 8, NULL, 43345, true, '4945263778410', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (31, 6, 8, NULL, 43345, true, '7760274037667', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (32, 1, 9, NULL, 43345, true, '6217806521411', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (33, 2, 9, NULL, 43345, true, '8346559461944', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (34, 3, 9, NULL, 43345, true, '1220225495016', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (35, 4, 9, NULL, 43345, true, '9812841646594', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (36, 5, 9, NULL, 43345, true, '8235126989173', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (37, 6, 9, NULL, 43345, true, '9338067504162', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (38, 7, 9, NULL, 43345, true, '6396893999171', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (39, 1, 10, NULL, 43345, true, '6965410702978', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (40, 2, 10, NULL, 43345, true, '1623685620776', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (41, 3, 10, NULL, 43345, true, '1719371936126', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (42, 4, 10, NULL, 43345, true, '6775685143107', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (43, 5, 10, NULL, 43345, true, '7059526693922', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (44, 6, 10, NULL, 43345, true, '9188502966239', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (45, 7, 10, NULL, 43345, true, '8122256474721', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (46, 1, 11, NULL, 43345, true, '2368003243047', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (47, 2, 11, NULL, 43345, true, '6048225656362', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (48, 3, 11, NULL, 43345, true, '2897989659018', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (49, 5, 11, NULL, 43345, true, '14755504766', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (50, 6, 11, NULL, 43345, true, '5634068075664', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (51, 7, 11, NULL, 43345, true, '8196293420781', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (52, 1, 12, NULL, 43345, true, '8675266057222', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (53, 2, 12, NULL, 43345, true, '7431370848703', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (54, 3, 12, NULL, 43345, true, '9664057005692', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (55, 5, 12, NULL, 43345, true, '2743824792081', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (56, 6, 12, NULL, 43345, true, '8385385758913', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (57, 7, 12, NULL, 43345, true, '5244448291302', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (58, 1, 13, NULL, 43345, true, '3433684143504', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (59, 2, 13, NULL, 43345, true, '8675425125763', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (60, 3, 13, NULL, 43345, true, '2745373024261', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (61, 5, 13, NULL, 43345, true, '3860062335412', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (62, 6, 13, NULL, 43345, true, '6811991385081', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (63, 7, 13, NULL, 43345, true, '4107622679249', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (64, 1, 14, NULL, 43345, true, '9042412192659', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (65, 2, 14, NULL, 43345, true, '2973224979079', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (66, 3, 14, NULL, 43345, true, '9339694869487', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (67, 5, 14, NULL, 43345, true, '8544954628553', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (68, 6, 14, NULL, 43345, true, '2999905911649', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (69, 7, 14, NULL, 43345, true, '3085273322503', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (70, 1, 15, NULL, 43345, true, '8620419346722', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (71, 2, 15, NULL, 43345, true, '8933418350773', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (72, 5, 15, NULL, 43345, true, '7165549469299', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (73, 6, 15, NULL, 43345, true, '1498164486117', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (74, 7, 15, NULL, 43345, true, '6920441538168', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (75, 1, 16, NULL, 43345, true, '7534760644486', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (76, 2, 16, NULL, 43345, true, '6024002935680', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (77, 5, 16, NULL, 43345, true, '5981807429186', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (78, 6, 16, NULL, 43345, true, '6656308963182', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (79, 7, 16, NULL, 43345, true, '2378870321602', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (80, 1, 17, NULL, 43345, true, '6003069948293', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (81, 2, 17, NULL, 43345, true, '5954495953131', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (82, 5, 17, NULL, 43345, true, '4113262186555', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (83, 6, 17, NULL, 43345, true, '4481963532148', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (84, 7, 17, NULL, 43345, true, '481673589182', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (85, 1, 18, NULL, 43345, true, '228895522675', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (86, 2, 18, NULL, 43345, true, '6963261048273', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (87, 5, 18, NULL, 43345, true, '9969270567685', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (88, 6, 18, NULL, 43345, true, '5852306897968', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (89, 7, 18, NULL, 43345, true, '2802225562548', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (90, 5, 19, NULL, 43345, true, '9768235871969', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (91, 6, 19, NULL, 43345, true, '871533955838', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (92, 7, 19, NULL, 43345, true, '6355866561262', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (93, 5, 20, NULL, 43345, true, '3916460055494', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (94, 6, 20, NULL, 43345, true, '4615835774985', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (95, 7, 20, NULL, 43345, true, '1996501839984', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (96, 5, 21, NULL, 43345, true, '1282036779007', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (97, 7, 21, NULL, 43345, true, '4969813139024', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (98, 8, 21, NULL, 43345, true, '4221818689255', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (99, 5, 22, NULL, 43345, true, '1171386310942', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (100, 7, 22, NULL, 43345, true, '5256355961189', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (101, 8, 22, NULL, 43345, true, '7699662886735', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (102, 5, 23, NULL, 43345, true, '2697408229597', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (103, 7, 23, NULL, 43345, true, '1841582875740', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (104, 8, 23, NULL, 43345, true, '5844560860271', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (105, 5, 24, NULL, 43345, true, '7641982404024', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (106, 7, 24, NULL, 43345, true, '6008463874126', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (107, 8, 24, NULL, 43345, true, '4647543637718', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (108, 5, 25, NULL, 43345, true, '6117152514382', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (109, 7, 25, NULL, 43345, true, '5463784196117', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (110, 8, 25, NULL, 43345, true, '8436661664102', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (111, 5, 26, NULL, 43345, true, '9510656219732', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (112, 7, 26, NULL, 43345, true, '7106304845810', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (113, 8, 26, NULL, 43345, true, '452285171610', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (114, 5, 27, NULL, 43345, true, '7869289475703', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (115, 6, 27, NULL, 43345, true, '6809084921557', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (116, 7, 27, NULL, 43345, true, '9470808009354', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (117, 8, 27, NULL, 43345, true, '9476954558629', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (118, 5, 28, NULL, 43345, true, '1672530370975', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (119, 6, 28, NULL, 43345, true, '981945700152', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (120, 7, 28, NULL, 43345, true, '74107880207', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (121, 8, 28, NULL, 43345, true, '8369294174624', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (122, 5, 29, NULL, 43345, true, '1952961563841', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (123, 6, 29, NULL, 43345, true, '3682546289536', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (124, 7, 29, NULL, 43345, true, '1035622904168', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (125, 8, 29, NULL, 43345, true, '4202321988170', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (126, 5, 30, NULL, 43345, true, '6596001208762', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (127, 6, 30, NULL, 43345, true, '1582858468369', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (128, 7, 30, NULL, 43345, true, '1365532440459', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (129, 8, 30, NULL, 43345, true, '4311290929190', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (130, 6, 31, NULL, 43345, true, '1439714933824', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (131, 7, 31, NULL, 43345, true, '4614652677693', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (132, 8, 31, NULL, 43345, true, '9877730226860', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (133, 6, 32, NULL, 43345, true, '3891893519858', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (134, 7, 32, NULL, 43345, true, '2144692733861', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (135, 8, 32, NULL, 43345, true, '1130291566547', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (136, 6, 33, NULL, 43345, true, '9195201105570', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (137, 7, 33, NULL, 43345, true, '269104174389', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (138, 8, 33, NULL, 43345, true, '3368051926347', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (139, 6, 34, NULL, 43345, true, '1839851735908', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (140, 7, 34, NULL, 43345, true, '595915868764', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (141, 8, 34, NULL, 43345, true, '1010718613525', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (142, 7, 35, NULL, 43345, true, '4951372632638', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (143, 8, 35, NULL, 43345, true, '2380094956325', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (144, 7, 36, NULL, 43345, true, '3105270924606', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (145, 7, 37, NULL, 43345, true, '1320119287615', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (146, 7, 38, NULL, 43345, true, '8333168904669', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (147, 7, 39, NULL, 43345, true, '6745938473279', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (148, 7, 40, NULL, 43345, true, '1873974009051', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (149, 7, 41, NULL, 43345, true, '1425307575696', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (150, 7, 42, NULL, 43345, true, '8749872243398', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 2, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (151, 6, 1, NULL, 123, true, '2516910712827', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (152, 5, 1, NULL, 123, true, '1474764022581', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (153, 7, 1, NULL, 123, true, '5365620762818', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (154, 8, 1, NULL, 123, true, '3713372887914', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (155, 9, 1, NULL, 123, true, '111124313188', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (156, 10, 1, NULL, 123, true, '3567850620054', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (157, 11, 1, NULL, 123, true, '1014460625419', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (158, 12, 1, NULL, 123, true, '4835537939290', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (159, 13, 1, NULL, 123, true, '9240356156366', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (160, 14, 1, NULL, 123, true, '1995162536996', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (161, 15, 1, NULL, 123, true, '5051017249076', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (162, 16, 1, NULL, 123, true, '4488349858359', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (163, 18, 1, NULL, 123, true, '7319360118286', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (164, 17, 1, NULL, 123, true, '6217971251618', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (165, 6, 2, NULL, 123, true, '6601821842188', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (166, 5, 2, NULL, 123, true, '2001872086271', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (167, 7, 2, NULL, 123, true, '6804418806276', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (168, 8, 2, NULL, 123, true, '3564895122774', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (169, 9, 2, NULL, 123, true, '9094040532315', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (170, 10, 2, NULL, 123, true, '7117798355088', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (171, 11, 2, NULL, 123, true, '1096109463666', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (172, 12, 2, NULL, 123, true, '4095493270436', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (173, 13, 2, NULL, 123, true, '6016327062751', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (174, 14, 2, NULL, 123, true, '6569259590188', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (175, 15, 2, NULL, 123, true, '5768533505113', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (176, 16, 2, NULL, 123, true, '6931663206553', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (177, 18, 2, NULL, 123, true, '5938651239710', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (178, 17, 2, NULL, 123, true, '8325388414478', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (179, 6, 3, NULL, 123, true, '6937849506449', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (180, 5, 3, NULL, 123, true, '933872998332', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (181, 7, 3, NULL, 123, true, '7807903744149', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (182, 8, 3, NULL, 123, true, '9813618861139', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (183, 9, 3, NULL, 123, true, '3097462000167', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (184, 10, 3, NULL, 123, true, '8870206286130', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (185, 11, 3, NULL, 123, true, '6536346725415', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (186, 12, 3, NULL, 123, true, '8347407067028', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (187, 13, 3, NULL, 123, true, '9564933209795', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (188, 14, 3, NULL, 123, true, '4490192325898', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (189, 15, 3, NULL, 123, true, '7405811826332', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (190, 16, 3, NULL, 123, true, '105865960103', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (191, 18, 3, NULL, 123, true, '8969169085602', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (192, 17, 3, NULL, 123, true, '2966576427427', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (193, 6, 4, NULL, 123, true, '9884419029159', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (194, 5, 4, NULL, 123, true, '8421103961363', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (195, 7, 4, NULL, 123, true, '7075109032474', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (196, 8, 4, NULL, 123, true, '6796896218073', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (197, 9, 4, NULL, 123, true, '5275691282322', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (198, 10, 4, NULL, 123, true, '4505175772863', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (199, 11, 4, NULL, 123, true, '2164119199103', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (200, 12, 4, NULL, 123, true, '871448900958', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (201, 13, 4, NULL, 123, true, '3247528607225', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (202, 14, 4, NULL, 123, true, '799211641309', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (203, 15, 4, NULL, 123, true, '3617377410633', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (204, 16, 4, NULL, 123, true, '8592923372450', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (205, 18, 4, NULL, 123, true, '4435374694506', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (206, 17, 4, NULL, 123, true, '3224468198508', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (207, 13, 5, NULL, 123, true, '7349499013030', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (208, 14, 5, NULL, 123, true, '2662754852874', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (209, 15, 5, NULL, 123, true, '2794928250435', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (210, 16, 5, NULL, 123, true, '4169934286735', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (211, 18, 5, NULL, 123, true, '8388457279402', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (212, 17, 5, NULL, 123, true, '2799972276320', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (213, 13, 6, NULL, 123, true, '6082512189848', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (214, 14, 6, NULL, 123, true, '5551062012102', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (215, 15, 6, NULL, 123, true, '2740382345118', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (216, 16, 6, NULL, 123, true, '4547880572803', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (217, 18, 6, NULL, 123, true, '7018330701993', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (218, 17, 6, NULL, 123, true, '5329411400764', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (219, 13, 7, NULL, 123, true, '6996327083884', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (220, 14, 7, NULL, 123, true, '579171430549', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (221, 15, 7, NULL, 123, true, '8086810646590', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (222, 16, 7, NULL, 123, true, '1441916102772', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (223, 18, 7, NULL, 123, true, '1938792291591', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (224, 17, 7, NULL, 123, true, '9479597694714', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (225, 13, 8, NULL, 123, true, '8052315773323', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (226, 14, 8, NULL, 123, true, '1404900697414', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (227, 15, 8, NULL, 123, true, '9159948861530', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (228, 16, 8, NULL, 123, true, '7361792875450', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (229, 18, 8, NULL, 123, true, '8287583003424', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (230, 17, 8, NULL, 123, true, '3560772181816', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (231, 13, 9, NULL, 123, true, '1944082671736', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (232, 14, 9, NULL, 123, true, '3312086156392', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (233, 15, 9, NULL, 123, true, '4614273399029', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (234, 16, 9, NULL, 123, true, '6227521586819', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (235, 18, 9, NULL, 123, true, '5773517463850', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (236, 13, 10, NULL, 123, true, '1830223959322', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (237, 14, 10, NULL, 123, true, '2279124890046', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (238, 15, 10, NULL, 123, true, '9626196487456', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (239, 16, 10, NULL, 123, true, '1279128699257', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (240, 18, 10, NULL, 123, true, '3461489147985', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (241, 18, 11, NULL, 123, true, '5387952261618', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (242, 18, 12, NULL, 123, true, '3788740269642', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (243, 18, 13, NULL, 123, true, '9273303767957', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (244, 18, 14, NULL, 123, true, '2319198505851', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (245, 18, 15, NULL, 123, true, '8364921808800', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (246, 18, 16, NULL, 123, true, '2825290733761', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (247, 18, 17, NULL, 123, true, '5193545941795', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (248, 18, 18, NULL, 123, true, '2710282252042', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (249, 18, 19, NULL, 123, true, '1932985712375', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (250, 17, 19, NULL, 123, true, '671773427978', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (251, 18, 20, NULL, 123, true, '1641839790562', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (252, 17, 20, NULL, 123, true, '6945806196407', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (253, 18, 21, NULL, 123, true, '812304686336', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (254, 17, 21, NULL, 123, true, '681545382418', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (255, 18, 22, NULL, 123, true, '7273344693449', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (256, 17, 22, NULL, 123, true, '1301905559748', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (257, 18, 23, NULL, 123, true, '5107517218550', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (258, 17, 23, NULL, 123, true, '7041408864591', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (259, 18, 24, NULL, 123, true, '246029127419', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (260, 17, 24, NULL, 123, true, '6229108783768', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (261, 18, 25, NULL, 123, true, '4811088899492', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (262, 17, 25, NULL, 123, true, '254206521774', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (263, 18, 26, NULL, 123, true, '4720740343652', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (264, 18, 27, NULL, 123, true, '4616712370916', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (265, 18, 28, NULL, 123, true, '6430160600966', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (266, 17, 28, NULL, 123, true, '9381089371366', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (267, 18, 29, NULL, 123, true, '3031777260593', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (268, 17, 29, NULL, 123, true, '6882007185328', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (269, 18, 30, NULL, 123, true, '248831491592', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (270, 17, 30, NULL, 123, true, '3559740694801', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (271, 18, 31, NULL, 123, true, '3686062112164', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (272, 17, 31, NULL, 123, true, '4102862386305', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (273, 18, 32, NULL, 123, true, '5060612814729', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (274, 17, 32, NULL, 123, true, '5992912584605', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (275, 5, 33, NULL, 123, true, '4037428497060', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (276, 18, 33, NULL, 123, true, '8436405853285', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (277, 17, 33, NULL, 123, true, '7103848482819', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (278, 5, 34, NULL, 123, true, '1484606583301', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (279, 18, 34, NULL, 123, true, '2239905197883', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (280, 17, 34, NULL, 123, true, '8423399668925', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (281, 5, 35, NULL, 123, true, '8324103634445', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (282, 18, 35, NULL, 123, true, '713321049581', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (283, 17, 35, NULL, 123, true, '2604194311146', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (284, 5, 36, NULL, 123, true, '6232418787638', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (285, 18, 36, NULL, 123, true, '5948059881980', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (286, 17, 36, NULL, 123, true, '7712480736544', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (287, 18, 37, NULL, 123, true, '8113340821692', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (288, 17, 37, NULL, 123, true, '1703549778893', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (289, 6, 38, NULL, 123, true, '7158646972046', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (290, 18, 38, NULL, 123, true, '6619632493978', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (291, 17, 38, NULL, 123, true, '1125601543539', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (292, 6, 39, NULL, 123, true, '8097179508461', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (293, 18, 39, NULL, 123, true, '6873758418635', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (294, 17, 39, NULL, 123, true, '4542945720948', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (295, 6, 40, NULL, 123, true, '8368953529385', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (296, 18, 40, NULL, 123, true, '2446032301165', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (297, 17, 40, NULL, 123, true, '3889736585317', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (298, 6, 41, NULL, 123, true, '4455208997243', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (299, 18, 41, NULL, 123, true, '3798561620645', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (300, 18, 42, NULL, 123, true, '5907602925143', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (301, 18, 43, NULL, 123, true, '5889213535731', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (302, 18, 44, NULL, 123, true, '1454657487386', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (303, 18, 45, NULL, 123, true, '5189069766383', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (304, 18, 46, NULL, 123, true, '8750720331131', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (305, 7, 47, NULL, 123, true, '5423790132822', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (306, 18, 47, NULL, 123, true, '174445429200', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (307, 7, 48, NULL, 123, true, '4614332879689', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (308, 18, 48, NULL, 123, true, '3583872513413', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (309, 7, 49, NULL, 123, true, '3284260600568', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (310, 18, 49, NULL, 123, true, '5308263936472', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (311, 7, 50, NULL, 123, true, '8249086145567', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (312, 18, 50, NULL, 123, true, '6176573982664', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (313, 18, 51, NULL, 123, true, '3482815120862', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (314, 8, 52, NULL, 123, true, '5384108195486', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (315, 18, 52, NULL, 123, true, '9648887105270', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (316, 8, 53, NULL, 123, true, '1035658588312', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (317, 18, 53, NULL, 123, true, '7129831737981', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (318, 8, 54, NULL, 123, true, '3840757377179', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (319, 18, 54, NULL, 123, true, '4436821515002', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (320, 8, 55, NULL, 123, true, '1684127118696', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (321, 18, 55, NULL, 123, true, '6458760963099', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (322, 18, 56, NULL, 123, true, '715670418556', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (323, 11, 57, NULL, 123, true, '7638582533808', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (324, 9, 57, NULL, 123, true, '2309969565775', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (325, 18, 57, NULL, 123, true, '1059657202827', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (326, 11, 58, NULL, 123, true, '9302059179824', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (327, 9, 58, NULL, 123, true, '5086435634719', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (328, 18, 58, NULL, 123, true, '2612781743311', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (329, 11, 59, NULL, 123, true, '625246543580', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (330, 9, 59, NULL, 123, true, '8573603078719', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (331, 18, 59, NULL, 123, true, '4674791976989', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (332, 11, 60, NULL, 123, true, '6549546772076', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (333, 9, 60, NULL, 123, true, '2400400552223', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (334, 12, 60, NULL, 123, true, '3227364757454', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (335, 10, 60, NULL, 123, true, '8136915860881', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (336, 18, 60, NULL, 123, true, '6692134335191', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (337, 12, 61, NULL, 123, true, '6592378410795', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (338, 10, 61, NULL, 123, true, '3810239294990', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (339, 18, 61, NULL, 123, true, '7471341444421', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (340, 12, 62, NULL, 123, true, '4061821369487', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (341, 10, 62, NULL, 123, true, '4934693160099', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (342, 18, 62, NULL, 123, true, '7819590352045', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (343, 12, 63, NULL, 123, true, '8951398522436', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (344, 10, 63, NULL, 123, true, '8309999675073', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (345, 18, 63, NULL, 123, true, '3474436297138', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (346, 17, 65, NULL, 123, true, '5001535472769', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (347, 17, 66, NULL, 123, true, '3918289824915', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (348, 17, 67, NULL, 123, true, '1075961588938', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (349, 17, 68, NULL, 123, true, '5526144442802', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (350, 17, 69, NULL, 123, true, '1196160951734', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (351, 13, 70, NULL, 123, true, '8641260037259', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (352, 17, 70, NULL, 123, true, '1130305376273', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (353, 13, 71, NULL, 123, true, '627016806203', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (354, 17, 71, NULL, 123, true, '5689622896118', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (355, 13, 72, NULL, 123, true, '1123947638244', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (356, 17, 72, NULL, 123, true, '4197580693714', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (357, 13, 73, NULL, 123, true, '2865834529167', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (358, 17, 73, NULL, 123, true, '1180715840622', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (359, 13, 74, NULL, 123, true, '2503697981527', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (360, 17, 74, NULL, 123, true, '3548729442865', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (361, 13, 75, NULL, 123, true, '6630930542027', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (362, 17, 75, NULL, 123, true, '4150640486502', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (363, 13, 76, NULL, 123, true, '573850633545', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (364, 17, 76, NULL, 123, true, '989809621378', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (365, 13, 77, NULL, 123, true, '7589546244940', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (366, 17, 77, NULL, 123, true, '4214138616764', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (367, 13, 78, NULL, 123, true, '2287232368959', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (368, 17, 80, NULL, 123, true, '1840712420875', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (369, 17, 81, NULL, 123, true, '6496827247378', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (370, 17, 82, NULL, 123, true, '2345674881981', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (371, 15, 83, NULL, 123, true, '3066041265279', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (372, 17, 83, NULL, 123, true, '4740628056116', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (373, 15, 84, NULL, 123, true, '3780311755381', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (374, 17, 84, NULL, 123, true, '4121906087381', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (375, 15, 85, NULL, 123, true, '8501125354724', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (376, 17, 85, NULL, 123, true, '8483988535978', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (377, 15, 86, NULL, 123, true, '9184850359770', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (378, 17, 86, NULL, 123, true, '1423386439585', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (379, 14, 87, NULL, 123, true, '1576737049266', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (380, 15, 87, NULL, 123, true, '1325270150560', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (381, 14, 88, NULL, 123, true, '6653140354356', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (382, 15, 88, NULL, 123, true, '3210712492267', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (383, 14, 89, NULL, 123, true, '5666918053492', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (384, 15, 89, NULL, 123, true, '9103551107371', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (385, 14, 90, NULL, 123, true, '7583044151694', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (386, 15, 90, NULL, 123, true, '2461097381016', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (387, 14, 91, NULL, 123, true, '8544042294878', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (388, 15, 91, NULL, 123, true, '9706194539353', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (389, 14, 92, NULL, 123, true, '9680371084576', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (390, 14, 93, NULL, 123, true, '4317871784485', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (391, 16, 93, NULL, 123, true, '2131369932480', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (392, 14, 94, NULL, 123, true, '2862831434764', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (393, 16, 94, NULL, 123, true, '4503425418231', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (394, 14, 95, NULL, 123, true, '7115852293392', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (395, 16, 95, NULL, 123, true, '7970224662751', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (396, 16, 96, NULL, 123, true, '990155206435', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (397, 16, 97, NULL, 123, true, '3408053528688', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (398, 17, 97, NULL, 123, true, '2330521893736', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (399, 16, 98, NULL, 123, true, '7385077260417', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (400, 17, 98, NULL, 123, true, '3978175983948', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (401, 16, 99, NULL, 123, true, '8586180224510', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (402, 17, 99, NULL, 123, true, '1271640800782', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (403, 16, 100, NULL, 123, true, '1917135465626', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (404, 17, 100, NULL, 123, true, '3568187108057', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (405, 16, 101, NULL, 123, true, '2466051976333', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (406, 17, 101, NULL, 123, true, '5851530962197', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (407, 17, 102, NULL, 123, true, '1866322183821', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (408, 17, 103, NULL, 123, true, '7575536351157', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 1, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (409, 5, 5, NULL, 1344, true, '2066620415127', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (410, 6, 5, NULL, 1344, true, '5762522698168', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (411, 7, 5, NULL, 1344, true, '355091907367', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (412, 8, 5, NULL, 1344, true, '9291531403120', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (413, 9, 5, NULL, 1344, true, '8909361366528', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (414, 10, 5, NULL, 1344, true, '9415668215408', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (415, 11, 5, NULL, 1344, true, '6146007218786', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (416, 12, 5, NULL, 1344, true, '2724753812003', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (417, 5, 6, NULL, 1344, true, '1891568791951', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (418, 6, 6, NULL, 1344, true, '6340000442606', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (419, 7, 6, NULL, 1344, true, '8129172633531', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (420, 8, 6, NULL, 1344, true, '9057129125767', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (421, 9, 6, NULL, 1344, true, '1054746121079', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (422, 10, 6, NULL, 1344, true, '5458074172035', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (423, 11, 6, NULL, 1344, true, '5064909537673', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (424, 12, 6, NULL, 1344, true, '5748884199284', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (425, 6, 7, NULL, 1344, true, '7457906810717', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (426, 7, 7, NULL, 1344, true, '4124658425872', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (427, 8, 7, NULL, 1344, true, '3432849052379', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (428, 9, 7, NULL, 1344, true, '4394419556656', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (429, 10, 7, NULL, 1344, true, '1472316990514', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (430, 11, 7, NULL, 1344, true, '1693838232079', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (431, 12, 7, NULL, 1344, true, '8228258920297', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (432, 7, 8, NULL, 1344, true, '7309663607028', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (433, 8, 8, NULL, 1344, true, '9339316517911', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (434, 9, 8, NULL, 1344, true, '2265079532717', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (435, 10, 8, NULL, 1344, true, '1323777395475', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (436, 11, 8, NULL, 1344, true, '7734643063124', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (437, 12, 8, NULL, 1344, true, '5207889539603', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (438, 9, 9, NULL, 1344, true, '1360360838021', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (439, 10, 9, NULL, 1344, true, '758471139339', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (440, 11, 9, NULL, 1344, true, '9204656901316', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (441, 12, 9, NULL, 1344, true, '7699122716759', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (442, 17, 9, NULL, 1344, true, '5357955282427', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (443, 11, 10, NULL, 1344, true, '8749578687348', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (444, 12, 10, NULL, 1344, true, '3576120200314', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (445, 17, 10, NULL, 1344, true, '5256118788375', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (446, 13, 11, NULL, 1344, true, '4147479195061', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (447, 14, 11, NULL, 1344, true, '6766578264567', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (448, 15, 11, NULL, 1344, true, '4182831849927', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (449, 16, 11, NULL, 1344, true, '7280718334021', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (450, 17, 11, NULL, 1344, true, '243500248488', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (451, 13, 12, NULL, 1344, true, '3187891160001', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (452, 14, 12, NULL, 1344, true, '9414983571655', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (453, 15, 12, NULL, 1344, true, '8387736632206', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (454, 16, 12, NULL, 1344, true, '9711955632656', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (455, 17, 12, NULL, 1344, true, '6572067170186', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (456, 13, 13, NULL, 1344, true, '6452982377606', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (457, 14, 13, NULL, 1344, true, '2343644159622', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (458, 15, 13, NULL, 1344, true, '3739198155025', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (459, 16, 13, NULL, 1344, true, '538687005393', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (460, 17, 13, NULL, 1344, true, '3606864279840', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (461, 13, 14, NULL, 1344, true, '2051516050039', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (462, 14, 14, NULL, 1344, true, '732920738270', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (463, 15, 14, NULL, 1344, true, '5185493989704', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (464, 16, 14, NULL, 1344, true, '4264720656536', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (465, 17, 14, NULL, 1344, true, '1811663843445', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (466, 13, 15, NULL, 1344, true, '7890085627768', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (467, 14, 15, NULL, 1344, true, '3891561646074', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (468, 15, 15, NULL, 1344, true, '2445115544757', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (469, 16, 15, NULL, 1344, true, '4685971936889', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (470, 17, 15, NULL, 1344, true, '9452541733948', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (471, 13, 16, NULL, 1344, true, '9928061329430', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (472, 14, 16, NULL, 1344, true, '2226261157386', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (473, 15, 16, NULL, 1344, true, '3635663519457', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (474, 16, 16, NULL, 1344, true, '1697658666405', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (475, 17, 16, NULL, 1344, true, '8556491944118', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (476, 13, 17, NULL, 1344, true, '5910945419156', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (477, 14, 17, NULL, 1344, true, '8776436657486', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (478, 15, 17, NULL, 1344, true, '5743965976710', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (479, 16, 17, NULL, 1344, true, '9046647046903', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (480, 17, 17, NULL, 1344, true, '3278236573092', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (481, 13, 18, NULL, 1344, true, '3276001101650', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (482, 15, 18, NULL, 1344, true, '7531294529268', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (483, 16, 18, NULL, 1344, true, '5410469889516', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (484, 17, 18, NULL, 1344, true, '9145254643252', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (485, 13, 19, NULL, 1344, true, '4093284645744', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (486, 15, 19, NULL, 1344, true, '8487265536422', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (487, 16, 19, NULL, 1344, true, '8190111369568', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (488, 13, 20, NULL, 1344, true, '8402703851304', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (489, 15, 20, NULL, 1344, true, '5082942865243', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (490, 16, 20, NULL, 1344, true, '6458365844187', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (491, 13, 21, NULL, 1344, true, '9135622748094', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (492, 15, 21, NULL, 1344, true, '8925175261513', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (493, 16, 21, NULL, 1344, true, '2152575527873', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (494, 13, 22, NULL, 1344, true, '6407929022906', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (495, 15, 22, NULL, 1344, true, '2578831692607', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (496, 16, 22, NULL, 1344, true, '8302206036287', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (497, 13, 23, NULL, 1344, true, '3855329697252', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (498, 15, 23, NULL, 1344, true, '8207644690534', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (499, 16, 23, NULL, 1344, true, '1153909774253', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (500, 13, 24, NULL, 1344, true, '1830131864667', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (501, 15, 24, NULL, 1344, true, '237405548113', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (502, 16, 24, NULL, 1344, true, '9942254826013', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (503, 15, 25, NULL, 1344, true, '868523040223', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (504, 16, 25, NULL, 1344, true, '6835911601117', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (505, 15, 26, NULL, 1344, true, '759548748423', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (506, 15, 27, NULL, 1344, true, '1983653974136', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (507, 16, 27, NULL, 1344, true, '3073198120496', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (508, 15, 28, NULL, 1344, true, '6678256795606', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (509, 16, 28, NULL, 1344, true, '1939329905434', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (510, 15, 29, NULL, 1344, true, '1089300516497', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (511, 16, 29, NULL, 1344, true, '3550838756520', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (512, 15, 30, NULL, 1344, true, '8869469920369', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (513, 16, 30, NULL, 1344, true, '525188274924', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (514, 5, 31, NULL, 1344, true, '9361140930532', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (515, 15, 31, NULL, 1344, true, '4354592029390', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (516, 16, 31, NULL, 1344, true, '5542131724064', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (517, 5, 32, NULL, 1344, true, '8390097861765', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (518, 15, 32, NULL, 1344, true, '8235514806544', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (519, 16, 32, NULL, 1344, true, '7293529206285', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (520, 15, 33, NULL, 1344, true, '9530708322397', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (521, 16, 33, NULL, 1344, true, '8313817519809', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (522, 15, 34, NULL, 1344, true, '8871986587591', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (523, 16, 34, NULL, 1344, true, '5486703793279', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (524, 6, 35, NULL, 1344, true, '4910326091898', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (525, 15, 35, NULL, 1344, true, '1339065821488', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (526, 16, 35, NULL, 1344, true, '5309206061531', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (527, 6, 36, NULL, 1344, true, '6654955222918', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (528, 15, 36, NULL, 1344, true, '4250445670771', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (529, 16, 36, NULL, 1344, true, '8735004780165', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (530, 6, 37, NULL, 1344, true, '3260880560425', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (531, 15, 37, NULL, 1344, true, '4610038971934', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (532, 16, 37, NULL, 1344, true, '3462082733746', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (533, 14, 38, NULL, 1344, true, '9882861169262', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (534, 15, 38, NULL, 1344, true, '7572504749881', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (535, 16, 38, NULL, 1344, true, '510365002771', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (536, 14, 39, NULL, 1344, true, '6352347649322', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (537, 15, 39, NULL, 1344, true, '3601918163400', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (538, 16, 39, NULL, 1344, true, '7551338970573', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (539, 14, 40, NULL, 1344, true, '3059704095097', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (540, 15, 40, NULL, 1344, true, '8051708047779', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (541, 16, 40, NULL, 1344, true, '6870100719754', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (542, 14, 41, NULL, 1344, true, '1496976947290', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (543, 15, 41, NULL, 1344, true, '9562506066902', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (544, 16, 41, NULL, 1344, true, '9413449924428', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (545, 17, 41, NULL, 1344, true, '3894656186515', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (546, 14, 42, NULL, 1344, true, '3128894285004', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (547, 15, 42, NULL, 1344, true, '1881953494158', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (548, 16, 42, NULL, 1344, true, '3832710991449', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (549, 17, 42, NULL, 1344, true, '9906401260107', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (550, 7, 43, NULL, 1344, true, '6224044565191', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (551, 14, 43, NULL, 1344, true, '6260515165261', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (552, 15, 43, NULL, 1344, true, '6827524387514', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (553, 16, 43, NULL, 1344, true, '891913288961', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (554, 17, 43, NULL, 1344, true, '6420000923237', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (555, 7, 44, NULL, 1344, true, '3634805602531', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (556, 14, 44, NULL, 1344, true, '407074630431', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (557, 15, 44, NULL, 1344, true, '3650152730248', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (558, 16, 44, NULL, 1344, true, '7177735422051', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (559, 17, 44, NULL, 1344, true, '6726640791210', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (560, 7, 45, NULL, 1344, true, '1958359674644', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (561, 14, 45, NULL, 1344, true, '7225433769220', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (562, 15, 45, NULL, 1344, true, '5510451829975', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (563, 16, 45, NULL, 1344, true, '3819456492474', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (564, 17, 45, NULL, 1344, true, '6729350390732', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (565, 7, 46, NULL, 1344, true, '4984702701214', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (566, 14, 46, NULL, 1344, true, '3852691284815', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (567, 15, 46, NULL, 1344, true, '7299872226344', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (568, 16, 46, NULL, 1344, true, '9398085069108', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (569, 17, 46, NULL, 1344, true, '425895753145', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (570, 14, 47, NULL, 1344, true, '3354663474329', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (571, 15, 47, NULL, 1344, true, '5865870458883', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (572, 16, 47, NULL, 1344, true, '2937235277979', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (573, 17, 47, NULL, 1344, true, '8348234932299', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (574, 8, 48, NULL, 1344, true, '5319696770328', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (575, 14, 48, NULL, 1344, true, '8858633932505', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (576, 15, 48, NULL, 1344, true, '4234876662983', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (577, 16, 48, NULL, 1344, true, '8153721516761', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (578, 17, 48, NULL, 1344, true, '547227200191', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (579, 8, 49, NULL, 1344, true, '3127877184538', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (580, 14, 49, NULL, 1344, true, '9713941396875', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (581, 15, 49, NULL, 1344, true, '7726603063981', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (582, 16, 49, NULL, 1344, true, '7643054718096', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (583, 17, 49, NULL, 1344, true, '9436681233067', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (584, 8, 50, NULL, 1344, true, '6117708304093', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (585, 14, 50, NULL, 1344, true, '6389143236573', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (586, 15, 50, NULL, 1344, true, '4881183225219', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (587, 16, 50, NULL, 1344, true, '5481926590082', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (588, 17, 50, NULL, 1344, true, '9074329253907', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (589, 8, 51, NULL, 1344, true, '3954317574988', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (590, 11, 51, NULL, 1344, true, '8281114541638', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (591, 14, 51, NULL, 1344, true, '9964700089129', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (592, 15, 51, NULL, 1344, true, '4078119120131', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (593, 16, 51, NULL, 1344, true, '7162064463626', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (594, 17, 51, NULL, 1344, true, '4070018190217', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (595, 9, 52, NULL, 1344, true, '1925452864429', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (596, 11, 52, NULL, 1344, true, '8609944009548', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (597, 14, 52, NULL, 1344, true, '8097881239058', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (598, 15, 52, NULL, 1344, true, '4907992400720', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (599, 16, 52, NULL, 1344, true, '3833938617263', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (600, 17, 52, NULL, 1344, true, '3282900208319', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (601, 9, 53, NULL, 1344, true, '6640055923791', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (602, 11, 53, NULL, 1344, true, '7254090627002', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (603, 14, 53, NULL, 1344, true, '5651714209947', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (604, 15, 53, NULL, 1344, true, '2084913385422', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (605, 16, 53, NULL, 1344, true, '1218660747443', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (606, 17, 53, NULL, 1344, true, '5956577891779', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (607, 9, 54, NULL, 1344, true, '8868912925328', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (608, 11, 54, NULL, 1344, true, '2898787489449', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (609, 12, 54, NULL, 1344, true, '1260394498139', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (610, 14, 54, NULL, 1344, true, '1183466260456', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (611, 15, 54, NULL, 1344, true, '7422932982610', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (612, 16, 54, NULL, 1344, true, '1310057052266', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (613, 17, 54, NULL, 1344, true, '385733350718', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (614, 9, 55, NULL, 1344, true, '9548772406499', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (615, 10, 55, NULL, 1344, true, '8666151913187', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (616, 11, 55, NULL, 1344, true, '9431108053668', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (617, 12, 55, NULL, 1344, true, '476589354343', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (618, 14, 55, NULL, 1344, true, '3224854095948', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (619, 15, 55, NULL, 1344, true, '4714508233813', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (620, 16, 55, NULL, 1344, true, '4356528845264', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (621, 17, 55, NULL, 1344, true, '1957453662392', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (622, 9, 56, NULL, 1344, true, '4344586369737', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (623, 10, 56, NULL, 1344, true, '5396715211740', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (624, 11, 56, NULL, 1344, true, '6892248789922', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (625, 12, 56, NULL, 1344, true, '5158896140195', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (626, 13, 56, NULL, 1344, true, '912481710480', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (627, 14, 56, NULL, 1344, true, '1941237016563', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (628, 15, 56, NULL, 1344, true, '3664491749979', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (629, 16, 56, NULL, 1344, true, '5212093484883', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (630, 17, 56, NULL, 1344, true, '444100890244', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (631, 10, 57, NULL, 1344, true, '8887962613879', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (632, 12, 57, NULL, 1344, true, '3677554982480', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (633, 13, 57, NULL, 1344, true, '6101040996191', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (634, 14, 57, NULL, 1344, true, '4351080271475', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (635, 15, 57, NULL, 1344, true, '7996849119457', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (636, 16, 57, NULL, 1344, true, '360598167762', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (637, 17, 57, NULL, 1344, true, '7696986200927', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (638, 10, 58, NULL, 1344, true, '4741496692012', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (639, 12, 58, NULL, 1344, true, '1234616804583', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (640, 13, 58, NULL, 1344, true, '7877513986619', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (641, 14, 58, NULL, 1344, true, '929500197753', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (642, 15, 58, NULL, 1344, true, '3211597340634', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (643, 16, 58, NULL, 1344, true, '9035075468426', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (644, 17, 58, NULL, 1344, true, '2014204891962', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (645, 10, 59, NULL, 1344, true, '7938655763403', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (646, 12, 59, NULL, 1344, true, '9602248731457', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (647, 13, 59, NULL, 1344, true, '3296847839622', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (648, 14, 59, NULL, 1344, true, '4814865416657', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (649, 15, 59, NULL, 1344, true, '9123694629917', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (650, 16, 59, NULL, 1344, true, '5891309995253', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (651, 17, 59, NULL, 1344, true, '7582699942241', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (652, 13, 60, NULL, 1344, true, '9508754795534', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (653, 15, 60, NULL, 1344, true, '9021112730291', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (654, 16, 60, NULL, 1344, true, '3910406164493', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (655, 17, 60, NULL, 1344, true, '6996462577803', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (656, 13, 61, NULL, 1344, true, '6754153351927', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (657, 15, 61, NULL, 1344, true, '6180068858697', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (658, 16, 61, NULL, 1344, true, '2029664521836', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (659, 17, 61, NULL, 1344, true, '2727355845591', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (660, 13, 62, NULL, 1344, true, '5309929781569', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (661, 15, 62, NULL, 1344, true, '1215691404097', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (662, 16, 62, NULL, 1344, true, '9540291339127', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (663, 17, 62, NULL, 1344, true, '2460877699114', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (664, 13, 63, NULL, 1344, true, '2959069614374', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (665, 15, 63, NULL, 1344, true, '1921013910662', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (666, 16, 63, NULL, 1344, true, '1779499460883', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (667, 17, 63, NULL, 1344, true, '8559536671899', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (668, 13, 64, NULL, 1344, true, '5071340162577', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (669, 15, 64, NULL, 1344, true, '5697008125053', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (670, 16, 64, NULL, 1344, true, '4689615257260', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (671, 17, 64, NULL, 1344, true, '2542291473644', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (672, 13, 65, NULL, 1344, true, '1266607164657', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (673, 15, 65, NULL, 1344, true, '9891809952736', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (674, 16, 65, NULL, 1344, true, '2543669474698', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (675, 13, 66, NULL, 1344, true, '7883124900586', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (676, 15, 66, NULL, 1344, true, '7864328927881', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (677, 16, 66, NULL, 1344, true, '8302005324903', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (678, 13, 67, NULL, 1344, true, '6183536665481', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (679, 15, 67, NULL, 1344, true, '6154748011823', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (680, 16, 67, NULL, 1344, true, '917939044236', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (681, 13, 68, NULL, 1344, true, '8395711612509', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (682, 15, 68, NULL, 1344, true, '8479895705901', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (683, 16, 68, NULL, 1344, true, '4524714332925', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (684, 13, 69, NULL, 1344, true, '5712878969485', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (685, 15, 69, NULL, 1344, true, '2318841045316', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (686, 16, 69, NULL, 1344, true, '3925287486631', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (687, 15, 70, NULL, 1344, true, '9709330385944', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (688, 16, 70, NULL, 1344, true, '5808312931380', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (689, 15, 71, NULL, 1344, true, '5745576616178', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (690, 16, 71, NULL, 1344, true, '4254591964664', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (691, 15, 72, NULL, 1344, true, '2924767384018', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (692, 16, 72, NULL, 1344, true, '2526208640173', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (693, 15, 73, NULL, 1344, true, '1456378918310', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (694, 16, 73, NULL, 1344, true, '824895431242', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (695, 15, 74, NULL, 1344, true, '9212349483288', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (696, 16, 74, NULL, 1344, true, '9439218116106', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (697, 15, 75, NULL, 1344, true, '5551996921773', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (698, 16, 75, NULL, 1344, true, '1493319690924', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (699, 15, 76, NULL, 1344, true, '5144127810705', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (700, 16, 76, NULL, 1344, true, '6676317525046', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (701, 15, 77, NULL, 1344, true, '9644663183684', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (702, 15, 78, NULL, 1344, true, '4593936398529', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (703, 16, 78, NULL, 1344, true, '1510352668554', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (704, 15, 79, NULL, 1344, true, '6751115321619', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (705, 16, 79, NULL, 1344, true, '6549474880024', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (706, 14, 80, NULL, 1344, true, '1142196823417', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (707, 15, 80, NULL, 1344, true, '6412606382488', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (708, 16, 80, NULL, 1344, true, '8647909632245', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (709, 14, 81, NULL, 1344, true, '5249625440493', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (710, 15, 81, NULL, 1344, true, '2292770602230', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (711, 16, 81, NULL, 1344, true, '7979925203170', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (712, 14, 82, NULL, 1344, true, '8574086639701', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (713, 15, 82, NULL, 1344, true, '85336068174', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (714, 16, 82, NULL, 1344, true, '6437343943903', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (715, 14, 83, NULL, 1344, true, '7825403728934', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (716, 16, 83, NULL, 1344, true, '5319772831586', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (717, 14, 84, NULL, 1344, true, '2938213401011', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (718, 16, 84, NULL, 1344, true, '5041573355126', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (719, 14, 85, NULL, 1344, true, '5951491978417', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (720, 16, 85, NULL, 1344, true, '8809783425167', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (721, 14, 86, NULL, 1344, true, '2832888594600', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (722, 16, 86, NULL, 1344, true, '5935006434695', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (723, 16, 87, NULL, 1344, true, '1511496276869', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (724, 17, 87, NULL, 1344, true, '3992727805906', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (725, 16, 88, NULL, 1344, true, '457860581800', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (726, 17, 88, NULL, 1344, true, '1068754749468', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (727, 16, 89, NULL, 1344, true, '1924364723511', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (728, 17, 89, NULL, 1344, true, '7330167972129', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (729, 16, 90, NULL, 1344, true, '6820210388356', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (730, 17, 90, NULL, 1344, true, '5275495733137', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (731, 16, 91, NULL, 1344, true, '5482482490123', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (732, 17, 91, NULL, 1344, true, '7594965441291', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (733, 16, 92, NULL, 1344, true, '3930978973323', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (734, 17, 92, NULL, 1344, true, '983045994769', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (735, 17, 93, NULL, 1344, true, '4949235931181', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (736, 17, 94, NULL, 1344, true, '4579085198354', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (737, 17, 95, NULL, 1344, true, '7864013625579', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (738, 17, 96, NULL, 1344, true, '3132277635286', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 4, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (739, 8, 9, NULL, 3422, true, '2490094484554', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (740, 9, 9, NULL, 3422, true, '1473329412530', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (741, 8, 10, NULL, 3422, true, '1088979253112', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (742, 9, 10, NULL, 3422, true, '9562788953072', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (743, 10, 10, NULL, 3422, true, '382779719710', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (744, 8, 11, NULL, 3422, true, '3375606142945', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (745, 9, 11, NULL, 3422, true, '5219852747508', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (746, 10, 11, NULL, 3422, true, '682033015166', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (747, 11, 11, NULL, 3422, true, '2120497983955', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (748, 12, 11, NULL, 3422, true, '4359876255654', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (749, 8, 12, NULL, 3422, true, '2463659526656', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (750, 9, 12, NULL, 3422, true, '5774850562940', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (751, 10, 12, NULL, 3422, true, '4327833364030', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (752, 11, 12, NULL, 3422, true, '9122250176060', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (753, 12, 12, NULL, 3422, true, '9879589656626', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (754, 8, 13, NULL, 3422, true, '9457648878176', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (755, 9, 13, NULL, 3422, true, '765212911094', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (756, 10, 13, NULL, 3422, true, '3670748157668', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (757, 11, 13, NULL, 3422, true, '8853014320143', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (758, 12, 13, NULL, 3422, true, '5495146754967', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (759, 8, 14, NULL, 3422, true, '6544292911557', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (760, 9, 14, NULL, 3422, true, '1113906165708', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (761, 10, 14, NULL, 3422, true, '4568874612350', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (762, 11, 14, NULL, 3422, true, '7514837570843', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (763, 12, 14, NULL, 3422, true, '575985583294', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (764, 8, 15, NULL, 3422, true, '7396110834247', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (765, 9, 15, NULL, 3422, true, '8401035540605', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (766, 10, 15, NULL, 3422, true, '314330320360', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (767, 11, 15, NULL, 3422, true, '350206903777', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (768, 12, 15, NULL, 3422, true, '3464377337600', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (769, 8, 16, NULL, 3422, true, '7852766220814', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (770, 9, 16, NULL, 3422, true, '956241448655', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (771, 10, 16, NULL, 3422, true, '7314153212415', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (772, 11, 16, NULL, 3422, true, '4220860969678', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (773, 12, 16, NULL, 3422, true, '4042311535595', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (774, 8, 17, NULL, 3422, true, '9317299006283', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (775, 9, 17, NULL, 3422, true, '2697212458340', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (776, 10, 17, NULL, 3422, true, '888323472832', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (777, 11, 17, NULL, 3422, true, '8915941377898', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (778, 12, 17, NULL, 3422, true, '5603180518142', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (779, 8, 18, NULL, 3422, true, '5032797956815', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (780, 9, 18, NULL, 3422, true, '7137959865442', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (781, 10, 18, NULL, 3422, true, '2670306499087', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (782, 11, 18, NULL, 3422, true, '5306557962871', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (783, 12, 18, NULL, 3422, true, '8276742773142', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (784, 8, 19, NULL, 3422, true, '8210276989658', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (785, 9, 19, NULL, 3422, true, '8455052197672', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (786, 10, 19, NULL, 3422, true, '5281595650170', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (787, 11, 19, NULL, 3422, true, '6671791027954', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (788, 12, 19, NULL, 3422, true, '195671510792', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (789, 8, 20, NULL, 3422, true, '9095617863772', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (790, 9, 20, NULL, 3422, true, '1132503678797', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (791, 10, 20, NULL, 3422, true, '4135598679923', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (792, 11, 20, NULL, 3422, true, '1828136872175', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (793, 12, 20, NULL, 3422, true, '8410716728607', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (794, 9, 21, NULL, 3422, true, '6547570666349', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (795, 10, 21, NULL, 3422, true, '1526508740394', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (796, 11, 21, NULL, 3422, true, '989131451789', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (797, 12, 21, NULL, 3422, true, '7080246857503', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (798, 9, 22, NULL, 3422, true, '3162325606236', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (799, 10, 22, NULL, 3422, true, '1311433036597', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (800, 11, 22, NULL, 3422, true, '8562011319622', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (801, 12, 22, NULL, 3422, true, '3648513145089', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (802, 9, 23, NULL, 3422, true, '9309455641108', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (803, 10, 23, NULL, 3422, true, '8073478329944', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (804, 11, 23, NULL, 3422, true, '8300527280706', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (805, 12, 23, NULL, 3422, true, '1382503778229', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (806, 9, 24, NULL, 3422, true, '8295751974315', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (807, 10, 24, NULL, 3422, true, '35812816670', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (808, 11, 24, NULL, 3422, true, '4727000807016', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (809, 12, 24, NULL, 3422, true, '1037856803630', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (810, 9, 25, NULL, 3422, true, '1724520100807', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (811, 10, 25, NULL, 3422, true, '5181417102295', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (812, 11, 25, NULL, 3422, true, '5978247157952', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (813, 12, 25, NULL, 3422, true, '3520813321482', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (814, 13, 25, NULL, 3422, true, '9791752367788', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (815, 9, 26, NULL, 3422, true, '7146238193254', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (816, 10, 26, NULL, 3422, true, '2322122413475', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (817, 11, 26, NULL, 3422, true, '1204517573760', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (818, 12, 26, NULL, 3422, true, '1502561586977', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (819, 13, 26, NULL, 3422, true, '6333815578974', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (820, 9, 27, NULL, 3422, true, '3828675627330', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (821, 10, 27, NULL, 3422, true, '741667537261', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (822, 11, 27, NULL, 3422, true, '5696663712925', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (823, 12, 27, NULL, 3422, true, '6985590690705', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (824, 13, 27, NULL, 3422, true, '8983278008995', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (825, 9, 28, NULL, 3422, true, '7256337324779', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (826, 10, 28, NULL, 3422, true, '390053194851', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (827, 11, 28, NULL, 3422, true, '8254267440353', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (828, 12, 28, NULL, 3422, true, '2641478298104', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (829, 13, 28, NULL, 3422, true, '180084203827', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (830, 9, 29, NULL, 3422, true, '7386527034022', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (831, 10, 29, NULL, 3422, true, '5231766982084', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (832, 11, 29, NULL, 3422, true, '6193378746871', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (833, 12, 29, NULL, 3422, true, '3269593822318', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (834, 13, 29, NULL, 3422, true, '2693656687964', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (835, 9, 30, NULL, 3422, true, '5666798978770', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (836, 10, 30, NULL, 3422, true, '5066455995386', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (837, 12, 30, NULL, 3422, true, '7951869793237', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (838, 13, 30, NULL, 3422, true, '5474703041945', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (839, 9, 31, NULL, 3422, true, '2348470071602', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (840, 10, 31, NULL, 3422, true, '7260224865261', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (841, 12, 31, NULL, 3422, true, '339251223147', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (842, 13, 31, NULL, 3422, true, '103280189638', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (843, 9, 32, NULL, 3422, true, '9418700910572', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (844, 10, 32, NULL, 3422, true, '1760704362099', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (845, 11, 32, NULL, 3422, true, '1776758364591', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (846, 13, 32, NULL, 3422, true, '4192945264371', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (847, 9, 33, NULL, 3422, true, '5955135665598', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (848, 10, 33, NULL, 3422, true, '9598702223138', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (849, 11, 33, NULL, 3422, true, '5841568672383', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (850, 13, 33, NULL, 3422, true, '4647833215085', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (851, 9, 34, NULL, 3422, true, '6326784205157', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (852, 10, 34, NULL, 3422, true, '1153875340266', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (853, 11, 34, NULL, 3422, true, '7379601004496', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (854, 12, 34, NULL, 3422, true, '8154255682003', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (855, 13, 34, NULL, 3422, true, '3603126036033', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (856, 10, 35, NULL, 3422, true, '8702931787284', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (857, 11, 35, NULL, 3422, true, '6874640197695', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (858, 12, 35, NULL, 3422, true, '469958173089', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (859, 13, 35, NULL, 3422, true, '8721898182953', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (860, 8, 36, NULL, 3422, true, '2632635310972', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (861, 10, 36, NULL, 3422, true, '2376036201334', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (862, 11, 36, NULL, 3422, true, '4898996366473', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (863, 12, 36, NULL, 3422, true, '9251356932438', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (864, 13, 36, NULL, 3422, true, '6069661429461', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (865, 8, 37, NULL, 3422, true, '9833734687598', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (866, 10, 37, NULL, 3422, true, '6946743508058', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (867, 11, 37, NULL, 3422, true, '6286573310062', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (868, 12, 37, NULL, 3422, true, '7079672385095', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (869, 13, 37, NULL, 3422, true, '5842500330247', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (870, 8, 38, NULL, 3422, true, '7336165436470', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (871, 10, 38, NULL, 3422, true, '7880792505470', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (872, 11, 38, NULL, 3422, true, '9969853820722', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (873, 12, 38, NULL, 3422, true, '909722008728', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (874, 13, 38, NULL, 3422, true, '2304509666523', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (875, 8, 39, NULL, 3422, true, '590145749386', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (876, 9, 39, NULL, 3422, true, '284569499448', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (877, 10, 39, NULL, 3422, true, '2781670463274', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (878, 11, 39, NULL, 3422, true, '467427128650', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (879, 12, 39, NULL, 3422, true, '893108072333', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (880, 13, 39, NULL, 3422, true, '3376106374342', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (881, 8, 40, NULL, 3422, true, '5621682178950', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (882, 9, 40, NULL, 3422, true, '8700791631018', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (883, 10, 40, NULL, 3422, true, '4346354296789', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (884, 11, 40, NULL, 3422, true, '3685468359045', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (885, 12, 40, NULL, 3422, true, '6485748994533', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (886, 8, 41, NULL, 3422, true, '1487269244437', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (887, 9, 41, NULL, 3422, true, '7615143372262', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (888, 10, 41, NULL, 3422, true, '3886395132249', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (889, 11, 41, NULL, 3422, true, '6141977592837', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (890, 12, 41, NULL, 3422, true, '3379910778150', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (891, 8, 42, NULL, 3422, true, '9365717342476', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (892, 9, 42, NULL, 3422, true, '865702253878', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (893, 10, 42, NULL, 3422, true, '5719323658850', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (894, 11, 42, NULL, 3422, true, '6306404048568', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (895, 12, 42, NULL, 3422, true, '6800937191601', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (896, 13, 42, NULL, 3422, true, '6486647917879', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (897, 8, 43, NULL, 3422, true, '8172685480969', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (898, 9, 43, NULL, 3422, true, '7161933329436', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (899, 10, 43, NULL, 3422, true, '6937289051583', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (900, 11, 43, NULL, 3422, true, '3572327334911', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (901, 12, 43, NULL, 3422, true, '5000895759695', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (902, 13, 43, NULL, 3422, true, '1059983672250', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (903, 8, 44, NULL, 3422, true, '8021713897983', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (904, 9, 44, NULL, 3422, true, '1137475722485', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (905, 10, 44, NULL, 3422, true, '7340143228314', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (906, 11, 44, NULL, 3422, true, '8537924868954', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (907, 12, 44, NULL, 3422, true, '4247531955023', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (908, 13, 44, NULL, 3422, true, '5356481368924', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (909, 8, 45, NULL, 3422, true, '7656593479308', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (910, 9, 45, NULL, 3422, true, '467906328124', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (911, 10, 45, NULL, 3422, true, '7249918535259', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (912, 11, 45, NULL, 3422, true, '2050305037406', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (913, 12, 45, NULL, 3422, true, '1352111918249', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (914, 13, 45, NULL, 3422, true, '9975567952464', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (915, 8, 46, NULL, 3422, true, '8358597793709', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (916, 9, 46, NULL, 3422, true, '2309038721606', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (917, 10, 46, NULL, 3422, true, '6910984954116', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (918, 11, 46, NULL, 3422, true, '7731310492908', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (919, 12, 46, NULL, 3422, true, '6725681839405', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (920, 13, 46, NULL, 3422, true, '9852896435136', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (921, 8, 47, NULL, 3422, true, '3658644024981', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (922, 9, 47, NULL, 3422, true, '999110601863', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (923, 10, 47, NULL, 3422, true, '7145019708317', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (924, 11, 47, NULL, 3422, true, '837270887953', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (925, 12, 47, NULL, 3422, true, '7234195595172', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (926, 13, 47, NULL, 3422, true, '8162979467989', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (927, 9, 48, NULL, 3422, true, '7935633225936', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (928, 10, 48, NULL, 3422, true, '219180724860', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (929, 11, 48, NULL, 3422, true, '2103717305582', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (930, 12, 48, NULL, 3422, true, '2092034843676', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (931, 13, 48, NULL, 3422, true, '4954814307919', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (932, 9, 49, NULL, 3422, true, '8596329201413', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (933, 10, 49, NULL, 3422, true, '8173711839923', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (934, 11, 49, NULL, 3422, true, '1699326218502', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (935, 12, 49, NULL, 3422, true, '801068461697', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (936, 13, 49, NULL, 3422, true, '2433899647139', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (937, 9, 50, NULL, 3422, true, '3391284328502', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (938, 10, 50, NULL, 3422, true, '9050416421071', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (939, 11, 50, NULL, 3422, true, '8995211530246', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (940, 12, 50, NULL, 3422, true, '5042772893495', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (941, 13, 50, NULL, 3422, true, '6984207432630', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (942, 9, 51, NULL, 3422, true, '7109122901122', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (943, 10, 51, NULL, 3422, true, '9566127005118', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (944, 12, 51, NULL, 3422, true, '3064264130864', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (945, 13, 51, NULL, 3422, true, '8628279447865', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (946, 9, 52, NULL, 3422, true, '3889118363664', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (947, 10, 52, NULL, 3422, true, '4234852581360', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (948, 12, 52, NULL, 3422, true, '5674784922166', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (949, 13, 52, NULL, 3422, true, '4754014632714', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (950, 9, 53, NULL, 3422, true, '5910430549324', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (951, 10, 53, NULL, 3422, true, '3257853675671', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (952, 12, 53, NULL, 3422, true, '6055722679859', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (953, 13, 53, NULL, 3422, true, '6609744286790', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (954, 9, 54, NULL, 3422, true, '5623922039733', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (955, 10, 54, NULL, 3422, true, '7028690078920', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (956, 13, 54, NULL, 3422, true, '7384610777298', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (957, 9, 55, NULL, 3422, true, '8661466629114', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (958, 13, 55, NULL, 3422, true, '1981394672938', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (959, 14, 18, NULL, 3422, true, '3242299240123', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (960, 14, 19, NULL, 3422, true, '872216783134', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (961, 14, 20, NULL, 3422, true, '822295123651', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (962, 14, 21, NULL, 3422, true, '1856700897540', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (963, 14, 22, NULL, 3422, true, '4115442428119', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (964, 14, 23, NULL, 3422, true, '4849703586474', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (965, 14, 24, NULL, 3422, true, '1140365639229', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (966, 14, 25, NULL, 3422, true, '2520525611765', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (967, 14, 26, NULL, 3422, true, '1902363807976', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (968, 14, 27, NULL, 3422, true, '9386662843053', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (969, 14, 28, NULL, 3422, true, '1971059974945', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (970, 14, 29, NULL, 3422, true, '9066676097624', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (971, 14, 30, NULL, 3422, true, '568002261658', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (972, 14, 31, NULL, 3422, true, '4259975606682', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (973, 14, 32, NULL, 3422, true, '6679849366290', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (974, 14, 33, NULL, 3422, true, '1707893524864', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (975, 14, 34, NULL, 3422, true, '8454468663960', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (976, 14, 35, NULL, 3422, true, '4368270170024', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (977, 14, 36, NULL, 3422, true, '8193735361546', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (978, 14, 37, NULL, 3422, true, '2399137632368', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (979, 14, 60, NULL, 3422, true, '4631926539499', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (980, 14, 61, NULL, 3422, true, '8170829540273', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (981, 14, 62, NULL, 3422, true, '6819236321267', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (982, 14, 63, NULL, 3422, true, '2349553422989', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (983, 14, 64, NULL, 3422, true, '1732875997702', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (984, 14, 65, NULL, 3422, true, '1364335057294', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (985, 14, 66, NULL, 3422, true, '3270856575295', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (986, 14, 67, NULL, 3422, true, '8312772091449', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (987, 14, 68, NULL, 3422, true, '8191643165227', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (988, 14, 69, NULL, 3422, true, '7290936409839', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (989, 14, 70, NULL, 3422, true, '6435541881635', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (990, 14, 71, NULL, 3422, true, '8759386530866', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (991, 14, 72, NULL, 3422, true, '8492484828058', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (992, 14, 73, NULL, 3422, true, '4357537435576', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (993, 14, 74, NULL, 3422, true, '1253054844883', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (994, 14, 75, NULL, 3422, true, '2384641704017', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (995, 14, 76, NULL, 3422, true, '7545854878616', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (996, 14, 77, NULL, 3422, true, '5039278851589', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (997, 14, 78, NULL, 3422, true, '4940666250603', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);
INSERT INTO public.seats (id, "row", col, email, price, active, uuid, qr, "createdAt", "updatedAt", "eventId", "sectorId", "statusId") VALUES (998, 14, 79, NULL, 3422, true, '7508942183352', NULL, '2023-11-30 22:35:59.351+00', '2023-11-30 22:35:59.351+00', 1, 3, 1);


--
-- TOC entry 3051 (class 0 OID 16970)
-- Dependencies: 209
-- Data for Name: sectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sectors (id, name) VALUES (1, 'Bronze');
INSERT INTO public.sectors (id, name) VALUES (2, 'Silver');
INSERT INTO public.sectors (id, name) VALUES (3, 'Gold');
INSERT INTO public.sectors (id, name) VALUES (4, 'Platinum');


--
-- TOC entry 3053 (class 0 OID 16981)
-- Dependencies: 211
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.statuses (id, name) VALUES (1, 'Свободно');
INSERT INTO public.statuses (id, name) VALUES (2, 'Ожидает подтверждения');
INSERT INTO public.statuses (id, name) VALUES (3, 'Забронирован');


--
-- TOC entry 3047 (class 0 OID 16946)
-- Dependencies: 205
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, email, password) VALUES (1, 'bigbeautyboss1@gmail.com', 'sup3rS3cr3tP455W0RD_14Dfqmv65');


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 202
-- Name: balconies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.balconies_id_seq', 1, false);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 214
-- Name: balcons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.balcons_id_seq', 400, true);


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 206
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, true);


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 212
-- Name: seats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seats_id_seq', 998, true);


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 208
-- Name: sectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sectors_id_seq', 4, true);


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 210
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statuses_id_seq', 3, true);


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 2897 (class 2606 OID 16464)
-- Name: balconies balconies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balconies
    ADD CONSTRAINT balconies_pkey PRIMARY KEY (id);


--
-- TOC entry 2911 (class 2606 OID 17023)
-- Name: balcons balcons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balcons
    ADD CONSTRAINT balcons_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 16967)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 16997)
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 16978)
-- Name: sectors sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_pkey PRIMARY KEY (id);


--
-- TOC entry 2907 (class 2606 OID 16986)
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 16956)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2901 (class 2606 OID 16954)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 17024)
-- Name: balcons balcons_eventId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balcons
    ADD CONSTRAINT "balcons_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES public.events(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2916 (class 2606 OID 17029)
-- Name: balcons balcons_sectorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balcons
    ADD CONSTRAINT "balcons_sectorId_fkey" FOREIGN KEY ("sectorId") REFERENCES public.sectors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2917 (class 2606 OID 17034)
-- Name: balcons balcons_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balcons
    ADD CONSTRAINT "balcons_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public.statuses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2912 (class 2606 OID 16998)
-- Name: seats seats_eventId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT "seats_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES public.events(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2913 (class 2606 OID 17003)
-- Name: seats seats_sectorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT "seats_sectorId_fkey" FOREIGN KEY ("sectorId") REFERENCES public.sectors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 17008)
-- Name: seats seats_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT "seats_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public.statuses(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2023-11-30 22:39:04 UTC

--
-- PostgreSQL database dump complete
--

