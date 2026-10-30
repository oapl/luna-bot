# luna-bot

<img width="373" height="420" alt="image" src="https://github.com/user-attachments/assets/9ccd8449-add8-4ab1-a846-958d5aeefadc" />


This database is for any current or future PS99 bot developers. Also because fuck CW-Bot and their team that are passive-aggressive assholes who treat this like it's more serious than any political topic I've ever engaged my worst enemy on? Updates will occur after each Clan Battle and League. Not yet established, but preparing to store Leaderboard data as well.

## Files

- `luna-public.dump` contains the complete PostgreSQL database.
- `restore.sql` restores the same dataset from the readable SQL files.
- `schema.sql` defines the database structure; `catalog.sql` supplies event names, dates, aliases and coverage.
- `Battles/` and `Leagues/` contain one folder per canonical event.
- `Imports/` contains one SQL file per source bot.

Luna's DB has 33 recorded clan battles, 10 leagues, 301,201 clan battle player performances and 94,088 league player performances.

## Database layout

| Schema | Tables/views | Purpose |
| --- | --- | --- |
| `catalog` | `battle_events`, `battle_aliases`, `unresolved_event_names` | Stable battle identifiers, titles, dates, source aliases and unresolved names |
| `battles` | `player_results`, `native_player_results` | Resolved player results and a view restricted to Luna observations |
| `battles` | `clan_results` | Saved clan leaderboard and contribution views, distinguished by `source_view` |
| `leagues` | `events`, `player_observations`, `coverage` | Official league events, contextual league observations and archive coverage |
| `imports` | `cw_bot`, `big_bot`, `battle_bot`, `all_records` | One physical table per bot and a combined view, with `record_kind` distinguishing results from source references |

## Example queries

Find the stable battle key before looking up its results:

```sql
SELECT event_key, title, started_at, ended_at, metadata
FROM catalog.battle_events
WHERE title ILIKE '%Fantasy%'
ORDER BY ended_at DESC NULLS LAST, event_key;
```

These also include the direct results and data from the clan battle or league here:

```sql
SELECT event_key, title, result_table
FROM catalog.battle_events
WHERE event_key = 'FantasyBattle2026';

SELECT user_id, username, global_rank, points
FROM battles."Fantasy 2026"
ORDER BY global_rank NULLS LAST, user_id;
```

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
