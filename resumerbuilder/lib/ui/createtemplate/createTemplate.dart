import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';

class Createtemplate extends StatefulWidget {
  const Createtemplate({super.key});

  @override
  State<Createtemplate> createState() => _CreatetemplateState();
}

class _CreatetemplateState extends State<Createtemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Resume')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 450,
                  width: 390,
                  child: Card(color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Choose a Template',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                height: 180,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 180,
                      width: 100,
                      child: Card(color: Colors.grey),
                    ),
                    Container(
                      height: 180,
                      width: 100,
                      child: Card(color: Colors.grey),
                    ),
                    Container(
                      height: 180,
                      width: 100,
                      child: Card(color: Colors.grey),
                    ),
                    Container(
                      height: 180,
                      width: 100,
                      child: Card(color: Colors.grey),
                    ),
                    Container(
                      height: 180,
                      width: 100,
                      child: Card(color: Colors.grey),
                    ),
                    Container(
                      height: 180,
                      width: 100,
                      child: Card(color: Colors.grey),
                    ),
                    Container(
                      height: 180,
                      width: 100,
                      child: Card(color: Colors.grey),
                    ),
                    Container(
                      height: 180,
                      width: 100,
                      child: Card(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.push(Routes.personalData);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'Create Resume',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
