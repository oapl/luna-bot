\set ON_ERROR_STOP on
BEGIN;
\ir 'schema.sql'
\ir 'catalog.sql'
\ir 'Battles/Angel 2026/data.sql'
\ir 'Battles/Arcade 2026/data.sql'
\ir 'Battles/Athena Battle/data.sql'
\ir 'Battles/Backrooms 2026/data.sql'
\ir 'Battles/Balloon Corgi Battle/data.sql'
\ir 'Battles/Basketball Battle/data.sql'
\ir 'Battles/Bee Battle/data.sql'
\ir 'Battles/Block Party Battle/data.sql'
\ir 'Battles/Christmas Present Battle/data.sql'
\ir 'Battles/Evil Battle/data.sql'
\ir 'Battles/Fantasy 2026/data.sql'
\ir 'Battles/Gingerbread Battle/data.sql'
\ir 'Battles/Gingerbread Battle 2025/data.sql'
\ir 'Battles/Gummy 2026/data.sql'
\ir 'Battles/Hatch War 2026/data.sql'
\ir 'Battles/Lucky Battle/data.sql'
\ir 'Battles/Lucky Chest Battle/data.sql'
\ir 'Battles/Lunar 2026/data.sql'
\ir 'Battles/New Years Battle/data.sql'
\ir 'Battles/Ninja 2026/data.sql'
\ir 'Battles/Pet Games Battle/data.sql'
\ir 'Battles/Pixel Chick Battle/data.sql'
\ir 'Battles/Poison Turtle Battle/data.sql'
\ir 'Battles/Royal 2026/data.sql'
\ir 'Battles/Soccer 2026/data.sql'
\ir 'Battles/Space Mine 2026/data.sql'
\ir 'Battles/Spring 2026/data.sql'
\ir 'Battles/Starry/data.sql'
\ir 'Battles/Strength Battle/data.sql'
\ir 'Battles/Thanksgiving 2025 Battle/data.sql'
\ir 'Battles/Tie Dye Battle/data.sql'
\ir 'Battles/Tower Defense Battle/data.sql'
\ir 'Battles/Trick or Treat Battle/data.sql'
\ir 'Leagues/2026 Arcade League/data.sql'
\ir 'Leagues/2026 Space Mine League/data.sql'
\ir 'Leagues/Basketball Leagues/data.sql'
\ir 'Leagues/Blood Moon League/data.sql'
\ir 'Leagues/Deep Backrooms League/data.sql'
\ir 'Leagues/Fiesta League/data.sql'
\ir 'Leagues/Garden League/data.sql'
\ir 'Leagues/Lucky Breakout League/data.sql'
\ir 'Leagues/RNG League/data.sql'
\ir 'Leagues/Soccer League/data.sql'
\ir 'Leagues/Tap Heroes League 2026/data.sql'
\ir 'Leagues/Time Trials League/data.sql'
\ir 'Imports/CW-Bot.sql'
\ir 'Imports/Big Bot.sql'
\ir 'Imports/Battle Bot.sql'
COMMIT;
BEGIN;
SELECT setval(pg_get_serial_sequence('imports.cw_bot','record_id'),coalesce((SELECT max(record_id)FROM imports.cw_bot),1),EXISTS(SELECT 1 FROM imports.cw_bot));
SELECT setval(pg_get_serial_sequence('imports.big_bot','record_id'),coalesce((SELECT max(record_id)FROM imports.big_bot),1),EXISTS(SELECT 1 FROM imports.big_bot));
SELECT setval(pg_get_serial_sequence('imports.battle_bot','record_id'),coalesce((SELECT max(record_id)FROM imports.battle_bot),1),EXISTS(SELECT 1 FROM imports.battle_bot));
COMMIT;
ANALYZE battles.player_results;
ANALYZE battles.clan_results;
ANALYZE leagues.player_results;
ANALYZE leagues.team_results;
ANALYZE imports.cw_bot;
ANALYZE imports.big_bot;
ANALYZE imports.battle_bot;
