import 'package:firebase_database/firebase_database.dart';

class myData {
  String name, phone, email, imageURL;

  myData(
    this.name,
    this.phone,
    this.email,
    this.imageURL,
  );

  myData.fromSnapShot(DataSnapshot snapshot);
}