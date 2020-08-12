import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyAppLW(),
    ),
  );
}

class MyAppLW extends StatefulWidget {
  @override
  _MyAppLWState createState() => _MyAppLWState();
}

class _MyAppLWState extends State<MyAppLW> {
  var db = ["vimal", "jack", "krish", "linux"];
  var index = 0;
  lwclick() {
    setState(() {
      index += 1;
    });

    print('clicked ...');
    print("indexed changed");
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LW'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Text(db[index % db.length]),
              FlatButton(onPressed: lwclick, child: Text('click here')),
              Text("third"),
            ],
          ),
        ),
      ),
    );
  }
}
