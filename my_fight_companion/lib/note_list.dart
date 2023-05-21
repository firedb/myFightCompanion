import 'package:flutter/material.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  _NoteListPageState createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
      ),
      body: const Center(
        child: Text('This is a new page!'),
      ),
    );
  }
}
