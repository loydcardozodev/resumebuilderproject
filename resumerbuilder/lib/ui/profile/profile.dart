import 'package:flutter/material.dart';
import 'package:resumerbuilder/config/assets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Center(
                child: Image.asset(Assets.cvmaker, height: 100, width: 100),
              ),

              SizedBox(height: 10),

              Align(alignment: Alignment.centerLeft, child: Text('Name')),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Name'),
              ),

              SizedBox(height: 10),

              Align(alignment: Alignment.centerLeft, child: Text('Email')),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Email'),
              ),

              SizedBox(height: 10),

              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'Delete Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
