import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/taskList.dart';
import 'pages/app_timer.dart';
import 'pages/menu.dart';

void main() async {
  //init Hive
  await Hive.initFlutter();
  //open box
  var box = await Hive.openBox("mybox");
  //Device preview
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const HomePage(),
              '/taskList': (context) => const taskList(),
              '/Apptimer': (context) => const Apptimer(),
              '/Menu': (context) => const Menu(),
            },
          )));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'break.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            //fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[100],
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 15.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Menu');
                    },
                    icon: const Icon(
                      color: Colors.black,
                      Icons.settings,
                      size: 30.0,
                    ))
              ],
            ),
          )
        ],
      ),
      body:
          //Homepage
          ListView(
        children: <Widget>[
          //Stats
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 50.0),
            child: Container(
              height: 350.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          //Task List
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 5),
            child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/taskList');
                  },
                  icon: Column(children: const [
                    Icon(
                      Icons.create_outlined,
                      color: Colors.red,
                      size: 40.0,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Task List',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ]),
                  label: const Text(''),
                )),
          ),
          //App Timer
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
            child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Apptimer');
                  },
                  icon: Column(children: const [
                    Icon(
                      color: Colors.purple,
                      Icons.access_time_sharp,
                      size: 40.0,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'App Timer',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    )
                  ]),
                  label: const Text(''),
                )),
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
