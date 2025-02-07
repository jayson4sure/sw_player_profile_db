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
      home: const MyHomePage(title: 'SW Info'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum ColorLabel {
  red('Red', Color(0xFFB71C1C)),
  orange('Orange', Colors.deepOrange),
  yellow('Yellow', Colors.amber),
  green('Green', Colors.lightGreen);

  const ColorLabel(this.label, this.color);

  final String label;
  final Color color;
}

class _MyHomePageState extends State<MyHomePage> {
  ColorLabel? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
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
              '0',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: popupAddPlayer,
        tooltip: 'Add',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void popupAddPlayer() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Add"),
              // title: Text("Add Player"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name",
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  DropdownMenu<ColorLabel>(
                    initialSelection: null,
                    requestFocusOnTap: false,
                    label: const Text('Level'),
                    onSelected: (ColorLabel? color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    dropdownMenuEntries: ColorLabel.values
                        .map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
                      return DropdownMenuEntry<ColorLabel>(
                        value: color,
                        label: color.label,
                        enabled: color.label != 'Grey',
                        style: MenuItemButton.styleFrom(
                          foregroundColor: color.color,
                        ),
                      );
                    }).toList(),
                  ),
                  MaterialButton(
                    onPressed: () {},
                  ),
                ],
              ),
            ));
  }
}
