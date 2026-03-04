---
trigger: always_on
glob: "packages/**/*.dart,lib/**/*.dart"
description: API reference for packages/design_system — theme extensions, design tokens, and DS widgets.
---
# packages/design_system — API Reference

> Use `import 'package:design_system/design_system.dart';`

## Theme Extensions (via context.app*)

### AppColorsExtension — `context.appColors.*`

| Property | Use for |
|---|---|
| `.background` | Scaffold/page background |
| `.success / .successContainer` | Success badge/banner |
| `.onSuccess / .onSuccessContainer` | Text/icon on success background |
| `.warning / .warningContainer` | Warning badge/banner |
| `.onWarning / .onWarningContainer` | Text/icon on warning background |
| `.info / .infoContainer` | Info badge/banner |
| `.onInfo / .onInfoContainer` | Text/icon on info background |
| `.neutral / .neutralVariant` | Neutral text/icon |
| `.cardBackground` | Card background |
| `.dialogBackground` | Dialog background |
| `.bottomSheetBackground` | Bottom sheet background |
| `.divider` | Divider line |
| `.border` | Input/card border |

### AppSpacingExtension — `context.appSpacing.*` or `AppSpacing.*` (static)

| Context getter | Static | px | Use for |
|---|---|---|---|
| `.pageHorizontal` | `AppSpacing.pageHorizontal` | 16 | Horizontal page padding |
| `.pageVertical` | `AppSpacing.pageVertical` | 24 | Vertical page padding |
| `.sectionSpacing` | `AppSpacing.sectionSpacing` | 24 | Between sections |
| `.cardPadding` | `AppSpacing.cardPadding` | 16 | Inside card |
| `.listItemPadding` | `AppSpacing.listItemPadding` | 16 | Between list items |
| `.buttonPadding` | `AppSpacing.buttonPadding` | 16 | Button padding |
| `.inputPadding` | `AppSpacing.inputPadding` | 16 | TextField padding |
| `.dialogPadding` | `AppSpacing.dialogPadding` | 24 | Dialog padding |

**Scale (8px grid):** `xxxs(4)` `xxs(8)` `xs(12)` `sm(16)` `smd(20)` `md(24)` `lg(32)` `xl(40)` `xxl(48)` `xxxl(64)`

**Icon sizes:** `iconXS(16)` `iconSM(20)` `iconMD(24)` `iconLG(32)` `iconXL(40)` `iconXXL(48)` `iconHuge(64)`

### AppRadiusExtension — `context.appRadius.*` or `AppRadius.*` (static)

| Property | px | Use for |
|---|---|---|
| `.button` / `AppRadius.button` | 12 | All buttons |
| `.card` / `AppRadius.card` | 20 | Card, tile |
| `.input` / `AppRadius.input` | 20 | TextField, dropdown |
| `.dialog` / `AppRadius.dialog` | 20 | Dialog, modal |
| `.bottomSheet` / `AppRadius.bottomSheet` | 20 | Bottom sheet |
| `.chip` / `AppRadius.chip` | 16 | Chip, tag |
| `.container` / `AppRadius.container` | 12 | Generic container |
| `AppRadius.full` / `AppRadius.pillShape` | 999 | Fully rounded |

### AppTypographyExtension — `context.appTypography.*`

| Group | Properties |
|---|---|
| Display | `displayLarge` `displayMedium` `displaySmall` |
| Headline | `headlineLarge` `headlineMedium` `headlineSmall` `sectionHeader` |
| Title | `titleLarge` `titleMedium` `titleSmall` |
| Body | `bodyLarge` `bodyMedium` `bodySmall` |
| Label | `labelLarge` `labelMedium` `labelSmall` |
| Custom | `button` `caption` `overline` `error` `helper` `input` |

---

## DS Widgets — MUST use before building from scratch

| Widget | Replaces |
|---|---|
| `CustomCard` | Raw `Card(...)` |
| `CustomAppBar` | Raw `AppBar(...)` |
| `AppTextField` | Raw `TextField(...)` |
| `AppTextField.search(...)` | Search TextField |
| `AppDropdown` | `DropdownButton(...)` |
| `AppSegmentedTabBar` | Segment-style TabBar |
| `AppIconContainer` | Icon with styled container |
| `AppLinearProgressIndicator` | `LinearProgressIndicator` |
| `ScrollList<T>` | ListView + refresh + shimmer + pagination |
| `ScrollableGridView` | GridView + pagination |
| `LoadingMoreIndicator` | End-of-list load indicator |
| `Responsive` | Inline MediaQuery if/else for layout |
| `ResponsiveRowColumn` | `isRow ? Row : Column` |

### CustomCard

```dart
CustomCard(
  onTap: () => ...,
  showBorder: true,
  elevation: 2,
  child: ...,
)
```

### CustomAppBar

```dart
CustomAppBar(
  title: 'Title',
  subtitle: 'Subtitle',
  leadingType: CustomAppBarLeadingType.back, // or .none
  actions: [...],
  isDarkBackground: false,
)
```

### AppTextField

```dart
AppTextField(controller: _ctrl, hintText: '...', onChanged: (v) => ...)
AppTextField.search(controller: _ctrl, onChanged: (v) => _debounce(() => _cubit.search(v)))
```

### ScrollList\<T\>

```dart
ScrollList<ItemEntity>(
  controller: _scrollController,
  isLoading: state.isLoading,
  items: state.items,
  onRefresh: () async => _cubit.refresh(),
  onLoadingMore: () => _cubit.loadMore(),
  noRecordFoundWidget: const EmptyWidget(),
  itemShimmerLoading: const ItemShimmer(),
  itemBuilder: (ctx, i, item) => ItemCard(item: item),
)
```
> Built-in `Throttle` (load-more) and `Debounce` (refresh) — no manual implementation needed.

### Responsive

```dart
Responsive(
  mobile: MobileLayout(),   // <= 480px
  tablet: TabletLayout(),   // 481-800px
  web: WebLayout(),         // 801-1050px
)
// Static helpers:
Responsive.isMobile(context) / .isTablet(context)
Responsive.isLargerThan(context, Breakpoint.tablet)
```

### AppAssets

```dart
Image.asset(AppIcons.icSearch, package: AppAssets.package)
```
