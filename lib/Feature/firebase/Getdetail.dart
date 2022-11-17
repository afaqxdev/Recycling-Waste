import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class getdatafire {
  void getdata({String? name, String? image}) async {
    final firestore = FirebaseAuth.instance.currentUser;
    final user = await FirebaseFirestore.instance
        .collection("App_User_credentials")
        .doc(firestore!.uid)
        .get();

    name = user.data()!["firstname"];
    image = user.data()!["image"];
  }
}
