import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class terminAdd extends StatefulWidget {
  const terminAdd({Key? key}) : super(key: key);

  @override
  _terminAddState createState() => _terminAddState();
}

class _terminAddState extends State<terminAdd> {
  @override
  Widget build(BuildContext context) {
    String predmetText="предмет..";
    String terminText="y.m.d.h";
    final predmetController = TextEditingController();
    final terminController = TextEditingController();

    void _setText() {
      setState(() {
        predmetText = predmetController.text;
        terminText = terminController.text;
        predmetiList.add(predmetText);
        dateList.add(terminText);
      });
    }

    return
      FittedBox(
          child: Column(children:[
            Row(
              children:  [
                Text(
                  "Предмет : ",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(hintText: "предмет.."),
                      controller: predmetController,
                    )),
                Text(
                  "Термин: ",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(hintText: "г/м/д/в"),
                      controller: terminController,
                    )),
              ],
            ),
            FittedBox(
                child:
                TextButton(onPressed: _setText, child: Text("Внеси"))
            ),
          ])
      );
  }
}
