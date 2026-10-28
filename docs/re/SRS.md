# Software Requirements Specification — Barber Platform
Version: 0.2 | Baseline: none | Last updated: 2026-10-28

> Simplified outline inspired by ISO/IEC/IEEE 29148:2018. Requirement statements live in
> `requirements/` and are referenced here, not duplicated.

## 1. Introduction
### 1.1 Purpose
Barber Platform is a multi-tenant marketplace and management platform for barbershops in Syria.
Customers discover barbershops and book appointments; each barbershop business (tenant) manages
its branches, employees, services, bookings, promotions and payroll; the platform operator
manages tenants, subscription plans and external integrations.

This document is intended for the product owner, the platform operator and the development team.

### 1.2 Scope
**In scope (v1):**
- Customer Android app: browse and search barbershops, view barbers and services, book
  appointments, use discount codes, AI haircut preview (when granted), favorites, ratings.
- Tenant Android app (includes the tenant dashboard): tenant, branch and employee management,
  services and prices, bookings, payment recording, discount codes, AI preview grants and credits,
  supply requests, payroll statements, reports.
- Platform operator functions: tenant onboarding, subscription plans and plan-feature
  entitlements, subscriptions and payments, external integration settings, support, reports.
- Subscription plans: one free plan and multiple paid levels; features enabled per plan through a
  configurable plan-feature matrix.
- Subscription and preview-credit payments via Sham Cash or manual activation after external payment.
- Arabic and English user interface; SYP (new Syrian pound) as default currency, USD accepted.

**Out of scope (v1):**
- iOS app and web app (planned for later releases).
- In-app payment of services by customers (customers pay at the shop in v1).
- Fixed definition of the number of paid plans and their feature sets (decided after launch;
  configured through the plan-feature matrix).

### 1.3 Definitions
See [glossary.md](glossary.md).

### 1.4 References
- `RE-Context.md` (project RE conventions, Claude Project knowledge)
- Elicitation session with SH-01, 2026-10-28

## 2. Overall Description
### 2.1 Product Perspective
A new, standalone system composed of:
- **Customer app** (Android)
- **Tenant app** (Android; used by tenant admins, branch managers and barbers)
- **Platform backend** (shared, single database for all tenants)
- **Operator back-office** (web; used by the Platform Operator)

External systems:

| System | Purpose | Feasibility |
|---|---|---|
| Sham Cash | Subscription and credit payments | OQ-003 |
| Google Maps Platform | Location, proximity search, navigation hand-off | OQ-001 |
| Google Gemini API (primary) + alternative AI provider (fallback) | AI haircut preview | OQ-002 |
| Push provider (e.g. Firebase Cloud Messaging) | Push notifications | OQ-005 |
| Local Syrian SMS provider | Customer phone verification (OTP) | OQ-006 |
| Exchange-rate provider | Real-time SYP/USD rate | OQ-004 |

### 2.2 Product Functions
High-level summary only; details in `requirements/functional.md`.

| Area | Summary |
|---|---|
| Tenancy & organization | Tenants (businesses) with one or more branches; employees (barbers and non-barbers) assigned to one branch at a time; optional single branch manager per branch; temporary or permanent transfers between branches |
| Plans & entitlements | Free plan and paid plan levels; operator-managed plan-feature matrix (prices display, contact type, booking, maps navigation, promotions, AI preview and included credits, search priority) |
| Services & booking | Tenant-wide service catalog (duration, commission); branch-level price and activation; booking on a specific barber or on a branch; payment recorded per service at completion |
| Discovery | Search by proximity, name, service and rating; ordering by plan level first, then the chosen criterion; free plan listed after all paid plans |
| AI haircut preview | Granted by the tenant to named customers with quotas; only within a booking; image retained on the server until the haircut ends and visible only to the assigned barber |
| Preview credits | Credits included with plans or purchased; batches valid one calendar month; reserved on grant; earliest-expiry first; equal redistribution on expiry |
| Promotions | Discount codes defined by the tenant (type, expiry, usage limits, services/branches) for all customers, a barber's favorite customers, or named customers |
| Favorites & ratings | Two-way favorites (barber adds customers by QR); 1–5 star ratings with optional comment for barber and branch after a completed booking |
| Supplies | Branch supply requests from a tenant-defined catalog or free items; status workflow; cost per item; branch expense report |
| Payroll | Monthly payroll statement per barber: salary, per-service commission on paid amount, manual advances/deductions/bonuses |
| Notifications | Push and in-app notifications |

### 2.3 User Classes and Characteristics
See [stakeholders.md](stakeholders.md).

### 2.4 Operating Environment
- Android devices (minimum Android version: OQ-012).
- Market: Syria; languages: Arabic (RTL) and English.

### 2.5 Constraints
| ID | Constraint | Type | Source |
|---|---|---|---|
| C-01 | Multi-tenant architecture with a single shared database for all tenants | Technical | SH-01 |
| C-02 | v1 customer and tenant apps are Android only; the Platform Operator uses a web back-office | Business | SH-01 (OQ-013) |
| C-03 | Market is Syria; currency SYP (new pound, after redenomination) as default; USD accepted at a real-time exchange rate | Business | SH-01 |
| C-04 | Selected providers: Sham Cash (payments), Google Maps (maps), Gemini (AI preview) | Business | SH-01 |
| C-05 | Customer payments for services happen at the shop in v1 | Business | SH-01 |
| C-06 | Customer images for AI preview are not retained on the server after the haircut ends (see glossary: Preview Retention) | Regulatory / Privacy | SH-01 |

### 2.6 Assumptions and Dependencies
| ID | Assumption / Dependency | Related |
|---|---|---|
| A-01 | External providers listed in §2.1 are usable from and for Syria | OQ-001..OQ-006 |
| A-02 | Number of paid plans and their features are configured after launch | Plan-feature matrix |

## 3. Specific Requirements
### 3.1 Functional Requirements
→ [requirements/functional.md](requirements/functional.md)

### 3.2 Non-Functional Requirements
→ [requirements/non-functional.md](requirements/non-functional.md)
(Performance, Security, Usability, Reliability, Availability, Maintainability, Portability, Compliance)
Targets pending: OQ-012.

### 3.3 External Interface Requirements
See §2.1 external systems; interface details will be specified per integration after the related
feasibility questions are closed.

### 3.4 Data Requirements
To be specified with the functional requirements. Known data points: branch city; exchange rate
stored with every financial record; paid amount and currency recorded per service.

## 4. Verification
Each FR/NFR defines its own verification method. Set-level verification follows the baseline
checklist in `RE-Context.md` §5.3 before any `re-baseline-v<x.y>` tag.

## 5. Appendices
None.
