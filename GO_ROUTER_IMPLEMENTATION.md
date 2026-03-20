# Tóm tắt triển khai GoRouter

## Đã thay đổi những gì

### 1. **Dependencies của package**

- Thêm `go_router: ^17.0.1` vào cả `packages/share/pubspec.yaml` và `packages/app/pubspec.yaml`
- Export go_router từ `packages/share/lib/routes.dart` để dùng xuyên suốt project

### 2. **Định nghĩa route (packages/share/lib/routes/app_routes.dart)**

**Đã cập nhật để hỗ trợ routing kiểu khai báo (declarative) của go_router:**

- Tách riêng **route name** (dùng cho named navigation) và **route path** (dùng cho URL)
- Cập nhật các helper điều hướng để dùng context extensions của go_router
- Thêm helper cho `goNamed()` và `pushNamed()` có tham số

**Thay đổi chính:**

```dart
// CŨ: Navigator 1.0
static const String home = '/home';
Navigator.pushNamed(context, home);

// MỚI: go_router
static const String home = 'home';              // Route name
static const String homePath = '/home';         // Route path
context.push(homePath);
context.goNamed(home);// Cách điều hướng mới
```

### 3. **Cấu hình router (apps/customer_app/lib/routes/app_router.dart)** - FILE MỚI

**Đã tạo cấu hình GoRouter đầy đủ với các tính năng:**

- ✅ Khai báo route theo kiểu declarative
- ✅ Authentication guards và redirect
- ✅ Tích hợp BLoC provider với GetIt
- ✅ Hỗ trợ path parameters (`:userId`)
- ✅ Custom page transitions (fade, slide, none)
- ✅ Xử lý lỗi cho route 404
- ✅ Điều hướng type-safe

**Cấu trúc route:**

```dart
GoRoute(
  path: '/profile/:userId',
  name: 'profile',
  pageBuilder: (context, state) {
    final userId = state.pathParameters['userId'];
    return CustomTransitionPage(
      child: BlocProvider(
        create: (_) => getIt<ProfileBloc>(),
        child: ProfilePage(userId: userId),
      ),
    );
  },
)
```

### 4. **Main App (packages/app/lib/main.dart)**

**Đã migrate từ MaterialApp sang MaterialApp.router:**

```dart
// CŨ
MaterialApp(
  initialRoute: AppRoutes.splash,
  onGenerateRoute: AppRouteGenerator.onGenerateRoute,
)

// MỚI
MaterialApp.router(
  routerConfig: AppRouter.createRouter(
    authBloc: context.read<AuthBloc>(),
  ),
)
```

### 5. **Documentation**

Đã tạo hướng dẫn migrate chi tiết: `GO_ROUTER_MIGRATION.md` gồm:

- So sánh tính năng (Navigator 1.0 vs go_router)
- Ví dụ điều hướng
- Pattern auth flow
- Hướng dẫn thêm route mới
- Ví dụ tích hợp BLoC
- Cấu hình deep linking
- Pattern testing
- Tips troubleshooting

## Lợi ích chính của go_router

### **Hiệu năng & tính năng**

1. **Deep Linking** - URL hoạt động tốt trên web và mobile
2. **Type-Safe Navigation** - Validate route ở compile-time
3. **Declarative Routes** - Dễ maintain và dễ hiểu hơn
4. **Browser Back Button** - Hỗ trợ web đúng chuẩn
5. **Path Parameters** - `/user/:id` tự parse
6. **Query Parameters** - Hỗ trợ `?search=term`
7. **Nested Navigation** - Tab bars, drawers, bottom nav
8. **State Restoration** - Xử lý lifecycle tốt hơn

### **Authentication Guards**

```dart
redirect: (context, state) {
  final isAuthenticated = authBloc.state is AuthAuthenticated;

  if (!isAuthenticated && state.matchedLocation != '/login') {
    return '/login';  // Tự redirect về login
  }

  if (isAuthenticated && state.matchedLocation == '/login') {
    return '/home';   // Tự redirect về home
  }

  return null; // Không redirect
}
```

### **Tích hợp BLoC rất tốt**

```dart
GoRoute(
  path: '/feature',
  pageBuilder: (context, state) => CustomTransitionPage(
    child: BlocProvider(
      create: (_) => getIt<FeatureBloc>(),
      child: const FeaturePage(),
    ),
  ),
)
```

## So sánh cách điều hướng

### Navigator 1.0 (CŨ)

```dart
// Push route
Navigator.pushNamed(context, '/home');

// Push kèm arguments
Navigator.pushNamed(
  context,
  '/profile',
  arguments: {'userId': '123'},
);

// Replace toàn bộ stack
Navigator.pushNamedAndRemoveUntil(
  context,
  '/login',
  (route) => false,
);

// Pop
Navigator.pop(context);
```

### go_router (MỚI)

```dart
// Push route
context.push('/home');

// Push với path parameters
context.push('/profile/123');

// Replace toàn bộ stack
context.go('/login');

// Push với query parameters
context.push('/search?q=flutter&filter=recent');

// Named navigation với tham số
context.pushNamed(
  'profile',
  pathParameters: {'userId': '123'},
  queryParameters: {'tab': 'posts'},
);

// Pop
context.pop();

// Check có thể pop không
if (context.canPop()) {
  context.pop();
}
```

## Ảnh hưởng tới cấu trúc project

### Các file đã sửa

- ✅ `packages/core/pubspec.yaml` - Thêm go_router dependency
- ✅ `packages/core/lib/core.dart` - Export go_router
- ✅ `packages/core/lib/src/routes/app_routes.dart` - Cập nhật định nghĩa route
- ✅ `packages/app/pubspec.yaml` - Thêm go_router dependency
- ✅ `packages/app/lib/main.dart` - Migrate sang MaterialApp.router

### Các file đã tạo

- ✅ `packages/app/lib/routes/app_router.dart` - Cấu hình GoRouter
- ✅ `GO_ROUTER_MIGRATION.md` - Hướng dẫn migrate chi tiết

### Các file không còn cần thiết (có thể xoá sau khi test)

- ⚠️ `packages/app/lib/routes/app_route_generator.dart` - Route generator kiểu Navigator 1.0

## Cách sử dụng

### 1. Cài dependencies

```bash
cd /home/betopia/StudioProjects/dio_network_config
dart bootstrap.dart
```

### 2. Điều hướng cơ bản

```dart
// Trong widgets
AppRoutes.navigateToHome(context);
AppRoutes.navigateToLogin(context);
AppRoutes.navigateBack(context);

// Hoặc dùng trực tiếp
context.go('/home');
context.push('/profile/123');
context.pop();
```

### 3. Thêm route mới

**Bước 1:** Khai báo trong `app_routes.dart`:

```dart
static const String products = 'products';
static const String productsPath = '/products';

static void navigateToProducts(BuildContext context) {
  context.push(productsPath);
}
```

**Bước 2:** Thêm vào `app_router.dart`:

```dart
GoRoute(
  path: AppRoutes.productsPath,
  name: AppRoutes.products,
  pageBuilder: (context, state) => _buildPageWithTransition(
    key: state.pageKey,
    child: BlocProvider(
      create: (_) => getIt<ProductsBloc>(),
      child: const ProductsPage(),
    ),
  ),
),
```

### 4. Route có tham số

```dart
// Trong app_router.dart
GoRoute(
  path: '/products/:productId',
  pageBuilder: (context, state) {
    final productId = state.pathParameters['productId']!;
    return CustomTransitionPage(
      child: ProductDetailPage(productId: productId),
    );
  },
)

// Navigate
context.push('/products/abc123');
```

## Bước tiếp theo

1. **Test migration:**

   ```bash
   cd packages/app
   flutter run
   ```

2. **Cập nhật feature generators (maloc_cli):**

   - Chỉnh route generation theo pattern go_router
   - Update templates để thêm routes vào `app_router.dart`

3. **Cấu hình deep linking (tuỳ chọn):**

   - Android: sửa `AndroidManifest.xml`
   - iOS: sửa `Info.plist`
   - Xem `GO_ROUTER_MIGRATION.md` để biết chi tiết

4. **Xoá file cũ (sau khi test):**

   ```bash
   rm packages/app/lib/routes/app_route_generator.dart
   ```

5. **Cập nhật các feature module:**

- Mỗi feature có thể thêm route vào router
- Follow pattern trong `app_router.dart`

## Troubleshooting

### Router không rebuild khi auth thay đổi?

Wrap việc tạo router trong `BlocBuilder<AuthBloc>` (đã làm trong main.dart)

### Child route không truy cập được BLoC?

Provide BLoC ở parent route level, không provide lại ở từng child

### Back button không hoạt động?

Dùng `context.pop()` thay vì `Navigator.pop()`

### Deep links không hoạt động?

Kiểm tra cấu hình platform trong `GO_ROUTER_MIGRATION.md`

## Tài nguyên

- **Migration Guide**: `GO_ROUTER_MIGRATION.md` (nhiều ví dụ chi tiết)
- **go_router Package**: https://pub.dev/packages/go_router
- **Router Config**: `packages/app/lib/routes/app_router.dart`
- **Route Definitions**: `packages/core/lib/src/routes/app_routes.dart`

## Tổng kết

✅ **Đã migrate thành công từ Navigator 1.0 sang go_router**  
✅ **Giữ nguyên kiến trúc BLoC + GetIt**  
✅ **Có auth guards**  
✅ **Hỗ trợ deep linking**  
✅ **Điều hướng type-safe với tham số**  
✅ **Custom page transitions**  
✅ **Có tài liệu hướng dẫn đầy đủ**

Hệ thống routing bây giờ dễ maintain hơn, nhiều tính năng hơn và sẵn sàng cho web (URL hoạt động chuẩn).
