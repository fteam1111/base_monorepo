# Hướng dẫn cấu hình Firebase (Monorepo Flutter)

Tài liệu này hướng dẫn cấu hình Firebase cho dự án monorepo hiện tại.

- Link tài liệu: https://firebase.google.com/docs/run?hl=vi

Phạm vi chính:

- Flutter app: `apps/customer_app`
- Hỗ trợ nhiều môi trường (ví dụ: `dev`, `uat`, `prod`) thông qua **FlutterFire CLI** và cấu hình theo build configuration.

---

## 1) Yêu cầu

- Flutter SDK cài sẵn
- Firebase project đã tạo trên Firebase Console
- Đã cài FlutterFire CLI

Cài FlutterFire CLI:

```bash
dart pub global activate flutterfire_cli
```

Kiểm tra:

```bash
flutterfire --version
```

---

## 2) File/Folders quan trọng trong repo

- `apps/customer_app/firebase.json`
  - File do FlutterFire CLI tạo, map cấu hình theo môi trường/platform.
- `apps/customer_app/android/app/src/<flavor>/google-services.json`
  - Android config theo flavor (ví dụ: `src/dev/google-services.json`).
- `apps/customer_app/ios/Runner/<flavor>/GoogleService-Info.plist`
  - iOS config theo môi trường (ví dụ: `ios/Runner/Dev/GoogleService-Info.plist`).
- `apps/customer_app/lib/config/firebase_options_*.dart`
  - Các file Dart options do FlutterFire CLI generate.

---

## 3) Cấu hình Firebase bằng FlutterFire CLI (khuyến nghị)

Mục tiêu của bước này là **generate/cập nhật** toàn bộ cấu hình Firebase cho app, bao gồm:

- File `firebase.json` (mapping theo platform + môi trường)
- File Dart options: `lib/config/firebase_options_*.dart`
- File native config:
  - Android: `android/app/src/<flavor>/google-services.json`
  - iOS: `ios/Runner/<Env>/GoogleService-Info.plist`

### 3.1 Chạy lệnh generate (ví dụ cho môi trường Development)

Trong thư mục app `apps/customer_app`, chạy lệnh dạng sau (ví dụ):

```bash
flutterfire configure \
  --platforms="android,ios" \
  --out="lib/config/firebase_options_development.dart" \
  --android-out="android/app/src/development" \
  --android-package-name="com.example.com" \
  --ios-bundle-id="com.example.com" \
  --ios-out="ios/Runner/Development"
```

#### Ý nghĩa từng tham số

- `--platforms="android,ios"`
  - Chỉ cấu hình cho Android và iOS.
- `--out="lib/config/firebase_options_development.dart"`
  - Nơi xuất file options Dart (để truyền vào `Firebase.initializeApp(options: ...)`).
- `--android-out="android/app/src/development"`
  - Nơi đặt `google-services.json` cho flavor `development`.
- `--android-package-name="com.example.plx.development"`
  - Android applicationId/package name dùng để map đúng app đã đăng ký trên Firebase.
- `--ios-bundle-id="com.plx.superapp.dev"`
  - iOS bundle id dùng để map đúng app đã đăng ký trên Firebase.
- `--ios-out="ios/Runner/Development"`
  - Nơi đặt `GoogleService-Info.plist` cho môi trường/scheme `Development`.

#### Trong thư mục app `apps/customer_app`, chạy:

```bash
flutterfire configure
```

Sau khi xong, FlutterFire CLI sẽ:

- Generate/cập nhật `firebase.json`
- Sinh `firebase_options_*.dart`
- Copy các file config vào đúng vị trí (nếu bạn chọn output paths)

### 3.2 `flutterfire configure` dùng để add/cập nhật cái gì?

Khi bạn chạy `flutterfire configure`, công cụ sẽ giúp bạn:

- **Add platform**: thêm cấu hình cho platform mới (ví dụ trước đó chỉ Android, giờ thêm iOS).
- **Add environment/flavor**: thêm cấu hình cho môi trường mới (dev/uat/prod hoặc development/staging/production) bằng cách output file vào đúng thư mục.
- **Update cấu hình** khi bạn đổi:
  - Firebase project
  - `applicationId` (Android) / `bundleId` (iOS)
  - đường dẫn output của `google-services.json`/`GoogleService-Info.plist`
  - file options Dart (`firebase_options_*.dart`)

Sau khi chạy xong, FlutterFire CLI sẽ:

- Generate/cập nhật `firebase.json`
- Sinh/cập nhật file Dart options (`firebase_options_*.dart`)
- Copy/ghi đè file native config vào đúng output path bạn chỉ định

### 3.3 Kiểm tra `firebase.json`

Trong repo hiện tại, `apps/customer_app/firebase.json` đang chứa mapping theo cấu hình build.
Ví dụ (minh hoạ):

- Android: `android/app/src/dev/google-services.json`
- iOS: `ios/Runner/Dev/GoogleService-Info.plist`
- Dart options: `lib/config/firebase_options_development.dart`

Nếu bạn thêm môi trường mới (ví dụ `uat`/`prod`), bạn nên chạy lại `flutterfire configure` và đảm bảo các output paths đúng.

---

## 4) Android (customer_app)

### 4.1 Đặt file `google-services.json`

Với cấu trúc flavor, đặt file theo đúng flavor:

- `apps/customer_app/android/app/src/dev/google-services.json`
- `apps/customer_app/android/app/src/uat/google-services.json`
- `apps/customer_app/android/app/src/prod/google-services.json`

**Lưu ý:** package name / applicationId của từng flavor phải khớp với app đã đăng ký trên Firebase Console.

### 4.2 Bật Google Services plugin + (tuỳ chọn) Crashlytics plugin

Vì dự án của bạn đang dùng **Kotlin DSL** (`build.gradle.kts`), cấu hình sẽ nằm ở:

- `apps/customer_app/android/build.gradle.kts`
- `apps/customer_app/android/app/build.gradle.kts`

Checklist:

- Có plugin `com.google.gms.google-services`
- Nếu dùng Crashlytics: có `com.google.firebase.crashlytics`

Sau khi cấu hình xong, build lại dự án.

---

## 5) iOS (customer_app)

### 5.1 Đặt file `GoogleService-Info.plist`

Nếu bạn chia theo môi trường như hiện tại:

- `apps/customer_app/ios/Runner/Dev/GoogleService-Info.plist`

Tuỳ vào scheme/config của Xcode, hãy đảm bảo plist đúng môi trường được include vào target khi build.

### 5.2 Cài pods

Chạy (từ root repo hoặc trong `apps/customer_app` đều được, miễn là đúng iOS folder):

```bash
cd apps/customer_app/ios
pod install
```

Nếu có lỗi pods, thử:

- `flutter clean`
- xoá `Pods/` và `Podfile.lock` (cẩn thận, sẽ regenerate)

---

## 6) Cấu hình trong Flutter code

### 6.1 Initialize Firebase

Trong app này, Firebase được init trong `apps/customer_app/lib/app.dart` qua hàm `initialSetup(...)`.

Mẫu chuẩn:

```dart
await Firebase.initializeApp(options: firebaseOptions);
```

Với nhiều môi trường, thường `firebaseOptions` sẽ được lấy từ file dạng:

- `lib/config/firebase_options_development.dart`
- `lib/config/firebase_options_uat.dart`
- `lib/config/firebase_options_production.dart`

và truyền vào `initialSetup` từ `main_dev.dart`, `main_uat.dart`, `main_prod.dart`.

### 6.2 Kiểm tra nhanh Firebase đã lên

Thêm log ngay sau `Firebase.initializeApp`:

```dart
debugPrint('Firebase app: ${Firebase.app().name}');
```

---

## 7) Thêm dịch vụ Firebase khác (tuỳ chọn)

### 7.1 Crashlytics

- Thêm dependency `firebase_crashlytics`
- Android: bật Crashlytics Gradle plugin
- Flutter: set handler để ghi lỗi Flutter/uncaught

Trong repo của bạn đã có tích hợp Crashlytics theo `kDebugMode` trong `apps/customer_app/lib/app.dart`.

**Lưu ý về debug:** Crashlytics thường không gửi crash ở debug nếu không bật `setCrashlyticsCollectionEnabled(true)`.

### 7.2 Analytics / Performance / Messaging / Remote Config

Dự án đang có các service nằm trong package `packages/share/lib/firebase/*`.
Thông thường bạn chỉ cần:

- đảm bảo dependency có trong `pubspec.yaml`
- init theo luồng ứng dụng (ví dụ `initFirebaseMessaging`, `RemoteConfigService.init()`)

---

## 8) Troubleshooting

- Sai `applicationId` (Android) hoặc `bundleId` (iOS)
  - Triệu chứng: Firebase init OK nhưng service không hoạt động / Crashlytics không nhận
- Đặt sai vị trí `google-services.json` theo flavor
- iOS: plist không được add vào đúng target / build scheme
- Chạy `flutterfire configure` nhưng không commit các file generate cần thiết

---

## 9) Checklist nhanh

- [ ] `flutterfire configure` chạy thành công
- [ ] `apps/customer_app/firebase.json` đúng mapping môi trường
- [ ] Android: `android/app/src/<flavor>/google-services.json` tồn tại
- [ ] iOS: `ios/Runner/<Env>/GoogleService-Info.plist` tồn tại và được include
- [ ] `Firebase.initializeApp(...)` được gọi trước khi dùng Firebase service

