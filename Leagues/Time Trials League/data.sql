--
-- PostgreSQL database dump
--

\restrict FQCg9KwnTxj3fRYv0Kn0nCdCb06lTOW8GShG5hNZ90NCVI9HWv2wWUlz1BQ5e7T

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
-- Data for Name: Time Trials League; Type: TABLE DATA; Schema: leagues; Owner: -
--

COPY leagues."Time Trials League" (event_key, observation_id, original_event_key, league_run_key, period_started_at, period_ended_at, source_record_id, snapshot_id, fetched_at, source, league_name, league_id, league_level, league_points, member_capacity, source_rank, user_id, display_name, points, last_contribution_at, source_created_at, archived_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict FQCg9KwnTxj3fRYv0Kn0nCdCb06lTOW8GShG5hNZ90NCVI9HWv2wWUlz1BQ5e7T

