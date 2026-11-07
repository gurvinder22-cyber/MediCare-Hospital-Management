# PROJECT REPORT
## MediCare – Hospital Management UI

**Student Name:** ______________________________  
**Roll Number:** ______________________________  
**Course / Lab:** Flutter UI  
**Technology:** Flutter, Dart, Material 3  
**Platform:** Flutter Web  
**Submission Date:** ______________________________

---

## 1. Abstract
MediCare is a responsive hospital management user interface developed using Flutter. It provides a centralized dashboard for viewing summary information and navigating between patient records, appointments, doctors and billing. The project demonstrates Flutter widgets, reusable components, navigation, local state management and responsive layouts.

## 2. Problem Statement
Hospital administration involves several types of information. A clear interface can help administrative staff view patient records, appointment schedules, doctor availability and billing summaries in an organized manner. MediCare demonstrates a unified dashboard for these activities.

## 3. Objectives
- Create a professional blue-and-white hospital dashboard.
- Build separate modules for patients, appointments, doctors and billing.
- Use reusable Flutter widgets for consistent UI.
- Implement responsive layouts for desktop and mobile.
- Add basic interactions using local state and sample data.
- Deploy the Flutter web application for external evaluation.

## 4. Scope and Limitations
MediCare is a front-end academic prototype. It uses sample records embedded in the application. It does not include a backend, database, secure login, role permissions, real payment processing or medical decision support. It must not be used to store real patient data or for clinical decisions.

## 5. Tools and Technologies
- **Flutter:** UI framework for building applications from a shared codebase.
- **Dart:** Programming language used to write Flutter applications.
- **Material 3:** Design system and standard UI components.
- **Visual Studio Code:** Suggested code editor.
- **Git and GitHub:** Source control and deployment workflow.
- **GitHub Pages:** Static hosting for the Flutter web build.

## 6. System Modules
1. **Overview Dashboard:** Summary cards for patients, appointments, doctors and revenue; appointment overview; department progress; recent activity.
2. **Patient Directory:** Displays sample patient records and supports text search by patient name, ID or department.
3. **Appointments:** Displays appointment records and filters by All, Confirmed, Waiting and Cancelled.
4. **Doctors:** Displays doctors, specialties and availability status.
5. **Billing:** Displays payment summary cards and invoice records.

## 7. User Interface Design
The interface uses a blue-and-white professional color scheme. On desktop, a persistent navigation panel appears on the left. On smaller screens, navigation is provided through a drawer. The top bar displays the current page title and simple utility controls. Cards, tables and progress indicators organize the information.

## 8. Implementation
The program starts in `main()` and runs `MediCareApp`. `MaterialApp` configures the theme and loads `HospitalHome`. `HospitalHome` maintains the selected navigation index and uses `IndexedStack` to show the selected page. Reusable widgets include `NavigationPanel`, `HeaderBar`, `ContentArea`, `StatCard`, `AppointmentLine`, `ProgressLine` and `BillingMetric`.

Stateful widgets are used where the UI changes:
- The patient page filters the list when the user types in the search box.
- The appointments page updates the visible records when a status chip is selected.
- The home screen updates the selected page when a navigation item is tapped.

## 9. Sample Data
Patient data includes patient ID, name, gender, age, department and status. Appointment data includes time, patient, doctor, department and status. Doctor data includes name, specialty and availability. Billing data includes invoice ID, patient, date, amount and payment status. All records are illustrative sample data.

## 10. Testing
The following tests should be performed before submission:
- Run `flutter pub get` to install dependencies.
- Run `dart format lib/main.dart`.
- Run `flutter analyze` and check for compilation errors.
- Run `flutter run -d chrome`.
- Test all five navigation sections.
- Search the patient list using a name or ID.
- Test all appointment status filters.
- Resize the browser to check responsive layout.
- Run `flutter build web --release`.
- Test the deployed URL in a private browser window.

## 11. Deployment
The project includes a GitHub Actions workflow at `.github/workflows/deploy.yml`. After pushing the project to a GitHub repository and enabling GitHub Actions under Settings → Pages, the workflow installs Flutter, gets dependencies, builds the web application with the repository base path and publishes the `build/web` directory. The resulting site is accessible through the GitHub Pages URL.

## 12. Future Enhancements
- Add a secure backend and database.
- Implement authentication and role-based access.
- Add create, edit and delete patient operations.
- Add appointment booking forms and calendar integration.
- Add invoice generation and payment integration.
- Add validation, automated tests and accessibility improvements.

## 13. Conclusion
MediCare demonstrates how Flutter can be used to build a responsive hospital administration interface. It organizes hospital-related information into clear modules and demonstrates reusable widgets, navigation and interactive local filtering. It provides a foundation for future backend integration.

---

## 14. Viva Questions and Answers

**1. What is Flutter?**  
Flutter is an open-source UI toolkit used to build applications for multiple platforms from one codebase.

**2. What is Dart?**  
Dart is the programming language used to develop Flutter applications.

**3. What is a widget?**  
A widget is a basic building block of a Flutter user interface. Text, buttons, layouts and complete screens are widgets.

**4. What is MaterialApp?**  
MaterialApp is a widget that configures app-level Material Design features such as theme, navigation and the home page.

**5. What is Scaffold?**  
Scaffold provides the basic visual structure of a screen, including its body, app bar and drawer.

**6. What is StatelessWidget?**  
A StatelessWidget describes UI that does not manage changing internal state.

**7. What is StatefulWidget?**  
A StatefulWidget is used when a widget's data can change during runtime and the UI must update.

**8. What does setState() do?**  
setState() tells Flutter that state has changed and the widget should rebuild.

**9. What is the purpose of LayoutBuilder?**  
LayoutBuilder provides the available layout constraints so the UI can adapt to different screen sizes.

**10. What is responsive design?**  
Responsive design allows an interface to adapt to desktop, tablet and mobile screen dimensions.

**11. What is IndexedStack?**  
IndexedStack displays one child from a list at a selected index while preserving the state of the other children.

**12. What is the difference between Row and Column?**  
Row arranges children horizontally, while Column arranges children vertically.

**13. What is DataTable?**  
DataTable is a Material widget used to display information in rows and columns.

**14. How is patient search implemented?**  
A TextEditingController stores the search text. The patient list is filtered and setState rebuilds the visible results.

**15. How are appointment filters implemented?**  
ChoiceChip controls the selected status. The appointment list is filtered according to that selected value.

**16. Does this project use a database?**  
No. It uses sample data stored locally in Dart code. A database and backend can be integrated in a future version.

**17. How do you build a Flutter web application?**  
Run `flutter build web --release`. The output is generated in the `build/web` folder.

**18. Why is base-href important for GitHub Pages?**  
A repository-based GitHub Pages site is hosted under a subpath. The base href helps Flutter locate its web assets correctly.

**19. What is GitHub Actions?**  
GitHub Actions is a CI/CD automation service that can build and deploy a project when code is pushed.

**20. What are the future enhancements of MediCare?**  
A secure backend, database, login, role-based access, CRUD operations, appointment booking, payment integration and automated testing.
