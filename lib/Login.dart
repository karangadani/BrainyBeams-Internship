import 'package:bb_internship/Signup.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var _username;
  var _password;
  @override
  Widget build(BuildContext context) {

    _submit(){

      if(_formKey.currentState!.validate()){
        _formKey.currentState!.save();

        print(_username);
        print(_password);
        if(_username == 'karan@gmail.com' && _password == '12345')
          {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Login Successfull')));
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen()));
          }else{
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login Failed')));
        }
      }else{
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login Failed')));
      }
    }


    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Login Form',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email ID',
                        hintText: 'Enter your Email'),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _username =value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your secure password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _password = value;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    onPressed: _submit,
                    color: Colors.deepOrange,
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Signup()));
              },
              child: Text('Create New Account'),
            ),
          ],
        ),
      ),
    );
  }
}
