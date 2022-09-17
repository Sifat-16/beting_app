import 'package:beting_app/models/gamemodel.dart';
import 'package:beting_app/models/profilemodel.dart';
import 'package:beting_app/models/withdrawmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/mainadminmodel.dart';
import '../models/rechargemodel.dart';

class FireBase{
  final auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  Future<UserCredential> signUpWithEmailAndPassword(String mail, String password)async{
    final x = await auth.createUserWithEmailAndPassword(email: mail, password: password).then((value) async{
      await store.collection("profile").doc(value.user?.uid).set(ProfileModel(uid: value.user?.uid, mail: value.user?.email, totalBalance: 0).toJson());
      return value;
    });
    return x;
  }
  Future<UserCredential> signinwithemailandpassword(String mail, String password)async{
    final x = await auth.signInWithEmailAndPassword(email: mail, password: password);
    return x;
  }
  logout()async{
    await auth.signOut();
  }

  Future<bool> rechargeRequest(RechargeModel rechargeModel)async{
    final x = await store.collection("recharge").doc().set(rechargeModel.toJson()).onError((error, stackTrace) => false);
    return true;
  }

  Future<bool> withdrawRequest(WithdrawModel withdrawModel)async{
    final x = await store.collection("withdraw").doc().set(withdrawModel.toJson()).onError((error, stackTrace) => false);
    return true;
  }

  Stream<List<GameModel>> allgames(){
    return store.collection("game").snapshots().map((event) => event.docs.map((e) => GameModel.fromJson(e.data())).toList());
  }

  Stream<ProfileModel> myProfileStream(){
    return store.collection("profile").doc(auth.currentUser!.uid).snapshots().map((event) => ProfileModel.fromJson(event.data()!));
  }

  Future<ProfileModel>myProfile()async{
    ProfileModel profileModel = ProfileModel();
    final x = await store.collection("profile").doc(auth.currentUser!.uid).get().then((value) {
      profileModel = ProfileModel.fromJson(value.data()!);
    });

    return profileModel;

  }
  Stream<MainAdminModel> mainadmindatas(){
    return store.collection("mainadmin").doc("staticdata").snapshots().map((event) => MainAdminModel.fromJson(event.data()!));
  }

  Future<bool>rechargeTobalance(String amount, String transactionId)async{
    final x = await store.collection("recharges").doc().set(RechargeModel(uid: auth.currentUser!.uid, amount: amount, transactionId: transactionId).toJson()).onError((error, stackTrace) => false);
    return true;
  }

}