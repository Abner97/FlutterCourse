import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
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
        
        decoration: BoxDecoration(color: val,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
              
              child: Text("Reverse"),
              onPressed: (){
                controller.reverse();
              },
            ),
            RaisedButton(
              child: Text("Stop"),
              onPressed: (){
                  controller.stop();
              },
            ),

          ],
        ),

      )
      
    );
  }
}
