# Functional Requirements

> One section per requirement. IDs are never reused. Rejected/Deprecated requirements stay in this file.
> Copy the template below for each new requirement.

<!-- TEMPLATE — copy, do not edit in place
### FR-xxx — <Short title>
- **Statement:** The system shall <verb> <object> [<condition>].
- **Rationale:** <why this is needed>
- **Source:** <stakeholder / document / CR-xxx>
- **Priority:** Must | Should | Could | Won't
- **Status:** Proposed | Approved | Implemented | Verified | Rejected | Deprecated
- **Acceptance Criteria:**
  - AC1: Given <context>, when <action>, then <observable result>.
- **Verification Method:** Test | Inspection | Analysis | Demonstration
- **Dependencies:** <FR-xxx, NFR-xxx or none>
- **Trace:** UC: <UC-xxx> | ADR: <ADR-xxx> | CR: <CR-xxx>
- **Open Questions:** <OQ-xxx or none>
- **History:** <YYYY-MM-DD> <status change> (<PR #n>)
-->

## Tenancy and Organization

### FR-001 — Create tenant
- **Statement:** The system shall allow the Platform Operator to create a tenant together with its Tenant Admin account.
- **Rationale:** Tenants are onboarded only by the operator; there is no tenant self-registration.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given the Platform Operator is logged in, when they create a tenant with a trade name and Tenant Admin username, then the tenant and its Tenant Admin account exist and the Tenant Admin can log in to the tenant app.
  - AC2: Given a user who is not the Platform Operator, when they attempt to create a tenant, then the system rejects the request.
- **Verification Method:** Test
- **Dependencies:** none
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-013
- **History:** 2026-10-28 Proposed (PR #2)

### FR-002 — Reset Tenant Admin password
- **Statement:** The system shall allow the Platform Operator to reset the password of a Tenant Admin account.
- **Rationale:** Tenant Admin accounts are created by the operator, who also handles their credential recovery.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a Tenant Admin account, when the Platform Operator resets its password, then the previous password no longer authenticates and the new password does.
  - AC2: Given a user who is not the Platform Operator, when they attempt to reset a Tenant Admin password, then the system rejects the request.
- **Verification Method:** Test
- **Dependencies:** FR-001
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-013
- **History:** 2026-10-28 Proposed (PR #2)

### FR-003 — Create branch
- **Statement:** The system shall allow the Tenant Admin to create a branch with a name, a city and a location.
- **Rationale:** A tenant owns one or more branches; the city is used by the favorites rule and the location by proximity search.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a logged-in Tenant Admin, when they create a branch with a name, city and location, then the branch appears in the tenant's branch list.
  - AC2: Given a branch form without a city, when the Tenant Admin submits it, then the system rejects it and indicates that the city is required.
- **Verification Method:** Test
- **Dependencies:** FR-001
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-001
- **History:** 2026-10-28 Proposed (PR #2)

### FR-004 — Branch working hours
- **Statement:** The system shall allow the Tenant Admin to define weekly working hours for each branch.
- **Rationale:** Working hours are defined at branch level only and bound booking availability.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a branch, when the Tenant Admin sets working hours per weekday, then the saved hours are displayed for that branch.
  - AC2: Given a weekday with no working hours, when the branch is viewed, then that weekday is shown as closed.
- **Verification Method:** Test
- **Dependencies:** FR-003
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-005 — Create employee
- **Statement:** The system shall allow the Tenant Admin to create an employee account of type barber or non-barber assigned to exactly one branch.
- **Rationale:** Employees are created by the tenant; each employee belongs to one branch at a time.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a branch of the tenant, when the Tenant Admin creates an employee with a type, a branch, a username and a password, then the employee can log in to the tenant app with those credentials.
  - AC2: Given an employee creation request without a branch, when it is submitted, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-003
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-006 — Reset employee password
- **Statement:** The system shall allow the Tenant Admin to reset the password of an employee of the same tenant.
- **Rationale:** Credential recovery for employees is handled by the tenant.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given an employee of the tenant, when the Tenant Admin resets the password, then the previous password no longer authenticates and the new password does.
  - AC2: Given an employee of another tenant, when the Tenant Admin attempts to reset their password, then the system rejects the request.
- **Verification Method:** Test
- **Dependencies:** FR-005
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-007 — Remove employee
- **Statement:** The system shall allow the Tenant Admin to remove an employee from the tenant.
- **Rationale:** Adding, removing and transferring employees are Tenant Admin permissions only.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given an employee of the tenant, when the Tenant Admin removes them, then the employee can no longer log in to the tenant app.
  - AC2: Given a Branch Manager, when they attempt to remove an employee, then the system rejects the request.
- **Verification Method:** Test
- **Dependencies:** FR-005
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-008 — Tenant app login
- **Statement:** The system shall authenticate Tenant Admins and employees in the tenant app by username and password.
- **Rationale:** Tenant-side users log in with username and password (customers use phone + OTP).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a valid username and password, when the user logs in to the tenant app, then access is granted with the permissions of the user's roles.
  - AC2: Given an invalid password, when the user logs in, then access is denied.
- **Verification Method:** Test
- **Dependencies:** FR-001, FR-005
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-012
- **History:** 2026-10-28 Proposed (PR #2)

### FR-009 — Assign Branch Manager
- **Statement:** The system shall allow the Tenant Admin to assign at most one employee of a branch as that branch's Branch Manager.
- **Rationale:** A branch has zero or one manager, who can be a barber or a non-barber employee of that branch.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a branch without a manager, when the Tenant Admin assigns an employee of that branch, then that employee holds the Branch Manager role for that branch.
  - AC2: Given a branch that already has a manager, when the Tenant Admin assigns another employee, then the system rejects the assignment.
  - AC3: Given an employee of another branch, when the Tenant Admin assigns them as manager of this branch, then the system rejects the assignment.
- **Verification Method:** Test
- **Dependencies:** FR-005
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-010 — Tenant Admin covers branch without manager
- **Statement:** The system shall grant the Tenant Admin all Branch Manager permissions for each branch that has no Branch Manager.
- **Rationale:** A branch without a manager is managed directly by the tenant.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a branch with no Branch Manager, when the Tenant Admin performs any Branch Manager action on that branch, then the system accepts it.
- **Verification Method:** Test
- **Dependencies:** FR-009
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-011 — Tenant data isolation
- **Statement:** The system shall restrict each Tenant Admin and employee to the data of their own tenant.
- **Rationale:** All tenants share a single database (constraint C-01).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given users of tenant A, when they request any data belonging to tenant B, then the system returns no data from tenant B.
- **Verification Method:** Test
- **Dependencies:** FR-008
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-012
- **History:** 2026-10-28 Proposed (PR #2)

### FR-012 — Branch Manager scope
- **Statement:** The system shall restrict a Branch Manager's management permissions to their own branch.
- **Rationale:** A Branch Manager manages exactly one branch.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a Branch Manager of branch X, when they attempt a management action on branch Y of the same tenant, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-009
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-013 — Barber unavailability periods
- **Statement:** The system shall allow the Branch Manager to record unavailability periods for each barber of their branch.
- **Rationale:** Barbers are available during branch working hours except recorded unavailability periods (leave, breaks).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a barber of the branch, when the Branch Manager records an unavailability period, then no new booking can be assigned to that barber within that period.
- **Verification Method:** Test
- **Dependencies:** FR-004, FR-012
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-014 — Barber priority order
- **Statement:** The system shall allow the Tenant Admin to define a priority order of the barbers of each branch.
- **Rationale:** Branch-level bookings are assigned to the available barber with the highest priority.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a branch with several barbers, when the Tenant Admin saves a priority order, then the saved order is displayed for that branch.
- **Verification Method:** Test
- **Dependencies:** FR-005
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-015 — Transfer employee
- **Statement:** The system shall allow the Tenant Admin to transfer an employee to another branch of the same tenant as a temporary transfer with an end date or as a permanent transfer.
- **Rationale:** Employees can be moved between branches, e.g. during seasons; only the Tenant Admin can transfer.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given an employee of branch X, when the Tenant Admin transfers them permanently to branch Y, then the employee belongs to branch Y.
  - AC2: Given an employee of branch X, when the Tenant Admin transfers them temporarily to branch Y with an end date, then the employee belongs to branch Y until the end date.
  - AC3: Given a Branch Manager, when they attempt to transfer an employee, then the system rejects the request.
- **Verification Method:** Test
- **Dependencies:** FR-005
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-016 — Automatic return from temporary transfer
- **Statement:** The system shall return an employee to their original branch at the end date of a temporary transfer.
- **Rationale:** Temporary transfers end automatically.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a temporary transfer ending on date D, when date D is reached, then the employee belongs to the original branch.
- **Verification Method:** Test
- **Dependencies:** FR-015
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-017 — Manager role lost on transfer
- **Statement:** The system shall remove the Branch Manager role of an employee for their original branch when the employee is transferred.
- **Rationale:** A manager who leaves the branch can no longer manage it; the tenant assigns another manager or manages it directly.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given the Branch Manager of branch X, when they are transferred to branch Y, then they no longer hold the Branch Manager role for branch X.
- **Verification Method:** Test
- **Dependencies:** FR-009, FR-015
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-018 — Manager role restored on return
- **Statement:** The system shall restore the Branch Manager role of an employee returning from a temporary transfer when their original branch still has no Branch Manager.
- **Rationale:** Avoids manual re-assignment when no replacement was appointed.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a former manager of branch X returning from a temporary transfer and branch X has no manager, when the return occurs, then the employee holds the Branch Manager role for branch X.
  - AC2: Given branch X has a new manager, when the former manager returns, then the former manager does not hold the Branch Manager role.
- **Verification Method:** Test
- **Dependencies:** FR-016, FR-017
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-019 — Unassign bookings of transferred barber
- **Statement:** The system shall unassign a transferred barber from their bookings at the original branch that fall within the transfer period.
- **Rationale:** The Branch Manager (or Tenant Admin) then assigns another barber.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a barber with bookings at branch X during the transfer period, when the barber is transferred, then those bookings have no assigned barber at branch X.
- **Verification Method:** Test
- **Dependencies:** FR-015
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-020 — Notify customers of barber unassignment
- **Statement:** The system shall notify each customer whose booking loses its assigned barber because of a transfer.
- **Rationale:** Customers are informed that another barber will be assigned.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking unassigned by FR-019, when the transfer is executed, then the booking's customer receives a push and in-app notification about the change.
- **Verification Method:** Test
- **Dependencies:** FR-019
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-005, OQ-011
- **History:** 2026-10-28 Proposed (PR #2)

## Plans and Subscriptions

### FR-021 — Manage plans
- **Statement:** The system shall allow the Platform Operator to create and edit subscription plans with a name, a plan level, a price and a subscription duration.
- **Rationale:** Plans and their number are decided after launch and are configured by the operator.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given the Platform Operator, when they create a plan with name, level, price and duration, then the plan is available for assignment to tenants.
  - AC2: Given a non-operator user, when they attempt to create or edit a plan, then the system rejects the request.
- **Verification Method:** Test
- **Dependencies:** none
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-013
- **History:** 2026-10-28 Proposed (PR #3)

### FR-022 — Free plan
- **Statement:** The system shall assign the free plan to every tenant that has no active paid subscription.
- **Rationale:** The free plan grants presence on the platform with the lowest search priority.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a newly created tenant without a paid subscription, when its plan is viewed, then the plan is the free plan.
  - AC2: Given a tenant whose grace period ended, when its plan is viewed, then the plan is the free plan.
- **Verification Method:** Test
- **Dependencies:** FR-001, FR-021
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3)

### FR-023 — Plan-feature matrix
- **Statement:** The system shall allow the Platform Operator to enable or disable each tenant feature for each plan.
- **Rationale:** Feature sets per plan are configurable without an app release (resolves the contact-feature conflict).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a plan and a feature, when the Platform Operator enables the feature for the plan, then the matrix shows the feature as enabled for that plan.
  - AC2: Given the matrix, when it is viewed, then it lists at least: prices display, contact, booking, maps navigation, discount codes, AI haircut preview.
- **Verification Method:** Test
- **Dependencies:** FR-021
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3)

### FR-024 — Contact type per plan
- **Statement:** The system shall allow the Platform Operator to set, for each plan, whether customer contact is by phone call or by in-app chat.
- **Rationale:** Example decided by SH-01: phone call for the free plan, in-app chat for paid plans.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a plan set to phone call, when a customer views a branch of a tenant on that plan, then the contact action starts a phone call to the branch number.
  - AC2: Given a plan set to in-app chat, when a customer views a branch of a tenant on that plan, then the contact action opens an in-app chat.
- **Verification Method:** Test
- **Dependencies:** FR-023
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-014
- **History:** 2026-10-28 Proposed (PR #3)

### FR-025 — Included preview credits per plan
- **Statement:** The system shall allow the Platform Operator to set the number of AI preview credits included with each plan.
- **Rationale:** Plans come pre-charged with preview credits.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a plan, when the Platform Operator sets its included credits to N, then the matrix shows N for that plan.
- **Verification Method:** Test
- **Dependencies:** FR-023
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3)

### FR-026 — Feature enforcement
- **Statement:** The system shall provide a tenant feature to the tenant and its customers only when the feature is enabled for the tenant's current plan.
- **Rationale:** Entitlements are the single control point for paid features.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a tenant whose plan disables prices display, when a customer views its services, then no prices are shown.
  - AC2: Given a tenant whose plan disables booking, when a customer views its branches, then no booking action is available.
  - AC3: Given the operator enables a feature for the tenant's plan, when a customer next loads the tenant's page, then the feature is available without an app update.
- **Verification Method:** Test
- **Dependencies:** FR-023
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3)

### FR-027 — Manual subscription activation
- **Statement:** The system shall allow the Platform Operator to activate a paid subscription for a tenant after an external payment.
- **Rationale:** Manual activation is one of the two allowed payment paths.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a tenant on the free plan, when the Platform Operator activates plan P for it, then the tenant's current plan is P with an expiry date equal to activation date plus P's duration.
- **Verification Method:** Test
- **Dependencies:** FR-021
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-013
- **History:** 2026-10-28 Proposed (PR #3)

### FR-028 — Subscription payment via Sham Cash
- **Statement:** The system shall allow the Tenant Admin to pay for a subscription via Sham Cash from the tenant app.
- **Rationale:** Electronic in-app payment is the second allowed payment path.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a Tenant Admin selecting plan P, when the Sham Cash payment is confirmed, then the tenant's current plan is P with an expiry date equal to payment date plus P's duration.
  - AC2: Given a failed or cancelled Sham Cash payment, when it returns, then the tenant's plan is unchanged.
- **Verification Method:** Test
- **Dependencies:** FR-021
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-003
- **History:** 2026-10-28 Proposed (PR #3)

### FR-029 — Payment integration settings
- **Statement:** The system shall allow the Platform Operator to enable or disable each subscription payment method.
- **Rationale:** Integrations are managed by the operator from the platform.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given the Sham Cash method is disabled, when a Tenant Admin opens the payment screen, then Sham Cash is not offered.
- **Verification Method:** Test
- **Dependencies:** FR-027, FR-028
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-003, OQ-013
- **History:** 2026-10-28 Proposed (PR #3)

### FR-030 — Exchange rate snapshot on payments
- **Statement:** The system shall store the SYP/USD exchange rate in effect with each subscription and credit-pack payment record.
- **Rationale:** Reports remain correct after rate changes.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a payment recorded at rate X, when the rate later changes to Y, then the payment record still shows rate X.
- **Verification Method:** Test
- **Dependencies:** FR-027, FR-028
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-004
- **History:** 2026-10-28 Proposed (PR #3)

### FR-031 — Renewal reminder
- **Statement:** The system shall send a renewal reminder to the Tenant Admin a number of days before subscription expiry configured by the Platform Operator.
- **Rationale:** Renewal is manual; tenants need a reminder.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given the reminder lead time is N days and a subscription expires on date D, when date D minus N days is reached, then the Tenant Admin receives a push and in-app reminder.
- **Verification Method:** Test
- **Dependencies:** FR-027, FR-028
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-005
- **History:** 2026-10-28 Proposed (PR #3)

### FR-032 — Grace period
- **Statement:** The system shall keep the tenant on its expired paid plan until the end of a grace period configured by the Platform Operator.
- **Rationale:** Avoids immediate feature loss when renewal is late.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a grace period of G days and expiry date D, when a date before D plus G is checked, then the tenant still has its paid plan.
  - AC2: Given the same tenant without renewal, when D plus G is reached, then the tenant is on the free plan.
- **Verification Method:** Test
- **Dependencies:** FR-022
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3)

### FR-033 — Keep bookings on fallback
- **Statement:** The system shall keep existing bookings of a tenant that falls back to the free plan.
- **Rationale:** Customers are not penalized for the tenant's subscription status.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a tenant with future bookings, when it falls back to the free plan, then those bookings remain active.
  - AC2: Given the free plan disables booking, when a customer tries a new booking, then no booking action is available.
- **Verification Method:** Test
- **Dependencies:** FR-026, FR-032
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3)

### FR-034 — Suspend discount codes on fallback
- **Statement:** The system shall reject discount codes of a tenant for new bookings while the tenant's plan disables discount codes.
- **Rationale:** Features follow the plan; prices already granted are honored.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a tenant on a plan without discount codes, when a customer enters one of its valid codes for a new booking, then the system rejects the code.
  - AC2: Given a booking created with a code before fallback, when the tenant falls back, then the booking keeps its discounted price.
  - AC3: Given the tenant returns to a plan with discount codes before a code expires, when a customer enters that code, then the system accepts it.
- **Verification Method:** Test
- **Dependencies:** FR-026, FR-032
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3)

### FR-035 — Freeze preview credits on fallback
- **Statement:** The system shall block new AI previews and new preview grants of a tenant while the tenant's plan disables the AI haircut preview.
- **Rationale:** Credits are not forfeited by the downgrade itself; batches keep their own expiry.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a tenant on a plan without AI preview, when it grants a quota or a customer requests a preview, then the system rejects the request.
  - AC2: Given the tenant returns to a plan with AI preview before a batch expires, when a granted customer requests a preview, then the system accepts it.
- **Verification Method:** Test
- **Dependencies:** FR-026, FR-032
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3)

### FR-036 — Immediate upgrade
- **Statement:** The system shall apply a plan upgrade immediately after payment of the prorated price difference for the remaining subscription period.
- **Rationale:** Upgrades take effect without waiting; no refunds are needed.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a tenant on plan A with R days remaining, when it upgrades to a higher-level plan B, then the amount due equals (price B minus price A) multiplied by R divided by the period length in days.
  - AC2: Given that payment is confirmed, when the tenant's plan is viewed, then the plan is B with the same expiry date.
- **Verification Method:** Test
- **Dependencies:** FR-027, FR-028
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-003
- **History:** 2026-10-28 Proposed (PR #3)

### FR-037 — Downgrade at period end
- **Statement:** The system shall apply a plan downgrade at the end of the current subscription period.
- **Rationale:** Avoids refunds (refund support via Sham Cash is unconfirmed).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a tenant on plan B requesting a downgrade to plan A, when the request is saved, then the plan stays B until expiry.
  - AC2: Given the expiry date is reached and A is paid for, when the plan is viewed, then the plan is A.
- **Verification Method:** Test
- **Dependencies:** FR-021
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3)

### FR-038 — Credits on subscription and renewal
- **Statement:** The system shall add a credit batch with the plan's included preview credits at each subscription start and renewal.
- **Rationale:** Included credits are charged per subscription period.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given plan P includes N credits, when a tenant subscribes to or renews P, then a new credit batch of N credits with a one-calendar-month expiry is added.
- **Verification Method:** Test
- **Dependencies:** FR-025, FR-027, FR-028
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3)

### FR-039 — Manage credit packs
- **Statement:** The system shall allow the Platform Operator to define additional preview credit packs with a credit count and a price.
- **Rationale:** Tenants can buy credits beyond the plan's included credits.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given the Platform Operator, when they create a pack of N credits at price X, then the pack is offered to Tenant Admins.
- **Verification Method:** Test
- **Dependencies:** none
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-013
- **History:** 2026-10-28 Proposed (PR #3)

### FR-040 — Purchase credit pack
- **Statement:** The system shall add a credit batch to the tenant when a credit-pack payment is confirmed via an enabled subscription payment method.
- **Rationale:** Credit packs use the same payment methods as subscriptions.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a confirmed payment for a pack of N credits, when the tenant's credits are viewed, then a new batch of N credits with a one-calendar-month expiry exists.
- **Verification Method:** Test
- **Dependencies:** FR-029, FR-039
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-003
- **History:** 2026-10-28 Proposed (PR #3)
