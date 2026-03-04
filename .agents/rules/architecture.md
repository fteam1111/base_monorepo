---
trigger: always_on
glob: "lib/**/*,packages/**/*"
description: Core rules for Clean Architecture, Domain-Driven Design (DDD), and coding standards.
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

Error handling is central to robust applications. We use a functional approach with `Either<Failure, T>` from `dartz` to explicitly handle potential errors.

-   **`Failure` Class**:
    -   All errors are represented by a `Failure` object, which is a base abstract class.
    -   Specific failure types (e.g., `ServerFailure`, `CacheFailure`, `ValidationFailure`, `AuthFailure`) extend `Failure`.
    -   Each `Failure` should contain relevant information (e.g., `message`, `statusCode`, `errorCode`) to aid debugging and user feedback.

-   **`Either<Failure, T>`**:
    -   Functions that can fail must return `Either<Failure, T>`.
    -   `Left(Failure)` indicates an error.
    -   `Right(T)` indicates success with a value `T`.
    -   This forces callers to explicitly handle both success and failure paths.

-   **Propagation**:
    -   **Data Layer**: Catches exceptions from data sources (e.g., `DioError`, `HiveError`) and converts them into appropriate `Failure` types (e.g., `ServerFailure`, `CacheFailure`).
    -   **Domain Layer (Use Cases)**: Receives `Either<Failure, T>` from repositories and propagates them upwards. It may also generate `ValidationFailure` or `BusinessLogicFailure` if domain rules are violated.
    -   **Presentation Layer**: Receives `Either<Failure, T>` from use cases. It then maps `Failure` objects to user-friendly messages or UI states.

## 6) Configuration & Flavors

The application supports different environments (e.g., development, staging, production) using flavors. This allows for environment-specific configurations without code changes.

-   **`BaseConfig` / `AppFlavor`**:
    -   A dedicated class (e.g., `BaseConfig` or `AppFlavor`) holds environment-specific variables like API endpoints, analytics keys, etc.
    -   This class is typically injected via `get_it` and initialized at app startup based on the active flavor.
    -   Example: `AppFlavor.current.apiBaseUrl`, `AppFlavor.current.enableAnalytics`.

-   **Flavor Setup**:
    -   Flavors are defined in `pubspec.yaml` (using `flutter_flavorizr` or manually).
    -   Build commands specify the target flavor (e.g., `flutter run --flavor dev`).
    -   The `main.dart` or an initialization file determines which `BaseConfig` implementation to load based on the flavor.

## 7) Dependency Injection

-   Use `get_it` + `injectable`.
-   Register interfaces via Module (if needed) or use `@Injectable(as: IRepository)` annotation.
-   **Rule**: Presentation only requests UseCases or Repository Interfaces — never Repository Implementations directly.

## 8) Coding Conventions

-   **Return types**: Data layer and Domain layer use `Either<Failure, T>` for explicit, functional error handling.
-   **Immutability**: Prefer immutability for Value Objects, Events, and States.
-   **Validation**: Validate input data in Value Object or Entity constructors.
-   **Safety**: Never refactor/rename files widely without approval. Never run `build_runner` without asking first.
-   **FailureHandler**: All `Failure` instances are automatically logged by the global `FailureHandler` when they are returned from a UseCase or Repository. This ensures consistent error reporting without manual `log.e()` calls for every error path.
