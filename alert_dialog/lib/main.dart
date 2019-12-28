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

class _MyHomePageState extends State<MyHomePage> {
  Future<void> OpenAlert() async{
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Phone Alert"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Your Phone is too hot!!!"),
                Text("Put it in Water xD")
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Continue"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
       child: IconButton(
         icon: Icon(Icons.add_alert),
         onPressed: (){
           OpenAlert();
         }
         ,
       ),
        
      ),
      
    );
  }
}
