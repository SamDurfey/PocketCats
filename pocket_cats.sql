--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: cats; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE cats (
    id integer NOT NULL,
    name character varying,
    status boolean,
    location character varying,
    date timestamp without time zone,
    description character varying,
    image character varying
);


ALTER TABLE cats OWNER TO "Guest";

--
-- Name: cats_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE cats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cats_id_seq OWNER TO "Guest";

--
-- Name: cats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE cats_id_seq OWNED BY cats.id;


--
-- Name: cats_users; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE cats_users (
    id integer NOT NULL,
    user_id integer,
    cat_id integer
);


ALTER TABLE cats_users OWNER TO "Guest";

--
-- Name: cats_users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE cats_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cats_users_id_seq OWNER TO "Guest";

--
-- Name: cats_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE cats_users_id_seq OWNED BY cats_users.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    description character varying,
    user_id integer,
    cat_id integer,
    date timestamp without time zone
);


ALTER TABLE comments OWNER TO "Guest";

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO "Guest";

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    lat character varying,
    lng character varying,
    cat_id integer
);


ALTER TABLE locations OWNER TO "Guest";

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE location_id_seq OWNER TO "Guest";

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE location_id_seq OWNED BY locations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE users OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY cats ALTER COLUMN id SET DEFAULT nextval('cats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY cats_users ALTER COLUMN id SET DEFAULT nextval('cats_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('location_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: cats; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY cats (id, name, status, location, date, description, image) FROM stdin;
1	Bilbo	f	(45.51912790766394, -122.6423442363739)	2016-05-19 11:17:07.273	Tortoise Shell	\N
2	Jonesy	f	(45.50493329387695, -122.68237352371216)	2016-05-19 11:17:29.407	Orange	\N
3	Ricky	f	(45.5438396421886, -122.6668381690979)	2016-05-19 11:18:08.775	Grey	\N
4	Dingus	f	(45.5315452579927, -122.65329837799072)	2016-05-19 13:13:59.581	Unknown	\N
5	Gandalf	f	(45.52054115838411, -122.70531177520752)	2016-05-19 13:26:22.568	Grey	data:image/jpeg;base64,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
6	Flick	f	(45.52296164364058, -122.66560435295105)	2016-05-19 13:28:41.387	Siamese	data:image/jpeg;base64,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
\.


--
-- Name: cats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('cats_id_seq', 6, true);


--
-- Data for Name: cats_users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY cats_users (id, user_id, cat_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	4
5	1	5
6	3	6
\.


--
-- Name: cats_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('cats_users_id_seq', 6, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY comments (id, description, user_id, cat_id, date) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('location_id_seq', 2, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY locations (id, lat, lng, cat_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY users (id, name) FROM stdin;
1	Sam_Deezy
2	balls
3	MoDeezNUts
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: cats_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);


--
-- Name: cats_users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY cats_users
    ADD CONSTRAINT cats_users_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: location_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

