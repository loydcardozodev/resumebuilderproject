import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text(
              'Resume Builder',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          _tile(
            context,
            Icons.person_outline,
            'Personal Data',
            Routes.personalData,
            currentRoute,
          ),
          _tile(
            context,
            Icons.work_outline,
            'Experience',
            Routes.career,
            currentRoute,
          ),
          _tile(
            context,
            Icons.school_outlined,
            'Education',
            Routes.education,
            currentRoute,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              'Optional Sections',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          _tile(
            context,
            Icons.key,
            'Key Skills',
            Routes.keySkills,
            currentRoute,
          ),
          _tile(
            context,
            Icons.bookmark_outline,
            'Projects',
            Routes.projects,
            currentRoute,
          ),
          _tile(
            context,
            Icons.sports_gymnastics,
            'Interests',
            Routes.interest,
            currentRoute,
          ),
          _tile(
            context,
            Icons.people_outline,
            'References',
            Routes.references,
            currentRoute,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
        ],
      ),
    );
  }

  Widget _tile(
    BuildContext context,
    IconData icon,
    String title,
    String route,
    String currentRoute,
  ) {
    final isActive = currentRoute == route;
    return ListTile(
      leading: Icon(icon, color: isActive ? Colors.black : null),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isActive,
      selectedTileColor: Colors.grey[200],
      onTap: () {
        Navigator.pop(context); // close drawer first
        if (!isActive) context.push(route);
      },
    );
  }
}

// Widget _buildTile(
//   BuildContext context, {
//   required IconData icon,
//   required String title,
//   required String route,
// }) {
//   return ListTile(
//     leading: Icon(icon),
//     title: Text(title),
//     selected: currentRoute == route,
//     onTap: () {
//       if (currentRoute != route) {
//         Navigator.pushReplacementNamed(context, route);
//       }
//     },
//   );
// }
