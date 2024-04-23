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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 232);
INSERT INTO public.games VALUES (2, 1, 677);
INSERT INTO public.games VALUES (3, 2, 256);
INSERT INTO public.games VALUES (4, 2, 522);
INSERT INTO public.games VALUES (5, 1, 416);
INSERT INTO public.games VALUES (6, 1, 369);
INSERT INTO public.games VALUES (7, 1, 557);
INSERT INTO public.games VALUES (8, 1, 0);
INSERT INTO public.games VALUES (9, 1, 10);
INSERT INTO public.games VALUES (10, 3, 4);
INSERT INTO public.games VALUES (11, 4, 4);
INSERT INTO public.games VALUES (12, 4, 3);
INSERT INTO public.games VALUES (13, 5, 6);
INSERT INTO public.games VALUES (14, 5, 6);
INSERT INTO public.games VALUES (15, 6, 6);
INSERT INTO public.games VALUES (16, 6, 6);
INSERT INTO public.games VALUES (17, 5, 8);
INSERT INTO public.games VALUES (18, 5, 7);
INSERT INTO public.games VALUES (19, 5, 6);
INSERT INTO public.games VALUES (20, 7, 441);
INSERT INTO public.games VALUES (21, 7, 351);
INSERT INTO public.games VALUES (22, 8, 565);
INSERT INTO public.games VALUES (23, 8, 753);
INSERT INTO public.games VALUES (24, 7, 823);
INSERT INTO public.games VALUES (25, 7, 284);
INSERT INTO public.games VALUES (26, 7, 544);
INSERT INTO public.games VALUES (27, 9, 404);
INSERT INTO public.games VALUES (28, 9, 591);
INSERT INTO public.games VALUES (29, 10, 272);
INSERT INTO public.games VALUES (30, 10, 418);
INSERT INTO public.games VALUES (31, 9, 509);
INSERT INTO public.games VALUES (32, 9, 809);
INSERT INTO public.games VALUES (33, 9, 823);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1713892782782');
INSERT INTO public.users VALUES (2, 'user_1713892782781');
INSERT INTO public.users VALUES (3, 'jason');
INSERT INTO public.users VALUES (4, '1');
INSERT INTO public.users VALUES (5, 'user_1713893552559');
INSERT INTO public.users VALUES (6, 'user_1713893552558');
INSERT INTO public.users VALUES (7, 'user_1713893678575');
INSERT INTO public.users VALUES (8, 'user_1713893678574');
INSERT INTO public.users VALUES (9, 'user_1713894013235');
INSERT INTO public.users VALUES (10, 'user_1713894013234');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 33, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 10, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

