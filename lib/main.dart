import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFB71C1C)),
        useMaterial3: true,

        // * FLOATING ACTION BUTTON THEME
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 2, // elevation
          backgroundColor: Colors.red[900], // the background color
        ),
      ),
      home: const MyHomePage(title: 'SW Players Info'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: popupAddPlayer,
        tooltip: 'Add Player',
        child: const Icon(Icons.add, color: Colors.white,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
  }

  void popupAddPlayer() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Add Player"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "IGN",
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                  ),
                ],
              ),
            ));
  }
}
