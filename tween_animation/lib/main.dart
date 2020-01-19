import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller2;
  Animation<Color> animation;
  Animation<Color> animation2;
  Color val;

  _MyHomePageState() {
    this.controller = AnimationController(
      duration: Duration(
        seconds: 4,
      ),
      vsync: this,
    );

    this.controller2 = AnimationController(
      duration: Duration(
        seconds: 4,
      ),
      vsync: this,
    );

    animation = ColorTween(
            begin: Color.fromRGBO(255, 0, 0, 1.0),
            end: Color.fromRGBO(0, 0, 255, 1.0))
        .animate(this.controller)
          ..addListener(() {
            setState(() {
              val = animation.value;
            });
          });
    
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation2 = ColorTween(
                begin: val,
                end: Color.fromRGBO(0, 255, 0, 1.0))
            .animate(this.controller2)
              ..addListener(() {
                setState(() {
                  val = animation2.value;
                });
              });
              this.controller2.forward();
      }
     
    });
     this.controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(color: val),
      ),
    );
  }
}
