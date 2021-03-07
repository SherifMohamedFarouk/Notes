import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteStateDetails();
  }
}

class NoteStateDetails extends State<NoteDetails> {
  String dropDownValue = "low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descrptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Details'),
      ),
      body: Padding(padding: EdgeInsets.all(10.0),
        child:ListView(
          children: [
            DropdownButton<String>(
              value: dropDownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropDownValue = newValue;
                });
              },
              items: <String>[
                'low',
                'Meduim',
                'High',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: ("Title"),
                hintText: "Enter title note",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter title Description",
              ),
            ),
            Row(
              children: [
                RaisedButton(
                  onPressed: () {},
                  color: Colors.deepPurple,
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.deepPurple,
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ), )
    );
  }
}
