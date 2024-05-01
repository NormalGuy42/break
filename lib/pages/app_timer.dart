import 'package:flutter/material.dart';

class Apptimer extends StatefulWidget {
  const Apptimer({super.key});

  @override
  State<Apptimer> createState() => _ApptimerState();
}

class _ApptimerState extends State<Apptimer> {
  int goal = 0;
  List<Apps> timers = [
    Apps('Social',
        ['Youtube', 'Facebook', 'Instagram', 'Snapchat', 'Twitter', 'Roblox']),
    Apps('Games', ['Dragn\'n Boom', 'King Tongue']),
    Apps('Productivity', ['BlockerX', 'Word']),
    Apps('Others', ['Settings'])
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(
              color: Colors.purple,
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Container(
                  height: 50.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black)),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Goal $goal',
                        style: const TextStyle(
                            color: Colors.black, fontSize: 20.0),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            //App Category
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: timers.length,
              itemBuilder: (context, index) {
                return AppCategory(
                  name: timers[index].category,
                  list: timers[index].appList,
                );
              },
            )
          ],
        ));
  }
}

class AppCategory extends StatelessWidget {
  final String name;
  final List list;
  AppCategory({super.key, required this.name, required this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Name of the Category
            Text(
              name,
              style: const TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 10.0,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0))),
            ),
            //App Categories

            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0))),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      constraints: const BoxConstraints(minHeight: 50.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white),
                      child: Container(
                        child: Center(
                          child: Text(list[index]),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Apps {
  String category;
  List appList;
  Apps(this.category, this.appList);
}
