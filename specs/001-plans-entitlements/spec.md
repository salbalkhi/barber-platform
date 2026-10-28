# Feature Specification: Plans & Entitlements

**Feature**: F-002 — Plans & Entitlements

**Requirements**: FR-021, FR-022, FR-023, FR-024, FR-025, FR-026, FR-142

**Feature Branch**: `spec/F-002-plans-entitlements`

**Created**: 2026-10-28

**Status**: Draft

**Input**: User description: "Specify feature F-002 "Plans & Entitlements" of salbalkhi/barber-platform."

> Requirement text lives in [docs/re/requirements/functional.md](../../docs/re/requirements/functional.md)
> on `main`. This spec references requirements by global ID and does not restate or override them.
> Acceptance scenarios below quote the acceptance criteria verbatim and are labelled
> `<REQ-ID>-AC<n>`.

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Platform Operator manages plans, the free plan and the plan-feature matrix (Priority: P1)

In the web back-office, the Platform Operator creates and edits subscription plans (name, plan
level, price in SYP, subscription duration). Exactly one free plan exists and cannot be deleted;
every tenant without an active paid subscription is on it. The operator then configures, per plan,
which tenant features are enabled, the customer contact type (phone call or in-app chat) and the
number of included AI preview credits.

**Why this priority**: Plans and the free plan are the base every other part of this feature (and
F-003, F-004, F-005, F-007, F-010) depends on. Within this story, plan management and the free plan
come first and the plan-feature matrix second, following the requirement dependencies
(FR-023 depends on FR-021; FR-024 and FR-025 depend on FR-023).

**Independent Test**: Can be tested entirely in the web back-office by creating and editing plans,
attempting to delete the free plan, and configuring the matrix, without any customer or tenant app.

**Acceptance Scenarios**:

*Plans and the free plan*

1. **FR-021-AC1**: **Given** the Platform Operator, **when** they create a plan with name, level,
   price and duration, **then** the plan is available for assignment to tenants.
2. **FR-021-AC2**: **Given** an existing plan, **when** the Platform Operator changes its price,
   **then** the plan shows the new price.
3. **FR-021-AC3**: **Given** a non-operator user, **when** they attempt to create or edit a plan,
   **then** the system rejects the request.
4. **FR-142-AC1**: **Given** a new installation, **when** the plans are listed, **then** exactly
   one plan is marked free.
5. **FR-142-AC2**: **Given** the free plan, **when** the Platform Operator tries to delete it,
   **then** the system rejects the request.

*Plan-feature matrix*

6. **FR-023-AC1**: **Given** a plan and a feature, **when** the Platform Operator enables the
   feature for the plan, **then** the matrix shows the feature as enabled for that plan.
7. **FR-023-AC2**: **Given** the matrix, **when** it is viewed, **then** it lists at least: prices
   display, booking, maps navigation, discount codes, AI haircut preview.
8. **FR-025-AC1**: **Given** a plan, **when** the Platform Operator sets its included credits to
   N, **then** the matrix shows N for that plan.
9. **FR-142-AC3**: **Given** the free plan, **when** the Platform Operator changes its features in
   the matrix, **then** the change is saved.

---

### User Story 2 - Tenant Admin sees the tenant's current plan (Priority: P2)

In the tenant app, the Tenant Admin sees which plan the tenant is currently on. A tenant without
an active paid subscription is on the free plan.

**Why this priority**: Depends on plans and the free plan from User Story 1; it makes the plan
assignment of FR-022 visible to the tenant.

**Independent Test**: Can be tested by creating a tenant without a paid subscription and viewing
its plan.

**Acceptance Scenarios**:

1. **FR-022-AC1**: **Given** a newly created tenant without a paid subscription, **when** its plan
   is viewed, **then** the plan is the free plan.
2. **FR-022-AC2** *(deferred verification — implemented now, verifiable after F-005, grace period
   FR-032)*: **Given** a tenant whose grace period ended, **when** its plan is viewed, **then** the
   plan is the free plan.

*See Q1 under "Questions for the product owner": no requirement yet states that the Tenant Admin
can view the current plan in the tenant app.*

---

### User Story 3 - Customer gets features and the contact action according to the tenant's plan (Priority: P3)

In the customer app, a customer viewing a tenant's branches and services sees only the tenant
features enabled for that tenant's current plan. The contact action on a branch is a phone call or
an in-app chat, depending on the plan's contact type. Changes the operator makes to the matrix
reach customers without an app update.

**Why this priority**: Enforcement is last: it depends on plans (User Story 1) and the matrix
(FR-026 depends on FR-023).

**Independent Test**: Can be tested by configuring a plan in the matrix, assigning a tenant to it
and viewing that tenant's branches and services in the customer app.

**Acceptance Scenarios**:

1. **FR-026-AC1**: **Given** a tenant whose plan disables prices display, **when** a customer
   views its services, **then** no prices are shown.
2. **FR-026-AC2**: **Given** a tenant whose plan disables booking, **when** a customer views its
   branches, **then** no booking action is available.
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
- The Platform Operator attempts to delete the free plan (FR-142-AC2).
- A tenant's grace period ends (FR-022-AC2, deferred).
- The operator enables a feature while customers already have the app installed (FR-026-AC3).

Edge cases without a defined outcome in the requirements are listed as questions Q3–Q9 below; they
are not resolved in this spec.

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

Non-functional requirements: none referenced. `docs/re/requirements/non-functional.md` contains no
entries yet.

### Key Entities

Definitions per [docs/re/glossary.md](../../docs/re/glossary.md).

- **Plan**: A subscription offering (free or paid) with a name, a plan level, a price in SYP and a
  subscription duration (FR-021). Exactly one plan is the free plan (FR-142).
- **Plan Level**: Numeric rank of a plan set by the operator; used for search ordering (F-004).
- **Plan-Feature Matrix**: Per plan, which tenant features are enabled (FR-023), the contact type
  (FR-024) and the number of included AI preview credits (FR-025).
- **Tenant Feature**: Prices display, booking, maps navigation, discount codes, AI haircut preview
  (FR-023-AC2). The contact action is on every plan; only its type is set per plan.
- **Tenant**: Has exactly one current plan; the free plan when it has no active paid subscription
  (FR-022).

Referenced, owned by other features: **Grace Period** (F-005, FR-032), **Credit Batch** (F-007).

## Success Criteria *(mandatory)*

No non-functional target values exist for this feature in `requirements/non-functional.md`, so none
are set here (constitution Principle IV).

### Measurable Outcomes

- **SC-001**: All 14 non-deferred acceptance scenarios of FR-021, FR-022, FR-023, FR-024, FR-025,
  FR-026 and FR-142 pass.
- **SC-002**: FR-022-AC2 passes once F-005 is delivered, and FR-024-AC2 passes once F-010 is
  delivered, without changes to this feature's behavior.
- **SC-003**: The Platform Operator changes which tenant features a plan provides without an app
  release (FR-023, FR-026-AC3).

## Dependencies

Sequencing constraints for implementation; they are not part of this feature's scope.

- **F-001 — Tenancy & Organization** (not yet approved): FR-022 depends on FR-001 (create tenant);
  FR-024 depends on FR-003 (create branch, which provides the branch phone number used by
  FR-024-AC1).
- **F-011 — Notifications Foundation** (not yet approved): implementation depends on it (F-001
  depends on F-011 in `docs/re/features.md`). See Q2.

## Out of Scope

- Subscription payments, activation, renewal, grace period and fallback to the free plan after it
  (F-005).
- Credit batches and their consumption (F-007).
- In-app chat itself (F-010).
- Search ordering by plan level (F-004).

## Assumptions

None. Per constitution Principle IV, gaps are not resolved by assumption; they are listed below.

## Questions for the product owner

- **Q1 (FR-022; user story 2)**: No requirement states that the Tenant Admin can see the
  tenant's current plan in the tenant app. FR-022-AC1 and FR-022-AC2 only say "when its plan is
  viewed", without saying who views it or where. Is a requirement needed for this, or is plan
  visibility limited to the Platform Operator?
- **Q2 (F-002 dependencies)**: `docs/re/features.md` lists F-002 as depending on F-001 only. The
  feature request also names F-011 (Notifications Foundation). No F-002 requirement depends on
  notifications. Is F-011 a direct dependency of F-002, or only a transitive one through F-001?
- **Q3 (FR-021, FR-142)**: Which FR-021 attributes apply to the free plan? Does it have a price
  (zero?), a subscription duration and a plan level? Can the operator edit them? The glossary says
  the free plan ranks last; must its plan level be enforced as the lowest?
- **Q4 (FR-021, FR-142)**: How does the single free plan come to exist "on a new installation"
  (FR-142-AC1)? Is it predefined by the system, or created by the operator? Can the operator delete
  or retire paid plans? FR-021 covers only create and edit.
- **Q5 (FR-021-AC1, FR-022)**: "Available for assignment to tenants": is a tenant assigned to a
  paid plan only through a subscription (F-005), or can the Platform Operator also assign a plan to
  a tenant directly? No requirement covers direct assignment.
- **Q6 (FR-021)**: Can two plans have the same plan level? What happens to existing tenants'
  subscriptions when a plan's price or duration is edited (FR-021-AC2)? Or is that F-005's
  concern?
- **Q7 (FR-023-AC2)**: The matrix lists "at least" five tenant features. Can the operator add new
  tenant features, or is the list fixed to the five in the glossary?
- **Q8 (FR-026)**: The statement covers features provided "to the tenant and its customers", but
  the acceptance criteria cover only the customer side. When a feature is disabled for a tenant's
  plan, what changes in the tenant app (e.g. discount codes, AI preview grants)? Do the other three
  features (maps navigation, discount codes, AI haircut preview) need acceptance criteria here, or
  in F-004, F-006 and F-007?
- **Q9 (FR-026-AC1, FR-026-AC2)**: These scenarios need services and booking, which are defined in
  F-003, and F-003 depends on F-002. Should FR-026-AC1 and FR-026-AC2 also be marked as deferred
  verification (verifiable after F-003)?
- **Q10 (FR-025, FR-023)**: If the AI haircut preview feature is disabled for a plan but the plan
  has N > 0 included credits, what applies?
