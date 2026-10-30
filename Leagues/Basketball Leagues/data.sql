-- Team standings load before the player rows that reference them.

COPY leagues.team_results ("event_key","team_key","league_id","league_name","points","league_rank","captured_at","rank_captured_at","source","source_table","source_record_id","snapshot_id","source_run_key","period_started_at","period_ended_at","result_status") FROM stdin;
\.

--
-- PostgreSQL database dump
--

\restrict 0GXtuwPQFFhKkMeLki4cZXivHl6wwDcfj5PAqZVuq7HgdB3weF3z8WJYuSM1Tld

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
-- Data for Name: Basketball Leagues; Type: TABLE DATA; Schema: leagues; Owner: -
--

COPY leagues."Basketball Leagues" (event_key, user_id, username, team_key, league_id, league_name, points, member_rank, league_rank, global_rank, pool_rank, rank_scope, collected_population, league_points, captured_at, source, source_table, source_record_id, snapshot_id, source_run_key, period_started_at, period_ended_at, result_status, member_rank_captured_at, league_rank_captured_at, global_rank_captured_at, pool_rank_captured_at, last_contribution_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 0GXtuwPQFFhKkMeLki4cZXivHl6wwDcfj5PAqZVuq7HgdB3weF3z8WJYuSM1Tld

