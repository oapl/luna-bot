--
-- PostgreSQL database dump
--

\restrict 9psZ1Bj1vhazdPcMl0IlclH1Dd0Sc7MRjFOY1lnfPKbjCJ8MQ3QakJZS8js9caT

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
-- Data for Name: New Years Battle; Type: TABLE DATA; Schema: battles; Owner: -
--

COPY battles."New Years Battle" (event_key, battle_name, original_battle_key, user_id, username, clan_name, member_rank, points, global_rank, ranked_players, source_kind, source_run_key, observed_at) FROM stdin;
NewYear2024	New Years Battle	newyearsbattle	4641548217	FIGHTER92399alt	FR3E	3	\N	3	\N	external_import	history-import:big_bot:941	2026-07-07 20:28:47.777+00
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 9psZ1Bj1vhazdPcMl0IlclH1Dd0Sc7MRjFOY1lnfPKbjCJ8MQ3QakJZS8js9caT


COPY battles.clan_results("event_key","original_battle_key","source_view","clan_name","rank","points","source_candidate_rows","source_run_key","observed_at")FROM stdin;
\.
