import 'package:flutter/material.dart';

class NoteCreationPage extends StatefulWidget {
  const NoteCreationPage( {Key? key}) : super(key: key);
  

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
      body: const Center(
        child: Text('This is a new note!', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
