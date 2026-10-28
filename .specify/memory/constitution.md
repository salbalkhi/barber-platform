# Barber Platform Constitution

## Core Principles

### I. Requirements Single Source of Truth

- `docs/re/` on `main` is the only source of truth for requirements: `SRS.md`,
  `requirements/functional.md`, `requirements/non-functional.md`, `glossary.md`,
  `open-questions.md`, `features.md` and `traceability/RTM.md`.
- Anything not merged into `main` under `docs/re/` is a draft and MUST NOT be implemented.
- Specs, plans and tasks reference requirements; they MUST NOT restate, reword or override
  them. When a spec needs the requirement text, it quotes the ID and title and links to the
  file.

**Rationale:** One approved place for requirements prevents drift between what was agreed
and what is built.

### II. Global Requirement IDs (No Local Numbering)

- Requirement IDs are global and owned by `docs/re/`: `FR-xxx`, `NFR-xxx`, `UC-xxx`,
  `CR-xxx`, `ADR-xxx`, `OQ-xxx`, `F-xxx`.
- In every `spec.md`, the "Functional Requirements" section lists only existing global IDs
  (e.g. `FR-041 — Service catalog`). Local IDs, such as a spec-local `FR-001`, MUST NOT be
  created.
- Acceptance scenarios in `spec.md` map one-to-one to the acceptance criteria of the
  referenced requirements and are labelled `<REQ-ID>-AC<n>` (e.g. `FR-050-AC2`).

**Rationale:** A single ID space keeps traceability unambiguous across specs, code, tests
and the RTM.

### III. Feature Intake Gate

- A feature MAY enter `/speckit-specify` only if it is listed in `docs/re/features.md` and
  every requirement it references has status `Approved` in `docs/re/requirements/*.md`.
- If any referenced requirement is `Proposed`, `Rejected` or `Deprecated`, or is linked to
  an open `OQ-xxx`, specification MUST stop and the blocking IDs MUST be reported to the
  product owner instead.
- Feature order and dependencies follow `docs/re/features.md`.

**Rationale:** Only approved, unblocked requirements are worth specifying; everything else
creates rework.

### IV. No Invention, No Scope Creep

- Behavior that is not covered by an `Approved` requirement MUST NOT be added.
- When specifying, clarifying or planning reveals a gap, ambiguity or conflict, it MUST NOT
  be resolved by assumption. It is recorded in the spec under "Questions for the product
  owner" with the related requirement IDs, and work stops for a decision.
- Requirement changes happen only through the RE process (new requirement or change
  request), never inside a spec, plan or code.
- Target values for non-functional requirements are never invented; they come only from
  `requirements/non-functional.md`.

**Rationale:** Decisions about scope belong to the product owner, not to the person or agent
writing the spec or code.

### V. Traceability in Code and Tests

- Every automated test that verifies an acceptance criterion names it in the test name or
  annotation, e.g. `FR_050_AC2_...`.
- `tasks.md` lists, for each task, the requirement IDs it implements.
- Pull request descriptions list the implemented requirement IDs and the acceptance criteria
  covered by tests.

**Rationale:** Every requirement can be followed to the code and tests that satisfy it, and
back.

### VI. Git and Pull Requests

- Changes MUST NOT be committed directly to `main`. Every change goes through a branch and a
  pull request.
- Commits follow Conventional Commits with a mandatory `Refs:` trailer using global IDs,
  e.g. `feat(booking): offer available start times` + `Refs: FR-050`. `feat`, `fix`, `perf`
  and `test` commits always require `Refs:`.
- Pull requests use the repository template (`.github/pull_request_template.md`).
- Code pull requests MUST NOT modify files under `docs/re/`. Requirement statuses, the RTM
  and open questions are updated only by the RE process.
- History on shared branches MUST NOT be rewritten (no force-push, no rebase of pushed
  commits).

**Rationale:** Reviewed, traceable history protects `main` as the approved baseline.

### VII. Architecture Decisions

- Technology and architecture choices are made during `/speckit-plan` together with the
  product owner.
- Any decision that constrains requirements or other features (e.g. tenant isolation
  strategy, external provider choice) is proposed as an ADR for the RE process to record in
  `docs/re/decisions/`; it MUST NOT be decided silently inside a plan.
- External provider integrations (maps, AI preview, payments, exchange rate, push,
  SMS/OTP) sit behind interfaces so a provider can be replaced; several providers are still
  under feasibility review (`OQ-001`..`OQ-006`).

**Rationale:** Decisions with cross-feature impact need to be visible and recorded, and
providers whose availability in Syria is unconfirmed must be replaceable.

### VIII. Multi-Tenancy, Privacy and Security

- Every data access is scoped to the caller's tenant (FR-011); cross-tenant access is a
  defect.
- Customer face photos for the AI preview are sensitive data: they follow the retention and
  visibility rules in FR-071..FR-081 exactly, and are never logged or used for anything
  else.
- No secrets, keys or credentials are stored in the repository.

**Rationale:** All tenants share one database (C-01), so isolation is enforced on every
access; face photos are the most sensitive data the platform holds.

### IX. Language and Localization

- Code, comments, specs, plans, tasks and commit messages are in English.
- All user-facing text supports Arabic (RTL) and English from the first screen built.

**Rationale:** English keeps engineering artifacts consistent; Arabic and English are both
v1 UI languages, and adding RTL later is costly.

## Product Context

Barber Platform is a multi-tenant platform for barbershops in Syria.

- **v1 channels:** a Customer Android app; a Tenant Android app (Tenant Admin, Branch
  Manager, Barber); a web back-office for the Platform Operator.
- **Data:** a single shared database for all tenants (constraint C-01).
- **UI languages:** Arabic (RTL) and English.
- **Currency:** new Syrian pound (SYP) by default; USD accepted.

## Workflow Gates

Each Spec Kit step checks these principles before it proceeds:

| Step | Gate |
|---|---|
| `/speckit-specify` | Principle III intake gate; Principle II global IDs and `<REQ-ID>-AC<n>` scenarios; Principle IV questions recorded, not assumed |
| `/speckit-clarify` | Principle IV: gaps go to "Questions for the product owner"; no requirement changes |
| `/speckit-plan` | Principle VII: technology choices with the product owner; cross-feature decisions proposed as ADRs; provider interfaces; Principle VIII tenant scoping |
| `/speckit-tasks` | Principle V: requirement IDs on every task |
| `/speckit-implement` | Principles V, VI, VIII, IX |
| Pull request | Principles V and VI; no `docs/re/` changes in code PRs |

## Governance

- This constitution is subordinate to `docs/re/`: if they conflict, `docs/re/` wins and the
  conflict is reported to the product owner.
- Amendments require the product owner's explicit approval and a version bump of this
  constitution.
- Versioning follows semantic versioning: MAJOR for removing or redefining a principle,
  MINOR for adding a principle or materially expanding guidance, PATCH for clarifications
  and wording.
- Every specification, plan, task list and pull request review checks compliance with this
  constitution.

**Version**: 1.0.0 | **Ratified**: 2026-10-28 | **Last Amended**: 2026-10-28
