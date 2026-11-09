-- Team standings load before the player rows that reference them.

COPY leagues.team_results ("event_key","team_key","league_id","league_name","points","league_rank","captured_at","rank_captured_at","source","source_table","source_record_id","snapshot_id","source_run_key","period_started_at","period_ended_at","result_status") FROM stdin;
deep-backrooms-2026	name:yamo	\N	YAMO	\N	33	2026-06-27 15:59:59+00	2026-06-27 15:59:59+00	manual_league_history	public.ps99_league_final_raw_snapshots	-800000000099	manual:league-final-rank:deep-backrooms-2026:yamo	active	2026-06-20 16:00:00+00	2026-06-27 16:00:00+00	manual_membership
\.
--
-- PostgreSQL database dump
--

\restrict oAy3uZtwxaFrxf3IdkvyN4Xhqam6eaumk90zwFUUHE7qwVMRQsnq1MRuhlF2NPL

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
-- Data for Name: Deep Backrooms League; Type: TABLE DATA; Schema: leagues; Owner: -
--

COPY leagues."Deep Backrooms League" (event_key, user_id, username, team_key, league_id, league_name, points, member_rank, league_rank, global_rank, pool_rank, rank_scope, collected_population, league_points, captured_at, source, source_table, source_record_id, snapshot_id, source_run_key, period_started_at, period_ended_at, result_status, member_rank_captured_at, league_rank_captured_at, global_rank_captured_at, pool_rank_captured_at, last_contribution_at) FROM stdin;
deep-backrooms-2026	463900811	AgentP_0928	name:yamo	\N	YAMO	\N	\N	33	\N	\N	membership_only	\N	\N	2026-06-27 15:59:59+00	manual_league_history	public.ps99_league_final_raw_snapshots	-800000000001	manual:league-final:deep-backrooms-2026:yamo	active	2026-06-20 16:00:00+00	2026-06-27 16:00:00+00	manual_membership	\N	2026-06-27 15:59:59+00	\N	\N	\N
deep-backrooms-2026	1462748729	dragonballx1412	name:yamo	\N	YAMO	\N	\N	33	\N	\N	membership_only	\N	\N	2026-06-27 15:59:59+00	manual_league_history	public.ps99_league_final_raw_snapshots	-800000000004	manual:league-final:deep-backrooms-2026:yamo	active	2026-06-20 16:00:00+00	2026-06-27 16:00:00+00	manual_membership	\N	2026-06-27 15:59:59+00	\N	\N	\N
deep-backrooms-2026	1856284829	Younes89755	name:yamo	\N	YAMO	\N	\N	33	\N	\N	membership_only	\N	\N	2026-06-27 15:59:59+00	manual_league_history	public.ps99_league_final_raw_snapshots	-800000000002	manual:league-final:deep-backrooms-2026:yamo	active	2026-06-20 16:00:00+00	2026-06-27 16:00:00+00	manual_membership	\N	2026-06-27 15:59:59+00	\N	\N	\N
deep-backrooms-2026	109818	Kerplopal	name:yamo	\N	YAMO	\N	\N	33	\N	\N	membership_only	\N	\N	2026-06-27 15:59:59+00	manual_league_history	public.ps99_league_final_raw_snapshots	-800000000003	manual:league-final:deep-backrooms-2026:yamo	active	2026-06-20 16:00:00+00	2026-06-27 16:00:00+00	manual_membership	\N	2026-06-27 15:59:59+00	\N	\N	\N
\.


--
-- PostgreSQL database dump complete
--

\unrestrict oAy3uZtwxaFrxf3IdkvyN4Xhqam6eaumk90zwFUUHE7qwVMRQsnq1MRuhlF2NPL

