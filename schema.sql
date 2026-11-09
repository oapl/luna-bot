--
-- PostgreSQL database dump
--

\restrict 70cJqEZdcRcxXY9yRdvudqv6ephAqf5kzuVf8qzGNnzgL6CZMg4cNiAkh7AbvLT

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
-- Name: battles; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA battles;


--
-- Name: SCHEMA battles; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA battles IS 'Resolved historical Clan Battle results. Each known battle has its own LIST partitions.';


--
-- Name: catalog; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA catalog;


--
-- Name: SCHEMA catalog; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA catalog IS 'Public event identities, source aliases and table discovery. Ambiguous identities are preserved for review.';


--
-- Name: imports; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA imports;


--
-- Name: SCHEMA imports; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA imports IS 'Original parsed third-party claims and sanitized source references; kept separate from resolved results.';


--
-- Name: leaderboards; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA leaderboards;


--
-- Name: SCHEMA leaderboards; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA leaderboards IS 'Official standalone gameplay leaderboards, separate from clan battles and leagues. Player results contain complete official final standings only.';


--
-- Name: leagues; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA leagues;


--
-- Name: SCHEMA leagues; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA leagues IS 'Official League event identities and retained source observations, separate from Clan Battles.';


SET default_tablespace = '';

--
-- Name: player_results; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles.player_results (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
)
PARTITION BY LIST (event_key);


--
-- Name: TABLE player_results; Type: COMMENT; Schema: battles; Owner: -
--

COMMENT ON TABLE battles.player_results IS 'One resolved historical player result per catalog battle. Existing archive results have priority; approved imports fill missing participation; final-window member recoveries are labeled separately and have NULL global rank. No new gameplay pull or rank recalculation.';


--
-- Name: COLUMN player_results.member_rank; Type: COMMENT; Schema: battles; Owner: -
--

COMMENT ON COLUMN battles.player_results.member_rank IS 'Player rank within the clan, when recorded. This is not a global rank.';


--
-- Name: COLUMN player_results.global_rank; Type: COMMENT; Schema: battles; Owner: -
--

COMMENT ON COLUMN battles.player_results.global_rank IS 'Stored rank within the recorded comparison pool. See event metadata for incomplete coverage.';


--
-- Name: COLUMN player_results.ranked_players; Type: COMMENT; Schema: battles; Owner: -
--

COMMENT ON COLUMN battles.player_results.ranked_players IS 'Size of the stored global comparison pool, when available.';


--
-- Name: COLUMN player_results.source_kind; Type: COMMENT; Schema: battles; Owner: -
--

COMMENT ON COLUMN battles.player_results.source_kind IS 'Existing Luna resolution provenance, including native global_candidate/member_snapshot or supplementary bot imports.';


--
-- Name: COLUMN player_results.observed_at; Type: COMMENT; Schema: battles; Owner: -
--

COMMENT ON COLUMN battles.player_results.observed_at IS 'Stored source observation time. Imported sources can use a message/import time rather than the battle endpoint.';


--
-- Name: COLUMN player_results.result_status; Type: COMMENT; Schema: battles; Owner: -
--

COMMENT ON COLUMN battles.player_results.result_status IS 'stored_final: existing compact archive selection, not a guarantee of exact endpoint completeness; imported_history: approved source-reported historical result; last_saved_pre_end: retained final-window member capture with no confirmed final global rank.';


--
-- Name: COLUMN player_results.source_record_id; Type: COMMENT; Schema: battles; Owner: -
--

COMMENT ON COLUMN battles.player_results.source_record_id IS 'Original source row ID where added by history completion: imports.cw_bot.source_record_id for cw_bot, or production c0ld_clan_snapshots.id for member_snapshot. NULL on pre-existing resolved results; source_run_key retains their original provenance.';


SET default_table_access_method = heap;

--
-- Name: Angel 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Angel 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Arcade 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Arcade 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Athena Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Athena Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Backrooms 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Backrooms 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Balloon Corgi Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Balloon Corgi Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Basketball Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Basketball Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Bee Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Bee Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Block Party Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Block Party Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Christmas Present Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Christmas Present Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Evil Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Evil Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Fantasy 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Fantasy 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Gingerbread Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Gingerbread Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Gingerbread Battle 2025; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Gingerbread Battle 2025" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Gummy 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Gummy 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Hatch War 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Hatch War 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Lucky Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Lucky Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Lucky Chest Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Lucky Chest Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Lunar 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Lunar 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: New Years Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."New Years Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Ninja 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Ninja 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Pet Games Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Pet Games Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Pixel Chick Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Pixel Chick Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Poison Turtle Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Poison Turtle Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Royal 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Royal 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Soccer 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Soccer 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Space Mine 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Space Mine 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Spring 2026; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Spring 2026" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Starry; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Starry" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Strength Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Strength Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Thanksgiving 2025 Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Thanksgiving 2025 Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Tie Dye Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Tie Dye Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Tower Defense Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Tower Defense Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: Trick or Treat Battle; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles."Trick or Treat Battle" (
    event_key text NOT NULL,
    battle_name text,
    original_battle_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    clan_name text,
    member_rank integer,
    points bigint,
    global_rank integer,
    ranked_players integer,
    source_kind text NOT NULL,
    source_run_key text,
    observed_at timestamp with time zone,
    result_status text NOT NULL,
    source_record_id bigint,
    CONSTRAINT player_results_status_check CHECK ((result_status = ANY (ARRAY['stored_final'::text, 'imported_history'::text, 'last_saved_pre_end'::text])))
);


--
-- Name: clan_results; Type: TABLE; Schema: battles; Owner: -
--

CREATE TABLE battles.clan_results (
    event_key text NOT NULL,
    original_battle_key text NOT NULL,
    source_view text NOT NULL,
    clan_name text NOT NULL,
    rank integer,
    points bigint,
    source_candidate_rows integer,
    source_run_key text,
    observed_at timestamp with time zone,
    CONSTRAINT clan_results_source_view_check CHECK ((source_view = ANY (ARRAY['leaderboard'::text, 'contributions'::text])))
);


--
-- Name: TABLE clan_results; Type: COMMENT; Schema: battles; Owner: -
--

COMMENT ON TABLE battles.clan_results IS 'Shared clan leaderboard observations across all battles. source_view distinguishes direct leaderboard observations from contribution-derived totals.';


--
-- Name: native_player_results; Type: VIEW; Schema: battles; Owner: -
--

CREATE VIEW battles.native_player_results AS
 SELECT event_key,
    battle_name,
    original_battle_key,
    user_id,
    username,
    clan_name,
    member_rank,
    points,
    global_rank,
    ranked_players,
    source_kind,
    source_run_key,
    observed_at,
    result_status,
    source_record_id
   FROM battles.player_results
  WHERE (source_kind = ANY (ARRAY['global_candidate'::text, 'member_snapshot'::text]));


--
-- Name: VIEW native_player_results; Type: COMMENT; Schema: battles; Owner: -
--

COMMENT ON VIEW battles.native_player_results IS 'Native Luna observations selected from the resolved ledger, including final-window member recoveries explicitly labeled last_saved_pre_end; no imported bot claims or duplicate player rows.';


--
-- Name: battle_aliases; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.battle_aliases (
    event_key text NOT NULL,
    alias text NOT NULL,
    alias_kind text DEFAULT 'stored'::text NOT NULL
);


--
-- Name: TABLE battle_aliases; Type: COMMENT; Schema: catalog; Owner: -
--

COMMENT ON TABLE catalog.battle_aliases IS 'Exact preserved aliases. One alias can refer to several unresolved event identities; consumers must not assume global uniqueness.';


--
-- Name: battle_events; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.battle_events (
    event_key text NOT NULL,
    title text NOT NULL,
    started_at timestamp with time zone,
    ended_at timestamp with time zone,
    result_table text,
    clan_table text,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    CONSTRAINT battle_events_dates CHECK (((ended_at IS NULL) OR (started_at IS NULL) OR (ended_at >= started_at))),
    CONSTRAINT battle_events_metadata_object CHECK ((jsonb_typeof(metadata) = 'object'::text))
);


--
-- Name: TABLE battle_events; Type: COMMENT; Schema: catalog; Owner: -
--

COMMENT ON TABLE catalog.battle_events IS 'Stable battle identity and reviewed public metadata. Null dates mean unknown; import receipt times are not battle dates.';


--
-- Name: COLUMN battle_events.event_key; Type: COMMENT; Schema: catalog; Owner: -
--

COMMENT ON COLUMN catalog.battle_events.event_key IS 'Canonical catalog identity. Original input keys remain on result and import records.';


--
-- Name: COLUMN battle_events.result_table; Type: COMMENT; Schema: catalog; Owner: -
--

COMMENT ON COLUMN catalog.battle_events.result_table IS 'Schema-qualified per-battle player partition name, provided for discovery.';


--
-- Name: COLUMN battle_events.metadata; Type: COMMENT; Schema: catalog; Owner: -
--

COMMENT ON COLUMN catalog.battle_events.metadata IS 'Sanitized gameplay provenance, aliases, coverage and unresolved naming issues. Contains no private Discord or account data.';


--
-- Name: unresolved_event_names; Type: TABLE; Schema: catalog; Owner: -
--

CREATE TABLE catalog.unresolved_event_names (
    original_key text NOT NULL,
    title text NOT NULL,
    reasons text[] NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL
);


--
-- Name: TABLE unresolved_event_names; Type: COMMENT; Schema: catalog; Owner: -
--

COMMENT ON TABLE catalog.unresolved_event_names IS 'Saved event labels without a verified official BIG Games identity. Official DB and developer update-post evidence is retained in the catalogs. Unknown labels are excluded from canonical event tables and folders.';


--
-- Name: battle_bot; Type: TABLE; Schema: imports; Owner: -
--

CREATE TABLE imports.battle_bot (
    record_id bigint NOT NULL,
    record_kind text NOT NULL,
    source_record_id bigint NOT NULL,
    original_reference_id bigint,
    source text NOT NULL,
    source_name text NOT NULL,
    user_id bigint,
    username text,
    username_hint text,
    event_key text,
    original_battle_key text,
    original_battle_name text,
    clan_name text,
    source_rank integer,
    source_total_ranked integer,
    clan_rank integer,
    total_clan_members integer,
    global_rank integer,
    total_global_players integer,
    final_points bigint,
    final_snapshot_at timestamp with time zone,
    status text NOT NULL,
    imported_from text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    detected_battle_count integer,
    source_created_at timestamp with time zone,
    observed_at timestamp with time zone,
    imported_at timestamp with time zone,
    CONSTRAINT battle_bot_source_check CHECK ((source = 'battle_bot'::text)),
    CONSTRAINT cw_bot_record_kind_check CHECK ((record_kind = ANY (ARRAY['result'::text, 'source_reference'::text])))
);


--
-- Name: TABLE battle_bot; Type: COMMENT; Schema: imports; Owner: -
--

COMMENT ON TABLE imports.battle_bot IS 'All sanitized Battle Bot source claims and references in one physical table. Stored unparsed references do not establish performance results.';


--
-- Name: COLUMN battle_bot.original_reference_id; Type: COMMENT; Schema: imports; Owner: -
--

COMMENT ON COLUMN imports.battle_bot.original_reference_id IS 'Original sanitized source-reference row ID, preserved separately from the new source-table identity.';


--
-- Name: big_bot; Type: TABLE; Schema: imports; Owner: -
--

CREATE TABLE imports.big_bot (
    record_id bigint NOT NULL,
    record_kind text NOT NULL,
    source_record_id bigint NOT NULL,
    original_reference_id bigint,
    source text NOT NULL,
    source_name text NOT NULL,
    user_id bigint,
    username text,
    username_hint text,
    event_key text,
    original_battle_key text,
    original_battle_name text,
    clan_name text,
    source_rank integer,
    source_total_ranked integer,
    clan_rank integer,
    total_clan_members integer,
    global_rank integer,
    total_global_players integer,
    final_points bigint,
    final_snapshot_at timestamp with time zone,
    status text NOT NULL,
    imported_from text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    detected_battle_count integer,
    source_created_at timestamp with time zone,
    observed_at timestamp with time zone,
    imported_at timestamp with time zone,
    CONSTRAINT big_bot_source_check CHECK ((source = 'big_bot'::text)),
    CONSTRAINT cw_bot_record_kind_check CHECK ((record_kind = ANY (ARRAY['result'::text, 'source_reference'::text])))
);


--
-- Name: TABLE big_bot; Type: COMMENT; Schema: imports; Owner: -
--

COMMENT ON TABLE imports.big_bot IS 'All sanitized Big Bot source claims and references in one physical table. Conflicting source results remain unchanged.';


--
-- Name: COLUMN big_bot.original_reference_id; Type: COMMENT; Schema: imports; Owner: -
--

COMMENT ON COLUMN imports.big_bot.original_reference_id IS 'Original sanitized source-reference row ID, preserved separately from the new source-table identity.';


--
-- Name: cw_bot; Type: TABLE; Schema: imports; Owner: -
--

CREATE TABLE imports.cw_bot (
    record_id bigint NOT NULL,
    record_kind text NOT NULL,
    source_record_id bigint NOT NULL,
    original_reference_id bigint,
    source text NOT NULL,
    source_name text NOT NULL,
    user_id bigint,
    username text,
    username_hint text,
    event_key text,
    original_battle_key text,
    original_battle_name text,
    clan_name text,
    source_rank integer,
    source_total_ranked integer,
    clan_rank integer,
    total_clan_members integer,
    global_rank integer,
    total_global_players integer,
    final_points bigint,
    final_snapshot_at timestamp with time zone,
    status text NOT NULL,
    imported_from text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    detected_battle_count integer,
    source_created_at timestamp with time zone,
    observed_at timestamp with time zone,
    imported_at timestamp with time zone,
    CONSTRAINT cw_bot_record_kind_check CHECK ((record_kind = ANY (ARRAY['result'::text, 'source_reference'::text]))),
    CONSTRAINT cw_bot_source_check CHECK ((source = 'cw_bot'::text))
);


--
-- Name: TABLE cw_bot; Type: COMMENT; Schema: imports; Owner: -
--

COMMENT ON TABLE imports.cw_bot IS 'All sanitized CW-Bot source claims and references in one physical table. record_kind distinguishes parsed results from source metadata.';


--
-- Name: COLUMN cw_bot.original_reference_id; Type: COMMENT; Schema: imports; Owner: -
--

COMMENT ON COLUMN imports.cw_bot.original_reference_id IS 'Original sanitized source-reference row ID, preserved separately from the new source-table identity.';


--
-- Name: all_records; Type: VIEW; Schema: imports; Owner: -
--

CREATE VIEW imports.all_records AS
 SELECT cw_bot.record_id,
    cw_bot.record_kind,
    cw_bot.source_record_id,
    cw_bot.original_reference_id,
    cw_bot.source,
    cw_bot.source_name,
    cw_bot.user_id,
    cw_bot.username,
    cw_bot.username_hint,
    cw_bot.event_key,
    cw_bot.original_battle_key,
    cw_bot.original_battle_name,
    cw_bot.clan_name,
    cw_bot.source_rank,
    cw_bot.source_total_ranked,
    cw_bot.clan_rank,
    cw_bot.total_clan_members,
    cw_bot.global_rank,
    cw_bot.total_global_players,
    cw_bot.final_points,
    cw_bot.final_snapshot_at,
    cw_bot.status,
    cw_bot.imported_from,
    cw_bot.created_at,
    cw_bot.updated_at,
    cw_bot.detected_battle_count,
    cw_bot.source_created_at,
    cw_bot.observed_at,
    cw_bot.imported_at
   FROM imports.cw_bot
UNION ALL
 SELECT big_bot.record_id,
    big_bot.record_kind,
    big_bot.source_record_id,
    big_bot.original_reference_id,
    big_bot.source,
    big_bot.source_name,
    big_bot.user_id,
    big_bot.username,
    big_bot.username_hint,
    big_bot.event_key,
    big_bot.original_battle_key,
    big_bot.original_battle_name,
    big_bot.clan_name,
    big_bot.source_rank,
    big_bot.source_total_ranked,
    big_bot.clan_rank,
    big_bot.total_clan_members,
    big_bot.global_rank,
    big_bot.total_global_players,
    big_bot.final_points,
    big_bot.final_snapshot_at,
    big_bot.status,
    big_bot.imported_from,
    big_bot.created_at,
    big_bot.updated_at,
    big_bot.detected_battle_count,
    big_bot.source_created_at,
    big_bot.observed_at,
    big_bot.imported_at
   FROM imports.big_bot
UNION ALL
 SELECT battle_bot.record_id,
    battle_bot.record_kind,
    battle_bot.source_record_id,
    battle_bot.original_reference_id,
    battle_bot.source,
    battle_bot.source_name,
    battle_bot.user_id,
    battle_bot.username,
    battle_bot.username_hint,
    battle_bot.event_key,
    battle_bot.original_battle_key,
    battle_bot.original_battle_name,
    battle_bot.clan_name,
    battle_bot.source_rank,
    battle_bot.source_total_ranked,
    battle_bot.clan_rank,
    battle_bot.total_clan_members,
    battle_bot.global_rank,
    battle_bot.total_global_players,
    battle_bot.final_points,
    battle_bot.final_snapshot_at,
    battle_bot.status,
    battle_bot.imported_from,
    battle_bot.created_at,
    battle_bot.updated_at,
    battle_bot.detected_battle_count,
    battle_bot.source_created_at,
    battle_bot.observed_at,
    battle_bot.imported_at
   FROM imports.battle_bot;


--
-- Name: VIEW all_records; Type: COMMENT; Schema: imports; Owner: -
--

COMMENT ON VIEW imports.all_records IS 'Union of the three source-bot tables. Use (source,record_id) as the union row identity; filter record_kind for parsed results.';


--
-- Name: battle_bot_record_id_seq; Type: SEQUENCE; Schema: imports; Owner: -
--

ALTER TABLE imports.battle_bot ALTER COLUMN record_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME imports.battle_bot_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: big_bot_record_id_seq; Type: SEQUENCE; Schema: imports; Owner: -
--

ALTER TABLE imports.big_bot ALTER COLUMN record_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME imports.big_bot_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cw_bot_record_id_seq; Type: SEQUENCE; Schema: imports; Owner: -
--

ALTER TABLE imports.cw_bot ALTER COLUMN record_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME imports.cw_bot_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: results; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards.results (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
)
PARTITION BY LIST (event_key);


--
-- Name: TABLE results; Type: COMMENT; Schema: leaderboards; Owner: -
--

COMMENT ON TABLE leaderboards.results IS 'Complete official final standings only. The recorded placement is the standalone leaderboard position; no clan/global rank is calculated or substituted.';


--
-- Name: COLUMN results.user_id; Type: COMMENT; Schema: leaderboards; Owner: -
--

COMMENT ON COLUMN leaderboards.results.user_id IS 'Roblox user ID where supplied/resolved by the official capture. NULL preserves an unknown identity at its original placement; it is never replaced with a fabricated ID.';


--
-- Name: COLUMN results.value; Type: COMMENT; Schema: leaderboards; Owner: -
--

COMMENT ON COLUMN leaderboards.results.value IS 'Exact numeric leaderboard value as supplied by BIG Games, without floating-point conversion or shortening.';


--
-- Name: COLUMN results.reward_tier; Type: COMMENT; Schema: leaderboards; Owner: -
--

COMMENT ON COLUMN leaderboards.results.reward_tier IS 'Original official final RewardTier, when supplied. NULL means unknown or absent.';


--
-- Name: COLUMN results.source_run_id; Type: COMMENT; Schema: leaderboards; Owner: -
--

COMMENT ON COLUMN leaderboards.results.source_run_id IS 'Identifier of the complete official-final capture retained by Luna; operational lease owners and credentials are excluded.';


--
-- Name: Arcade Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Arcade Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Blood Moon Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Blood Moon Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Boss Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Boss Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Breakout Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Breakout Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Fiesta Forever!; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Fiesta Forever!" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Fiesta Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Fiesta Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Halloween Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Halloween Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Hatch Battle Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Hatch Battle Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Kick Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Kick Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: PSX Classic Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."PSX Classic Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Piñata Maze!; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Piñata Maze!" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Space Forge!; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Space Forge!" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Speedrun Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Speedrun Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Tap Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Tap Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Time Trial Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Time Trial Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Top Hatches; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Top Hatches" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Transcends Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Transcends Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: Yeti Leaderboard; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards."Yeti Leaderboard" (
    event_key text NOT NULL,
    placement bigint NOT NULL,
    user_id bigint,
    username text,
    display_name text,
    value numeric NOT NULL,
    reward_tier integer,
    source_run_id uuid NOT NULL,
    source_updated_at timestamp with time zone NOT NULL,
    captured_at timestamp with time zone NOT NULL,
    result_status text NOT NULL,
    CONSTRAINT results_placement_check CHECK ((placement > 0)),
    CONSTRAINT results_result_status_check CHECK ((result_status = 'official_final'::text)),
    CONSTRAINT results_user_id_check CHECK ((user_id > 0)),
    CONSTRAINT results_value_check CHECK ((value >= (0)::numeric))
);


--
-- Name: events; Type: TABLE; Schema: leaderboards; Owner: -
--

CREATE TABLE leaderboards.events (
    event_key text NOT NULL,
    board_id text NOT NULL,
    title text NOT NULL,
    scoring_ends_at timestamp with time zone,
    state text NOT NULL,
    list_size integer,
    codec text,
    source_url text NOT NULL,
    result_table text NOT NULL,
    source_run_id uuid,
    source_updated_at timestamp with time zone,
    captured_at timestamp with time zone,
    final_row_count integer,
    result_status text NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    CONSTRAINT events_check CHECK (((result_status = 'complete_official_final'::text) = (source_run_id IS NOT NULL))),
    CONSTRAINT events_check1 CHECK (((result_status <> 'complete_official_final'::text) OR ((source_updated_at IS NOT NULL) AND (captured_at IS NOT NULL) AND (final_row_count IS NOT NULL)))),
    CONSTRAINT events_final_row_count_check CHECK ((final_row_count >= 0)),
    CONSTRAINT events_list_size_check CHECK ((list_size > 0)),
    CONSTRAINT events_metadata_check CHECK ((jsonb_typeof(metadata) = 'object'::text)),
    CONSTRAINT events_result_status_check CHECK ((result_status = ANY (ARRAY['awaiting_official_final'::text, 'awaiting_final_capture'::text, 'complete_official_final'::text]))),
    CONSTRAINT events_state_check CHECK ((state = ANY (ARRAY['live'::text, 'ended'::text, 'final'::text, 'inactive'::text])))
);


--
-- Name: TABLE events; Type: COMMENT; Schema: leaderboards; Owner: -
--

COMMENT ON TABLE leaderboards.events IS 'One identity per official board and contest boundary. Live or not-yet-complete events are cataloged with an empty results partition. Multiple contests may share one official-title partition without merging event identities.';


--
-- Name: player_results; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues.player_results (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
)
PARTITION BY LIST (event_key);


--
-- Name: TABLE player_results; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON TABLE leagues.player_results IS 'One last-saved historical participation per real Roblox player/event. Unknown manual points/member ranks are NULL. No intermediate snapshots or synthetic team IDs are represented as players.';


--
-- Name: COLUMN player_results.league_rank; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON COLUMN leagues.player_results.league_rank IS 'Team placement, distinct from the player global/pool rank and internal member rank.';


--
-- Name: COLUMN player_results.global_rank; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON COLUMN leagues.player_results.global_rank IS 'Only direct BIG Games global-player leaderboard rank; unknown for collector-derived placements.';


--
-- Name: COLUMN player_results.pool_rank; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON COLUMN leagues.player_results.pool_rank IS 'Collector-maintained player-pool rank, including authoritative direct-player prefix. Not a complete official global ranking.';


--
-- Name: COLUMN player_results.collected_population; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON COLUMN leagues.player_results.collected_population IS 'Stored size of the collected player pool, not proof of a complete game population.';


--
-- Name: COLUMN player_results.period_ended_at; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON COLUMN leagues.player_results.period_ended_at IS 'Original frozen source capture window end, preserved even when it differs from the official metadata date.';


--
-- Name: COLUMN player_results.result_status; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON COLUMN leagues.player_results.result_status IS 'last_saved means observed history, not a guarantee of exact finality. manual_membership means confirmed roster membership with unknown points/ranks remaining NULL.';


--
-- Name: 2026 Arcade League; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."2026 Arcade League" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: 2026 Space Mine League; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."2026 Space Mine League" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: Basketball Leagues; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."Basketball Leagues" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: Blood Moon League; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."Blood Moon League" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: Deep Backrooms League; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."Deep Backrooms League" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: Fiesta League; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."Fiesta League" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: Garden League; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."Garden League" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: Lucky Breakout League; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."Lucky Breakout League" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: RNG League; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."RNG League" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: Soccer League; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."Soccer League" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: Tap Heroes League 2026; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."Tap Heroes League 2026" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: Time Trials League; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues."Time Trials League" (
    event_key text NOT NULL,
    user_id bigint NOT NULL,
    username text,
    team_key text,
    league_id text,
    league_name text,
    points bigint,
    member_rank integer,
    league_rank integer,
    global_rank integer,
    pool_rank integer,
    rank_scope text NOT NULL,
    collected_population integer,
    league_points bigint,
    captured_at timestamp with time zone NOT NULL,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    member_rank_captured_at timestamp with time zone,
    league_rank_captured_at timestamp with time zone,
    global_rank_captured_at timestamp with time zone,
    pool_rank_captured_at timestamp with time zone,
    last_contribution_at timestamp with time zone,
    CONSTRAINT player_results_collected_population_check CHECK ((collected_population > 0)),
    CONSTRAINT player_results_global_rank_check CHECK ((global_rank > 0)),
    CONSTRAINT player_results_league_points_check CHECK ((league_points >= 0)),
    CONSTRAINT player_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT player_results_member_rank_check CHECK ((member_rank > 0)),
    CONSTRAINT player_results_points_check CHECK ((points >= 0)),
    CONSTRAINT player_results_pool_rank_check CHECK ((pool_rank > 0)),
    CONSTRAINT player_results_rank_scope_check CHECK ((rank_scope = ANY (ARRAY['official_global'::text, 'collected_pool'::text, 'member_only'::text, 'membership_only'::text]))),
    CONSTRAINT player_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text]))),
    CONSTRAINT player_results_user_id_check CHECK ((user_id > 0))
);


--
-- Name: coverage; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues.coverage (
    event_key text NOT NULL,
    original_event_key text NOT NULL,
    league_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    source_snapshot_count integer,
    source_league_count integer,
    source_row_count bigint,
    archived_row_count bigint,
    verified boolean,
    archived_at timestamp with time zone,
    verified_at timestamp with time zone
);


--
-- Name: TABLE coverage; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON TABLE leagues.coverage IS 'Original archive-preservation checks. verified proves stored-row preservation only, not complete player coverage, official finality or end-time freshness.';


--
-- Name: COLUMN coverage.verified; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON COLUMN leagues.coverage.verified IS 'Whether the original archive verified preservation of its selected stored rows.';


--
-- Name: events; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues.events (
    event_key text NOT NULL,
    original_event_key text NOT NULL,
    title text NOT NULL,
    update_number integer,
    started_at timestamp with time zone,
    ended_at timestamp with time zone,
    source_url text,
    source_run_keys text[] DEFAULT ARRAY[]::text[] NOT NULL,
    updated_at timestamp with time zone,
    result_table text,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    team_table text DEFAULT 'leagues.team_results'::text NOT NULL,
    CONSTRAINT league_events_dates CHECK (((ended_at IS NULL) OR (started_at IS NULL) OR (ended_at >= started_at))),
    CONSTRAINT league_events_metadata_object CHECK ((jsonb_typeof(metadata) = 'object'::text))
);


--
-- Name: TABLE events; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON TABLE leagues.events IS 'Official League event identity. Collector run keys have been reused and must not identify the event.';


--
-- Name: COLUMN events.source_run_keys; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON COLUMN leagues.events.source_run_keys IS 'Original collector keys linked to this official event; a key can occur in multiple events.';


--
-- Name: team_results; Type: TABLE; Schema: leagues; Owner: -
--

CREATE TABLE leagues.team_results (
    event_key text NOT NULL,
    team_key text NOT NULL,
    league_id text,
    league_name text NOT NULL,
    points bigint,
    league_rank integer,
    captured_at timestamp with time zone NOT NULL,
    rank_captured_at timestamp with time zone,
    source text,
    source_table text NOT NULL,
    source_record_id bigint NOT NULL,
    snapshot_id text,
    source_run_key text,
    period_started_at timestamp with time zone,
    period_ended_at timestamp with time zone,
    result_status text NOT NULL,
    CONSTRAINT team_results_league_rank_check CHECK ((league_rank > 0)),
    CONSTRAINT team_results_points_check CHECK ((points >= 0)),
    CONSTRAINT team_results_result_status_check CHECK ((result_status = ANY (ARRAY['last_saved'::text, 'manual_membership'::text])))
);


--
-- Name: TABLE team_results; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON TABLE leagues.team_results IS 'Separate final/last-saved team rankings. team_key is an export join key; genuine game league_id is NULL when unknown. Synthetic source player IDs are excluded.';


--
-- Name: COLUMN team_results.team_key; Type: COMMENT; Schema: leagues; Owner: -
--

COMMENT ON COLUMN leagues.team_results.team_key IS 'id:<genuine game ID>, or name:<normalized team name> when no unique genuine ID is known within the event.';


--
-- Name: Angel 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Angel 2026" FOR VALUES IN ('AngelBattle2026');


--
-- Name: Arcade 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Arcade 2026" FOR VALUES IN ('ArcadeBattle2026');


--
-- Name: Athena Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Athena Battle" FOR VALUES IN ('AthenaBattle');


--
-- Name: Backrooms 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Backrooms 2026" FOR VALUES IN ('Backrooms2026');


--
-- Name: Balloon Corgi Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Balloon Corgi Battle" FOR VALUES IN ('BalloonCorgiBattle');


--
-- Name: Basketball Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Basketball Battle" FOR VALUES IN ('BasketballBattle');


--
-- Name: Bee Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Bee Battle" FOR VALUES IN ('SantaBattle');


--
-- Name: Block Party Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Block Party Battle" FOR VALUES IN ('BlockPartyBattle');


--
-- Name: Christmas Present Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Christmas Present Battle" FOR VALUES IN ('YearEnd2024');


--
-- Name: Evil Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Evil Battle" FOR VALUES IN ('CardBattle');


--
-- Name: Fantasy 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Fantasy 2026" FOR VALUES IN ('FantasyBattle2026');


--
-- Name: Gingerbread Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Gingerbread Battle" FOR VALUES IN ('Christmas2024');


--
-- Name: Gingerbread Battle 2025; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Gingerbread Battle 2025" FOR VALUES IN ('Christmas2025');


--
-- Name: Gummy 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Gummy 2026" FOR VALUES IN ('GummyBattle2026');


--
-- Name: Hatch War 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Hatch War 2026" FOR VALUES IN ('HatchWarBattle2026');


--
-- Name: Lucky Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Lucky Battle" FOR VALUES IN ('LuckyBattle');


--
-- Name: Lucky Chest Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Lucky Chest Battle" FOR VALUES IN ('LuckyChestBattle');


--
-- Name: Lunar 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Lunar 2026" FOR VALUES IN ('LunarBattle2026');


--
-- Name: New Years Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."New Years Battle" FOR VALUES IN ('NewYear2024');


--
-- Name: Ninja 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Ninja 2026" FOR VALUES IN ('NinjaBattle2026');


--
-- Name: Pet Games Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Pet Games Battle" FOR VALUES IN ('SquidBattle');


--
-- Name: Pixel Chick Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Pixel Chick Battle" FOR VALUES IN ('PixelChickBattle');


--
-- Name: Poison Turtle Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Poison Turtle Battle" FOR VALUES IN ('PoisonTurtleBattle');


--
-- Name: Royal 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Royal 2026" FOR VALUES IN ('RoyalBattle2026');


--
-- Name: Soccer 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Soccer 2026" FOR VALUES IN ('SoccerBattle2026');


--
-- Name: Space Mine 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Space Mine 2026" FOR VALUES IN ('SpaceMineBattle2026');


--
-- Name: Spring 2026; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Spring 2026" FOR VALUES IN ('Spring2026');


--
-- Name: Starry; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Starry" FOR VALUES IN ('StarryBattle');


--
-- Name: Strength Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Strength Battle" FOR VALUES IN ('StrengthBattle');


--
-- Name: Thanksgiving 2025 Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Thanksgiving 2025 Battle" FOR VALUES IN ('Turkey2025');


--
-- Name: Tie Dye Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Tie Dye Battle" FOR VALUES IN ('TieDyeBattle');


--
-- Name: Tower Defense Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Tower Defense Battle" FOR VALUES IN ('TowerBattle');


--
-- Name: Trick or Treat Battle; Type: TABLE ATTACH; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results ATTACH PARTITION battles."Trick or Treat Battle" FOR VALUES IN ('TrickOrTreat');


--
-- Name: Arcade Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Arcade Leaderboard" FOR VALUES IN ('CoinArcadeHatchPoints:1789142400', 'CoinArcadeHatchPoints2:1789747200');


--
-- Name: Blood Moon Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Blood Moon Leaderboard" FOR VALUES IN ('HatchWarBloodMoon:1792166400');


--
-- Name: Boss Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Boss Leaderboard" FOR VALUES IN ('GardenBossKills2026:1785513600', 'GardenPoints2026:1786118400');


--
-- Name: Breakout Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Breakout Leaderboard" FOR VALUES IN ('LuckyBreakoutLevels:1788019200');


--
-- Name: Fiesta Forever!; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Fiesta Forever!" FOR VALUES IN ('FiestaMazeDiff2:1787407200', 'FiestaMazeRace2:1787407200');


--
-- Name: Fiesta Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Fiesta Leaderboard" FOR VALUES IN ('EternalMazeDepth:1787407200', 'FiestaMazeMaxDifficulty:1786806000');


--
-- Name: Halloween Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Halloween Leaderboard" FOR VALUES IN ('HalloweenGamesTreatsWon:1793984400');


--
-- Name: Hatch Battle Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Hatch Battle Leaderboard" FOR VALUES IN ('HatchWarBossWins:1791561600');


--
-- Name: Kick Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Kick Leaderboard" FOR VALUES IN ('SoccerFurthestKick:1783180800', 'SoccerFurthestKick2:1783785600');


--
-- Name: PSX Classic Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."PSX Classic Leaderboard" FOR VALUES IN ('PSXRebornEggs:1793376000');


--
-- Name: Piñata Maze!; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Piñata Maze!" FOR VALUES IN ('FiestaMazeRace:1786806000');


--
-- Name: Space Forge!; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Space Forge!" FOR VALUES IN ('SpaceMineLBPart2:1790956800');


--
-- Name: Speedrun Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Speedrun Leaderboard" FOR VALUES IN ('PSXRebornSpeedrun:1793376000');


--
-- Name: Tap Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Tap Leaderboard" FOR VALUES IN ('TapHeroesLevels2026:1784390400');


--
-- Name: Time Trial Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Time Trial Leaderboard" FOR VALUES IN ('LuckyBreakoutTrial:1788537600');


--
-- Name: Top Hatches; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Top Hatches" FOR VALUES IN ('DeepBackroom2026:1782572400');


--
-- Name: Transcends Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Transcends Leaderboard" FOR VALUES IN ('TapHeroesTranscends2026:1784908800');


--
-- Name: Yeti Leaderboard; Type: TABLE ATTACH; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results ATTACH PARTITION leaderboards."Yeti Leaderboard" FOR VALUES IN ('DiamondMountainYetiPoints:1792771200');


--
-- Name: 2026 Arcade League; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."2026 Arcade League" FOR VALUES IN ('arcade-league-2026');


--
-- Name: 2026 Space Mine League; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."2026 Space Mine League" FOR VALUES IN ('mining-league-2026');


--
-- Name: Basketball Leagues; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."Basketball Leagues" FOR VALUES IN ('basketball-2025');


--
-- Name: Blood Moon League; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."Blood Moon League" FOR VALUES IN ('blood-moon-league-2026');


--
-- Name: Deep Backrooms League; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."Deep Backrooms League" FOR VALUES IN ('deep-backrooms-2026');


--
-- Name: Fiesta League; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."Fiesta League" FOR VALUES IN ('fiesta-part-2-2026');


--
-- Name: Garden League; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."Garden League" FOR VALUES IN ('garden-2026');


--
-- Name: Lucky Breakout League; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."Lucky Breakout League" FOR VALUES IN ('lucky-block-blitz-2026');


--
-- Name: RNG League; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."RNG League" FOR VALUES IN ('rng-2026');


--
-- Name: Soccer League; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."Soccer League" FOR VALUES IN ('soccer-2026');


--
-- Name: Tap Heroes League 2026; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."Tap Heroes League 2026" FOR VALUES IN ('tap-2026');


--
-- Name: Time Trials League; Type: TABLE ATTACH; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results ATTACH PARTITION leagues."Time Trials League" FOR VALUES IN ('time-trials-2026');


--
-- Name: clan_results clan_results_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.clan_results
    ADD CONSTRAINT clan_results_pkey PRIMARY KEY (event_key, source_view, clan_name);


--
-- Name: player_results player_results_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.player_results
    ADD CONSTRAINT player_results_pkey PRIMARY KEY (event_key, user_id);


--
-- Name: Angel 2026 players_angelbattle2026-ade2dab9_ade2dab9_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Angel 2026"
    ADD CONSTRAINT "players_angelbattle2026-ade2dab9_ade2dab9_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Arcade 2026 players_arcadebattle2026-26539d02_26539d02_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Arcade 2026"
    ADD CONSTRAINT "players_arcadebattle2026-26539d02_26539d02_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Athena Battle players_athenabattle-0c0717e0_0c0717e0_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Athena Battle"
    ADD CONSTRAINT "players_athenabattle-0c0717e0_0c0717e0_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Backrooms 2026 players_backrooms2026-72dfc70a_72dfc70a_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Backrooms 2026"
    ADD CONSTRAINT "players_backrooms2026-72dfc70a_72dfc70a_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Balloon Corgi Battle players_ballooncorgibattle-1d2f4a53_1d2f4a53_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Balloon Corgi Battle"
    ADD CONSTRAINT "players_ballooncorgibattle-1d2f4a53_1d2f4a53_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Basketball Battle players_basketballbattle-0adeed96_0adeed96_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Basketball Battle"
    ADD CONSTRAINT "players_basketballbattle-0adeed96_0adeed96_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Block Party Battle players_blockpartybattle-b6465ffc_b6465ffc_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Block Party Battle"
    ADD CONSTRAINT "players_blockpartybattle-b6465ffc_b6465ffc_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Evil Battle players_cardbattle-9a64296e_9a64296e_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Evil Battle"
    ADD CONSTRAINT "players_cardbattle-9a64296e_9a64296e_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Gingerbread Battle players_christmas2024-bf51af0b_bf51af0b_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Gingerbread Battle"
    ADD CONSTRAINT "players_christmas2024-bf51af0b_bf51af0b_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Gingerbread Battle 2025 players_christmas2025-27bb8de7_27bb8de7_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Gingerbread Battle 2025"
    ADD CONSTRAINT "players_christmas2025-27bb8de7_27bb8de7_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Fantasy 2026 players_fantasybattle2026-2ab20c67_2ab20c67_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Fantasy 2026"
    ADD CONSTRAINT "players_fantasybattle2026-2ab20c67_2ab20c67_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Gummy 2026 players_gummybattle2026-ada0f5ca_ada0f5ca_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Gummy 2026"
    ADD CONSTRAINT "players_gummybattle2026-ada0f5ca_ada0f5ca_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Hatch War 2026 players_hatchwarbattle2026-c1c5dbd8_c1c5dbd8_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Hatch War 2026"
    ADD CONSTRAINT "players_hatchwarbattle2026-c1c5dbd8_c1c5dbd8_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Lucky Battle players_luckybattle-1c37c40d_1c37c40d_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Lucky Battle"
    ADD CONSTRAINT "players_luckybattle-1c37c40d_1c37c40d_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Lucky Chest Battle players_luckychestbattle-7369f494_7369f494_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Lucky Chest Battle"
    ADD CONSTRAINT "players_luckychestbattle-7369f494_7369f494_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Lunar 2026 players_lunarbattle2026-f3714776_f3714776_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Lunar 2026"
    ADD CONSTRAINT "players_lunarbattle2026-f3714776_f3714776_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: New Years Battle players_newyear2024-cca85652_cca85652_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."New Years Battle"
    ADD CONSTRAINT "players_newyear2024-cca85652_cca85652_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Ninja 2026 players_ninjabattle2026-82809742_82809742_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Ninja 2026"
    ADD CONSTRAINT "players_ninjabattle2026-82809742_82809742_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Pixel Chick Battle players_pixelchickbattle-6763ef15_6763ef15_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Pixel Chick Battle"
    ADD CONSTRAINT "players_pixelchickbattle-6763ef15_6763ef15_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Poison Turtle Battle players_poisonturtlebattle-27eba2f3_27eba2f3_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Poison Turtle Battle"
    ADD CONSTRAINT "players_poisonturtlebattle-27eba2f3_27eba2f3_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Royal 2026 players_royalbattle2026-ed2519d2_ed2519d2_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Royal 2026"
    ADD CONSTRAINT "players_royalbattle2026-ed2519d2_ed2519d2_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Bee Battle players_santabattle-d3920a34_d3920a34_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Bee Battle"
    ADD CONSTRAINT "players_santabattle-d3920a34_d3920a34_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Soccer 2026 players_soccerbattle2026-5efde53e_5efde53e_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Soccer 2026"
    ADD CONSTRAINT "players_soccerbattle2026-5efde53e_5efde53e_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Space Mine 2026 players_spaceminebattle2026-d5a9ef77_d5a9ef77_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Space Mine 2026"
    ADD CONSTRAINT "players_spaceminebattle2026-d5a9ef77_d5a9ef77_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Spring 2026 players_spring2026-17bb571b_17bb571b_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Spring 2026"
    ADD CONSTRAINT "players_spring2026-17bb571b_17bb571b_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Pet Games Battle players_squidbattle-9b7f76b4_9b7f76b4_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Pet Games Battle"
    ADD CONSTRAINT "players_squidbattle-9b7f76b4_9b7f76b4_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Starry players_starrybattle-55e42778_55e42778_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Starry"
    ADD CONSTRAINT "players_starrybattle-55e42778_55e42778_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Strength Battle players_strengthbattle-273c958b_273c958b_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Strength Battle"
    ADD CONSTRAINT "players_strengthbattle-273c958b_273c958b_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Tie Dye Battle players_tiedyebattle-9ff50546_9ff50546_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Tie Dye Battle"
    ADD CONSTRAINT "players_tiedyebattle-9ff50546_9ff50546_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Tower Defense Battle players_towerbattle-b5746746_b5746746_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Tower Defense Battle"
    ADD CONSTRAINT "players_towerbattle-b5746746_b5746746_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Trick or Treat Battle players_trickortreat-7ccd85e2_7ccd85e2_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Trick or Treat Battle"
    ADD CONSTRAINT "players_trickortreat-7ccd85e2_7ccd85e2_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Thanksgiving 2025 Battle players_turkey2025-38eb8cfa_38eb8cfa_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Thanksgiving 2025 Battle"
    ADD CONSTRAINT "players_turkey2025-38eb8cfa_38eb8cfa_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Christmas Present Battle players_yearend2024-76d12247_76d12247_pkey; Type: CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles."Christmas Present Battle"
    ADD CONSTRAINT "players_yearend2024-76d12247_76d12247_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: battle_aliases battle_aliases_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.battle_aliases
    ADD CONSTRAINT battle_aliases_pkey PRIMARY KEY (event_key, alias, alias_kind);


--
-- Name: battle_events battle_events_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.battle_events
    ADD CONSTRAINT battle_events_pkey PRIMARY KEY (event_key);


--
-- Name: unresolved_event_names unresolved_event_names_pkey; Type: CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.unresolved_event_names
    ADD CONSTRAINT unresolved_event_names_pkey PRIMARY KEY (original_key);


--
-- Name: battle_bot battle_bot_pkey; Type: CONSTRAINT; Schema: imports; Owner: -
--

ALTER TABLE ONLY imports.battle_bot
    ADD CONSTRAINT battle_bot_pkey PRIMARY KEY (record_id);


--
-- Name: big_bot big_bot_pkey; Type: CONSTRAINT; Schema: imports; Owner: -
--

ALTER TABLE ONLY imports.big_bot
    ADD CONSTRAINT big_bot_pkey PRIMARY KEY (record_id);


--
-- Name: cw_bot cw_bot_pkey; Type: CONSTRAINT; Schema: imports; Owner: -
--

ALTER TABLE ONLY imports.cw_bot
    ADD CONSTRAINT cw_bot_pkey PRIMARY KEY (record_id);


--
-- Name: results results_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results
    ADD CONSTRAINT results_event_key_user_id_key UNIQUE (event_key, user_id);


--
-- Name: Arcade Leaderboard Arcade Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Arcade Leaderboard"
    ADD CONSTRAINT "Arcade Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: results results_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (event_key, placement);


--
-- Name: Arcade Leaderboard Arcade Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Arcade Leaderboard"
    ADD CONSTRAINT "Arcade Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Blood Moon Leaderboard Blood Moon Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Blood Moon Leaderboard"
    ADD CONSTRAINT "Blood Moon Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Blood Moon Leaderboard Blood Moon Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Blood Moon Leaderboard"
    ADD CONSTRAINT "Blood Moon Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Boss Leaderboard Boss Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Boss Leaderboard"
    ADD CONSTRAINT "Boss Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Boss Leaderboard Boss Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Boss Leaderboard"
    ADD CONSTRAINT "Boss Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Breakout Leaderboard Breakout Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Breakout Leaderboard"
    ADD CONSTRAINT "Breakout Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Breakout Leaderboard Breakout Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Breakout Leaderboard"
    ADD CONSTRAINT "Breakout Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Fiesta Forever! Fiesta Forever!_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Fiesta Forever!"
    ADD CONSTRAINT "Fiesta Forever!_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Fiesta Forever! Fiesta Forever!_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Fiesta Forever!"
    ADD CONSTRAINT "Fiesta Forever!_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Fiesta Leaderboard Fiesta Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Fiesta Leaderboard"
    ADD CONSTRAINT "Fiesta Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Fiesta Leaderboard Fiesta Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Fiesta Leaderboard"
    ADD CONSTRAINT "Fiesta Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Halloween Leaderboard Halloween Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Halloween Leaderboard"
    ADD CONSTRAINT "Halloween Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Halloween Leaderboard Halloween Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Halloween Leaderboard"
    ADD CONSTRAINT "Halloween Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Hatch Battle Leaderboard Hatch Battle Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Hatch Battle Leaderboard"
    ADD CONSTRAINT "Hatch Battle Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Hatch Battle Leaderboard Hatch Battle Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Hatch Battle Leaderboard"
    ADD CONSTRAINT "Hatch Battle Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Kick Leaderboard Kick Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Kick Leaderboard"
    ADD CONSTRAINT "Kick Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Kick Leaderboard Kick Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Kick Leaderboard"
    ADD CONSTRAINT "Kick Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: PSX Classic Leaderboard PSX Classic Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."PSX Classic Leaderboard"
    ADD CONSTRAINT "PSX Classic Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: PSX Classic Leaderboard PSX Classic Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."PSX Classic Leaderboard"
    ADD CONSTRAINT "PSX Classic Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Piñata Maze! Piñata Maze!_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Piñata Maze!"
    ADD CONSTRAINT "Piñata Maze!_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Piñata Maze! Piñata Maze!_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Piñata Maze!"
    ADD CONSTRAINT "Piñata Maze!_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Space Forge! Space Forge!_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Space Forge!"
    ADD CONSTRAINT "Space Forge!_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Space Forge! Space Forge!_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Space Forge!"
    ADD CONSTRAINT "Space Forge!_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Speedrun Leaderboard Speedrun Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Speedrun Leaderboard"
    ADD CONSTRAINT "Speedrun Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Speedrun Leaderboard Speedrun Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Speedrun Leaderboard"
    ADD CONSTRAINT "Speedrun Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Tap Leaderboard Tap Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Tap Leaderboard"
    ADD CONSTRAINT "Tap Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Tap Leaderboard Tap Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Tap Leaderboard"
    ADD CONSTRAINT "Tap Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Time Trial Leaderboard Time Trial Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Time Trial Leaderboard"
    ADD CONSTRAINT "Time Trial Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Time Trial Leaderboard Time Trial Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Time Trial Leaderboard"
    ADD CONSTRAINT "Time Trial Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Top Hatches Top Hatches_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Top Hatches"
    ADD CONSTRAINT "Top Hatches_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Top Hatches Top Hatches_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Top Hatches"
    ADD CONSTRAINT "Top Hatches_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Transcends Leaderboard Transcends Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Transcends Leaderboard"
    ADD CONSTRAINT "Transcends Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Transcends Leaderboard Transcends Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Transcends Leaderboard"
    ADD CONSTRAINT "Transcends Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: Yeti Leaderboard Yeti Leaderboard_event_key_user_id_key; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Yeti Leaderboard"
    ADD CONSTRAINT "Yeti Leaderboard_event_key_user_id_key" UNIQUE (event_key, user_id);


--
-- Name: Yeti Leaderboard Yeti Leaderboard_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards."Yeti Leaderboard"
    ADD CONSTRAINT "Yeti Leaderboard_pkey" PRIMARY KEY (event_key, placement);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE ONLY leaderboards.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_key);


--
-- Name: player_results player_results_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.player_results
    ADD CONSTRAINT player_results_pkey PRIMARY KEY (event_key, user_id);


--
-- Name: 2026 Arcade League 2026 Arcade League_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."2026 Arcade League"
    ADD CONSTRAINT "2026 Arcade League_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: 2026 Space Mine League 2026 Space Mine League_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."2026 Space Mine League"
    ADD CONSTRAINT "2026 Space Mine League_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Basketball Leagues Basketball Leagues_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."Basketball Leagues"
    ADD CONSTRAINT "Basketball Leagues_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Blood Moon League Blood Moon League_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."Blood Moon League"
    ADD CONSTRAINT "Blood Moon League_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Deep Backrooms League Deep Backrooms League_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."Deep Backrooms League"
    ADD CONSTRAINT "Deep Backrooms League_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Fiesta League Fiesta League_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."Fiesta League"
    ADD CONSTRAINT "Fiesta League_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Garden League Garden League_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."Garden League"
    ADD CONSTRAINT "Garden League_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Lucky Breakout League Lucky Breakout League_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."Lucky Breakout League"
    ADD CONSTRAINT "Lucky Breakout League_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: RNG League RNG League_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."RNG League"
    ADD CONSTRAINT "RNG League_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Soccer League Soccer League_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."Soccer League"
    ADD CONSTRAINT "Soccer League_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Tap Heroes League 2026 Tap Heroes League 2026_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."Tap Heroes League 2026"
    ADD CONSTRAINT "Tap Heroes League 2026_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: Time Trials League Time Trials League_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues."Time Trials League"
    ADD CONSTRAINT "Time Trials League_pkey" PRIMARY KEY (event_key, user_id);


--
-- Name: coverage coverage_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.coverage
    ADD CONSTRAINT coverage_pkey PRIMARY KEY (event_key);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_key);


--
-- Name: team_results team_results_pkey; Type: CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.team_results
    ADD CONSTRAINT team_results_pkey PRIMARY KEY (event_key, team_key);


--
-- Name: clan_results_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX clan_results_name_idx ON battles.clan_results USING btree (clan_name, event_key);


--
-- Name: clan_results_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX clan_results_rank_idx ON battles.clan_results USING btree (event_key, source_view, rank);


--
-- Name: player_results_clan_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX player_results_clan_idx ON ONLY battles.player_results USING btree (event_key, clan_name);


--
-- Name: player_results_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX player_results_global_rank_idx ON ONLY battles.player_results USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: player_results_user_history_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX player_results_user_history_idx ON ONLY battles.player_results USING btree (user_id, observed_at DESC);


--
-- Name: player_results_username_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX player_results_username_idx ON ONLY battles.player_results USING btree (lower(username));


--
-- Name: players_angelbattle2026-ade2dab9_ade2_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_angelbattle2026-ade2dab9_ade2_event_key_global_rank_idx" ON battles."Angel 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_angelbattle2026-ade2dab9_ade2da_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_angelbattle2026-ade2dab9_ade2da_event_key_clan_name_idx" ON battles."Angel 2026" USING btree (event_key, clan_name);


--
-- Name: players_angelbattle2026-ade2dab9_ade2da_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_angelbattle2026-ade2dab9_ade2da_user_id_observed_at_idx" ON battles."Angel 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_angelbattle2026-ade2dab9_ade2dab9_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_angelbattle2026-ade2dab9_ade2dab9_lower_idx" ON battles."Angel 2026" USING btree (lower(username));


--
-- Name: players_arcadebattle2026-26539d02_26539_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_arcadebattle2026-26539d02_26539_event_key_clan_name_idx" ON battles."Arcade 2026" USING btree (event_key, clan_name);


--
-- Name: players_arcadebattle2026-26539d02_26539_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_arcadebattle2026-26539d02_26539_user_id_observed_at_idx" ON battles."Arcade 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_arcadebattle2026-26539d02_26539d02_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_arcadebattle2026-26539d02_26539d02_lower_idx" ON battles."Arcade 2026" USING btree (lower(username));


--
-- Name: players_arcadebattle2026-26539d02_265_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_arcadebattle2026-26539d02_265_event_key_global_rank_idx" ON battles."Arcade 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_athenabattle-0c0717e0_0c0717e0_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_athenabattle-0c0717e0_0c0717e0_event_key_clan_name_idx" ON battles."Athena Battle" USING btree (event_key, clan_name);


--
-- Name: players_athenabattle-0c0717e0_0c0717e0_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_athenabattle-0c0717e0_0c0717e0_lower_idx" ON battles."Athena Battle" USING btree (lower(username));


--
-- Name: players_athenabattle-0c0717e0_0c0717e0_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_athenabattle-0c0717e0_0c0717e0_user_id_observed_at_idx" ON battles."Athena Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_athenabattle-0c0717e0_0c0717e_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_athenabattle-0c0717e0_0c0717e_event_key_global_rank_idx" ON battles."Athena Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_backrooms2026-72dfc70a_72dfc70a_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_backrooms2026-72dfc70a_72dfc70a_event_key_clan_name_idx" ON battles."Backrooms 2026" USING btree (event_key, clan_name);


--
-- Name: players_backrooms2026-72dfc70a_72dfc70a_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_backrooms2026-72dfc70a_72dfc70a_lower_idx" ON battles."Backrooms 2026" USING btree (lower(username));


--
-- Name: players_backrooms2026-72dfc70a_72dfc70a_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_backrooms2026-72dfc70a_72dfc70a_user_id_observed_at_idx" ON battles."Backrooms 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_backrooms2026-72dfc70a_72dfc7_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_backrooms2026-72dfc70a_72dfc7_event_key_global_rank_idx" ON battles."Backrooms 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_ballooncorgibattle-1d2f4a53_1_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_ballooncorgibattle-1d2f4a53_1_event_key_global_rank_idx" ON battles."Balloon Corgi Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_ballooncorgibattle-1d2f4a53_1d2_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_ballooncorgibattle-1d2f4a53_1d2_event_key_clan_name_idx" ON battles."Balloon Corgi Battle" USING btree (event_key, clan_name);


--
-- Name: players_ballooncorgibattle-1d2f4a53_1d2_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_ballooncorgibattle-1d2f4a53_1d2_user_id_observed_at_idx" ON battles."Balloon Corgi Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_ballooncorgibattle-1d2f4a53_1d2f4a53_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_ballooncorgibattle-1d2f4a53_1d2f4a53_lower_idx" ON battles."Balloon Corgi Battle" USING btree (lower(username));


--
-- Name: players_basketballbattle-0adeed96_0ad_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_basketballbattle-0adeed96_0ad_event_key_global_rank_idx" ON battles."Basketball Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_basketballbattle-0adeed96_0adee_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_basketballbattle-0adeed96_0adee_event_key_clan_name_idx" ON battles."Basketball Battle" USING btree (event_key, clan_name);


--
-- Name: players_basketballbattle-0adeed96_0adee_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_basketballbattle-0adeed96_0adee_user_id_observed_at_idx" ON battles."Basketball Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_basketballbattle-0adeed96_0adeed96_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_basketballbattle-0adeed96_0adeed96_lower_idx" ON battles."Basketball Battle" USING btree (lower(username));


--
-- Name: players_blockpartybattle-b6465ffc_b6465_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_blockpartybattle-b6465ffc_b6465_event_key_clan_name_idx" ON battles."Block Party Battle" USING btree (event_key, clan_name);


--
-- Name: players_blockpartybattle-b6465ffc_b6465_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_blockpartybattle-b6465ffc_b6465_user_id_observed_at_idx" ON battles."Block Party Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_blockpartybattle-b6465ffc_b6465ffc_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_blockpartybattle-b6465ffc_b6465ffc_lower_idx" ON battles."Block Party Battle" USING btree (lower(username));


--
-- Name: players_blockpartybattle-b6465ffc_b64_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_blockpartybattle-b6465ffc_b64_event_key_global_rank_idx" ON battles."Block Party Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_cardbattle-9a64296e_9a64296e_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_cardbattle-9a64296e_9a64296e_event_key_clan_name_idx" ON battles."Evil Battle" USING btree (event_key, clan_name);


--
-- Name: players_cardbattle-9a64296e_9a64296e_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_cardbattle-9a64296e_9a64296e_event_key_global_rank_idx" ON battles."Evil Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_cardbattle-9a64296e_9a64296e_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_cardbattle-9a64296e_9a64296e_lower_idx" ON battles."Evil Battle" USING btree (lower(username));


--
-- Name: players_cardbattle-9a64296e_9a64296e_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_cardbattle-9a64296e_9a64296e_user_id_observed_at_idx" ON battles."Evil Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_christmas2024-bf51af0b_bf51af0b_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_christmas2024-bf51af0b_bf51af0b_event_key_clan_name_idx" ON battles."Gingerbread Battle" USING btree (event_key, clan_name);


--
-- Name: players_christmas2024-bf51af0b_bf51af0b_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_christmas2024-bf51af0b_bf51af0b_lower_idx" ON battles."Gingerbread Battle" USING btree (lower(username));


--
-- Name: players_christmas2024-bf51af0b_bf51af0b_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_christmas2024-bf51af0b_bf51af0b_user_id_observed_at_idx" ON battles."Gingerbread Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_christmas2024-bf51af0b_bf51af_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_christmas2024-bf51af0b_bf51af_event_key_global_rank_idx" ON battles."Gingerbread Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_christmas2025-27bb8de7_27bb8d_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_christmas2025-27bb8de7_27bb8d_event_key_global_rank_idx" ON battles."Gingerbread Battle 2025" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_christmas2025-27bb8de7_27bb8de7_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_christmas2025-27bb8de7_27bb8de7_event_key_clan_name_idx" ON battles."Gingerbread Battle 2025" USING btree (event_key, clan_name);


--
-- Name: players_christmas2025-27bb8de7_27bb8de7_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_christmas2025-27bb8de7_27bb8de7_lower_idx" ON battles."Gingerbread Battle 2025" USING btree (lower(username));


--
-- Name: players_christmas2025-27bb8de7_27bb8de7_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_christmas2025-27bb8de7_27bb8de7_user_id_observed_at_idx" ON battles."Gingerbread Battle 2025" USING btree (user_id, observed_at DESC);


--
-- Name: players_fantasybattle2026-2ab20c67_2a_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_fantasybattle2026-2ab20c67_2a_event_key_global_rank_idx" ON battles."Fantasy 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_fantasybattle2026-2ab20c67_2ab20c67_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_fantasybattle2026-2ab20c67_2ab20c67_lower_idx" ON battles."Fantasy 2026" USING btree (lower(username));


--
-- Name: players_fantasybattle2026-2ab20c67_2ab2_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_fantasybattle2026-2ab20c67_2ab2_event_key_clan_name_idx" ON battles."Fantasy 2026" USING btree (event_key, clan_name);


--
-- Name: players_fantasybattle2026-2ab20c67_2ab2_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_fantasybattle2026-2ab20c67_2ab2_user_id_observed_at_idx" ON battles."Fantasy 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_gummybattle2026-ada0f5ca_ada0_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_gummybattle2026-ada0f5ca_ada0_event_key_global_rank_idx" ON battles."Gummy 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_gummybattle2026-ada0f5ca_ada0f5_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_gummybattle2026-ada0f5ca_ada0f5_event_key_clan_name_idx" ON battles."Gummy 2026" USING btree (event_key, clan_name);


--
-- Name: players_gummybattle2026-ada0f5ca_ada0f5_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_gummybattle2026-ada0f5ca_ada0f5_user_id_observed_at_idx" ON battles."Gummy 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_gummybattle2026-ada0f5ca_ada0f5ca_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_gummybattle2026-ada0f5ca_ada0f5ca_lower_idx" ON battles."Gummy 2026" USING btree (lower(username));


--
-- Name: players_hatchwarbattle2026-c1c5dbd8_c1c5dbd8_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_hatchwarbattle2026-c1c5dbd8_c1c5dbd8_lower_idx" ON battles."Hatch War 2026" USING btree (lower(username));


--
-- Name: players_hatchwarbattle2026-c1c5dbd8_c1c_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_hatchwarbattle2026-c1c5dbd8_c1c_event_key_clan_name_idx" ON battles."Hatch War 2026" USING btree (event_key, clan_name);


--
-- Name: players_hatchwarbattle2026-c1c5dbd8_c1c_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_hatchwarbattle2026-c1c5dbd8_c1c_user_id_observed_at_idx" ON battles."Hatch War 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_hatchwarbattle2026-c1c5dbd8_c_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_hatchwarbattle2026-c1c5dbd8_c_event_key_global_rank_idx" ON battles."Hatch War 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_luckybattle-1c37c40d_1c37c40d_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_luckybattle-1c37c40d_1c37c40d_event_key_clan_name_idx" ON battles."Lucky Battle" USING btree (event_key, clan_name);


--
-- Name: players_luckybattle-1c37c40d_1c37c40d_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_luckybattle-1c37c40d_1c37c40d_event_key_global_rank_idx" ON battles."Lucky Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_luckybattle-1c37c40d_1c37c40d_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_luckybattle-1c37c40d_1c37c40d_lower_idx" ON battles."Lucky Battle" USING btree (lower(username));


--
-- Name: players_luckybattle-1c37c40d_1c37c40d_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_luckybattle-1c37c40d_1c37c40d_user_id_observed_at_idx" ON battles."Lucky Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_luckychestbattle-7369f494_7369f494_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_luckychestbattle-7369f494_7369f494_lower_idx" ON battles."Lucky Chest Battle" USING btree (lower(username));


--
-- Name: players_luckychestbattle-7369f494_7369f_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_luckychestbattle-7369f494_7369f_event_key_clan_name_idx" ON battles."Lucky Chest Battle" USING btree (event_key, clan_name);


--
-- Name: players_luckychestbattle-7369f494_7369f_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_luckychestbattle-7369f494_7369f_user_id_observed_at_idx" ON battles."Lucky Chest Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_luckychestbattle-7369f494_736_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_luckychestbattle-7369f494_736_event_key_global_rank_idx" ON battles."Lucky Chest Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_lunarbattle2026-f3714776_f3714776_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_lunarbattle2026-f3714776_f3714776_lower_idx" ON battles."Lunar 2026" USING btree (lower(username));


--
-- Name: players_lunarbattle2026-f3714776_f37147_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_lunarbattle2026-f3714776_f37147_event_key_clan_name_idx" ON battles."Lunar 2026" USING btree (event_key, clan_name);


--
-- Name: players_lunarbattle2026-f3714776_f37147_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_lunarbattle2026-f3714776_f37147_user_id_observed_at_idx" ON battles."Lunar 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_lunarbattle2026-f3714776_f371_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_lunarbattle2026-f3714776_f371_event_key_global_rank_idx" ON battles."Lunar 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_newyear2024-cca85652_cca85652_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_newyear2024-cca85652_cca85652_event_key_clan_name_idx" ON battles."New Years Battle" USING btree (event_key, clan_name);


--
-- Name: players_newyear2024-cca85652_cca85652_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_newyear2024-cca85652_cca85652_event_key_global_rank_idx" ON battles."New Years Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_newyear2024-cca85652_cca85652_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_newyear2024-cca85652_cca85652_lower_idx" ON battles."New Years Battle" USING btree (lower(username));


--
-- Name: players_newyear2024-cca85652_cca85652_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_newyear2024-cca85652_cca85652_user_id_observed_at_idx" ON battles."New Years Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_ninjabattle2026-82809742_82809742_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_ninjabattle2026-82809742_82809742_lower_idx" ON battles."Ninja 2026" USING btree (lower(username));


--
-- Name: players_ninjabattle2026-82809742_828097_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_ninjabattle2026-82809742_828097_event_key_clan_name_idx" ON battles."Ninja 2026" USING btree (event_key, clan_name);


--
-- Name: players_ninjabattle2026-82809742_828097_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_ninjabattle2026-82809742_828097_user_id_observed_at_idx" ON battles."Ninja 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_ninjabattle2026-82809742_8280_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_ninjabattle2026-82809742_8280_event_key_global_rank_idx" ON battles."Ninja 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_pixelchickbattle-6763ef15_6763e_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_pixelchickbattle-6763ef15_6763e_event_key_clan_name_idx" ON battles."Pixel Chick Battle" USING btree (event_key, clan_name);


--
-- Name: players_pixelchickbattle-6763ef15_6763e_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_pixelchickbattle-6763ef15_6763e_user_id_observed_at_idx" ON battles."Pixel Chick Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_pixelchickbattle-6763ef15_6763ef15_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_pixelchickbattle-6763ef15_6763ef15_lower_idx" ON battles."Pixel Chick Battle" USING btree (lower(username));


--
-- Name: players_pixelchickbattle-6763ef15_676_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_pixelchickbattle-6763ef15_676_event_key_global_rank_idx" ON battles."Pixel Chick Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_poisonturtlebattle-27eba2f3_27e_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_poisonturtlebattle-27eba2f3_27e_event_key_clan_name_idx" ON battles."Poison Turtle Battle" USING btree (event_key, clan_name);


--
-- Name: players_poisonturtlebattle-27eba2f3_27e_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_poisonturtlebattle-27eba2f3_27e_user_id_observed_at_idx" ON battles."Poison Turtle Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_poisonturtlebattle-27eba2f3_27eba2f3_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_poisonturtlebattle-27eba2f3_27eba2f3_lower_idx" ON battles."Poison Turtle Battle" USING btree (lower(username));


--
-- Name: players_poisonturtlebattle-27eba2f3_2_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_poisonturtlebattle-27eba2f3_2_event_key_global_rank_idx" ON battles."Poison Turtle Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_royalbattle2026-ed2519d2_ed2519_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_royalbattle2026-ed2519d2_ed2519_event_key_clan_name_idx" ON battles."Royal 2026" USING btree (event_key, clan_name);


--
-- Name: players_royalbattle2026-ed2519d2_ed2519_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_royalbattle2026-ed2519d2_ed2519_user_id_observed_at_idx" ON battles."Royal 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_royalbattle2026-ed2519d2_ed2519d2_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_royalbattle2026-ed2519d2_ed2519d2_lower_idx" ON battles."Royal 2026" USING btree (lower(username));


--
-- Name: players_royalbattle2026-ed2519d2_ed25_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_royalbattle2026-ed2519d2_ed25_event_key_global_rank_idx" ON battles."Royal 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_santabattle-d3920a34_d3920a34_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_santabattle-d3920a34_d3920a34_event_key_clan_name_idx" ON battles."Bee Battle" USING btree (event_key, clan_name);


--
-- Name: players_santabattle-d3920a34_d3920a34_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_santabattle-d3920a34_d3920a34_event_key_global_rank_idx" ON battles."Bee Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_santabattle-d3920a34_d3920a34_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_santabattle-d3920a34_d3920a34_lower_idx" ON battles."Bee Battle" USING btree (lower(username));


--
-- Name: players_santabattle-d3920a34_d3920a34_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_santabattle-d3920a34_d3920a34_user_id_observed_at_idx" ON battles."Bee Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_soccerbattle2026-5efde53e_5ef_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_soccerbattle2026-5efde53e_5ef_event_key_global_rank_idx" ON battles."Soccer 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_soccerbattle2026-5efde53e_5efde53e_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_soccerbattle2026-5efde53e_5efde53e_lower_idx" ON battles."Soccer 2026" USING btree (lower(username));


--
-- Name: players_soccerbattle2026-5efde53e_5efde_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_soccerbattle2026-5efde53e_5efde_event_key_clan_name_idx" ON battles."Soccer 2026" USING btree (event_key, clan_name);


--
-- Name: players_soccerbattle2026-5efde53e_5efde_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_soccerbattle2026-5efde53e_5efde_user_id_observed_at_idx" ON battles."Soccer 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_spaceminebattle2026-d5a9ef77__event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_spaceminebattle2026-d5a9ef77__event_key_global_rank_idx" ON battles."Space Mine 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_spaceminebattle2026-d5a9ef77_d5_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_spaceminebattle2026-d5a9ef77_d5_event_key_clan_name_idx" ON battles."Space Mine 2026" USING btree (event_key, clan_name);


--
-- Name: players_spaceminebattle2026-d5a9ef77_d5_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_spaceminebattle2026-d5a9ef77_d5_user_id_observed_at_idx" ON battles."Space Mine 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_spaceminebattle2026-d5a9ef77_d5a9ef77_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_spaceminebattle2026-d5a9ef77_d5a9ef77_lower_idx" ON battles."Space Mine 2026" USING btree (lower(username));


--
-- Name: players_spring2026-17bb571b_17bb571b_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_spring2026-17bb571b_17bb571b_event_key_clan_name_idx" ON battles."Spring 2026" USING btree (event_key, clan_name);


--
-- Name: players_spring2026-17bb571b_17bb571b_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_spring2026-17bb571b_17bb571b_event_key_global_rank_idx" ON battles."Spring 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_spring2026-17bb571b_17bb571b_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_spring2026-17bb571b_17bb571b_lower_idx" ON battles."Spring 2026" USING btree (lower(username));


--
-- Name: players_spring2026-17bb571b_17bb571b_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_spring2026-17bb571b_17bb571b_user_id_observed_at_idx" ON battles."Spring 2026" USING btree (user_id, observed_at DESC);


--
-- Name: players_squidbattle-9b7f76b4_9b7f76b4_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_squidbattle-9b7f76b4_9b7f76b4_event_key_clan_name_idx" ON battles."Pet Games Battle" USING btree (event_key, clan_name);


--
-- Name: players_squidbattle-9b7f76b4_9b7f76b4_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_squidbattle-9b7f76b4_9b7f76b4_event_key_global_rank_idx" ON battles."Pet Games Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_squidbattle-9b7f76b4_9b7f76b4_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_squidbattle-9b7f76b4_9b7f76b4_lower_idx" ON battles."Pet Games Battle" USING btree (lower(username));


--
-- Name: players_squidbattle-9b7f76b4_9b7f76b4_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_squidbattle-9b7f76b4_9b7f76b4_user_id_observed_at_idx" ON battles."Pet Games Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_starrybattle-55e42778_55e42778_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_starrybattle-55e42778_55e42778_event_key_clan_name_idx" ON battles."Starry" USING btree (event_key, clan_name);


--
-- Name: players_starrybattle-55e42778_55e42778_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_starrybattle-55e42778_55e42778_lower_idx" ON battles."Starry" USING btree (lower(username));


--
-- Name: players_starrybattle-55e42778_55e42778_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_starrybattle-55e42778_55e42778_user_id_observed_at_idx" ON battles."Starry" USING btree (user_id, observed_at DESC);


--
-- Name: players_starrybattle-55e42778_55e4277_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_starrybattle-55e42778_55e4277_event_key_global_rank_idx" ON battles."Starry" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_strengthbattle-273c958b_273c958_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_strengthbattle-273c958b_273c958_event_key_clan_name_idx" ON battles."Strength Battle" USING btree (event_key, clan_name);


--
-- Name: players_strengthbattle-273c958b_273c958_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_strengthbattle-273c958b_273c958_user_id_observed_at_idx" ON battles."Strength Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_strengthbattle-273c958b_273c958b_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_strengthbattle-273c958b_273c958b_lower_idx" ON battles."Strength Battle" USING btree (lower(username));


--
-- Name: players_strengthbattle-273c958b_273c9_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_strengthbattle-273c958b_273c9_event_key_global_rank_idx" ON battles."Strength Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_tiedyebattle-9ff50546_9ff50546_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_tiedyebattle-9ff50546_9ff50546_event_key_clan_name_idx" ON battles."Tie Dye Battle" USING btree (event_key, clan_name);


--
-- Name: players_tiedyebattle-9ff50546_9ff50546_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_tiedyebattle-9ff50546_9ff50546_lower_idx" ON battles."Tie Dye Battle" USING btree (lower(username));


--
-- Name: players_tiedyebattle-9ff50546_9ff50546_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_tiedyebattle-9ff50546_9ff50546_user_id_observed_at_idx" ON battles."Tie Dye Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_tiedyebattle-9ff50546_9ff5054_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_tiedyebattle-9ff50546_9ff5054_event_key_global_rank_idx" ON battles."Tie Dye Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_towerbattle-b5746746_b5746746_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_towerbattle-b5746746_b5746746_event_key_clan_name_idx" ON battles."Tower Defense Battle" USING btree (event_key, clan_name);


--
-- Name: players_towerbattle-b5746746_b5746746_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_towerbattle-b5746746_b5746746_event_key_global_rank_idx" ON battles."Tower Defense Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_towerbattle-b5746746_b5746746_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_towerbattle-b5746746_b5746746_lower_idx" ON battles."Tower Defense Battle" USING btree (lower(username));


--
-- Name: players_towerbattle-b5746746_b5746746_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_towerbattle-b5746746_b5746746_user_id_observed_at_idx" ON battles."Tower Defense Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_trickortreat-7ccd85e2_7ccd85e2_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_trickortreat-7ccd85e2_7ccd85e2_event_key_clan_name_idx" ON battles."Trick or Treat Battle" USING btree (event_key, clan_name);


--
-- Name: players_trickortreat-7ccd85e2_7ccd85e2_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_trickortreat-7ccd85e2_7ccd85e2_lower_idx" ON battles."Trick or Treat Battle" USING btree (lower(username));


--
-- Name: players_trickortreat-7ccd85e2_7ccd85e2_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_trickortreat-7ccd85e2_7ccd85e2_user_id_observed_at_idx" ON battles."Trick or Treat Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_trickortreat-7ccd85e2_7ccd85e_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_trickortreat-7ccd85e2_7ccd85e_event_key_global_rank_idx" ON battles."Trick or Treat Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_turkey2025-38eb8cfa_38eb8cfa_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_turkey2025-38eb8cfa_38eb8cfa_event_key_clan_name_idx" ON battles."Thanksgiving 2025 Battle" USING btree (event_key, clan_name);


--
-- Name: players_turkey2025-38eb8cfa_38eb8cfa_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_turkey2025-38eb8cfa_38eb8cfa_event_key_global_rank_idx" ON battles."Thanksgiving 2025 Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_turkey2025-38eb8cfa_38eb8cfa_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_turkey2025-38eb8cfa_38eb8cfa_lower_idx" ON battles."Thanksgiving 2025 Battle" USING btree (lower(username));


--
-- Name: players_turkey2025-38eb8cfa_38eb8cfa_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_turkey2025-38eb8cfa_38eb8cfa_user_id_observed_at_idx" ON battles."Thanksgiving 2025 Battle" USING btree (user_id, observed_at DESC);


--
-- Name: players_yearend2024-76d12247_76d12247_event_key_clan_name_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_yearend2024-76d12247_76d12247_event_key_clan_name_idx" ON battles."Christmas Present Battle" USING btree (event_key, clan_name);


--
-- Name: players_yearend2024-76d12247_76d12247_event_key_global_rank_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_yearend2024-76d12247_76d12247_event_key_global_rank_idx" ON battles."Christmas Present Battle" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: players_yearend2024-76d12247_76d12247_lower_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_yearend2024-76d12247_76d12247_lower_idx" ON battles."Christmas Present Battle" USING btree (lower(username));


--
-- Name: players_yearend2024-76d12247_76d12247_user_id_observed_at_idx; Type: INDEX; Schema: battles; Owner: -
--

CREATE INDEX "players_yearend2024-76d12247_76d12247_user_id_observed_at_idx" ON battles."Christmas Present Battle" USING btree (user_id, observed_at DESC);


--
-- Name: battle_aliases_lookup_idx; Type: INDEX; Schema: catalog; Owner: -
--

CREATE INDEX battle_aliases_lookup_idx ON catalog.battle_aliases USING btree (lower(alias));


--
-- Name: battle_bot_event_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX battle_bot_event_idx ON imports.battle_bot USING btree (event_key, record_kind);


--
-- Name: battle_bot_global_rank_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX battle_bot_global_rank_idx ON imports.battle_bot USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: battle_bot_source_record_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX battle_bot_source_record_idx ON imports.battle_bot USING btree (source_record_id, record_kind);


--
-- Name: battle_bot_user_history_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX battle_bot_user_history_idx ON imports.battle_bot USING btree (user_id, event_key);


--
-- Name: big_bot_event_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX big_bot_event_idx ON imports.big_bot USING btree (event_key, record_kind);


--
-- Name: big_bot_global_rank_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX big_bot_global_rank_idx ON imports.big_bot USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: big_bot_source_record_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX big_bot_source_record_idx ON imports.big_bot USING btree (source_record_id, record_kind);


--
-- Name: big_bot_user_history_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX big_bot_user_history_idx ON imports.big_bot USING btree (user_id, event_key);


--
-- Name: cw_bot_event_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX cw_bot_event_idx ON imports.cw_bot USING btree (event_key, record_kind);


--
-- Name: cw_bot_global_rank_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX cw_bot_global_rank_idx ON imports.cw_bot USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: cw_bot_source_record_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX cw_bot_source_record_idx ON imports.cw_bot USING btree (source_record_id, record_kind);


--
-- Name: cw_bot_user_history_idx; Type: INDEX; Schema: imports; Owner: -
--

CREATE INDEX cw_bot_user_history_idx ON imports.cw_bot USING btree (user_id, event_key);


--
-- Name: leaderboard_results_user_history_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX leaderboard_results_user_history_idx ON ONLY leaderboards.results USING btree (user_id, event_key);


--
-- Name: Arcade Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Arcade Leaderboard_user_id_event_key_idx" ON leaderboards."Arcade Leaderboard" USING btree (user_id, event_key);


--
-- Name: Blood Moon Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Blood Moon Leaderboard_user_id_event_key_idx" ON leaderboards."Blood Moon Leaderboard" USING btree (user_id, event_key);


--
-- Name: Boss Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Boss Leaderboard_user_id_event_key_idx" ON leaderboards."Boss Leaderboard" USING btree (user_id, event_key);


--
-- Name: Breakout Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Breakout Leaderboard_user_id_event_key_idx" ON leaderboards."Breakout Leaderboard" USING btree (user_id, event_key);


--
-- Name: Fiesta Forever!_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Fiesta Forever!_user_id_event_key_idx" ON leaderboards."Fiesta Forever!" USING btree (user_id, event_key);


--
-- Name: Fiesta Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Fiesta Leaderboard_user_id_event_key_idx" ON leaderboards."Fiesta Leaderboard" USING btree (user_id, event_key);


--
-- Name: Halloween Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Halloween Leaderboard_user_id_event_key_idx" ON leaderboards."Halloween Leaderboard" USING btree (user_id, event_key);


--
-- Name: Hatch Battle Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Hatch Battle Leaderboard_user_id_event_key_idx" ON leaderboards."Hatch Battle Leaderboard" USING btree (user_id, event_key);


--
-- Name: Kick Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Kick Leaderboard_user_id_event_key_idx" ON leaderboards."Kick Leaderboard" USING btree (user_id, event_key);


--
-- Name: PSX Classic Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "PSX Classic Leaderboard_user_id_event_key_idx" ON leaderboards."PSX Classic Leaderboard" USING btree (user_id, event_key);


--
-- Name: Piñata Maze!_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Piñata Maze!_user_id_event_key_idx" ON leaderboards."Piñata Maze!" USING btree (user_id, event_key);


--
-- Name: Space Forge!_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Space Forge!_user_id_event_key_idx" ON leaderboards."Space Forge!" USING btree (user_id, event_key);


--
-- Name: Speedrun Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Speedrun Leaderboard_user_id_event_key_idx" ON leaderboards."Speedrun Leaderboard" USING btree (user_id, event_key);


--
-- Name: Tap Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Tap Leaderboard_user_id_event_key_idx" ON leaderboards."Tap Leaderboard" USING btree (user_id, event_key);


--
-- Name: Time Trial Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Time Trial Leaderboard_user_id_event_key_idx" ON leaderboards."Time Trial Leaderboard" USING btree (user_id, event_key);


--
-- Name: Top Hatches_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Top Hatches_user_id_event_key_idx" ON leaderboards."Top Hatches" USING btree (user_id, event_key);


--
-- Name: Transcends Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Transcends Leaderboard_user_id_event_key_idx" ON leaderboards."Transcends Leaderboard" USING btree (user_id, event_key);


--
-- Name: Yeti Leaderboard_user_id_event_key_idx; Type: INDEX; Schema: leaderboards; Owner: -
--

CREATE INDEX "Yeti Leaderboard_user_id_event_key_idx" ON leaderboards."Yeti Leaderboard" USING btree (user_id, event_key);


--
-- Name: player_results_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX player_results_event_key_global_rank_idx ON ONLY leagues.player_results USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: 2026 Arcade League_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "2026 Arcade League_event_key_global_rank_idx" ON leagues."2026 Arcade League" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: player_results_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX player_results_event_key_pool_rank_idx ON ONLY leagues.player_results USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: 2026 Arcade League_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "2026 Arcade League_event_key_pool_rank_idx" ON leagues."2026 Arcade League" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: player_results_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX player_results_event_key_team_key_idx ON ONLY leagues.player_results USING btree (event_key, team_key);


--
-- Name: 2026 Arcade League_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "2026 Arcade League_event_key_team_key_idx" ON leagues."2026 Arcade League" USING btree (event_key, team_key);


--
-- Name: player_results_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX player_results_user_id_event_key_idx ON ONLY leagues.player_results USING btree (user_id, event_key);


--
-- Name: 2026 Arcade League_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "2026 Arcade League_user_id_event_key_idx" ON leagues."2026 Arcade League" USING btree (user_id, event_key);


--
-- Name: 2026 Space Mine League_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "2026 Space Mine League_event_key_global_rank_idx" ON leagues."2026 Space Mine League" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: 2026 Space Mine League_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "2026 Space Mine League_event_key_pool_rank_idx" ON leagues."2026 Space Mine League" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: 2026 Space Mine League_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "2026 Space Mine League_event_key_team_key_idx" ON leagues."2026 Space Mine League" USING btree (event_key, team_key);


--
-- Name: 2026 Space Mine League_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "2026 Space Mine League_user_id_event_key_idx" ON leagues."2026 Space Mine League" USING btree (user_id, event_key);


--
-- Name: Basketball Leagues_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Basketball Leagues_event_key_global_rank_idx" ON leagues."Basketball Leagues" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: Basketball Leagues_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Basketball Leagues_event_key_pool_rank_idx" ON leagues."Basketball Leagues" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: Basketball Leagues_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Basketball Leagues_event_key_team_key_idx" ON leagues."Basketball Leagues" USING btree (event_key, team_key);


--
-- Name: Basketball Leagues_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Basketball Leagues_user_id_event_key_idx" ON leagues."Basketball Leagues" USING btree (user_id, event_key);


--
-- Name: Blood Moon League_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Blood Moon League_event_key_global_rank_idx" ON leagues."Blood Moon League" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: Blood Moon League_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Blood Moon League_event_key_pool_rank_idx" ON leagues."Blood Moon League" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: Blood Moon League_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Blood Moon League_event_key_team_key_idx" ON leagues."Blood Moon League" USING btree (event_key, team_key);


--
-- Name: Blood Moon League_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Blood Moon League_user_id_event_key_idx" ON leagues."Blood Moon League" USING btree (user_id, event_key);


--
-- Name: Deep Backrooms League_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Deep Backrooms League_event_key_global_rank_idx" ON leagues."Deep Backrooms League" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: Deep Backrooms League_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Deep Backrooms League_event_key_pool_rank_idx" ON leagues."Deep Backrooms League" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: Deep Backrooms League_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Deep Backrooms League_event_key_team_key_idx" ON leagues."Deep Backrooms League" USING btree (event_key, team_key);


--
-- Name: Deep Backrooms League_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Deep Backrooms League_user_id_event_key_idx" ON leagues."Deep Backrooms League" USING btree (user_id, event_key);


--
-- Name: Fiesta League_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Fiesta League_event_key_global_rank_idx" ON leagues."Fiesta League" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: Fiesta League_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Fiesta League_event_key_pool_rank_idx" ON leagues."Fiesta League" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: Fiesta League_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Fiesta League_event_key_team_key_idx" ON leagues."Fiesta League" USING btree (event_key, team_key);


--
-- Name: Fiesta League_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Fiesta League_user_id_event_key_idx" ON leagues."Fiesta League" USING btree (user_id, event_key);


--
-- Name: Garden League_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Garden League_event_key_global_rank_idx" ON leagues."Garden League" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: Garden League_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Garden League_event_key_pool_rank_idx" ON leagues."Garden League" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: Garden League_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Garden League_event_key_team_key_idx" ON leagues."Garden League" USING btree (event_key, team_key);


--
-- Name: Garden League_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Garden League_user_id_event_key_idx" ON leagues."Garden League" USING btree (user_id, event_key);


--
-- Name: Lucky Breakout League_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Lucky Breakout League_event_key_global_rank_idx" ON leagues."Lucky Breakout League" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: Lucky Breakout League_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Lucky Breakout League_event_key_pool_rank_idx" ON leagues."Lucky Breakout League" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: Lucky Breakout League_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Lucky Breakout League_event_key_team_key_idx" ON leagues."Lucky Breakout League" USING btree (event_key, team_key);


--
-- Name: Lucky Breakout League_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Lucky Breakout League_user_id_event_key_idx" ON leagues."Lucky Breakout League" USING btree (user_id, event_key);


--
-- Name: RNG League_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "RNG League_event_key_global_rank_idx" ON leagues."RNG League" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: RNG League_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "RNG League_event_key_pool_rank_idx" ON leagues."RNG League" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: RNG League_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "RNG League_event_key_team_key_idx" ON leagues."RNG League" USING btree (event_key, team_key);


--
-- Name: RNG League_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "RNG League_user_id_event_key_idx" ON leagues."RNG League" USING btree (user_id, event_key);


--
-- Name: Soccer League_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Soccer League_event_key_global_rank_idx" ON leagues."Soccer League" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: Soccer League_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Soccer League_event_key_pool_rank_idx" ON leagues."Soccer League" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: Soccer League_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Soccer League_event_key_team_key_idx" ON leagues."Soccer League" USING btree (event_key, team_key);


--
-- Name: Soccer League_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Soccer League_user_id_event_key_idx" ON leagues."Soccer League" USING btree (user_id, event_key);


--
-- Name: Tap Heroes League 2026_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Tap Heroes League 2026_event_key_global_rank_idx" ON leagues."Tap Heroes League 2026" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: Tap Heroes League 2026_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Tap Heroes League 2026_event_key_pool_rank_idx" ON leagues."Tap Heroes League 2026" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: Tap Heroes League 2026_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Tap Heroes League 2026_event_key_team_key_idx" ON leagues."Tap Heroes League 2026" USING btree (event_key, team_key);


--
-- Name: Tap Heroes League 2026_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Tap Heroes League 2026_user_id_event_key_idx" ON leagues."Tap Heroes League 2026" USING btree (user_id, event_key);


--
-- Name: Time Trials League_event_key_global_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Time Trials League_event_key_global_rank_idx" ON leagues."Time Trials League" USING btree (event_key, global_rank) WHERE (global_rank IS NOT NULL);


--
-- Name: Time Trials League_event_key_pool_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Time Trials League_event_key_pool_rank_idx" ON leagues."Time Trials League" USING btree (event_key, pool_rank) WHERE (pool_rank IS NOT NULL);


--
-- Name: Time Trials League_event_key_team_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Time Trials League_event_key_team_key_idx" ON leagues."Time Trials League" USING btree (event_key, team_key);


--
-- Name: Time Trials League_user_id_event_key_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX "Time Trials League_user_id_event_key_idx" ON leagues."Time Trials League" USING btree (user_id, event_key);


--
-- Name: team_results_event_key_league_id_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE UNIQUE INDEX team_results_event_key_league_id_idx ON leagues.team_results USING btree (event_key, league_id) WHERE (league_id IS NOT NULL);


--
-- Name: team_results_event_key_league_rank_idx; Type: INDEX; Schema: leagues; Owner: -
--

CREATE INDEX team_results_event_key_league_rank_idx ON leagues.team_results USING btree (event_key, league_rank);


--
-- Name: players_angelbattle2026-ade2dab9_ade2_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_angelbattle2026-ade2dab9_ade2_event_key_global_rank_idx";


--
-- Name: players_angelbattle2026-ade2dab9_ade2da_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_angelbattle2026-ade2dab9_ade2da_event_key_clan_name_idx";


--
-- Name: players_angelbattle2026-ade2dab9_ade2da_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_angelbattle2026-ade2dab9_ade2da_user_id_observed_at_idx";


--
-- Name: players_angelbattle2026-ade2dab9_ade2dab9_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_angelbattle2026-ade2dab9_ade2dab9_lower_idx";


--
-- Name: players_angelbattle2026-ade2dab9_ade2dab9_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_angelbattle2026-ade2dab9_ade2dab9_pkey";


--
-- Name: players_arcadebattle2026-26539d02_26539_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_arcadebattle2026-26539d02_26539_event_key_clan_name_idx";


--
-- Name: players_arcadebattle2026-26539d02_26539_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_arcadebattle2026-26539d02_26539_user_id_observed_at_idx";


--
-- Name: players_arcadebattle2026-26539d02_26539d02_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_arcadebattle2026-26539d02_26539d02_lower_idx";


--
-- Name: players_arcadebattle2026-26539d02_26539d02_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_arcadebattle2026-26539d02_26539d02_pkey";


--
-- Name: players_arcadebattle2026-26539d02_265_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_arcadebattle2026-26539d02_265_event_key_global_rank_idx";


--
-- Name: players_athenabattle-0c0717e0_0c0717e0_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_athenabattle-0c0717e0_0c0717e0_event_key_clan_name_idx";


--
-- Name: players_athenabattle-0c0717e0_0c0717e0_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_athenabattle-0c0717e0_0c0717e0_lower_idx";


--
-- Name: players_athenabattle-0c0717e0_0c0717e0_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_athenabattle-0c0717e0_0c0717e0_pkey";


--
-- Name: players_athenabattle-0c0717e0_0c0717e0_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_athenabattle-0c0717e0_0c0717e0_user_id_observed_at_idx";


--
-- Name: players_athenabattle-0c0717e0_0c0717e_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_athenabattle-0c0717e0_0c0717e_event_key_global_rank_idx";


--
-- Name: players_backrooms2026-72dfc70a_72dfc70a_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_backrooms2026-72dfc70a_72dfc70a_event_key_clan_name_idx";


--
-- Name: players_backrooms2026-72dfc70a_72dfc70a_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_backrooms2026-72dfc70a_72dfc70a_lower_idx";


--
-- Name: players_backrooms2026-72dfc70a_72dfc70a_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_backrooms2026-72dfc70a_72dfc70a_pkey";


--
-- Name: players_backrooms2026-72dfc70a_72dfc70a_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_backrooms2026-72dfc70a_72dfc70a_user_id_observed_at_idx";


--
-- Name: players_backrooms2026-72dfc70a_72dfc7_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_backrooms2026-72dfc70a_72dfc7_event_key_global_rank_idx";


--
-- Name: players_ballooncorgibattle-1d2f4a53_1_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_ballooncorgibattle-1d2f4a53_1_event_key_global_rank_idx";


--
-- Name: players_ballooncorgibattle-1d2f4a53_1d2_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_ballooncorgibattle-1d2f4a53_1d2_event_key_clan_name_idx";


--
-- Name: players_ballooncorgibattle-1d2f4a53_1d2_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_ballooncorgibattle-1d2f4a53_1d2_user_id_observed_at_idx";


--
-- Name: players_ballooncorgibattle-1d2f4a53_1d2f4a53_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_ballooncorgibattle-1d2f4a53_1d2f4a53_lower_idx";


--
-- Name: players_ballooncorgibattle-1d2f4a53_1d2f4a53_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_ballooncorgibattle-1d2f4a53_1d2f4a53_pkey";


--
-- Name: players_basketballbattle-0adeed96_0ad_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_basketballbattle-0adeed96_0ad_event_key_global_rank_idx";


--
-- Name: players_basketballbattle-0adeed96_0adee_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_basketballbattle-0adeed96_0adee_event_key_clan_name_idx";


--
-- Name: players_basketballbattle-0adeed96_0adee_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_basketballbattle-0adeed96_0adee_user_id_observed_at_idx";


--
-- Name: players_basketballbattle-0adeed96_0adeed96_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_basketballbattle-0adeed96_0adeed96_lower_idx";


--
-- Name: players_basketballbattle-0adeed96_0adeed96_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_basketballbattle-0adeed96_0adeed96_pkey";


--
-- Name: players_blockpartybattle-b6465ffc_b6465_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_blockpartybattle-b6465ffc_b6465_event_key_clan_name_idx";


--
-- Name: players_blockpartybattle-b6465ffc_b6465_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_blockpartybattle-b6465ffc_b6465_user_id_observed_at_idx";


--
-- Name: players_blockpartybattle-b6465ffc_b6465ffc_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_blockpartybattle-b6465ffc_b6465ffc_lower_idx";


--
-- Name: players_blockpartybattle-b6465ffc_b6465ffc_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_blockpartybattle-b6465ffc_b6465ffc_pkey";


--
-- Name: players_blockpartybattle-b6465ffc_b64_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_blockpartybattle-b6465ffc_b64_event_key_global_rank_idx";


--
-- Name: players_cardbattle-9a64296e_9a64296e_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_cardbattle-9a64296e_9a64296e_event_key_clan_name_idx";


--
-- Name: players_cardbattle-9a64296e_9a64296e_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_cardbattle-9a64296e_9a64296e_event_key_global_rank_idx";


--
-- Name: players_cardbattle-9a64296e_9a64296e_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_cardbattle-9a64296e_9a64296e_lower_idx";


--
-- Name: players_cardbattle-9a64296e_9a64296e_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_cardbattle-9a64296e_9a64296e_pkey";


--
-- Name: players_cardbattle-9a64296e_9a64296e_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_cardbattle-9a64296e_9a64296e_user_id_observed_at_idx";


--
-- Name: players_christmas2024-bf51af0b_bf51af0b_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_christmas2024-bf51af0b_bf51af0b_event_key_clan_name_idx";


--
-- Name: players_christmas2024-bf51af0b_bf51af0b_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_christmas2024-bf51af0b_bf51af0b_lower_idx";


--
-- Name: players_christmas2024-bf51af0b_bf51af0b_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_christmas2024-bf51af0b_bf51af0b_pkey";


--
-- Name: players_christmas2024-bf51af0b_bf51af0b_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_christmas2024-bf51af0b_bf51af0b_user_id_observed_at_idx";


--
-- Name: players_christmas2024-bf51af0b_bf51af_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_christmas2024-bf51af0b_bf51af_event_key_global_rank_idx";


--
-- Name: players_christmas2025-27bb8de7_27bb8d_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_christmas2025-27bb8de7_27bb8d_event_key_global_rank_idx";


--
-- Name: players_christmas2025-27bb8de7_27bb8de7_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_christmas2025-27bb8de7_27bb8de7_event_key_clan_name_idx";


--
-- Name: players_christmas2025-27bb8de7_27bb8de7_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_christmas2025-27bb8de7_27bb8de7_lower_idx";


--
-- Name: players_christmas2025-27bb8de7_27bb8de7_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_christmas2025-27bb8de7_27bb8de7_pkey";


--
-- Name: players_christmas2025-27bb8de7_27bb8de7_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_christmas2025-27bb8de7_27bb8de7_user_id_observed_at_idx";


--
-- Name: players_fantasybattle2026-2ab20c67_2a_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_fantasybattle2026-2ab20c67_2a_event_key_global_rank_idx";


--
-- Name: players_fantasybattle2026-2ab20c67_2ab20c67_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_fantasybattle2026-2ab20c67_2ab20c67_lower_idx";


--
-- Name: players_fantasybattle2026-2ab20c67_2ab20c67_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_fantasybattle2026-2ab20c67_2ab20c67_pkey";


--
-- Name: players_fantasybattle2026-2ab20c67_2ab2_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_fantasybattle2026-2ab20c67_2ab2_event_key_clan_name_idx";


--
-- Name: players_fantasybattle2026-2ab20c67_2ab2_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_fantasybattle2026-2ab20c67_2ab2_user_id_observed_at_idx";


--
-- Name: players_gummybattle2026-ada0f5ca_ada0_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_gummybattle2026-ada0f5ca_ada0_event_key_global_rank_idx";


--
-- Name: players_gummybattle2026-ada0f5ca_ada0f5_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_gummybattle2026-ada0f5ca_ada0f5_event_key_clan_name_idx";


--
-- Name: players_gummybattle2026-ada0f5ca_ada0f5_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_gummybattle2026-ada0f5ca_ada0f5_user_id_observed_at_idx";


--
-- Name: players_gummybattle2026-ada0f5ca_ada0f5ca_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_gummybattle2026-ada0f5ca_ada0f5ca_lower_idx";


--
-- Name: players_gummybattle2026-ada0f5ca_ada0f5ca_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_gummybattle2026-ada0f5ca_ada0f5ca_pkey";


--
-- Name: players_hatchwarbattle2026-c1c5dbd8_c1c5dbd8_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_hatchwarbattle2026-c1c5dbd8_c1c5dbd8_lower_idx";


--
-- Name: players_hatchwarbattle2026-c1c5dbd8_c1c5dbd8_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_hatchwarbattle2026-c1c5dbd8_c1c5dbd8_pkey";


--
-- Name: players_hatchwarbattle2026-c1c5dbd8_c1c_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_hatchwarbattle2026-c1c5dbd8_c1c_event_key_clan_name_idx";


--
-- Name: players_hatchwarbattle2026-c1c5dbd8_c1c_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_hatchwarbattle2026-c1c5dbd8_c1c_user_id_observed_at_idx";


--
-- Name: players_hatchwarbattle2026-c1c5dbd8_c_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_hatchwarbattle2026-c1c5dbd8_c_event_key_global_rank_idx";


--
-- Name: players_luckybattle-1c37c40d_1c37c40d_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_luckybattle-1c37c40d_1c37c40d_event_key_clan_name_idx";


--
-- Name: players_luckybattle-1c37c40d_1c37c40d_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_luckybattle-1c37c40d_1c37c40d_event_key_global_rank_idx";


--
-- Name: players_luckybattle-1c37c40d_1c37c40d_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_luckybattle-1c37c40d_1c37c40d_lower_idx";


--
-- Name: players_luckybattle-1c37c40d_1c37c40d_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_luckybattle-1c37c40d_1c37c40d_pkey";


--
-- Name: players_luckybattle-1c37c40d_1c37c40d_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_luckybattle-1c37c40d_1c37c40d_user_id_observed_at_idx";


--
-- Name: players_luckychestbattle-7369f494_7369f494_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_luckychestbattle-7369f494_7369f494_lower_idx";


--
-- Name: players_luckychestbattle-7369f494_7369f494_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_luckychestbattle-7369f494_7369f494_pkey";


--
-- Name: players_luckychestbattle-7369f494_7369f_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_luckychestbattle-7369f494_7369f_event_key_clan_name_idx";


--
-- Name: players_luckychestbattle-7369f494_7369f_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_luckychestbattle-7369f494_7369f_user_id_observed_at_idx";


--
-- Name: players_luckychestbattle-7369f494_736_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_luckychestbattle-7369f494_736_event_key_global_rank_idx";


--
-- Name: players_lunarbattle2026-f3714776_f3714776_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_lunarbattle2026-f3714776_f3714776_lower_idx";


--
-- Name: players_lunarbattle2026-f3714776_f3714776_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_lunarbattle2026-f3714776_f3714776_pkey";


--
-- Name: players_lunarbattle2026-f3714776_f37147_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_lunarbattle2026-f3714776_f37147_event_key_clan_name_idx";


--
-- Name: players_lunarbattle2026-f3714776_f37147_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_lunarbattle2026-f3714776_f37147_user_id_observed_at_idx";


--
-- Name: players_lunarbattle2026-f3714776_f371_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_lunarbattle2026-f3714776_f371_event_key_global_rank_idx";


--
-- Name: players_newyear2024-cca85652_cca85652_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_newyear2024-cca85652_cca85652_event_key_clan_name_idx";


--
-- Name: players_newyear2024-cca85652_cca85652_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_newyear2024-cca85652_cca85652_event_key_global_rank_idx";


--
-- Name: players_newyear2024-cca85652_cca85652_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_newyear2024-cca85652_cca85652_lower_idx";


--
-- Name: players_newyear2024-cca85652_cca85652_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_newyear2024-cca85652_cca85652_pkey";


--
-- Name: players_newyear2024-cca85652_cca85652_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_newyear2024-cca85652_cca85652_user_id_observed_at_idx";


--
-- Name: players_ninjabattle2026-82809742_82809742_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_ninjabattle2026-82809742_82809742_lower_idx";


--
-- Name: players_ninjabattle2026-82809742_82809742_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_ninjabattle2026-82809742_82809742_pkey";


--
-- Name: players_ninjabattle2026-82809742_828097_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_ninjabattle2026-82809742_828097_event_key_clan_name_idx";


--
-- Name: players_ninjabattle2026-82809742_828097_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_ninjabattle2026-82809742_828097_user_id_observed_at_idx";


--
-- Name: players_ninjabattle2026-82809742_8280_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_ninjabattle2026-82809742_8280_event_key_global_rank_idx";


--
-- Name: players_pixelchickbattle-6763ef15_6763e_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_pixelchickbattle-6763ef15_6763e_event_key_clan_name_idx";


--
-- Name: players_pixelchickbattle-6763ef15_6763e_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_pixelchickbattle-6763ef15_6763e_user_id_observed_at_idx";


--
-- Name: players_pixelchickbattle-6763ef15_6763ef15_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_pixelchickbattle-6763ef15_6763ef15_lower_idx";


--
-- Name: players_pixelchickbattle-6763ef15_6763ef15_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_pixelchickbattle-6763ef15_6763ef15_pkey";


--
-- Name: players_pixelchickbattle-6763ef15_676_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_pixelchickbattle-6763ef15_676_event_key_global_rank_idx";


--
-- Name: players_poisonturtlebattle-27eba2f3_27e_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_poisonturtlebattle-27eba2f3_27e_event_key_clan_name_idx";


--
-- Name: players_poisonturtlebattle-27eba2f3_27e_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_poisonturtlebattle-27eba2f3_27e_user_id_observed_at_idx";


--
-- Name: players_poisonturtlebattle-27eba2f3_27eba2f3_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_poisonturtlebattle-27eba2f3_27eba2f3_lower_idx";


--
-- Name: players_poisonturtlebattle-27eba2f3_27eba2f3_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_poisonturtlebattle-27eba2f3_27eba2f3_pkey";


--
-- Name: players_poisonturtlebattle-27eba2f3_2_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_poisonturtlebattle-27eba2f3_2_event_key_global_rank_idx";


--
-- Name: players_royalbattle2026-ed2519d2_ed2519_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_royalbattle2026-ed2519d2_ed2519_event_key_clan_name_idx";


--
-- Name: players_royalbattle2026-ed2519d2_ed2519_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_royalbattle2026-ed2519d2_ed2519_user_id_observed_at_idx";


--
-- Name: players_royalbattle2026-ed2519d2_ed2519d2_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_royalbattle2026-ed2519d2_ed2519d2_lower_idx";


--
-- Name: players_royalbattle2026-ed2519d2_ed2519d2_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_royalbattle2026-ed2519d2_ed2519d2_pkey";


--
-- Name: players_royalbattle2026-ed2519d2_ed25_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_royalbattle2026-ed2519d2_ed25_event_key_global_rank_idx";


--
-- Name: players_santabattle-d3920a34_d3920a34_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_santabattle-d3920a34_d3920a34_event_key_clan_name_idx";


--
-- Name: players_santabattle-d3920a34_d3920a34_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_santabattle-d3920a34_d3920a34_event_key_global_rank_idx";


--
-- Name: players_santabattle-d3920a34_d3920a34_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_santabattle-d3920a34_d3920a34_lower_idx";


--
-- Name: players_santabattle-d3920a34_d3920a34_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_santabattle-d3920a34_d3920a34_pkey";


--
-- Name: players_santabattle-d3920a34_d3920a34_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_santabattle-d3920a34_d3920a34_user_id_observed_at_idx";


--
-- Name: players_soccerbattle2026-5efde53e_5ef_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_soccerbattle2026-5efde53e_5ef_event_key_global_rank_idx";


--
-- Name: players_soccerbattle2026-5efde53e_5efde53e_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_soccerbattle2026-5efde53e_5efde53e_lower_idx";


--
-- Name: players_soccerbattle2026-5efde53e_5efde53e_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_soccerbattle2026-5efde53e_5efde53e_pkey";


--
-- Name: players_soccerbattle2026-5efde53e_5efde_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_soccerbattle2026-5efde53e_5efde_event_key_clan_name_idx";


--
-- Name: players_soccerbattle2026-5efde53e_5efde_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_soccerbattle2026-5efde53e_5efde_user_id_observed_at_idx";


--
-- Name: players_spaceminebattle2026-d5a9ef77__event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_spaceminebattle2026-d5a9ef77__event_key_global_rank_idx";


--
-- Name: players_spaceminebattle2026-d5a9ef77_d5_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_spaceminebattle2026-d5a9ef77_d5_event_key_clan_name_idx";


--
-- Name: players_spaceminebattle2026-d5a9ef77_d5_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_spaceminebattle2026-d5a9ef77_d5_user_id_observed_at_idx";


--
-- Name: players_spaceminebattle2026-d5a9ef77_d5a9ef77_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_spaceminebattle2026-d5a9ef77_d5a9ef77_lower_idx";


--
-- Name: players_spaceminebattle2026-d5a9ef77_d5a9ef77_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_spaceminebattle2026-d5a9ef77_d5a9ef77_pkey";


--
-- Name: players_spring2026-17bb571b_17bb571b_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_spring2026-17bb571b_17bb571b_event_key_clan_name_idx";


--
-- Name: players_spring2026-17bb571b_17bb571b_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_spring2026-17bb571b_17bb571b_event_key_global_rank_idx";


--
-- Name: players_spring2026-17bb571b_17bb571b_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_spring2026-17bb571b_17bb571b_lower_idx";


--
-- Name: players_spring2026-17bb571b_17bb571b_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_spring2026-17bb571b_17bb571b_pkey";


--
-- Name: players_spring2026-17bb571b_17bb571b_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_spring2026-17bb571b_17bb571b_user_id_observed_at_idx";


--
-- Name: players_squidbattle-9b7f76b4_9b7f76b4_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_squidbattle-9b7f76b4_9b7f76b4_event_key_clan_name_idx";


--
-- Name: players_squidbattle-9b7f76b4_9b7f76b4_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_squidbattle-9b7f76b4_9b7f76b4_event_key_global_rank_idx";


--
-- Name: players_squidbattle-9b7f76b4_9b7f76b4_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_squidbattle-9b7f76b4_9b7f76b4_lower_idx";


--
-- Name: players_squidbattle-9b7f76b4_9b7f76b4_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_squidbattle-9b7f76b4_9b7f76b4_pkey";


--
-- Name: players_squidbattle-9b7f76b4_9b7f76b4_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_squidbattle-9b7f76b4_9b7f76b4_user_id_observed_at_idx";


--
-- Name: players_starrybattle-55e42778_55e42778_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_starrybattle-55e42778_55e42778_event_key_clan_name_idx";


--
-- Name: players_starrybattle-55e42778_55e42778_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_starrybattle-55e42778_55e42778_lower_idx";


--
-- Name: players_starrybattle-55e42778_55e42778_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_starrybattle-55e42778_55e42778_pkey";


--
-- Name: players_starrybattle-55e42778_55e42778_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_starrybattle-55e42778_55e42778_user_id_observed_at_idx";


--
-- Name: players_starrybattle-55e42778_55e4277_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_starrybattle-55e42778_55e4277_event_key_global_rank_idx";


--
-- Name: players_strengthbattle-273c958b_273c958_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_strengthbattle-273c958b_273c958_event_key_clan_name_idx";


--
-- Name: players_strengthbattle-273c958b_273c958_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_strengthbattle-273c958b_273c958_user_id_observed_at_idx";


--
-- Name: players_strengthbattle-273c958b_273c958b_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_strengthbattle-273c958b_273c958b_lower_idx";


--
-- Name: players_strengthbattle-273c958b_273c958b_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_strengthbattle-273c958b_273c958b_pkey";


--
-- Name: players_strengthbattle-273c958b_273c9_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_strengthbattle-273c958b_273c9_event_key_global_rank_idx";


--
-- Name: players_tiedyebattle-9ff50546_9ff50546_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_tiedyebattle-9ff50546_9ff50546_event_key_clan_name_idx";


--
-- Name: players_tiedyebattle-9ff50546_9ff50546_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_tiedyebattle-9ff50546_9ff50546_lower_idx";


--
-- Name: players_tiedyebattle-9ff50546_9ff50546_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_tiedyebattle-9ff50546_9ff50546_pkey";


--
-- Name: players_tiedyebattle-9ff50546_9ff50546_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_tiedyebattle-9ff50546_9ff50546_user_id_observed_at_idx";


--
-- Name: players_tiedyebattle-9ff50546_9ff5054_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_tiedyebattle-9ff50546_9ff5054_event_key_global_rank_idx";


--
-- Name: players_towerbattle-b5746746_b5746746_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_towerbattle-b5746746_b5746746_event_key_clan_name_idx";


--
-- Name: players_towerbattle-b5746746_b5746746_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_towerbattle-b5746746_b5746746_event_key_global_rank_idx";


--
-- Name: players_towerbattle-b5746746_b5746746_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_towerbattle-b5746746_b5746746_lower_idx";


--
-- Name: players_towerbattle-b5746746_b5746746_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_towerbattle-b5746746_b5746746_pkey";


--
-- Name: players_towerbattle-b5746746_b5746746_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_towerbattle-b5746746_b5746746_user_id_observed_at_idx";


--
-- Name: players_trickortreat-7ccd85e2_7ccd85e2_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_trickortreat-7ccd85e2_7ccd85e2_event_key_clan_name_idx";


--
-- Name: players_trickortreat-7ccd85e2_7ccd85e2_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_trickortreat-7ccd85e2_7ccd85e2_lower_idx";


--
-- Name: players_trickortreat-7ccd85e2_7ccd85e2_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_trickortreat-7ccd85e2_7ccd85e2_pkey";


--
-- Name: players_trickortreat-7ccd85e2_7ccd85e2_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_trickortreat-7ccd85e2_7ccd85e2_user_id_observed_at_idx";


--
-- Name: players_trickortreat-7ccd85e2_7ccd85e_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_trickortreat-7ccd85e2_7ccd85e_event_key_global_rank_idx";


--
-- Name: players_turkey2025-38eb8cfa_38eb8cfa_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_turkey2025-38eb8cfa_38eb8cfa_event_key_clan_name_idx";


--
-- Name: players_turkey2025-38eb8cfa_38eb8cfa_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_turkey2025-38eb8cfa_38eb8cfa_event_key_global_rank_idx";


--
-- Name: players_turkey2025-38eb8cfa_38eb8cfa_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_turkey2025-38eb8cfa_38eb8cfa_lower_idx";


--
-- Name: players_turkey2025-38eb8cfa_38eb8cfa_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_turkey2025-38eb8cfa_38eb8cfa_pkey";


--
-- Name: players_turkey2025-38eb8cfa_38eb8cfa_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_turkey2025-38eb8cfa_38eb8cfa_user_id_observed_at_idx";


--
-- Name: players_yearend2024-76d12247_76d12247_event_key_clan_name_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_clan_idx ATTACH PARTITION battles."players_yearend2024-76d12247_76d12247_event_key_clan_name_idx";


--
-- Name: players_yearend2024-76d12247_76d12247_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_global_rank_idx ATTACH PARTITION battles."players_yearend2024-76d12247_76d12247_event_key_global_rank_idx";


--
-- Name: players_yearend2024-76d12247_76d12247_lower_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_username_idx ATTACH PARTITION battles."players_yearend2024-76d12247_76d12247_lower_idx";


--
-- Name: players_yearend2024-76d12247_76d12247_pkey; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_pkey ATTACH PARTITION battles."players_yearend2024-76d12247_76d12247_pkey";


--
-- Name: players_yearend2024-76d12247_76d12247_user_id_observed_at_idx; Type: INDEX ATTACH; Schema: battles; Owner: -
--

ALTER INDEX battles.player_results_user_history_idx ATTACH PARTITION battles."players_yearend2024-76d12247_76d12247_user_id_observed_at_idx";


--
-- Name: Arcade Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Arcade Leaderboard_event_key_user_id_key";


--
-- Name: Arcade Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Arcade Leaderboard_pkey";


--
-- Name: Arcade Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Arcade Leaderboard_user_id_event_key_idx";


--
-- Name: Blood Moon Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Blood Moon Leaderboard_event_key_user_id_key";


--
-- Name: Blood Moon Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Blood Moon Leaderboard_pkey";


--
-- Name: Blood Moon Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Blood Moon Leaderboard_user_id_event_key_idx";


--
-- Name: Boss Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Boss Leaderboard_event_key_user_id_key";


--
-- Name: Boss Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Boss Leaderboard_pkey";


--
-- Name: Boss Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Boss Leaderboard_user_id_event_key_idx";


--
-- Name: Breakout Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Breakout Leaderboard_event_key_user_id_key";


--
-- Name: Breakout Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Breakout Leaderboard_pkey";


--
-- Name: Breakout Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Breakout Leaderboard_user_id_event_key_idx";


--
-- Name: Fiesta Forever!_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Fiesta Forever!_event_key_user_id_key";


--
-- Name: Fiesta Forever!_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Fiesta Forever!_pkey";


--
-- Name: Fiesta Forever!_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Fiesta Forever!_user_id_event_key_idx";


--
-- Name: Fiesta Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Fiesta Leaderboard_event_key_user_id_key";


--
-- Name: Fiesta Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Fiesta Leaderboard_pkey";


--
-- Name: Fiesta Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Fiesta Leaderboard_user_id_event_key_idx";


--
-- Name: Halloween Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Halloween Leaderboard_event_key_user_id_key";


--
-- Name: Halloween Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Halloween Leaderboard_pkey";


--
-- Name: Halloween Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Halloween Leaderboard_user_id_event_key_idx";


--
-- Name: Hatch Battle Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Hatch Battle Leaderboard_event_key_user_id_key";


--
-- Name: Hatch Battle Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Hatch Battle Leaderboard_pkey";


--
-- Name: Hatch Battle Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Hatch Battle Leaderboard_user_id_event_key_idx";


--
-- Name: Kick Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Kick Leaderboard_event_key_user_id_key";


--
-- Name: Kick Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Kick Leaderboard_pkey";


--
-- Name: Kick Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Kick Leaderboard_user_id_event_key_idx";


--
-- Name: PSX Classic Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."PSX Classic Leaderboard_event_key_user_id_key";


--
-- Name: PSX Classic Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."PSX Classic Leaderboard_pkey";


--
-- Name: PSX Classic Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."PSX Classic Leaderboard_user_id_event_key_idx";


--
-- Name: Piñata Maze!_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Piñata Maze!_event_key_user_id_key";


--
-- Name: Piñata Maze!_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Piñata Maze!_pkey";


--
-- Name: Piñata Maze!_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Piñata Maze!_user_id_event_key_idx";


--
-- Name: Space Forge!_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Space Forge!_event_key_user_id_key";


--
-- Name: Space Forge!_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Space Forge!_pkey";


--
-- Name: Space Forge!_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Space Forge!_user_id_event_key_idx";


--
-- Name: Speedrun Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Speedrun Leaderboard_event_key_user_id_key";


--
-- Name: Speedrun Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Speedrun Leaderboard_pkey";


--
-- Name: Speedrun Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Speedrun Leaderboard_user_id_event_key_idx";


--
-- Name: Tap Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Tap Leaderboard_event_key_user_id_key";


--
-- Name: Tap Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Tap Leaderboard_pkey";


--
-- Name: Tap Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Tap Leaderboard_user_id_event_key_idx";


--
-- Name: Time Trial Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Time Trial Leaderboard_event_key_user_id_key";


--
-- Name: Time Trial Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Time Trial Leaderboard_pkey";


--
-- Name: Time Trial Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Time Trial Leaderboard_user_id_event_key_idx";


--
-- Name: Top Hatches_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Top Hatches_event_key_user_id_key";


--
-- Name: Top Hatches_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Top Hatches_pkey";


--
-- Name: Top Hatches_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Top Hatches_user_id_event_key_idx";


--
-- Name: Transcends Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Transcends Leaderboard_event_key_user_id_key";


--
-- Name: Transcends Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Transcends Leaderboard_pkey";


--
-- Name: Transcends Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Transcends Leaderboard_user_id_event_key_idx";


--
-- Name: Yeti Leaderboard_event_key_user_id_key; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_event_key_user_id_key ATTACH PARTITION leaderboards."Yeti Leaderboard_event_key_user_id_key";


--
-- Name: Yeti Leaderboard_pkey; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.results_pkey ATTACH PARTITION leaderboards."Yeti Leaderboard_pkey";


--
-- Name: Yeti Leaderboard_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leaderboards; Owner: -
--

ALTER INDEX leaderboards.leaderboard_results_user_history_idx ATTACH PARTITION leaderboards."Yeti Leaderboard_user_id_event_key_idx";


--
-- Name: 2026 Arcade League_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."2026 Arcade League_event_key_global_rank_idx";


--
-- Name: 2026 Arcade League_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."2026 Arcade League_event_key_pool_rank_idx";


--
-- Name: 2026 Arcade League_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."2026 Arcade League_event_key_team_key_idx";


--
-- Name: 2026 Arcade League_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."2026 Arcade League_pkey";


--
-- Name: 2026 Arcade League_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."2026 Arcade League_user_id_event_key_idx";


--
-- Name: 2026 Space Mine League_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."2026 Space Mine League_event_key_global_rank_idx";


--
-- Name: 2026 Space Mine League_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."2026 Space Mine League_event_key_pool_rank_idx";


--
-- Name: 2026 Space Mine League_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."2026 Space Mine League_event_key_team_key_idx";


--
-- Name: 2026 Space Mine League_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."2026 Space Mine League_pkey";


--
-- Name: 2026 Space Mine League_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."2026 Space Mine League_user_id_event_key_idx";


--
-- Name: Basketball Leagues_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."Basketball Leagues_event_key_global_rank_idx";


--
-- Name: Basketball Leagues_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."Basketball Leagues_event_key_pool_rank_idx";


--
-- Name: Basketball Leagues_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."Basketball Leagues_event_key_team_key_idx";


--
-- Name: Basketball Leagues_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."Basketball Leagues_pkey";


--
-- Name: Basketball Leagues_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."Basketball Leagues_user_id_event_key_idx";


--
-- Name: Blood Moon League_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."Blood Moon League_event_key_global_rank_idx";


--
-- Name: Blood Moon League_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."Blood Moon League_event_key_pool_rank_idx";


--
-- Name: Blood Moon League_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."Blood Moon League_event_key_team_key_idx";


--
-- Name: Blood Moon League_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."Blood Moon League_pkey";


--
-- Name: Blood Moon League_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."Blood Moon League_user_id_event_key_idx";


--
-- Name: Deep Backrooms League_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."Deep Backrooms League_event_key_global_rank_idx";


--
-- Name: Deep Backrooms League_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."Deep Backrooms League_event_key_pool_rank_idx";


--
-- Name: Deep Backrooms League_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."Deep Backrooms League_event_key_team_key_idx";


--
-- Name: Deep Backrooms League_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."Deep Backrooms League_pkey";


--
-- Name: Deep Backrooms League_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."Deep Backrooms League_user_id_event_key_idx";


--
-- Name: Fiesta League_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."Fiesta League_event_key_global_rank_idx";


--
-- Name: Fiesta League_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."Fiesta League_event_key_pool_rank_idx";


--
-- Name: Fiesta League_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."Fiesta League_event_key_team_key_idx";


--
-- Name: Fiesta League_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."Fiesta League_pkey";


--
-- Name: Fiesta League_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."Fiesta League_user_id_event_key_idx";


--
-- Name: Garden League_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."Garden League_event_key_global_rank_idx";


--
-- Name: Garden League_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."Garden League_event_key_pool_rank_idx";


--
-- Name: Garden League_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."Garden League_event_key_team_key_idx";


--
-- Name: Garden League_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."Garden League_pkey";


--
-- Name: Garden League_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."Garden League_user_id_event_key_idx";


--
-- Name: Lucky Breakout League_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."Lucky Breakout League_event_key_global_rank_idx";


--
-- Name: Lucky Breakout League_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."Lucky Breakout League_event_key_pool_rank_idx";


--
-- Name: Lucky Breakout League_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."Lucky Breakout League_event_key_team_key_idx";


--
-- Name: Lucky Breakout League_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."Lucky Breakout League_pkey";


--
-- Name: Lucky Breakout League_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."Lucky Breakout League_user_id_event_key_idx";


--
-- Name: RNG League_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."RNG League_event_key_global_rank_idx";


--
-- Name: RNG League_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."RNG League_event_key_pool_rank_idx";


--
-- Name: RNG League_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."RNG League_event_key_team_key_idx";


--
-- Name: RNG League_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."RNG League_pkey";


--
-- Name: RNG League_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."RNG League_user_id_event_key_idx";


--
-- Name: Soccer League_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."Soccer League_event_key_global_rank_idx";


--
-- Name: Soccer League_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."Soccer League_event_key_pool_rank_idx";


--
-- Name: Soccer League_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."Soccer League_event_key_team_key_idx";


--
-- Name: Soccer League_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."Soccer League_pkey";


--
-- Name: Soccer League_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."Soccer League_user_id_event_key_idx";


--
-- Name: Tap Heroes League 2026_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."Tap Heroes League 2026_event_key_global_rank_idx";


--
-- Name: Tap Heroes League 2026_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."Tap Heroes League 2026_event_key_pool_rank_idx";


--
-- Name: Tap Heroes League 2026_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."Tap Heroes League 2026_event_key_team_key_idx";


--
-- Name: Tap Heroes League 2026_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."Tap Heroes League 2026_pkey";


--
-- Name: Tap Heroes League 2026_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."Tap Heroes League 2026_user_id_event_key_idx";


--
-- Name: Time Trials League_event_key_global_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_global_rank_idx ATTACH PARTITION leagues."Time Trials League_event_key_global_rank_idx";


--
-- Name: Time Trials League_event_key_pool_rank_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_pool_rank_idx ATTACH PARTITION leagues."Time Trials League_event_key_pool_rank_idx";


--
-- Name: Time Trials League_event_key_team_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_event_key_team_key_idx ATTACH PARTITION leagues."Time Trials League_event_key_team_key_idx";


--
-- Name: Time Trials League_pkey; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_pkey ATTACH PARTITION leagues."Time Trials League_pkey";


--
-- Name: Time Trials League_user_id_event_key_idx; Type: INDEX ATTACH; Schema: leagues; Owner: -
--

ALTER INDEX leagues.player_results_user_id_event_key_idx ATTACH PARTITION leagues."Time Trials League_user_id_event_key_idx";


--
-- Name: clan_results clan_results_event_key_fkey; Type: FK CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE ONLY battles.clan_results
    ADD CONSTRAINT clan_results_event_key_fkey FOREIGN KEY (event_key) REFERENCES catalog.battle_events(event_key);


--
-- Name: player_results player_results_event_key_fkey; Type: FK CONSTRAINT; Schema: battles; Owner: -
--

ALTER TABLE battles.player_results
    ADD CONSTRAINT player_results_event_key_fkey FOREIGN KEY (event_key) REFERENCES catalog.battle_events(event_key);


--
-- Name: battle_aliases battle_aliases_event_key_fkey; Type: FK CONSTRAINT; Schema: catalog; Owner: -
--

ALTER TABLE ONLY catalog.battle_aliases
    ADD CONSTRAINT battle_aliases_event_key_fkey FOREIGN KEY (event_key) REFERENCES catalog.battle_events(event_key);


--
-- Name: battle_bot battle_bot_event_key_fkey; Type: FK CONSTRAINT; Schema: imports; Owner: -
--

ALTER TABLE ONLY imports.battle_bot
    ADD CONSTRAINT battle_bot_event_key_fkey FOREIGN KEY (event_key) REFERENCES catalog.battle_events(event_key);


--
-- Name: big_bot big_bot_event_key_fkey; Type: FK CONSTRAINT; Schema: imports; Owner: -
--

ALTER TABLE ONLY imports.big_bot
    ADD CONSTRAINT big_bot_event_key_fkey FOREIGN KEY (event_key) REFERENCES catalog.battle_events(event_key);


--
-- Name: cw_bot cw_bot_event_key_fkey; Type: FK CONSTRAINT; Schema: imports; Owner: -
--

ALTER TABLE ONLY imports.cw_bot
    ADD CONSTRAINT cw_bot_event_key_fkey FOREIGN KEY (event_key) REFERENCES catalog.battle_events(event_key);


--
-- Name: results results_event_key_fkey; Type: FK CONSTRAINT; Schema: leaderboards; Owner: -
--

ALTER TABLE leaderboards.results
    ADD CONSTRAINT results_event_key_fkey FOREIGN KEY (event_key) REFERENCES leaderboards.events(event_key);


--
-- Name: coverage coverage_event_key_fkey; Type: FK CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.coverage
    ADD CONSTRAINT coverage_event_key_fkey FOREIGN KEY (event_key) REFERENCES leagues.events(event_key);


--
-- Name: player_results league_player_team_fk; Type: FK CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE leagues.player_results
    ADD CONSTRAINT league_player_team_fk FOREIGN KEY (event_key, team_key) REFERENCES leagues.team_results(event_key, team_key);


--
-- Name: player_results player_results_event_key_fkey; Type: FK CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE leagues.player_results
    ADD CONSTRAINT player_results_event_key_fkey FOREIGN KEY (event_key) REFERENCES leagues.events(event_key);


--
-- Name: team_results team_results_event_key_fkey; Type: FK CONSTRAINT; Schema: leagues; Owner: -
--

ALTER TABLE ONLY leagues.team_results
    ADD CONSTRAINT team_results_event_key_fkey FOREIGN KEY (event_key) REFERENCES leagues.events(event_key);


--
CREATE TABLE battles."Halloween Games 2026" PARTITION OF battles.player_results FOR VALUES IN ('HalloweenGamesBattle2026');

-- PostgreSQL database dump complete
--

\unrestrict 70cJqEZdcRcxXY9yRdvudqv6ephAqf5kzuVf8qzGNnzgL6CZMg4cNiAkh7AbvLT

