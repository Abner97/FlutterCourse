import 'package:flutter/material.dart';
import 'SecondPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'First Page is Amazing'),
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
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  GoToSecondPage(BuildContext context,String str) async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>SecondPage(str: str,))
    );
   
    _scaffold.currentState.showSnackBar(SnackBar(
      content: Text("$result"),
      duration: const Duration(seconds: 1),
      )
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
           Container(
        child: RaisedButton(
          child: Text("Abraham"),
          onPressed: () {
           GoToSecondPage(context,"Abraham");
          },
        ),
      ),
       Container(
        child: RaisedButton(
          child: Text("Lily"),
          onPressed: () {
            GoToSecondPage(context, "Lily");
          },
        ),
      ),
        ],
      )

      
    );
  }
}
