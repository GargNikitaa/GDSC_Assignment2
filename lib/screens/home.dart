import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:gdsc_auth/services/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FirebaseAuth.instance.currentUser!.photoURL!=null?
              Image.network(FirebaseAuth.instance.currentUser!.photoURL!) :
              Container(),
            SizedBox(
              height: 20,
            ),
            FirebaseAuth.instance.currentUser!.displayName!=null?
            Text("${FirebaseAuth.instance.currentUser!.displayName}"):Container(),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Logout"),
              onPressed: () async {
                await FirebaseServices().signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}