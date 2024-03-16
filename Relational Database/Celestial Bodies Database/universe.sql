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
    name character varying(60) NOT NULL,
    diameter_in_ly integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_type character varying(20) NOT NULL
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
-- Name: landing_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.landing_mission (
    landing_mission_id integer NOT NULL,
    date date NOT NULL,
    name character varying(60),
    country text,
    was_successful boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.landing_mission OWNER TO freecodecamp;

--
-- Name: landing_mission_landing_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.landing_mission_landing_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.landing_mission_landing_mission_id_seq OWNER TO freecodecamp;

--
-- Name: landing_mission_landing_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.landing_mission_landing_mission_id_seq OWNED BY public.landing_mission.landing_mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    distance_from_planet_in_km numeric(20,2),
    radius_in_km numeric(20,2),
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
    name character varying(60) NOT NULL,
    mean_radius_in_km numeric(20,2),
    star_id integer NOT NULL,
    has_rings boolean NOT NULL
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
    name character varying(60) NOT NULL,
    temperature_in_k integer NOT NULL,
    age_in_millions_of_years integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: landing_mission landing_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.landing_mission ALTER COLUMN landing_mission_id SET DEFAULT nextval('public.landing_mission_landing_mission_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Our home galaxy', 13000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 'Nearest spiral galaxy', 2200, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 'Third-largest galaxy in the Local Group', 1300, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 1200000, 'Located in the Virgo Cluster', 6000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 30000, 'Interacting with a smaller galaxy', 450, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 50000, 'Known for its bright nucleus and large central bulge', 800, 'Spiral');


--
-- Data for Name: landing_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.landing_mission VALUES (1, '1996-03-01', 'Venera 3', 'USSR', false, 3);
INSERT INTO public.landing_mission VALUES (2, '1985-06-15', 'Vega 2 Lander', 'USSR', true, 3);
INSERT INTO public.landing_mission VALUES (3, '2021-05-14', 'Tianwen-1 lander and Zhurong rover', 'China', true, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400.00, 1737.10, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 9377.00, 11.10, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460.00, 6.20, 2);
INSERT INTO public.moon VALUES (4, 'Io', 421800.00, 1821.60, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 671100.00, 1560.80, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070400.00, 2631.20, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882700.00, 2410.30, 4);
INSERT INTO public.moon VALUES (8, 'Titania', 435910.00, 788.90, 5);
INSERT INTO public.moon VALUES (9, 'Oberon', 583520.00, 761.40, 5);
INSERT INTO public.moon VALUES (10, 'Miranda', 129780.00, 235.80, 5);
INSERT INTO public.moon VALUES (11, 'Ariel', 190900.00, 578.90, 5);
INSERT INTO public.moon VALUES (12, 'Umbriel', 266000.00, 584.70, 5);
INSERT INTO public.moon VALUES (13, 'Triton', 354800.00, 1353.40, 8);
INSERT INTO public.moon VALUES (14, 'Nereid', 5513800.00, 170.00, 8);
INSERT INTO public.moon VALUES (15, 'Proteus', 117646.00, 210.00, 8);
INSERT INTO public.moon VALUES (16, 'Charon', 19591.00, 603.60, 9);
INSERT INTO public.moon VALUES (17, 'Hippocamp', 105283.00, 13.00, 10);
INSERT INTO public.moon VALUES (18, 'Moon X', 100000.00, 100.00, 1);
INSERT INTO public.moon VALUES (19, 'Rhea', 527040.00, 764.50, 7);
INSERT INTO public.moon VALUES (20, 'Dione', 377420.00, 561.40, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6371.00, 1, false);
INSERT INTO public.planet VALUES (2, 'Mars', 3389.50, 1, false);
INSERT INTO public.planet VALUES (3, 'Venus', 6051.80, 1, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 69911.00, 1, true);
INSERT INTO public.planet VALUES (5, 'Uranus', 25362.00, 1, true);
INSERT INTO public.planet VALUES (6, 'Mercury', 2439.70, 1, false);
INSERT INTO public.planet VALUES (7, 'Saturn', 58232.00, 1, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622.00, 1, true);
INSERT INTO public.planet VALUES (9, 'WASP-17b', 107241.00, 6, false);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 71492.00, 7, false);
INSERT INTO public.planet VALUES (11, 'J1407b', NULL, 5, true);
INSERT INTO public.planet VALUES (12, 'Tau Ceti e', 10971.00, 4, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, 4600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3042, 6000, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 9940, 250, 1);
INSERT INTO public.star VALUES (4, 'Tau Ceti', 5344, 5700, 1);
INSERT INTO public.star VALUES (5, 'V1400 Centauri', 4500, 5000, 1);
INSERT INTO public.star VALUES (6, 'WASP-17', 6700, 4000, 2);
INSERT INTO public.star VALUES (7, 'HD 209458', 6091, 4000, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: landing_mission_landing_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.landing_mission_landing_mission_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: landing_mission landing_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.landing_mission
    ADD CONSTRAINT landing_mission_name_key UNIQUE (name);


--
-- Name: landing_mission landing_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.landing_mission
    ADD CONSTRAINT landing_mission_pkey PRIMARY KEY (landing_mission_id);


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
-- Name: landing_mission landing_mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.landing_mission
    ADD CONSTRAINT landing_mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

