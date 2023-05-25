import 'package:flutter/material.dart';

class NoteListPage extends StatefulWidget {
  final String searchKeyword;

  const NoteListPage({required this.searchKeyword, Key? key}) : super(key: key);

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
        child: Text(
          'Search keyword: ${widget.searchKeyword}',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
