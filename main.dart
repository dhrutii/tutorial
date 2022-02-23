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







// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'post.dart';
// import 'package:http/http.dart' as http;

// void main() => runApp(const MyApp());
// Future<Post> fetchAlbum() async {
//   final response = await http.get(Uri.parse('http://localhost:4000'));
//   if (response.statusCode == 200) {
//     print("hello");
//     // If the server did return a 200 OK response,
//     // then parse the JSON.

//     return Post.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<Post> futurePost;

//   @override
//   void initState() {
    
//     super.initState();
//     futurePost=fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Post>(
//             future: futurePost,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data.toString());
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

