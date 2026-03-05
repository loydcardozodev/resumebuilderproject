import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/add_section.dart';
import 'package:resumerbuilder/ui/details/customdrawer.dart';

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Project')),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Project title',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter project title'),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Project description',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter project description',
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Project features',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter project feature'),
              ),
              SizedBox(height: 10),
              AddSection(),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Technology used',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Technology used'),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Github link',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter github link'),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Live link',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter live link'),
              ),

              SizedBox(height: 10),

              AddSection(),

              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.go(Routes.keySkills);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: const Center(
                          child: Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.push(Routes.interest);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
