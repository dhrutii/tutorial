import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main()
{
runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home:DataFromAPI(),
    );
  }
}

class DataFromAPI extends StatefulWidget{
  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI>{

Future getUserData() async{
  
var response = await http.get(Uri.parse('http://localhost:4000'));
var jsonData = jsonDecode(response.body);
List<User> users = [];

for (var u in jsonData){
  User user = User(u["username"],u["email"]);
  users.add (user);
}
print((users.length));
return users;
  }


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
    body: Container(
      child: Card(
      child: FutureBuilder(
      future: getUserData(),
      builder: (context, AsyncSnapshot snapshot){
        if(snapshot.data == null){
          return Container(
            child: Center(
              child: Text('Loading'),
          ),
          );
        }else return ListView.builder(itemCount: snapshot.data.length, itemBuilder:(context, i){
          return ListTile(
            title: Text(snapshot.data[i].username),
            subtitle: Text(snapshot.data[i].email),
          );
        }
        );
      },
    ),
    ),
    ),
    );
  }
}


class User{
  final String username,email;

  User(this.username, this.email);
}
