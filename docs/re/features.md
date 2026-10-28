# Features Index

> Bridge between the RE documentation and the implementation workflow (Spec Kit).
> Each row is one feature, specified with one `/speckit.specify` run. This file lists IDs only;
> requirement text lives in `requirements/*.md`.
>
> **Intake gate:** a feature may be specified only when every referenced requirement is `Approved`
> and no linked open question (`OQ-xxx`) remains open.

| ID | Feature | Requirements | Order | Depends on | Blocking open questions | Milestone | Status |
|---|---|---|---|---|---|---|---|
| F-001 | Tenancy & Organization | FR-001..FR-020 | 2 | F-011 | OQ-012 (FR-008, FR-011); OQ-001 (FR-003); OQ-005 (FR-020) | v1.0 | Planned |
| F-002 | Plans & Entitlements | FR-021..FR-026, FR-142, FR-153, FR-154 | 3 | F-001 | — | v1.0 | Planned |
| F-003 | Services & Booking | FR-041..FR-065, FR-144..FR-148 | 4 | F-001, F-002 | OQ-004 (FR-065); OQ-005 (FR-060); OQ-006 (FR-046) | v1.0 | Planned |
| F-004 | Discovery, Ratings & Favorites | FR-097..FR-115, FR-151 | 5 | F-003 | OQ-001 (FR-099, FR-103); OQ-005 (FR-113) | v1.0 | Planned |
| F-005 | Subscriptions & Payments | FR-027..FR-040 | 6 | F-002 | OQ-003 (FR-028, FR-029, FR-036, FR-040); OQ-004 (FR-030); OQ-005 (FR-031) | v1.0 | Planned |
| F-006 | Discount Codes | FR-085..FR-096 | 7 | F-003 | OQ-005 (FR-087) | v1.0 | Planned |
| F-007 | AI Preview & Credits | FR-066..FR-084, FR-149, FR-150 | 8 | F-003, F-005 | OQ-002, OQ-010 (FR-072); OQ-005 (FR-081) | v1.0 | Planned |
| F-008 | Supplies | FR-116..FR-124 | 9 | F-001 | OQ-004 (FR-123); OQ-005 (FR-119, FR-122) | v1.0 | Planned |
| F-009 | Payroll & Reports | FR-125..FR-132 | 10 | F-003 | OQ-004 (FR-127 via FR-065) | v1.0 | Planned |
| F-010 | In-app Chat | FR-133..FR-141 | 11 | F-002 | OQ-005 (FR-141) | v1.0 | Planned |
| F-011 | Notifications Foundation | FR-143, FR-152 | 1 | — | OQ-005 (FR-143) | v1.0 | Planned |

## Status values
`Planned` → `Specified` (spec merged) → `In Progress` → `Done` (all requirements `Implemented`).
Status changes are made by the RE process only.
