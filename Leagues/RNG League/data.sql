--
-- PostgreSQL database dump
--

\restrict eaELpsLbAvacTOwvt5u7InYuBQTHGoPtMA8IevHsbXtM36hcCSXKajG4DIXIa1l

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
-- Data for Name: RNG League; Type: TABLE DATA; Schema: leagues; Owner: -
--

COPY leagues."RNG League" (event_key, observation_id, original_event_key, league_run_key, period_started_at, period_ended_at, source_record_id, snapshot_id, fetched_at, source, league_name, league_id, league_level, league_points, member_capacity, source_rank, user_id, display_name, points, last_contribution_at, source_created_at, archived_at) FROM stdin;
rng-2026	1	rng-2026	active	2026-05-16 16:00:00+00	2026-05-30 16:00:00+00	-800000000001	manual:league-final:rng-2026:yamo	2026-05-30 15:59:59+00	manual_league_history	YAMO	manual:yamo:rng-2026	\N	0	4	1	463900811	AgentP_0928	0	\N	2026-08-21 18:58:57.24901+00	2026-08-21 19:03:56.612417+00
rng-2026	3	rng-2026	active	2026-05-16 16:00:00+00	2026-05-30 16:00:00+00	-800000000002	manual:league-final:rng-2026:yamo	2026-05-30 15:59:59+00	manual_league_history	YAMO	manual:yamo:rng-2026	\N	0	4	2	1856284829	Younes89755	0	\N	2026-08-21 18:58:57.24901+00	2026-08-21 19:03:56.612417+00
rng-2026	4	rng-2026	active	2026-05-16 16:00:00+00	2026-05-30 16:00:00+00	-800000000003	manual:league-final:rng-2026:yamo	2026-05-30 15:59:59+00	manual_league_history	YAMO	manual:yamo:rng-2026	\N	0	4	3	109818	Cinnamowopal	0	\N	2026-08-21 18:58:57.24901+00	2026-08-21 19:03:56.612417+00
rng-2026	364	rng-2026	active	2026-05-16 16:00:00+00	2026-05-30 16:00:00+00	-800000000004	manual:league-final:rng-2026:yamo	2026-05-30 15:59:59+00	manual_league_history	YAMO	manual:yamo:rng-2026	\N	0	4	4	1462748729	dragonballx1412	0	\N	2026-08-21 18:58:57.24901+00	2026-08-21 19:03:56.612417+00
rng-2026	401	rng-2026	active	2026-05-16 16:00:00+00	2026-05-30 16:00:00+00	-800000000099	manual:league-final-rank:rng-2026:yamo	2026-05-30 15:59:59+00	manual_league_history	GLOBAL_TOP_1000_LEAGUES	manual:yamo:rng-2026	\N	0	\N	35	9100000000035	YAMO	0	\N	2026-08-21 18:58:57.24901+00	2026-08-21 19:03:56.612417+00
\.


--
-- PostgreSQL database dump complete
--

\unrestrict eaELpsLbAvacTOwvt5u7InYuBQTHGoPtMA8IevHsbXtM36hcCSXKajG4DIXIa1l

