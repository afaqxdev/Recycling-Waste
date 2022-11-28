import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:green/Feature/localdb.dart';
import 'package:green/Screen/Main_Page/front.dart';
import 'package:green/Screen/Sign/sing_in.dart';

import '../Common_Widget/dialog.dart';

FirebaseAuth auth = FirebaseAuth.instance;
var DB = FirebaseFirestore.instance;
localdatabase ldb = localdatabase();

class authcontroler extends GetxController {
  Future<void> signup({name, email, password, images}) async {
    try {
      CommonDialog.showDialog();

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      CommonDialog.hideLoading();
      try {
        CommonDialog.showDialog();
        await DB
            .collection('App_User_credentials')
            .doc(userCredential.user!.uid)
            .set({
          'user_Id': userCredential.user!.uid,
          'firstname': name,
          'password': password,
          'email': email,
          'image': images,
        });
        ldb.setuserData(
            userid: userCredential.user!.uid.toString(), email: email);

        Get.offAll(sign_in());
      } catch (e) {
        print("inside the catch");
        CommonDialog.hideLoading();
        CommonDialog.showErrorDialog(
            description: "Error Saving data at FireStore $e");
      }
    } on FirebaseAuthException catch (value) {
      CommonDialog.hideLoading();
      if (value.code == 'weak-password') {
        CommonDialog.showErrorDialog(
            description: "The password provided is too weak.");
        print('The password provided is too weak.');
      } else if (value.code == 'email-already-in-use') {
        CommonDialog.showErrorDialog(
            description: "The account already exists for that email.");
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(description: "Something went wrong");
    }
  }

  Future<void> SignIn({String? email, password}) async {
    try {
      CommonDialog.showDialog();

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email!.trim(), password: password!);
      ldb.setuserData(
          userid: userCredential.user!.uid.toString(), email: email);

      Get.to(front());
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      if (e.code == 'user-not-found') {
        CommonDialog.showErrorDialog(
            description: "User not found for that email");
      } else if (e.code == 'wrong-password') {
        CommonDialog.showErrorDialog(
            description: "password is worng try again");
      }
    }
  }

  Future<void> passwordRest({String? remail}) async {
    try {
      CommonDialog.showDialog();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: remail!.trim());

      Get.offAll(sign_in());
      CommonDialog.hideLoading();
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(description: "$e");
    }
  }

  Future<void> Update(
      String DataName, dynamic controller, Callback? set) async {
    final firestore = FirebaseAuth.instance.currentUser;
    final user = await FirebaseFirestore.instance
        .collection("App_User_credentials")
        .doc(firestore!.uid)
        .update({DataName: controller});
    Get.back();
  }
}
