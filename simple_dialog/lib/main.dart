import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
enum Movies{CaptainMarvel, Shazam}

class _MyHomePageState extends State<MyHomePage> {
Future<void>OpenDialog() async {
  switch(await showDialog(
    context: context,
    builder: (BuildContext context){
      return SimpleDialog(
        title: const Text("Select A Movie"),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,Movies.CaptainMarvel);
            },
            child: const Text("Captain Marvel"),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,Movies.Shazam);
            },
            child: const Text("Shazam"),
          )
        ],
        );
    }
  )){
    case Movies.CaptainMarvel:
      print("Captain Marvel selected");
      break;
    case Movies.Shazam:
      print("Shazam Selected");
      break;
  }
}  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
        child: IconButton(
        icon: Icon(Icons.play_circle_filled),
        onPressed:(){
          OpenDialog();
        } ,
        ),
        
      ),
      
    );
  }
}
