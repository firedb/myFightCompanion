import 'package:flutter/material.dart';

class NoteCreationPage extends StatefulWidget {
  const NoteCreationPage({Key? key}) : super(key: key);

  @override
  State<NoteCreationPage> createState() => _NoteCreationPageState();
}

class _NoteCreationPageState extends State<NoteCreationPage> {
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
          children: const <Widget>[
            Text(
              'This is a new note!',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  maxLines: null, // Allow unlimited lines of text
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
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
    );
  }
}
