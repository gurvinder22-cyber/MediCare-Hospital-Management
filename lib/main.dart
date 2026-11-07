import 'package:flutter/material.dart';

void main() {
  runApp(const MediCareApp());
}

const Color brandBlue = Color(0xFF2878D0);
const Color navy = Color(0xFF153B66);
const Color pageBackground = Color(0xFFF4F7FB);
const Color muted = Color(0xFF7D8DA1);
const Color paleBlue = Color(0xFFEAF3FC);
const Color successGreen = Color(0xFF21966F);
const Color warningOrange = Color(0xFFE59A32);
const Color dangerRed = Color(0xFFD85D68);

class MediCareApp extends StatelessWidget {
  const MediCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediCare Hospital',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: brandBlue),
        scaffoldBackgroundColor: pageBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: navy,
          elevation: 0,
        ),
      ),
      home: const HospitalHome(),
    );
  }
}

class HospitalHome extends StatefulWidget {
  const HospitalHome({super.key});

  @override
  State<HospitalHome> createState() => _HospitalHomeState();
}

class _HospitalHomeState extends State<HospitalHome> {
  int selectedIndex = 0;

  final List<String> pageTitles = const [
    'Overview',
    'Patients',
    'Appointments',
    'Doctors',
    'Billing',
  ];

  final List<IconData> pageIcons = const [
    Icons.dashboard_rounded,
    Icons.people_alt_rounded,
    Icons.calendar_month_rounded,
    Icons.medical_services_rounded,
    Icons.receipt_long_rounded,
  ];

  final List<Widget> pages = const [
    DashboardPage(),
    PatientsPage(),
    AppointmentsPage(),
    DoctorsPage(),
    BillingPage(),
  ];

  void selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool desktop = constraints.maxWidth >= 850;

        return Scaffold(
          drawer: desktop
              ? null
              : Drawer(
                  child: SafeArea(
                    child: NavigationPanel(
                      selectedIndex: selectedIndex,
                      onSelected: (index) {
                        selectPage(index);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
          body: Row(
            children: [
              if (desktop)
                SizedBox(
                  width: 245,
                  child: NavigationPanel(
                    selectedIndex: selectedIndex,
                    onSelected: selectPage,
                  ),
                ),
              Expanded(
                child: Column(
                  children: [
                    HeaderBar(
                      title: pageTitles[selectedIndex],
                      showMenu: !desktop,
                    ),
                    Expanded(
                      child: IndexedStack(
                        index: selectedIndex,
                        children: pages,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NavigationPanel extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const NavigationPanel({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  static const List<String> labels = [
    'Overview',
    'Patients',
    'Appointments',
    'Doctors',
    'Billing',
  ];

  static const List<IconData> icons = [
    Icons.dashboard_rounded,
    Icons.people_alt_rounded,
    Icons.calendar_month_rounded,
    Icons.medical_services_rounded,
    Icons.receipt_long_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(18, 24, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: brandBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.local_hospital_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MediCare',
                    style: TextStyle(
                      color: navy,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'HOSPITAL SYSTEM',
                    style: TextStyle(
                      color: muted,
                      fontSize: 9,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 38),
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 12),
            child: Text(
              'MAIN MENU',
              style: TextStyle(
                color: muted,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.3,
              ),
            ),
          ),
          for (int i = 0; i < labels.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: InkWell(
                borderRadius: BorderRadius.circular(11),
                onTap: () => onSelected(i),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 13,
                  ),
                  decoration: BoxDecoration(
                    color: selectedIndex == i ? paleBlue : Colors.transparent,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        icons[i],
                        color: selectedIndex == i ? brandBlue : muted,
                        size: 19,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        labels[i],
                        style: TextStyle(
                          color: selectedIndex == i ? navy : muted,
                          fontWeight: selectedIndex == i
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F6FC),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.support_agent_rounded, color: brandBlue),
                SizedBox(height: 8),
                Text(
                  'Need help?',
                  style: TextStyle(
                    color: navy,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Contact the hospital support team.',
                  style: TextStyle(color: muted, fontSize: 11),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: paleBlue,
                child: Icon(Icons.person, color: brandBlue, size: 19),
              ),
              SizedBox(width: 9),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Admin User',
                    style: TextStyle(
                      color: navy,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Administrator',
                    style: TextStyle(color: muted, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderBar extends StatelessWidget {
  final String title;
  final bool showMenu;

  const HeaderBar({
    super.key,
    required this.title,
    required this.showMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE8EEF5)),
        ),
      ),
      child: Row(
        children: [
          if (showMenu)
            Builder(
              builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu_rounded),
              ),
            ),
          Text(
            title,
            style: const TextStyle(
              color: navy,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          if (MediaQuery.of(context).size.width > 520)
            Container(
              width: 220,
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 11),
              decoration: BoxDecoration(
                color: pageBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: muted, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Search anything...',
                    style: TextStyle(color: muted, fontSize: 12),
                  ),
                ],
              ),
            ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No new notifications')),
              );
            },
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: muted,
            ),
          ),
          const CircleAvatar(
            radius: 17,
            backgroundColor: paleBlue,
            child: Text(
              'AD',
              style: TextStyle(
                color: brandBlue,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContentArea extends StatelessWidget {
  final Widget child;

  const ContentArea({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(22),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: child,
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: navy,
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(color: muted, fontSize: 13),
        ),
      ],
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: 'Good morning, Admin 👋',
            subtitle: 'Here is your hospital overview for today.',
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              int columns = 1;
              if (constraints.maxWidth >= 900) {
                columns = 4;
              } else if (constraints.maxWidth >= 550) {
                columns = 2;
              }

              return GridView.count(
                crossAxisCount: columns,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: columns == 1 ? 3.2 : 1.65,
                children: const [
                  StatCard(
                    title: 'Total Patients',
                    value: '2,845',
                    note: '+12.8% this month',
                    icon: Icons.people_alt_rounded,
                    color: brandBlue,
                  ),
                  StatCard(
                    title: 'Appointments',
                    value: '186',
                    note: 'Scheduled today',
                    icon: Icons.calendar_month_rounded,
                    color: successGreen,
                  ),
                  StatCard(
                    title: 'Available Doctors',
                    value: '24',
                    note: 'Out of 30 doctors',
                    icon: Icons.medical_services_rounded,
                    color: warningOrange,
                  ),
                  StatCard(
                    title: 'Total Revenue',
                    value: '₹4.8L',
                    note: 'This month',
                    icon: Icons.account_balance_wallet_rounded,
                    color: Color(0xFF8B70D6),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 760) {
                return const Column(
                  children: [
                    AppointmentSummary(),
                    SizedBox(height: 16),
                    DepartmentSummary(),
                  ],
                );
              }

              return const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: AppointmentSummary()),
                  SizedBox(width: 16),
                  Expanded(flex: 2, child: DepartmentSummary()),
                ],
              );
            },
          ),
          const SizedBox(height: 18),
          const ActivitySummary(),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String note;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.note,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(0.12),
                  child: Icon(icon, color: color, size: 20),
                ),
                const Spacer(),
                Icon(Icons.trending_up, color: color, size: 17),
              ],
            ),
            Text(
              value,
              style: const TextStyle(
                color: navy,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: navy,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            Text(
              note,
              style: const TextStyle(color: muted, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  final String title;

  const PanelTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: navy,
        fontSize: 15,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class AppointmentSummary extends StatelessWidget {
  const AppointmentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PanelTitle(title: "Today's Appointments"),
            SizedBox(height: 16),
            AppointmentLine(
              time: '09:00 AM',
              patient: 'Olivia Rhye',
              specialty: 'Cardiology',
              doctor: 'Dr. Michael Chen',
              status: 'Confirmed',
              statusColor: successGreen,
              initials: 'OR',
            ),
            Divider(height: 22),
            AppointmentLine(
              time: '10:30 AM',
              patient: 'Phoenix Baker',
              specialty: 'Neurology',
              doctor: 'Dr. Sarah Wilson',
              status: 'Waiting',
              statusColor: warningOrange,
              initials: 'PB',
            ),
            Divider(height: 22),
            AppointmentLine(
              time: '11:15 AM',
              patient: 'Lana Steiner',
              specialty: 'Orthopedics',
              doctor: 'Dr. James Lee',
              status: 'Confirmed',
              statusColor: successGreen,
              initials: 'LS',
            ),
            Divider(height: 22),
            AppointmentLine(
              time: '12:00 PM',
              patient: 'Demi Wilkinson',
              specialty: 'Dermatology',
              doctor: 'Dr. Emily Davis',
              status: 'Cancelled',
              statusColor: dangerRed,
              initials: 'DW',
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentLine extends StatelessWidget {
  final String time;
  final String patient;
  final String specialty;
  final String doctor;
  final String status;
  final Color statusColor;
  final String initials;

  const AppointmentLine({
    super.key,
    required this.time,
    required this.patient,
    required this.specialty,
    required this.doctor,
    required this.status,
    required this.statusColor,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 68,
          child: Text(
            time,
            style: const TextStyle(
              color: muted,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        CircleAvatar(
          radius: 17,
          backgroundColor: paleBlue,
          child: Text(
            initials,
            style: const TextStyle(
              color: brandBlue,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patient,
                style: const TextStyle(
                  color: navy,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
              Text(
                '$specialty • $doctor',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: muted, fontSize: 9),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.10),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              status,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: statusColor,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DepartmentSummary extends StatelessWidget {
  const DepartmentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PanelTitle(title: 'Department Overview'),
            SizedBox(height: 18),
            ProgressLine(
              title: 'Cardiology',
              percent: 0.82,
              color: brandBlue,
            ),
            SizedBox(height: 17),
            ProgressLine(
              title: 'Neurology',
              percent: 0.64,
              color: successGreen,
            ),
            SizedBox(height: 17),
            ProgressLine(
              title: 'Orthopedics',
              percent: 0.51,
              color: warningOrange,
            ),
            SizedBox(height: 17),
            ProgressLine(
              title: 'Pediatrics',
              percent: 0.38,
              color: Color(0xFF8B70D6),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  final String title;
  final double percent;
  final Color color;

  const ProgressLine({
    super.key,
    required this.title,
    required this.percent,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: navy,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              '${(percent * 100).round()}%',
              style: const TextStyle(color: muted, fontSize: 10),
            ),
          ],
        ),
        const SizedBox(height: 7),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: percent,
            minHeight: 7,
            backgroundColor: pageBackground,
            color: color,
          ),
        ),
      ],
    );
  }
}

class ActivitySummary extends StatelessWidget {
  const ActivitySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PanelTitle(title: 'Recent Activity'),
            SizedBox(height: 15),
            ActivityLine(
              icon: Icons.person_add_alt_1,
              color: brandBlue,
              title: 'New patient registered',
              detail: 'Aarav Sharma was added to the patient directory',
              time: '10 min ago',
            ),
            Divider(height: 20),
            ActivityLine(
              icon: Icons.receipt_long,
              color: successGreen,
              title: 'Payment received',
              detail: 'Invoice INV-2048 payment completed',
              time: '35 min ago',
            ),
            Divider(height: 20),
            ActivityLine(
              icon: Icons.event_available,
              color: warningOrange,
              title: 'Appointment rescheduled',
              detail: 'Olivia Rhye moved to 2:30 PM',
              time: '1 hour ago',
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityLine extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String detail;
  final String time;

  const ActivityLine({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.detail,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 17,
          backgroundColor: color.withOpacity(0.10),
          child: Icon(icon, color: color, size: 17),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: navy,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                detail,
                style: const TextStyle(color: muted, fontSize: 10),
              ),
            ],
          ),
        ),
        Text(time, style: const TextStyle(color: muted, fontSize: 9)),
      ],
    );
  }
}

class PatientRecord {
  final String id;
  final String name;
  final String gender;
  final String age;
  final String department;
  final String status;

  const PatientRecord(
    this.id,
    this.name,
    this.gender,
    this.age,
    this.department,
    this.status,
  );
}

class PatientsPage extends StatefulWidget {
  const PatientsPage({super.key});

  @override
  State<PatientsPage> createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  final TextEditingController searchController = TextEditingController();

  final List<PatientRecord> patients = const [
    PatientRecord(
        'PT-1001', 'Aarav Sharma', 'Male', '28', 'Cardiology', 'Active'),
    PatientRecord(
        'PT-1002', 'Olivia Rhye', 'Female', '34', 'Neurology', 'Active'),
    PatientRecord(
        'PT-1003', 'Phoenix Baker', 'Male', '41', 'Orthopedics', 'Discharged'),
    PatientRecord(
        'PT-1004', 'Lana Steiner', 'Female', '25', 'Dermatology', 'Active'),
    PatientRecord(
        'PT-1005', 'Demi Wilkinson', 'Female', '52', 'Pediatrics', 'Active'),
    PatientRecord(
        'PT-1006', 'Rahul Verma', 'Male', '63', 'Cardiology', 'Discharged'),
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String query = searchController.text.toLowerCase();
    final List<PatientRecord> filtered = patients.where((patient) {
      return '${patient.id} ${patient.name} ${patient.department}'
          .toLowerCase()
          .contains(query);
    }).toList();

    return ContentArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: 'Patient Directory',
            subtitle: 'Manage patient records and information.',
          ),
          const SizedBox(height: 18),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          onChanged: (_) => setState(() {}),
                          decoration: InputDecoration(
                            hintText: 'Search by patient name or ID...',
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: pageBackground,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      FilledButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Patient form can be connected to a database.'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add patient'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(paleBlue),
                      columns: const [
                        DataColumn(label: Text('PATIENT ID')),
                        DataColumn(label: Text('PATIENT NAME')),
                        DataColumn(label: Text('GENDER')),
                        DataColumn(label: Text('AGE')),
                        DataColumn(label: Text('DEPARTMENT')),
                        DataColumn(label: Text('STATUS')),
                      ],
                      rows: filtered.map((patient) {
                        return DataRow(
                          cells: [
                            DataCell(Text(patient.id)),
                            DataCell(Text(patient.name)),
                            DataCell(Text(patient.gender)),
                            DataCell(Text(patient.age)),
                            DataCell(Text(patient.department)),
                            DataCell(StatusLabel(status: patient.status)),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  if (filtered.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(18),
                      child: Text(
                        'No matching patients found.',
                        style: TextStyle(color: muted),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatusLabel extends StatelessWidget {
  final String status;

  const StatusLabel({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final bool active = status == 'Active';
    final Color color = active ? successGreen : muted;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}

class AppointmentRecord {
  final String time;
  final String patient;
  final String doctor;
  final String department;
  final String status;

  const AppointmentRecord(
    this.time,
    this.patient,
    this.doctor,
    this.department,
    this.status,
  );
}

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  String selectedFilter = 'All';

  final List<AppointmentRecord> appointments = const [
    AppointmentRecord('09:00 AM', 'Olivia Rhye', 'Dr. Michael Chen',
        'Cardiology', 'Confirmed'),
    AppointmentRecord('10:30 AM', 'Phoenix Baker', 'Dr. Sarah Wilson',
        'Neurology', 'Waiting'),
    AppointmentRecord('11:15 AM', 'Lana Steiner', 'Dr. James Lee',
        'Orthopedics', 'Confirmed'),
    AppointmentRecord('12:00 PM', 'Demi Wilkinson', 'Dr. Emily Davis',
        'Dermatology', 'Cancelled'),
    AppointmentRecord('02:30 PM', 'Aarav Sharma', 'Dr. Michael Chen',
        'Cardiology', 'Confirmed'),
  ];

  @override
  Widget build(BuildContext context) {
    final List<AppointmentRecord> filtered = appointments.where((appointment) {
      return selectedFilter == 'All' || appointment.status == selectedFilter;
    }).toList();

    return ContentArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: 'Appointments',
            subtitle: 'View and manage patient appointments.',
          ),
          const SizedBox(height: 17),
          Wrap(
            spacing: 8,
            children:
                ['All', 'Confirmed', 'Waiting', 'Cancelled'].map((filter) {
              return ChoiceChip(
                label: Text(filter),
                selected: selectedFilter == filter,
                onSelected: (_) {
                  setState(() {
                    selectedFilter = filter;
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 14),
          Card(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('TIME')),
                  DataColumn(label: Text('PATIENT')),
                  DataColumn(label: Text('DOCTOR')),
                  DataColumn(label: Text('DEPARTMENT')),
                  DataColumn(label: Text('STATUS')),
                ],
                rows: filtered.map((appointment) {
                  Color statusColor = muted;
                  if (appointment.status == 'Confirmed') {
                    statusColor = successGreen;
                  } else if (appointment.status == 'Waiting') {
                    statusColor = warningOrange;
                  } else if (appointment.status == 'Cancelled') {
                    statusColor = dangerRed;
                  }

                  return DataRow(
                    cells: [
                      DataCell(Text(appointment.time)),
                      DataCell(Text(appointment.patient)),
                      DataCell(Text(appointment.doctor)),
                      DataCell(Text(appointment.department)),
                      DataCell(
                        Text(
                          appointment.status,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorRecord {
  final String initials;
  final String name;
  final String specialty;
  final String availability;
  final Color color;

  const DoctorRecord(
    this.initials,
    this.name,
    this.specialty,
    this.availability,
    this.color,
  );
}

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<DoctorRecord> doctors = [
      DoctorRecord(
          'MC', 'Dr. Michael Chen', 'Cardiologist', 'Available', brandBlue),
      DoctorRecord(
          'SW', 'Dr. Sarah Wilson', 'Neurologist', 'Available', successGreen),
      DoctorRecord('JL', 'Dr. James Lee', 'Orthopedic Surgeon',
          'In consultation', warningOrange),
      DoctorRecord('ED', 'Dr. Emily Davis', 'Dermatologist', 'Available',
          Color(0xFF8B70D6)),
      DoctorRecord(
          'AK', 'Dr. Ananya Kumar', 'Pediatrician', 'On leave', dangerRed),
      DoctorRecord(
          'RV', 'Dr. Rahul Verma', 'General Physician', 'Available', brandBlue),
    ];

    return ContentArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: 'Our Doctors',
            subtitle: 'Meet the specialists and check their availability.',
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              int columns = 1;
              if (constraints.maxWidth >= 900) {
                columns = 3;
              } else if (constraints.maxWidth >= 560) {
                columns = 2;
              }

              return GridView.count(
                crossAxisCount: columns,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: columns == 1 ? 2.7 : 1.65,
                children: doctors.map((doctor) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 23,
                            backgroundColor: doctor.color.withOpacity(0.12),
                            child: Text(
                              doctor.initials,
                              style: TextStyle(
                                color: doctor.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            doctor.name,
                            style: const TextStyle(
                              color: navy,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            doctor.specialty,
                            style: const TextStyle(
                              color: muted,
                              fontSize: 11,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor: doctor.color,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                doctor.availability,
                                style: TextStyle(
                                  color: doctor.color,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BillingInvoice {
  final String id;
  final String patient;
  final String date;
  final String amount;
  final String status;

  const BillingInvoice(
    this.id,
    this.patient,
    this.date,
    this.amount,
    this.status,
  );
}

class BillingPage extends StatelessWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<BillingInvoice> invoices = [
      BillingInvoice(
          'INV-2048', 'Olivia Rhye', '07 Nov 2026', '₹2,500', 'Paid'),
      BillingInvoice(
          'INV-2047', 'Phoenix Baker', '07 Nov 2026', '₹4,800', 'Pending'),
      BillingInvoice(
          'INV-2046', 'Lana Steiner', '06 Nov 2026', '₹1,200', 'Paid'),
      BillingInvoice(
          'INV-2045', 'Demi Wilkinson', '06 Nov 2026', '₹3,600', 'Overdue'),
      BillingInvoice('INV-2044', 'Aarav Sharma', '05 Nov 2026', '₹950', 'Paid'),
    ];

    return ContentArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: 'Billing & Payments',
            subtitle: 'Track invoices and patient payments.',
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              int columns = constraints.maxWidth >= 650 ? 3 : 1;

              return GridView.count(
                crossAxisCount: columns,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
                childAspectRatio: columns == 1 ? 3.3 : 2.1,
                children: const [
                  BillingMetric(
                    title: 'Total collected',
                    value: '₹3,84,500',
                    color: successGreen,
                    icon: Icons.check_circle_outline,
                  ),
                  BillingMetric(
                    title: 'Pending payments',
                    value: '₹42,800',
                    color: warningOrange,
                    icon: Icons.pending_actions,
                  ),
                  BillingMetric(
                    title: 'Overdue invoices',
                    value: '12',
                    color: dangerRed,
                    icon: Icons.error_outline,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 17),
          Card(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('INVOICE')),
                  DataColumn(label: Text('PATIENT')),
                  DataColumn(label: Text('DATE')),
                  DataColumn(label: Text('AMOUNT')),
                  DataColumn(label: Text('STATUS')),
                ],
                rows: invoices.map((invoice) {
                  Color color = muted;
                  if (invoice.status == 'Paid') {
                    color = successGreen;
                  } else if (invoice.status == 'Pending') {
                    color = warningOrange;
                  } else {
                    color = dangerRed;
                  }

                  return DataRow(
                    cells: [
                      DataCell(Text(invoice.id)),
                      DataCell(Text(invoice.patient)),
                      DataCell(Text(invoice.date)),
                      DataCell(Text(invoice.amount)),
                      DataCell(
                        Text(
                          invoice.status,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BillingMetric extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const BillingMetric({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.12),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: muted,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    value,
                    style: const TextStyle(
                      color: navy,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
