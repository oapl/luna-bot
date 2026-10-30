--
-- PostgreSQL database dump
--

\restrict Uo4sEJI8TcMycTIA5wiEgCjFEWGlT8Yae59X1YJgzQN4PRiRT2O0oyhKahoHozT

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
-- Data for Name: Bee Battle; Type: TABLE DATA; Schema: battles; Owner: -
--

COPY battles."Bee Battle" (event_key, battle_name, original_battle_key, user_id, username, clan_name, member_rank, points, global_rank, ranked_players, source_kind, source_run_key, observed_at, result_status, source_record_id) FROM stdin;
SantaBattle	Bee Battle	beebattle	4641548217	FIGHTER92399alt	FR3E	56	\N	56	\N	external_import	history-import:big_bot:938	2026-07-07 20:28:47.777+00	imported_history	\N
\.


--
-- PostgreSQL database dump complete
--

\unrestrict Uo4sEJI8TcMycTIA5wiEgCjFEWGlT8Yae59X1YJgzQN4PRiRT2O0oyhKahoHozT


COPY battles.clan_results ("event_key","original_battle_key","source_view","clan_name","rank","points","source_candidate_rows","source_run_key","observed_at") FROM stdin;
\.
