import 'package:flutter/material.dart';
import 'database_helper.dart';

class NoteListPage extends StatefulWidget {
  final String searchKeyword;

  const NoteListPage({required this.searchKeyword, Key? key}) : super(key: key);

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {

List<String> notes = [];

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    List<String> fetchedNotes = await databaseHelper.getNotes();

    setState(() {
      notes = fetchedNotes;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
      ),
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Search keyword: ${widget.searchKeyword}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(notes[index], style: const TextStyle(color: Colors.white),),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
