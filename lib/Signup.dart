import 'package:bb_internship/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';


enum Gender { Male , Female }

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  //
  Gender _gender = Gender.Male;

  //

  final _formKey = GlobalKey<FormState>();

  var _username;
  var _password;
  var _email;
  var _contactNum;
  var _dob;

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _submit() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        print(_username);
        print(_password);
        if (_username == 'karan@gmail.com' && _password == '12345') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login Successfull')));
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen()));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login Failed')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login Failed')));
      }
    }

    //date selector
    _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate, // Refer step 1
        firstDate: DateTime(1995),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          _dob = selectedDate.day.toString() +
              ' - ' +
              selectedDate.month.toString() +
              ' - ' +
              selectedDate.year.toString();
        });
    }

    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Signup'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Signup Form',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter your Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid Name!';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _username = value;
                  });
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
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
                    _email = value;
                  });
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contact Number',
                    hintText: 'Enter your Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid Number!';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _username = value;
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
                onSaved: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Re-Enter your password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid password!';
                  } else if (value != _password) {
                    return 'Password does not Match';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(selectedDate.day.toString() +
                      ' - ' +
                      selectedDate.month.toString() +
                      ' - ' +
                      selectedDate.year.toString()),
                  IconButton(
                      onPressed: () => _selectDate(context),
                      icon: Icon(Icons.calendar_today)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('Gender'),
              //     Row(
              //       children: [
              //         RadioListTile(
              //           title: Text('Male'),
              //           value: Gender.Male,
              //           groupValue: _gender,
              //           onChanged: (Gender? value) {
              //             _gender = value!;
              //           },
              //         ),
              //         RadioListTile(
              //             title: Text('Female'),
              //             value: Gender.Female,
              //             groupValue: _gender,
              //             onChanged: (Gender? value) {
              //               setState(() {
              //                 _gender = value!;
              //               });
              //             }),
              //       ],
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: _submit,
                color: Colors.deepOrange,
                child: Text('Login'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
                },
                child: Text('Already Have account ? Login Instead'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
