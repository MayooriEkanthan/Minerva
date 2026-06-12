# Minerva Technical Architecture

## Overview
Minerva is a privacy-first tele-medicine platform catering specifically to female patients needing secure, anonymous access to healthcare.

## The Stack
- **Mobile Client:** Flutter / Dart
- **Web Admin Dashboard:** React, Vite, Vanilla CSS (Glassmorphism)
- **Backend / Database:** Firebase Firestore (NoSQL)
- **Serverless Compute:** Firebase Cloud Functions (Node.js)
- **Authentication:** Firebase Auth
- **Storage:** Firebase Cloud Storage (for medical records and prescriptions)

## Data Flow
1. **Client Layer:** The Flutter app connects securely to Firebase. Real-time streams listen to the `activeConsultations` collection.
2. **Security Layer:** Firestore Security Rules (`firestore.rules`) intercept every request. A patient can only read their own records. Doctors can only read records assigned to them.
3. **Trigger Layer:** When a consultation is marked "completed", a Cloud Function triggers in the background to generate an invoice and send a push notification.

## Key Security Tenets
- **Data Minimization:** We only collect necessary medical data. Identity data is kept separate from health metrics.
- **Role-Based Access Control (RBAC):** Verified using Firebase Custom Claims (`admin`, `doctor`, `patient`).
