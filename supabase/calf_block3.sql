-- Block 3 calf rehab (from 2026-11-23): per-set columns for the daily physio program.
-- Run once in the Supabase SQL editor. Each column holds a jsonb array of sets.
alter table public.calf_rehab
  add column if not exists seated_single_left jsonb,  -- [{reps, weight}]
  add column if not exists weight_shift       jsonb,  -- [{reps}]
  add column if not exists sit_to_stand_left  jsonb,  -- [{reps}]
  add column if not exists sit_to_stand_right jsonb,  -- [{reps}]
  add column if not exists toe_pushup_left    jsonb;  -- [{reps}]
