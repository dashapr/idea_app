import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Список новых идей',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final TextEditingController _textEditingController =
      TextEditingController();

  final Set ideas = {
    "Пить воду в течение дня",
    "Делать разминку каждый день",
    "Есть сладкое только в первой половине дня"
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Новая идея',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ideas.add(_textEditingController.text);

                      _textEditingController.clear();
                    }); // для обновления ui, так как ideas меняется. Также можно использовать ValueNotifier + ValueListenableBuilder
                  },
                  child: const Text('Добавить идею'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                ),
                for (var i in ideas)
                  Padding(
                      padding: const EdgeInsets.symmetric(), child: Text("$i"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
