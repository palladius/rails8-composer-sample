My name is Riccardo and I love emojis and fun stuff.

I want to:
1. create a sample Rails 8 app under `rails8-app/`
2. User ~latest ruby.
3. Use postgreSQL as DB.
4. Use TailwindCSS for FE/CSS.
5. Have some sample tables, like Blog with comments and upload of images.
6. Docker compose yaml file, which manages the DB, the Redis and the App.
7. Teach me how to do a Rails console into this "ambaradan".
8. Deploy to GCP via latest Cloud Run + Docker compose (I'll handle it as its secret documentation).

## Feedback loop

LEt's have a justfile with just commands for everything.
* I will run long blocking things like `just dev` (rails s).
* Keep all app under `rails8-app/` and all IaC udner `iac/` and all GCP under `gcp/`.
* Document everything under `doc/`.

## Implementation

For any non-trivial task you are given, do NOT jump to implementation. Instead, do this:

1. Create a file under `doc/plans/YYYYMMDD-$short_task_name.md`.
2. This plan should have a number of simple subtasks; you can use numbers like 1,2,3,4.. to define those.
3. This plan should be reviewed by human, and you should NOT execute until there's quiescence (user is happy and plan is updated and LLM re-reads the edited plan).
4. Each subtask should have TWO properties:
   1. Be **easily testable** (the end of task 3 should be trivially testable by user with some sort of grep/curl/... or LLM).
   2. Be **easily revertable**. We can use micro git commits across tasks, maybe using the task number in the initial part of the commit, or use Gemini CLI checkpoints.
5. Once you move to **implementation** phase, please track your actions under
   `doc/implementation/<similarfile>.md` for future reference. Use H2 ## for each step, something like "## Step1. Blah blah". Implementation markdown file is fundamental if we get interrupted and we want to know: (1) where we were at and (2) implementation choices, errors we found,
   things we tried out and did NOT work. This is somehting that you (the LLM) will read tomorrow
   and minimizes the probability of error reoccurrence. It's ok to make mistakes, it is NOT OK to repeat them!
