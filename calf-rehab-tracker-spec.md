# Left Calf Rehab — Weekly Program & Tracker Spec

Use this as the spec for a small tracking web page/app.

## Program — Block 1, this week

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
  - A-day — Two-up, one-down heel raise: reps per set, Left and Right logged separately. Right-leg sets also get an assist-level rating (Heavy / Moderate / Light / Barely touching) — the primary progress metric, should trend toward "Barely touching" over time.
  - A-day — Big-toe press: hold-seconds per set, Left and Right logged separately.
  - B-day — Seated calf raise: reps + weight per set.
- Prior day's activity: free text (e.g. "skated", "rode", "long walk", "nothing")
- Soreness next morning: free text or short note (optional)

**Views:**
- A simple form to add a new log entry, defaulting to today's date.
- A history list/table of past entries, most recent first.
- Ideally a simple visual (e.g. a line/trend indicator) showing the right-leg assist level over time, since that's the main thing being tracked.
- A weekly view showing which A-day/B-day sessions have been logged vs. missed, so gaps in the schedule (Mon/Tue/Thu/Fri A-days, Wed/Sat B-days) are visible at a glance.
- CSV export (one row per set) for handing the block's data to a coach for review.

Data should persist between visits (not reset on reload).
