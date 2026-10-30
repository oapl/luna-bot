--
-- PostgreSQL database dump
--

\restrict bdhOmC7BCkcGLGAsdGmJyrySeddN2qFaq9VyT69OKFY19wFxlJhpIASPXDfzwkz

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: Pet Games Battle; Type: TABLE DATA; Schema: battles; Owner: -
--

COPY battles."Pet Games Battle" (event_key, battle_name, original_battle_key, user_id, username, clan_name, member_rank, points, global_rank, ranked_players, source_kind, source_run_key, observed_at) FROM stdin;
SquidBattle	Pet Games Battle	petgamesbattle	1824713899	hayojeu2k	H8ER	22	\N	22	\N	external_import	history-import:big_bot:1022	2026-07-08 06:33:31.881+00
SquidBattle	Pet Games Battle	petgamesbattle	4641548217	FIGHTER92399alt	FR3E	2	\N	2	\N	external_import	history-import:big_bot:942	2026-07-07 20:28:47.777+00
\.


--
-- PostgreSQL database dump complete
--

\unrestrict bdhOmC7BCkcGLGAsdGmJyrySeddN2qFaq9VyT69OKFY19wFxlJhpIASPXDfzwkz


COPY battles.clan_results("event_key","original_battle_key","source_view","clan_name","rank","points","source_candidate_rows","source_run_key","observed_at")FROM stdin;
\.
