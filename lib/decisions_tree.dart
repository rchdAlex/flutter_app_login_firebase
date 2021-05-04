import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DecisionsTree extends StatefulWidget {

  @override
  _DecisionsTreeState createState() => _DecisionsTreeState();
}

class _DecisionsTreeState extends State<DecisionsTree> {
User user;
@override
void initState() { 
  super.initState();
  onRefresh(FirebaseAuth.instance.currentUser);
}
onRefresh(userCred){
  setState(() {
    user = userCred;
  });
  
}
  @override
  Widget build(BuildContext context) {
    if(user == null){
      return LoginPage(onSignIn: (userCred)=>onRefresh(userCred),);
    }
    return HomePage(onSignOut: (userCred) => onRefresh(userCred),);
  }
}