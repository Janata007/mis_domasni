import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab3/constants.dart';

import 'add_termin.dart';

class HomePage extends StatefulWidget {
  final String title;
  final List<String> elements;
  final List<String> termini;

  HomePage(
      @required this.title, @required this.elements, @required this.termini);
  @override
  _HomePageState createState() => _HomePageState(title, elements, termini);
}

class _HomePageState extends State<HomePage> {
  _HomePageState(this.title, this.elements, this.termini);
  final String title;
  late final List<String> elements;
  late final List<String> termini;
  void initState() {
    super.initState();
  }

  void _reset(){
    setState((){
      elements = predmetiList;
      termini = dateList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            Text("Додади термин"),
            IconButton(onPressed: (){}, icon: Icon(Icons.add))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _reset,
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