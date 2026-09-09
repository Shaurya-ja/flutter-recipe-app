# Recipe & Meal Planner

A Flutter application for browsing meal categories, exploring recipes, and reading step-by-step cooking instructions. Data is retrieved live from [TheMealDB](https://www.themealdb.com/).

## Features

- Browse meal categories in a responsive grid.
- View the recipes available within a selected category.
- Read a recipe's image, category, and cooking instructions.
- Mark a recipe as a favourite during the current session.
- Clear loading, empty-state, and network-error feedback.

## Implementation

The app follows a small, maintainable feature structure:

| Area | Responsibility |
| --- | --- |
| `lib/models/meal.dart` | Converts TheMealDB JSON into typed meal data. |
| `lib/services/api_service.dart` | Makes API requests and validates responses. |
| `lib/screens/category_screen.dart` | Displays categories and handles category selection. |
| `lib/screens/meal_list_screen.dart` | Displays the meals in a category. |
| `lib/screens/meal_detail_screen.dart` | Displays recipe details and the session favourite control. |

The Android manifest includes the `INTERNET` permission required for live API calls.

## Screenshots

Capture and add genuine application screenshots to `docs/screenshots/` before submitting. Recommended frames are:

1. **Categories** — the opening grid of meal categories.
2. **Recipe list** — a selected category with recipe thumbnails.
3. **Recipe details** — an individual recipe's image, category, instructions, and favourite action.

After adding the files, embed them here using relative paths, for example:

```md
![Meal categories](docs/screenshots/categories.png)
```

## Demo video

Record a 30–60 second walkthrough showing the category grid, selecting a category, opening a recipe, and toggling the favourite button. Upload the video to the repository's release or an approved video host, then add its link here before submission.

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart 3.13 or newer)
- Android Studio and an Android emulator or connected Android device, for APK builds and mobile testing

## Setup

```bash
git clone <your-repository-url>
cd recipe-meal-planner-app
flutter pub get
```

## Run the app

Run on a connected device or emulator:

```bash
flutter run
```

For a browser preview:

```bash
flutter run -d chrome
```

The app needs an internet connection to retrieve meal data from TheMealDB.

## Test

```bash
flutter test
```

## Build the Android APK

```bash
flutter build apk --release
```

The generated release APK is at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Publish the required GitHub release

1. Commit and push this project to GitHub.
2. Add the demo-video link to this README and verify all screenshot links render on GitHub.
3. Create and push a version tag, for example `v1.0.0`.
4. The included **Build Android release** GitHub Actions workflow will test the project, build the APK, and attach it to the generated GitHub Release. Alternatively, create a Release manually and attach `build/app/outputs/flutter-apk/app-release.apk`.

> Do not submit the APK solely through a cloud-drive link; attach it directly to the GitHub release.

## Data source

Recipe content and images are provided by [TheMealDB API](https://www.themealdb.com/api.php).
