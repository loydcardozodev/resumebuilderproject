import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/config/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Builder'),
        actions: [
          GestureDetector(
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(Assets.cvmaker),
            ),
            onTap: () {
              context.push(Routes.profile);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.push(Routes.createtemp);
                },
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              Assets.cvmaker,
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Create CV'),
                          Text('step by step cv creation'),
                        ],
                      ),
                      Column(children: [Icon(Icons.add)]),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'My Resume',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey,
                    height: 100,
                    child: Center(child: Text("Item $index")),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
