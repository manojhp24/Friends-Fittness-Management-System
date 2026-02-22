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
