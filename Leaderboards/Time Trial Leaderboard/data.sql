--
-- PostgreSQL database dump
--

\restrict L48n2Uz7F894tKK1ZwczUFnzCwgSNzg4s67oG6dFRB4d5iFZkE6U2bXfvLMMDhS

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
-- Data for Name: Time Trial Leaderboard; Type: TABLE DATA; Schema: leaderboards; Owner: -
--

COPY leaderboards."Time Trial Leaderboard" (event_key, placement, user_id, username, display_name, value, reward_tier, source_run_id, source_updated_at, captured_at, result_status) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict L48n2Uz7F894tKK1ZwczUFnzCwgSNzg4s67oG6dFRB4d5iFZkE6U2bXfvLMMDhS

