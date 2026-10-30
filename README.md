# luna-bot

This database is for any current or future PS99 bot developers. Also because fuck CW-Bot and their team that are passive-aggressive assholes who treat this like it's more serious than any political topic I've ever engaged my worst enemy on? Updates will occur after each Clan Battle and League. Not yet established, but preparing to store Leaderboard data as well.

## Files

- `luna-public.dump` contains the complete PostgreSQL database.
- `restore.sql` restores the same dataset from the readable SQL files.
- `schema.sql` defines the database structure; `catalog.sql` supplies event names, dates, aliases and coverage.
- `Battles/` and `Leagues/` contain one folder per canonical event.
- `Imports/` contains one SQL file per source bot.

Luna's DB has 33 recorded clan battles, 10 leagues, 301,201 clan battle player performances and 94,088 league player performances.

## Restore the database

Use PostgreSQL 17 or newer and PostgreSQL 17-compatible `pg_restore`. The release was produced using PostgreSQL 17.6 tools. The dump does not create a database, assign production owners, install extensions, or restore production grants.

Create an empty UTF-8 database, then restore the custom-format dump:

```sh
createdb --template=template0 --encoding=UTF8 --locale-provider=libc --locale=C luna_public
pg_restore --dbname=luna_public --no-owner --no-privileges --exit-on-error --single-transaction luna-public.dump
```

Standard PostgreSQL connection settings such as `PGHOST`, `PGPORT`, and `PGUSER` apply. Keep credentials outside the repository.

Alternatively, create the empty database and run the SQL restore from this folder:

```sh
psql --dbname=luna_public --set=ON_ERROR_STOP=1 --file=restore.sql
```

`restore.sql` loads `schema.sql`, `catalog.sql`, and the event and import files, then finishes the automatic ID counters and database statistics. Choose one restore method; the complete dump already includes the schema and all data.

The release does not claim PostgreSQL 16 or earlier compatibility. A plain SQL file is inspectable and editable, but is not an automatic downgrade guarantee. No production database or role names are needed to restore the data.

## Database layout

| Schema | Tables/views | Purpose |
| --- | --- | --- |
| `catalog` | `battle_events`, `battle_aliases`, `unresolved_event_names` | Stable battle identifiers, titles, dates, source aliases and unresolved names |
| `battles` | `player_results`, `native_player_results` | Resolved player results and a view restricted to Luna observations |
| `battles` | `clan_results` | Saved clan leaderboard and contribution views, distinguished by `source_view` |
| `leagues` | `events`, `player_observations`, `coverage` | Official league events, contextual league observations and archive coverage |
| `imports` | `cw_bot`, `big_bot`, `battle_bot`, `all_records` | One physical table per bot and a combined view, with `record_kind` distinguishing results from source references |

Battle and league player-result tables have a separate PostgreSQL partition for each event, named after its catalog display title. Normal queries use the parent table; PostgreSQL selects the relevant partition when the query filters by `event_key`. One event can have several source aliases without becoming several events. This release has 33 battle events, 10 league events and 43 event-specific result tables. Event identities come from the [BIG Games battle catalog](https://db.biggames.io/clans/battles), [league catalog](https://db.biggames.io/leagues/seasons), and [Update 63](https://www.biggames.io/post/pet-simulator-99-update-63) for Basketball Leagues.

Public display names are normalized for clarity, including **RNG League** and **Tap Heroes League 2026**. Original official labels and source IDs remain in the league metadata. **Deep Backrooms League** is one canonical event; `DeepBackroomsLeague2026C` is a source ID alias, not a separate league. Historical collector keys remain stable even when their wording differs from the display title.

All parsed imported results reference a known battle; their original source names remain in `original_battle_name`. The `basketball-2025` league is **Basketball Leagues** and has an empty result table because no player observations were saved for it.

Catalog `started_at` and `ended_at` use official BIG Games event windows where established. Basketball Leagues was introduced on June 7, 2025, but its exact start and end timestamps are not confirmed, so both catalog timestamps remain `NULL`. Earlier collector/capture windows remain in `metadata.legacy_event_window` for battles and `metadata.legacy_capture_window` for leagues, including the prior June 7–14 Basketball capture window. Original observation timestamps and row-level period boundaries are preserved, even where a collector's old window differs from the official event dates.

`battles.player_results` contains one chosen result per player and event. Its `source_kind` identifies whether the chosen evidence is native or imported. `battles.native_player_results` filters that table to `global_candidate` and `member_snapshot` evidence. The three bot tables preserve original claims independently, including disagreements between bots. `imports.all_records` combines them for convenience without storing a duplicate copy. Its row identity is `(source, record_id)`. Its `record_kind` is `result` for a parsed claim or `source_reference` for sanitized post metadata. A stored source reference is not itself a verified result.

## Example queries

Find the stable battle key before looking up its results:

```sql
SELECT event_key, title, started_at, ended_at, metadata
FROM catalog.battle_events
WHERE title ILIKE '%Fantasy%'
ORDER BY ended_at DESC NULLS LAST, event_key;
```

The catalog also gives the directly named result table for each event:

```sql
SELECT event_key, title, result_table
FROM catalog.battle_events
WHERE event_key = 'FantasyBattle2026';

SELECT user_id, username, global_rank, points
FROM battles."Fantasy 2026"
ORDER BY global_rank NULLS LAST, user_id;
```

Use double quotes around table names containing spaces. Queries against `battles.player_results` are equivalent and usually simpler to parameterize in a bot.

Get a player's global result for a battle. Replace the event key and Roblox ID with the values you need:

```sql
SELECT e.title, r.user_id, r.username, r.clan_name,
       r.global_rank, r.member_rank, r.points,
       r.source_kind, r.observed_at
FROM battles.player_results AS r
JOIN catalog.battle_events AS e USING (event_key)
WHERE r.event_key = 'FantasyBattle2026'
  AND r.user_id = 451631996;
```

Get that player's history across all recorded battles:

```sql
SELECT e.event_key, e.title, e.ended_at,
       r.username, r.clan_name, r.global_rank, r.points,
       r.source_kind, r.observed_at
FROM battles.player_results AS r
JOIN catalog.battle_events AS e USING (event_key)
WHERE r.user_id = 451631996
ORDER BY e.ended_at DESC NULLS LAST, e.event_key;
```

Use the native-only view when you want to exclude chosen imported results:

```sql
SELECT user_id, username, clan_name, global_rank, points
FROM battles.native_player_results
WHERE event_key = 'FantasyBattle2026'
ORDER BY global_rank NULLS LAST, user_id;
```

Read the saved clan leaderboard separately from player results:

```sql
SELECT e.title, c.clan_name, c.rank, c.points, c.observed_at
FROM battles.clan_results AS c
JOIN catalog.battle_events AS e USING (event_key)
WHERE c.event_key = 'FantasyBattle2026'
  AND c.source_view = 'leaderboard'
ORDER BY c.rank NULLS LAST, c.clan_name;
```

Use `source_view = 'contributions'` on the same table for the independently saved clan totals from the global contribution collection. Keep these views distinct when their observation time or coverage differs.

Inspect original source claims for a player. Keep the explicit global and clan rank fields distinct:

```sql
SELECT source, event_key, original_battle_key, original_battle_name,
       user_id, username, clan_name, global_rank, clan_rank,
       final_points, final_snapshot_at
FROM imports.all_records
WHERE record_kind = 'result'
  AND user_id = 451631996
ORDER BY event_key NULLS LAST, source, source_record_id;
```

Inspect a league's original observations without treating every rank as global:

```sql
SELECT e.title, p.league_name, p.user_id, p.display_name,
       p.source_rank, p.points, p.fetched_at
FROM leagues.player_observations AS p
JOIN leagues.events AS e USING (event_key)
WHERE p.event_key = 'tap-2026'
ORDER BY p.league_name, p.source_rank NULLS LAST, p.user_id;
```

## Interpret the results correctly

- SQL `NULL` means unknown. Do not replace missing points, ranks, populations, or dates with zero.
- Preserve Roblox IDs and point totals as PostgreSQL `bigint`. JavaScript clients should return them as decimal strings when values can exceed `Number.MAX_SAFE_INTEGER`.
- A member rank and a clan rank are different from a player global rank. League `source_rank` retains its original source context.
- Catalog titles are public display names; league metadata preserves the original official labels and source IDs. Catalog event windows use official dates where established. Imported `original_battle_name`, row-level league period boundaries and stored capture timestamps preserve the original source evidence; they are not naming or date authorities.
- Coverage metadata applies to the comparison pool, not only the requested player. A published rank from an incomplete pool is not a confirmed final global placement.
- Fantasy 2026 has 900 of 1,000 clan slots, with positions 151–250 missing. Its published rankings are relative to collected players. Later saved tracked-clan corrections do not mean the entire pool was captured at that later time.
- Imported `final_snapshot_at` can reflect when a history post or import was captured. It does not prove a final-second game sample. Use the event catalog for battle boundaries.
- No rank is recalculated by restoring the database. Original source claims remain available for review.

## Read-only bot access

Use an application role with only schema usage and table/view reads. For an existing role named `luna_reader`, the database owner can grant:

```sql
GRANT USAGE ON SCHEMA catalog, battles, leagues, imports TO luna_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA catalog, battles, leagues, imports TO luna_reader;
```
