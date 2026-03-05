import 'package:adminresume/ui/login.dart';
import 'package:adminresume/ui/signup.dart';
import 'package:flutter/material.dart';
import 'package:adminresume/ui/template_management.dart';
import 'package:adminresume/ui/user_management.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const DashboardHome(),
    const TemplateManagement(),
    const UserManagement(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /// ================= SIDEBAR =================
          Container(
            width: 250,
            color: const Color(0xFF1E1E2D),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Resume Builder Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                _buildMenuItem(
                  icon: Icons.dashboard,
                  title: "Dashboard",
                  index: 0,
                ),

                _buildMenuItem(icon: Icons.pages, title: "Templates", index: 1),

                _buildMenuItem(icon: Icons.person, title: "Users", index: 2),
              ],
            ),
          ),

          /// ================= CONTENT AREA =================
          Expanded(
            child: Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.all(24),
              child: pages[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    bool isSelected = selectedIndex == index;

    return ListTile(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      leading: Icon(icon, color: isSelected ? Colors.blue : Colors.white),
      title: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.blue : Colors.white),
      ),
    );
  }
}

/// ================= DASHBOARD HOME PAGE =================

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Dashboard",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Sign up"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Login"),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDegSnM1BupqlLkwOfnzKYPM7Hdkl3nvtmQw&s',
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 30),

        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: const [
            StatCard(title: "Total Users", value: "120", icon: Icons.person),
            StatCard(title: "Total Templates", value: "8", icon: Icons.pages),
            StatCard(
              title: "Resumes Created",
              value: "350",
              icon: Icons.description,
            ),
            StatCard(
              title: "New Users (Month)",
              value: "25",
              icon: Icons.trending_up,
            ),
          ],
        ),
      ],
    );
  }
}

/// ================= STAT CARD =================

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey.shade300)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(icon, size: 40, color: Colors.blue),
        ],
      ),
    );
  }
}
