import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String?email;
  String? name;
  String? imageUrl;
  bool? isOnline;

  UserModel(
      {this.uid,
      this.email,
      this.name,
      this.imageUrl,
      this.isOnline,
  });

  //receiving data from server
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      uid: doc.data().toString().contains('uid') ? doc.get('uid') : '',
      email: doc.data().toString().contains('email') ? doc.get('email') : '',
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      imageUrl: doc.data().toString().contains('imageUrl') ? doc.get('imageUrl') : '',
      isOnline: doc.data().toString().contains('isOnline') ? doc.get('isOnline') : '',
    );
  }
  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    uid = snapshot['uid'];
    email = snapshot['email'];
    name = snapshot['name'];
    imageUrl = snapshot['imageUrl'];
    isOnline = snapshot['isOnline'];
  }
  //Convert to JSON
  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'imageUrl': imageUrl,
      'isOnline': isOnline,
    };
  }


  Map<String, dynamic> avtToJSON() {
    return {'imageUrl': imageUrl};
  }
}