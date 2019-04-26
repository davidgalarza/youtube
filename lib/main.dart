import 'package:flutter/material.dart';
import 'package:youtube/youtubePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Youtube Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'https://www.youtube.com/watch?v=jWJUhRLoN4w';

  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(text: this.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            onChanged: (text) {
              this.url = text;
            },
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return YoutubePage(url);
              }));
            },
            child: Text('OPEN PLAYER'),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
