import 'package:dynamic_text_size/temp.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

void main() {
  runApp(MyApp());
}

final keyData = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UpgradeAlert(
        child: Stack(
          children: const [
            CustomDrawer(),
            MyHomePage(),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double x = 0;
  double y = 0;
  double s = 1;
  bool _isDrawerOpened = false;

  void openDrawer() {
    setState(() {
      x = 250;
      y = 150;
      s = 0.6;
      _isDrawerOpened = true;
    });
  }

  void closeDrawer() {
    setState(() {
      x = 0;
      y = 0;
      s = 1;
      _isDrawerOpened = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.grey[900],
      curve: Curves.easeInOutBack,
      transform: Matrix4.translationValues(x, y, 0),
      duration: const Duration(seconds: 1),
      child: buildScaffold(),
    );
  }




  Widget buildScaffold() {
    return Scaffold(
      appBar: buildCustomAppBar(),
      backgroundColor: Colors.black54,
      body: const Center(
        child: Text("Animated Drawer",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            )),
      ),
    );
  }

  AppBar buildCustomAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text("Drawer Demo"),
      leading: IconButton(
        icon: Icon(
          _isDrawerOpened ? Icons.clear : Icons.menu,
          color: Colors.white,
        ),
        onPressed: _isDrawerOpened ? closeDrawer : openDrawer,
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  const EdgeInsets.only(top: 60.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              ListTile(
                  title: Text("Home", style: TextStyle(fontSize: 22)),
                  leading: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.black,
                  )),
              GestureDetector(
                onTap: () => Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => TempData(context: ctx)), (route) => false),
                child: ListTile(
                    title:
                        Text("Notification", style: TextStyle(fontSize: 22)),
                    leading: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.black,
                    )),
              ),
            ]),
      ),
    );
  }
}