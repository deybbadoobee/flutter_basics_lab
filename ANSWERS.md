# Flutter Basics Lab - Answers

## Student Information

**Name:** Dave Nathan Gultiano

**Student ID:** 241-01332

**Section:** ILGX3 - IT120

---

# GitHub Repository

**GitHub Repository:**

`https://github.com/deybbadoobee/flutter_basics_lab.git`

---

# Activity 2 - Last Three `build()` Called Lines

After running Activity 2 and interacting with the Water Tracker, copy the actual last three `build()` lines from the VS Code Debug Console.

```text
build() called: 4 glasses
build() called: 5 glasses
build() called: 6 glasses
```

---

# Activity 2 - Experiment Observation

## What happened when `_glasses++` was moved outside `setState()`?

When `_glasses++` was moved outside `setState()`, the value of `_glasses` changed in the State object, but the user interface did not immediately update.

The number displayed on the screen and the progress indicator remained unchanged because Flutter was not notified that the state had changed.

`setState()` is necessary because it tells Flutter that the State object has changed and that the widget should be rebuilt.

After putting `_glasses++` back inside `setState()`, tapping the `+` button caused the interface to update correctly.

---

# Activity 3 - Experiment Observation

## What happened when `Expanded` was removed from one `StatBox`?

When `Expanded` was removed from one `StatBox`, that widget was no longer required to share the available horizontal space equally with the other boxes.

The remaining widgets could therefore use different amounts of space. Depending on the available screen width, the row could become cramped or produce a layout overflow.

`Expanded` tells Flutter that the child should expand to use the available space along the `Row`'s main axis.

When all four `StatBox` widgets are wrapped in `Expanded`, they share the available width equally.

---

# Activity 5 - Theme Observation

## What changed when the button corner radius was changed from 8 to 20?

I changed the `borderRadius` of the `ElevatedButtonThemeData` from `8` to `20`.

The buttons became more rounded because the larger radius creates more curved corners.

The change was made inside `buildTheme()`, so the styling is applied through the application's theme rather than directly to only one button.

This demonstrates how `ThemeData` can be used to apply consistent styling to components throughout the application.

---

# Review Questions

## 1. What is the difference between a `StatelessWidget` and a `StatefulWidget`? Give one example of each from this lab.

A `StatelessWidget` is a widget whose displayed data does not change while the widget is running. Its UI is determined by the values given to it when it is built.

An example from this lab is `ProfileCard` in Activity 1 because the profile information is displayed without changing while the app is running.

A `StatefulWidget` is used when information can change while the application is running. The changing information is stored in a separate `State` object, and `setState()` is used to tell Flutter to rebuild the UI.

An example from this lab is `WaterTrackerPage` in Activity 2 because the number of glasses changes whenever the user taps the buttons.

---

## 2. Why is a `StatefulWidget` written as two classes? What does each class do?

A `StatefulWidget` is divided into two classes because Flutter separates the widget's configuration from its changing state.

The `StatefulWidget` class creates the State object through `createState()`. It contains the configuration and identifies the type of state it uses.

The `State` class stores the data that can change and contains the `build()` method that creates the UI.

In Activity 2, `WaterTrackerPage` is the `StatefulWidget`, while `_WaterTrackerPageState` stores `_glasses` and `_goal` and builds the screen.

---

## 3. In Activity 2, what happened when you changed `_glasses` outside `setState()`? Why?

When `_glasses++` was changed outside `setState()`, the value changed internally, but the visible interface did not update.

This happened because Flutter was not notified that the state had changed.

`setState()` tells Flutter that the State object has changed and causes Flutter to call `build()` again.

Without `setState()`, changing the state variable alone does not automatically cause the widget's user interface to rebuild.

---

## 4. Looking at the Debug Console in Activity 2, when is `build()` called?

The `build()` method is called when Flutter needs to create or rebuild the widget's user interface.

In Activity 2, `build()` is called initially when the page is displayed.

It is called again after `_glasses` is changed inside `setState()` because `setState()` tells Flutter that the UI needs to be rebuilt.

Therefore, tapping the `+` or `-` buttons causes another call to `build()` when the state actually changes.

---

## 5. Explain the main axis and the cross axis of a `Row` and of a `Column`.

For a `Row`, the main axis is horizontal and the cross axis is vertical.

For a `Column`, the main axis is vertical and the cross axis is horizontal.

For example, `mainAxisAlignment` in a `Row` controls how its children are positioned horizontally, while `crossAxisAlignment` controls their vertical alignment.

In a `Column`, `mainAxisAlignment` controls vertical positioning and `crossAxisAlignment` controls horizontal alignment.

---

## 6. In Activity 3, what happened when you removed `Expanded` from a `StatBox`? What does `Expanded` do?

When `Expanded` was removed from a `StatBox`, that box no longer shared the available width equally with the other boxes.

`Expanded` allows a child of a `Row` or `Column` to expand and use the available space along the main axis.

In Activity 3, wrapping all four `StatBox` widgets with `Expanded` allows them to divide the available horizontal space equally.

---

## 7. Why do we use `GridView.builder` for the menu instead of a `Column` with many children?

`GridView.builder` is appropriate because the café menu contains multiple items that should be arranged in a grid.

It creates the items using an `itemBuilder` and can efficiently build items as they are needed, which is useful for larger collections.

It also makes it easy to specify the number of columns using `crossAxisCount`.

A `Column` would arrange the items vertically and would not naturally provide the two-column grid layout required by the activity.

---

## 8. How do `Stack` and `Positioned` create the Best seller badge in Activity 4?

The `Stack` allows multiple widgets to be placed on top of one another.

The menu card uses a `Stack` containing the main menu content and the Best seller badge.

The `Positioned` widget places the Best seller badge at a specific location inside the `Stack` using values such as `top` and `left`.

The badge is only added when `item.bestSeller` is `true` by using a Dart collection-if:

```dart
if (item.bestSeller)
```

Therefore, only menu items marked as best sellers display the badge.

---

## 9. What is the difference between customizing with `ThemeData` and with a style on one widget? Give one example of each from Activity 5.

`ThemeData` is used to define styles and settings that can affect the entire application or many widgets.

For example, Activity 5 uses `elevatedButtonTheme` inside `buildTheme()` to give `ElevatedButton` widgets a common shape and padding.

A style applied directly to one widget affects only that particular widget.

For example, a `Text` widget can use a `TextStyle` directly to change its font size or font weight.

Using `ThemeData` is useful when the same design should be applied consistently across the application.

---

## 10. When you flip the dark-mode switch in Activity 5, which widget holds the state, and how does the change reach `MaterialApp`?

The `_ThemeDemoAppState` object holds the `_isDark` Boolean state.

The `SwitchListTile` receives the current value through `isDark` and calls `onDarkChanged` when the switch is changed.

The callback calls `_setDark()` in `_ThemeDemoAppState`, which updates `_isDark` inside `setState()`.

Flutter then rebuilds `ThemeDemoApp`, and `MaterialApp` receives the updated `themeMode`:

```dart
themeMode: _isDark
    ? ThemeMode.dark
    : ThemeMode.light,
```

As a result, `MaterialApp` switches between the light and dark themes.

---

# End of Answers