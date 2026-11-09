--
-- PostgreSQL database dump
--

\restrict nOKPZcrdq0qF2KYvXEupAgzPk5yxMuDKIcAfNQn2rKgbwav2IgvxCc98gVGBhYd

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
-- Data for Name: Lucky Battle; Type: TABLE DATA; Schema: battles; Owner: -
--

COPY battles."Lucky Battle" (event_key, battle_name, original_battle_key, user_id, username, clan_name, member_rank, points, global_rank, ranked_players, source_kind, source_run_key, observed_at, result_status, source_record_id) FROM stdin;
LuckyBattle	Lucky Battle	luckybattle	824564901	ralsvi	PSAG	56	\N	56	\N	external_import	history-import:big_bot:993	2026-07-14 15:22:52.96+00	imported_history	\N
LuckyBattle	Lucky Battle	luckybattle	1462748729	dragonballx1412	V1LN	64	\N	64	\N	external_import	history-import:big_bot:71	2026-07-17 01:05:07.779+00	imported_history	\N
LuckyBattle	Lucky Battle	luckybattle	3655474970	Shrooomdevourer10	V1LN	64	604000	64	\N	external_import	history-import:big_bot:1077	2026-07-03 23:39:30.698+00	imported_history	\N
LuckyBattle	Lucky Battle	luckybattle	109818	Kerplopal	NONG	7	\N	7	\N	external_import	history-import:big_bot:27	2026-07-17 00:44:55.911+00	imported_history	\N
\.


--
-- PostgreSQL database dump complete
--

\unrestrict nOKPZcrdq0qF2KYvXEupAgzPk5yxMuDKIcAfNQn2rKgbwav2IgvxCc98gVGBhYd


COPY battles.clan_results ("event_key","original_battle_key","source_view","clan_name","rank","points","source_candidate_rows","source_run_key","observed_at") FROM stdin;
\.
