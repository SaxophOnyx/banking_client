dart run easy_localization:generate -f keys -S resources/lang -O packages/core/lib/src/localization -o locale_keys.g.dart

cd packages

cd domain
flutter pub run build_runner build --delete-conflicting-outputs

cd ../features
find . -mindepth 1 -maxdepth 1 -type d -exec sh -c 'cd "$0" && echo "$0" && flutter pub run build_runner build --delete-conflicting-outputs' {} \;

cd ../navigation
flutter pub run build_runner build --delete-conflicting-outputs

# read -r -p "Press Enter to continue..." key
