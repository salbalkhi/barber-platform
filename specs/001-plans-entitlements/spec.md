# Feature Specification: Plans & Entitlements

**Feature**: F-002 — Plans & Entitlements

**Requirements**: FR-021, FR-022, FR-023, FR-024, FR-025, FR-026, FR-142, FR-153, FR-154

**Feature Branch**: `spec/F-002-plans-entitlements-followup`

**Created**: 2026-10-28

**Status**: Draft

**Input**: User description: "Specify feature F-002 "Plans & Entitlements" of salbalkhi/barber-platform."

> Requirement text lives in [docs/re/requirements/functional.md](../../docs/re/requirements/functional.md)
> on `main`. This spec references requirements by global ID and does not restate or override them.
> Acceptance scenarios below quote the acceptance criteria verbatim and are labelled
> `<REQ-ID>-AC<n>`.

## Clarifications

### Session 2026-10-28

Product owner answers to the spec questions of PR #17. Requirement changes were made through the
RE process: CR-001 (#18, PR #19) changed FR-021, FR-023, FR-025 and FR-142; FR-153 and FR-154 were
added (PR #19) and approved (PR #20).

- Q1 (Tenant Admin sees current plan) → FR-153 — View current plan.
- Q2 (F-011 dependency) → F-011 is not a direct dependency of F-002; it is transitive through F-001.
- Q3 (free plan attributes) → resolved by CR-001 in FR-142.
- Q4 (free plan creation, plan deletion) → the free plan is predefined by the system (FR-142); plans
  are never deleted; paid plans can be retired (FR-154).
- Q5 (plan assignment) → a tenant gets a paid plan only through a subscription in F-005 (FR-027
  manual activation or FR-028 Sham Cash). "Available for assignment to tenants" in FR-021-AC1 means
  selectable there. F-002 has no direct plan assignment.
- Q6 (plan level uniqueness, price/duration edits) → resolved by CR-001 in FR-021.
- Q7 (feature list) → resolved by CR-001 in FR-023: exactly the five tenant features; no
  operator-defined features.
- Q8 (tenant-side enforcement) → FR-026 is unchanged. Tenant-side enforcement lives in the owning
  features (FR-085-AC3, FR-035); no new scenarios in F-002.
- Q9 (FR-026-AC1, FR-026-AC2) → deferred verification, verifiable after F-003.
- Q10 (credits without AI preview) → resolved by CR-001 in FR-025.

Product owner answers to the open questions of PR #21 (no requirement changes):

- FR-154-AC1, FR-154-AC2 → deferred verification, verifiable after F-005. F-005 owns plan selection
  for new subscriptions, upgrades and renewals, and the current subscription period.
  FR-154-AC3 is verifiable now.
- FR-035 → belongs to F-005 (range FR-027..FR-040 in `docs/re/features.md`), not F-007; this
  corrects the Q8 answer above. Its verification depends on F-007, where quota grants and previews
  are defined.

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Platform Operator manages plans, the free plan and the plan-feature matrix (Priority: P1)

In the web back-office, the Platform Operator creates and edits paid subscription plans (name,
unique plan level, price in SYP, subscription duration) and can retire a paid plan. The system
provides exactly one predefined free plan, which cannot be deleted or retired; every tenant without
an active paid subscription is on it. The operator then configures, per plan, which tenant features
are enabled, the customer contact type (phone call or in-app chat) and the number of included AI
preview credits.

**Why this priority**: Plans and the free plan are the base every other part of this feature (and
F-003, F-004, F-005, F-007, F-010) depends on. Within this story, plan management and the free plan
come first and the plan-feature matrix second, following the requirement dependencies
(FR-023 depends on FR-021; FR-024 and FR-025 depend on FR-023).

**Independent Test**: Can be tested in the web back-office by creating, editing and retiring plans,
attempting to delete or retire the free plan, and configuring the matrix.

**Acceptance Scenarios**:

*Plans and the free plan*

1. **FR-021-AC1**: **Given** the Platform Operator, **when** they create a plan with name, level,
   price and duration, **then** the plan is available for assignment to tenants.
2. **FR-021-AC2**: **Given** an existing plan, **when** the Platform Operator changes its price,
   **then** the plan shows the new price.
3. **FR-021-AC3**: **Given** a non-operator user, **when** they attempt to create or edit a plan,
   **then** the system rejects the request.
4. **FR-021-AC4**: **Given** an existing plan with level L, **when** the Platform Operator saves
   another plan with level L, **then** the system rejects it.
5. **FR-021-AC5** *(deferred verification — implemented now, verifiable after F-005)*: **Given** a
   plan whose price or duration is edited, **when** the change is saved, **then** tenants in a
   current subscription period keep their price and expiry date, and the new values apply to new
   subscriptions and renewals.
6. **FR-142-AC1**: **Given** a new installation, **when** the plans are listed, **then** exactly
   one plan is marked free.
7. **FR-142-AC2**: **Given** the free plan, **when** the Platform Operator tries to delete it,
   **then** the system rejects the request.
8. **FR-142-AC4**: **Given** the free plan, **when** the Platform Operator edits it, **then** only
   its name and its plan-feature matrix entries can be changed.
9. **FR-142-AC5**: **Given** the free plan, **when** the Platform Operator saves a paid plan with a
   level lower than or equal to the free plan's level, **then** the system rejects it.
10. **FR-154-AC1** *(deferred verification — implemented now, verifiable after F-005)*: **Given** a
    retired plan, **when** a Tenant Admin opens the plan selection, **then** the retired plan is not
    offered.
11. **FR-154-AC2** *(deferred verification — implemented now, verifiable after F-005)*: **Given** a
    tenant subscribed to a plan that is then retired, **when** the plan is viewed during the current
    period, **then** the tenant keeps it until its expiry date.
12. **FR-154-AC3**: **Given** the free plan, **when** the Platform Operator tries to retire it,
    **then** the system rejects the request.

*Plan-feature matrix*

13. **FR-023-AC1**: **Given** a plan and a feature, **when** the Platform Operator enables the
    feature for the plan, **then** the matrix shows the feature as enabled for that plan.
14. **FR-023-AC2**: **Given** the matrix, **when** it is viewed, **then** it lists exactly: prices
    display, booking, maps navigation, discount codes, AI haircut preview.
15. **FR-025-AC1**: **Given** a plan, **when** the Platform Operator sets its included credits to
    N, **then** the matrix shows N for that plan.
16. **FR-025-AC2**: **Given** a plan with the AI haircut preview disabled, **when** the Platform
    Operator views or edits its included credits, **then** the value is 0 and cannot be changed.
17. **FR-142-AC3**: **Given** the free plan, **when** the Platform Operator changes its features in
    the matrix, **then** the change is saved.

---

### User Story 2 - Tenant Admin sees the tenant's current plan (Priority: P2)

In the tenant app, the Tenant Admin opens the plan screen and sees the tenant's current plan and
the tenant features it enables. A tenant without an active paid subscription is on the free plan.

**Why this priority**: Depends on plans, the free plan and the matrix from User Story 1 (FR-153
depends on FR-022 and FR-023).

**Independent Test**: Can be tested by creating a tenant without a paid subscription and opening
the plan screen as its Tenant Admin.

**Acceptance Scenarios**:

1. **FR-022-AC1**: **Given** a newly created tenant without a paid subscription, **when** its plan
   is viewed, **then** the plan is the free plan.
2. **FR-022-AC2** *(deferred verification — implemented now, verifiable after F-005, grace period
   FR-032)*: **Given** a tenant whose grace period ended, **when** its plan is viewed, **then** the
   plan is the free plan.
3. **FR-153-AC1**: **Given** a tenant on plan P, **when** the Tenant Admin opens the plan screen in
   the tenant app, **then** plan P's name and its enabled tenant features are shown.
4. **FR-153-AC2**: **Given** a tenant on the free plan, **when** the Tenant Admin opens the plan
   screen, **then** the free plan and its enabled features are shown.

---

### User Story 3 - Customer gets features and the contact action according to the tenant's plan (Priority: P3)

In the customer app, a customer viewing a tenant's branches and services sees only the tenant
features enabled for that tenant's current plan. The contact action on a branch is a phone call or
an in-app chat, depending on the plan's contact type. Changes the operator makes to the matrix
reach customers without an app update.

**Why this priority**: Enforcement is last: it depends on plans (User Story 1) and the matrix
(FR-026 depends on FR-023).

**Independent Test**: Can be tested by configuring a plan in the matrix, putting a tenant on it and
viewing that tenant's branches in the customer app.

**Acceptance Scenarios**:

1. **FR-026-AC1** *(deferred verification — implemented now, verifiable after F-003)*: **Given** a
   tenant whose plan disables prices display, **when** a customer views its services, **then** no
   prices are shown.
2. **FR-026-AC2** *(deferred verification — implemented now, verifiable after F-003)*: **Given** a
   tenant whose plan disables booking, **when** a customer views its branches, **then** no booking
   action is available.
3. **FR-026-AC3**: **Given** the operator enables a feature for the tenant's plan, **when** a
   customer next loads the tenant's page, **then** the feature is available without an app update.
4. **FR-024-AC1**: **Given** a plan set to phone call, **when** a customer views a branch of a
   tenant on that plan, **then** the contact action starts a phone call to the branch number.
5. **FR-024-AC2** *(deferred verification — implemented now, verifiable after F-010, in-app
   chat)*: **Given** a plan set to in-app chat, **when** a customer views a branch of a tenant on
   that plan, **then** the contact action opens an in-app chat.

---

### Edge Cases

Edge cases covered by acceptance criteria:

- A non-operator user attempts to create or edit a plan (FR-021-AC3).
- Two plans with the same plan level (FR-021-AC4).
- A paid plan with a level lower than or equal to the free plan's level (FR-142-AC5).
- Editing a plan's price or duration while tenants are in a current subscription period
  (FR-021-AC5, deferred).
- The Platform Operator attempts to delete the free plan (FR-142-AC2), edit its price, duration or
  level (FR-142-AC4) or retire it (FR-154-AC3).
- A plan is retired while tenants are subscribed to it (FR-154-AC2, deferred).
- AI haircut preview disabled for a plan with included credits (FR-025-AC2).
- A tenant's grace period ends (FR-022-AC2, deferred).
- The operator enables a feature while customers already have the app installed (FR-026-AC3).

## Requirements *(mandatory)*

### Functional Requirements

Only global IDs; statements and acceptance criteria live in
[docs/re/requirements/functional.md](../../docs/re/requirements/functional.md).

- [FR-021 — Manage plans](../../docs/re/requirements/functional.md#fr-021--manage-plans)
- [FR-022 — Free plan](../../docs/re/requirements/functional.md#fr-022--free-plan)
- [FR-023 — Plan-feature matrix](../../docs/re/requirements/functional.md#fr-023--plan-feature-matrix)
- [FR-024 — Contact type per plan](../../docs/re/requirements/functional.md#fr-024--contact-type-per-plan)
- [FR-025 — Included preview credits per plan](../../docs/re/requirements/functional.md#fr-025--included-preview-credits-per-plan)
- [FR-026 — Feature enforcement](../../docs/re/requirements/functional.md#fr-026--feature-enforcement)
- [FR-142 — Single free plan](../../docs/re/requirements/functional.md#fr-142--single-free-plan)
- [FR-153 — View current plan](../../docs/re/requirements/functional.md#fr-153--view-current-plan)
- [FR-154 — Retire paid plan](../../docs/re/requirements/functional.md#fr-154--retire-paid-plan)
  (priority: Should)

Non-functional requirements: none referenced. `docs/re/requirements/non-functional.md` contains no
entries yet.

### Key Entities

Definitions per [docs/re/glossary.md](../../docs/re/glossary.md).

- **Plan**: A subscription offering (free or paid). Paid plans have a name, a unique plan level, a
  price in SYP and a subscription duration (FR-021) and can be retired (FR-154); plans are never
  deleted. Exactly one predefined free plan exists (FR-142).
- **Plan Level**: Numeric rank of a plan set by the operator; unique per plan (FR-021); the free
  plan has the lowest level (FR-142). Used for search ordering (F-004).
- **Plan-Feature Matrix**: Per plan, which tenant features are enabled (FR-023), the contact type
  (FR-024) and the number of included AI preview credits (FR-025).
- **Tenant Feature**: Exactly five: prices display, booking, maps navigation, discount codes, AI
  haircut preview (FR-023-AC2). The contact action is on every plan; only its type is set per plan.
- **Tenant**: Has exactly one current plan; the free plan when it has no active paid subscription
  (FR-022). A tenant gets a paid plan only through a subscription in F-005 (FR-027, FR-028).

Referenced, owned by other features: **Grace Period** (F-005, FR-032), **Credit Batch** (F-007).

## Success Criteria *(mandatory)*

No non-functional target values exist for this feature in `requirements/non-functional.md`, so none
are set here (constitution Principle IV).

### Measurable Outcomes

- **SC-001**: All 19 non-deferred acceptance scenarios of FR-021, FR-022, FR-023, FR-024, FR-025,
  FR-026, FR-142, FR-153 and FR-154 pass.
- **SC-002**: The 7 deferred scenarios pass once their features are delivered, without changes to
  this feature's behavior: FR-021-AC5, FR-022-AC2, FR-154-AC1 and FR-154-AC2 after F-005,
  FR-026-AC1 and FR-026-AC2 after F-003, FR-024-AC2 after F-010.
- **SC-003**: The Platform Operator changes which tenant features a plan provides without an app
  release (FR-023, FR-026-AC3).

## Dependencies

Sequencing constraints for implementation; they are not part of this feature's scope.

- **F-001 — Tenancy & Organization** (direct; not yet approved): FR-022 depends on FR-001 (create
  tenant); FR-024 depends on FR-003 (create branch, which provides the branch phone number used by
  FR-024-AC1).
- **F-011 — Notifications Foundation** (transitive only, through F-001).
- **Deferred verification**: F-003 (FR-026-AC1, FR-026-AC2), F-005 (FR-021-AC5, FR-022-AC2,
  FR-154-AC1, FR-154-AC2), F-010 (FR-024-AC2).
- **Tenant-side enforcement in owning features**: discount codes, FR-085-AC3 (F-006); AI preview
  grants, FR-035 (F-005; verifiable after F-007).

## Out of Scope

- Assigning a plan to a tenant: a tenant gets a paid plan only through a subscription in F-005
  (FR-027 manual activation, FR-028 Sham Cash). F-002 has no direct plan assignment.
- Subscription payments, activation, renewal, grace period and fallback to the free plan after it
  (F-005).
- Tenant-side enforcement of disabled features in the owning features: discount codes,
  FR-085-AC3 (F-006); AI preview grants, FR-035 (F-005; verifiable after F-007).
- Credit batches and their consumption (F-007).
- In-app chat itself (F-010).
- Search ordering by plan level (F-004).

## Assumptions

None. Per constitution Principle IV, gaps are not resolved by assumption; they are raised as
questions for the product owner.

## Questions for the product owner

None open. All questions are resolved and recorded under "Clarifications".
