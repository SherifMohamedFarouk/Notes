import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  String appBarTittle;

  NoteDetails(this.appBarTittle);

  @override
  State<StatefulWidget> createState() {
    return NoteStateDetails(this.appBarTittle);
  }
}

class NoteStateDetails extends State<NoteDetails> {
  String appBarTittle;

  String dropDownValue = "low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descrptionController = TextEditingController();

  NoteStateDetails(this.appBarTittle);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  () {
        onBackScreen();
      },
      child:Scaffold(
        appBar: AppBar(
          title: Text(appBarTittle),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              DropdownButton<String>(
                value: dropDownValue,
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
                  'High',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelText: ("Title"),
                    hintText: "Enter title note",
                  ),
                  controller: titleController,
                  onChanged: (value) {
                    debugPrint("value changed");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    hintText: "Enter title Description",
                  ),
                  controller: descrptionController,
                  onChanged: (value) {
                    debugPrint("value changed");
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          debugPrint("save was clicked");
                        });
                      },
                      color: Colors.deepPurple,
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                      child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        debugPrint("delete was clicked");
                      });
                    },
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ],
              )
            ],
          ),
        )));
  }
  void onBackScreen(){
    Navigator.pop(context);
  }
}
