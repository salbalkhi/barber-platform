# RE Template

Repository template for projects managed with the **"هندسة المتطلبات RE"** Claude Project.
It provides the standard requirements-engineering structure under `docs/re/` and the GitHub
templates under `.github/`.

## Start a new project
1. Click **Use this template** → create the new repository.
2. Sync labels (labels are not copied by templates):
   ```bash
   scripts/setup-labels.sh owner/new-repo
   ```
3. Edit `docs/re/README.md` (project overrides) and fill `docs/re/SRS.md` with Claude.
4. Replace this README with the project's own README.

## Structure
```
docs/re/          Requirements documentation (Single Source of Truth)
.github/          Issue templates, PR template, labels.json
scripts/          setup-labels.sh
```

## Conventions
See `docs/re/README.md`.
