--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    galaxy_type text NOT NULL,
    distance_from_earth numeric,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
    planet_id integer NOT NULL,
    radius integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    description text
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
    star_id integer NOT NULL,
    planet_type_id integer NOT NULL,
    has_life boolean NOT NULL,
    distance_from_star numeric NOT NULL,
    age_in_millions_of_years integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_terrestrial boolean NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric NOT NULL,
    is_spherical boolean NOT NULL,
    temperature integer NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, true, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, false, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, false, 12000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, false, 10000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 29000000, false, 13000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 21000000, false, 10000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, false, 'Earth natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, false, 'Inner moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, false, 'Outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, false, 'Volcanically active moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, false, 'Icy moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, false, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, false, 'Heavily cratered moon of Jupiter');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, true, 'Moon of Saturn with a thick atmosphere');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252, false, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 198, false, 'Small moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 764, false, 'Moon of Saturn');
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 735, false, 'Two-toned moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Dione', 6, 561, false, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 531, false, 'Moon of Saturn');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 236, false, 'Moon of Uranus');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 579, false, 'Moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 585, false, 'Moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Titania', 7, 789, false, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 761, false, 'Moon of Uranus');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 1353, false, 'Largest moon of Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, false, 0.39, 4500);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, false, 0.72, 4500);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, true, 1.00, 4540);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, false, 1.52, 4500);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, false, 5.20, 4500);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, false, 9.58, 4500);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, false, 19.20, 4500);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, false, 30.05, 4500);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, 1, false, 0.85, 6000);
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, 1, false, 0.05, 4800);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri Bb', 4, 1, false, 0.04, 5000);
INSERT INTO public.planet VALUES (12, 'Vega b', 6, 2, false, 0.20, 1000);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planet with a solid surface', true);
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planet composed mainly of gases', false);
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planet rich in volatile substances such as water and methane', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, true, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2.06, true, 9940);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 0.12, true, 3042);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 1.10, true, 5790);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 16.50, true, 3500);
INSERT INTO public.star VALUES (6, 'Vega', 1, 2.14, true, 9602);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

