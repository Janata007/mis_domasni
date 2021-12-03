import 'package:flutter/material.dart';

import 'add_termin.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Термини на испити',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage('Испити термини', predmetiList,dateList),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final String title;
  final List<String> elements;
  final List<String> termini;
  MyHomePage(
      @required this.title, @required this.elements, @required this.termini);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            Text("Додади термин"),
            IconButton(onPressed: () {}, icon: Icon(Icons.add))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: <Widget>[
                  const terminAdd(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: elements.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      'Предмет',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                              width: 3)),
                                      child: Text(
                                        elements[index],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .primaryColorDark),
                                      )),
                                ]),
                            Text(
                              termini[index],
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ));
                  },
                )
              ],
            )));
  }
}
