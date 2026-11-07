# MediCare – Hospital Management UI

A responsive Flutter Web front-end prototype for a hospital administration dashboard.

## Features
- Overview dashboard with summary cards, appointments, department progress and activity
- Patient directory with working local search
- Appointment list with status filters
- Doctor directory with availability labels
- Billing summary and invoice table
- Responsive desktop sidebar and mobile navigation drawer
- Material 3 styling and reusable Flutter widgets

## Important scope note
This is a UI/academic prototype. It uses demonstration data stored in Dart code. It has no database, real authentication, payment processing, or clinical functionality. Do not enter real patient information.

## Requirements
- Flutter stable SDK
- Dart (included with Flutter)
- Chrome
- Git (for deployment)

## Run locally (Windows PowerShell)
Open the folder that contains `pubspec.yaml` in VS Code. In the terminal run:

```powershell
flutter doctor
flutter pub get
dart format lib/main.dart
flutter analyze
flutter run -d chrome
```

If `flutter analyze` reports only informational lints, the app can still run. Resolve any errors before submission.

## Build for web

```powershell
flutter build web --release
```

Output is created in `build/web`.

## GitHub Pages deployment
This project includes `.github/workflows/deploy.yml`.

1. Create a GitHub repository, for example `medicare-hospital-ui`.
2. Upload/push the contents of this project folder to the repository root (the `pubspec.yaml` must be at repository root).
3. In GitHub open **Settings → Pages**.
4. Under Build and deployment, select **GitHub Actions**.
5. Push to the `main` branch. The workflow installs Flutter, builds the web app with the repository base path, and deploys it.
6. Wait for the Actions workflow to finish successfully.
7. Your URL will be `https://YOUR-USERNAME.github.io/REPOSITORY-NAME/`.

If the repository is a user site named `YOUR-USERNAME.github.io`, change the workflow build command base href to `/`.

## Vercel alternative
Vercel build images do not always include Flutter. The reliable route is to build `build/web` with Flutter in GitHub Actions, then deploy that static output to Vercel. For a simple Flutter student project, GitHub Pages workflow included here is the recommended route.

## Submission checklist
- `flutter pub get` completes successfully.
- `flutter analyze` has no compilation errors.
- `flutter run -d chrome` opens the app.
- `flutter build web --release` completes.
- GitHub Actions deployment is green.
- Open the live URL in an incognito/private browser.
- Test all navigation items, patient search, appointment filters, and mobile layout.
- Submit the live URL in the class Google Sheet at least one day before the exam.

See `PROJECT_REPORT.md` for the project report and viva preparation.
