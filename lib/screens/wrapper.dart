import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_vital/models/appuser.dart';
import 'package:daily_vital/screens/authenticate/authenticate.dart';
import 'package:daily_vital/screens/authenticate/details.dart';
import 'package:daily_vital/screens/mainscreen.dart';
import 'package:daily_vital/screens/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  Stream<bool> _checkProfileStatus(String uid) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((docSnapshot) {
      if (docSnapshot.exists) {
        return docSnapshot['isProfileComplete'] == true;
      } else {
        return false;
      }
    }).handleError((e) {
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return StreamBuilder<bool>(
        stream: _checkProfileStatus(user.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          } else if (snapshot.hasError) {
            // Handle the error
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!) {
            return const Details();
          } else {
            return const MainScreen(index: 0);
          }
        },
      );
    }
  }
}
