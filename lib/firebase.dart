import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

void firebaseInit() {
  WidgetsFlutterBinding.ensureInitialized();

  Firestore.instance
      .collection("jogadores")
      .document("idade")
      .setData({"Jorge Augusto": "28", "Carlos Roberto": "59"});
}
