import 'package:flutter/material.dart';

class Resumepreview extends StatefulWidget {
  const Resumepreview({super.key});

  @override
  State<Resumepreview> createState() => _ResumepreviewState();
}

class _ResumepreviewState extends State<Resumepreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resume Preview')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 450,
                  width: 390,
                  child: Card(color: Colors.grey),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Resume Preview',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Review your resume before downloading or sharing. Ensure all sections are complete and accurate',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Customize Theme',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 9,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 10),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Download Options',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                child: Center(child: Text('pdf')),
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
