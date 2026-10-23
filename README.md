# 🛡️ Minerva: Privacy-First Women’s Health & Consultation Platform

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)[cite: 3]
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)[cite: 3]
[![Firebase Auth](https://img.shields.io/badge/Firebase_Auth-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)
[![Cloud Functions](https://img.shields.io/badge/Cloud_Functions-4285F4?style=for-the-badge&logo=googlecloud&logoColor=white)](https://cloud.google.com/functions)
[![REST API](https://img.shields.io/badge/REST_APIs-00558C?style=for-the-badge&logo=json&logoColor=white)](https://restfulapi.net/)

**Minerva** is a privacy-first mobile medical platform built using Flutter and Firebase that provides a secure, anonymous gateway for women facing sociocultural taboos, family constraints, or modesty barriers to consult verified female doctors safely. It features real-time voice masking, data minimization, and secure in-person clinic tokens.

---

## 🏗️ Architecture Overview

The platform is designed around a modular **monorepo architecture**, cleanly separating backend cloud functions, shared domain logic, and client apps for patients and medical practitioners:

```text
minerva/
├── apps/                          # Mobile cross-platform client applications
│   ├── patient_app/               # Patient interface (consultations, tokens, privacy controls)
│   └── doctor_app/                # Verified female doctor portal & appointment management
├── backend/                       # Serverless infrastructure & APIs
│   └── functions/                 # Firebase Cloud Functions (auth, verification, notifications)
├── packages/                      # Monorepo shared packages
│   └── shared/                    # Core models, encryption helpers, and design system components
├── docs/                          # Architecture diagrams, system workflow & API docs
├── database.rules.json            # Realtime Database security rules
├── firestore.indexes.json         # Firestore index optimization specs
├── firestore.rules                # Granular data access & privacy security rules
├── firebase.json                  # Firebase project configuration
└── package.json                   # Monorepo workspace management dependencies
