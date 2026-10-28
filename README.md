# Barber Platform

Multi-tenant platform for barbershops in Syria: a customer Android app for discovering barbers and
booking appointments, and a tenant Android app for managing branches, employees, services,
bookings, promotions and payroll. iOS and web are planned for later releases.

## Requirements
Requirements are managed with a requirements-engineering workflow. The single source of truth is
[`docs/re/`](docs/re/README.md):

| Document | Purpose |
|---|---|
| [SRS](docs/re/SRS.md) | Purpose, scope, constraints |
| [Stakeholders](docs/re/stakeholders.md) | Roles and requirement sources |
| [Glossary](docs/re/glossary.md) | Domain terms |
| [Open questions](docs/re/open-questions.md) | Pending decisions |
| [RTM](docs/re/traceability/RTM.md) | Traceability matrix |

## Conventions
- Conventional Commits with a `Refs:` trailer (e.g. `Refs: FR-001`).
- No direct commits to `main`; every change goes through a pull request.
- See [`docs/re/README.md`](docs/re/README.md) for details.
