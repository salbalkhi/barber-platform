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
