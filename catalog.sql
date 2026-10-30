--
-- PostgreSQL database dump
--

\restrict zFZxbqUWvMuHwM7Uwq5NW8bSWURzBFqQNukWkw1aw4q7fOrNSEwnqBYK0QHTfYh

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
-- Data for Name: battle_events; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.battle_events (event_key, title, started_at, ended_at, result_table, clan_table, metadata) FROM stdin;
BasketballBattle	Basketball Battle	2025-05-31 16:00:00+00	2025-06-06 16:00:00+00	battles."Basketball Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["basketballbattle", "Basketball Battle", "BasketballBattle", "Junkyard Hound Battle"], "coverage": null, "official_id": "BasketballBattle", "stored_keys": ["basketballbattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Basketball Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-06-06T16:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-05-31T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Basketball Battle", "previous_boundary_source": null}
BlockPartyBattle	Block Party Battle	2025-07-12 16:00:00+00	2025-07-18 16:00:00+00	battles."Block Party Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["blockpartybattle", "Block Party Battle", "BlockPartyBattle", "Sun Angelus Battle"], "coverage": null, "official_id": "BlockPartyBattle", "stored_keys": ["blockpartybattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Block Party Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-07-18T16:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-07-12T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Block Party Battle", "previous_boundary_source": null}
CardBattle	Evil Battle	2025-02-22 17:00:00+00	2025-02-28 17:00:00+00	battles."Evil Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["evilbattle", "Evil Battle", "CardBattle"], "coverage": null, "official_id": "CardBattle", "stored_keys": ["evilbattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Evil Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-02-28T17:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-02-22T17:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Evil Battle", "previous_boundary_source": null}
Christmas2024	Gingerbread Battle	2024-12-14 17:00:30+00	2024-12-20 17:00:00+00	battles."Gingerbread Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["gingerbreadbattle", "Gingerbread Battle", "Christmas2024", "Gingerbread Clan Battle"], "coverage": null, "official_id": "Christmas2024", "stored_keys": ["gingerbreadbattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Gingerbread Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2024-12-20T17:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2024-12-14T17:00:30.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Gingerbread Battle", "previous_boundary_source": null}
Christmas2025	Gingerbread Battle 2025	2025-12-20 17:00:00+00	2025-12-26 17:00:00+00	battles."Gingerbread Battle 2025"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["christmas2025", "Christmas2025", "Gingerbread Battle 2025", "Christmas 2025", "Silver Clan Battle", "Silver Battle"], "coverage": null, "official_id": "Christmas2025", "stored_keys": ["christmas2025"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Gingerbread Battle 2025", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-12-26T17:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-12-20T17:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Gingerbread Battle 2025", "previous_boundary_source": null}
FantasyBattle2026	Fantasy 2026	2026-10-24 16:00:00+00	2026-10-30 16:00:00+00	battles."Fantasy 2026"	battles.clan_results	{"issues": [], "aliases": ["FantasyBattle2026", "Fantasy Battle 2026"], "coverage": {"status": "partial", "rank_caveat": "Ranks are within the incomplete saved pool; some tracked-clan totals have later saved pre-end corrections.", "target_clan_slots": 1000, "collected_clan_slots": 900, "global_source_window": {"to": "2026-10-30T15:27:19Z", "from": "2026-10-30T15:15:19Z"}, "published_player_count": 36621, "missing_clan_rank_range": [151, 250], "tracked_clan_corrections": 21}, "official_id": "FantasyBattle2026", "stored_keys": ["FantasyBattle2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Fantasy 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-10-30T16:00:00.000Z", "legacy_event_window": {"ended_at": "2026-10-30T16:00:00+00:00", "started_at": "2026-10-24T16:00:00+00:00"}, "official_started_at": "2026-10-24T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Fantasy Battle 2026", "previous_boundary_source": "c0ld_battle_runs.consensus"}
GummyBattle2026	Gummy 2026	2026-07-25 16:00:00+00	2026-07-31 16:00:00+00	battles."Gummy 2026"	battles.clan_results	{"issues": [], "aliases": ["GummyBattle2026", "gummybattle2026", "Gummy Battle 2026"], "coverage": null, "official_id": "GummyBattle2026", "stored_keys": ["GummyBattle2026", "gummybattle2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Gummy 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-07-31T16:00:00.000Z", "legacy_event_window": {"ended_at": "2026-07-31T16:00:00+00:00", "started_at": "2026-07-25T16:19:45.67+00:00"}, "official_started_at": "2026-07-25T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Gummy Battle 2026", "previous_boundary_source": "c0ld_battle_runs.consensus"}
HatchWarBattle2026	Hatch War 2026	2026-10-03 16:00:00+00	2026-10-09 16:00:00+00	battles."Hatch War 2026"	battles.clan_results	{"issues": ["native_start_disagreement"], "aliases": ["HatchWarBattle2026"], "coverage": null, "official_id": "HatchWarBattle2026", "stored_keys": ["HatchWarBattle2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Hatch War 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-10-09T16:00:00.000Z", "legacy_event_window": {"ended_at": "2026-10-09T16:00:00+00:00", "started_at": null}, "official_started_at": "2026-10-03T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "HatchWarBattle2026", "previous_boundary_source": "c0ld_battle_runs.consensus"}
AngelBattle2026	Angel 2026	2026-05-09 16:00:00+00	2026-05-15 16:00:00+00	battles."Angel 2026"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["angelbattle2026", "AngelBattle2026", "Angel Battle 2026"], "coverage": null, "official_id": "AngelBattle2026", "stored_keys": ["angelbattle2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Angel 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-05-15T16:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2026-05-09T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Angel Battle 2026", "previous_boundary_source": null}
ArcadeBattle2026	Arcade 2026	2026-09-05 18:00:00+00	2026-09-11 17:30:00+00	battles."Arcade 2026"	battles.clan_results	{"issues": [], "aliases": ["ArcadeBattle2026", "Arcade Battle 2026"], "coverage": null, "official_id": "ArcadeBattle2026", "stored_keys": ["ArcadeBattle2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Arcade 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-09-11T17:30:00.000Z", "legacy_event_window": {"ended_at": "2026-09-11T17:30:00+00:00", "started_at": "2026-09-05T16:21:17.105+00:00"}, "official_started_at": "2026-09-05T18:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Arcade Battle 2026", "previous_boundary_source": "c0ld_battle_windows.enabled"}
LuckyBattle	Lucky Battle	2025-03-08 17:00:00+00	2025-03-14 17:00:00+00	battles."Lucky Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["luckybattle", "Lucky Battle", "LuckyBattle", "Egyptian Battle"], "coverage": null, "official_id": "LuckyBattle", "stored_keys": ["luckybattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Lucky Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-03-14T17:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-03-08T17:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Lucky Battle", "previous_boundary_source": null}
LuckyChestBattle	Lucky Chest Battle	2026-03-14 16:00:00+00	2026-03-28 15:00:00+00	battles."Lucky Chest Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["luckychestbattle", "Lucky Chest Battle", "LuckyChestBattle", "Lucky Chest", "Clover Clan Battle", "Clover Battle"], "coverage": null, "official_id": "LuckyChestBattle", "stored_keys": ["luckychestbattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Lucky Chest Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-03-28T15:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2026-03-14T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Lucky Chest Battle", "previous_boundary_source": null}
LunarBattle2026	Lunar 2026	2026-07-11 16:00:00+00	2026-07-17 16:00:00+00	battles."Lunar 2026"	battles.clan_results	{"issues": [], "aliases": ["LunarBattle2026", "lunarbattle2026", "Lunar Battle 2026"], "coverage": null, "official_id": "LunarBattle2026", "stored_keys": ["LunarBattle2026", "lunarbattle2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Lunar 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-07-17T16:00:00.000Z", "legacy_event_window": {"ended_at": "2026-07-17T16:00:00+00:00", "started_at": "2026-07-11T18:33:52.029+00:00"}, "official_started_at": "2026-07-11T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Lunar Battle 2026", "previous_boundary_source": "c0ld_battle_runs.consensus"}
NewYear2024	New Years Battle	2024-12-28 17:00:00+00	2025-01-03 17:00:00+00	battles."New Years Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["newyearsbattle", "New Years Battle", "NewYear2024"], "coverage": null, "official_id": "NewYear2024", "stored_keys": ["newyearsbattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "New Years Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-01-03T17:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2024-12-28T17:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "New Years Battle", "previous_boundary_source": null}
NinjaBattle2026	Ninja 2026	2026-08-08 17:00:00+00	2026-08-14 16:00:00+00	battles."Ninja 2026"	battles.clan_results	{"issues": [], "aliases": ["NinjaBattle2026", "ninjabattle2026", "Ninja Battle 2026"], "coverage": null, "official_id": "NinjaBattle2026", "stored_keys": ["NinjaBattle2026", "ninjabattle2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Ninja 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-08-14T16:00:00.000Z", "legacy_event_window": {"ended_at": "2026-08-14T16:00:00+00:00", "started_at": "2026-08-08T16:00:45.688+00:00"}, "official_started_at": "2026-08-08T17:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Ninja Battle 2026", "previous_boundary_source": "c0ld_battle_windows.enabled"}
PixelChickBattle	Pixel Chick Battle	2025-04-19 16:00:00+00	2025-04-25 16:00:00+00	battles."Pixel Chick Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["pixelchickbattle", "Pixel Chick Battle", "PixelChickBattle"], "coverage": null, "official_id": "PixelChickBattle", "stored_keys": ["pixelchickbattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Pixel Chick Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-04-25T16:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-04-19T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Pixel Chick Battle", "previous_boundary_source": null}
PoisonTurtleBattle	Poison Turtle Battle	2025-05-03 16:00:00+00	2025-05-09 16:00:00+00	battles."Poison Turtle Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["poisonturtlebattle", "Poison Turtle Battle", "PoisonTurtleBattle"], "coverage": null, "official_id": "PoisonTurtleBattle", "stored_keys": ["poisonturtlebattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Poison Turtle Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-05-09T16:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-05-03T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Poison Turtle Battle", "previous_boundary_source": null}
RoyalBattle2026	Royal 2026	2026-08-22 16:59:00+00	2026-08-28 16:00:00+00	battles."Royal 2026"	battles.clan_results	{"issues": [], "aliases": ["RoyalBattle2026", "royalbattle2026", "Royal Battle 2026"], "coverage": null, "official_id": "RoyalBattle2026", "stored_keys": ["RoyalBattle2026", "royalbattle2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Royal 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-08-28T16:00:00.000Z", "legacy_event_window": {"ended_at": "2026-08-28T16:00:00+00:00", "started_at": "2026-08-21T16:59:00+00:00"}, "official_started_at": "2026-08-22T16:59:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Royal Battle 2026", "previous_boundary_source": "c0ld_battle_windows.enabled"}
SantaBattle	Bee Battle	2024-12-07 17:00:00+00	2024-12-13 17:00:00+00	battles."Bee Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["beebattle", "Bee Battle", "SantaBattle", "Bee Clan Battle"], "coverage": null, "official_id": "SantaBattle", "stored_keys": ["beebattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Bee Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2024-12-13T17:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2024-12-07T17:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Bee Battle", "previous_boundary_source": null}
SoccerBattle2026	Soccer 2026	2026-06-27 16:00:00+00	2026-07-03 15:00:00+00	battles."Soccer 2026"	battles.clan_results	{"issues": ["native_end_disagreement"], "aliases": ["SoccerBattle2026", "soccerbattle2026", "Soccer Battle 2026"], "coverage": null, "official_id": "SoccerBattle2026", "stored_keys": ["SoccerBattle2026", "soccerbattle2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Soccer 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-07-03T15:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": "2026-06-20T16:00:00+00:00"}, "official_started_at": "2026-06-27T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Soccer Battle 2026", "previous_boundary_source": "c0ld_battle_runs.consensus"}
SpaceMineBattle2026	Space Mine 2026	2026-09-19 17:00:00+00	2026-09-25 16:00:00+00	battles."Space Mine 2026"	battles.clan_results	{"issues": ["native_start_disagreement"], "aliases": ["SpaceMineBattle2026", "Space Mine Battle 2026"], "coverage": null, "official_id": "SpaceMineBattle2026", "stored_keys": ["SpaceMineBattle2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Space Mine 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-09-25T16:00:00.000Z", "legacy_event_window": {"ended_at": "2026-09-25T16:00:00+00:00", "started_at": null}, "official_started_at": "2026-09-19T17:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Space Mine Battle 2026", "previous_boundary_source": "c0ld_battle_runs.consensus"}
SquidBattle	Pet Games Battle	2025-01-11 17:00:00+00	2025-01-24 17:00:00+00	battles."Pet Games Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["petgamesbattle", "Pet Games Battle", "SquidBattle"], "coverage": null, "official_id": "SquidBattle", "stored_keys": ["petgamesbattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Pet Games Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-01-24T17:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-01-11T17:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Pet Games Battle", "previous_boundary_source": null}
StarryBattle	Starry	2026-04-25 16:00:00+00	2026-05-02 15:00:00+00	battles."Starry"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["starrybattle", "StarryBattle", "Starry Battle", "Starry"], "coverage": null, "official_id": "StarryBattle", "stored_keys": ["starrybattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Starry", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-05-02T15:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2026-04-25T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Starry Battle", "previous_boundary_source": null}
StrengthBattle	Strength Battle	2025-06-28 16:00:00+00	2025-07-04 16:00:00+00	battles."Strength Battle"	battles.clan_results	{"issues": [], "aliases": ["stregnthbattle", "StregnthBattle", "StrengthBattle", "Strength Battle", "Scuba Dog Battle"], "coverage": null, "official_id": "StrengthBattle", "stored_keys": ["stregnthbattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Strength Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-07-04T16:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-06-28T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Strength Battle", "previous_boundary_source": null}
AthenaBattle	Athena Battle	2025-03-29 16:00:00+00	2025-04-04 16:00:00+00	battles."Athena Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["athenabattle", "Athena Battle", "AthenaBattle"], "coverage": null, "official_id": "AthenaBattle", "stored_keys": ["athenabattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Athena Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-04-04T16:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-03-29T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Athena Battle", "previous_boundary_source": null}
Backrooms2026	Backrooms 2026	2026-06-13 18:00:00+00	2026-06-19 16:00:00+00	battles."Backrooms 2026"	battles.clan_results	{"issues": [], "aliases": ["Backrooms2026", "backrooms2026", "Backrooms 2026", "Deep Backrooms"], "coverage": null, "official_id": "Backrooms2026", "stored_keys": ["Backrooms2026", "backrooms2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Backrooms 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-06-19T16:00:00.000Z", "legacy_event_window": {"ended_at": "2026-06-19T16:00:00+00:00", "started_at": "2026-06-06T18:00:00+00:00"}, "official_started_at": "2026-06-13T18:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Backrooms 2026", "previous_boundary_source": "c0ld_battle_runs.consensus"}
BalloonCorgiBattle	Balloon Corgi Battle	2025-05-17 16:00:00+00	2025-05-23 16:00:00+00	battles."Balloon Corgi Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["ballooncorgibattle", "Balloon Corgi Battle", "BalloonCorgiBattle"], "coverage": null, "official_id": "BalloonCorgiBattle", "stored_keys": ["ballooncorgibattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Balloon Corgi Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-05-23T16:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-05-17T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Balloon Corgi Battle", "previous_boundary_source": null}
TieDyeBattle	Tie Dye Battle	2025-03-15 16:00:00+00	2025-03-21 16:00:00+00	battles."Tie Dye Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["tiedyebattle", "Tie Dye Battle", "TieDyeBattle"], "coverage": null, "official_id": "TieDyeBattle", "stored_keys": ["tiedyebattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Tie Dye Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-03-21T16:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-03-15T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Tie Dye Battle", "previous_boundary_source": null}
TowerBattle	Tower Defense Battle	2025-06-14 16:00:00+00	2025-06-20 16:00:00+00	battles."Tower Defense Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["towerbattle", "TowerBattle", "Tower Defense Battle", "Tower Battle", "Nightmare Cyclops Battle"], "coverage": null, "official_id": "TowerBattle", "stored_keys": ["towerbattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Tower Defense Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-06-20T16:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-06-14T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Tower Defense Battle", "previous_boundary_source": null}
TrickOrTreat	Trick or Treat Battle	2025-10-18 16:00:00+00	2025-10-24 16:00:00+00	battles."Trick or Treat Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["trickortreat", "TrickOrTreat", "Trick or Treat Battle", "TrickOrTreatBattle"], "coverage": null, "official_id": "TrickOrTreat", "stored_keys": ["trickortreat"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Trick or Treat Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-10-24T16:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-10-18T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Trick or Treat Battle", "previous_boundary_source": null}
Spring2026	Spring 2026	2026-04-18 16:00:00+00	2026-04-24 15:00:00+00	battles."Spring 2026"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["spring2026", "Spring2026", "Spring 2026", "Abstract Battle"], "coverage": null, "official_id": "Spring2026", "stored_keys": ["spring2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Spring 2026", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2026-04-24T15:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2026-04-18T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Spring 2026", "previous_boundary_source": null}
Turkey2025	Thanksgiving 2025 Battle	2025-11-29 17:00:00+00	2025-12-05 17:00:00+00	battles."Thanksgiving 2025 Battle"	battles.clan_results	{"issues": [], "aliases": ["thanksgiving2025battle", "Thanksgiving 2025 Battle", "Turkey2025", "Turkey 2025", "Forged Battle"], "coverage": null, "official_id": "Turkey2025", "stored_keys": ["thanksgiving2025battle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Thanksgiving 2025 Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2025-12-05T17:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2025-11-29T17:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Thanksgiving 2025 Battle", "previous_boundary_source": null}
YearEnd2024	Christmas Present Battle	2024-12-21 17:00:00+00	2024-12-27 17:00:00+00	battles."Christmas Present Battle"	battles.clan_results	{"issues": ["import_dates_are_not_battle_dates"], "aliases": ["christmaspresentbattle", "Christmas Present Battle", "YearEnd2024", "Diamond Clan Battle", "Diamond Battle"], "coverage": null, "official_id": "YearEnd2024", "stored_keys": ["christmaspresentbattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Christmas Present Battle", "boundary_source": "https://db.biggames.io/clans/battles", "official_ended_at": "2024-12-27T17:00:00.000Z", "legacy_event_window": {"ended_at": null, "started_at": null}, "official_started_at": "2024-12-21T17:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "previous_display_name": "Christmas Present Battle", "previous_boundary_source": null}
\.


--
-- Data for Name: battle_aliases; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.battle_aliases (event_key, alias, alias_kind) FROM stdin;
AngelBattle2026	AngelBattle2026	preserved
AngelBattle2026	angelbattle2026	preserved
AngelBattle2026	Angel Battle 2026	preserved
ArcadeBattle2026	ArcadeBattle2026	preserved
ArcadeBattle2026	Arcade Battle 2026	preserved
AthenaBattle	AthenaBattle	preserved
AthenaBattle	athenabattle	preserved
AthenaBattle	Athena Battle	preserved
Backrooms2026	Backrooms2026	preserved
Backrooms2026	backrooms2026	preserved
Backrooms2026	Backrooms 2026	preserved
Backrooms2026	Deep Backrooms	preserved
BalloonCorgiBattle	BalloonCorgiBattle	preserved
BalloonCorgiBattle	ballooncorgibattle	preserved
BalloonCorgiBattle	Balloon Corgi Battle	preserved
BasketballBattle	BasketballBattle	preserved
BasketballBattle	basketballbattle	preserved
BasketballBattle	Basketball Battle	preserved
BasketballBattle	Junkyard Hound Battle	preserved
BlockPartyBattle	BlockPartyBattle	preserved
BlockPartyBattle	blockpartybattle	preserved
BlockPartyBattle	Block Party Battle	preserved
BlockPartyBattle	Sun Angelus Battle	preserved
CardBattle	CardBattle	preserved
CardBattle	evilbattle	preserved
CardBattle	Evil Battle	preserved
Christmas2024	Christmas2024	preserved
Christmas2024	gingerbreadbattle	preserved
Christmas2024	Gingerbread Battle	preserved
Christmas2024	Gingerbread Clan Battle	preserved
Christmas2025	Christmas2025	preserved
Christmas2025	christmas2025	preserved
Christmas2025	Gingerbread Battle 2025	preserved
Christmas2025	Christmas 2025	preserved
Christmas2025	Silver Clan Battle	preserved
Christmas2025	Silver Battle	preserved
FantasyBattle2026	FantasyBattle2026	preserved
FantasyBattle2026	Fantasy Battle 2026	preserved
GummyBattle2026	GummyBattle2026	preserved
GummyBattle2026	gummybattle2026	preserved
GummyBattle2026	Gummy Battle 2026	preserved
HatchWarBattle2026	HatchWarBattle2026	preserved
LuckyBattle	LuckyBattle	preserved
LuckyBattle	luckybattle	preserved
LuckyBattle	Lucky Battle	preserved
LuckyBattle	Egyptian Battle	preserved
LuckyChestBattle	LuckyChestBattle	preserved
LuckyChestBattle	luckychestbattle	preserved
LuckyChestBattle	Lucky Chest Battle	preserved
LuckyChestBattle	Lucky Chest	preserved
LuckyChestBattle	Clover Clan Battle	preserved
LuckyChestBattle	Clover Battle	preserved
LunarBattle2026	LunarBattle2026	preserved
LunarBattle2026	lunarbattle2026	preserved
LunarBattle2026	Lunar Battle 2026	preserved
NewYear2024	NewYear2024	preserved
NewYear2024	newyearsbattle	preserved
NewYear2024	New Years Battle	preserved
NinjaBattle2026	NinjaBattle2026	preserved
NinjaBattle2026	ninjabattle2026	preserved
NinjaBattle2026	Ninja Battle 2026	preserved
PixelChickBattle	PixelChickBattle	preserved
PixelChickBattle	pixelchickbattle	preserved
PixelChickBattle	Pixel Chick Battle	preserved
PoisonTurtleBattle	PoisonTurtleBattle	preserved
PoisonTurtleBattle	poisonturtlebattle	preserved
PoisonTurtleBattle	Poison Turtle Battle	preserved
RoyalBattle2026	RoyalBattle2026	preserved
RoyalBattle2026	royalbattle2026	preserved
RoyalBattle2026	Royal Battle 2026	preserved
SantaBattle	SantaBattle	preserved
SantaBattle	beebattle	preserved
SantaBattle	Bee Battle	preserved
SantaBattle	Bee Clan Battle	preserved
SoccerBattle2026	SoccerBattle2026	preserved
SoccerBattle2026	soccerbattle2026	preserved
SoccerBattle2026	Soccer Battle 2026	preserved
SpaceMineBattle2026	SpaceMineBattle2026	preserved
SpaceMineBattle2026	Space Mine Battle 2026	preserved
Spring2026	Spring2026	preserved
Spring2026	spring2026	preserved
Spring2026	Spring 2026	preserved
Spring2026	Abstract Battle	preserved
SquidBattle	SquidBattle	preserved
SquidBattle	petgamesbattle	preserved
SquidBattle	Pet Games Battle	preserved
StarryBattle	StarryBattle	preserved
StarryBattle	starrybattle	preserved
StarryBattle	Starry Battle	preserved
StarryBattle	Starry	preserved
StrengthBattle	StrengthBattle	preserved
StrengthBattle	stregnthbattle	preserved
StrengthBattle	StregnthBattle	preserved
StrengthBattle	Strength Battle	preserved
StrengthBattle	Scuba Dog Battle	preserved
TieDyeBattle	TieDyeBattle	preserved
TieDyeBattle	tiedyebattle	preserved
TieDyeBattle	Tie Dye Battle	preserved
TowerBattle	TowerBattle	preserved
TowerBattle	towerbattle	preserved
TowerBattle	Tower Defense Battle	preserved
TowerBattle	Tower Battle	preserved
TowerBattle	Nightmare Cyclops Battle	preserved
TrickOrTreat	TrickOrTreat	preserved
TrickOrTreat	trickortreat	preserved
TrickOrTreat	Trick or Treat Battle	preserved
TrickOrTreat	TrickOrTreatBattle	preserved
Turkey2025	Turkey2025	preserved
Turkey2025	thanksgiving2025battle	preserved
Turkey2025	Thanksgiving 2025 Battle	preserved
Turkey2025	Turkey 2025	preserved
Turkey2025	Forged Battle	preserved
YearEnd2024	YearEnd2024	preserved
YearEnd2024	christmaspresentbattle	preserved
YearEnd2024	Christmas Present Battle	preserved
YearEnd2024	Diamond Clan Battle	preserved
YearEnd2024	Diamond Battle	preserved
AngelBattle2026	Angel Battle 2026	previous_display_name
AngelBattle2026	Angel 2026	official_display_name
ArcadeBattle2026	Arcade Battle 2026	previous_display_name
ArcadeBattle2026	Arcade 2026	official_display_name
AthenaBattle	Athena Battle	previous_display_name
AthenaBattle	Athena Battle	official_display_name
Backrooms2026	Backrooms 2026	previous_display_name
Backrooms2026	Backrooms 2026	official_display_name
BalloonCorgiBattle	Balloon Corgi Battle	previous_display_name
BalloonCorgiBattle	Balloon Corgi Battle	official_display_name
BasketballBattle	Basketball Battle	previous_display_name
BasketballBattle	Basketball Battle	official_display_name
BlockPartyBattle	Block Party Battle	previous_display_name
BlockPartyBattle	Block Party Battle	official_display_name
CardBattle	Evil Battle	previous_display_name
CardBattle	Evil Battle	official_display_name
Christmas2024	Gingerbread Battle	previous_display_name
Christmas2024	Gingerbread Battle	official_display_name
Christmas2025	Gingerbread Battle 2025	previous_display_name
Christmas2025	Gingerbread Battle 2025	official_display_name
FantasyBattle2026	Fantasy Battle 2026	previous_display_name
FantasyBattle2026	Fantasy 2026	official_display_name
GummyBattle2026	Gummy Battle 2026	previous_display_name
GummyBattle2026	Gummy 2026	official_display_name
HatchWarBattle2026	HatchWarBattle2026	previous_display_name
HatchWarBattle2026	Hatch War 2026	official_display_name
LuckyBattle	Lucky Battle	previous_display_name
LuckyBattle	Lucky Battle	official_display_name
LuckyChestBattle	Lucky Chest Battle	previous_display_name
LuckyChestBattle	Lucky Chest Battle	official_display_name
LunarBattle2026	Lunar Battle 2026	previous_display_name
LunarBattle2026	Lunar 2026	official_display_name
NewYear2024	New Years Battle	previous_display_name
NewYear2024	New Years Battle	official_display_name
NinjaBattle2026	Ninja Battle 2026	previous_display_name
NinjaBattle2026	Ninja 2026	official_display_name
PixelChickBattle	Pixel Chick Battle	previous_display_name
PixelChickBattle	Pixel Chick Battle	official_display_name
PoisonTurtleBattle	Poison Turtle Battle	previous_display_name
PoisonTurtleBattle	Poison Turtle Battle	official_display_name
RoyalBattle2026	Royal Battle 2026	previous_display_name
RoyalBattle2026	Royal 2026	official_display_name
SantaBattle	Bee Battle	previous_display_name
SantaBattle	Bee Battle	official_display_name
SoccerBattle2026	Soccer Battle 2026	previous_display_name
SoccerBattle2026	Soccer 2026	official_display_name
SpaceMineBattle2026	Space Mine Battle 2026	previous_display_name
SpaceMineBattle2026	Space Mine 2026	official_display_name
Spring2026	Spring 2026	previous_display_name
Spring2026	Spring 2026	official_display_name
SquidBattle	Pet Games Battle	previous_display_name
SquidBattle	Pet Games Battle	official_display_name
StarryBattle	Starry Battle	previous_display_name
StarryBattle	Starry	official_display_name
StrengthBattle	Strength Battle	previous_display_name
StrengthBattle	Strength Battle	official_display_name
TieDyeBattle	Tie Dye Battle	previous_display_name
TieDyeBattle	Tie Dye Battle	official_display_name
TowerBattle	Tower Defense Battle	previous_display_name
TowerBattle	Tower Defense Battle	official_display_name
TrickOrTreat	Trick or Treat Battle	previous_display_name
TrickOrTreat	Trick or Treat Battle	official_display_name
Turkey2025	Thanksgiving 2025 Battle	previous_display_name
Turkey2025	Thanksgiving 2025 Battle	official_display_name
YearEnd2024	Christmas Present Battle	previous_display_name
YearEnd2024	Christmas Present Battle	official_display_name
AngelBattle2026	battleangelbattle2026	resolved_import_key
AngelBattle2026	🔹 Battle: **AngelBattle2026**	resolved_import_name
AthenaBattle	battleathenabattle	resolved_import_key
AthenaBattle	🔹 Battle: **AthenaBattle**	resolved_import_name
BalloonCorgiBattle	battleballooncorgibattle	resolved_import_key
BalloonCorgiBattle	🔹 Battle: **BalloonCorgiBattle**	resolved_import_name
BasketballBattle	battlebasketballbattle	resolved_import_key
BasketballBattle	🔹 Battle: **BasketballBattle**	resolved_import_name
BlockPartyBattle	battleblockpartybattle	resolved_import_key
BlockPartyBattle	🔹 Battle: **BlockPartyBattle**	resolved_import_name
Christmas2025	battlechristmas2025	resolved_import_key
Christmas2025	🔹 Battle: **Christmas2025**	resolved_import_name
LuckyChestBattle	battleluckychestbattle	resolved_import_key
LuckyChestBattle	🔹 Battle: **LuckyChestBattle**	resolved_import_name
PixelChickBattle	battlepixelchickbattle	resolved_import_key
PixelChickBattle	🔹 Battle: **PixelChickBattle**	resolved_import_name
PoisonTurtleBattle	battlepoisonturtlebattle	resolved_import_key
PoisonTurtleBattle	🔹 Battle: **PoisonTurtleBattle**	resolved_import_name
Spring2026	battlespring2026	resolved_import_key
Spring2026	🔹 Battle: **Spring2026**	resolved_import_name
StarryBattle	battlestarrybattle	resolved_import_key
StarryBattle	🔹 Battle: **StarryBattle**	resolved_import_name
StrengthBattle	battlestrengthbattle	resolved_import_key
StrengthBattle	🔹 Battle: **StrengthBattle**	resolved_import_name
TieDyeBattle	battletiedyebattle	resolved_import_key
TieDyeBattle	🔹 Battle: **TieDyeBattle**	resolved_import_name
TowerBattle	battletowerbattle	resolved_import_key
TowerBattle	🔹 Battle: **TowerBattle**	resolved_import_name
TrickOrTreat	battletrickortreat	resolved_import_key
TrickOrTreat	🔹 Battle: **TrickOrTreat**	resolved_import_name
Turkey2025	battleturkey2025	resolved_import_key
Turkey2025	🔹 Battle: **Turkey2025**	resolved_import_name
GummyBattle2026	gummybattle2026ix	resolved_import_key
GummyBattle2026	GummyBattle2026 IX	resolved_import_name
PixelChickBattle	pixelchickbattleix	resolved_import_key
PixelChickBattle	PixelChickBattle IX	resolved_import_name
PoisonTurtleBattle	poisonturtlebattleix	resolved_import_key
PoisonTurtleBattle	PoisonTurtleBattle IX	resolved_import_name
\.


--
-- Data for Name: unresolved_event_names; Type: TABLE DATA; Schema: catalog; Owner: -
--

COPY catalog.unresolved_event_names (original_key, title, reasons, metadata) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: leagues; Owner: -
--

COPY leagues.events (event_key, original_event_key, title, update_number, started_at, ended_at, source_url, source_run_keys, updated_at, observation_table, metadata) FROM stdin;
time-trials-2026	time-trials-2026	Time Trials League	77	2026-05-02 17:00:00+00	2026-05-04 17:00:00+00	https://www.biggames.io/post/pet-simulator-99-update-77	{}	2026-08-20 18:48:26.809869+00	leagues."Time Trials League"	{"coverage": "catalog_only_no_saved_final_rows", "official_ids": ["TimeTrialsBattle"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Time Trials League", "boundary_source": "https://db.biggames.io/clans/battles", "archive_verified": false, "saved_final_rows": 0, "official_ended_at": "2026-05-04T17:00:00.000Z", "official_started_at": "2026-05-02T17:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "legacy_capture_window": {"ended_at": "2026-05-04T16:00:00+00:00", "started_at": "2026-05-02T16:00:00+00:00"}, "previous_display_name": "Time Trials", "previous_boundary_source": "ps99_league_events"}
soccer-2026	soccer-2026	Soccer League	83	2026-06-27 16:00:00+00	2026-07-10 16:00:00+00	https://www.biggames.io/post/pet-simulator-99-update-83	{active}	2026-08-20 18:48:26.809869+00	leagues."Soccer League"	{"coverage": "saved_results", "official_ids": ["SoccerLeague2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Soccer League", "boundary_source": "https://db.biggames.io/leagues/seasons", "archive_verified": true, "saved_final_rows": 233, "official_ended_at": "2026-07-10T16:00:00.000Z", "official_started_at": "2026-06-27T16:00:00.000Z", "official_name_source": "https://db.biggames.io/leagues/seasons", "legacy_capture_window": {"ended_at": "2026-07-11T16:00:00+00:00", "started_at": "2026-07-04T16:00:00+00:00"}, "previous_display_name": "Soccer", "previous_boundary_source": "ps99_league_events"}
rng-2026	rng-2026	RNG League	79	2026-05-16 16:00:00+00	2026-05-30 16:00:00+00	https://www.biggames.io/post/pet-simulator-99-update-79	{}	2026-08-20 18:48:26.809869+00	leagues."RNG League"	{"coverage": "saved_results", "display_name": "RNG League", "official_ids": ["RngBattleU79"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "RNG League U79", "boundary_source": "https://db.biggames.io/clans/battles", "archive_verified": false, "saved_final_rows": 5, "official_ended_at": "2026-05-30T16:00:00.000Z", "official_started_at": "2026-05-16T16:00:00.000Z", "official_name_source": "https://db.biggames.io/clans/battles", "legacy_capture_window": {"ended_at": "2026-05-30T16:00:00+00:00", "started_at": "2026-05-16T16:00:00+00:00"}, "previous_display_name": "RNG", "previous_boundary_source": "ps99_league_events", "previous_public_display_name": "RNG League U79"}
deep-backrooms-2026	deep-backrooms-2026	Deep Backrooms League	81	2026-06-20 05:00:00+00	2026-06-27 15:00:00+00	https://www.biggames.io/post/pet-simulator-99-update-81	{}	2026-08-20 18:48:26.809869+00	leagues."Deep Backrooms League"	{"coverage": "saved_results", "official_id": "DeepBackroomsLeague2026", "display_name": "Deep Backrooms League", "official_ids": ["DeepBackroomsLeague2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Deep Backrooms League", "boundary_source": "https://db.biggames.io/leagues/seasons", "archive_verified": false, "saved_final_rows": 5, "source_alias_ids": ["DeepBackroomsLeague2026C"], "official_ended_at": "2026-06-27T15:00:00.000Z", "identity_resolution": "Both source IDs refer to the same Deep Backrooms League event; C is an alias, not another event.", "official_started_at": "2026-06-20T05:00:00.000Z", "official_name_source": "https://db.biggames.io/leagues/seasons", "legacy_capture_window": {"ended_at": "2026-06-27T16:00:00+00:00", "started_at": "2026-06-20T16:00:00+00:00"}, "previous_display_name": "Deep Backrooms", "previous_boundary_source": "ps99_league_events"}
garden-2026	garden-2026	Garden League	87	2026-07-31 16:00:00+00	2026-08-07 16:00:00+00	https://www.biggames.io/post/pet-simulator-99-update-87	{tap-heroes-part-2,plants-vs-coins-part-2}	2026-08-20 18:48:26.809869+00	leagues."Garden League"	{"coverage": "saved_results", "official_ids": ["GardenLeague2026P2"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Garden League", "boundary_source": "https://db.biggames.io/leagues/seasons", "archive_verified": true, "saved_final_rows": 32134, "official_ended_at": "2026-08-07T16:00:00.000Z", "official_started_at": "2026-07-31T16:00:00.000Z", "official_name_source": "https://db.biggames.io/leagues/seasons", "legacy_capture_window": {"ended_at": "2026-08-15T16:00:00+00:00", "started_at": "2026-08-01T16:00:00+00:00"}, "previous_display_name": "Garden League", "previous_boundary_source": "ps99_league_events"}
fiesta-part-2-2026	fiesta-part-2-2026	Fiesta League	89	2026-08-08 16:59:00+00	2026-08-21 16:00:00+00	https://www.biggames.io/post/pet-simulator-99-update-89	{plants-vs-coins-part-2}	2026-09-12 19:27:46.539862+00	leagues."Fiesta League"	{"coverage": "saved_results", "official_ids": ["FiestaLeague2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Fiesta League", "boundary_source": "https://db.biggames.io/leagues/seasons", "archive_verified": true, "saved_final_rows": 31286, "official_ended_at": "2026-08-21T16:00:00.000Z", "official_started_at": "2026-08-08T16:59:00.000Z", "official_name_source": "https://db.biggames.io/leagues/seasons", "legacy_capture_window": {"ended_at": "2026-08-22T16:00:00+00:00", "started_at": "2026-08-15T16:00:00+00:00"}, "previous_display_name": "Fiesta Part 2", "previous_boundary_source": "ps99_league_events"}
lucky-block-blitz-2026	lucky-block-blitz-2026	Lucky Breakout League	91	2026-08-22 16:00:00+00	2026-09-04 16:00:00+00	https://www.biggames.io/post/pet-simulator-99-update-91	{lucky-block-blitz}	2026-09-12 19:27:46.539862+00	leagues."Lucky Breakout League"	{"coverage": "saved_results", "official_ids": ["LuckyBreakoutLeague2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "Lucky Breakout League", "boundary_source": "https://db.biggames.io/leagues/seasons", "archive_verified": true, "saved_final_rows": 3450, "official_ended_at": "2026-09-04T16:00:00.000Z", "official_started_at": "2026-08-22T16:00:00.000Z", "official_name_source": "https://db.biggames.io/leagues/seasons", "legacy_capture_window": {"ended_at": "2026-09-05T16:00:00+00:00", "started_at": "2026-08-29T16:00:00+00:00"}, "previous_display_name": "Lucky Block Blitz", "previous_boundary_source": "ps99_league_events"}
tap-2026	tap-2026	Tap Heroes League 2026	85	2026-07-11 16:00:00+00	2026-07-24 16:00:00+00	https://www.biggames.io/post/pet-simulator-99-update-85	{tap-heroes-part-2}	2026-08-20 18:48:26.809869+00	leagues."Tap Heroes League 2026"	{"coverage": "saved_results", "display_name": "Tap Heroes League 2026", "official_ids": ["TapHeroesLeague2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "4-Player Tap League", "boundary_source": "https://db.biggames.io/leagues/seasons", "archive_verified": true, "saved_final_rows": 26975, "official_ended_at": "2026-07-24T16:00:00.000Z", "official_started_at": "2026-07-11T16:00:00.000Z", "official_name_source": "https://db.biggames.io/leagues/seasons", "legacy_capture_window": {"ended_at": "2026-08-01T16:00:00+00:00", "started_at": "2026-07-18T16:00:00+00:00"}, "previous_display_name": "Tap", "previous_boundary_source": "ps99_league_events", "previous_public_display_name": "4-Player Tap League"}
arcade-league-2026	arcade-league-2026	2026 Arcade League	93	2026-09-05 16:00:00+00	2026-09-18 16:00:00+00	https://www.biggames.io/post/pet-simulator-99-update-93	{arcade-league-2026}	2026-09-12 19:27:46.539862+00	leagues."2026 Arcade League"	{"coverage": "catalog_only_no_saved_final_rows", "official_ids": ["ArcadeLeague2026"], "name_evidence": "rendered catalog h3 text keyed by title attribute", "official_name": "2026 Arcade League", "boundary_source": "https://db.biggames.io/leagues/seasons", "archive_verified": false, "saved_final_rows": 0, "official_ended_at": "2026-09-18T16:00:00.000Z", "official_started_at": "2026-09-05T16:00:00.000Z", "official_name_source": "https://db.biggames.io/leagues/seasons", "legacy_capture_window": {"ended_at": "2026-09-19T16:00:00+00:00", "started_at": "2026-09-12T16:00:00+00:00"}, "previous_display_name": "2026 Arcade League", "previous_boundary_source": "ps99_league_events"}
basketball-2025	basketball-2025	Basketball Leagues	63	\N	\N	https://www.biggames.io/post/pet-simulator-99-update-63	{}	2026-08-20 18:48:26.809869+00	leagues."Basketball Leagues"	{"coverage": "catalog_only_no_saved_final_rows", "official_ids": [], "name_evidence": "The official post H1 is Basketball Leagues! and both its main H2 and feature H3 are Basketball Leagues. Use the exact section heading without the title exclamation mark.", "official_name": "Basketball Leagues", "boundary_source": "https://www.biggames.io/post/pet-simulator-99-update-63", "archive_verified": false, "saved_final_rows": 0, "event_date_status": "Introduction is confirmed by the June 7, 2025 official update. The supplied post does not establish an exact opening timestamp or a finish date.", "official_ended_at": null, "official_started_at": null, "official_name_source": "https://www.biggames.io/post/pet-simulator-99-update-63", "legacy_capture_window": {"ended_at": "2025-06-14T16:00:00+00:00", "started_at": "2025-06-07T16:00:00+00:00"}, "previous_display_name": "Basketball", "previous_boundary_source": "ps99_league_events", "official_publication_date": "2025-06-07"}
\.


--
-- Data for Name: coverage; Type: TABLE DATA; Schema: leagues; Owner: -
--

COPY leagues.coverage (event_key, original_event_key, league_run_key, period_started_at, period_ended_at, source_snapshot_count, source_league_count, source_row_count, archived_row_count, verified, archived_at, verified_at) FROM stdin;
lucky-block-blitz-2026	lucky-block-blitz-2026	lucky-block-blitz	2026-08-29 16:00:00+00	2026-09-05 16:00:00+00	187	187	3450	3450	t	2026-09-12 19:27:53.546+00	2026-09-12 19:27:53.546+00
soccer-2026	soccer-2026	active	2026-07-04 16:00:00+00	2026-07-11 16:00:00+00	37	37	233	233	t	2026-09-12 19:37:33.039574+00	2026-09-12 19:37:33.039574+00
tap-2026	tap-2026	tap-heroes-part-2	2026-07-18 16:00:00+00	2026-08-01 16:00:00+00	57	57	26975	26975	t	2026-09-12 19:37:35.929335+00	2026-09-12 19:37:35.929335+00
garden-2026	garden-2026	plants-vs-coins-part-2	2026-08-01 16:00:00+00	2026-08-15 16:00:00+00	4	4	32134	32134	t	2026-09-12 19:37:59.777777+00	2026-09-12 19:37:59.777777+00
fiesta-part-2-2026	fiesta-part-2-2026	plants-vs-coins-part-2	2026-08-15 16:00:00+00	2026-08-22 16:00:00+00	347	347	31286	31286	t	2026-09-12 19:38:31.344534+00	2026-09-12 19:38:31.344534+00
\.


--
-- PostgreSQL database dump complete
--

\unrestrict zFZxbqUWvMuHwM7Uwq5NW8bSWURzBFqQNukWkw1aw4q7fOrNSEwnqBYK0QHTfYh

