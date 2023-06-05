import 'package:flutter/material.dart';
import 'package:my_fight_companion/database_helper.dart';
//import 'package:sqflite/sqflite.dart';

class NoteCreationPage extends StatefulWidget {
  const NoteCreationPage({Key? key}) : super(key: key);

  @override
  State<NoteCreationPage> createState() => _NoteCreationPageState();
}

class _NoteCreationPageState extends State<NoteCreationPage> {
  final TextEditingController _noteContentController = TextEditingController();

  @override
  void dispose() {
    _noteContentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noted'),
      ),
      body: Container(
        height: 200, // Set a maximum height for the TextField
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'This is a new note!',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  controller:
                      _noteContentController, // Attach the controller - lets me grab text from a variable name
                  maxLines: null, // Allow unlimited lines of text
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    hintText: 'Type here...',
                    labelText: 'New Note',
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Colors.black, // Set background color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_noteContentController.text.isNotEmpty) {
            DatabaseHelper().saveNote(_noteContentController.text);
          }
        },
        tooltip: 'Save',
        child: const Icon(Icons.sailing),
      ),
    );
  }
}
