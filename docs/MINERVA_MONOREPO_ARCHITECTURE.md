# Minerva Monorepo Architecture

Minerva utilizes a **Monorepo** approach to house multiple interdependent projects under a single Git repository. This ensures tight coupling between frontend apps, backend logic, and shared configurations.

## Directory Layout

```text
Minerva/
├── apps/
│   ├── mobile/             # Flutter Application (Patient & Doctor App)
│   └── web/                # React Web Application (Admin Dashboard)
├── backend/
│   └── functions/          # Firebase Cloud Functions (Node.js)
├── packages/
│   └── shared/             # Shared JavaScript libraries (Constants, Utilities)
├── docs/                   # System Documentation
├── .github/workflows/      # CI/CD Pipelines
├── firebase.json           # Firebase Deployment Configuration
├── firestore.rules         # Security rules for database
└── package.json            # Root workspace configuration
```

## Why a Monorepo?
1. **Single Source of Truth:** Shared logic (like medical formulas in `packages/shared`) can be updated in one place and instantly consumed by the Admin Web Dashboard.
2. **Atomic Commits:** A single pull request can include a database rule change, a backend function update, and the corresponding frontend UI changes.
3. **Unified CI/CD:** Our GitHub Actions can orchestrate deployments across all environments simultaneously.
