# Stakeholders

| ID | Name / Role | Interest | Influence (H/M/L) | Contact / Channel |
|---|---|---|---|---|
| SH-01 | Product Owner | Final decision maker for requirements and changes | H | — |
| SH-02 | Platform Operator | Commercial owner and administrator of the platform: onboards and manages tenants, plans, subscriptions and external integrations; provides technical support to tenants; prepares government reports when required | H | Web back-office |
| SH-03 | Tenant Admin | Owner of a barbershop business (tenant): manages branches, employees, services, promotions, AI preview grants and credits, payroll; follows business performance | H | Tenant app |
| SH-04 | Branch Manager | Optional manager of exactly one branch (a barber or a non-barber employee): manages bookings, working schedules, branch prices and service activation; monitors employees; sends supply requests | M | Tenant app |
| SH-05 | Barber | Employee of one branch; earns a salary plus per-service commission; manages own appointments; keeps favorite customers | M | Tenant app |
| SH-06 | Customer | Finds a barber, books appointments, uses discount codes and AI haircut preview, rates barbers and branches | H | Customer app |
| SH-07 | External Service Providers | Sham Cash, Google (Maps, Gemini, push), SMS/OTP provider, exchange-rate provider | M | Provider agreements (OQ-001..OQ-006) |
| SH-08 | Government Authorities | Recipient of reports when required by regulation | L | OQ-009 |

## Roles in the system
| Role | App | Created by | Login |
|---|---|---|---|
| Platform Operator | Web back-office | — | Username + password + 2FA |
| Tenant Admin | Tenant app | Platform Operator | Username + password |
| Branch Manager | Tenant app | Tenant Admin (assignment of an existing employee) | Username + password |
| Barber | Tenant app | Tenant Admin | Username + password |
| Non-barber employee | Tenant app (only when assigned as Branch Manager) | Tenant Admin | Username + password |
| Customer | Customer app | Self-registration (required only for booking) | Phone number + OTP |
