---
name: bloc_creator
description: Scaffold a new Flutter BLoC (bloc + freezed event + freezed state, 3 files) following this repo's convention. Use whenever the user asks to create, scaffold, or generate a new bloc, page bloc, or cubit-style bloc trio for this project.
---

# Bloc Creator

Generates the 3-file BLoC trio (`*_bloc.dart`, `*_event.dart`, `*_state.dart`) used in this project, using `freezed` for the event/state unions and `flutter_bloc` for the bloc class.

## 1. Ask for the bloc name

If the user hasn't already given a name in their request, ask for it directly (plain question, not a multiple-choice prompt — it's free text).

The name must end with `_page_bloc` or `_bloc`:

- Ends with `_page_bloc` → **page bloc**, goes under `lib/features/presentation/bloc/<name>/`, and its state gets an extra `ui` case.
- Ends with `_bloc` (but not `_page_bloc`) → **normal bloc**, goes under `lib/core/presentation/bloc/<name>/`, no `ui` case.
- Anything else → tell the user the name must end in `_bloc` or `_page_bloc` and ask again.

The folder is named after `<name>` **as typed**, unmodified. File names are different: they're built from a shorter `base` (see step 2) so the bloc name appears in each file name exactly once, not twice.

## 2. Derive names

Given `<name>` (the raw input) and `<suffix>` = whichever of `_page_bloc` / `_bloc` it ends with:

- `base` = `<name>` with the trailing `<suffix>` removed — e.g. `auth_bloc` → `auth`, `home_page_bloc` → `home`
- `eventStateBase` = `<name>` with only the trailing literal `_bloc` stripped (keep `_page` if present) — e.g. `test_page_bloc` → `test_page`, `auth_bloc` → `auth`, `home_page_bloc` → `home_page`. For a normal bloc this is identical to `base`; for a page bloc it keeps the `_page` part that `base` drops.
- The bloc file is built from `base` (never from `<name>` directly — that would repeat "bloc"/"page_bloc" twice); the event/state files are built from `eventStateBase` (no "bloc" in the name at all, matching this repo's existing blocs):
  - **page bloc**: `<base>_page_bloc.dart`, `<eventStateBase>_event.dart`, `<eventStateBase>_state.dart`
  - **normal bloc**: `<base>_bloc.dart`, `<eventStateBase>_event.dart`, `<eventStateBase>_state.dart`

Examples:

- page bloc, `name = home_page_bloc` → base `home`, eventStateBase `home_page` → `home_page_bloc.dart`, `home_page_event.dart`, `home_page_state.dart`
- normal bloc, `name = auth_bloc` → base `auth`, eventStateBase `auth` → `auth_bloc.dart`, `auth_event.dart`, `auth_state.dart`

Target directory (uses the full `<name>`, not `base`):
- page bloc: `lib/features/presentation/bloc/<name>/`
- normal bloc: `lib/core/presentation/bloc/<name>/`

`ClassName` = PascalCase of `<name>` **as typed**, the full input including its suffix (split on `_`, capitalize each part, join) — e.g. `home_page_bloc` → `HomePageBloc`, `auth_bloc` → `AuthBloc`. This is the Bloc class name; file names use `base`.

The event/state classes do **not** reuse `ClassName` — they must match the file name (i.e. `eventStateBase`, defined above), without the word "Bloc" in them:

- `EventStateName` = PascalCase of `eventStateBase` — e.g. `test_page` → `TestPage`, `auth` → `Auth`, `home_page` → `HomePage`.
- The event/state classes are `<EventStateName>Event` / `<EventStateName>State` — e.g. for `test_page_bloc`: `TestPageEvent` / `TestPageState`. For `auth_bloc`: `AuthEvent` / `AuthState`.

The event and state files are **not** separate freezed libraries — they are `part of` the main bloc file, which is the sole owner of the `.freezed.dart` part. This keeps one bloc + its event + its state as a single library, generating a single `<stem>.freezed.dart`.

## 3. Create the 3 files

### `<...>_event.dart`

A freezed union with a single default event, `setup`, no parameters:

```dart
part of '<stem>.dart';

@freezed
sealed class <EventStateName>Event with _$<EventStateName>Event {
  const factory <EventStateName>Event.setup() = _Setup;
}
```

(`sealed` is required by freezed 3+/4+ — installed here — for any union with factory constructors; a plain `class` silently generates no code, no error.)

### `<...>_state.dart`

A freezed union. States: `init`, `loading`, `ui` (page bloc only), `error`. No parameters on any of them (don't invent fields that weren't asked for).

```dart
part of '<stem>.dart';

@freezed
sealed class <EventStateName>State with _$<EventStateName>State {
  const factory <EventStateName>State.init() = _Init;
  const factory <EventStateName>State.loading() = _Loading;
  const factory <EventStateName>State.ui() = _Ui; // page bloc only — omit for normal bloc
  const factory <EventStateName>State.error() = _Error;
}
```

### `<stem>.dart` (the bloc itself)

Extends `Bloc<Event, State>`, initial state is `init`, already wires up the `setup` event handler, and owns the `part`/`part of` wiring for the other two files plus the generated freezed part.

Register each event with its own `on<_EventName>()` handler (one per freezed factory's generated private class, e.g. `_Setup`), **not** a single `on<<EventStateName>Event>` with `event.when` inside — a shared handler makes it easy to fire-and-forget an inner async branch, which trips bloc's "emit called after handler completed" assert the moment someone adds an unawaited future. Per-event handlers keep each one's `await`/`emit.isDone` bookkeeping isolated, and let each event opt into its own concurrency transformer later if needed.

**Page bloc** — the `setup` handler emits `ui` directly, no extra helper needed:

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '<event_file>.dart';
part '<state_file>.dart';
part '<stem>.freezed.dart';

class <ClassName> extends Bloc<<EventStateName>Event, <EventStateName>State> {
  <ClassName>() : super(const <EventStateName>State.init()) {
    on<_Setup>((event, emit) {
      emit(const <EventStateName>State.ui());
    });
  }
}
```

**Normal bloc** — no `ui` state; leave the `setup` handler body for the user to fill in. Declared `async` since real `setup` bodies almost always await something (a repo call, etc.) before emitting:

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '<event_file>.dart';
part '<state_file>.dart';
part '<stem>.freezed.dart';

class <ClassName> extends Bloc<<EventStateName>Event, <EventStateName>State> {
  <ClassName>() : super(const <EventStateName>State.init()) {
    on<_Setup>((event, emit) async {
      // TODO: implement setup
    });
  }
}
```

(`<event_file>` / `<state_file>` = the event/state file names without `.dart`; `<stem>` = the main bloc file name without `.dart`.)

## 4. Generate the freezed code

After writing the 3 files, run build_runner scoped to just this bloc's folder (not the whole project — keep it fast):

```
dart run build_runner build --build-filter="<target_dir>/**"
```

Where `<target_dir>` is the folder created in step 2 (e.g. `lib/core/presentation/bloc/auth_bloc`). Run this yourself — don't just tell the user to run it. If the first run after a fresh clone/checkout reports everything as skipped/no-op even though `.freezed.dart` doesn't exist yet, run `dart run build_runner clean` once and retry — the build cache can go stale. If it fails because `freezed_annotation` isn't a pubspec dependency (only `freezed` is — it currently resolves as a transitive dependency, which works but isn't guaranteed), tell the user to add it explicitly rather than editing `pubspec.yaml` yourself.
