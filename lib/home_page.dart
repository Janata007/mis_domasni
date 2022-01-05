import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab3/calendar_page.dart';
import 'package:lab3/constants.dart';

import 'add_termin.dart';

class HomePage extends StatefulWidget {
  final String title;
  late final List<String> elements;
  late final List<String> termini;

  HomePage(
      @required this.title, @required this.elements, @required this.termini);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }

  void _reset(){
    setState((){
      widget.elements = predmetiList;
      widget.termini = dateList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Text("Види календар"),
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage(widget.termini)),
              );
            }, icon: Icon(Icons.apps_sharp))
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
                  itemCount: widget.elements.length,
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
                                        widget.elements[index],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .primaryColorDark),
                                      )),
                                ]),
                            Text(
                              widget.termini[index],
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
