# Hướng dẫn migrate sang GoRouter

## Tổng quan

Project này đã được migrate từ **Navigator 1.0** (tự generate route thủ công) sang **go_router** để hỗ trợ tốt hơn cho deep link, URL (đặc biệt trên web), điều hướng type-safe và routing theo hướng khai báo (declarative).

## Những thay đổi chính

### 1. Thêm dependencies

**packages/core/pubspec.yaml** và **packages/app/pubspec.yaml**:

```yaml
dependencies:
  go_router: ^17.0.1
```

### 2. Thay đổi cách định nghĩa route

#### Trước đây (Navigator 1.0):

```dart
// Tên route dạng string
static const String home = '/home';

// Điều hướng thủ công bằng Navigator
Navigator.pushNamed(context, AppRoutes.home);
Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
```

#### Sau khi migrate (go_router):

```dart
// Route name (dùng cho named navigation)
static const String home = 'home';

// Route path (đường dẫn URL thực tế)
static const String homePath = '/home';

// Điều hướng khai báo bằng extension trên context
context.go(AppRoutes.homePath);      // Thay thế toàn bộ stack
context.push(AppRoutes.homePath);    // Push thêm vào stack
context.pop();                       // Quay lại
```

### 3. Các thành phần kiến trúc

#### File mới được tạo:

- **`apps/customer_app/lib/routes/app_router.dart`** - Cấu hình GoRouter
- **`packages/share/lib/routes/app_routes.dart`** - Cập nhật để dùng path/name theo go_router

#### File không còn cần thiết:

- **`packages/app/lib/routes/app_route_generator.dart`** - Có thể xoá (đang giữ lại để tham khảo)

### 4. Cấu hình route

`AppRouter.createRouter()` cung cấp:

✅ **Deep Linking** - URL hoạt động trên web và mobile  
✅ **Authentication Guards** - Tự redirect theo trạng thái đăng nhập  
✅ **Type-Safe Parameters** - Hỗ trợ path parameter như `/profile/:userId`  
✅ **Query Parameters** - Hỗ trợ `?search=term`  
✅ **Custom Transitions** - Fade, slide hoặc không transition  
✅ **Error Handling** - Trang 404 thân thiện  
✅ **BLoC Integration** - Kết hợp mượt với GetIt + BLoC

## Ví dụ điều hướng (Navigation)

### Điều hướng cơ bản

```dart
// Go (replace stack)
AppRoutes.navigateToHome(context);
// hoặc
context.go(AppRoutes.homePath);

// Push (add to stack)
AppRoutes.navigateToNetworkTest(context);
// hoặc
context.push(AppRoutes.networkTestPath);

// Pop (quay lại)
AppRoutes.navigateBack(context);
// hoặc
context.pop();
```

### Điều hướng có tham số

```dart
// Path parameters
context.push('/profile/user123');

// hoặc dùng helper
AppRoutes.navigateToProfile(context, userId: 'user123');

// Query parameters
context.push('/search?q=flutter&filter=recent');

// Named route có tham số
context.pushNamed(
  AppRoutes.profile,
  pathParameters: {'userId': 'user123'},
  queryParameters: {'tab': 'posts'},
);
```

### Điều hướng kèm dữ liệu extra

```dart
// Truyền object phức tạp
context.push(
  AppRoutes.profilePath,
  extra: UserModel(id: '123', name: 'John'),
);

// Lấy ra trong route builder
pageBuilder: (context, state) {
  final user = state.extra as UserModel?;
  return ProfilePage(user: user);
}
```

### Điều hướng nâng cao

```dart
// Replace bằng named route
context.goNamed(AppRoutes.home);

// Push replacement
context.pushReplacement(AppRoutes.loginPath);

// Check có thể pop không
if (context.canPop()) {
  context.pop();
} else {
  context.go(AppRoutes.homePath);
}

// Pop kèm result
context.pop('result_data');

// Pop until (clear stack)
context.go(AppRoutes.homePath);
```

## Luồng xác thực (Authentication)

Router tự xử lý xác thực như sau:

```dart
redirect: (context, state) {
  final authState = authBloc.state;
  final isAuthenticated = authState is AuthAuthenticated;

  // Nếu chưa đăng nhập và không ở trang login -> redirect về login
  if (!isAuthenticated && state.matchedLocation != AppRoutes.loginPath) {
    return AppRoutes.loginPath;
  }

  // Nếu đã đăng nhập mà vẫn ở login -> redirect về home
  if (isAuthenticated && state.matchedLocation == AppRoutes.loginPath) {
    return AppRoutes.homePath;
  }

  return null; // Không redirect
}
```

## Thêm route mới

### Bước 1: Khai báo route trong `app_routes.dart`

```dart
class AppRoutes {
  // Route name
  static const String products = 'products';

  // Route path
  static const String productsPath = '/products';
  static const String productDetailPath = '/products/:productId';

  // Helper điều hướng
  static void navigateToProducts(BuildContext context) {
    context.push(productsPath);
  }

  static void navigateToProductDetail(BuildContext context, String productId) {
    context.push('/products/$productId');
  }
}
```

### Bước 2: Thêm route vào `app_router.dart`

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
  // Nested routes (child routes)
  routes: [
    GoRoute(
      path: ':productId', // Relative path
      name: 'product-detail',
      pageBuilder: (context, state) {
        final productId = state.pathParameters['productId']!;
        return _buildPageWithTransition(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<ProductDetailBloc>()
              ..add(LoadProductEvent(productId)),
            child: ProductDetailPage(productId: productId),
          ),
        );
      },
    ),
  ],
),
```

## Tích hợp BLoC

go_router hoạt động rất tốt với BLoC và GetIt:

```dart
GoRoute(
  path: '/feature',
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: BlocProvider(
      create: (_) => getIt<FeatureBloc>(),
      child: const FeaturePage(),
    ),
  ),
),
```

### Chia sẻ BLoC giữa các route

```dart
// Trong parent route
GoRoute(
  path: '/parent',
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: BlocProvider(
      create: (_) => getIt<SharedBloc>(),
      child: const ParentPage(),
    ),
  ),
  routes: [
    // Child route dùng lại BLoC của parent
    GoRoute(
      path: 'child',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        // Không cần BlocProvider - dùng của parent
        child: const ChildPage(),
      ),
    ),
  ],
),
```

## Custom transitions

Có 3 kiểu transition:

### 1. Fade Transition (mặc định)

```dart
_buildPageWithTransition(
  key: state.pageKey,
  child: const MyPage(),
)
```

### 2. Slide Transition

```dart
_buildPageWithSlideTransition(
  key: state.pageKey,
  child: const MyPage(),
  fromRight: true, // hoặc false nếu slide từ trái
)
```

### 3. Không transition

```dart
_buildPageWithNoTransition(
  key: state.pageKey,
  child: const MyPage(),
)
```

## Nested navigation

Dùng cho tab-based hoặc shell routes:

```dart
GoRoute(
  path: '/dashboard',
  pageBuilder: (context, state) => NoTransitionPage(
    child: DashboardShell(),
  ),
  routes: [
    GoRoute(
      path: 'home',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const HomeTab(),
      ),
    ),
    GoRoute(
      path: 'profile',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const ProfileTab(),
      ),
    ),
  ],
),
```

## Deep linking

### Mobile (Android)

**android/app/src/main/AndroidManifest.xml**:

```xml
<intent-filter android:autoVerify="true">
  <action android:name="android.intent.action.VIEW" />
  <category android:name="android.intent.category.DEFAULT" />
  <category android:name="android.intent.category.BROWSABLE" />
  <data android:scheme="https" android:host="yourdomain.com" />
  <data android:scheme="myapp" />
</intent-filter>
```

### Mobile (iOS)

**ios/Runner/Info.plist**:

```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>myapp</string>
    </array>
  </dict>
</array>
```

### Web

URL tự động hoạt động. Ví dụ:

- `https://myapp.com/products/123` → Mở trang product detail
- `https://myapp.com/login` → Mở trang login

## Testing

```dart
testWidgets('Navigation test', (tester) async {
  final router = AppRouter.createRouter(
    authBloc: MockAuthBloc(),
    initialLocation: '/login',
  );

  await tester.pumpWidget(
    MaterialApp.router(
      routerConfig: router,
    ),
  );

  // Navigate
  router.go('/home');
  await tester.pumpAndSettle();

  // Assert
  expect(find.text('Home'), findsOneWidget);
});
```

## Checklist migrate

- [x] Thêm go_router dependencies
- [x] Cập nhật AppRoutes với paths
- [x] Tạo AppRouter configuration
- [x] Cập nhật main.dart sang MaterialApp.router
- [x] Export go_router từ core package
- [ ] Cập nhật CLI generators để theo pattern go_router
- [ ] Xoá app_route_generator.dart cũ (sau khi verify)
- [ ] Test tất cả luồng điều hướng
- [ ] Cấu hình deep linking (Android/iOS)
- [ ] Cập nhật tài liệu

## Pattern thường dùng

### Modal Bottom Sheet + Navigation

```dart
showModalBottomSheet(
  context: context,
  builder: (context) => Column(
    children: [
      ListTile(
        title: const Text('Go to Settings'),
        onTap: () {
          context.pop(); // Đóng sheet
          context.push(AppRoutes.settingsPath);
        },
      ),
    ],
  ),
);
```

### Confirm trước khi thoát trang

```dart
Future<bool> _onWillPop() async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Discard changes?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Discard'),
        ),
      ],
    ),
  );
  return result ?? false;
}
```

## Troubleshooting

### Vấn đề: Router không rebuild khi auth thay đổi

**Cách xử lý**: Wrap việc tạo router trong `BlocBuilder<AuthBloc>`

### Vấn đề: Child route không truy cập được BLoC

**Cách xử lý**: Provide BLoC ở parent route level

### Vấn đề: Back button không hoạt động

**Cách xử lý**: Dùng `context.pop()` thay vì `Navigator.pop()`

### Vấn đề: Deep link không hoạt động

**Cách xử lý**: Kiểm tra cấu hình Android/iOS và scheme

## Tài nguyên

- [go_router Documentation](https://pub.dev/packages/go_router)
- [go_router GitHub](https://github.com/flutter/packages/tree/main/packages/go_router)
- [Flutter Navigation 2.0](https://docs.flutter.dev/ui/navigation)

## Hỗ trợ

Nếu có vấn đề/câu hỏi liên quan tới routing, hãy xem:

1. File hướng dẫn migrate này
2. go_router documentation
3. Các ví dụ route trong `app_router.dart`
