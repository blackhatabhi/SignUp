import 'package:flutter/material.dart';
import 'package:signup/HomePage.dart';
import 'HomePage.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String name, email, mobile, collage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: SingleChildScrollView(
              child: Form(
          key: _key,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Image(
                  image: AssetImage("images/logo.png"),
                  width: 100.0,
                  height: 100.0,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Name';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Name'),
                    onSaved: (input) => name = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Email';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (input) => email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Mobile No.';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Enter Mobile No.'),
                    onSaved: (input) => mobile = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter collage name';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Enter Collage Name'),
                    onSaved: (input) => collage = input,
                  ),
                ),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 200.0,
                  child: RaisedButton(
                    onPressed: _sendToNextScreen,
                    color: Colors.redAccent,
                    child: Text(
                      'Save',
                      style: TextStyle( color: Colors.white
                      ),
                     
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  _sendToNextScreen(){
    if(_key.currentState.validate()){
      //saved to global key
      _key.currentState.save();
      //send to next screen
      Navigator.push(context, 
      MaterialPageRoute(
        builder: (context) => HomePage(
          name: name,
          mobile: mobile,
          email: email,
          collage: collage,
        )
      )
      
      );
      
     
    }
    else{
      setState(() {
       _autovalidate = true; 
      });
    }
    
  }
   
}
