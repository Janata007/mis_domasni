import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab3/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _username = "";
  String _password = "";
  bool _passwordVisible = false;
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final pref = getSharedPreferences();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _restoreUsernameAndPassword();
  }

  @override
  Widget build(BuildContext context) {
    final username = TextFormField(
      decoration: const InputDecoration(hintText: "Username"),
      controller: _usernameTextController,
      validator: (val) => val!.isEmpty ? 'enter username' : null,
      onSaved: (val) => _username = val!,
    );
    final password = TextFormField(
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: "Password",
        suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.amber,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            }),
      ),
      controller: _passwordTextController,
      validator: (val) => val!.isEmpty ? 'enter password' : null,
      onSaved: (val) => _password = val!,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
          child: Form(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.account_box_rounded)]),
                  const SizedBox(
                    height: 48.0,
                  ),
                  username,
                  const SizedBox(height: 8.0),
                  password,
                  const SizedBox(height: 24.0),
                  TextButton( onPressed: submit, child: Text("Log in"),),
                  Center(child:Text("Don't have an account?", style: TextStyle(fontSize: 15),),),
                  TextButton(child: Text("Register Here"), onPressed: (){
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  RegisterScreen()));
                  })

                ],
              ))),
    );
  }

  void _restoreUsernameAndPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
      _password = prefs.getString('password') ?? '';
      _usernameTextController.text = _username;
      _passwordTextController.text = _password;
    });
  }

  Future<void> submit() async {
    _username= _usernameTextController.text;
    _password = _passwordTextController.text;
    if(_username=="" || _password== ""){
      _loginErrorDialog();
    }else {
      _checkUsernameAndPassword();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(_username, _password);
      //redirectToHome();
    }
  }

  void redirectToHome(){
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage('Испити термини', predmetiList,dateList)));
  }

  Future<void> _loginErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Error while logging in'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Wrong username of password. Please try again', style: TextStyle(color: Colors.amber),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok', style: TextStyle(color: Colors.amberAccent),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _checkUsernameAndPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    var pass =  prefs.getString('password');

    if(_username.compareTo(username.toString()) != 0){
      _loginErrorDialog();
    }
    else if(_password.compareTo(pass.toString())!= 0){
      _loginErrorDialog();
    } else{
      redirectToHome();
    }
  }
}
