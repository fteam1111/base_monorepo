---
trigger: always_on
glob: "**/presentation/pages/**/*.dart,**/presentation/widgets/**/*.dart,packages/design_system/**/*.dart"
description: UI design rules, Material 3, context extension shortcuts, and Design System conventions.
---
# UI Design & Flutter Best Practices

## 1) General Principles (Flutter 3.x & Material 3)

- **Material 3**: Use Material 3 (M3) visual components by default.
- **Null Safety**: Follow strictly. Avoid the `!` (bang) operator unless the value is guaranteed non-null. Prefer `?` and null handling.
- **Naming**: `lowerCamelCase` for variables/functions, `PascalCase` for Widget/Class, `snake_case` for file names.
- **Const constructors**: Always use `const` constructors for unchanging widgets to reduce rebuilds.
- **Widget Keys**: Provide `Key? key` in widget constructors. Use `ValueKey` or `ObjectKey` for list item identification.

## 2) Composition & Scaffolding

- **Small & Focused**: Break UI into small widgets. Do not write long `_buildHelper()` methods.
- **Stateless over Stateful**: Prefer `StatelessWidget`.
- **State-Driven**: UI is a pure function of State (`f(State)`).

**Example (Widget names change per feature):**
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: ...,
    body: Column(
      children: [
        const LoginHeaderSection(),
        const LoginFormSection(),
        const LoginActionsSection(),
      ],
    ),
  );
}
```

- **Extract Sections**: Each relatively independent section → separate file in `widgets/`.
- **Flexible naming**: `[FeatureName][SectionName]Section` (e.g. `HomeBannerSection`, `ProfileMenuSection`).
- **Group by role**: Header, Body (Content/Empty/Error), Footer (Actions).

## 3) Design System & Extensions

> **Prioritize the Design System in `packages/design_system`**:
> - Buttons use `ElevatedButtonTheme` / `OutlinedButtonTheme` from the theme.
> - Inputs use `TextField` styled through the theme.
> - **No hardcoded styles**: Avoid `Color(...)`, hardcoded radius, elevation, or padding if the theme/token already covers it.

Never call `Theme.of(context)` or `MediaQuery.of(context)` directly.
Use the **extensions** in `packages/share/lib/extensions/context_ext.dart`:

### Theme & Colors
- `context.textTheme` instead of `Theme.of(context).textTheme`
- `context.colorScheme` instead of `Theme.of(context).colorScheme`
- Custom tokens (accurate property names):
  - Colors: `context.appColors.success`, `.warning`, `.info`, `.cardBackground`, `.border`, `.divider`
  - Radius: `context.appRadius.button(12)`, `.card(20)`, `.input(20)`, `.dialog(20)`, `.chip(16)`, `.container(12)`
  - Spacing (context-aware): `context.appSpacing.pageHorizontal`, `.cardPadding`, `.sectionSpacing`, `.listItemPadding`
  - Spacing (static, no context): `AppSpacing.sm(16)`, `.md(24)`, `.xs(12)`, `.xxs(8)`, `.lg(32)`
  - Radius (static): `AppRadius.button(12)`, `.card(20)`, `.full(999)`, `.pillShape(999)`
  - Typography: `context.appTypography.bodyMedium`, `.titleLarge`, `.sectionHeader`, `.caption`

### Layout & Responsive
- Screen size: `context.screenWidth`, `context.screenHeight`
- Safe area: `context.statusBarHeight`, `context.bottomPadding`
- Keyboard: `context.isKeyboardVisible`, `context.keyboardHeight`
- Responsive checks: `context.isSmallScreen` (<600px), `context.isMediumScreen` (600-1024px), `context.isLargeScreen` (>=1024px)

### Localization
- `context.l10n` instead of `AppLocalizations.of(context)!`

## 4) Button Styles

- Use `ElevatedButton`, `OutlinedButton` per the default theme.
- **No ad-hoc styles**: Do not use `styleFrom(...)` per screen if the style can be added to the theme.
- For special styles, check `context.primaryButtonStyle` or `context.secondaryButtonStyle` in `button_styles.dart`.

## 5) Input / Form Rules

- **TextField**: Avoid per-screen custom `decoration:` (labelStyle, border, fillColor...) if the theme already handles it.
- **Validation**: Display errors using Flutter's standard form mechanism + theme. Put messages in localization.

## 6) Layout Principles

- Avoid deeply nested widgets.
- Use `Column`/`Row` with `Expanded`/`Flexible` appropriately.
- Always wrap scrollable content in `SafeArea` (or use padding from context extensions).
- Handle keyboard overlap: use `context.bottomPadding` or check `context.isKeyboardVisible`.

## 7) Deprecated API

- Do **not** use `Color.withOpacity()`. Use `color.withValues(alpha: 0.5)` or `Color.fromARGB()` instead.

## 8) Gap Instead of SizedBox

- Use `Gap` (from the `gap` package) instead of `SizedBox` for spacing inside `Column` or `Row`.
  ```dart
  // ✅ Correct
  Column(children: [Text('A'), const Gap(16), Text('B')])
  // ❌ Avoid
  Column(children: [Text('A'), const SizedBox(height: 16), Text('B')])
  ```

## 9) Design System Widgets — PHẢI dùng trước khi tự build

`import 'package:design_system/design_system.dart';`

| Widget | Dùng thay thế cho |
|---|---|
| `CustomCard` | `Card(...)` custom một mình |
| `CustomAppBar` | `AppBar(...)` tự build (hỗ trợ `leadingType`, `subtitle`, `isDarkBackground`) |
| `AppTextField` | `TextField(...)` raw; dùng `AppTextField.search(...)` cho search bar |
| `AppDropdown` | `DropdownButton(...)` tự build |
| `AppSegmentedTabBar` | `TabBar` style segment |
| `AppIconContainer` | Icon trong container có styled background |
| `AppLinearProgressIndicator` | `LinearProgressIndicator(...)` raw |
| `ScrollList<T>` | `ListView.builder` + pull-to-refresh + shimmer tự build |
| `ScrollableGridView` | `GridView.builder` + pagination tự build |
| `LoadingMoreIndicator` | indicator cuối list khi load-more |
| `Responsive` | in-line `MediaQuery` if/else cho layout |
| `ResponsiveRowColumn` | `isRow ? Row(...) : Column(...)` inline |

### `Responsive` Widget — Breakpoints

```dart
Responsive(
  mobile: MobileLayout(),   // <= 480px
  tablet: TabletLayout(),   // 481-800px
  web: WebLayout(),         // 801-1050px
  desktop: DesktopLayout(), // > 1050px (optional)
)

// Static helpers:
Responsive.isMobile(context)   // <= 480
Responsive.isTablet(context)   // 480-600
Responsive.isDesktop(context)  // 600-800
Responsive.isLargerThan(context, Breakpoint.tablet)
```

### `ScrollList<T>` — Khi cần list với pagination

```dart
ScrollList<VehicleEntity>(
  controller: _scrollController,
  isLoading: state.isLoading,
  items: state.vehicles,
  onRefresh: () async => _cubit.refresh(),
  onLoadingMore: () => _cubit.loadMore(),
  noRecordFoundWidget: const EmptyWidget(),
  itemShimmerLoading: const ItemShimmer(),
  itemBuilder: (context, index, item) => VehicleCard(vehicle: item),
)
```
> `ScrollList` đã tích hợp sẵn `Throttle` (load-more) và `Debounce` (refresh).
