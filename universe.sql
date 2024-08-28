--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    descriptions text,
    galaxy_type character varying(30),
    galaxy_rule_table character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    discover_year integer,
    is_main_moon boolean NOT NULL,
    diameter_in_km integer,
    is_spherical boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    has_water boolean,
    oribital_period_years numeric(7,2),
    distance_from_earch numeric(7,2),
    discoverer character varying(30),
    has_moon boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    descriptions text,
    age_in_millions_years numeric(7,2),
    magnitude numeric(7,2),
    is_starcluster boolean NOT NULL,
    starcluster_id integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: starcluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.starcluster (
    starcluster_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_light_year numeric(7,2),
    star_nums integer,
    starcluster_type character varying(30),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.starcluster OWNER TO freecodecamp;

--
-- Name: starcluster_starcluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.starcluster_starcluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.starcluster_starcluster_id_seq OWNER TO freecodecamp;

--
-- Name: starcluster_starcluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.starcluster_starcluster_id_seq OWNED BY public.starcluster.starcluster_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: starcluster starcluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starcluster ALTER COLUMN starcluster_id SET DEFAULT nextval('public.starcluster_starcluster_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy01', 'this descriptions', 'type one', NULL);
INSERT INTO public.galaxy VALUES (2, 'galaxy02', 'this descriptions', 'type two', NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy03', 'this descriptions', 'type three', NULL);
INSERT INTO public.galaxy VALUES (4, 'galaxy04', 'this descriptions', 'type four', NULL);
INSERT INTO public.galaxy VALUES (5, 'galaxy05', 'this descriptions', 'type five', NULL);
INSERT INTO public.galaxy VALUES (6, 'galaxy06', 'this descriptions', 'type six', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (46, 'moon1', 1200, true, 54, false, 1);
INSERT INTO public.moon VALUES (47, 'moon2', 1000, false, 20, true, 2);
INSERT INTO public.moon VALUES (48, 'moon3', 1000, false, 30, true, 1);
INSERT INTO public.moon VALUES (49, 'moon4', 1000, false, 20, true, 1);
INSERT INTO public.moon VALUES (50, 'moon5', 900, true, 100, true, 3);
INSERT INTO public.moon VALUES (51, 'moon6', 800, true, 200, true, 4);
INSERT INTO public.moon VALUES (52, 'moon7', 1000, true, 800, true, 5);
INSERT INTO public.moon VALUES (53, 'moon8', 1000, true, 100, true, 6);
INSERT INTO public.moon VALUES (54, 'moon9', 1000, true, 200, true, 7);
INSERT INTO public.moon VALUES (55, 'moon10', 1000, true, 100, true, 8);
INSERT INTO public.moon VALUES (56, 'moon11', 1000, true, 100, true, 9);
INSERT INTO public.moon VALUES (57, 'moon12', 1000, true, 100, true, 10);
INSERT INTO public.moon VALUES (58, 'moon13', 1000, true, 200, true, 11);
INSERT INTO public.moon VALUES (59, 'moon14', 1000, true, 300, true, 12);
INSERT INTO public.moon VALUES (60, 'moon15', 1000, true, 400, true, 13);
INSERT INTO public.moon VALUES (61, 'moon16', 100, true, 500, true, 14);
INSERT INTO public.moon VALUES (62, 'moon17', 1000, false, 400, true, 13);
INSERT INTO public.moon VALUES (63, 'moon18', 1000, false, 400, true, 12);
INSERT INTO public.moon VALUES (64, 'moon19', 1000, false, 300, false, 11);
INSERT INTO public.moon VALUES (65, 'moon20', 1000, false, 200, false, 10);
INSERT INTO public.moon VALUES (66, 'moon21', 800, false, 100, false, 15);
INSERT INTO public.moon VALUES (67, 'moon22', 700, false, 100, false, 16);
INSERT INTO public.moon VALUES (68, 'moon23', 600, false, 100, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet01', false, false, 1.11, 1.20, 'discoverer one', true, 1);
INSERT INTO public.planet VALUES (2, 'planet02', false, false, 2.11, 1.20, 'discoverer two', true, 2);
INSERT INTO public.planet VALUES (3, 'planet03', false, false, 3.11, 1.20, 'discoverer three', true, 3);
INSERT INTO public.planet VALUES (4, 'planet04', false, true, 4.11, 1.20, 'discoverer four', true, 4);
INSERT INTO public.planet VALUES (5, 'planet05', false, false, 5.11, 1.20, 'discoverer five', true, 4);
INSERT INTO public.planet VALUES (6, 'planet06', false, false, 6.11, 1.20, 'discoverer six', true, 5);
INSERT INTO public.planet VALUES (7, 'planet07', false, false, 7.11, 1.20, 'discoverer seven', true, 6);
INSERT INTO public.planet VALUES (8, 'planet08', false, false, 8.11, 1.20, 'discoverer eight', true, 7);
INSERT INTO public.planet VALUES (9, 'planet09', false, false, 9.11, 1.20, 'discoverer nine', true, 8);
INSERT INTO public.planet VALUES (10, 'planet10', false, true, 10.11, 1.20, 'discoverer ten', true, 2);
INSERT INTO public.planet VALUES (11, 'planet11', false, false, 11.11, 1.20, 'discoverer eleven', true, 6);
INSERT INTO public.planet VALUES (12, 'planet12', false, false, 12.11, 1.20, 'discoverer twelev', true, 7);
INSERT INTO public.planet VALUES (13, 'planet13', false, false, 13.11, 1.20, 'discoverer thirteen', true, 3);
INSERT INTO public.planet VALUES (14, 'planet14', false, true, 14.11, 1.20, 'discoverer fourteen', true, 1);
INSERT INTO public.planet VALUES (15, 'planet15', false, false, 15.11, 1.20, 'discoverer fifeen', true, 5);
INSERT INTO public.planet VALUES (16, 'planet16', false, false, 16.11, 1.20, 'discoverer sixteen', true, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star01', 'star descriptions', 1.11, 11.11, true, 1, 1);
INSERT INTO public.star VALUES (2, 'star02', 'star descriptions', 2.11, 12.11, true, 2, 2);
INSERT INTO public.star VALUES (3, 'star03', 'star descriptions', 3.11, 13.11, true, 3, 3);
INSERT INTO public.star VALUES (4, 'star04', 'star descriptions', 4.11, 14.11, true, 4, 4);
INSERT INTO public.star VALUES (5, 'star05', 'star descriptions', 5.11, 15.11, true, 5, 5);
INSERT INTO public.star VALUES (6, 'star06', 'star descriptions', 6.11, 16.11, true, 6, 6);
INSERT INTO public.star VALUES (7, 'star07', 'star descriptions', 7.11, 17.11, true, 7, 2);
INSERT INTO public.star VALUES (8, 'star08', 'star descriptions', 8.11, 18.11, true, 8, 3);


--
-- Data for Name: starcluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.starcluster VALUES (1, 'starcluster01', 1.11, 100, 'starcluster type one', 1);
INSERT INTO public.starcluster VALUES (2, 'starcluster02', 2.11, 100, 'starcluster type two', 2);
INSERT INTO public.starcluster VALUES (3, 'starcluster03', 3.11, 100, 'starcluster type three', 3);
INSERT INTO public.starcluster VALUES (4, 'starcluster04', 4.11, 100, 'starcluster type four', 4);
INSERT INTO public.starcluster VALUES (5, 'starcluster05', 5.11, 100, 'starcluster type five', 5);
INSERT INTO public.starcluster VALUES (6, 'starcluster06', 6.11, 100, 'starcluster type six', 6);
INSERT INTO public.starcluster VALUES (7, 'starcluster07', 7.11, 100, 'starcluster type seven', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 68, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: starcluster_starcluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.starcluster_starcluster_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: starcluster starcluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starcluster
    ADD CONSTRAINT starcluster_name_key UNIQUE (name);


--
-- Name: starcluster starcluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starcluster
    ADD CONSTRAINT starcluster_pkey PRIMARY KEY (starcluster_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
