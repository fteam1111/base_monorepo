## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.35.7 or higher
- Dart SDK 3.9.2 or higher
- Melos CLI (optional but recommended)

### Installation

1. **Clone the repository:**

```bash
git clone https://git.its-global.vn/diemnk/base_monorepo.git
```

```bash
fvm flutter clean
fvm use 3.35.7
fvm flutter pub get
fvm dart pub global activate flutterfire_cli
```

2. **Install Melos (recommended):**

```bash
dart pub global activate melos
```

3. **Bootstrap all packages:**

```bash
# Using Melos
melos bootstrap
```

# build runner
```bash
# Using Melos
melos gen
```

# run analyze
```bash
# Using makefile
make run_analyze gen
```

# build 
```bash
# build ios dev
make build_ios_dev
```

```bash
# build android dev
make build_android_dev
```