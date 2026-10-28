# Features Index

> Bridge between the RE documentation and the implementation workflow (Spec Kit).
> Each row is one feature, specified with one `/speckit.specify` run. This file lists IDs only;
> requirement text lives in `requirements/*.md`.
>
> **Intake gate:** a feature may be specified only when every referenced requirement is `Approved`
> and no linked open question (`OQ-xxx`) remains open.

| ID | Feature | Requirements | Order | Depends on | Blocking open questions | Milestone | Status |
|---|---|---|---|---|---|---|---|
| F-001 | Tenancy & Organization | FR-001..FR-020 | 1 | — | OQ-012 (FR-008, FR-011); OQ-001 (FR-003); OQ-005, OQ-011 (FR-020) | v1.0 | Planned |
| F-002 | Plans & Entitlements | FR-021..FR-026 | 2 | F-001 | OQ-014 (FR-024) | v1.0 | Planned |
| F-003 | Services & Booking | FR-041..FR-065 | 3 | F-001, F-002 | OQ-004 (FR-065); OQ-005 (FR-060); OQ-006 (FR-046); OQ-011 (FR-057) | v1.0 | Planned |
| F-004 | Discovery, Ratings & Favorites | FR-097..FR-115 | 4 | F-003 | OQ-001 (FR-099, FR-103); OQ-005, OQ-011 (FR-113) | v1.0 | Planned |
| F-005 | Subscriptions & Payments | FR-027..FR-040 | 5 | F-002 | OQ-003 (FR-028, FR-029, FR-036, FR-040); OQ-004 (FR-030); OQ-005 (FR-031) | v1.0 | Planned |
| F-006 | Discount Codes | FR-085..FR-096 | 6 | F-003 | OQ-005, OQ-011 (FR-087) | v1.0 | Planned |
| F-007 | AI Preview & Credits | FR-066..FR-084 | 7 | F-003, F-005 | OQ-002, OQ-010 (FR-072); OQ-005, OQ-011 (FR-081) | v1.0 | Planned |
| F-008 | Supplies | FR-116..FR-124 | 8 | F-001 | OQ-004 (FR-123); OQ-005 (FR-119, FR-122) | v1.0 | Planned |
| F-009 | Payroll & Reports | FR-125..FR-132 | 9 | F-003 | OQ-004 (FR-127 via FR-065) | v1.0 | Planned |

## Status values
`Planned` → `Specified` (spec merged) → `In Progress` → `Done` (all requirements `Implemented`).
Status changes are made by the RE process only.
