TECH STACK

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Firestore](https://img.shields.io/badge/Cloud%20Firestore-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Provider](https://img.shields.io/badge/Provider-State%20Management-blue?style=for-the-badge)
![Clean%20Architecture](https://img.shields.io/badge/Clean%20Architecture-Design%20Pattern-darkgreen?style=for-the-badge)

Friends Fitness Management System

A Gym Management System built with Flutter using Clean Architecture.
This app helps gym owners manage members, attendance, renewals, and authentication using Firebase.

------------------------------------------------------------

FEATURES

- Admin Authentication (Login & Forgot Password)
- Add, Update, Delete Members
- Membership Renewal
- Attendance Tracking
- Dashboard with Statistics
- Member Search
- Firebase Integration
- Unit Tested Core Features

------------------------------------------------------------

ARCHITECTURE

This project follows Clean Architecture.

```
features/
│
├── data           -> Models, Data Sources, Repository Implementation
├── domain         -> Entities, Repository Contracts, Use Cases
└── presentation   -> UI, Providers, State Management

core/
│
├── config         -> App constants and sizes
├── di             -> Dependency Injection
├── services       -> Firebase initialization
├── theme          -> App theme and styling
├── validators     -> Input validation
├── helpers        -> Utility functions
└── widgets        -> Reusable widgets
```
------------------------------------------------------------

TECH STACK

- Flutter
- Dart
- Firebase Authentication
- Cloud Firestore
- Provider (State Management)
- Clean Architecture

------------------------------------------------------------

SETUP INSTRUCTIONS

1. Clone the repository
   git clone https://github.com/manojhp24/friends-fittness-management-system.git

2. Install dependencies
   flutter pub get

3. Add Firebase configuration
   - Replace google-services.json (Android)
   - Configure iOS Firebase settings if required

4. Run the application
   flutter run

------------------------------------------------------------

SCREENS INCLUDED

- Login Screen
- Dashboard
- Members List
- Add Member Screen
- Renew Membership Screen
- Attendance Screen

------------------------------------------------------------

PURPOSE OF THE PROJECT

- Practice Clean Architecture in Flutter
- Build scalable and maintainable project structure
- Implement Firebase authentication and Firestore
- Apply separation of concerns
- Write testable code

------------------------------------------------------------

FUTURE IMPROVEMENTS

- Role-based access
- Payment tracking
- Reports and analytics
- Push notifications for renewals

------------------------------------------------------------

AUTHOR

Manoj HP
Flutter Developer
