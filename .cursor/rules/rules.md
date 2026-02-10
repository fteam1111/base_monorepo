# Quy tắc dự án Cursor — bike_tracker (Flutter Monorepo)

## Bối cảnh dự án

- Repository này là một **Flutter monorepo** (Dart/Flutter workspace + Melos).
- Ứng dụng chính:
  - `apps/customer_app`
- Các package dùng chung:
  - `packages/core`
  - `packages/network`
  - `packages/local_storage`
  - `packages/localization`
  - `packages/design_system`
  - `packages/share`
- Các package theo feature:
  - `packages/features/*` (ví dụ: `features_auth`, `features_dashboard`, `features_home`, `features_find_bike`, ...)
- Điều hướng (routing):
  - `go_router`
  - Tabs dùng `StatefulShellRoute.indexedStack`
- Quản lý state:
  - `flutter_bloc`
- DI:
  - `get_it` + `injectable`
  - Khai báo/đăng ký dependency được tập trung tại `apps/customer_app/lib/di/dependency_manager.dart`.

---

## 1) Kiến trúc & SOLID

- **Ranh giới tầng (Clean Architecture)**
  - `presentation` **không được** import trực tiếp `data`.
  - `domain` **không được** import Flutter/UI (`material.dart`, widgets, `flutter_bloc`, `go_router`).
  - `data` có thể phụ thuộc vào `domain` và các package dùng chung.

- **DIP (Dependency Inversion)**
  - `domain` phụ thuộc vào abstraction (các interface của repository).
  - `data` implement các interface đó.

- **Cô lập theo feature**
  - Các package feature **không được** import lẫn nhau.
  - Entity/value object dùng chung đưa vào `packages/core`.
  - Helper/constant/routes/extensions dùng chung đưa vào `packages/share`.

- **Tách biệt DTO và Entity**
  - DTO/model (`*Dto`, `*Model`) nằm trong `data/models`.
  - Entity nằm trong `domain/entities`.
  - Mapping giữa DTO ↔ Entity phải nằm trong `data/mappers`.

---

## 2) Quy ước vị trí file (theo repo này)

- **Presentation**
  - Pages: `packages/features/<feature>/lib/presentation/pages/`
  - Widgets: `packages/features/<feature>/lib/presentation/widgets/`
  - Bloc/Cubit: `packages/features/<feature>/lib/presentation/bloc/` hoặc `.../presentation/cubit/`

- **Domain**
  - Entities: `.../domain/entities/`
  - Repository interfaces: `.../domain/repositories/`
  - Use cases: `.../domain/usecases/`

- **Data**
  - Remote DS: `.../data/datasources/remote/`
  - Local DS: `.../data/datasources/local/`
  - DTO/Models: `.../data/models/`
  - Mappers: `.../data/mappers/`
  - Repository impl: `.../data/repositories/`

---

## 3) Quy tắc Routing (go_router)

- **Một nguồn sự thật duy nhất** cho route names/paths/params:
  - `packages/share/lib/routes/app_routes.dart`

- **Vị trí cấu hình router**:
  - `apps/customer_app/lib/routes/app_router.dart`

- **Tabs**:
  - Dùng `StatefulShellRoute.indexedStack`.
  - Widget “shell” nằm trong package feature, nhưng phần wiring route và guards giữ ở app router.

- **Không điều hướng trong Domain**:
  - Code trong domain tuyệt đối không được gọi `context.go`, `GoRouter`, hoặc `AppRoutes`.

---

## 4) Quy tắc DI (get_it + injectable)

- **Đăng ký dependency** thực hiện tại:
  - `apps/customer_app/lib/di/dependency_manager.dart`

- **Inject ở presentation**:
  - Bloc/Cubit nên được provide từ app layer (router/builders), không tạo tuỳ tiện bên trong pages (trừ các widget rất cục bộ).

- **Không dùng service locator trong Domain**:
  - Domain layer không được gọi `locator<T>()`.

---

## 4.1) Quy tắc Flutter BLoC (structure + DI + provider)

### 1) Tổ chức file/thư mục

- **Vị trí**
  - BLoC đặt trong:
    - `packages/features/<feature>/lib/presentation/bloc/`

- **Tách file theo chuẩn**
  - Một BLoC tách thành 3 file:
    - `<name>_bloc.dart`
    - `<name>_event.dart`
    - `<name>_state.dart`

- **Dùng `part`/`part of` (theo style hiện có như `AuthBloc`)**
  - Trong `<name>_bloc.dart`:
    - `part '<name>_event.dart';`
    - `part '<name>_state.dart';`
  - Trong `<name>_event.dart` và `<name>_state.dart`:
    - `part of '<name>_bloc.dart';`

### 2) Quy ước đặt tên

- **Tên file**: snake_case
  - Ví dụ: `auth_bloc.dart`, `auth_event.dart`, `auth_state.dart`
- **Tên class**: PascalCase
  - Ví dụ: `AuthBloc`, `AuthEvent`, `AuthState`

### 3) Quy tắc Event/State

- **Event**
  - Đặt tên theo hành vi người dùng / yêu cầu hệ thống, thường dạng `*Requested` hoặc `*Changed`.
  - Event nên là immutable và ưu tiên `const` constructor.

- **State**
  - Phải có `Initial` state.
  - Các state đại diện rõ UI status (ví dụ: `Loading`, `Authenticated`, `Unauthenticated`, `Error`).
  - State nên immutable và ưu tiên `const` constructor.

### 4) Inject dependency cho BLoC

- **Không khởi tạo UseCase/Repository trong BLoC**.
- Nếu BLoC có dùng `UseCase` / `Repository` / `Service` (như `AuthBloc`) thì **tất cả phải được inject qua constructor**.

### 5) Rule đăng ký DI tại `DependencyManager`

- Dependencies đăng ký theo thứ tự:
  - **DataSource** -> **Repository** -> **UseCase** -> **Bloc/Cubit**

- Chọn scope đăng ký BLoC đúng mục đích:
  - **`registerLazySingleton<Bloc>`**
    - Khi cần giữ state xuyên suốt vòng đời app (ví dụ: `AuthBloc`, `LocalizationBloc`).
  - **`registerFactory<Bloc>`**
    - Khi muốn tạo mới mỗi lần dùng / mỗi lần vào màn hình (ví dụ: `SplashBloc`).

### 6) Rule cung cấp BlocProvider trong app

- **Global BLoC**
  - Provide ở cấp app (thường `CustomApp` / root widget) bằng `MultiBlocProvider`.
  - Lấy instance từ DI: `locator<YourBloc>()`.

- **Page/feature-scoped BLoC**
  - Provide tại page bằng `BlocProvider(create: (_) => locator<YourBloc>())`.

### 7) Handler pattern

- Đăng ký handler trong constructor:
  - `on<EventName>(_onEventName);`
- Logic phức tạp tách thành private method:
  - `_onEventName(EventName event, Emitter<State> emit)`

---

## 5) Codegen / File sinh tự động

- Không bao giờ sửa thủ công các file sinh tự động:
  - `*.g.dart`, `*.freezed.dart`, `injector.config.dart`
- Nếu output codegen sai, hãy cập nhật file nguồn rồi chạy lại build_runner (hỏi user trước khi chạy lệnh).

---

## 6) An toàn & phạm vi thay đổi

- Không refactor diện rộng (đổi tên/di chuyển nhiều file) trừ khi được yêu cầu rõ ràng.
- Không chạy các lệnh có thể phá huỷ hoặc làm thay đổi trạng thái (Melos bootstrap, build_runner, pod install, v.v.) khi chưa được user đồng ý.
- Giữ thay đổi tối thiểu và đúng phạm vi yêu cầu.

---

## 7) Quy ước coding

- **Đặt tên**
  - Entity: `*Entity`
  - DTO: `*Dto`
  - Repository: `*Repository` (domain) và `*RepositoryImpl` (data)
  - Mapper: `*Mapper` hoặc `extension ... { toEntity() }`

- **Xử lý lỗi**
  - Data layer trả về `Either<ApiFailure, T>` (đang dùng trong repo này).

- **Token**
  - Domain dùng `JWT` (ValueObject) sau khi parse/wrap.
  - Infrastructure/storage lưu `String` (`jwt.getValue()` khi lưu).

---

## 8) Quy ước UI / Presentation (Design System-first)

- **Ưu tiên Theme/Design System trong `packages/design_system`**
  - Button **tận dụng** `ElevatedButtonTheme` và `OutlinedButtonTheme` đã được thiết kế trong theme.
  - Input **tận dụng** `TextField` mặc định theo theme (không tự set `InputDecoration` rải rác nếu không thật sự cần).

- **Không hardcode style khi không cần**
  - Tránh hardcode màu (`Color(...)`), radius, elevation, padding, text style… nếu theme/token đã có.
  - Nếu cần thay đổi diện rộng (ví dụ radius/padding chuẩn cho button), ưu tiên chỉnh trong design system/theme thay vì sửa từng screen.

- **Tránh API deprecated (Flutter/Dart)**
  - Không dùng các API đã bị đánh dấu deprecated (IDE sẽ báo gạch vàng / warning).
  - Ví dụ phổ biến: **không dùng** `Color.withOpacity(...)`.
    - Ưu tiên thay bằng:
      - `color.withValues(alpha: <0..1>)` (nếu project Flutter version hỗ trợ)
      - hoặc `Color.fromARGB(a, r, g, b)` / `color.withAlpha(a)` (khi cần alpha theo 0..255)
  - Khi thấy warning deprecated:
    - Tìm API thay thế theo gợi ý của analyzer/IDE.
    - Không suppress warning bằng ignore trừ khi có lý do rõ ràng và được yêu cầu.

---

## 9) Button rules (theo repo hiện có)

- **Mặc định: dùng theme**
  - Dùng `ElevatedButton(...)` / `OutlinedButton(...)` với style từ theme là chính.

- **Khi cần style theo ngữ cảnh màn hình**
  - Có thể dùng extension có sẵn: `packages/share/lib/extensions/button_styles.dart`
    - `context.primaryButtonStyle`
    - `context.secondaryButtonStyle`
  - Không tạo các `styleFrom(...)` mới rải rác nếu style đó có thể đưa vào theme hoặc extension dùng chung.

- **Quy ước dùng extension**
  - Chỉ dùng `context.primaryButtonStyle` / `context.secondaryButtonStyle` khi thật sự cần override so với theme.
  - Nếu một style được dùng ở nhiều nơi → nâng cấp thành theme/design system (không để extension “phình to” không kiểm soát).

---

## 10) Input / Form rules

- **TextField / TextFormField**
  - Dùng `TextField`/`TextFormField` theo theme mặc định.
  - Tránh custom `decoration:` (labelStyle, border, fillColor, errorStyle…) ở từng màn hình nếu theme đã cover.

- **Validation & lỗi**
  - Hiển thị lỗi theo cơ chế chuẩn của Flutter form + theme.
  - Message dùng lại nhiều → đưa vào localization/constant (không hardcode trùng lặp).

---

## 11) Quy ước layout: chia section rõ ràng

- Trong `build()` của Page:
  - Bố cục phải chia thành các **section** rõ ràng (header/content/actions/state…).
  - Hạn chế nhồi quá nhiều widget lồng nhau trong 1 `build()`.

- **Tách section ra widget**
  - Mỗi section tương đối độc lập → tách thành widget trong:
    - `packages/features/<feature>/lib/presentation/widgets/`
  - Page chỉ nên làm nhiệm vụ:
    - wire state (Bloc/Cubit)
    - compose các section widgets
    - xử lý UI-level navigation (nếu có)

- **Đặt tên section theo vai trò UI**
  - Ví dụ: `LoginHeaderSection`, `LoginFormSection`, `LoginActionsSection`, ...

---

## 12) State-driven UI (Loading / Empty / Error)

- UI phải thể hiện rõ các trạng thái:
  - `loading`: hiển thị loading theo pattern chung
  - `empty`: có empty state rõ ràng
  - `error`: có error state + retry action (nếu hợp lý)
- Tránh trộn logic nghiệp vụ vào UI; UI chỉ phản ánh state từ Bloc/Cubit.

---

## 13) Những điều tránh (UI anti-patterns)

- Không hardcode style trái với theme (màu, radius, text style) nếu theme/design system đã có.
- Không copy-paste nguyên một cụm UI giữa nhiều feature:
  - Nếu dùng chung → đưa về `design_system` hoặc widget dùng chung phù hợp.
- Không tạo Bloc/Cubit tuỳ tiện sâu bên trong widget tree nếu không phải widget cực cục bộ (theo rule DI hiện có).

---

## Hành vi của Assistant (Quy trình làm việc)

Khi implement một màn hình/feature mới:

- Xác nhận nó thuộc **package feature** nào.
- Xác nhận **route name/path** cần thêm trong `AppRoutes`.
- Liệt kê các file sẽ sửa trước khi thực hiện thay đổi diện rộng.
- Ưu tiên sửa code hiện có thay vì tạo file mới.
- Không dán các khối code quá lớn trong chat trừ khi được yêu cầu rõ ràng.
