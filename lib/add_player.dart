import 'package:flutter/material.dart';

enum LevelColorLabel {
  space("leave blank", Colors.grey),
  red('Super Hard', Color(0xFFB71C1C)),
  orange('Hard', Colors.deepOrange),
  yellow('Mid', Colors.amber),
  green('Easy', Colors.lightGreen);

  const LevelColorLabel(this.label, this.color);

  final String label;
  final Color color;
}

enum ElementBloodline {
  space("leave blank", Colors.grey),
  wind("Wind", Colors.green),
  thunder("Thunder", Colors.purple),
  fire("Fire", Colors.red),
  water("Water", Colors.blue),
  earth("Earth", Colors.brown);

  const ElementBloodline(this.element, this.color);

  final String element;
  final Color color;
}

class AddPlayerScreen extends StatefulWidget {
  const AddPlayerScreen({super.key});

  @override
  State<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  LevelColorLabel? selectedColor;
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
        title: Text("Add Player", style: TextStyle(color: Colors.white)),
        centerTitle: false,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  height: 8.0,
                  width: 8.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                  child: DropdownButton<LevelColorLabel>(
                    value: selectedColor,
                    hint: Text('Level'),
                    onChanged: (LevelColorLabel? color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    items: LevelColorLabel.values
                        .map<DropdownMenuItem<LevelColorLabel>>(
                            (LevelColorLabel level) {
                      return DropdownMenuItem<LevelColorLabel>(
                        value: level,
                        enabled: level.label.toLowerCase() != 'leave blank',
                        child: Text(
                          level.label,
                          style: TextStyle(color: level.color),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            DropdownButton<ElementBloodline>(
              value: selectedElement,
              hint: Text('Element/Bloodline'),
              onChanged: (ElementBloodline? bloodline) {
                setState(() {
                  selectedElement = bloodline;
                });
              },
              items: ElementBloodline.values
                  .map<DropdownMenuItem<ElementBloodline>>(
                      (ElementBloodline bloodline) {
                return DropdownMenuItem<ElementBloodline>(
                  value: bloodline,
                  enabled: bloodline.element.toLowerCase() != 'leave blank',
                  child: Text(
                    bloodline.element,
                    style: TextStyle(color: bloodline.color),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
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
                Expanded(
                  child: CheckboxListTile(
                    value: isCheck2,
                    activeColor: Colors.red[900],
                    onChanged: (bool? value) {
                      _toggleCheckbox(2, value);
                    },
                    title: Text("E-Lava"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    value: isCheck,
                    activeColor: Colors.red[900],
                    onChanged: (bool? value) {
                      _toggleCheckbox(1, value);
                    },
                    title: Text("HS"),
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    value: isCheck2,
                    activeColor: Colors.red[900],
                    onChanged: (bool? value) {
                      _toggleCheckbox(1, value);
                    },
                    title: Text("DS"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            MaterialButton(
              onPressed: () {
                // Add your action here
              },
              child: Text('Save'),
              color: Colors.red[900],
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
