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

  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentStep = 0;
  List<Step> steps = <Step>[
    Step(
      title: Text("Step 1"),
      content: Text("Instructions for step 1")
    ),
    Step(
      title: Text("Step 2"),
      content: Text("Instructions for step 2")
    ),
    Step(
      title: Text("Step 3"),
      content: Text("Instructions for step 3")
    ),
    Step(
      title: Text("Step 4"),
      content: Text("Instructions for step 4")
    ),
    Step(
      title: Text("Step 5"),
      content: Text("Instructions for step 5")
    ),
    Step(
      title: Text("Step 6"),
      content: Text("Instructions for step 6")
    ),
    Step(
      title: Text("Step 7"),
      content: Text("Instructions for step 7")
    ),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
           title: Text(widget.title),
      ),
      body: Stepper(
        currentStep: _currentStep,
        steps: steps,
        onStepContinue: (){
          
         setState(() {
           _currentStep++;
           if (_currentStep==steps.length){
             _currentStep=0;
           }
           
         });
        },
        onStepCancel: (){
          setState(() {
          
              _currentStep--;
            if(_currentStep<0){
              _currentStep=0;
            }
            
          });
        },
      ),
         );
  }
}
