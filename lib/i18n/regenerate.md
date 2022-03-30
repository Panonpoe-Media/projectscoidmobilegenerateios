## Regenerating the i18n files

The files in this directory are based on ../lib/stock_strings.dart
which defines all of the localizable strings used by the stocks
app. The stocks app uses
the [Dart `intl` package](https://github.com/dart-lang/intl).

Rebuilding everything requires two steps.

With the `projectscoidmobile` as the current directory, generate
`intl_messages.arb` from `lib/i18n/projectscoid_strings.dart`:
```
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/i18n lib/i18n/projectscoid_strings.dart
```
The `intl_messages.arb` file is a JSON format map with one entry for
each `Intl.message()` function defined in `projectscoid_strings.dart`. This
file was used to create the English and Indonesia localizations,
`projectscoid_en.arb` and `projectscoid_in.arb`. The `intl_messages.arb` wasn't
checked into the repository, since it only serves as a template for
the other `.arb` files.


With the `projectscoidmobile` as the current directory, generate a
`projectscoid_messages_<locale>.dart` for each `projectscoid_<locale>.arb` file and
`projectscoid_messages_all.dart`, which imports all of the messages files:
```
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/i18n  --generated-file-prefix=projectscoid_ --no-use-deferred-loading lib/i18n/projectscoid_messages_all.dart lib/i18n/projectscoid_*.arb
```
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/i18n  --generated-file-prefix=projectscoid_ --no-use-deferred-loading lib/i18n/projectscoid_messages_all.dart lib/i18n/projectscoid_en.arb lib/i18n/projectscoid_id.arb

The `projectscoidStrings` class uses the generated `initializeMessages()`
function (`projectscoid_messages_all.dart`) to load the localized messages
and `Intl.message()` to look them up.
