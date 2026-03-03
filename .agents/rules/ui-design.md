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
- Custom tokens:
  - Colors: `context.appColors.success`, `context.appColors.warning`
  - Radius: `context.appRadius.r8`, `context.appRadius.r16`
  - Spacing: `context.appSpacing.s8`, `context.appSpacing.s24`
  - Typography: `context.appTypography.bodyMedium`

### Layout & Responsive
- Screen size: `context.screenWidth`, `context.screenHeight`
- Safe area: `context.statusBarHeight`, `context.bottomPadding`
- Responsive checks: `context.isSmallScreen` (mobile), `context.isMediumScreen` (tablet)

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
