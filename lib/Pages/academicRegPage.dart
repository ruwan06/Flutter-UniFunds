import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:uni_funds/Components/background.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

List<String> selectedValues = [];

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

Map<String, List<String>> data = {
  "clubs": [
    "Electronic Club",
    "Gaming Club",
    "Gardening Club",
    "Media Club",
    "LEO Club"
  ],
  "societies": [
    "Astronomical Society",
    "Buddhist Society",
    "Entrepreneurship Society",
    "Dancing Society",
    "Computer Society"
  ],
  "teams": ["Rangamadale Api Rangakala Ekamuthuwa", "tech"]
};

class AcademicReg extends StatefulWidget {
  const AcademicReg({Key? key}) : super(key: key);
  @override
  _AcademicReg createState() => _AcademicReg();
}

class _AcademicReg extends State<AcademicReg> {
  bool isChecked = false;
  @override
  Widget build(Object context) {
    return MaterialApp(
        home: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Background(),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Visibility(
                    visible: isChecked,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black12,
                      ),
                      padding: EdgeInsets.only(
                          bottom: 50.0, left: 10.0, right: 10.0),
                      child: Column(
                        children: [
                          ...data.entries.map((entry) {
                            return MyMultiSelectDropdown(
                                entry.key.capitalize(), entry.value);
                          }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  MyCheckbox(
                      isChecked: isChecked, onChecked: _onCheckboxChanged),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your button click logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    icon: Icon(
                        Icons.card_giftcard), // Icon to the left of the text
                    label: Text('Continue'),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  void _onCheckboxChanged(bool value) {
    setState(() {
      isChecked = value;
    });
  }
}

class MyMultiSelectDropdown extends StatefulWidget {
  final String? name;
  final List<String>? options;

  MyMultiSelectDropdown(this.name, this.options);
  @override
  _MyMultiSelectDropdownState createState() => _MyMultiSelectDropdownState();
}

class _MyMultiSelectDropdownState extends State<MyMultiSelectDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(
        //   'Selected Values: ${selectedValues.isEmpty ? 'None' : selectedValues.join(', ')}',
        //   style: TextStyle(fontSize: 16),
        // ),
        SizedBox(height: 30),
        Container(
          child: MultiSelectDialogField<String>(
            items: widget.options!
                .map((e) => MultiSelectItem<String>(e, e))
                .toList(),
            initialValue: selectedValues,
            title: Text("Select ${widget.name ?? ""}"),
            selectedColor: Colors.green,
            unselectedColor: Colors.grey[300],
            buttonIcon: Icon(Icons.keyboard_arrow_down),
            buttonText: Text("Select ${widget.name ?? ""}"),
            onConfirm: (values) {
              if (values == null) return;
              setState(() {
                selectedValues
                    .removeWhere((item) => widget.options!.contains(item));
                selectedValues.addAll(values);
                print("values => $selectedValues");
              });
            },
          ),
          width: 300.0,
        ),
      ],
    );
  }
}

class MyCheckbox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChecked;

  const MyCheckbox({Key? key, required this.isChecked, required this.onChecked})
      : super(key: key);
  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: widget.isChecked,
          onChanged: (value) {
            widget.onChecked(value ?? false);
          },
        ),
        Container(
          width: 250.0,
          child: Text(
            'Do you hold a position in a society or any organization, such as a club?',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
