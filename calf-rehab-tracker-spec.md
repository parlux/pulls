# Left Calf Rehab — Weekly Program & Tracker Spec

Use this as the spec for a small tracking web page/app.

## Program — Block 3 (from Mon 2026-11-23)

New physio program, done **every day** (no A/B split, Sundays included). The day tag shows "Daily".

| Exercise | Dose | Logged |
|---|---|---|
| Seated single-leg calf raise (dumbbell on knee) | 3 × 10 | Left only — reps + weight per set |
| Standing double-leg calf raise, weight shifts | 3 × 10 | Both legs together — reps per set |
| Single-leg sit to stand | 3 × 8 each side | Left and Right — reps + seat height (cm) per set |
| Banded big toe push-ups | 3 × 10 | Left only — reps per set |

Nothing else is logged per set (no assist / pull / band levels). Seat height starts at 45 cm and carries over from the last sit-to-stand set. The Block 2 heel-raise ladder no longer applies.

Rest timer: 90 s after seated single-leg raises and sit to stands, 60 s after weight shifts and toe push-ups. Taken from the ACSM resistance-training guidance (1–2 min for moderate-load sets of about 8–12; under 90 s for lighter endurance work), shortened slightly because this is daily, submaximal rehab work rather than training to failure. Tap +15s on the timer when a set needs longer.

Progress → Calf charts the heaviest left seated single-leg set per day (missed days shown as crosses). The Block 2 iso-hold chart stays below it as history.

Columns (create them with `supabase/calf_block3.sql`): `seated_single_left` (`{reps, weight}`), `weight_shift`, `sit_to_stand_left`, `sit_to_stand_right` (`{reps, height}`, height in cm), `toe_pushup_left` (`{reps}`).

## Program — Block 2 (2026-10-05 → 2026-11-22)

### A-days — Mon, Tue, Thu, Fri

**1. Two-up, one-down heel raise** — Left 5 × 4, Right 2 × 6. Log clean reps per set. From 2026-10-10 the left side is assisted by pulling on the doorframe (not the right leg): log pull level per set — Heavy / Moderate / Light / Balance only / Fingertips. (Before that: right-leg assist level.)

**2. Mid-height iso hold (holding doorframe)** — Left 3 holds, Right 2. Rise to about halfway, hold until you start sinking, 30 s cap. Log time and pull level — from 2026-10-10: Heavy / Moderate / Light / Fingertips / Balance only (before that: grip — Full hand / Fingers / Fingertips / One finger). Once 30 s is reached, move to the next lighter level. Hold time is the benchmark: the Calf tab charts the best hold per side per A-day.

### B-days — Wed, Sat

Bent-knee heel raise, 10 kg, 2 × 15 each leg.

(Sat doorway single-leg benchmark is tracked outside the app.)

### Tracker notes

Data lives in the Supabase table `calf_rehab` (moved from Airtable on 2026-11-01; per-set columns are `jsonb` arrays). Entries dated before 2026-10-05 use the Block 1 form below; Block 2 adds `iso_hold_left`, `iso_hold_right` (`{seconds, grip}`) and `bent_knee_left`, `bent_knee_right` (`{reps, weight}`). Block 1 columns are kept for history. From 2026-10-10, `heel_raise_left` stores `{reps, pull}` and iso holds store `{seconds, pull}`; `assist`/`assist_avg` (the left-leg assist, Airtable's legacy `RightAssist`/`RightAssistAvg`) are left empty for those entries.

## Program — Block 1 (2026-09-19 → 2026-10-04)

### A-days — Mon, Tue, Thu, Fri (~10 min)

**1. Two-up, one-down heel raise**
Barefoot, flat ground, near a wall for a fingertip if you want balance. Both feet flat, rise on both to full height. At the top, shift your weight onto the working leg and lower over 3 seconds — the other foot stays on the floor and takes whatever it needs to. Both legs push up again for the next rep.

- Left: 3 × 6. Right: 2 × 6. 60 sec between sets.
- Knee near-locked and quiet on the lowering. Weight through the big toe.
- If the last second isn't controlled, let the other leg take more.

**2. Big-toe press**
Stand on one leg, foot flat. Press the big toe and the knuckle behind it into the floor — like making a thumbprint. Arch lifts slightly. Don't curl the toe, don't roll the ankle inward.

- 3 × 30 sec each side.

### B-days — Wed, Sat (~5 min)

Seated calf raise, loaded. Easy, well short of failure. Maintenance only — cut this first if time is tight.

### Sunday

Off.

### All day, every day

Push off through the big toe when you walk, skate and ride. More reps than the session gives you, and more leverage on the problem.

## Tracker requirements

**Log entry, per session (A-day or B-day):**
- Date
- Day type: A-day / B-day
- Per-set logging, individual rows (not just a sets/reps total), so real fatigue/dropoff across a session is visible:
  - A-day — Two-up, one-down heel raise: reps per set, Left and Right logged separately. Left-leg sets also get an assist-level rating (Heavy / Moderate / Light / Barely touching) — the primary progress metric, should trend toward "Barely touching" over time.
  - A-day — Big-toe press: hold-seconds per set, Left and Right logged separately.
  - B-day — Seated calf raise: reps + weight per set.
- Prior day's activity: free text (e.g. "skated", "rode", "long walk", "nothing")
- Soreness next morning: free text or short note (optional)

**Views:**
- A simple form to add a new log entry, defaulting to today's date.
- A history list/table of past entries, most recent first.
- Ideally a simple visual (e.g. a line/trend indicator) showing the left-leg assist level over time, since that's the main thing being tracked.
- A weekly view showing which A-day/B-day sessions have been logged vs. missed, so gaps in the schedule (Mon/Tue/Thu/Fri A-days, Wed/Sat B-days) are visible at a glance.
- CSV export (one row per set) for handing the block's data to a coach for review.

Data should persist between visits (not reset on reload).

## McGill Big 3 — daily check-in

Every day (Sundays included): curl-up, side plank, bird dog. Tracked only as done / not done, with an optional note.

- Today tab: a "McGill Big 3" card below calf rehab — the last seven days as dots (done / missed), a button to mark the selected day done (tap again to undo), a note box once it's done, and the current streak (days in a row; today not yet done doesn't break it).
- History: a McGill filter; CSV export with one row per done day (Date, Day, Done, Note).
- Data lives in the Supabase table `checkins` (`id`, `habit`, `date`, `note`, `timestamp`, `updated_at`; create it with `supabase/checkins.sql`). A row with `habit = 'mcgill'` means it was done that day. The id is derived from the habit and date, so two devices ticking off the same day write the same row.
