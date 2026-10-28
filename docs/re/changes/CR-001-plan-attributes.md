# CR-001 — Clarify plan attributes and matrix (F-002)
- **Issue:** #18
- **Requested by / Source:** SH-01 (Product Owner) — answers to F-002 spec questions Q3, Q6, Q7, Q10 (PR #17)
- **Date raised:** 2026-10-28
- **Decision:** Approved — 2026-10-28 (by Product Owner)

## Current State
- **FR-021 — Manage plans** (Approved): "The system shall allow the Platform Operator to create and edit subscription plans with a name, a plan level, a price in SYP and a subscription duration." AC1 create, AC2 edit price, AC3 non-operator rejected.
- **FR-023 — Plan-feature matrix** (Approved): AC2 "the matrix lists at least: prices display, booking, maps navigation, discount codes, AI haircut preview."
- **FR-025 — Included preview credits per plan** (Approved): "The system shall allow the Platform Operator to set the number of AI preview credits included with each plan." AC1 only.
- **FR-142 — Single free plan** (Approved): "The system shall provide exactly one free plan that the Platform Operator cannot delete." AC1 exists on new installation, AC2 cannot be deleted, AC3 matrix editable.

## Proposed Change
- **FR-021** — Statement: "The system shall allow the Platform Operator to create and edit paid subscription plans with a name, a unique plan level, a price in SYP and a subscription duration."
  - Add AC4: Given an existing plan with level L, when the Platform Operator saves another plan with level L, then the system rejects it.
  - Add AC5: Given a plan whose price or duration is edited, when the change is saved, then tenants in a current subscription period keep their price and expiry date, and the new values apply to new subscriptions and renewals.
- **FR-023** — AC2: "the matrix lists exactly: prices display, booking, maps navigation, discount codes, AI haircut preview."
- **FR-025** — Add AC2: Given a plan with the AI haircut preview disabled, when the Platform Operator views or edits its included credits, then the value is 0 and cannot be changed.
- **FR-142** — Statement: "The system shall provide exactly one predefined free plan with a price of 0 SYP, no subscription duration and the lowest plan level, which the Platform Operator cannot delete."
  - Add AC4: Given the free plan, when the Platform Operator edits it, then only its name and its plan-feature matrix entries can be changed.
  - Add AC5: Given the free plan, when the Platform Operator saves a paid plan with a level lower than or equal to the free plan's level, then the system rejects it.

## Reason
The approved statements leave the free plan's attributes, plan-level uniqueness, the effect of price edits, the matrix scope and credits on plans without AI preview undefined; the F-002 spec cannot be completed without these decisions.

## Impact Analysis
| Area | Affected items | Notes |
|---|---|---|
| Requirements | FR-021, FR-023, FR-025, FR-142 | Remain `Approved` after the CR is accepted; History updated |
| Use cases | — | None defined yet |
| Decisions | — | None |
| Code / modules | — | No implementation yet |
| Tests | — | No tests yet; new ACs FR-021-AC4/AC5, FR-025-AC2, FR-142-AC4/AC5 to be covered when implemented |
| Schedule / Milestone | v1.0 | F-002 spec (PR #17) to be updated after the RE PR is merged |

- **Effort:** S
- **Risk:** Low — documentation only; no code or tests exist.
- **Alternatives considered:** Leaving the questions to the plan phase (rejected: constitution Principle 4 forbids resolving gaps by assumption).

## Resulting Changes
- PR #19: FR-021, FR-023, FR-025, FR-142 updated (remain `Approved`).
