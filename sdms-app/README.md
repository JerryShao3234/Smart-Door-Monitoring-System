# sdms_app

A Flutter project for allowing homeowners to interact with their Smart Door Monitoring System (SDMS).

## Testing:
* If using an Android emulator, boot that up first. Otherwise, connect your Android phone via a USB cable
* Run the project with `flutter run`
* To access the home screen, login with the following: Email: `a@a.com` Password: `asdfasdf`

## Automation scripts
* `flutter format lib` to apply dart formatting to all files in /lib/ recursively
* `flutter pub run import_sorter:main` to standardize the sort / comments on all imports
* `flutter pub run build_runner build --delete-conflicting-outputs` to auto-generate code (json_serializable)

## One-line command (for Windows)
`dart format lib; flutter pub run import_sorter:main; flutter pub run build_runner build --delete-conflicting-outputs`