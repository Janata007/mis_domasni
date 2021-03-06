import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab3/calendar_page.dart';
import 'package:lab3/constants.dart';
import 'package:lab3/login_page.dart';
import 'package:lab3/show_location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_termin.dart';
import 'google_maps.dart';
import 'notification_api.dart';

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

  void _reset() {
    setState(() {
      widget.elements = predmetiList;
      widget.termini = dateList;
    });
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences prefs;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Text("Види календар"),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CalendarPage(widget.termini)),
                  );
                },
                icon: Icon(Icons.apps_sharp))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back_rounded),
            onPressed: () async => {
                  NotificationApi.showNotification(
                      title: 'User',
                      body: 'Logging out',
                      payload: 'notification'),
                  prefs = await SharedPreferences.getInstance(),
                  prefs.remove('email'),
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => LoginScreen())),
                }),
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
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyGoogleMaps()),
                      );
                    },
                    child: Text("Go to location page")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationApp()),
                      );
                    },
                    child: Text("Get your location"))
              ],
            )));
  }

  Future<dynamic> _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: Text(title ?? ''),
            content: Text(body ?? ''),
            actions: [TextButton(child: Text("Ok"), onPressed: () async {})]));
  }
}
