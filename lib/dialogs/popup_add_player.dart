import 'package:flutter/material.dart';
import 'popup_add_player.dart';

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

class AddPlayerPopup {
  static void show(BuildContext context) {
    bool isChecked = false;
    bool isChecked2 = false;
    ColorLabel? selectedColor;
    ElementBloodline? selectedElement;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Add"),
        content: Container(
          width: double.infinity,
          padding: EdgeInsets.all(5),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
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
                      SizedBox(width: 8.0),
                      Expanded(
                        child: DropdownButton<ColorLabel>(
                          value: selectedColor,
                          hint: Text('Level'),
                          onChanged: (ColorLabel? color) {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          items: ColorLabel.values
                              .map<DropdownMenuItem<ColorLabel>>(
                                  (ColorLabel color) {
                            return DropdownMenuItem<ColorLabel>(
                              value: color,
                              child: Text(color.toString().split('.').last),
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
                        child: Text(bloodline.toString().split('.').last),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  Text("Secret Talents"),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          value: isChecked,
                          activeColor: Colors.red[900],
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                          title: Text(isChecked ? 'Checked' : 'Unchecked'),
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          value: isChecked2,
                          activeColor: Colors.red[900],
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked2 = value ?? false;
                            });
                          },
                          title: Text(isChecked2 ? 'Checked' : 'Unchecked'),
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {
                      // Add your action here
                    },
                    child: Text('Save'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
