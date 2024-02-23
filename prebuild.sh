dart run easy_localization:generate -f keys -S resources/lang -O lib/core/src/localization -o locale_keys.g.dart

flutter pub run build_runner build --delete-conflicting-outputs

# read -r -p "Press Enter to continue..." key
