import 'package:flutter/material.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage(String s, {Key? key}) : super(key: key);
  final String searchKeyword = 'testing';

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
      ),
      body: Center(
        child: Text('This is a new page!', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
