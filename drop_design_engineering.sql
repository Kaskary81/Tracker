-- Trackers — remove the design and engineering tables
-- Kaskary81/Tracker · MAADEN TAIF AR RJUM · Jazan Cluster SSTPs
--
-- RUN THIS ONLY AFTER the new index.html is live on GitHub Pages and you have
-- hard-refreshed it (Ctrl+Shift+R). The new build no longer reads these four
-- tables; the old build does, and would fail to load once they are gone.
--
-- THIS CANNOT BE UNDONE. It removes 150 design documents, 415 design
-- revisions, 96 Ma'aden submissions and 75 shop drawings.
--
-- Paste into Supabase → SQL Editor → Run.

-- 1 ── see what you are about to lose. Run this on its own first.
select 'designs'  as table_name, count(*) as rows from designs
union all select 'revs',     count(*) from revs
union all select 'msubs',    count(*) from msubs
union all select 'shopdwgs', count(*) from shopdwgs;

-- 2 ── the drop, children before parents so nothing cascades unexpectedly.
--     Delete the two dashes in front of each line to arm it.
-- begin;
--   drop table if exists revs;
--   drop table if exists msubs;
--   drop table if exists designs;
--   drop table if exists shopdwgs;
-- commit;

-- 3 ── optional: clear the Updates history for those four tables, so the feed
--     stops showing entries for records that no longer exist.
-- delete from activity where tbl in ('designs','revs','msubs','shopdwgs');

-- 4 ── check. Should return no rows once step 2 has run.
select table_name from information_schema.tables
where table_schema='public' and table_name in ('designs','revs','msubs','shopdwgs');
