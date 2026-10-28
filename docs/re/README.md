# Requirements Engineering (RE) — Documentation Index

This folder is the **Single Source of Truth** for the project's requirements.
Anything not merged into the default branch here is **not approved**.

## Project Conventions
- **Content language:** English
- **Default branch:** main
- **Requirement IDs:** `FR-001`, `NFR-001`, `UC-001`, `US-001`, `CR-001`, `ADR-001`, `OQ-001`, `F-001` (unique, never reused)
- **Requirement statement form:** `The system shall <verb> <object> [<condition>].`
- **Priority:** MoSCoW (Must / Should / Could / Won't)
- **Lifecycle:** Proposed → Approved → Implemented → Verified (+ Rejected, Deprecated)
- **Commits:** Conventional Commits with a `Refs:` trailer (e.g. `Refs: FR-001`)

## Index
| File | Purpose |
|---|---|
| [SRS.md](SRS.md) | Overall description, scope, constraints (references requirement files) |
| [glossary.md](glossary.md) | Terms and definitions |
| [stakeholders.md](stakeholders.md) | Stakeholders and roles (requirement sources) |
| [requirements/functional.md](requirements/functional.md) | Functional requirements (FR-xxx) |
| [requirements/non-functional.md](requirements/non-functional.md) | Non-functional requirements (NFR-xxx) |
| [use-cases/](use-cases/) | Use cases (UC-xxx), one file each; user stories in `user-stories.md` |
| [changes/](changes/) | Decided change requests (CR-xxx) with impact analysis |
| [decisions/](decisions/) | Architecture/decision records (ADR-xxx) |
| [traceability/RTM.md](traceability/RTM.md) | Requirements Traceability Matrix |
| [features.md](features.md) | Features index (F-xxx): implementation order, intake gate for Spec Kit |
| [open-questions.md](open-questions.md) | Open questions (OQ-xxx) |
| [review-log.md](review-log.md) | Commit-monitoring log and last reviewed commit |

## Project-specific overrides
<!-- Record any deviation from the conventions above (e.g. content language). -->
None.
