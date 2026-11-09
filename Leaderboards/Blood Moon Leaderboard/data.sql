--
-- PostgreSQL database dump
--

\restrict bbQv2cbSO9n34QnA7U3YXn8C7VaewK0JChf43POMbcIRrsr2I6FGMGCWNwBcVZ1

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
-- Data for Name: Blood Moon Leaderboard; Type: TABLE DATA; Schema: leaderboards; Owner: -
--

COPY leaderboards."Blood Moon Leaderboard" (event_key, placement, user_id, username, display_name, value, reward_tier, source_run_id, source_updated_at, captured_at, result_status) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict bbQv2cbSO9n34QnA7U3YXn8C7VaewK0JChf43POMbcIRrsr2I6FGMGCWNwBcVZ1

