# Kiến trúc Mono Repo (Clean Architecture theo Feature)

Project này là một Flutter **monorepo** theo hướng **feature-based modular architecture**, áp dụng **Clean Architecture** cho từng feature/package và quản lý workspace bằng **Dart/Flutter workspace + Melos**.

## Tổng quan kiến trúc

Mục tiêu chính:

- Tách code theo **package** để dễ mở rộng, tái sử dụng và maintain
- Mỗi **feature** tự chứa đủ 3 lớp: `domain` / `data` / `presentation`
- Các package dùng chung (core, network, local_storage, localization, design_system, share, ...) được tách riêng
- App chính nằm trong `apps/customer_app` và chỉ làm nhiệm vụ **compose** các package + cấu hình DI/routing

## Cấu trúc repo (theo project hiện tại)

```
apps/
  customer_app/                 # Ứng dụng Flutter chính
    lib/
      main_dev.dart
      main_uat.dart
      main_prod.dart
      app.dart
      routes/
      di/

packages/
  core/                         # Các primitive/shared types, utils, base abstractions
  network/                      # Network layer (Dio client, interceptors, api clients)
  local_storage/                # Local storage (token, prefs, ...)
  localization/                 # i18n, localization
  design_system/                # UI components, theme, design tokens
  share/                        # Shared helpers (tuỳ project)

  features/
    features_auth/
      lib/
        domain/
        data/
        presentation/
    features_user/
      lib/
        domain/
        data/
        presentation/
    features_home/
      lib/
        domain/
        data/
        presentation/
    features_onboarding/
      lib/
        domain/
        data/
        presentation/
    features_splash/
      lib/
        domain/
        data/
        presentation/
```

## Nguyên tắc chính

### 1) Tách biệt theo feature

- Mỗi feature là một package riêng trong `packages/features/<feature_name>`
- Feature **không** phụ thuộc vào feature khác (trừ khi có lý do kiến trúc rõ ràng)
- Các phần dùng chung phải đưa vào packages shared (ví dụ `core`, `network`, `design_system`...)

### 2) Clean Architecture cho từng feature

**Tạo feature package:**

```bash
mkdir -p packages/features_<feature_name>/lib/{domain,data,presentation}
```

Mỗi feature package được tách 3 lớp:

- **Domain** (`domain/`)
  - Entities
  - Repository interfaces
  - Use cases
  - Không phụ thuộc Flutter UI

- **Data** (`data/`)
  - Models (DTO)
  - Data sources (remote/local)
  - Repository implementations

- **Presentation** (`presentation/`)
  - UI pages/widgets
  - State management (BLoC)

### 3) Quy tắc phụ thuộc (Dependency Rules)

Nguyên tắc chung:

```
Presentation → Domain ← Data

Shared packages (core/network/local_storage/...) được phép được sử dụng ở nhiều nơi.
```

- `domain` không nên phụ thuộc vào `presentation`
- `data` phụ thuộc vào `domain`
- `presentation` phụ thuộc vào `domain` (và có thể gọi usecase)

## Routing

Project sử dụng **go_router** ở app (`apps/customer_app`) để điều hướng.

- `AppRoutes` thường chứa `name` và `path` (ví dụ `home` và `homePath`)
- `GoRouter` config thường nằm trong `apps/customer_app/lib/routes/`

## Dependency Injection

Project đang dùng:

- `get_it`
- `injectable`

DI entrypoints thường nằm ở:

- `apps/customer_app/lib/di/`

## Workspace / Melos

Repo sử dụng Dart/Flutter workspace (SDK hỗ trợ) và Melos để chạy lệnh trên toàn monorepo.

- Workspace được khai báo trong `pubspec.yaml` ở root (mục `workspace:`)
- Các package có `resolution: workspace`

Các ví dụ:

```bash
# Analyze toàn bộ packages/apps
make run_analyze

# pub get all packages
melos bootstrap

# Codegen build_runner cho tất cả package có depends-on build_runner
melos gen
```

## CI hooks / Git flow

- `lefthook.yml` gọi `scripts/branch_name_validate.sh` ở pre-push
- `Makefile` có targets tạo tag UAT/PROD và build theo environment

Tài liệu liên quan:

- `GIT_FLOW.md`

## Quy ước đặt tên

Tuỳ feature, nhưng khuyến nghị:

- **Entities**: `<Name>Entity`
- **Models**: `<Name>Model`
- **Repositories**: `<Name>Repository` (interface), `<Name>RepositoryImpl` (implementation)
- **Use Cases**: `<Action><Entity>UseCase`
- **Data Sources**: `<Name>RemoteDataSource`, `<Name>LocalDataSource`
- **BLoC**: `<Feature>Bloc`, `<Feature>Event`, `<Feature>State`

## Lợi ích

- Dễ mở rộng: thêm feature mới không ảnh hưởng nhiều feature khác
- Dễ test: test theo package/layer
- Dễ maintain: boundary rõ ràng, tránh “spaghetti code”
- Tái sử dụng: shared packages dùng lại cho nhiều app/feature

## Các quyết định kiến trúc quan trọng

### Vì sao dùng Clean Architecture?

- **Dễ test**: tầng domain độc lập framework/UI
- **Linh hoạt**: dễ thay data source (mock vs API thật)
- **Dễ bảo trì**: phân tách rõ trách nhiệm giữa các lớp
- **Dễ mở rộng**: thêm feature mới ít ảnh hưởng phần còn lại

### Vì sao dùng BLoC?

- **Dễ dự đoán**: unidirectional data flow
- **Dễ test**: business logic tách khỏi UI
- **Phản ứng theo state**: UI tự cập nhật theo state
- **Dễ debug**: mô hình event/state rõ ràng

### Vì sao dùng Monorepo + Melos/Workspace?

- **Chia sẻ code**: các package shared dùng lại cho nhiều feature/app
- **Đồng bộ dependency**: dùng chung SDK/workspace resolution
- **Hiệu quả**: chạy lệnh cho toàn repo (bootstrap/analyze/codegen)
- **Module hoá**: feature có thể test/maintain độc lập

### Vì sao dùng GetIt + Injectable?

- **Đơn giản**: service locator dễ hiểu
- **Hiệu năng**: lookup nhanh
- **Linh hoạt**: hỗ trợ singleton/factory
- **Tường minh**: đăng ký dependency rõ ràng (Injectable hỗ trợ generate code)

---

## Bảo mật (theo project hiện tại)

Hiện tại repo của bạn **chưa thấy** dependency `flutter_secure_storage` hoặc các cơ chế như certificate pinning / request signing trong codebase.

Khuyến nghị (khi cần):

- **HTTPS**: luôn dùng HTTPS cho các request
- **Token storage**: nếu có token nhạy cảm, cân nhắc dùng secure storage (ví dụ `flutter_secure_storage`) thay vì lưu plain text
- **Token refresh**: nếu backend dùng access/refresh token, có thể bổ sung cơ chế refresh trong tầng `network` (interceptor)
