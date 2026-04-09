---
description: Core rules for Clean Architecture, Domain-Driven Design (DDD), and coding standards.
paths:
  - "lib/**/*"
  - "packages/**/*"
---
# Architecture & DDD Principles

## 1) Project Structure (Monorepo)

```
packages/
├── core/                         # Extensions, Utils, Base Classes shared across app.
├── design_system/                # Theme, Color, Typography, Shared Widgets (Button, Input...).
├── network/                      # Dio config, Interceptors, API clients.
├── local_storage/                # SharedPreferences, Hive, SecureStorage.
├── localization/                 # ARB language files, generated localization code.
├── share/                        # Constants, helpers (Route paths, Assets...).
└── features/                     # Feature Packages (Auth, Home, Profile...).
    └── feature_name/             # e.g. features_auth
        ├── lib/
        │   ├── domain/           # LAYER 1: CORE (No Flutter dependency)
        │   │   ├── entities/     # Business Objects (User, Order...). Has identity & logic.
        │   │   ├── values/       # Value Objects (Email, Password...). Immutable, self-validating.
        │   │   ├── repositories/ # Repository Interfaces (IAuthRepository). Abstraction only.
        │   │   └── usecases/     # Application Logic (LoginUseCase). Orchestrates Domain.
        │   │
        │   ├── data/             # LAYER 2: DATA & IMPLEMENTATION
        │   │   ├── models/       # DTOs (UserModel). Maps from JSON/DB.
        │   │   ├── datasources/  # Remote (API) or Local (DB) data sources.
        │   │   ├── repositories/ # Repository Impl (AuthRepositoryImpl). Maps DTO -> Entity.
        │   │   └── mappers/      # Mapper classes/extensions (Dto <-> Entity).
        │   │
        │   └── presentation/     # LAYER 3: UI & STATE
        │       ├── bloc/         # BLoC/Cubit. Manages UI State. Calls UseCases.
        │       ├── pages/        # Main screens (LoginPage). Wires BLoC.
        │       └── widgets/      # Small widgets extracted from Page.
        └── pubspec.yaml          # Feature dependency declarations.
```

## 2) Core Principles

The project strictly follows **Clean Architecture** combined with **Domain-Driven Design (DDD)**.
The goal is a **Rich Domain Model** where business logic is encapsulated in the Domain Layer and never leaks into UI or Data.

### Layer Boundaries (Dependency Rule)
1.  **Domain**: The center. Depends on nothing (No UI, No Data Source, No Frameworks).
2.  **Presentation**: Depends on **Domain**.
3.  **Data**: Depends on **Domain** (implements repository interfaces).

> **Strictly forbidden**: Presentation must never import directly from Data.

## 3) Domain Layer (The Heart)

Contains all critical business logic.

-   **Entities**:
    -   Objects with a unique **identity**.
    -   Can be mutable or immutable depending on business rules, but **must contain logic**.
    -   Avoid "Anemic Domain Model" (getters/setters only with no behavior).
    -   Example: `User` has `changePassword()`, `Order` has `addItem()`.

-   **Value Objects**:
    -   Objects defined by their **attributes** (equality by value), no identity.
    -   Must be **immutable**.
    -   Must **self-validate** on construction.
    -   Examples: `Address`, `Money`, `Email`, `PhoneNumber`.

-   **Use Cases (Interactors)**:
    -   Act as **Application Services**.
    -   Contain orchestration logic for Entities and Domain Services.
    -   Each UseCase does **one specific thing**.
    -   Naming: `<Verb><Subject>UseCase` (e.g. `LoginUserUseCase`, `CheckoutOrderUseCase`).

-   **Repository Interfaces**:
    -   Define data access actions **from the Domain's perspective** (collection-like).
    -   Must not expose technical details (HTTP, Cache, SQL).

## 4) Data Layer

Responsible for translating external data into Domain objects.

-   **DTOs (Data Transfer Objects)**:
    -   Pure data classes (`*Dto`, `*Model`) used to map JSON/DB responses.
    -   Must not contain business logic.
    -   Located in `data/models`.
    -   **Required**: Must be mapped to Entities at the Repository Implementation boundary.
    -   **Mappers**: Use Extension or dedicated Mapper classes for DTO <-> Entity conversion.

-   **Repository Implementations**:
    -   Implement the interface defined in Domain.
    -   Call Data Sources, map DTO -> Entity, and return to Domain.

## 5) Error Handling & Failures

Error handling uses a functional approach with `Either<Failure, T>` from `dartz`.

-   **`Failure` Class**: All errors are represented by `Failure` objects. Specific types (`ServerFailure`, `CacheFailure`, `ValidationFailure`, `AuthFailure`) extend `Failure`.
-   **`Either<Failure, T>`**: Functions that can fail must return `Either<Failure, T>`. `Left(Failure)` = error, `Right(T)` = success.
-   **Propagation**:
    -   **Data Layer**: Catches exceptions and converts to `Failure` types.
    -   **Domain Layer**: Receives `Either<Failure, T>` from repositories and propagates upwards.
    -   **Presentation Layer**: Maps `Failure` objects to user-friendly messages or UI states.

## 6) Configuration & Flavors

-   **`BaseConfig` / `AppFlavor`**: Holds environment-specific variables (API endpoints, analytics keys). Injected via `get_it`.
-   **Flavor Setup**: Flavors defined in `pubspec.yaml`. Build commands specify the target flavor (e.g., `flutter run --flavor dev`).

## 7) Dependency Injection

-   Use `get_it` + `injectable`.
-   Register interfaces via Module or use `@Injectable(as: IRepository)` annotation.
-   **Rule**: Presentation only requests UseCases or Repository Interfaces — never Repository Implementations directly.

## 8) Coding Conventions

-   **Return types**: Data layer and Domain layer use `Either<Failure, T>` for explicit, functional error handling.
-   **Immutability**: Prefer immutability for Value Objects, Events, and States.
-   **Validation**: Validate input data in Value Object or Entity constructors.
-   **Safety**: Never refactor/rename files widely without approval. Never run `build_runner` without asking first.
-   **FailureHandler**: All `Failure` instances are automatically logged by the global `FailureHandler`.
