import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      //darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Layouts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    bool screenSize =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
            ? true
            : false;
    var message = screenSize ? "Axis is vertical" : "Axis is horizontal";
    List<Container> buildList(int count, Color c) => List.generate(
          count,
          (i) => Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              border: Border.all(width: 10, color: c),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: Center(
                child: Text(
              i.toString(),
              style: const TextStyle(fontSize: 30),
            )),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            const Text("Commmon Layout Widgets",
                style: TextStyle(fontSize: 25)),
            const Divider(),
            const Text("Row and Column", style: TextStyle(fontSize: 20)),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "This is a Row",
                      style: TextStyle(backgroundColor: Colors.blueAccent),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      "It has 3 Text widgets as Childeren",
                      style: TextStyle(backgroundColor: Colors.redAccent),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      "Main axis is horizontal,Cross Axis is vertical",
                      style: TextStyle(backgroundColor: Colors.green),
                    ),
                  )
                ]),
            const Divider(),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "This is a Column",
                      style: TextStyle(backgroundColor: Colors.deepOrange),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      "It has 3 Text widgets as Childeren",
                      style: TextStyle(backgroundColor: Colors.deepPurple),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      "Main axis is Vertical,Cross Axis is Horzontal",
                      style: TextStyle(backgroundColor: Colors.teal),
                    ),
                  )
                ]),
            const Divider(),
            Flex(
                direction: screenSize ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "This is a Flex Wdget",
                    style: TextStyle(backgroundColor: Colors.deepOrangeAccent),
                    softWrap: true,
                  ),
                  const Text(
                    "It has 3 Text widgets as Childeren",
                    style: TextStyle(backgroundColor: Colors.greenAccent),
                  ),
                  const Text(
                    "Axis can be assigned or \nchanged according to screenSize",
                    style: TextStyle(
                        backgroundColor: Color.fromARGB(255, 26, 81, 233)),
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                    overflow: TextOverflow.clip,
                  )
                ]),
            const Divider(),
            const Text("Standard Layout Widgets",
                style: TextStyle(fontSize: 20)),
            const Divider(),
            const Text("Container"),
            SizedBox(
              height: 200,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        "./lib/assets/margin-padding-border.png",
                        alignment: Alignment.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 5, color: Colors.red)),
                        child: const Center(
                            child: Text(
                                "Container - Red Border\nOutside Box is Margin - Inside Box is Padding \n Content is inside Padding")),
                      ),
                    ),
                  ]),
            ),
            const Divider(),
            const Text("GridView.count"),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: buildList(5, Colors.blue),
            ),
            const Divider(),
            const Text("Grid View.extent"),
            const Divider(),
            const Text("ListView"),
            Flexible(
              child: ListView(
                padding: const EdgeInsets.all(4),
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(4)),
                    child: const ListTile(
                      leading: Icon(
                        Icons.android_rounded,
                        color: Colors.lightGreen,
                      ),
                      title: Text("Android"),
                      style: ListTileStyle.drawer,
                      tileColor: Color.fromARGB(255, 169, 255, 143),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(4)),
                    child: const ListTile(
                      leading: Icon(
                        Icons.phone_android_rounded,
                        color: Colors.purple,
                      ),
                      title: Text("Android Smartphone"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(4)),
                    child: const ListTile(
                      leading: Icon(
                        Icons.flutter_dash,
                        color: Colors.blue,
                      ),
                      title: Text("Flutter Dash"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(4)),
                    child: const ListTile(
                      leading: Icon(
                        Icons.list_rounded,
                        color: Colors.green,
                      ),
                      title: Text("List"),
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 500,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: const Text("Hello"),
                ),
                Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(131, 0, 0, 0),
                            offset: Offset(10, 10))
                      ]),
                ),
                Container(
                  height: 252,
                  width: 250,
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(131, 0, 0, 0),
                            offset: Offset(10, 10))
                      ]),
                )
              ],
            ),
            const Divider(),
            Card(
                child: Column(
              children: [
                const ListTile(
                    leading: Icon(Icons.access_alarm),
                    title: Text("Alarm 1: 6:00"),
                    subtitle: Text("Subjet here")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Flexible(
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          "SNOOZE",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Flexible(
                      child: TextButton(
                          onPressed: null,
                          child: Text(
                            "TURN OFF",
                            style: TextStyle(color: Colors.blue),
                          )),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    )
                  ],
                )
              ],
            )),
            const Divider(),
            Card(
                child: Column(
              children: [
                const ListTile(
                    leading: Icon(Icons.access_alarm),
                    title: Text("Alarm 2: 6:00"),
                    subtitle: Text("Subjet here")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Flexible(
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          "SNOOZE",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Flexible(
                      child: TextButton(
                          onPressed: null,
                          child: Text(
                            "TURN ON",
                            style: TextStyle(color: Colors.blue),
                          )),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
