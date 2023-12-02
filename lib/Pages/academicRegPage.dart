import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:uni_funds/Components/background.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AcademicReg extends StatelessWidget {
  const AcademicReg({super.key});

  @override
  Widget build(Object context) {
    return MaterialApp(
        home: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyMultiSelectDropdown(),
              SizedBox(
                height: 30.0,
              ),
              MyCheckbox(),
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
                icon: Icon(Icons.card_giftcard), // Icon to the left of the text
                label: Text('Continue'),
              ),
            ],
          )
        ],
      ),
    ));
  }
}

class MyMultiSelectDropdown extends StatefulWidget {
  @override
  _MyMultiSelectDropdownState createState() => _MyMultiSelectDropdownState();
}

class _MyMultiSelectDropdownState extends State<MyMultiSelectDropdown> {
  List<String> selectedValues = [];
  List<String> options = [
    'Electronic Club',
    'Gaming Club',
    'Media Club',
    'Rangamadale Api Rangakala Ekamuthuwa',
    'tech',
    'Buddhist Society',
    'Computer Society'
  ];

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
            items: options.map((e) => MultiSelectItem<String>(e, e)).toList(),
            initialValue: selectedValues,
            title: Text("Select Options"),
            selectedColor: Colors.green,
            unselectedColor: Colors.grey[300],
            buttonIcon: Icon(Icons.keyboard_arrow_down),
            buttonText: Text("Select options"),
            onConfirm: (values) {
              if (values == null) return;
              setState(() {
                selectedValues = values;
              });
            },
          ),
          width: 300.0,
        ),
        Container(
          child: MultiSelectDialogField<String>(
            items: options.map((e) => MultiSelectItem<String>(e, e)).toList(),
            initialValue: selectedValues,
            title: Text("Select Options"),
            selectedColor: Colors.green,
            unselectedColor: Colors.grey[300],
            buttonIcon: Icon(Icons.keyboard_arrow_down),
            buttonText: Text("Select options"),
            onConfirm: (values) {
              if (values == null) return;
              setState(() {
                selectedValues = values;
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
  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text('Accept Terms and Conditions'),
      ],
    );
  }
}
