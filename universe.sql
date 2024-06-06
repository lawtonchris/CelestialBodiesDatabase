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
-- Name: astroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astroid (
    astroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age integer NOT NULL,
    distance numeric(4,1),
    headed_toward_earth boolean,
    has_minerals boolean
);


ALTER TABLE public.astroid OWNER TO freecodecamp;

--
-- Name: astroid_astroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astroid_astroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astroid_astroid_id_seq OWNER TO freecodecamp;

--
-- Name: astroid_astroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astroid_astroid_id_seq OWNED BY public.astroid.astroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    number_stars integer NOT NULL,
    number_suns integer,
    distance numeric(4,1),
    life boolean,
    visited boolean,
    description text
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
    planet_id integer,
    name character varying(255) NOT NULL,
    number_stars integer NOT NULL,
    age integer,
    distance numeric(4,1),
    life boolean,
    visited boolean
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
    star_id integer,
    name character varying(255) NOT NULL,
    number_moons integer NOT NULL,
    age integer,
    distance numeric(4,1),
    life boolean,
    visited boolean
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
    galaxy_id integer,
    name character varying(255) NOT NULL,
    number_planets integer NOT NULL,
    age integer,
    distance numeric(4,1),
    life boolean,
    visited boolean
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
-- Name: astroid astroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid ALTER COLUMN astroid_id SET DEFAULT nextval('public.astroid_astroid_id_seq'::regclass);


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
-- Data for Name: astroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astroid VALUES (1, 'astroid 1', 10, 5.4, false, true);
INSERT INTO public.astroid VALUES (2, 'astroid 2', 20, 25.4, true, true);
INSERT INTO public.astroid VALUES (3, 'astroid 3', 30, 35.4, false, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 0, 1, 10.5, true, false, 'test 1');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 100, 10, 2.5, false, false, 'test 2');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5000, 1, 4.5, true, true, 'test 3');
INSERT INTO public.galaxy VALUES (4, 'Comet', 566, 100, 4.1, false, false, 'test 4');
INSERT INTO public.galaxy VALUES (5, 'GN-z11', 7234, 1, 4.0, true, true, 'test 5');
INSERT INTO public.galaxy VALUES (6, 'Malin 1', 10, 1, 123.5, false, true, 'test 6');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'moon 2', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (2, 2, 'moon 3', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (3, 3, 'moon 4', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (4, 4, 'moon 5', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (5, 5, 'moon 6', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (6, 6, 'moon 7', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (7, 7, 'moon 8', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (8, 8, 'moon 9', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (9, 9, 'moon 1', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (10, 10, 'moon 10', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (11, 11, 'moon 11', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (12, 12, 'moon 12', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (13, 11, 'moon 13', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (14, 10, 'moon 14', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (15, 9, 'moon 15', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (16, 8, 'moon 16', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (17, 7, 'moon 17', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (18, 6, 'moon 18', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (19, 5, 'moon 19', 0, 1, 2.1, true, true);
INSERT INTO public.moon VALUES (20, 4, 'moon 20', 0, 1, 2.1, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth 1', 1, 10, 100.0, false, true);
INSERT INTO public.planet VALUES (2, 2, 'Mars 2', 2, 20, 200.0, false, true);
INSERT INTO public.planet VALUES (3, 3, 'Mercury 3', 3, 30, 300.0, false, false);
INSERT INTO public.planet VALUES (4, 4, 'Venus', 4, 40, 400.0, true, true);
INSERT INTO public.planet VALUES (5, 5, 'Uranus', 5, 50, 500.0, true, false);
INSERT INTO public.planet VALUES (6, 6, 'Neptune', 6, 60, 600.0, false, true);
INSERT INTO public.planet VALUES (7, 1, 'Jupiter', 7, 10, 100.0, false, true);
INSERT INTO public.planet VALUES (8, 2, 'Pluto', 8, 20, 200.0, false, true);
INSERT INTO public.planet VALUES (9, 3, 'Saturn', 9, 30, 300.0, false, false);
INSERT INTO public.planet VALUES (10, 4, 'planet 10', 10, 100, 400.0, true, true);
INSERT INTO public.planet VALUES (11, 5, 'planet 11', 11, 110, 500.0, true, false);
INSERT INTO public.planet VALUES (12, 6, 'planet 12', 12, 120, 600.0, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'star 1', 1, 10, 100.0, false, true);
INSERT INTO public.star VALUES (2, 2, 'star 2', 2, 20, 200.0, false, true);
INSERT INTO public.star VALUES (3, 3, 'star 3', 3, 30, 300.0, false, false);
INSERT INTO public.star VALUES (4, 4, 'star 4', 4, 40, 400.0, true, true);
INSERT INTO public.star VALUES (5, 5, 'star 5', 5, 50, 500.0, true, false);
INSERT INTO public.star VALUES (6, 6, 'star 6', 6, 60, 600.0, false, true);


--
-- Name: astroid_astroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astroid_astroid_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astroid astroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroid_name_key UNIQUE (name);


--
-- Name: astroid astroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroid_pkey PRIMARY KEY (astroid_id);


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
-- Name: star star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_star_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_fkey1 FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_star_id_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_fkey2 FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_star_id_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_fkey3 FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

