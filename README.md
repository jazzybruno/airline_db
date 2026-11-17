# airline_db

ALU group activity: an airline's passengers and bookings in MySQL.

## How to run

Run the files in order (01_schema.sql recreates the database each time):

```bash
mysql -u root -p < 01_schema.sql
mysql -u root -p < 02_seed.sql
mysql -u root -p -t < 03_queries.sql
```

## Team

| Name | Role | Tasks |
|---|---|---|
| Jazzy Bruno | Navigator + Repo owner | Repo setup, Live Share, constraints, review |
| Pacifique Mico | Driver (Schema) | `01_schema.sql` |
| Iris Ngabo | Data lead | `02_seed.sql` |
| Yanice Murangwa Shami | Query lead | Read and Join queries |
| Vainqueur Ishimwe | QA | Update and Delete queries, end-to-end test, screenshots |
| Bellamy Biramahire | Presenter + Scribe | README, proof, video, submission |

No absent members.

## Design decisions

- **Two tables:** `passengers` and `bookings`, linked by `bookings.passenger_id` (foreign key), so one passenger can have many bookings.
- **`class_tier` is an ENUM** of Economy, Business and First, so no other tier can be stored.
- **Perk columns are nullable:** Economy has no perks, Business has a lounge pass, First has a lounge pass, suite and chauffeur. `NULL` means the tier doesn't include that perk.
- **`travel_date` is a DATE**, so dates sort and compare correctly.
- **Deletes go to `bookings` first:** a passenger who still has bookings can't be deleted without breaking the foreign key.
- **The Join uses `CASE`** so Economy rows show "No perks" instead of an empty value.

## Proof

Screenshots of the Meet, query outputs and commit history are in `screenshots/`.
