import 'package:flutter/material.dart';
import 'database_helper.dart';

class NoteListPage extends StatefulWidget {
  final String searchKeyword;

  const NoteListPage({required this.searchKeyword, Key? key}) : super(key: key);

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
//dynamic vs object. Using dynamic for now, but should opt for a safer statically typed
  List<Map<String, dynamic>>? notes = [];

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    List<Map<String, dynamic>>? fetchedNotes = await databaseHelper.getNotes();

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
                itemCount: notes?.length,
                itemBuilder: (context, index) {
                  // Access the notetitle, notecontent, and date from the map
                  String title = notes![index]['notetitle'];
                  String content = notes![index]['notecontent'];
                  String date = notes![index]['date'].toString();
                  String noteID = notes![index]['id'].toString();


                  return ListTile(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.tealAccent, width: 1,),
                    borderRadius: BorderRadius.circular(19),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: const TextStyle(color: Colors.white)),
                        Text(content,
                            style: const TextStyle(color: Colors.white)),
                        Text(date, style: const TextStyle(color: Colors.white)),
                        Text(noteID,
                            style: const TextStyle(color: Colors.redAccent)),
                      ],
                    ),
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
