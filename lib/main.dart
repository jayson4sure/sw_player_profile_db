import 'package:flutter/material.dart';
import 'package:sw_player_profile_db/dialogs/popup_add_player.dart';

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
  earth("Earth", Colors.brown);

  const ElementBloodline(this.element, this.color);

  final String element;
  final Color color;
}

class _MyHomePageState extends State<MyHomePage> {
  ColorLabel? selectedColor;
  ElementBloodline? selectedElement;
  bool isCheck = false;
  bool isCheck2 = false;
  bool isCheck3 = false;
  bool isCheck4 = false;
  bool isCheck5 = false;
  bool isCheck6 = false;
  bool isCheck7 = false;
  bool isCheck8 = false;
  bool isCheck9 = false;
  bool isCheck10 = false;
  bool isCheck11 = false;
  bool isCheck12 = false;
  bool isCheck13 = false;
  void _toggleCheckbox(int index, bool? value) {
    setState(() {
      switch (index) {
        case 1:
          isCheck = value ?? false;
          break;
        case 2:
          isCheck2 = value ?? false;
          break;
        case 3:
          isCheck3 = value ?? false;
          break;
        case 4:
          isCheck4 = value ?? false;
          break;
        case 5:
          isCheck5 = value ?? false;
          break;
        case 6:
          isCheck6 = value ?? false;
          break;
        case 7:
          isCheck7 = value ?? false;
          break;
        case 8:
          isCheck8 = value ?? false;
          break;
        case 9:
          isCheck9 = value ?? false;
          break;
        case 10:
          isCheck10 = value ?? false;
          break;
        case 11:
          isCheck11 = value ?? false;
          break;
        case 12:
          isCheck12 = value ?? false;
          break;
        case 13:
          isCheck13 = value ?? false;
          break;
      }
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
        // onPressed: AddPlayerPopup.show(context),
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
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            value: isCheck,
                            activeColor: Colors.red[900],
                            onChanged: (bool? value) {
                              _toggleCheckbox(1, value);
                            },
                            title: Text("E-Forest"),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            value: isCheck2,
                            activeColor: Colors.red[900],
                            onChanged: (bool? value) {
                              _toggleCheckbox(2, value);
                            },
                            title: Text("Lava"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            value: isCheck3,
                            activeColor: Colors.red[900],
                            onChanged: (bool? value) {
                              _toggleCheckbox(3, value);
                            },
                            title: Text("HS"),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            value: isCheck4,
                            activeColor: Colors.red[900],
                            onChanged: (bool? value) {
                              _toggleCheckbox(4, value);
                            },
                            title: Text("DS"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            value: isCheck5,
                            activeColor: Colors.red[900],
                            onChanged: (bool? value) {
                              _toggleCheckbox(5, value);
                            },
                            title: Text("BT"),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            value: isCheck6,
                            activeColor: Colors.red[900],
                            onChanged: (bool? value) {
                              _toggleCheckbox(6, value);
                            },
                            title: Text("Elec"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            value: isCheck7,
                            activeColor: Colors.red[900],
                            onChanged: (bool? value) {
                              _toggleCheckbox(7, value);
                            },
                            title: Text("Mangekyou"),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            value: isCheck8,
                            activeColor: Colors.red[900],
                            onChanged: (bool? value) {
                              _toggleCheckbox(8, value);
                            },
                            title: Text("Icy"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            value: isCheck9,
                            activeColor: Colors.red[900],
                            onChanged: (bool? value) {
                              _toggleCheckbox(9, value);
                            },
                            title: Text("Light"),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            value: isCheck10,
                            activeColor: Colors.red[900],
                            onChanged: (bool? value) {
                              _toggleCheckbox(10, value);
                            },
                            title: Text("Darkness"),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CheckboxListTile(
                                value: isCheck11,
                                activeColor: Colors.red[900],
                                onChanged: (bool? value) {
                                  _toggleCheckbox(11, value);
                                },
                                title: Text("FTG"),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              child: CheckboxListTile(
                                value: isCheck12,
                                activeColor: Colors.red[900],
                                onChanged: (bool? value) {
                                  _toggleCheckbox(12, value);
                                },
                                title: Text("Tremor"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CheckboxListTile(
                                value: isCheck13,
                                activeColor: Colors.red[900],
                                onChanged: (bool? value) {
                                  _toggleCheckbox(13, value);
                                },
                                title: Text("Lunar Fang"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    MaterialButton(
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ));
  }
}
