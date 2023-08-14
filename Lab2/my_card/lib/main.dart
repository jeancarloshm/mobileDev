import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        color: Colors.black,
        home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 246, 169, 106),
            appBar: AppBar(
              backgroundColor: Colors.brown,
              centerTitle: true,
              title: const Text('Tarjeta de Presentación',
                  style: TextStyle(
                    fontFamily: 'Pacifico-Regular',
                    fontSize: 30.0,
                  )),
            ),
            body: const SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/profile-avatar.webp'),
                ),
                Text('Jeancarlos Herrera',
                    style: TextStyle(
                        fontFamily: 'Pacifico-Regular',
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text('Student/Developer',
                    style: TextStyle(
                      fontFamily: 'Pacifico-Regular',
                      fontSize: 18.0,
                    )),
                Divider(color: Colors.black),
                Card(
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 47, 4, 139),
                      ),
                      title: Text('+1 8296789120',
                          style: TextStyle(
                            color: Color.fromARGB(255, 47, 4, 139),
                            fontSize: 20.0,
                          ))),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 47, 4, 139),
                      ),
                      title: Text('1102458@est.intec.edu.do',
                          style: TextStyle(
                            color: Color.fromARGB(255, 47, 4, 139),
                            fontSize: 20.0,
                          ))),
                )
              ],
            ))));
  }
}
