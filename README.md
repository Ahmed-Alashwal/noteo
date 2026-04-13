# Noteo 📝

A full-stack note-taking Android app with authentication, local storage, and REST API integration — built with Flutter & Django.

---

## Overview

Noteo is more than a simple notes app. It features a complete authentication system and real-time dual-write between local storage and a remote server.

---

## How It Works

1. **First launch** — the user registers or logs in (requires internet once).
2. **Token-based auth** — every subsequent operation is validated automatically via JWT access tokens stored securely on the device.
3. **CRUD operations** — the user can create, read, update, and delete notes. Every action is written locally via Hive and sent to the server via API simultaneously.

---

## Tech Stack

### Frontend — Flutter

- **Architecture:** Clean Architecture (feature-first)
- **State Management:** BLoC
- **Local Database:** Hive
- **HTTP Client:** Dio + Interceptors (auto-inject headers)
- **Authentication:** JWT — Login / Register / Logout (token deletion)
- **Secure Storage:** Flutter Secure Storage
- **Dependency Injection:** get_it
- **Validation:** Auto-validation on all fields
- **Error Handling:** Layered Exception Handling
- **UI Design:** Figma → Flutter

### Backend — Django

- **API Framework:** Django REST Framework (DRF)
- **Authentication:** SimpleJWT (access & refresh tokens)
- **Models:** Django ORM
- **Serialization:** DRF Serializers
- **API Testing:** Postman

---

## Features

- [x] Register & Login
- [x] Logout
- [x] Create, Read, Update, Delete notes
- [x] Dual-write — every action saved locally and sent to server simultaneously
- [x] Auto-validation on all form fields
- [x] Secure token storage

---

## Project Structure

```
lib/
├── core/
│   ├── api/
│   ├── errors/
│   ├── usecase/
│   ├── extensions/
│   └── utils/
│   ├── widgets/
|
└── features/
    ├── auth/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    └── notes/
        ├── data/
        ├── domain/
        └── presentation/
```

---

## Platform

- ✅ Android
- ⬜ iOS *(not yet)*

---

## Built With

- [Flutter](https://flutter.dev)
- [Django](https://www.djangoproject.com)
- [Django REST Framework](https://www.django-rest-framework.org)
- [SimpleJWT](https://django-rest-framework-simplejwt.readthedocs.io)
- [Hive](https://pub.dev/packages/hive)
- [Dio](https://pub.dev/packages/dio)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [get_it](https://pub.dev/packages/get_it)
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)

---

> Built entirely by hand — every line of code written and understood personally.
> AI was a discussion partner, not a code generator.
