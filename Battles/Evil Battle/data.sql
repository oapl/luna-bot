--
-- PostgreSQL database dump
--

\restrict 1VIF7s6uCGKMcVA4CXw61G49FpmWNNon5CUNe1yOtfnVTUzPjBZldqJVLf1uuKa

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
-- Data for Name: Evil Battle; Type: TABLE DATA; Schema: battles; Owner: -
--

COPY battles."Evil Battle" (event_key, battle_name, original_battle_key, user_id, username, clan_name, member_rank, points, global_rank, ranked_players, source_kind, source_run_key, observed_at, result_status, source_record_id) FROM stdin;
CardBattle	Evil Battle	evilbattle	824564901	ralsvi	PSAG	62	\N	62	\N	external_import	history-import:big_bot:994	2026-07-14 15:22:52.96+00	imported_history	\N
CardBattle	Evil Battle	evilbattle	109818	Kerplopal	NONG	130	\N	130	\N	external_import	history-import:big_bot:28	2026-07-17 00:44:55.911+00	imported_history	\N
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 1VIF7s6uCGKMcVA4CXw61G49FpmWNNon5CUNe1yOtfnVTUzPjBZldqJVLf1uuKa


COPY battles.clan_results ("event_key","original_battle_key","source_view","clan_name","rank","points","source_candidate_rows","source_run_key","observed_at") FROM stdin;
\.
