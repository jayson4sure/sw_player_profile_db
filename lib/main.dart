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
  space("", Colors.grey),
  red('Super Hard', Color(0xFFB71C1C)),
  orange('Hard', Colors.deepOrange),
  yellow('Mid', Colors.amber),
  green('Easy', Colors.lightGreen);

  const ColorLabel(this.label, this.color);

  final String label;
  final Color color;
}

enum ElementBloodline {
  space("", Colors.grey),
  wind("Wind", Colors.green),
  thunder("Thunder", Colors.purple),
  fire("Fire", Colors.red),
  water("Water", Colors.blue),
  earth("Earth", Colors.brown),
  blank("Leave blank if not sure", Colors.grey);

  const ElementBloodline(this.element, this.color);

  final String element;
  final Color color;
}

class _MyHomePageState extends State<MyHomePage> {
  ColorLabel? selectedColor;
  ElementBloodline? selectedElement;
  bool isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      isChecked = value ?? false; // Null check and update state
    });
  }

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
              content: Container(
                width: double.infinity,
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Name",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: DropdownMenu<ColorLabel>(
                            // width: double.infinity,
                            initialSelection: null,
                            requestFocusOnTap: false,
                            label: const Text('Level'),
                            onSelected: (ColorLabel? color) {
                              setState(() {
                                selectedColor = color;
                              });
                            },
                            dropdownMenuEntries: ColorLabel.values
                                .map<DropdownMenuEntry<ColorLabel>>(
                                    (ColorLabel color) {
                              return DropdownMenuEntry<ColorLabel>(
                                value: color,
                                label: color.label,
                                enabled:
                                    color.label.toLowerCase() != 'Leave Blank',
                                style: MenuItemButton.styleFrom(
                                  foregroundColor: color.color,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    DropdownMenu<ElementBloodline>(
                      // width: double.infinity,
                      initialSelection: null,
                      requestFocusOnTap: false,
                      label: const Text('Element/Bloodline'),
                      onSelected: (ElementBloodline? bloodline) {
                        setState(() {
                          selectedElement = bloodline;
                        });
                      },
                      dropdownMenuEntries: ElementBloodline.values
                          .map<DropdownMenuEntry<ElementBloodline>>(
                              (ElementBloodline bloodline) {
                        return DropdownMenuEntry<ElementBloodline>(
                          value: bloodline,
                          label: bloodline.element,
                          enabled: bloodline.element.toLowerCase() !=
                              'leave blank if not sure',
                          style: MenuItemButton.styleFrom(
                            foregroundColor: bloodline.color,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text("Secret Talents"),
                    Checkbox(
                      value: isChecked,
                      activeColor: Colors.red[900],
                      onChanged: _toggleCheckbox,
                    ),
                    // Displaying whether the checkbox is checked or not
                    Text(isChecked ? 'Checked' : 'Unchecked'),
                    MaterialButton(
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ));
  }
}
