import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String gender, String dateOfBirth, int contactNo, { bool isProfileComplete=false }) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'contactNo': contactNo,
      'isProfileComplete': isProfileComplete,
    });
  }

  // Method to get user data
  Future<DocumentSnapshot> getUserData() async {
    return await userCollection.doc(uid).get();
  }

}