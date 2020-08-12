import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  var cmd;
  var webdata;

  myweb(cmd) async {
    var url = "http://192.168.0.162/cgi-bin/web.py?x=${cmd}";
    var r = await http.get(url);

    setState(() {
      webdata = r.body;
    });

    // print(webdata);
  }

/*
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
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LW'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              Text("Enter ur linux cmd :"),
              TextField(
                onChanged: (value) {
                  cmd = value;
                },
              ),
              FlatButton(
                  onPressed: () {
                    myweb(cmd);
                  },
                  child: Text('click here')),
              Text(webdata ?? "output is coming .."),
            ],
          ),
        ),
      ),
    );
  }
}
