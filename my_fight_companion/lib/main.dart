import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:my_fight_companion/note_creation.dart';
import 'note_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Fight Companion',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          scaffoldBackgroundColor: Colors.black),
      home: const MyHomePage(title: 'My Fight Companion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  //}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    hintText: 'Click Here...',
                    labelText: 'Search',
                    labelStyle: TextStyle(
                        color: Colors.cyan, fontWeight: FontWeight.bold),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      //need to research to understand syntax logic
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NoteListPage(searchKeyword: 'all')),
                        );
                      },
                      child: const Text(
                        'All notes',
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    //TODO Press
                    onPressed: (){},
                      child: const Text(
                        'Character M.U.',
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                      //TODO Press
                    onPressed: (){},
                      child: const Text(
                        'Player M.U.',
                      )),
                ),
                const SizedBox(width: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      //TODO Press
                    onPressed: (){},
                      child: const Text(
                        'Drafts',
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                      //TODO Press
                    onPressed: (){},
                      child: const Text(
                        'Combo List',
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                      //TODO Press
                    onPressed: (){},
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Tech Mechanics',
                      )),
                ),
                const SizedBox(width: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      //TODO Press
                    onPressed: (){},
                      child: const Text(
                        'Custom',
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                      //TODO Press
                    onPressed: (){},
                      child: const Text(
                        'Custom',
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                      //TODO Press
                    onPressed: (){},
                      child: const Text(
                        'Custom',
                      )),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NoteCreationPage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
