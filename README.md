# 🛡️ Minerva: Privacy-First Women’s Health & Consultation Platform

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)
[![Firebase Auth](https://img.shields.io/badge/Firebase_Auth-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)
[![Cloud Functions](https://img.shields.io/badge/Cloud_Functions-4285F4?style=for-the-badge&logo=googlecloud&logoColor=white)](https://cloud.google.com/functions)
[![REST API](https://img.shields.io/badge/REST_APIs-00558C?style=for-the-badge&logo=json&logoColor=white)](https://restfulapi.net/)

**Minerva** is a privacy-first mobile medical platform built using Flutter and Firebase that provides a secure, anonymous gateway for women facing sociocultural taboos, family constraints, or modesty barriers to consult verified female doctors safely. It features real-time voice masking capabilities, strict data minimization, and encrypted in-person clinic token management.

---

## 🏗️ Architecture Overview

The platform uses a modular **monorepo architecture**, cleanly separating mobile client interfaces, backend cloud functions, shared domain packages, and database security configuration:

```text
minerva/
├── apps/                          # Cross-platform mobile applications
│   ├── patient_app/               # Patient interface (consultations, anonymous booking, tokens)
│   └── doctor_app/                # Verified female doctor portal & schedule management
├── backend/                       # Serverless backend infrastructure
│   └── functions/                 # Firebase Cloud Functions (Auth, verification triggers, REST APIs)
├── packages/                      # Monorepo shared modules
│   └── shared/                    # Core models, UI components, & encryption utilities
├── docs/                          # System architecture diagrams & API documentation
├── database.rules.json            # Firebase Realtime Database security rules
├── firestore.indexes.json         # Firestore database index definitions
├── firestore.rules                # Granular Firestore security and privacy access rules
├── firebase.json                  # Firebase project environment configuration
└── package.json                   # Monorepo root dependencies & script manager
