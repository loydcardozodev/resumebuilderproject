import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';

class CustomDrawer extends StatelessWidget {
  // final String title;
  // final String currentRoute;

  const CustomDrawer({
    super.key,
    // required this.title,
    // required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text('data')),

          ListTile(
            leading: Icon(Icons.person_outline),
            onTap: () {
              GoRouter.of(context).push(Routes.personalData);
            },
            title: Text('Personal data'),
          ),
          ListTile(
            leading: Icon(Icons.local_post_office),
            onTap: () {
              GoRouter.of(context).push(Routes.career);
            },
            title: Text('Career'),
          ),
          ListTile(
            leading: Icon(Icons.book),
            onTap: () {
              GoRouter.of(context).push(Routes.education);
            },
            title: Text('Education'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          Text('Optional Sections'),
          ListTile(
            leading: Icon(Icons.key),
            onTap: () {
              GoRouter.of(context).push(Routes.keySkills);
            },
            title: Text('Key Skills'),
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            onTap: () {
              GoRouter.of(context).push(Routes.projects);
            },
            title: Text('Projects'),
          ),
          ListTile(
            leading: Icon(Icons.sports_gymnastics),
            onTap: () {
              GoRouter.of(context).push(Routes.interest);
            },
            title: Text('Interest'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            onTap: () {
              GoRouter.of(context).push(Routes.references);
            },
            title: Text('References'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
        ],
      ),
    );
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
}
