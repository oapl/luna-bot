--
-- PostgreSQL database dump
--

\restrict 9Sib4gMyLIOAFpnbRURornLYBfJH982CWdta9GgHR9VZmWmCQZb4nr0sKv8xHwO

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
-- Data for Name: battle_bot; Type: TABLE DATA; Schema: imports; Owner: -
--

COPY imports.battle_bot (record_id, record_kind, source_record_id, original_reference_id, source, source_name, user_id, username, username_hint, event_key, original_battle_key, original_battle_name, clan_name, source_rank, source_total_ranked, clan_rank, total_clan_members, global_rank, total_global_players, final_points, final_snapshot_at, status, imported_from, created_at, updated_at, detected_battle_count, source_created_at, observed_at, imported_at) FROM stdin;
1	source_reference	7133	4138	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.787+00	0	2026-08-26 23:28:18.245+00	2026-08-28 21:13:49.397+00	\N
2	source_reference	7134	5723	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:42.885+00	0	2026-08-26 11:34:42.049+00	2026-08-28 21:13:50.758+00	\N
3	source_reference	7135	5726	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:42.936+00	0	2026-08-26 12:57:34.888+00	2026-08-28 21:13:50.758+00	\N
4	source_reference	7136	5727	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:43.004+00	0	2026-08-26 12:59:31.135+00	2026-08-28 21:13:50.758+00	\N
5	source_reference	7137	5728	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:43.207+00	0	2026-08-26 14:21:30.827+00	2026-08-28 21:13:50.758+00	\N
6	source_reference	7138	4117	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:43.275+00	0	2026-08-26 15:44:48.749+00	2026-08-28 21:13:50.758+00	\N
7	source_reference	7139	5729	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:43.33+00	0	2026-08-26 15:56:24.314+00	2026-08-28 21:13:50.758+00	\N
8	source_reference	7140	5730	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:43.403+00	0	2026-08-26 19:00:08.167+00	2026-08-28 21:13:50.758+00	\N
9	source_reference	7141	5731	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:43.456+00	0	2026-08-26 04:42:28.526+00	2026-08-28 21:13:51.529+00	\N
10	source_reference	7142	5732	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:43.658+00	0	2026-08-26 05:18:56.229+00	2026-08-28 21:13:51.529+00	\N
11	source_reference	7143	4120	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:43.713+00	0	2026-08-26 05:32:24.238+00	2026-08-28 21:13:51.529+00	\N
12	source_reference	7144	5749	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:43.781+00	0	2026-08-26 06:28:41.786+00	2026-08-28 21:13:51.529+00	\N
13	source_reference	7145	4122	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:43.85+00	0	2026-08-26 00:30:22.906+00	2026-08-28 21:13:52.623+00	\N
14	source_reference	7146	4124	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:43.902+00	0	2026-08-25 23:30:02.233+00	2026-08-28 21:13:53.374+00	\N
15	source_reference	7147	4128	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.108+00	0	2026-08-25 06:29:58.154+00	2026-08-28 21:13:54.502+00	\N
16	source_reference	7148	4132	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.18+00	0	2026-08-24 23:22:20.528+00	2026-08-28 21:13:57.637+00	\N
17	source_reference	7149	5756	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.251+00	0	2026-08-24 23:37:00.624+00	2026-08-28 21:13:57.637+00	\N
18	source_reference	7150	5757	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.329+00	0	2026-08-24 23:38:06.276+00	2026-08-28 21:13:57.637+00	\N
19	source_reference	7151	5758	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.381+00	0	2026-08-24 23:46:16.788+00	2026-08-28 21:13:57.637+00	\N
20	source_reference	7152	5759	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.55+00	0	2026-08-24 23:50:58.548+00	2026-08-28 21:13:57.637+00	\N
21	source_reference	7153	4135	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.616+00	0	2026-08-25 00:08:36.668+00	2026-08-28 21:13:57.637+00	\N
22	source_reference	7154	5760	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.686+00	0	2026-08-25 00:09:01.484+00	2026-08-28 21:13:57.637+00	\N
23	source_reference	7155	5761	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.763+00	0	2026-08-25 00:17:49.273+00	2026-08-28 21:13:57.637+00	\N
24	source_reference	7156	5762	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.821+00	0	2026-08-25 00:18:07.342+00	2026-08-28 21:13:57.637+00	\N
25	source_reference	7157	5763	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:44.996+00	0	2026-08-24 22:24:21.74+00	2026-08-28 21:13:58.481+00	\N
26	source_reference	7158	4143	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.051+00	0	2026-08-24 21:29:20.57+00	2026-08-28 21:13:59.564+00	\N
27	source_reference	7159	5764	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.119+00	0	2026-08-24 21:37:57.12+00	2026-08-28 21:13:59.564+00	\N
28	source_reference	7160	5765	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.176+00	0	2026-08-24 21:39:05.882+00	2026-08-28 21:13:59.564+00	\N
29	source_reference	7161	5766	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.224+00	0	2026-08-24 21:39:22.741+00	2026-08-28 21:13:59.564+00	\N
30	source_reference	7162	2654	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.412+00	0	2026-08-24 21:39:40.302+00	2026-08-28 21:13:59.564+00	\N
31	source_reference	7163	4125	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.479+00	0	2026-08-24 21:42:54.465+00	2026-08-28 21:13:59.564+00	\N
32	source_reference	7164	4151	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.531+00	0	2026-08-24 21:48:58.211+00	2026-08-28 21:13:59.564+00	\N
33	source_reference	7165	2748	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.593+00	0	2026-08-24 22:07:09.969+00	2026-08-28 21:13:59.564+00	\N
34	source_reference	7166	2800	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.652+00	0	2026-08-24 22:09:29+00	2026-08-28 21:13:59.564+00	\N
35	source_reference	7167	2888	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.827+00	0	2026-08-24 22:11:04.629+00	2026-08-28 21:13:59.564+00	\N
36	source_reference	7168	4173	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.905+00	0	2026-08-24 22:11:54.445+00	2026-08-28 21:13:59.564+00	\N
37	source_reference	7169	2916	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:45.956+00	0	2026-08-24 13:32:30.124+00	2026-08-28 21:14:02.048+00	\N
38	source_reference	7170	4136	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.019+00	0	2026-08-24 13:32:57.289+00	2026-08-28 21:14:02.048+00	\N
39	source_reference	7171	2948	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.077+00	0	2026-08-24 13:33:50.448+00	2026-08-28 21:14:02.048+00	\N
40	source_reference	7172	3087	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.258+00	0	2026-08-24 13:33:52.89+00	2026-08-28 21:14:02.048+00	\N
41	source_reference	7173	4182	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.326+00	0	2026-08-24 13:34:24.998+00	2026-08-28 21:14:02.048+00	\N
42	source_reference	7174	4185	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.392+00	0	2026-08-24 13:34:39.419+00	2026-08-28 21:14:02.048+00	\N
43	source_reference	7175	4139	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.455+00	0	2026-08-27 00:47:55.401+00	2026-08-28 21:14:42.501+00	\N
44	source_reference	7176	4190	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.509+00	0	2026-08-24 13:49:34.324+00	2026-08-28 21:15:00.482+00	\N
45	source_reference	7177	4196	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.695+00	0	2026-08-24 15:55:32.014+00	2026-08-28 21:15:00.482+00	\N
46	source_reference	7178	5781	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.759+00	0	2026-08-24 16:32:27.33+00	2026-08-28 21:15:00.482+00	\N
47	source_reference	7179	5782	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.807+00	0	2026-08-24 16:48:53.267+00	2026-08-28 21:15:00.482+00	\N
48	source_reference	7180	5783	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.877+00	0	2026-08-24 17:34:38.289+00	2026-08-28 21:15:00.482+00	\N
49	source_reference	7181	4129	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:46.932+00	0	2026-08-24 19:22:49.497+00	2026-08-28 21:15:00.482+00	\N
50	source_reference	7182	5784	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:47.13+00	0	2026-08-24 19:47:34.233+00	2026-08-28 21:15:00.482+00	\N
51	source_reference	7183	5785	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:47.184+00	0	2026-08-24 21:27:09.549+00	2026-08-28 21:15:00.482+00	\N
52	source_reference	7184	5786	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:47.239+00	0	2026-08-26 11:05:08.468+00	2026-08-28 21:15:00.482+00	\N
53	source_reference	7185	5787	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:47.306+00	0	2026-08-26 19:48:28.203+00	2026-08-28 21:15:00.482+00	\N
54	source_reference	7186	4202	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:47.372+00	0	2026-08-27 01:41:08.621+00	2026-08-28 21:16:25.218+00	\N
55	source_reference	7187	5788	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:47.555+00	0	2026-08-27 16:16:15.456+00	2026-08-28 21:16:25.218+00	\N
56	source_reference	7188	5789	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:47.61+00	0	2026-08-27 17:29:07.776+00	2026-08-28 21:16:25.218+00	\N
57	source_reference	7189	5790	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:47.657+00	0	2026-08-27 18:46:54.042+00	2026-08-28 21:16:25.218+00	\N
58	source_reference	7190	5791	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:47.734+00	0	2026-08-27 19:41:28.385+00	2026-08-28 21:16:25.218+00	\N
59	source_reference	7191	4213	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:47.804+00	0	2026-08-27 19:46:36.709+00	2026-08-28 21:16:25.218+00	\N
60	source_reference	7192	5792	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:47.982+00	0	2026-08-27 21:17:25.601+00	2026-08-28 21:16:25.218+00	\N
61	source_reference	7193	5793	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.035+00	0	2026-08-28 02:43:59.672+00	2026-08-28 21:16:25.218+00	\N
62	source_reference	7194	5794	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.086+00	0	2026-08-28 07:02:45.636+00	2026-08-28 21:16:25.218+00	\N
63	source_reference	7195	5795	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.165+00	0	2026-08-28 12:28:09.902+00	2026-08-28 21:16:25.218+00	\N
64	source_reference	7196	4217	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.234+00	0	2026-08-28 17:25:48.881+00	2026-08-28 21:16:25.218+00	\N
65	source_reference	7197	5796	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.408+00	0	2026-08-28 17:55:37.848+00	2026-08-28 21:16:25.218+00	\N
66	source_reference	7198	5797	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.462+00	0	2026-08-28 18:39:03.253+00	2026-08-28 21:16:25.218+00	\N
67	source_reference	7199	5798	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.54+00	0	2026-08-28 18:42:50.863+00	2026-08-28 21:16:25.218+00	\N
68	source_reference	7200	5799	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.591+00	0	2026-08-28 19:15:15.211+00	2026-08-28 21:16:25.218+00	\N
69	source_reference	7201	4219	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.657+00	0	2026-08-28 19:19:30.242+00	2026-08-28 21:16:25.218+00	\N
70	source_reference	7202	5800	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.833+00	0	2026-08-25 00:30:51.602+00	2026-08-28 21:16:32.082+00	\N
71	source_reference	7203	5801	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.887+00	0	2026-08-25 00:36:15.945+00	2026-08-28 21:16:32.082+00	\N
72	source_reference	7204	5802	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:48.97+00	0	2026-08-25 02:16:06.457+00	2026-08-28 21:16:32.082+00	\N
73	source_reference	7205	5803	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.023+00	0	2026-08-25 03:14:06.61+00	2026-08-28 21:16:32.082+00	\N
74	source_reference	7206	4191	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.094+00	0	2026-08-25 03:59:41.232+00	2026-08-28 21:16:32.082+00	\N
75	source_reference	7207	5804	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.268+00	0	2026-08-25 04:06:08.414+00	2026-08-28 21:16:32.082+00	\N
76	source_reference	7208	5805	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.321+00	0	2026-08-25 06:02:08.417+00	2026-08-28 21:16:32.082+00	\N
77	source_reference	7209	5806	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.387+00	0	2026-08-25 06:31:06.279+00	2026-08-28 21:16:32.082+00	\N
78	source_reference	7210	5807	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.441+00	0	2026-08-25 06:34:33.954+00	2026-08-28 21:16:32.082+00	\N
79	source_reference	7211	4230	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.498+00	0	2026-08-25 06:48:31.895+00	2026-08-28 21:16:32.082+00	\N
80	source_reference	7212	5809	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.669+00	0	2026-08-25 07:21:57.632+00	2026-08-28 21:16:32.082+00	\N
81	source_reference	7213	5810	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.727+00	0	2026-08-25 07:57:10.135+00	2026-08-28 21:16:32.082+00	\N
82	source_reference	7214	5811	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.794+00	0	2026-08-25 07:59:11.587+00	2026-08-28 21:16:32.082+00	\N
83	source_reference	7215	4234	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.849+00	0	2026-08-25 08:01:52.106+00	2026-08-28 21:16:32.082+00	\N
84	source_reference	7216	4238	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:49.903+00	0	2026-08-25 10:12:22.712+00	2026-08-28 21:16:32.082+00	\N
85	source_reference	7217	5812	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.08+00	0	2026-08-25 10:48:41.316+00	2026-08-28 21:16:32.082+00	\N
86	source_reference	7218	5813	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.131+00	0	2026-08-25 10:54:01.626+00	2026-08-28 21:16:32.082+00	\N
87	source_reference	7219	5814	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.204+00	0	2026-08-25 10:59:06.694+00	2026-08-28 21:16:32.082+00	\N
88	source_reference	7220	5815	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.259+00	0	2026-08-25 11:05:59.835+00	2026-08-28 21:16:32.082+00	\N
89	source_reference	7221	4244	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.313+00	0	2026-08-25 15:44:50.127+00	2026-08-28 21:16:32.082+00	\N
90	source_reference	7222	5816	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.491+00	0	2026-08-25 16:15:08.363+00	2026-08-28 21:16:32.082+00	\N
91	source_reference	7223	5817	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.543+00	0	2026-08-25 16:22:51.995+00	2026-08-28 21:16:32.082+00	\N
92	source_reference	7224	5818	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.611+00	0	2026-08-25 16:35:14.234+00	2026-08-28 21:16:32.082+00	\N
93	source_reference	7225	5819	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.669+00	0	2026-08-25 17:24:52.639+00	2026-08-28 21:16:32.082+00	\N
94	source_reference	7226	4249	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.721+00	0	2026-08-25 18:12:01.531+00	2026-08-28 21:16:32.082+00	\N
95	source_reference	7227	5820	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.897+00	0	2026-08-25 18:16:53.671+00	2026-08-28 21:16:32.082+00	\N
96	source_reference	7228	5821	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:50.948+00	0	2026-08-25 18:52:28.555+00	2026-08-28 21:16:32.082+00	\N
97	source_reference	7229	5822	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.016+00	0	2026-08-25 18:55:59.509+00	2026-08-28 21:16:32.082+00	\N
98	source_reference	7230	5823	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.073+00	0	2026-08-25 18:57:25.624+00	2026-08-28 21:16:32.082+00	\N
99	source_reference	7231	4255	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.126+00	0	2026-08-25 20:41:26.53+00	2026-08-28 21:16:32.082+00	\N
100	source_reference	7232	5824	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.299+00	0	2026-08-25 20:44:31.687+00	2026-08-28 21:16:32.082+00	\N
101	source_reference	7233	5825	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.355+00	0	2026-08-25 20:45:18.786+00	2026-08-28 21:16:32.082+00	\N
102	source_reference	7234	5826	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.423+00	0	2026-08-25 21:38:06.611+00	2026-08-28 21:16:32.082+00	\N
103	source_reference	7235	5827	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.481+00	0	2026-08-25 21:59:02.486+00	2026-08-28 21:16:32.082+00	\N
104	source_reference	7236	4261	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.535+00	0	2026-08-25 22:01:19.778+00	2026-08-28 21:16:32.082+00	\N
105	source_reference	7237	5828	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.728+00	0	2026-08-25 22:10:46.424+00	2026-08-28 21:16:32.082+00	\N
106	source_reference	7238	5829	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.785+00	0	2026-08-26 11:18:41.976+00	2026-08-28 21:16:32.082+00	\N
107	source_reference	7239	5830	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.851+00	0	2026-08-28 20:17:40.289+00	2026-08-28 21:16:43.28+00	\N
108	source_reference	7240	5831	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.908+00	0	2026-08-26 17:10:46.522+00	2026-08-28 21:16:48.857+00	\N
109	source_reference	7241	4220	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:51.961+00	0	2026-08-26 02:46:25.298+00	2026-08-28 21:16:53.269+00	\N
110	source_reference	7242	5832	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:52.134+00	0	2026-08-26 10:56:58.082+00	2026-08-28 21:16:53.269+00	\N
111	source_reference	7243	5833	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:52.184+00	0	2026-08-28 11:20:31.818+00	2026-08-28 21:16:53.269+00	\N
112	source_reference	7244	5834	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:52.252+00	0	2026-08-25 01:20:57.734+00	2026-08-28 21:16:54.178+00	\N
113	source_reference	7245	5835	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 09:36:52.305+00	0	2026-08-28 20:37:32.573+00	2026-08-28 21:17:06.981+00	\N
114	source_reference	10200	6278	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:33.303+00	0	2026-08-11 20:36:22.836+00	2026-08-29 08:48:43.522+00	\N
115	source_reference	10201	6359	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:33.355+00	0	2026-08-28 16:23:42.132+00	2026-08-29 08:51:07.087+00	\N
116	source_reference	10202	6281	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:33.404+00	0	2026-08-28 03:17:01.963+00	2026-08-29 08:51:08.081+00	\N
117	source_reference	10203	6377	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:33.658+00	0	2026-08-27 19:47:25.765+00	2026-08-29 08:51:09.294+00	\N
118	source_reference	10204	6394	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:33.466+00	0	2026-08-27 21:41:05.732+00	2026-08-29 08:51:09.294+00	\N
119	source_reference	10205	6256	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:33.731+00	0	2026-08-27 11:06:52.343+00	2026-08-29 08:51:10.365+00	\N
120	source_reference	10206	6395	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:33.778+00	0	2026-08-26 00:47:36.267+00	2026-08-29 08:51:15.846+00	\N
121	source_reference	10207	6426	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:33.895+00	0	2026-08-25 16:40:08.861+00	2026-08-29 08:51:17.079+00	\N
122	source_reference	10208	6425	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:33.833+00	0	2026-08-25 16:44:20.627+00	2026-08-29 08:51:17.079+00	\N
123	source_reference	10209	6283	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:34.044+00	0	2026-08-25 14:49:37.469+00	2026-08-29 08:51:18.396+00	\N
124	source_reference	10210	6276	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:34.106+00	0	2026-08-24 22:18:07.794+00	2026-08-29 08:51:22.584+00	\N
125	source_reference	10211	6492	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:34.23+00	0	2026-08-24 18:51:20.949+00	2026-08-29 08:51:23.88+00	\N
126	source_reference	10212	6491	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:34.156+00	0	2026-08-24 18:52:21.658+00	2026-08-29 08:51:23.88+00	\N
127	source_reference	10213	6565	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:34.401+00	0	2026-08-18 11:54:01.793+00	2026-08-29 08:51:38.828+00	\N
128	source_reference	10214	6564	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:34.291+00	0	2026-08-18 11:54:27.48+00	2026-08-29 08:51:38.828+00	\N
129	source_reference	10216	6331	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:34.48+00	0	2026-08-15 12:16:03.073+00	2026-08-29 08:51:42.254+00	\N
130	source_reference	10217	6721	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:35.58+00	0	2026-08-14 09:10:27.11+00	2026-08-29 08:51:43.099+00	\N
131	source_reference	10218	6720	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:35.509+00	0	2026-08-14 11:44:51.336+00	2026-08-29 08:51:43.099+00	\N
132	source_reference	10219	6749	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:35.461+00	0	2026-08-14 14:56:23.855+00	2026-08-29 08:51:43.099+00	\N
133	source_reference	10220	6748	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:35.41+00	0	2026-08-14 14:57:03.122+00	2026-08-29 08:51:43.099+00	\N
134	source_reference	10221	7192	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:35.641+00	0	2026-08-13 11:05:01.927+00	2026-08-29 08:51:44.437+00	\N
135	source_reference	10222	6295	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:35.763+00	0	2026-08-12 04:10:36.708+00	2026-08-29 08:51:46.787+00	\N
136	source_reference	10223	7238	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:35.691+00	0	2026-08-12 04:27:38.027+00	2026-08-29 08:51:46.787+00	\N
137	source_reference	10224	6296	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:35.814+00	0	2026-08-12 01:23:05.033+00	2026-08-29 08:51:47.945+00	\N
138	source_reference	10225	7298	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:36.256+00	0	2026-08-11 20:03:13.399+00	2026-08-29 08:51:49.098+00	\N
139	source_reference	10226	7297	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:36.203+00	0	2026-08-11 20:05:05.117+00	2026-08-29 08:51:49.098+00	\N
140	source_reference	10227	7427	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:36.155+00	0	2026-08-11 20:06:08.618+00	2026-08-29 08:51:49.098+00	\N
141	source_reference	10228	7433	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:36.107+00	0	2026-08-11 20:06:38.517+00	2026-08-29 08:51:49.098+00	\N
142	source_reference	10229	7432	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:36.057+00	0	2026-08-11 20:06:38.589+00	2026-08-29 08:51:49.098+00	\N
143	source_reference	10230	7431	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:35.912+00	0	2026-08-11 20:10:01.42+00	2026-08-29 08:51:49.098+00	\N
144	source_reference	10231	7438	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:35.864+00	0	2026-08-11 20:46:36.365+00	2026-08-29 08:51:49.098+00	\N
145	source_reference	10232	6312	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:36.571+00	0	2026-08-29 01:55:24.336+00	2026-08-29 09:55:08.35+00	\N
146	source_reference	10233	6313	battle_bot	Battle Bot	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	stored_only	\N	\N	2026-08-29 10:47:36.631+00	0	2026-08-28 22:21:24.919+00	2026-08-29 09:55:10.339+00	\N
\.


--
-- Name: battle_bot_record_id_seq; Type: SEQUENCE SET; Schema: imports; Owner: -
--

SELECT pg_catalog.setval('imports.battle_bot_record_id_seq', 146, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 9Sib4gMyLIOAFpnbRURornLYBfJH982CWdta9GgHR9VZmWmCQZb4nr0sKv8xHwO

