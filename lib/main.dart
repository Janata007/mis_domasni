import 'package:flutter/material.dart';

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
      home: MyHomePage('Испити термини', [
        'МиС',
        'БнП',
        'ТП',
        'Аипс',
        'Иб',
        'Скит',
        'Днич',
        'Ввмн',
        'В',
        'Мм',
        'Дм',
        'Сп'
      ], [
        DateTime(2021, 1, 22, 13).toString(),
        DateTime(2021, 1, 21, 14).toString(),
        DateTime(2021, 1, 20, 13).toString(),
        DateTime(2021, 1, 22, 18).toString(),
        DateTime(2021, 1, 22, 08).toString(),
        DateTime(2021, 1, 20, 3).toString(),
        DateTime(2021, 1, 21, 16).toString(),
        DateTime(2021, 1, 23, 11).toString(),
        DateTime(2021, 1, 21, 09).toString(),
        DateTime(2021, 1, 20, 3).toString(),
        DateTime(2021, 1, 23, 15).toString(),
        DateTime(2021, 1, 23, 18).toString()
      ]),
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
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "Додади термин:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
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
