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
- **Open Questions:** none
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
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #2)

### FR-003 — Create branch
- **Statement:** The system shall allow the Tenant Admin to create a branch with a name, a city, a location and a phone number.
- **Rationale:** A tenant owns one or more branches; the city is used by the favorites rule, the location by proximity search and the phone number by the phone-call contact type.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a logged-in Tenant Admin, when they create a branch with a name, city, location and phone number, then the branch appears in the tenant's branch list.
  - AC2: Given a branch form without a city, when the Tenant Admin submits it, then the system rejects it and indicates that the city is required.
  - AC3: Given a branch form without a phone number, when the Tenant Admin submits it, then the system rejects it and indicates that the phone number is required.
- **Verification Method:** Test
- **Dependencies:** FR-001
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-001
- **History:** 2026-10-28 Proposed (PR #2); 2026-10-28 revised after verification (PR #14)

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
- **Open Questions:** OQ-005
- **History:** 2026-10-28 Proposed (PR #2)

## Plans and Subscriptions

### FR-021 — Manage plans
- **Statement:** The system shall allow the Platform Operator to create and edit paid subscription plans with a name, a unique plan level, a price in SYP and a subscription duration.
- **Rationale:** Plans and their number are decided after launch and are configured by the operator.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Approved
- **Acceptance Criteria:**
  - AC1: Given the Platform Operator, when they create a plan with name, level, price and duration, then the plan is available for assignment to tenants.
  - AC2: Given an existing plan, when the Platform Operator changes its price, then the plan shows the new price.
  - AC3: Given a non-operator user, when they attempt to create or edit a plan, then the system rejects the request.
  - AC4: Given an existing plan with level L, when the Platform Operator saves another plan with level L, then the system rejects it.
  - AC5: Given a plan whose price or duration is edited, when the change is saved, then tenants in a current subscription period keep their price and expiry date, and the new values apply to new subscriptions and renewals.
- **Verification Method:** Test
- **Dependencies:** none
- **Trace:** UC: — | ADR: — | CR: CR-001
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3); 2026-10-28 revised after verification (PR #14); 2026-10-28 Approved by SH-01 (PR #16); 2026-10-28 changed by CR-001 (#18, PR #19)

### FR-022 — Free plan
- **Statement:** The system shall assign the free plan to every tenant that has no active paid subscription.
- **Rationale:** The free plan grants presence on the platform with the lowest search priority.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Approved
- **Acceptance Criteria:**
  - AC1: Given a newly created tenant without a paid subscription, when its plan is viewed, then the plan is the free plan.
  - AC2: Given a tenant whose grace period ended, when its plan is viewed, then the plan is the free plan. (Verifiable after F-005.)
- **Verification Method:** Test
- **Dependencies:** FR-001, FR-021, FR-142
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3); 2026-10-28 revised after verification (PR #14); 2026-10-28 Approved by SH-01 (PR #16)

### FR-023 — Plan-feature matrix
- **Statement:** The system shall allow the Platform Operator to enable or disable each tenant feature for each plan.
- **Rationale:** Feature sets per plan are configurable without an app release (resolves the contact-feature conflict).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Approved
- **Acceptance Criteria:**
  - AC1: Given a plan and a feature, when the Platform Operator enables the feature for the plan, then the matrix shows the feature as enabled for that plan.
  - AC2: Given the matrix, when it is viewed, then it lists exactly: prices display, booking, maps navigation, discount codes, AI haircut preview.
- **Verification Method:** Test
- **Dependencies:** FR-021
- **Trace:** UC: — | ADR: — | CR: CR-001
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3); 2026-10-28 revised after verification (PR #14); 2026-10-28 Approved by SH-01 (PR #16); 2026-10-28 changed by CR-001 (#18, PR #19)

### FR-024 — Contact type per plan
- **Statement:** The system shall allow the Platform Operator to set, for each plan, whether customer contact is by phone call or by in-app chat.
- **Rationale:** The contact action is available on every plan; only its type is set per plan. Example decided by SH-01: phone call for the free plan, in-app chat for paid plans.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Approved
- **Acceptance Criteria:**
  - AC1: Given a plan set to phone call, when a customer views a branch of a tenant on that plan, then the contact action starts a phone call to the branch number.
  - AC2: Given a plan set to in-app chat, when a customer views a branch of a tenant on that plan, then the contact action opens an in-app chat. (Verifiable after F-010.)
- **Verification Method:** Test
- **Dependencies:** FR-003, FR-023
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3); 2026-10-28 revised after verification (PR #14); 2026-10-28 Approved by SH-01 (PR #16)

### FR-025 — Included preview credits per plan
- **Statement:** The system shall allow the Platform Operator to set the number of AI preview credits included with each plan.
- **Rationale:** Plans come pre-charged with preview credits.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Approved
- **Acceptance Criteria:**
  - AC1: Given a plan, when the Platform Operator sets its included credits to N, then the matrix shows N for that plan.
  - AC2: Given a plan with the AI haircut preview disabled, when the Platform Operator views or edits its included credits, then the value is 0 and cannot be changed.
- **Verification Method:** Test
- **Dependencies:** FR-023
- **Trace:** UC: — | ADR: — | CR: CR-001
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3); 2026-10-28 Approved by SH-01 (PR #16); 2026-10-28 changed by CR-001 (#18, PR #19)

### FR-026 — Feature enforcement
- **Statement:** The system shall provide a tenant feature to the tenant and its customers only when the feature is enabled for the tenant's current plan.
- **Rationale:** Entitlements are the single control point for paid features.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Approved
- **Acceptance Criteria:**
  - AC1: Given a tenant whose plan disables prices display, when a customer views its services, then no prices are shown.
  - AC2: Given a tenant whose plan disables booking, when a customer views its branches, then no booking action is available.
  - AC3: Given the operator enables a feature for the tenant's plan, when a customer next loads the tenant's page, then the feature is available without an app update.
- **Verification Method:** Test
- **Dependencies:** FR-023
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #3); 2026-10-28 Approved by SH-01 (PR #16)

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
- **Open Questions:** none
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
- **Open Questions:** OQ-003
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
- **Open Questions:** none
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

## Services and Booking

### FR-041 — Service catalog
- **Statement:** The system shall allow the Tenant Admin to manage a tenant-wide service catalog where each service has a name, a duration and a commission rate.
- **Rationale:** Services, durations and commission rates are defined once for all branches.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a Tenant Admin, when they create a service with name, duration and commission rate, then the service is available to all branches of the tenant.
  - AC2: Given a Branch Manager, when they attempt to change a service's duration or commission rate, then the system rejects the request.
- **Verification Method:** Test
- **Dependencies:** FR-001
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-042 — Branch service price
- **Statement:** The system shall allow the Branch Manager to set the price in SYP of each catalog service for their branch.
- **Rationale:** Prices may differ between branches; durations do not.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a service, when the Branch Manager of branch X sets its price, then customers of branch X see that price and other branches keep their own prices.
- **Verification Method:** Test
- **Dependencies:** FR-012, FR-041
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-043 — Branch service activation
- **Statement:** The system shall allow the Branch Manager to activate or deactivate each catalog service for their branch.
- **Rationale:** Not every branch offers every service.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a service deactivated in branch X, when a customer books at branch X, then the service is not selectable.
- **Verification Method:** Test
- **Dependencies:** FR-012, FR-041
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-044 — View branch services
- **Statement:** The system shall display to customers the active services of a branch with their durations.
- **Rationale:** Customers choose services before booking; prices are shown only when the plan enables them (FR-026).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a branch with active services, when a customer opens the branch, then each active service is listed with its duration.
- **Verification Method:** Test
- **Dependencies:** FR-043
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-045 — Booking settings
- **Statement:** The system shall allow the Tenant Admin to set the slot granularity, the confirmation mode, the customer cancellation deadline, the booking horizon and the no-show threshold of the tenant.
- **Rationale:** These booking parameters are decided per tenant.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a Tenant Admin, when they save values for each of the five settings, then the saved values are displayed and applied to new bookings.
  - AC2: Given a confirmation mode setting, when it is viewed, then its options are automatic and manual.
- **Verification Method:** Test
- **Dependencies:** FR-001
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-046 — Customer registration
- **Statement:** The system shall register a customer by phone number verified with a one-time password.
- **Rationale:** Phone + OTP is the customer authentication method.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a phone number, when the customer enters the correct OTP sent to it, then a customer account linked to that number exists and the customer is logged in.
  - AC2: Given an incorrect OTP, when it is entered, then no account is created and the customer is not logged in.
- **Verification Method:** Test
- **Dependencies:** none
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-006
- **History:** 2026-10-28 Proposed (PR #4)

### FR-047 — Browsing without registration
- **Statement:** The system shall allow unregistered users to browse branches, barbers and services.
- **Rationale:** Registration is required only for booking.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given an unregistered user, when they search and open a branch, then the branch, its barbers and services are displayed.
- **Verification Method:** Test
- **Dependencies:** none
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-048 — Registration required for booking
- **Statement:** The system shall require a logged-in customer account to create a booking.
- **Rationale:** Registration is required only for booking.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given an unregistered user, when they start a booking, then the system asks them to register or log in before the booking is created.
- **Verification Method:** Test
- **Dependencies:** FR-046
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-049 — Create booking
- **Statement:** The system shall allow a customer to book one or more active services of a branch at a start time, with a selected barber or without a barber.
- **Rationale:** Booking on a specific barber and on a branch are both allowed.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer, a branch and selected services, when they choose a barber and an available start time, then a booking for that barber is created.
  - AC2: Given a customer, when they choose no barber and an available start time, then a booking is created and a barber is assigned by FR-052.
  - AC3: Given selected services, when the booking is created, then its duration equals the sum of the services' durations.
- **Verification Method:** Test
- **Dependencies:** FR-043, FR-048
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-050 — Available start times
- **Statement:** The system shall offer only start times aligned to the tenant's slot granularity at which the barber is free for the full booking duration within the branch's working hours and outside the barber's unavailability periods.
- **Rationale:** Availability is derived from branch hours, barber unavailability and existing bookings.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a branch open 09:00–17:00, a 15-minute granularity and a 45-minute booking, when start times are offered, then 16:30 is not offered and 16:15 is offered if the barber is free 16:15–17:00.
  - AC2: Given a barber unavailable 12:00–13:00, when start times are offered for that barber, then no booking overlapping 12:00–13:00 is offered.
  - AC3: Given a barber already booked 10:00–10:30, when start times are offered, then no booking overlapping 10:00–10:30 is offered for that barber.
- **Verification Method:** Test
- **Dependencies:** FR-004, FR-013, FR-045
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-051 — Booking horizon
- **Statement:** The system shall reject booking start times later than the tenant's booking horizon.
- **Rationale:** The tenant decides how far in advance customers can book.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a horizon of H days, when a customer selects a date more than H days ahead, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-045
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-052 — Branch-level auto-assignment
- **Statement:** The system shall assign a booking made without a barber to the available barber highest in the branch's barber priority order.
- **Rationale:** Branch-level bookings are auto-assigned by tenant priority.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given barbers A (priority 1) and B (priority 2) both available, when a branch-level booking is created, then it is assigned to A.
  - AC2: Given only B available, when a branch-level booking is created, then it is assigned to B.
- **Verification Method:** Test
- **Dependencies:** FR-014, FR-050
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-053 — One active booking per customer
- **Statement:** The system shall reject a new booking by a customer who already has an active booking on the platform.
- **Rationale:** One active booking per customer, platform-wide.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer with a pending or confirmed booking at any tenant, when they create another booking, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-049
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-054 — No-show ban
- **Statement:** The system shall reject new bookings at a tenant by a customer whose no-show count at that tenant has reached the tenant's no-show threshold.
- **Rationale:** Ban applies at that tenant only and is permanent until lifted.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a threshold of N and a customer with N no-shows at tenant T, when they book at tenant T, then the system rejects it.
  - AC2: Given the same customer, when they book at another tenant, then the ban does not apply.
- **Verification Method:** Test
- **Dependencies:** FR-045, FR-062
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-055 — Lift no-show ban
- **Statement:** The system shall allow the Tenant Admin to lift the no-show ban of a customer at their tenant.
- **Rationale:** The ban lasts until the tenant lifts it.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a banned customer, when the Tenant Admin lifts the ban, then the customer can book at that tenant again.
- **Verification Method:** Test
- **Dependencies:** FR-054
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-056 — Automatic confirmation
- **Statement:** The system shall set a new booking to Confirmed when the tenant's confirmation mode is automatic.
- **Rationale:** Tenants choose automatic or manual confirmation.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given automatic mode, when a booking is created, then its status is Confirmed.
- **Verification Method:** Test
- **Dependencies:** FR-045, FR-049
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-057 — Manual confirmation
- **Statement:** The system shall keep a new booking Pending until the assigned barber or the Branch Manager accepts or rejects it when the tenant's confirmation mode is manual.
- **Rationale:** Tenants choose automatic or manual confirmation.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given manual mode, when a booking is created, then its status is Pending.
  - AC2: Given a Pending booking, when the assigned barber accepts it, then its status is Confirmed.
  - AC3: Given a Pending booking, when the Branch Manager rejects it, then its status is Rejected and the customer is notified.
- **Verification Method:** Test
- **Dependencies:** FR-045, FR-049
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-058 — Customer cancellation
- **Statement:** The system shall allow a customer to cancel their booking until the tenant's cancellation deadline before the booking start time.
- **Rationale:** Cancellation is allowed up to a tenant-defined deadline.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a deadline of D hours, when the customer cancels more than D hours before the start, then the booking status is Cancelled.
  - AC2: Given the same deadline, when the customer tries to cancel less than D hours before the start, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-045
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-059 — Shop cancellation
- **Statement:** The system shall allow the Branch Manager to cancel a booking of their branch.
- **Rationale:** The shop can cancel bookings.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a confirmed booking, when the Branch Manager cancels it, then its status is Cancelled.
- **Verification Method:** Test
- **Dependencies:** FR-012
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-060 — Notify customer of shop cancellation
- **Statement:** The system shall notify the customer when the shop cancels their booking.
- **Rationale:** Customers are informed of shop cancellations.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking cancelled by the shop, when the cancellation is saved, then the customer receives a push and in-app notification.
- **Verification Method:** Test
- **Dependencies:** FR-059
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-005
- **History:** 2026-10-28 Proposed (PR #4)

### FR-061 — Assign barber to unassigned booking
- **Statement:** The system shall allow the Branch Manager to assign a barber of their branch to a booking that has no assigned barber.
- **Rationale:** Bookings unassigned by a transfer (FR-019) need a new barber.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking without a barber, when the Branch Manager assigns a free barber of the branch, then the booking shows that barber.
- **Verification Method:** Test
- **Dependencies:** FR-019
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-062 — Mark no-show
- **Statement:** The system shall allow the assigned barber or the Branch Manager to mark a confirmed booking as No-show after its start time.
- **Rationale:** No-shows are counted for the ban rule.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a confirmed booking whose start time has passed, when the assigned barber marks it No-show, then its status is No-show and the customer's no-show count at that tenant increases by one.
  - AC2: Given a booking whose start time has not passed, when someone marks it No-show, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-049
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-063 — Complete booking
- **Statement:** The system shall allow the assigned barber or the Branch Manager to mark a confirmed booking as Completed.
- **Rationale:** Completion closes the booking and triggers payment recording and preview deletion.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a confirmed booking, when the assigned barber marks it Completed with payment data, then its status is Completed.
- **Verification Method:** Test
- **Dependencies:** FR-049
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-064 — Record payment per service
- **Statement:** The system shall require, when a booking is completed, the paid amount and the currency (SYP or USD) for each service of the booking.
- **Rationale:** Payment at the shop is recorded per service; it feeds payroll commission.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking with two services, when it is completed, then the system requires an amount and a currency for each of the two services.
  - AC2: Given a missing amount for a service, when completion is submitted, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-063
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #4)

### FR-065 — Exchange rate snapshot on completion
- **Statement:** The system shall store the SYP/USD exchange rate in effect with each recorded booking payment.
- **Rationale:** USD payments are converted at the rate of the payment moment.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a payment recorded at rate X, when the rate later changes, then the record still shows rate X.
- **Verification Method:** Test
- **Dependencies:** FR-064
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-004
- **History:** 2026-10-28 Proposed (PR #4)

## AI Haircut Preview and Credits

### FR-066 — Grant preview quota
- **Statement:** The system shall allow the Tenant Admin to grant a preview quota to a named customer who has at least one booking at the tenant.
- **Rationale:** The tenant chooses beneficiary customers by name; only its own past customers are selectable (privacy).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer with a past booking at the tenant, when the Tenant Admin grants a quota of Q previews, then the customer has Q previews available at that tenant.
  - AC2: Given a customer with no booking at the tenant, when the Tenant Admin searches for them to grant a quota, then the customer is not selectable.
- **Verification Method:** Test
- **Dependencies:** FR-049
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-067 — Reserve credits on grant
- **Statement:** The system shall reserve the credits of a granted quota from the tenant's credit batches in order of earliest expiry.
- **Rationale:** Granted quotas are backed by credits at grant time; earliest-expiring credits are used first.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given batch A expiring on day 10 with 3 free credits and batch B expiring on day 20 with 5, when a quota of 4 is granted, then 3 credits are reserved from A and 1 from B.
- **Verification Method:** Test
- **Dependencies:** FR-066, FR-038, FR-040
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-068 — Grant limited by available credits
- **Statement:** The system shall reject a grant whose quota exceeds the tenant's unreserved valid credits.
- **Rationale:** The sum of granted quotas cannot exceed the available balance.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given 5 unreserved valid credits, when the Tenant Admin grants a quota of 6, then the system rejects the grant and the balance is unchanged.
- **Verification Method:** Test
- **Dependencies:** FR-067
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-069 — Reduce or revoke quota
- **Statement:** The system shall return the unused part of a reduced or revoked quota to the tenant's unreserved credits.
- **Rationale:** Unused reserved credits go back to the tenant.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer with 4 unused previews, when the Tenant Admin reduces the quota by 3, then the customer has 1 unused preview and the tenant's unreserved credits increase by 3.
  - AC2: Given the same customer, when the quota is revoked, then the customer has 0 previews and all unused credits return to the tenant.
- **Verification Method:** Test
- **Dependencies:** FR-067
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-070 — Preview only within a booking
- **Statement:** The system shall allow a customer to request a preview only for their active booking at a tenant where they have unused preview quota.
- **Rationale:** Previews are tied to a booking (decision revised by SH-01).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer with quota at tenant T and an active booking at T, when they open the booking, then the preview action is available.
  - AC2: Given a customer with quota at tenant T and no active booking at T, when they look for the preview action, then it is not available.
- **Verification Method:** Test
- **Dependencies:** FR-066, FR-049
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-071 — Consent before upload
- **Statement:** The system shall require the customer's explicit consent, stating that the photo is sent to an external AI provider, before uploading a photo for a preview.
- **Rationale:** Face photos are sensitive personal data.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer starting a preview, when they have not accepted the consent notice, then the photo cannot be uploaded.
  - AC2: Given the consent notice, when it is displayed, then it states that the photo is sent to an external AI provider.
- **Verification Method:** Test
- **Dependencies:** FR-070
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-072 — Generate preview
- **Statement:** The system shall generate a preview image of the customer with the selected haircut from the uploaded photo through the AI provider via the platform server.
- **Rationale:** The server holds the provider key and controls quotas.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given an uploaded photo and a selected haircut, when the customer requests the preview, then the app displays the generated preview image.
  - AC2: Given the request, when it is processed, then the AI provider is called by the platform server, not by the app.
- **Verification Method:** Test
- **Dependencies:** FR-071
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-002, OQ-010
- **History:** 2026-10-28 Proposed (PR #5)

### FR-073 — Deduct quota on preview
- **Statement:** The system shall deduct one preview from the customer's quota for each generated preview.
- **Rationale:** Each executed preview consumes one reserved credit.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer with 2 unused previews, when a preview is generated, then the customer has 1 unused preview.
  - AC2: Given a generation failure, when the request ends, then the quota is unchanged.
- **Verification Method:** Test
- **Dependencies:** FR-072
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-074 — Keep preview on device
- **Statement:** The system shall save a copy of the customer's photo and preview on the customer's device.
- **Rationale:** The customer keeps their copy after server deletion.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a generated preview, when the server copy is deleted, then the customer still sees the photo and preview in the app on the same device.
- **Verification Method:** Test
- **Dependencies:** FR-072
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-075 — Preview visible to assigned barber only
- **Statement:** The system shall show a booking's preview on the server only to the barber assigned to that booking.
- **Rationale:** Tenant Admin, Branch Manager and Platform Operator do not see previews.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking with a preview, when the assigned barber opens the booking, then the preview is displayed.
  - AC2: Given the same booking, when the Branch Manager, the Tenant Admin or another barber opens it, then the preview is not displayed.
- **Verification Method:** Test
- **Dependencies:** FR-072
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-076 — Delete preview on completion
- **Statement:** The system shall delete a booking's photo and preview from the server when the booking is completed.
- **Rationale:** Server retention ends with the haircut.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking with a preview, when it is marked Completed, then the photo and preview no longer exist on the server.
- **Verification Method:** Test
- **Dependencies:** FR-063, FR-072
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-077 — Delete preview on cancellation
- **Statement:** The system shall delete a booking's photo and preview from the server immediately when the booking is cancelled.
- **Rationale:** No further need once the booking is cancelled.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking with a preview, when it is cancelled by the customer or the shop, then the photo and preview no longer exist on the server.
- **Verification Method:** Test
- **Dependencies:** FR-058, FR-059, FR-072
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-078 — Preview retention setting
- **Statement:** The system shall allow the Platform Operator to set the server retention period of previews after the appointment time, with a default of 24 hours.
- **Rationale:** Covers bookings never closed (e.g. no-show).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a new installation, when the setting is viewed, then its value is 24 hours.
  - AC2: Given the Platform Operator, when they change it to R hours, then the saved value is R.
- **Verification Method:** Test
- **Dependencies:** none
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-079 — Delete preview after retention period
- **Statement:** The system shall delete a booking's photo and preview from the server when the retention period after the booking's appointment time has elapsed.
- **Rationale:** Deletion happens at the earliest of completion, cancellation or the retention period.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a retention period of R hours and a booking at time T that is neither completed nor cancelled, when T plus R is reached, then the photo and preview no longer exist on the server.
- **Verification Method:** Test
- **Dependencies:** FR-078
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-080 — Hide preview from newly assigned barber
- **Statement:** The system shall hide a booking's preview from a newly assigned barber until the customer consents.
- **Rationale:** The customer decides whether a replacement barber sees the preview.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking whose barber is replaced, when the new barber opens it before customer consent, then the preview is not displayed.
  - AC2: Given the customer refuses, when the new barber opens it, then the preview is not displayed and server deletion follows FR-076, FR-077 and FR-079.
- **Verification Method:** Test
- **Dependencies:** FR-061, FR-075
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-081 — Customer consent for new barber
- **Statement:** The system shall ask the customer to allow or refuse preview access for the newly assigned barber of their booking.
- **Rationale:** Provides the consent required by FR-080.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking with a preview whose barber is replaced, when the replacement is saved, then the customer is asked to allow or refuse.
  - AC2: Given the customer allows, when the new barber opens the booking, then the preview is displayed.
- **Verification Method:** Test
- **Dependencies:** FR-080
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-005
- **History:** 2026-10-28 Proposed (PR #5)

### FR-082 — Credit batch expiry date
- **Statement:** The system shall set each credit batch's expiry to the same day of the next calendar month, or to that month's last day when that day does not exist.
- **Rationale:** Credits are valid one calendar month from purchase or renewal.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a batch created on 13 October, when its expiry is viewed, then it is 13 November.
  - AC2: Given a batch created on 31 January of a non-leap year, when its expiry is viewed, then it is 28 February.
- **Verification Method:** Test
- **Dependencies:** FR-038, FR-040
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-083 — Move quotas on batch expiry
- **Statement:** The system shall re-reserve, when a credit batch expires, the unused granted quotas reserved from it against unreserved credits of valid batches if those credits cover all of them.
- **Rationale:** Customers keep their quotas while the tenant has valid credits.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given 3 unused granted previews reserved on an expiring batch and 5 unreserved valid credits, when the batch expires, then the 3 previews remain available and the unreserved valid credits are 2.
- **Verification Method:** Test
- **Dependencies:** FR-067, FR-082
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

### FR-084 — Equal split of quotas on insufficient credits
- **Statement:** The system shall give each affected customer, when valid unreserved credits do not cover all quotas of an expired batch, the lower of their unused quota and the available credits divided equally among affected customers and rounded down.
- **Rationale:** Equal distribution decided by SH-01; the remainder stays with the tenant for manual granting.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given affected customers with unused quotas 4, 2 and 1 and 5 available credits, when the batch expires, then each customer keeps 1 preview and the tenant keeps 2 unreserved credits.
- **Verification Method:** Test
- **Dependencies:** FR-083
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #5)

## Discount Codes

### FR-085 — Create discount code
- **Statement:** The system shall allow the Tenant Admin to create a discount code with a type (percentage or fixed SYP amount), a value, an expiry date, a total usage limit, a per-customer usage limit, eligible services, eligible branches and an audience.
- **Rationale:** Promotions are discount codes whose properties are set by the tenant.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a Tenant Admin, when they save a code with all properties, then the code is listed with those properties.
  - AC2: Given a Branch Manager, when they attempt to create a code, then the system rejects the request.
  - AC3: Given a tenant whose plan disables discount codes, when the Tenant Admin tries to create a code, then the system rejects the request.
- **Verification Method:** Test
- **Dependencies:** FR-041, FR-003
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #6); 2026-10-28 AC3 added (F-002 spec Q8, PR #19)

### FR-086 — Code audience
- **Statement:** The system shall restrict each discount code to one audience: all customers, the favorite customers of a selected barber, or named customers who have at least one booking at the tenant.
- **Rationale:** Three audience types; branch/service restrictions are code properties.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given the audience options, when the Tenant Admin creates a code, then exactly these three options are offered.
  - AC2: Given the named-customers option, when the Tenant Admin searches for a customer without a booking at the tenant, then the customer is not selectable.
- **Verification Method:** Test
- **Dependencies:** FR-085
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #6)

### FR-087 — Notify targeted audience
- **Statement:** The system shall notify each member of a code's audience when the code targets a barber's favorite customers or named customers.
- **Rationale:** Targeted customers need to learn about their code.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a code for named customers A and B, when it is created, then A and B receive a push and in-app notification with the code.
  - AC2: Given a code for all customers, when it is created, then no notification is sent.
- **Verification Method:** Test
- **Dependencies:** FR-086
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-005
- **History:** 2026-10-28 Proposed (PR #6)

### FR-088 — Apply code at booking
- **Statement:** The system shall display the discounted price when a customer enters a valid discount code during booking.
- **Rationale:** The customer enters the code at booking and sees the price after discount.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a valid 10% code and eligible services totalling 10,000 SYP, when the customer enters it, then the displayed price is 9,000 SYP.
- **Verification Method:** Test
- **Dependencies:** FR-049, FR-085
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #6)

### FR-089 — One code per booking
- **Statement:** The system shall accept at most one discount code per booking.
- **Rationale:** Keeps pricing unambiguous.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking with an applied code, when the customer enters a second code, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-088
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #6)

### FR-090 — Reject expired code
- **Statement:** The system shall reject a discount code after its expiry date.
- **Rationale:** Expiry is a code property.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a code expired yesterday, when a customer enters it, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-088
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #6)

### FR-091 — Reject code outside audience
- **Statement:** The system shall reject a discount code entered by a customer outside the code's audience.
- **Rationale:** Audience restricts who may use the code.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a code for barber X's favorite customers, when a customer not in that list enters it, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-086, FR-088
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #6)

### FR-092 — Code usage limits
- **Statement:** The system shall reject a discount code whose total usage limit or whose per-customer usage limit has been reached.
- **Rationale:** Usage limits are code properties.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a total limit of 10 and 10 uses, when a customer enters the code, then the system rejects it.
  - AC2: Given a per-customer limit of 1 and a customer who used it once, when that customer enters it again, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-088, FR-095
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #6)

### FR-093 — Eligible services and branches
- **Statement:** The system shall apply a discount code only to the booking's services that are eligible for the code at a branch that is eligible for the code.
- **Rationale:** Services and branches are code properties.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a code eligible only for service A and a booking with services A and B, when it is applied, then only A's price is discounted.
  - AC2: Given a code not eligible for branch X, when entered for a booking at branch X, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-088
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #6)

### FR-094 — Fixed discount floor
- **Statement:** The system shall limit a fixed-amount discount to the total price of the eligible services.
- **Rationale:** The discounted price cannot be negative.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a fixed discount of 5,000 SYP and eligible services totalling 3,000 SYP, when it is applied, then the discounted price of those services is 0 SYP.
- **Verification Method:** Test
- **Dependencies:** FR-093
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #6)

### FR-095 — Count usage at booking
- **Statement:** The system shall count one use of a discount code when a booking with that code is created.
- **Rationale:** Prevents the same code from being reserved beyond its limits.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a code with 0 uses, when a booking with the code is created, then the code shows 1 use.
- **Verification Method:** Test
- **Dependencies:** FR-088
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #6)

### FR-096 — Release usage on cancellation
- **Statement:** The system shall release the counted use of a discount code when its booking is cancelled or rejected.
- **Rationale:** Customers do not lose a use for a booking that did not happen.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking that counted one use, when it is cancelled or rejected, then the code's use count decreases by one.
- **Verification Method:** Test
- **Dependencies:** FR-095, FR-057, FR-058, FR-059
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #6)

## Search, Ratings and Favorites

### FR-097 — Search by name
- **Statement:** The system shall allow users to search branches and barbers by name.
- **Rationale:** Name is one of the four search criteria.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a branch named 'Al Noor', when a user searches 'Noor', then that branch appears in the results.
- **Verification Method:** Test
- **Dependencies:** FR-003, FR-005
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-098 — Search by service
- **Statement:** The system shall allow users to search branches by an offered service.
- **Rationale:** Service is one of the four search criteria.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given branch X with active service 'Beard trim' and branch Y without it, when a user searches 'Beard trim', then X appears and Y does not.
- **Verification Method:** Test
- **Dependencies:** FR-043
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-099 — Sort by proximity
- **Statement:** The system shall allow users to sort search results by distance from their current location.
- **Rationale:** Proximity is one of the four search criteria.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given location permission is granted and two branches at 1 km and 5 km, when sorting by proximity within the same plan level, then the 1 km branch is listed first.
- **Verification Method:** Test
- **Dependencies:** FR-003
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-001
- **History:** 2026-10-28 Proposed (PR #7)

### FR-100 — Sort by rating
- **Statement:** The system shall allow users to sort search results by average rating.
- **Rationale:** Rating is one of the four search criteria.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given two branches of the same plan level rated 4.5 and 3.9, when sorting by rating, then the 4.5 branch is listed first.
- **Verification Method:** Test
- **Dependencies:** FR-104
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-101 — Plan-level ordering
- **Statement:** The system shall order search results by tenant plan level, from highest to lowest with the free plan last, before applying the user's chosen criterion.
- **Rationale:** Paid plans rank higher; the free plan always appears after all paid plans.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a free-plan branch at 1 km and a paid-plan branch at 5 km, when sorting by proximity, then the paid-plan branch is listed first.
  - AC2: Given two paid plans of levels 2 and 1, when results are listed, then all level-2 branches precede all level-1 branches.
- **Verification Method:** Test
- **Dependencies:** FR-021, FR-022
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-102 — Display ratings in results
- **Statement:** The system shall display the average rating and the number of ratings of each branch and barber in search results and on their pages.
- **Rationale:** Only the average and count are public.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a branch with ratings 5 and 4, when it appears in results, then it shows 4.5 and 2 ratings.
- **Verification Method:** Test
- **Dependencies:** FR-104
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-103 — Maps navigation
- **Statement:** The system shall open driving directions to a branch in Google Maps when the customer selects navigation and the tenant's plan enables maps navigation.
- **Rationale:** Paid feature: open maps to reach the branch by car.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a plan with maps navigation enabled, when the customer taps navigation, then Google Maps opens with driving directions to the branch location.
  - AC2: Given a plan without it, when the branch page is shown, then no navigation action is available.
- **Verification Method:** Test
- **Dependencies:** FR-003, FR-026
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-001
- **History:** 2026-10-28 Proposed (PR #7)

### FR-104 — Rate barber
- **Statement:** The system shall allow a customer to rate the barber of their completed booking from 1 to 5 stars with an optional comment.
- **Rationale:** Barbers are rated after completed bookings.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a completed booking, when the customer submits 4 stars without a comment, then the rating is saved for the barber.
  - AC2: Given a booking that is not completed, when the customer tries to rate, then no rating action is available.
- **Verification Method:** Test
- **Dependencies:** FR-063
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-105 — Rate branch
- **Statement:** The system shall allow a customer to rate the branch of their completed booking from 1 to 5 stars with an optional comment.
- **Rationale:** Branches are rated after completed bookings.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a completed booking, when the customer submits 5 stars with a comment, then the rating is saved for the branch.
- **Verification Method:** Test
- **Dependencies:** FR-063
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-106 — One rating per completed booking
- **Statement:** The system shall accept at most one barber rating and one branch rating per completed booking.
- **Rationale:** One rating per completed booking.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a completed booking already rated, when the customer tries to rate it again, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-104, FR-105
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-107 — Rating comment visibility
- **Statement:** The system shall show rating comments only to the Tenant Admin, to the Branch Manager for their branch and its barbers, and to the barber for comments about them.
- **Rationale:** Comments are not public.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a comment about barber B of branch X, when B, the manager of X or the Tenant Admin opens ratings, then the comment is shown.
  - AC2: Given the same comment, when a customer or a manager of another branch views ratings, then the comment is not shown.
- **Verification Method:** Test
- **Dependencies:** FR-104, FR-105
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-108 — Report abusive comment
- **Statement:** The system shall allow the Tenant Admin or the rated barber to report a rating comment to the Platform Operator.
- **Rationale:** Abusive comments reach the operator through reports.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a comment about barber B, when B reports it, then the report appears in the Platform Operator's report list.
- **Verification Method:** Test
- **Dependencies:** FR-107
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-109 — Hide reported comment
- **Statement:** The system shall allow the Platform Operator to hide a reported rating comment while keeping its star rating.
- **Rationale:** The operator moderates abusive comments; stars remain part of the average.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a reported comment, when the Platform Operator hides it, then the comment is no longer shown to anyone and the rating's stars still count in the average.
- **Verification Method:** Test
- **Dependencies:** FR-108
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-110 — Favorite barber
- **Statement:** The system shall allow a customer to add a barber to and remove a barber from their favorites.
- **Rationale:** Customers choose their favorite barber.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a barber, when the customer adds them to favorites, then the barber appears in the customer's favorites.
  - AC2: Given a favorite barber, when the customer removes them, then the barber no longer appears in the customer's favorites.
- **Verification Method:** Test
- **Dependencies:** FR-048
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-111 — Customer QR code
- **Statement:** The system shall display a QR code identifying the customer in the customer app.
- **Rationale:** Barbers add favorite customers only by scanning this QR code (no customer directory search).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a logged-in customer, when they open their QR code, then a QR code identifying their account is displayed.
- **Verification Method:** Test
- **Dependencies:** FR-046
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-112 — Favorite customer by QR
- **Statement:** The system shall allow a barber to add a customer to the barber's favorite customers only by scanning the customer's QR code.
- **Rationale:** Two-way favorites without exposing the customer directory.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer's QR code, when the barber scans it, then the customer appears in the barber's favorite customers.
  - AC2: Given the barber app, when the barber looks for a way to search customers by name or phone, then none exists.
- **Verification Method:** Test
- **Dependencies:** FR-111
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-113 — Notify customer added as favorite
- **Statement:** The system shall notify a customer when a barber adds them to the barber's favorite customers.
- **Rationale:** The customer is informed and can refuse.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a barber adds a customer, when the addition is saved, then the customer receives a push and in-app notification.
- **Verification Method:** Test
- **Dependencies:** FR-112
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-005
- **History:** 2026-10-28 Proposed (PR #7)

### FR-114 — Remove self from barber favorites
- **Statement:** The system shall allow a customer to remove themselves from a barber's favorite customers.
- **Rationale:** The customer can refuse the addition or leave later.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer in barber B's favorites, when the customer removes themselves, then the customer no longer appears in B's favorite customers.
- **Verification Method:** Test
- **Dependencies:** FR-113
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

### FR-115 — Favorite barber city rule
- **Statement:** The system shall show a favorite barber to a customer only while the barber's current branch is in the city of the branch where the favorite was created.
- **Rationale:** Favorites follow a transferred barber within the same city and are kept but hidden across cities.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a favorite created at a branch in Damascus, when the barber is transferred to another Damascus branch, then the favorite is shown with the new branch.
  - AC2: Given the barber is transferred to an Aleppo branch, when the customer opens favorites, then the barber is not shown.
  - AC3: Given the barber returns to a Damascus branch, when the customer opens favorites, then the barber is shown again.
- **Verification Method:** Test
- **Dependencies:** FR-003, FR-015, FR-110
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #7)

## Supplies

### FR-116 — Supply catalog
- **Statement:** The system shall allow the Tenant Admin to manage a supply catalog where each item has a name and a unit of measure.
- **Rationale:** Supply requests use tenant-defined catalog items.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a Tenant Admin, when they add an item 'Shaving foam' with unit 'can', then the item is selectable in supply requests of all branches.
- **Verification Method:** Test
- **Dependencies:** FR-001
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-117 — Create supply request
- **Statement:** The system shall allow the Branch Manager to submit a supply request for their branch containing catalog items with quantities.
- **Rationale:** Branch managers request supplies from the tenant.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a Branch Manager, when they submit a request with two catalog items and quantities, then the request exists with status Submitted.
  - AC2: Given a request without items, when it is submitted, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-012, FR-116
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-118 — Free supply items
- **Statement:** The system shall allow the Branch Manager to add items not in the catalog to a supply request with a name and a quantity.
- **Rationale:** Needs outside the catalog are allowed.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a supply request, when the Branch Manager adds a free item 'Mirror cleaner' with quantity 2, then the request contains that item.
- **Verification Method:** Test
- **Dependencies:** FR-117
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-119 — Notify tenant of supply request
- **Statement:** The system shall notify the Tenant Admin when a supply request is submitted.
- **Rationale:** The tenant acts on requests.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a submitted request, when it is saved, then the Tenant Admin receives a push and in-app notification.
- **Verification Method:** Test
- **Dependencies:** FR-117
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-005
- **History:** 2026-10-28 Proposed (PR #8)

### FR-120 — Approve or reject supply request
- **Statement:** The system shall allow the Tenant Admin to approve or reject a submitted supply request, requiring a reason for rejection.
- **Rationale:** Status workflow: Submitted → Approved / Rejected (with reason).
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a Submitted request, when the Tenant Admin approves it, then its status is Approved.
  - AC2: Given a Submitted request, when the Tenant Admin rejects it without a reason, then the system rejects the action.
- **Verification Method:** Test
- **Dependencies:** FR-117
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-121 — Complete supply request with costs
- **Statement:** The system shall allow the Tenant Admin to mark an approved supply request as Purchased/Delivered, requiring a cost amount and currency for each item.
- **Rationale:** Costs per item feed the branch expense report.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given an Approved request with two items, when the Tenant Admin completes it with a cost and currency for each item, then its status is Purchased/Delivered.
  - AC2: Given a missing item cost, when completion is submitted, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-120
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-122 — Notify branch manager of supply status
- **Statement:** The system shall notify the requesting Branch Manager when the status of their supply request changes.
- **Rationale:** Managers follow their requests.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a request changes from Submitted to Approved, when the change is saved, then the Branch Manager receives a push and in-app notification.
- **Verification Method:** Test
- **Dependencies:** FR-120, FR-121
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-005
- **History:** 2026-10-28 Proposed (PR #8)

### FR-123 — Exchange rate snapshot on supply costs
- **Statement:** The system shall store the SYP/USD exchange rate in effect with each recorded supply item cost.
- **Rationale:** Expense reports remain correct after rate changes.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a cost recorded at rate X, when the rate later changes, then the record still shows rate X.
- **Verification Method:** Test
- **Dependencies:** FR-121
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-004
- **History:** 2026-10-28 Proposed (PR #8)

### FR-124 — Branch supply expense report
- **Statement:** The system shall provide the Tenant Admin with a supply expense report per branch for a selected period in SYP.
- **Rationale:** Tenant follows branch costs.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given two completed requests for branch X in October totalling 50,000 SYP, when the Tenant Admin views branch X's report for October, then the total is 50,000 SYP.
  - AC2: Given a USD cost, when it is reported, then it is converted to SYP at its stored rate.
- **Verification Method:** Test
- **Dependencies:** FR-121, FR-123
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)


## Payroll and Reports

### FR-125 — Barber salary
- **Statement:** The system shall allow the Tenant Admin to set a monthly salary in SYP for each barber.
- **Rationale:** Barbers earn a salary plus commission.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a barber, when the Tenant Admin sets a salary of S SYP, then S appears as the salary line of the barber's next payroll statement.
- **Verification Method:** Test
- **Dependencies:** FR-005
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-126 — Commission rate snapshot
- **Statement:** The system shall store with each completed booking service the commission rate in effect at completion.
- **Rationale:** Rate changes do not alter past commissions.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a service with rate 30% at completion, when the Tenant Admin later changes it to 40%, then that completed service still uses 30%.
- **Verification Method:** Test
- **Dependencies:** FR-041, FR-063
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-127 — Commission calculation
- **Statement:** The system shall calculate a barber's commission for each completed service as the service's paid amount in SYP multiplied by its stored commission rate.
- **Rationale:** Commission is per service on the paid amount after discount.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a service paid 10,000 SYP with rate 30%, when commission is calculated, then it equals 3,000 SYP.
  - AC2: Given a service paid 10 USD at a stored rate of 13,000 SYP/USD and rate 30%, when commission is calculated, then it equals 39,000 SYP.
- **Verification Method:** Test
- **Dependencies:** FR-064, FR-065, FR-126
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-128 — Payroll manual items
- **Statement:** The system shall allow the Tenant Admin to add advances, deductions and bonuses with an amount in SYP to a barber's payroll statement.
- **Rationale:** Statements include manual items.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a barber's statement for October, when the Tenant Admin adds an advance of 20,000 SYP, then the statement lists it and the net amount decreases by 20,000 SYP.
- **Verification Method:** Test
- **Dependencies:** FR-129
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-129 — Monthly payroll statement
- **Statement:** The system shall produce for each barber a payroll statement per calendar month with salary, total commission, manual items and net amount.
- **Rationale:** Monthly statement per barber.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a barber with salary 500,000, commission 150,000, a bonus of 50,000 and a deduction of 20,000 in October, when the October statement is viewed, then the net amount is 680,000 SYP.
- **Verification Method:** Test
- **Dependencies:** FR-125, FR-127
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-130 — Payroll statement visibility
- **Statement:** The system shall show payroll statements only to the Tenant Admin and to the barber concerned.
- **Rationale:** Branch Managers do not see statements.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given barber B's statement, when B opens payroll, then B sees only B's statements.
  - AC2: Given a Branch Manager, when they look for payroll statements, then none are available.
- **Verification Method:** Test
- **Dependencies:** FR-129
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-131 — Attribute services to performing branch
- **Statement:** The system shall attribute each completed service to the branch where it was performed.
- **Rationale:** Services by temporarily transferred barbers count for the branch where they were performed.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given barber B of branch X temporarily transferred to branch Y, when B completes a service at Y, then the service counts in branch Y's reports.
- **Verification Method:** Test
- **Dependencies:** FR-015, FR-063
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

### FR-132 — Branch activity report
- **Statement:** The system shall provide the Branch Manager and the Tenant Admin with the number of completed services per barber of a branch for a selected period.
- **Rationale:** Branch managers follow employee activity.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given barber B completed 12 services at branch X in October, when the manager of X views October's report, then B shows 12.
- **Verification Method:** Test
- **Dependencies:** FR-012, FR-131
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #8)

## In-app Chat

### FR-133 — Chat with branch
- **Statement:** The system shall allow a logged-in customer to open a text chat with a branch whose tenant plan sets the contact type to in-app chat.
- **Rationale:** Customers contact the branch, not individual barbers; no booking is required.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a branch on a plan with in-app chat, when a logged-in customer without any booking taps contact, then a chat with that branch opens.
  - AC2: Given a branch on a plan with phone call, when the customer views it, then no chat action is available.
- **Verification Method:** Test
- **Dependencies:** FR-024, FR-048
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #13)

### FR-134 — Branch-side chat recipient
- **Statement:** The system shall deliver a branch's chats to the Branch Manager of that branch.
- **Rationale:** The Branch Manager answers for the branch; without a manager the Tenant Admin answers (FR-010).
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given branch X with a manager, when a customer sends a message to X, then the manager of X sees it in the tenant app.
  - AC2: Given branch X without a manager, when a customer sends a message to X, then the Tenant Admin sees it.
  - AC3: Given a barber of X who is not its manager, when they open the tenant app, then they cannot see X's chats.
- **Verification Method:** Test
- **Dependencies:** FR-010, FR-133
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #13)

### FR-135 — Text-only messages
- **Statement:** The system shall accept only text content in chat messages.
- **Rationale:** Avoids storing customer images in chat.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a chat, when a user tries to attach an image or file, then no attachment option is available.
- **Verification Method:** Test
- **Dependencies:** FR-133
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #13)

### FR-136 — Chat retention setting
- **Statement:** The system shall allow the Platform Operator to set the chat message retention period, with a default of 90 days.
- **Rationale:** Messages are not kept indefinitely.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a new installation, when the setting is viewed, then its value is 90 days.
  - AC2: Given the Platform Operator, when they set it to N days, then the saved value is N.
- **Verification Method:** Test
- **Dependencies:** none
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #13)

### FR-137 — Delete expired chat messages
- **Statement:** The system shall delete each chat message once it is older than the chat retention period.
- **Rationale:** Applies the retention setting.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a retention period of 90 days, when a message becomes 91 days old, then it is no longer visible to either party and no longer stored.
- **Verification Method:** Test
- **Dependencies:** FR-136
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #13)

### FR-138 — Report chat message
- **Statement:** The system shall allow either chat party to report a message to the Platform Operator.
- **Rationale:** Abusive messages reach the operator, as for rating comments.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a received message, when the recipient reports it, then the report appears in the Platform Operator's report list with the message text.
- **Verification Method:** Test
- **Dependencies:** FR-133
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #13)

### FR-139 — Block customer from chat
- **Statement:** The system shall allow the Branch Manager to block a customer from sending chat messages to their branch.
- **Rationale:** The shop can stop abusive customers.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a blocked customer, when they try to send a message to that branch, then the system rejects it.
  - AC2: Given the same customer, when they message another branch, then the block does not apply.
- **Verification Method:** Test
- **Dependencies:** FR-134
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #13)

### FR-140 — Unblock customer from chat
- **Statement:** The system shall allow the Branch Manager to unblock a customer blocked from their branch's chat.
- **Rationale:** Blocks are reversible.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a blocked customer, when the Branch Manager unblocks them, then the customer can send messages to that branch again.
- **Verification Method:** Test
- **Dependencies:** FR-139
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #13)

### FR-141 — Notify new chat message
- **Statement:** The system shall notify the recipient of each new chat message by push and in-app notification.
- **Rationale:** Parties learn about new messages.
- **Source:** SH-01 (elicitation 2026-10-28)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer sends a message to branch X, when it is saved, then the branch-side recipient receives a push and in-app notification.
  - AC2: Given the branch replies, when the reply is saved, then the customer receives a push and in-app notification.
- **Verification Method:** Test
- **Dependencies:** FR-134
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-005
- **History:** 2026-10-28 Proposed (PR #13)

## Plans and Subscriptions (addendum)

### FR-142 — Single free plan
- **Statement:** The system shall provide exactly one predefined free plan with a price of 0 SYP, no subscription duration and the lowest plan level, which the Platform Operator cannot delete.
- **Rationale:** Every tenant without a paid subscription falls back to the free plan; its features are configured through the plan-feature matrix.
- **Source:** SH-01 (verification of F-002, 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Approved
- **Acceptance Criteria:**
  - AC1: Given a new installation, when the plans are listed, then exactly one plan is marked free.
  - AC2: Given the free plan, when the Platform Operator tries to delete it, then the system rejects the request.
  - AC3: Given the free plan, when the Platform Operator changes its features in the matrix, then the change is saved.
  - AC4: Given the free plan, when the Platform Operator edits it, then only its name and its plan-feature matrix entries can be changed.
  - AC5: Given the free plan, when the Platform Operator saves a paid plan with a level lower than or equal to the free plan's level, then the system rejects it.
- **Verification Method:** Test
- **Dependencies:** FR-021, FR-023
- **Trace:** UC: — | ADR: — | CR: CR-001
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #14); 2026-10-28 Approved by SH-01 (PR #16); 2026-10-28 changed by CR-001 (#18, PR #19)

## Notifications

### FR-143 — Notification delivery
- **Statement:** The system shall deliver every notification as a push notification and store it in the recipient's in-app notification list.
- **Rationale:** Push and in-app are the notification channels (decided with OQ-011).
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given any notification event, when it is triggered, then the recipient receives a push notification and the notification appears in their in-app list.
  - AC2: Given push delivery fails, when the recipient opens the app, then the notification is still in the in-app list.
- **Verification Method:** Test
- **Dependencies:** none
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** OQ-005
- **History:** 2026-10-28 Proposed (PR #15)

### FR-144 — Notify new booking
- **Statement:** The system shall notify the assigned barber and the Branch Manager of each new booking at their branch.
- **Rationale:** The shop learns about new bookings.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a branch with a manager, when a booking assigned to barber B is created, then B and the manager receive a notification.
  - AC2: Given a branch without a manager, when a booking is created, then the assigned barber and the Tenant Admin receive a notification.
- **Verification Method:** Test
- **Dependencies:** FR-049, FR-143
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #15)

### FR-145 — Notify booking confirmation
- **Statement:** The system shall notify the customer when their pending booking is confirmed.
- **Rationale:** Manual confirmation needs feedback to the customer.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a Pending booking, when it is confirmed, then the customer receives a notification.
- **Verification Method:** Test
- **Dependencies:** FR-057, FR-143
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #15)

### FR-146 — Notify customer cancellation
- **Statement:** The system shall notify the assigned barber and the Branch Manager when a customer cancels a booking.
- **Rationale:** The shop learns about freed slots.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking of barber B at a branch with a manager, when the customer cancels it, then B and the manager receive a notification.
- **Verification Method:** Test
- **Dependencies:** FR-058, FR-143
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #15)

### FR-147 — Appointment reminder
- **Statement:** The system shall remind the customer of a confirmed booking at a lead time before the start set by the Tenant Admin.
- **Rationale:** Reduces no-shows.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a reminder lead time of L hours and a confirmed booking at time T, when T minus L is reached, then the customer receives a reminder.
  - AC2: Given a Tenant Admin, when they set the lead time, then the saved value is applied to future reminders.
- **Verification Method:** Test
- **Dependencies:** FR-045, FR-143
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #15)

### FR-148 — Rating request
- **Statement:** The system shall ask the customer to rate the barber and the branch when their booking is completed.
- **Rationale:** Encourages ratings after completed bookings.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a booking, when it is marked Completed, then the customer receives a notification that opens the rating screen.
- **Verification Method:** Test
- **Dependencies:** FR-104, FR-105, FR-143
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #15)

### FR-149 — Notify preview quota grant
- **Statement:** The system shall notify a customer when a tenant grants or increases their preview quota.
- **Rationale:** Customers learn that the AI preview is available to them.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer, when the Tenant Admin grants them a quota, then the customer receives a notification stating the tenant and the number of previews.
- **Verification Method:** Test
- **Dependencies:** FR-066, FR-143
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #15)

### FR-150 — Credit batch expiry warning
- **Statement:** The system shall warn the Tenant Admin a number of days before a credit batch expires, as set by the Platform Operator.
- **Rationale:** Tenants can use or regrant credits before expiry.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a warning lead time of N days and a batch expiring on date D with unused credits, when D minus N days is reached, then the Tenant Admin receives a notification.
  - AC2: Given the Platform Operator, when they set N, then the saved value is applied to future warnings.
- **Verification Method:** Test
- **Dependencies:** FR-082, FR-143
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #15)

### FR-151 — Operator report notification
- **Statement:** The system shall show each new report of a rating comment or chat message in the Platform Operator's back-office as an unread notification.
- **Rationale:** The operator acts on reports.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a new report, when it is submitted, then the back-office shows it as unread until the operator opens it.
- **Verification Method:** Test
- **Dependencies:** FR-108, FR-138
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #15)

### FR-152 — Notification preferences
- **Statement:** The system shall allow each user to turn off notification types except booking cancellation, booking rejection and barber unassignment notifications.
- **Rationale:** Users control non-critical notifications; critical ones always arrive.
- **Source:** SH-01 (elicitation 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a customer who turns off appointment reminders, when a reminder is due, then no reminder is sent.
  - AC2: Given any user, when they open notification settings, then cancellation, rejection and unassignment notifications cannot be turned off.
- **Verification Method:** Test
- **Dependencies:** FR-143
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #15)

### FR-153 — View current plan
- **Statement:** The system shall display to the Tenant Admin the tenant's current plan and the tenant features it enables.
- **Rationale:** Tenants need to know which plan and features they have (F-002 spec Q1).
- **Source:** SH-01 (F-002 spec questions, 2026-10-28; Claude proposal approved)
- **Priority:** Must
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a tenant on plan P, when the Tenant Admin opens the plan screen in the tenant app, then plan P's name and its enabled tenant features are shown.
  - AC2: Given a tenant on the free plan, when the Tenant Admin opens the plan screen, then the free plan and its enabled features are shown.
- **Verification Method:** Test
- **Dependencies:** FR-022, FR-023
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #19)

### FR-154 — Retire paid plan
- **Statement:** The system shall allow the Platform Operator to retire a paid plan so that it is no longer offered for new subscriptions, upgrades or renewals.
- **Rationale:** Plans are decided after launch and may be withdrawn; plans are never deleted (F-002 spec Q4).
- **Source:** SH-01 (F-002 spec questions, 2026-10-28; Claude proposal approved)
- **Priority:** Should
- **Status:** Proposed
- **Acceptance Criteria:**
  - AC1: Given a retired plan, when a Tenant Admin opens the plan selection, then the retired plan is not offered.
  - AC2: Given a tenant subscribed to a plan that is then retired, when the plan is viewed during the current period, then the tenant keeps it until its expiry date.
  - AC3: Given the free plan, when the Platform Operator tries to retire it, then the system rejects the request.
- **Verification Method:** Test
- **Dependencies:** FR-021, FR-142
- **Trace:** UC: — | ADR: — | CR: —
- **Open Questions:** none
- **History:** 2026-10-28 Proposed (PR #19)
