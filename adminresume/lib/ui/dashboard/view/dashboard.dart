import 'package:adminresume/routing/routes.dart';
import 'package:adminresume/ui/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:adminresume/ui/template/view/template_management.dart';
import 'package:adminresume/ui/user/view/user_management.dart';
import 'package:adminresume/ui/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
          // ── Sidebar ──────────────────────────────────────────────────────
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
                  title: 'Dashboard',
                  index: 0,
                ),
                _buildMenuItem(icon: Icons.pages, title: 'Templates', index: 1),
                _buildMenuItem(icon: Icons.person, title: 'Users', index: 2),
                const Spacer(),
                // ── Logout ──────────────────────────────────────────────
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white70),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () async {
                    await context.read<AdminAuthViewModel>().signOut();
                    if (context.mounted) context.go(Routes.login);
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // ── Content Area ─────────────────────────────────────────────────
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
    final isSelected = selectedIndex == index;
    return ListTile(
      onTap: () => setState(() => selectedIndex = index),
      leading: Icon(icon, color: isSelected ? Colors.blue : Colors.white),
      title: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.blue : Colors.white),
      ),
    );
  }
}

// ── Dashboard Home ────────────────────────────────────────────────────────────

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardViewModel>().loadStats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(
      builder: (context, vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──────────────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDegSnM1BupqlLkwOfnzKYPM7Hdkl3nvtmQw&s',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ── Stats ────────────────────────────────────────────────────
            if (vm.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (vm.errorMessage != null)
              _ErrorBanner(
                message: vm.errorMessage!,
                onRetry: () => vm.loadStats(),
              )
            else
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  StatCard(
                    title: 'Total Users',
                    value: vm.totalUsers.toString(),
                    icon: Icons.person,
                  ),
                  StatCard(
                    title: 'Total Templates',
                    value: vm.totalTemplates.toString(),
                    icon: Icons.pages,
                  ),
                  StatCard(
                    title: 'Resumes Created',
                    value: vm.totalResumes.toString(),
                    icon: Icons.description,
                  ),
                  StatCard(
                    title: 'New Users (Month)',
                    value: vm.newUsersThisMonth.toString(),
                    icon: Icons.trending_up,
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}

// ── Stat Card ─────────────────────────────────────────────────────────────────

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
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

// ── Error Banner ──────────────────────────────────────────────────────────────

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.error_outline, color: Colors.red),
        const SizedBox(width: 8),
        Expanded(
          child: Text(message, style: const TextStyle(color: Colors.red)),
        ),
        TextButton(onPressed: onRetry, child: const Text('Retry')),
      ],
    );
  }
}
