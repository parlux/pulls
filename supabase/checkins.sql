-- Done / not done habits (the McGill Big 3). One row per habit per day it was done.
-- Run once in the Supabase SQL editor.
create table if not exists public.checkins (
  id uuid primary key,
  habit text not null,
  date date not null,
  note text not null default '',
  timestamp timestamptz,
  updated_at timestamptz not null default now()
);

alter table public.checkins enable row level security;

create policy "Signed-in users can read and write checkins"
  on public.checkins for all to authenticated
  using (true) with check (true);

-- Incremental sync fetches rows whose updated_at moved since the last sync
create or replace function public.checkins_touch_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end $$;

create trigger checkins_touch_updated_at
  before update on public.checkins
  for each row execute function public.checkins_touch_updated_at();
