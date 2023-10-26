import 'package:dynamic_text_size/main.dart';
import 'package:flutter/material.dart';

class TempData extends StatefulWidget {
  final BuildContext context;
   TempData({Key? key, required this.context}) : super(key: key);

  @override
  State<TempData> createState() => _TempDataState();
}

class _TempDataState extends State<TempData> {

  final snackBar = SnackBar(
    content: const Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
               Icons.menu,
              color: Colors.white,
            ),
            // onPressed: _isDrawerOpened ? closeDrawer : openDrawer
            onPressed: (){},
          ),
        ),
      body: Center(
        child: MaterialButton(
          onPressed: (){
            print(keyData.currentContext == null );
            print(context.hashCode);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text("Tap"),
        ),
      ),
    );
  }
}
